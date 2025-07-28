// ZOIX MODULE FOR FAULT INJECTION AND STROBING

`timescale 1ns / 1ns


module strobe;

	// Collapse all user accessible registers into a single class, the fault dictionary will differentiate
//	int status_ordered[string]= '{"ND":0,"DD":1};

	//int max_reg_drop = 20;
	//int reg_drop = 0;
	//int reg_drop_next;


	// Inject faults
	initial begin

		$display("ZOIX INJECTION");
		$fs_inject;  //     .. by default
		$fs_delete;

		// From file (maybe in specific evaluations)
		// when removing the line in the .fmsh file, so disabling the fault_list.sff file.
//		$fs_read("bin/fault_list.txt", "add");

		// Adding all faults from design.
		$fs_add(ACCUMULATOR);							
	end 

//	integer cmp; 

//	always @(*) begin
//  		reg_drop_next = reg_drop + 1;
//	end

	/*
	* Whenever the fetch signal transitions to 1'b0, compare the output of the device. If it shows a difference (GM-FM are different), set the status to ON or
	* PN (if there is an X involved).  Continue to simulate the fault.  This indicates the fault is dangerous and can cause the device to fail.
	*/
	// 	fs_verify(signal) seems that can be used to check the condition of a signal in comparison with the expected result. This condition can be possibly used to finish the simulation once detected 
	//  a mismatch

	initial begin
 	
//		#678000

		#2500;
		forever  begin


//
//			if (status_ordered["DD"] > status_ordered[$fs_get_status]) begin
//				cmp = $fs_compare(RCA.co , RCA.s );
//				cmp = $fs_compare(riscv_core.instr_req_o,riscv_core.data_req_o,riscv_core.data_we_o,riscv_core.instr_addr_o,riscv_core.data_addr_o,riscv_core.data_wdata_o,riscv_core.data_be_o);
//				if (1 == cmp) begin
//					$fs_set_status("DD",RCA.co , RCA.s);
//					$fs_drop_status("DD",riscv_core.instr_req_o,riscv_core.data_req_o,riscv_core.data_we_o,riscv_core.instr_addr_o,riscv_core.data_addr_o,riscv_core.data_wdata_o,riscv_core.data_be_o);
//					break;
//				end
//			end

// 		 put the outputs here
		$fs_strobe(ACCUMULATOR.dsp_out_accum_results);

		#5000;
	   
		end

	end

endmodule
