source jasper_aux_functions.tcl

# Set name of TOP Instance of the design to be considered by Jasper
set topInstance "DSP"

# set resetSignal "wb_rst_i"

#########################
# Analyze and Elaborate Design
#########################
# Initiliza FSV
check_fsv -init

# Run Jasper Analyzes for Verilog Files
#analyze -sv [dglob "$env(DESIGN_DIR)/hdl/*.v"]



analyze -verilog -v "/home/g.vilarde/syn_libraries/15nm/verilog/NanGate_15nm_OCL_functional.v" [dglob "../../GL/DSP_1a_2s.v"]

# Example of Include Dir
#analyze -sv +incdir+$env(DESIGN_DIR)/src/ [dglob "$env(DESIGN_DIR)/*.v"]

# Elaborate the design
elaborate

#########################
# Setting Initialization settings
#########################

clock -infer
#clock -none

set LIST_OF_CELLSDEFINE [get_design_info -list celldefine]
set LIST_OF_UDPS        [get_design_info -list prim_mod]
set LIST_OF_CELLS       {}

foreach CD $LIST_OF_CELLSDEFINE {
    set FOUND 0

    foreach UDP $LIST_OF_UDPS {
	if {$CD eq $UDP} {
	    set FOUND 1
	    break
	}
    }

    if {$FOUND == 0} {
	lappend LIST_OF_CELLS $CD
    }
}

### Collect instances of the cells and their ports
set LIST_OF_PORTS {}

foreach CELL $LIST_OF_CELLS {

    set ALL_CELL_INST [get_design_info -module $CELL -list instance -silent]
    
    foreach CELL_INST $ALL_CELL_INST {
	### Skip instances related to bad_machine
	if { [string first "$topInstance\_bad_machine" $CELL_INST] >= 0 } {
	    continue
	}

	set ALL_CELL_PINS [get_design_info -instance $CELL_INST -list input output -silent]

     	foreach CELL_PIN $ALL_CELL_PINS {
     	    lappend LIST_OF_PORTS [concat $CELL_INST.$CELL_PIN]
     	}
    }
}

### instrument faults SA0/SA1
check_fsv -fault -add $LIST_OF_PORTS -type sa0+sa1



#reset $resetSignal 
#reset [reset -analyze -synchronous -list signal -silent]

#reset -none

#sanity_check -analyze all

#########################
# Specify custom fault target list (all flops with SEU fault, all signals with other faults)
#########################
#check_fsv -fault -add [get_design_info -list signal] -type SA0+SA1 
#check_fsv -fault -add [get_design_info -list flop]   -type SEU -time_window 0:$
#check_fsv -fault -add [get_design_info -list signal] -type SET -time_window 0:$ -set_hold_time 500ns
#check_fsv -fault -remove [check_fsv -fault -list -node {.+_failure} -regexp ]

#########################
# Specify the custom strobe list using the DESIGN_TOP env variable
#########################

#check_fsv -strobe -add {dsp_except_data dsp_taken_branch dsp_except_condition busy_dsp state_DSP dsp_we_word dsp_sc_read_addr dsp_to_sc dsp_sc_data_write_wire dsp_sc_write_addr dsp_sci_we dsp_sci_req} -functional
#########################
# Specify the custom strobe list as all outputs from topInstance variable
#########################
check_fsv -strobe -add [get_design_info -instance $topInstance -list output  -include_hier_path -silent] -functional


set strobe_list [check_fsv -strobe -get node [check_fsv -strobe -list]]


#check_fsv -strobe -add [get_design_info -instance mac_unit_core -list output  -include_hier_path -silent] -functional
#check_fsv -strobe -add [get_design_info -list signal -filter "*_failure" -silent] -checker
#check_fsv -strobe -remove [check_fsv -strobe -list -node top.can_counter_failure -silent]
#set strobe_list [check_fsv -strobe -get node [check_fsv -strobe -list]]

#########################
## Start Structural Analysis for all faults 
#########################
structAnalysis

## Collect reports:...

check_fsv -report -type {sa0 sa1} -text DSP/struct_total_all.txt

check_fsv -report -class safe         -text DSP/struct_safe_ones.txt
check_fsv -report -class unprocessed  -text DSP/struct_unprocessed_ones.txt
check_fsv -report -class dangerous    -text DSP/struct_dangerous_ones.txt

## Unknown means that these are the ones to analyse during fault campaigns.

check_fsv -report -class unknown      -text DSP/struct_unknown_ones.txt



#########################
## Start Activatability Analysis for Not Safe Faults 
#########################

check_fsv -fault -add [get_design_info -list signal] -type SA0+SA1 
set strobe_list [check_fsv -strobe -get node [check_fsv -strobe -list]]

activAnalysis

check_fsv -report -type {sa0 sa1} -text DSP/active_analysis_total_all.txt

check_fsv -report -class safe         -text DSP/active_analysis_safe_ones.txt
check_fsv -report -class unprocessed  -text DSP/active_analysis_unprocessed_ones.txt
check_fsv -report -class dangerous    -text DSP/active_analysis_dangerous_ones.txt

## Unknown means that these are the ones to analyse during fault campaigns.

check_fsv -report -class unknown      -text DSP/active_analysis_unknown_ones.txt


#########################
## Start Propagability Analysis for Not Safe Faults 
#########################
check_fsv -fault -add [get_design_info -list signal] -type SA0+SA1 
set strobe_list [check_fsv -strobe -get node [check_fsv -strobe -list]]


propagAnalysis


check_fsv -report -type {sa0 sa1} -text DSP/propagation_analysis_total_all.txt

check_fsv -report -class safe         -text DSP/propagation_analysis_safe_ones.txt
check_fsv -report -class unprocessed  -text DSP/propagation_analysis_unprocessed_ones.txt
check_fsv -report -class dangerous    -text DSP/propagation_analysis_dangerous_ones.txt
	
## Unknown means that these are the ones to analyse during fault campaigns.
	
check_fsv -report -class unknown      -text DSP/propagation_analysis_unknown_ones.txt
	
	
	
	
# 5. Analyze Coverage
#report -summary         ;# Generate a summary of coverage
#get_property_list
#report -all 
	
	
#     [-propagatability (unprocessed | propagated | unropagatable | unknown)+]
#     [-detectability (unprocessed | detected | undetectable | unknown)+]
	
