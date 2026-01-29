set tech 15nm
#set tech 45nm

#set test_name max_out
#set test_name max_inter
#set test_name max_in
set test_name chess
#set test_name nick1
set VCD_FILE "../vcd/crafted_vec/$tech/$test_name.vcd"

set test_type crafted
set TIME_FILE "../vcd/crafted_vec/$tech/$test_type.txt"

set power_enable_analysis true


set starts {}
set ends {}

set fp [open $TIME_FILE r]
while {[gets $fp line] >= 0} {
    if {[regexp {start ([0-9]+)} $line match t_start]} {
        lappend starts [expr {$t_start / 1000}]
    }
    if {[regexp {end ([0-9]+)} $line match t_end]} {
        lappend ends [expr {$t_end / 1000}]
    }
}
close $fp

echo $starts

for {set i 0} {$i < [llength $starts]} {incr i} {
    set t_start [lindex $starts $i]
    set t_end   [lindex $ends $i]
    
    set out_fsdb pt.vcd
    set out_rpt "${test_name}_win${i}.rpt"

    write_activity_waveforms \
        -vcd $VCD_FILE \
        -output $out_fsdb \
        -interval 10 \
        -hierarchical_levels 9 \
        -time [list $t_start $t_end] \
        -exclude_cells tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/ACCL_generate/DSP_Unit/EXCP_STG
    
    report_activity_waveforms > $out_rpt
}


#write_activity_waveforms -vcd $VCD_FILE -output pt.vcd -interval 10 -hierarchical_levels 9 -exclude_cells tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/ACCL_generate/DSP_Unit/EXCP_STG
#
#report_activity_waveforms > toggle_rate.rpt

exit