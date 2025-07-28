source jasper_aux_functions.tcl

# Set name of TOP Instance of the design to be considered by Jasper
set topInstance "adder_FP"

# set resetSignal "wb_rst_i"

#########################
# Analyze and Elaborate Design
#########################
# Initiliza FSV
check_fsv -init

# Run Jasper Analyzes for Verilog Files
#analyze -sv [dglob "$env(DESIGN_DIR)/hdl/*.v"]


analyze -verilog -v "../../syn_libraries/15nm/verilog/NanGate_15nm_OCL_functional.v" [dglob "../HW_sources/Basic_blocks/ADD_GL/FP_add_15_polito_cadence.v"]

# Example of Include Dir
#analyze -sv +incdir+$env(DESIGN_DIR)/src/ [dglob "$env(DESIGN_DIR)/*.v"]

# Elaborate the design
elaborate

#########################
# Setting Initialization settings
#########################

# clock -infer
clock -none



#reset $resetSignal 
#reset [reset -analyze -synchronous -list signal -silent]

reset -none

#sanity_check -analyze all

#########################
# Specify custom fault target list (all flops with SEU fault, all signals with other faults)
#########################
check_fsv -fault -add [get_design_info -list signal] -type SA0+SA1 
#check_fsv -fault -add [get_design_info -list flop]   -type SEU -time_window 0:$
#check_fsv -fault -add [get_design_info -list signal] -type SET -time_window 0:$ -set_hold_time 500ns
#check_fsv -fault -remove [check_fsv -fault -list -node {.+_failure} -regexp ]

#########################
# Specify the custom strobe list using the DESIGN_TOP env variable
#########################

check_fsv -strobe -add {resultado} -functional

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

check_fsv -report -type {sa0 sa1} -text ADD/struct_total_all.txt

check_fsv -report -class safe         -text ADD/struct_safe_ones.txt
check_fsv -report -class unprocessed  -text ADD/struct_unprocessed_ones.txt
check_fsv -report -class dangerous    -text ADD/struct_dangerous_ones.txt

## Unknown means that these are the ones to analyse during fault campaigns.

check_fsv -report -class unknown      -text ADD/struct_unknown_ones.txt



#########################
## Start Activatability Analysis for Not Safe Faults 
#########################

check_fsv -fault -add [get_design_info -list signal] -type SA0+SA1 
set strobe_list [check_fsv -strobe -get node [check_fsv -strobe -list]]

activAnalysis

check_fsv -report -type {sa0 sa1} -text ADD/active_analysis_total_all.txt

check_fsv -report -class safe         -text ADD/active_analysis_safe_ones.txt
check_fsv -report -class unprocessed  -text ADD/active_analysis_unprocessed_ones.txt
check_fsv -report -class dangerous    -text ADD/active_analysis_dangerous_ones.txt

## Unknown means that these are the ones to analyse during fault campaigns.

check_fsv -report -class unknown      -text ADD/active_analysis_unknown_ones.txt


#########################
## Start Propagability Analysis for Not Safe Faults 
#########################
check_fsv -fault -add [get_design_info -list signal] -type SA0+SA1 
set strobe_list [check_fsv -strobe -get node [check_fsv -strobe -list]]


propagAnalysis


check_fsv -report -type {sa0 sa1} -text ADD/propagation_analysis_total_all.txt

check_fsv -report -class safe         -text ADD/propagation_analysis_safe_ones.txt
check_fsv -report -class unprocessed  -text ADD/propagation_analysis_unprocessed_ones.txt
check_fsv -report -class dangerous    -text ADD/propagation_analysis_dangerous_ones.txt
	
## Unknown means that these are the ones to analyse during fault campaigns.
	
check_fsv -report -class unknown      -text ADD/propagation_analysis_unknown_ones.txt
	
	
	
	
# 5. Analyze Coverage
#report -summary         ;# Generate a summary of coverage
#get_property_list
#report -all 
	
	
#     [-propagatability (unprocessed | propagated | unropagatable | unknown)+]
#     [-detectability (unprocessed | detected | undetectable | unknown)+]
	