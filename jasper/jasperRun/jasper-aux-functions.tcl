
#########################################################
# Jasper Fault Lists generation functions

# Example of Use:
# Include all cell ports
#set cellPortList [cellPortsGet $topInstance]
# instrument Cell Ports for SA0/SA1 Faults
#check_fsv -fault -add $cellPortList -type sa0+sa1

## Return All Cell Ports excluding UDP
proc cellPortsGet {faultTopInstance} {

    # List only cellport signals
    # Get the list of all cells without Primary Modules (User Define Primitivies)
    set LIST_OF_CELLSDEFINE [get_design_info -instance $faultTopInstance -list celldefine]
    set LIST_OF_UDPS        [get_design_info -instance $faultTopInstance -list prim_mod]
    set LIST_OF_CELLS       {}

    # List all CELLs defined in the design
    foreach CD $LIST_OF_CELLSDEFINE {
        set FOUND 0
        # Check if CELL is a User Define Primitive and skip it
        foreach UDP $LIST_OF_UDPS {
            if {$CD eq $UDP} {
	        set FOUND 1
                break
	    }
        }
        # List of all CELLs without UDP
        if {$FOUND == 0} {
            lappend LIST_OF_CELLS $CD
        }
    }
    # Collect instances of the cells and their ports
    foreach CELL $LIST_OF_CELLS {
        # List with all modules of a cell
        set ALL_CELL_INST [get_design_info -module $CELL -list instance -silent]
   
        foreach CELL_INST $ALL_CELL_INST {
	    # Skip instances related to bad_machine
	    if { [string first "bad_machine" $CELL_INST] >= 0 } {
	        continue
	    }
	    # Skip instances that are not listed under faultTopInstance
	    #if { [string first $faultTopInstance $CELL_INST] == -1 } {
             #   puts "break $faultTopInstance $CELL_INST"
	     #   continue
	    #}
            # List with all ports of a module
	    set ALL_CELL_PINS [get_design_info -instance $CELL_INST -list input output -silent]

     	    foreach CELL_PIN $ALL_CELL_PINS {
                # Generate Cell Ports Signal List
     	        lappend signal_list [concat $CELL_INST.$CELL_PIN]
     	    }
        }
    }

    puts "$faultTopInstance - get cell ports done"
    # Return final Signal List
    return $signal_list
}

## Return all Primary Input/Outputs from faultTopInstance
proc primInOutGet {faultTopInstance} {

    # Get All Primary Input/Outputs
    set topInOutPorts [get_design_info -instance $faultTopInstance -list input output -include_hier_path -silent]

    # Return final Signal List
    return $topInOutPorts
}

######################################################### 
# Formal Analysis Configuration Functions

## Start Structural Analysis for all faults 
proc structAnalysis {} {

    set_fsv_structural_propagation_analysis on
    check_fsv -structural
}

## Start Activatability Analysis for Not Safe Faults 
proc activAnalysis {} {
    
#puts "Activation Analysis is not Activated"    
    # Set list of Not Safe Faults
    #set faultList [check_fsv -fault -list -class {unprocessed dangerous unknown safe}]
    # Create a List of Generate Assertions for Activatability Analysis
    set assertList [check_fsv -generate -activatability on -propagatability off -detectability off]
    # Proof all generated assertions -time_limit 1800s
    check_fsv -prove -task $assertList -keep_traces
}

## Start Propagability Analysis for Not Safe Faults 
proc propagAnalysis {} {

#puts "Propagability Analysis is not Activated"    
    # Set list of Unprocessed and Unknow Faults
    #set faultList [check_fsv -fault -list -class {unprocessed unknown safe}]
    # Create a List of Generate Assertions for Propagatability Analysis
    set assertList [check_fsv -generate -activatability off -propagatability on -detectability on]
    # Proof all generated assertions -time_limit 3600s
    check_fsv -prove -task $assertList -keep_traces
}
