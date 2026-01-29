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
	"$MODULES_ROOT/RTL-Shifter_syn.vhd" \
	"$MODULES_ROOT/RTL-Excpt_Handling_syn.vhd" \
	"$MODULES_ROOT/RTL-DSP_Unit_syn.vhd" 
]

#set TOP_DESIGN "SHIFTER"
#set TOP_DESIGN "ACCUMULATOR"
#set TOP_DESIGN "COMPARATOR"
#set TOP_DESIGN "ADDER"
#set TOP_DESIGN "MULTIPLIER"
set TOP_DESIGN "DSP_Unit"


set allowed_cells { \
	BUF_X1 \
	BUF_X2 \
	BUF_X4 \
	BUF_X8 \
	BUF_X16 \
	BUF_X32 \
	INV_X1 \
	INV_X2 \
	INV_X4 \
	INV_X8 \
	INV_X16 \
	INV_X32 \
	AND2_X1 \
	AND2_X2 \
	AND2_X4 \
	AND3_X1 \
	AND3_X2 \
	AND3_X4 \
	AND4_X1 \
	AND4_X2 \
	AND4_X4 \
	NAND2_X1 \
	NAND2_X2 \
	NAND2_X4 \
	NAND3_X1 \
	NAND3_X2 \
	NAND3_X4 \
	NAND4_X1 \
	NAND4_X2 \
	NAND4_X4 \
	OR2_X1 \
	OR2_X2 \
	OR2_X4 \
	OR3_X1 \
	OR3_X2 \
	OR3_X4 \
	OR4_X1 \
	OR4_X2 \
	OR4_X4 \
	OR4_X4 \
	NOR2_X1 \
	NOR2_X2 \
	NOR2_X4 \
	NOR3_X1 \
	NOR3_X2 \
	NOR3_X4 \
	NOR4_X1 \
	NOR4_X2 \
	NOR4_X4 \
	XOR2_X1 \
	XOR2_X2 \
	XNOR2_X1 \
	XNOR2_X2 \
	MUX2_X1 \
	MUX2_X2 \
	HA_X1 \
	FA_X1 \
	AOI211_X1 \
	AOI211_X2 \
	AOI211_X4 \
	AOI21_X1 \
	AOI21_X2 \
	AOI21_X4 \
	AOI221_X1 \
	AOI221_X2 \
	AOI221_X4 \
	AOI222_X1 \
	AOI222_X2 \
	AOI222_X4 \
	AOI22_X1 \
	AOI22_X2 \
	AOI22_X4 \
	OAI211_X1 \
	OAI211_X2 \
	OAI211_X4 \
	OAI21_X1 \
	OAI21_X2 \
	OAI21_X4 \
	OAI221_X1 \
	OAI221_X2 \
	OAI221_X4 \
	OAI222_X1 \
	OAI222_X2 \
	OAI222_X4 \
	OAI22_X1 \
	OAI22_X2 \
	OAI22_X4 \
	OAI33_X1 \
	DFF_X1 \
	DFF_X2 \
	DFFS_X1 \
	DFFS_X2 \
	DFFR_X1 \
	DFFR_X2 \
	DFFRS_X1 \
	DFFRS_X2 \
	DLL_X1 \
	DLL_X2 \
	DLH_X1 \
	DLH_X2 \
	CLKBUF_X1 \
	CLKBUF_X2 \
	CLKBUF_X3 \
	CLKGATE_X1 \
	CLKGATE_X2 \
	CLKGATE_X4 \
	CLKGATE_X8 \
	TBUF_X1 \
	TBUF_X2 \
	TBUF_X4 \
	TBUF_X8 \
	TINV_X1 \
	TLAT_X1 \
	LOGIC0_X1 \
	LOGIC1_X1 \
	ANTENNA_X1 \
	FILLCELL_X1 \
	FILLCELL_X2 \
	FILLCELL_X4 \
	FILLCELL_X8 \
	FILLCELL_X16 \
	FILLCELL_X32 \
}

#set DESIGN_PARAM "multithreaded_accl_en = 0, SIMD = 2, ACCL_NUM = 1, FU_NUM = 1, Data_Width = 32, SIMD_Width = 64"

