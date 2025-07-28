set resetSignal "rst_ni"
set topInstance "DSP_Unit"

check_fsv -init

analyze -vhdl08 {/home/g.vilarde/Klessydra/pulpino-klessydra/ips/T13x/klessydra-t1-3th/PKG_RiscV_Klessydra.vhd} ; analyze -vhdl08 {/home/g.vilarde/Klessydra/pulpino-klessydra/ips/T13x/klessydra-t1-3th/RTL-Accumulator.vhd} ; analyze -vhdl08 {/home/g.vilarde/Klessydra/pulpino-klessydra/ips/T13x/klessydra-t1-3th/RTL-DSP_Unit.vhd} ;
elaborate -bbox_mul 1024 -parameter THREAD_POOL_SIZE 3 -parameter accl_en 1 -parameter replicate_accl_en 0 -parameter multithreaded_accl_en 0 -parameter SPM_NUM 3 -parameter Addr_Width 14 -parameter SIMD 2 -parameter ACCL_NUM 3 -parameter FU_NUM 2 -parameter TPS_CEIL 2 -parameter TPS_BUF_CEIL 1 -parameter SPM_ADDR_WID 3 -parameter SIMD_BITS 1 -parameter SIMD_Width 64 -parameter Data_Width 32 -vhdl -top $topInstance

clock -infer
reset $resetSignal 


set mul_sigs [get_design_info -signal *mul* -list signal]

set filt_mul_sigs {}

foreach sig $mul_sigs {
    if {![string match "DSP_Unit_bad*" $sig]} {
        lappend filt_mul_sigs $sig
    }
}

get_design_info -signal $filt_mul_sigs
