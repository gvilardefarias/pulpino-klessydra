#!/bin/bash
#

./clean.csh



rm -rf zoix.sim sim.zdb faults.fdef simout-N0* zoix.log zoix.progress* zoix_rt.log *.log* *.cdf

zoix -f ./bin/load_design.f ./bin/strobes.sv +timescale+override+1ns/1ns +top+ACCUMULATOR+strobe +sv +notimingchecks +define+ZOIX +suppress+cell +delay_mode_fault -l log/zoix_accumile.log


#fmsh -load bin/stuckat_v3.fmsh


#fmsh -blast sim


./zoix.sim +vcd+file+"vcd/accum.vcd" +vcd+dut+ACCUMULATOR+tb.top_i.core_region_i.CORE.RISCV_CORE.Pipe.ACCL_generate.DSP.ACCUMULATOR +vcd+verify +vcd+verbose -l logic_sim.log


fmsh -load bin/permanent_faults_gen.fmsh
