// NOTE: This test is like a sketchpad where we try to compile and run random pieces of code

#include <stdio.h>
#include <functions.h>

//Klessydra lib
#include"dsp_functions.h"
#include"klessydra_defs.h"

int shift = 2;
int a[516];
int b[516];

int out1[4];
int out2[4];

int main()
{
    Klessydra_En_Int(); // enable irqs
    CSR_MVSIZE(4); // reset SPM size

    if(Klessydra_get_coreID() == 0) {
        kmemld((void *)((int *)spmaddrA), &a[0], 4 * sizeof(int));
        kmemld((void *)((int *)spmaddrB), &b[0], 4 * sizeof(int));

        kvmul((void *)((int *)spmaddrA), (void *)((int *)spmaddrA), (void *)((int *)spmaddrB));
        kmemstr((void *)((int *)out1), (void *)((int *)spmaddrA), 4 * sizeof(int));
        
        for(int i = 0; i < 4; i++) {
            printf("%d\n", out1[i]);
        }
    }

    /*
    CSR_MVSIZE(4*4); // reset SPM size
    sync_barrier_reset();
    sync_barrier_thread_registration();
    if(Klessydra_get_coreID() == 0) {
        kmemld((void *)((int *)spmaddrA), &a[0], 4 * sizeof(int));
        kmemld((void *)((int *)spmaddrB), &b[0], 4 * sizeof(int));

//        krelu((void *)((int *)spmaddrA), (void *)((int *)spmaddrA));
//        krelu((void *)((int *)spmaddrB), (void *)((int *)spmaddrB));
        //kaddv((void *)((int *)spmaddrA), (void *)((int *)spmaddrA), (void *)((int *)spmaddrB));
        //krelu((void *)((int *)spmaddrA), (void *)((int *)spmaddrA));
        kvmul((void *)((int *)spmaddrA), (void *)((int *)spmaddrA), (void *)((int *)spmaddrB));

        kmemstr((void *)((int *)out1), (void *)((int *)spmaddrA), 4 * sizeof(int));

        //for(int i = 0; i < 4; i++) {
        //    printf("%d\n", out1[i]);
        //}
    }
    sync_barrier();

    //printf("test");



    //float x = 1.0;
    //float y = 2.0;
    //float z1, z2, z3, z4;
    //asm(
    // "flw  f1, 0(%[p_x]);"
    // "flw  f2, 0(%[p_y]);"
    // "fadd.s f3, f1, f2;"
    // "fsub.s f4, f1, f2;"
    // "fmul.s f5, f1, f2;"
    // "fdiv.s f6, f1, f2;"
    // "fsw  f3, 0(%[p_z1]);"
    // "fsw  f4, 0(%[p_z2]);"
    // "fsw  f5, 0(%[p_z3]);"
    // "fsw  f6, 0(%[p_z4]);"
    // :
    // : [p_x] "r" (&x), [p_y] "r" (&y),
    //   [p_z1] "r" (&z1), [p_z2] "r" (&z2),
    //   [p_z3] "r" (&z3), [p_z4] "r" (&z4)
    //);

    //sync_barrier_thread_registration();
    //if (Klessydra_get_coreID() == 0) {
    //  printf("%d+%d=%d\n", (int)x, (int)y, (int)z1);
    //}
    //sync_barrier();


    //float z;
    //z = x + y;
    //sync_barrier_thread_registration();
    //if (Klessydra_get_coreID() == 0) {
    //  printf("%f+%f=%f\n", x, y, z);
    //}
    //sync_barrier();

    //Klessydra_En_Int(); // enable irqs

    //sync_barrier_thread_registration();
    //if (Klessydra_get_coreID() == 0) {
    //  printf("Hello World!!!!!\n");
    //}
    //sync_barrier();
    */
    return 0;
}
