set MODULES_ROOT "$ROOT/ips/FU_breakdown/DSP"
set PACKAGES_ROOT "$ROOT/ips/T13x/klessydra-t1-3th"

set pkg_src [list \
	"$MODULES_ROOT/PKG_RiscV_Klessydra_syn.vhd"
]

set modules_src [list \
	"$MODULES_ROOT/RTL-Multiplier_syn.vhd" \
	"$MODULES_ROOT/RTL-Adder_syn.vhd" \
	"$MODULES_ROOT/RTL-Comparator_syn.vhd" \
	"$MODULES_ROOT/RTL-Accumulator_syn.vhd" \
	"$MODULES_ROOT/RTL-Shifter_syn.vhd" 
]

#set TOP_DESIGN "SHIFTER"
set TOP_DESIGN "ACCUMULATOR"
#set TOP_DESIGN "COMPARATOR"
#set TOP_DESIGN "ADDER"
#set TOP_DESIGN "MULTIPLIER"

#set ARCH "ADD_STG"
#set ARCH "MULT_STG"
set DESIGN_PARAM "multithreaded_accl_en = 0, SIMD = 2, ACCL_NUM = 1, FU_NUM = 1, Data_Width = 32, SIMD_Width = 64"