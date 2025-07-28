#!/usr/bin/tclsh

# Additional sources (i.e. the top unit)
set SRC_FOLDER ../ips/T13x/klessydra-t1-3th/
# Define the top-level entity name
set TOP_MODULE klessydra_t1_3th_core

set OUTPUT_FOLDER ../ips/T13x_v/klessydra-t1-3th/

set vhdl_files [list \
	"$SRC_FOLDER/PKG_RiscV_Klessydra.vhd" \
	"$SRC_FOLDER/RTL-Accumulator.vhd" \
	"$SRC_FOLDER/RTL-CSR_Unit.vhd" \
	"$SRC_FOLDER/RTL-Debug_Unit.vhd" \
	"$SRC_FOLDER/RTL-ID_STAGE.vhd" \
	"$SRC_FOLDER/RTL-IE_Stage.vhd" \
	"$SRC_FOLDER/RTL-IF_Stage.vhd" \
	"$SRC_FOLDER/RTL-Load_Store_Unit.vhd" \
	"$SRC_FOLDER/RTL-Registerfile.vhd" \
	"$SRC_FOLDER/RTL-Scrathcpad_Memory_Interface.vhd" \
	"$SRC_FOLDER/RTL-Scratchpad_Memory.vhd" \
	"$SRC_FOLDER/RTL-Processing_Pipeline.vhd" \
	"$SRC_FOLDER/STR-Klessudra_top.vhd"
]

foreach src $vhdl_files {
	if [expr {[string first # $src] eq 0}] {puts $src} else {
		#exec >@stdout 2>@stderr
		read_file -format vhdl $src
	}
}

# elaborate $top

write -f verilog -hierarchy -output $OUTPUT_FOLDER/$TOP_MODULE.v