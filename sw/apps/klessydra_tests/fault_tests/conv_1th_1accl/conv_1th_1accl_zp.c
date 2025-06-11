#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "dsp_functions.h"
#include "functions.h"
#include "klessydra_defs.h"

#define SIZE_OF_INT 4

int matA[A_ORDER][A_ORDER];
int matB[B_ORDER][B_ORDER];
int output_accl[THREAD_POOL_SIZE][A_ORDER][A_ORDER] = {{{0}}};
int output_non_accl[A_ORDER][A_ORDER]={0};

int zero=0;

int perf0ld = 0;
int  *ptr_perf0ld = &perf0ld;

int 			perf_non_accl = 0;
int  *ptr_perf_non_accl = &perf_non_accl;

int final_perf[THREAD_POOL_SIZE+1][9] = {{777}};

int perf_prescaling[THREAD_POOL_SIZE]; 
int *ptr_perf_prescaling;

inline void mcylce_start();
inline void mcycle_stop(int cycle_cnt, int* ptr_cycle_cnt);


int main(){
	Klessydra_En_Int();
	int hartID = Klessydra_get_coreID();

	sync_barrier_thread_registration();

	//------------------------------------------------------------------------------------------------------------
	//---------------------------------------- Create the Matrices -----------------------------------------------
	//------------------------------------------------------------------------------------------------------------	

	// Create the FM
	if (hartID == 0) {
		for(int i=0;i<A_ORDER; i++)
		{
			for(int j=0; j<A_ORDER; j++)
			{
				matA[i][j] = 1<<8;  // 256, 256, 256, 256, ... 
			}
		}
		// Create the Kernel
		for(int i=0; i<B_ORDER; i++)
		{
			for(int j=0; j<B_ORDER; j++)
			{
				matB[i][j] = ((i*B_ORDER)+j)<<8; // 0, 256, 512, 768, 1024, ...
			}
		}
		// Write 777 in the output Matrix elementswhich is an indication that no writes were perfomed here 
		for(int i=0; i<A_ORDER; i++)
		{
			for(int j=0; j<A_ORDER; j++)
			{
				output_accl[hartID][i][j] = 777;
			}
		}


		//------------------------------------------------------------------------------------------------------------
		//------------------------------------------- Clear the SPMs -------------------------------------------------
		//------------------------------------------------------------------------------------------------------------	

		CSR_MVSIZE(Z_ORDER*Z_ORDER*SIZE_OF_INT); // size of zeropadded matrix
		// broadcast zeros for zero padding
		kbcast((void*)spmaddrA,(void*)zero);
		kbcast((void*)spmaddrB,(void*)zero);
		kbcast((void*)spmaddrC,(void*)zero);
		kbcast((void*)spmaddrD,(void*)zero);

		//----------------------------------------------------------------------------------------------
		//----------------------------------------- LOADING --------------------------------------------
		//----------------------------------------------------------------------------------------------

		CSR_MVSIZE(Z_ORDER*Z_ORDER*SIZE_OF_INT); // size of zeropadded matrix
		// One thread is responsible for broadcasting all the data on the different SPM's
		int z_offset = Z_OFFSET; // NOTE: preprocessor isn't working well hence I put Z_OFFSET in a variable before i do arithmetic operations on the macro
		//mcylce_start();

		// load  every line in the Input Matrix seperated by the zeropadded offset stride between every line and the next
		for (int i=0; i<A_ORDER; i++){
			kbcastld(
				(void*)((int*)spmaddrA + ((Z_ORDER*z_offset)+z_offset +i*Z_ORDER)),
				(void*)((int*)matA     + (i*A_ORDER)),
				SIZE_OF_INT*(A_ORDER)	
			);
		}

		// Load the kernel in SPM_B
		kbcastld((void*)((int*)spmaddrB), (void*)matB, B_ORDER*B_ORDER*SIZE_OF_INT);

		// DISABLE COUNTING AND SAVE MCYCLE
		//mcycle_stop(perf0ld, ptr_perf0ld);
	}

	//----------------------------------------------------------------------------------------------------
	//--------------------------------------- CONVOLUTIONS ACCL ------------------------------------------
	//----------------------------------------------------------------------------------------------------

	sync_barrier();
	sync_barrier_thread_registration();

	//int *ptr_perf;

	//// ENABLE COUNTING
	//Klessydra_perf_cnt_start();

	// Do the convolution
	if (hartID == 0) {
		conv2D_accl_fp(A_ORDER,
								B_ORDER,
								5,
								(void*)((int*)spmaddrA), 
								(void*)((int*)spmaddrB),
								(void*)((int*)spmaddrC)
								);
	// Store the convolution result back in data_mem
		for (int i=0; i<A_ORDER; i++) 
		{
			kmemstr((void*)((int*)&output_accl[hartID][0][0]+ i*A_ORDER ),
						  (void*)((int*)(spmaddrC)) + SIZE_OF_INT*A_ORDER*i
							,A_ORDER*SIZE_OF_INT);
		}
	}

	// DISABLE COUNTING AND SAVE THE PERFORMANCE COUNTERS
	//ptr_perf = Klessydra_perf_cnt_finish();
	//for (int j=0; j<9; j++)
	//{
	//	final_perf[hartID][j]=ptr_perf[j];
	//}


	//----------------------------------------------------------------------------------------------------
	//--------------------------------------- CONVOLUTIONS NON ACCL --------------------------------------
	//----------------------------------------------------------------------------------------------------


	// ENABLE COUNTING
//	Klessydra_perf_cnt_start();

	if (hartID == 1)
	{
		conv2D_fp(A_ORDER, B_ORDER, 5, matA, matB, output_non_accl);
	}

	// DISABLE COUNTING AND SAVE THE PERFORMANCE COUNTERS
	//ptr_perf_non_accl = Klessydra_perf_cnt_finish();
	//for (int j=0; j<9; j++)
	//{
	//	final_perf[THREAD_POOL_SIZE][j]=ptr_perf_non_accl[j];
	//}


	//----------------------------------------------------------------------------------------------------
	//--------------------------------------CHECK RESULTS-------------------------------------------------
	//----------------------------------------------------------------------------------------------------
	sync_barrier();
	sync_barrier_thread_registration();

	if (hartID == 0)
	{
		//printf("--------Test: CONVOLUTION TEST ZEROPADDED [%dx%d]--------\n", A_ORDER,A_ORDER);			
		//printf("FM_ORDER= %d \t KM_ORDER= %d\n",A_ORDER, B_ORDER);
		//		
		//printf("\nSpeed of Kbcastld() done by thread 0:\t%d Cycles\n", *(ptr_perf0ld));
		//printf("\nAccelerated Convolution:\n");
		//for (int i=0; i<THREAD_POOL_SIZE; i++) {
		//	printf("Performance count, thread %d\n", i);
		//	printf(" Cycle Count = %d \n Instruction Count = %d \n Instruction wait = %d \n Load Count = %d \n Store Count = %d \n Unconditional Jump Count = %d \n Branch Count = %d \n Taken Count = %d \n Branch Hit Count = %d \n Branch Hit Rate = %d%% \n \n", 
		//					final_perf[i][0], final_perf[i][1], final_perf[i][2], final_perf[i][3], final_perf[i][4], final_perf[i][5], final_perf[i][6], final_perf[i][7], final_perf[i][8], (final_perf[i][8]*100)/final_perf[i][6]);
		//}
		//printf("\nNon-Accelerated Convolution:\n");
		//printf(" Cycle Count = %d \n Instruction Count = %d \n Instruction wait = %d \n Load Count = %d \n Store Count = %d \n Unconditional Jump Count = %d \n Branch Count = %d \n Taken Count = %d \n Branch Hit Count = %d \n Branch Hit Rate = %d%%  \n \n", 
		//					final_perf[THREAD_POOL_SIZE][0], final_perf[THREAD_POOL_SIZE][1], final_perf[THREAD_POOL_SIZE][2], final_perf[THREAD_POOL_SIZE][3], final_perf[THREAD_POOL_SIZE][4], final_perf[THREAD_POOL_SIZE][5], final_perf[THREAD_POOL_SIZE][6], final_perf[THREAD_POOL_SIZE][7], final_perf[THREAD_POOL_SIZE][8], (final_perf[THREAD_POOL_SIZE][8]*100)/final_perf[THREAD_POOL_SIZE][6]);

		//matrix_check((int*)output_non_accl,(int*)output_accl, A_ORDER);
	}
	sync_barrier();

    return 0;
}