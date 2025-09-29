
# Set name of TOP Instance of the design to be considered by Jasper
set topInstance "DSP"

#########################
# Analyze and Elaborate Design
#########################
# Run Jasper Analyzes on synthesis library file and on design netlist file
analyze -verilog -v "/home/g.vilarde/syn_libraries/15nm/verilog/NanGate_15nm_OCL_functional.v" [dglob "../../GL/DSP_1a_2s.v"]

# Example with include dir
#analyze -sv +incdir+$env(DESIGN_DIR)/../../../library/ [dglob "$env(DESIGN_DIR)/netlist/*.v"]

# Elaborate the design
elaborate 

###-----------------------------------------------------------------------------
### Faults : all CELL_PORTs
###-----------------------------------------------------------------------------
### Get the list of all cells without UDPs
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


#########################
# Specify the custom strobe list as all outputs from topInstance variable
#########################
check_fsv -strobe -add [get_design_info -instance $topInstance -list output  -include_hier_path -silent] -functional


#########################
## Start Structural Analysis for all faults 
#########################
structAnalysis

#########################
## Start Activatability Analysis for Not Safe Faults 
#########################
activAnalysis

#########################
## Start Propagability Analysis for Not Safe Faults 
#########################
propagAnalysis
