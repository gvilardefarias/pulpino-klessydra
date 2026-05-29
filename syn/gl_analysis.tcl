#!/usr/bin/tclsh

# To use this script open design_vision from command line as design_vision& "for GUI" or dc_shell "for command line"
# in the folder of the script and only: source xxxx.tcl

set ROOT "../.."
#set GL $ROOT/GL/DSP_1a_8s_130nm.v
#set GL $ROOT/GL/DSP_1a_2s_130nm.v
#set GL $ROOT/GL/DfT/FULL/DSP_1a_2s_130nm.vg
#set GL $ROOT/GL/DfT/FULL/DSP_1a_8s_130nm.vg
#set GL $ROOT/GL/DfT/CTRL/DSP_1a_2s_130nm.vg
set GL $ROOT/GL/DfT/CTRL/DSP_1a_8s_130nm.vg

source $ROOT/syn/defines.tcl

set NCORES __NCORES__

# Enable VHDL-2008 parsing
set hdlin_vhdl_2008 true


# loading the libraries:
set synthetic_library $SYNTHESIS_PATH
set target_library $SYNTHESIS_PATH
set link_library [list $target_library $synthetic_library]

read_verilog -netlist $GL

#set_dont_touch DSP
current_design DSP

link

#check_design

#create_clock -name clk_i -period 10 clk_i
##create_clock -name ijtag_tck -period 100 ijtag_tck
#
#compile_ultra -only_design_rule


report_timing -transition_time -nets -attributes -nosplit > Report_time_transition_15.txt
report_timing -delay max -nosplit > Report_time_delay_max_15.txt
report_timing -path full -nosplit > Report_time_path_full_15.txt

report_area -nosplit -hierarchy > Report_Area_15.txt
report_power -nosplit -hierarchy > Report_Power_15.txt
report_reference -nosplit -hierarchy > Report_References_15.txt
report_resources -nosplit -hierarchy > Report_Resources_15.txt
report_cell > Report_Cells_15.txt

change_names -rules verilog -hierarchy

write -f verilog -output $TOP_DESIGN.v
write_file -format ddc -hierarchy -output top_synthesized.ddc
write_file -format verilog -hierarchy -output $TOP_DESIGN.v

exit