# SIMD variation
# 2
set DESIGN_PARAM "THREAD_POOL_SIZE = 3, accl_en = 1, replicate_accl_en = 0, multithreaded_accl_en = 0, SPM_NUM = 4, Addr_Width = 14, SIMD = 2, ACCL_NUM = 1, FU_NUM = 1, TPS_CEIL = 2, TPS_BUF_CEIL = 1, SPM_ADDR_WID = 3, SIMD_BITS = 1, Data_Width = 32, SIMD_Width = 64"
# 4
#set DESIGN_PARAM "THREAD_POOL_SIZE = 3, accl_en = 1, replicate_accl_en = 0, multithreaded_accl_en = 0, SPM_NUM = 4, Addr_Width = 14, SIMD = 4, ACCL_NUM = 1, FU_NUM = 1, TPS_CEIL = 2, TPS_BUF_CEIL = 1, SPM_ADDR_WID = 3, SIMD_BITS = 2, Data_Width = 32, SIMD_Width = 128"
# 8
#set DESIGN_PARAM "THREAD_POOL_SIZE = 3, accl_en = 1, replicate_accl_en = 0, multithreaded_accl_en = 0, SPM_NUM = 4, Addr_Width = 14, SIMD = 8, ACCL_NUM = 1, FU_NUM = 1, TPS_CEIL = 2, TPS_BUF_CEIL = 1, SPM_ADDR_WID = 3, SIMD_BITS = 3, Data_Width = 32, SIMD_Width = 256"
# 16
#set DESIGN_PARAM "THREAD_POOL_SIZE = 3, accl_en = 1, replicate_accl_en = 0, multithreaded_accl_en = 0, SPM_NUM = 4, Addr_Width = 14, SIMD = 16, ACCL_NUM = 1, FU_NUM = 1, TPS_CEIL = 2, TPS_BUF_CEIL = 1, SPM_ADDR_WID = 3, SIMD_BITS = 4, Data_Width = 32, SIMD_Width = 512"

# 3 accl
#set DESIGN_PARAM "THREAD_POOL_SIZE = 3, accl_en = 1, replicate_accl_en = 1, multithreaded_accl_en = 0, SPM_NUM = 4, Addr_Width = 14, SIMD = 2, ACCL_NUM = 3, FU_NUM = 3, TPS_CEIL = 2, TPS_BUF_CEIL = 1, SPM_ADDR_WID = 3, SIMD_BITS = 1, Data_Width = 32, SIMD_Width = 64"
#set DESIGN_PARAM "THREAD_POOL_SIZE = 3, accl_en = 1, replicate_accl_en = 1, multithreaded_accl_en = 0, SPM_NUM = 4, Addr_Width = 14, SIMD = 4, ACCL_NUM = 3, FU_NUM = 3, TPS_CEIL = 2, TPS_BUF_CEIL = 1, SPM_ADDR_WID = 3, SIMD_BITS = 2, Data_Width = 32, SIMD_Width = 128"
#set DESIGN_PARAM "THREAD_POOL_SIZE = 3, accl_en = 1, replicate_accl_en = 1, multithreaded_accl_en = 0, SPM_NUM = 4, Addr_Width = 14, SIMD = 8, ACCL_NUM = 3, FU_NUM = 3, TPS_CEIL = 2, TPS_BUF_CEIL = 1, SPM_ADDR_WID = 3, SIMD_BITS = 3, Data_Width = 32, SIMD_Width = 256"
#set DESIGN_PARAM "THREAD_POOL_SIZE = 3, accl_en = 1, replicate_accl_en = 1, multithreaded_accl_en = 0, SPM_NUM = 4, Addr_Width = 14, SIMD = 16, ACCL_NUM = 3, FU_NUM = 3, TPS_CEIL = 2, TPS_BUF_CEIL = 1, SPM_ADDR_WID = 3, SIMD_BITS = 4, Data_Width = 32, SIMD_Width = 512"

# 6 accl
#set DESIGN_PARAM "THREAD_POOL_SIZE = 6, accl_en = 1, replicate_accl_en = 1, multithreaded_accl_en = 0, SPM_NUM = 4, Addr_Width = 14, SIMD = 2, ACCL_NUM = 6, FU_NUM = 6, TPS_CEIL = 3, TPS_BUF_CEIL = 3, SPM_ADDR_WID = 3, SIMD_BITS = 1, Data_Width = 32, SIMD_Width = 64"
#set DESIGN_PARAM "THREAD_POOL_SIZE = 6, accl_en = 1, replicate_accl_en = 1, multithreaded_accl_en = 0, SPM_NUM = 4, Addr_Width = 14, SIMD = 4, ACCL_NUM = 6, FU_NUM = 6, TPS_CEIL = 3, TPS_BUF_CEIL = 3, SPM_ADDR_WID = 3, SIMD_BITS = 2, Data_Width = 32, SIMD_Width = 128"
#set DESIGN_PARAM "THREAD_POOL_SIZE = 6, accl_en = 1, replicate_accl_en = 1, multithreaded_accl_en = 0, SPM_NUM = 4, Addr_Width = 14, SIMD = 8, ACCL_NUM = 6, FU_NUM = 6, TPS_CEIL = 3, TPS_BUF_CEIL = 3, SPM_ADDR_WID = 3, SIMD_BITS = 3, Data_Width = 32, SIMD_Width = 256"

#set DESIGN_PARAM "multithreaded_accl_en = 0, SIMD = 2, ACCL_NUM = 1, FU_NUM = 1, Data_Width = 32, SIMD_Width = 64"
#set DESIGN_PARAM "multithreaded_accl_en = 0, SIMD = 2, ACCL_NUM = 3, FU_NUM = 3, SIMD_Width = 64"
#set DESIGN_PARAM "multithreaded_accl_en = 0, SIMD = 8, ACCL_NUM = 6, FU_NUM = 6, SIMD_Width = 256"
#set DESIGN_PARAM "multithreaded_accl_en = 0, SIMD = 8, ACCL_NUM = 6, FU_NUM = 6, SIMD_Width = 256, Data_Width = 32"
