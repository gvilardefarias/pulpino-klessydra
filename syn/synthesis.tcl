#!/usr/bin/tclsh

# To use this script open design_vision from command line as design_vision& "for GUI" or dc_shell "for command line"
# in the folder of the script and only: source xxxx.tcl

set ROOT "../.."

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

elaborate $TOP_DESIGN -library DEFAULT -parameters $DESIGN_PARAM -update
#elaborate $TOP_DESIGN -architecture $ARCH -library DEFAULT -parameters $DESIGN_PARAM -update

link

check_design


#Target clock frequency 500MHz. for 45nm tech lib (timeunit in ns)
create_clock -name clk_i -period 2 clk_i

# Target clock frequency 500MHz. for 15nm tech lib (timeunit in ps)
#create_clock -name clk_i -period 2000 clk_i


# ###########COMPILE
# ungroup -all -flatten

# compile

#compile -map_effort high
#compile_ultra -inc -retime

if {$TOP_DESIGN eq "DSP_Unit"} {
	current_design SHIFTER*
	compile_ultra -retime
	set_dont_touch SHIFTER*
	current_design ACCUMULATOR*
	compile_ultra -retime
	set_dont_touch ACCUMULATOR*
	current_design COMPARATOR*
	compile_ultra -retime
	set_dont_touch COMPARATOR*
	current_design ADDER*
	compile_ultra -retime
	set_dont_touch ADDER*

	if $RESTRICT_CELLS {
		set_dont_use [get_lib_cells */*]
		foreach cell $allowed_cells {
		    if {[sizeof_collection [get_lib_cells */$cell]] > 0} {
		        remove_attribute [get_lib_cells */$cell] dont_use
		    } else {
		        echo "Cell $cell not found in the library."
		    }
		}
	}

	current_design MULTIPLIER*
	compile_ultra -retime
	set_dont_touch MULTIPLIER*

	if $RESTRICT_CELLS {
		remove_attribute [get_lib_cells */*] dont_use
	}

	current_design EXCP*
	compile_ultra -retime
	set_dont_touch EXCP*
	current_design DSP*
	compile_ultra -retime
} else {
	compile_ultra -retime
}

report_timing -transition_time -nets -attributes -nosplit > Report_time_transition_15.txt
report_timing -delay max -nosplit > Report_time_delay_max_15.txt
report_timing -path full -nosplit > Report_time_path_full_15.txt

report_area -nosplit -hierarchy > Report_Area_15.txt
report_power -nosplit -hierarchy > Report_Power_15.txt
report_reference -nosplit -hierarchy > Report_References_15.txt
report_resources -nosplit -hierarchy > Report_Resources_15.txt
report_cell > Report_Cells_15.txt

change_names -rules verilog -hierarchy

#write -f verilog -output $TOP_DESIGN.v
write_file -format ddc -hierarchy -output top_synthesized.ddc
write_file -format verilog -hierarchy -output $TOP_DESIGN.v

exit