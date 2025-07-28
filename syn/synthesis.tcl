#!/usr/bin/tclsh

# To use this script open design_vision from command line as design_vision& "for GUI" or dc_shell "for command line"
# in the folder of the script and only: source xxxx.tcl

set ROOT "../.."
#set SYNTHESIS_PATH "$ROOT/synthesis/PDK/15nm/CCS/NanGate_15nm_OCL_typical_conditional_ccs.db"
set SYNTHESIS_PATH "~/syn_libraries/15nm/CCS/NanGate_15nm_OCL_typical_conditional_ccs.db"

source $ROOT/syn/defines.tcl

set NCORES __NCORES__

# Enable VHDL-2008 parsing
set hdlin_vhdl_2008 true


# loading the libraries:
set synthetic_library $SYNTHESIS_PATH
set target_library $SYNTHESIS_PATH

set link_library [list $target_library $synthetic_library]

foreach src $pkg_src {
	if [expr {[string first # $src] eq 0}] {puts $src} else {
		#exec >@stdout 2>@stderr
		read_file $src
	}
}

foreach src $modules_src {
	if [expr {[string first # $src] eq 0}] {puts $src} else {
		#exec >@stdout 2>@stderr
		read_file $src
	}
}


# Create black box for dp_reg to be replaced with behavioral
#set_dont_touch dp_regfile

# elaborate STREAMING_MULTIPROCESSOR -architecture ARCH -library DEFAULT -parameters "STREAMING_MULTIPROCESSOR_ID = 00000000, GMEM_ADDR_SIZE = 18, CMEM_ADDR_SIZE = 13, SYSMEM_ADDR_SIZE = 18" -update


elaborate $TOP_DESIGN -library DEFAULT -parameters $DESIGN_PARAM -update
#elaborate $TOP_DESIGN -architecture $ARCH -library DEFAULT -parameters $DESIGN_PARAM -update

link

check_design


#Target clock frequency 500MHz. for 45nm tech lib (timeunit in ns)
#create_clock -name clk -period 2 clk 

# Target clock frequency 500MHz. for 15nm tech lib (timeunit in ps)
create_clock -name clk_i -period 2000 clk_i


		# ###########COMPILE
# ungroup -all -flatten

		# compile
	
		#compile -map_effort high
		#compile_ultra -inc -retime
compile_ultra -retime

write -f verilog -hierarchy -output $TOP_DESIGN.v

report_timing -transition_time -nets -attributes -nosplit > Report_time_transition_15.txt
report_timing -delay max -nosplit > Report_time_delay_max_15.txt
report_timing -path full -nosplit > Report_time_path_full_15.txt

report_area -nosplit -hierarchy > Report_Area_15.txt
report_power -nosplit -hierarchy > Report_Power_15.txt
report_reference -nosplit -hierarchy > Report_References_15.txt
report_resources -nosplit -hierarchy > Report_Resources_15.txt
report_cell > Report_Cells_15.txt

exit
		#quit
