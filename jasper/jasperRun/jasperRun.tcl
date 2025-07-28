source ../../../../tools/jasper/jasper-aux-functions.tcl

# Set name of TOP Instance of the design to be considered by Jasper
set topInstance "spi_top"
set resetSignal "wb_rst_i"

#########################
# Analyze and Elaborate Design
#########################
# Initiliza FSV
check_fsv -init

# Run Jasper Analyzes for Verilog Files
analyze -sv [dglob "$env(DESIGN_DIR)/hdl/*.v"]

# Example of Include Dir
#analyze -sv +incdir+$env(DESIGN_DIR)/src/ [dglob "$env(DESIGN_DIR)/*.v"]

# Elaborate the design
elaborate

#########################
# Setting Initialization settings
#########################
clock -infer
reset $resetSignal 
#reset [reset -analyze -synchronous -list signal -silent]
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
check_fsv -strobe -add [get_design_info -instance $topInstance -list output  -include_hier_path -silent] -functional
#check_fsv -strobe -add [get_design_info -list signal -filter "*_failure" -silent] -checker
#check_fsv -strobe -remove [check_fsv -strobe -list -node top.can_counter_failure -silent]
set strobe_list [check_fsv -strobe -get node [check_fsv -strobe -list]]

#########################
## Start Structural Analysis for all faults 
#########################
structAnalysis

#########################
## Start Activatability Analysis for Not Safe Faults 
#########################
#activAnalysis

#########################
## Start Propagability Analysis for Not Safe Faults 
#########################
#propagAnalysis
