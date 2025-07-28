/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12
// Date      : Fri Jul 25 11:51:47 2025
/////////////////////////////////////////////////////////////



    module COMPARATOR ( 
        clk_i, rst_ni, MVTYPE_DSP, relu_instr, halt_dsp_lat, cmp_stage_1_en, 
        recover_state_wires, cmp_en, dsp_in_cmp_operands, MSB_stage_2, 
        dsp_out_cmp_results );
  input [1:0] MVTYPE_DSP;
  input [0:0] relu_instr;
  input [0:0] halt_dsp_lat;
  input [0:0] cmp_stage_1_en;
  input [0:0] recover_state_wires;
  input [0:0] cmp_en;
  input [63:0] dsp_in_cmp_operands;
  input [15:0] MSB_stage_2;
  output [63:0] dsp_out_cmp_results;
  input clk_i, rst_ni;
  wire   n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400;
  wire   [15:0] MSB_stage_3;
  assign dsp_out_cmp_results[31] = 1'b0;
  assign dsp_out_cmp_results[63] = 1'b0;

  DFFRNQ_X1 \dsp_out_cmp_results_reg[62]  ( .D(n228), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[62]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[61]  ( .D(n227), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[61]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[60]  ( .D(n226), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[60]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[59]  ( .D(n225), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[59]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[58]  ( .D(n224), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[58]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[57]  ( .D(n223), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[57]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[55]  ( .D(n221), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[55]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[54]  ( .D(n220), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[54]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[53]  ( .D(n219), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[53]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[52]  ( .D(n218), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[52]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[51]  ( .D(n217), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[51]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[50]  ( .D(n216), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[50]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[49]  ( .D(n215), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[49]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[47]  ( .D(n213), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[47]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[46]  ( .D(n212), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[46]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[45]  ( .D(n211), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[45]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[44]  ( .D(n210), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[44]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[43]  ( .D(n209), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[43]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[42]  ( .D(n208), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[42]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[41]  ( .D(n207), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[41]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[39]  ( .D(n205), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[39]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[38]  ( .D(n204), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[38]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[37]  ( .D(n203), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[37]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[36]  ( .D(n202), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[36]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[35]  ( .D(n201), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[35]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[34]  ( .D(n200), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[34]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[33]  ( .D(n199), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[33]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[30]  ( .D(n197), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[30]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[29]  ( .D(n196), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[29]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[28]  ( .D(n195), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[28]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[27]  ( .D(n194), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[27]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[26]  ( .D(n193), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[26]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[25]  ( .D(n192), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[25]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[23]  ( .D(n190), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[23]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[22]  ( .D(n189), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[22]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[21]  ( .D(n188), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[21]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[20]  ( .D(n187), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[20]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[19]  ( .D(n186), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[19]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[18]  ( .D(n185), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[18]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[17]  ( .D(n184), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[17]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[15]  ( .D(n182), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[15]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[14]  ( .D(n181), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[14]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[13]  ( .D(n180), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[13]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[12]  ( .D(n179), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[12]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[11]  ( .D(n178), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[11]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[10]  ( .D(n177), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[10]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[9]  ( .D(n176), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[9]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[7]  ( .D(n174), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[7]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[6]  ( .D(n173), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[6]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[5]  ( .D(n172), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[5]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[4]  ( .D(n171), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[4]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[3]  ( .D(n170), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[3]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[2]  ( .D(n169), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[2]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[1]  ( .D(n168), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[1]) );
  DFFRNQ_X1 \MSB_stage_3_reg[15]  ( .D(n245), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[15]) );
  DFFRNQ_X1 \MSB_stage_3_reg[14]  ( .D(n244), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[14]) );
  DFFRNQ_X1 \MSB_stage_3_reg[13]  ( .D(n243), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[13]) );
  DFFRNQ_X1 \MSB_stage_3_reg[12]  ( .D(n242), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[12]) );
  DFFRNQ_X1 \MSB_stage_3_reg[11]  ( .D(n241), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[11]) );
  DFFRNQ_X1 \MSB_stage_3_reg[10]  ( .D(n240), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[10]) );
  DFFRNQ_X1 \MSB_stage_3_reg[9]  ( .D(n239), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[9]) );
  DFFRNQ_X1 \MSB_stage_3_reg[8]  ( .D(n238), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[8]) );
  DFFRNQ_X1 \MSB_stage_3_reg[7]  ( .D(n237), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[7]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[56]  ( .D(n222), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[56]) );
  DFFRNQ_X1 \MSB_stage_3_reg[6]  ( .D(n236), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[6]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[48]  ( .D(n214), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[48]) );
  DFFRNQ_X1 \MSB_stage_3_reg[5]  ( .D(n235), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[5]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[40]  ( .D(n206), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[40]) );
  DFFRNQ_X1 \MSB_stage_3_reg[4]  ( .D(n234), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[4]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[32]  ( .D(n198), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[32]) );
  DFFRNQ_X1 \MSB_stage_3_reg[3]  ( .D(n233), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[3]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[24]  ( .D(n191), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[24]) );
  DFFRNQ_X1 \MSB_stage_3_reg[2]  ( .D(n232), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[2]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[16]  ( .D(n183), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[16]) );
  DFFRNQ_X1 \MSB_stage_3_reg[1]  ( .D(n231), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[1]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[8]  ( .D(n175), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[8]) );
  DFFRNQ_X1 \MSB_stage_3_reg[0]  ( .D(n230), .CLK(clk_i), .RN(rst_ni), .Q(
        MSB_stage_3[0]) );
  DFFRNQ_X1 \dsp_out_cmp_results_reg[0]  ( .D(n229), .CLK(clk_i), .RN(rst_ni), 
        .Q(dsp_out_cmp_results[0]) );
  INV_X1 U249 ( .I(cmp_en[0]), .ZN(n246) );
  NOR2_X1 U250 ( .A1(n246), .A2(halt_dsp_lat[0]), .ZN(n335) );
  INV_X1 U251 ( .I(n335), .ZN(n334) );
  AOI21_X1 U252 ( .A1(MVTYPE_DSP[0]), .A2(MVTYPE_DSP[1]), .B(n334), .ZN(n247)
         );
  OAI21_X1 U253 ( .A1(cmp_stage_1_en[0]), .A2(recover_state_wires[0]), .B(n247), .ZN(n386) );
  INV_X1 U254 ( .I(n386), .ZN(n260) );
  INV_X1 U255 ( .I(dsp_out_cmp_results[47]), .ZN(n249) );
  NAND2_X1 U256 ( .A1(n260), .A2(relu_instr[0]), .ZN(n319) );
  NOR2_X1 U257 ( .A1(n319), .A2(dsp_in_cmp_operands[63]), .ZN(n351) );
  NAND2_X1 U258 ( .A1(MVTYPE_DSP[1]), .A2(n351), .ZN(n248) );
  INV_X1 U259 ( .I(dsp_in_cmp_operands[47]), .ZN(n344) );
  OAI22_X1 U260 ( .A1(n260), .A2(n249), .B1(n248), .B2(n344), .ZN(n213) );
  INV_X1 U261 ( .I(dsp_out_cmp_results[23]), .ZN(n251) );
  NOR2_X1 U262 ( .A1(n319), .A2(dsp_in_cmp_operands[31]), .ZN(n356) );
  INV_X1 U263 ( .I(MVTYPE_DSP[0]), .ZN(n391) );
  INV_X1 U264 ( .I(MVTYPE_DSP[1]), .ZN(n389) );
  NAND2_X1 U265 ( .A1(n391), .A2(n389), .ZN(n270) );
  NAND2_X1 U266 ( .A1(n356), .A2(n270), .ZN(n250) );
  INV_X1 U267 ( .I(dsp_in_cmp_operands[23]), .ZN(n369) );
  OAI22_X1 U268 ( .A1(n260), .A2(n251), .B1(n250), .B2(n369), .ZN(n190) );
  INV_X1 U269 ( .I(dsp_out_cmp_results[15]), .ZN(n253) );
  INV_X1 U270 ( .I(dsp_in_cmp_operands[15]), .ZN(n339) );
  NAND2_X1 U271 ( .A1(MVTYPE_DSP[1]), .A2(n356), .ZN(n252) );
  OAI22_X1 U272 ( .A1(n260), .A2(n253), .B1(n339), .B2(n252), .ZN(n182) );
  INV_X1 U273 ( .I(dsp_out_cmp_results[7]), .ZN(n255) );
  OAI22_X1 U274 ( .A1(dsp_in_cmp_operands[31]), .A2(n389), .B1(
        dsp_in_cmp_operands[15]), .B2(n391), .ZN(n318) );
  NAND2_X1 U275 ( .A1(dsp_in_cmp_operands[7]), .A2(n318), .ZN(n254) );
  OAI22_X1 U276 ( .A1(n260), .A2(n255), .B1(n254), .B2(n319), .ZN(n174) );
  INV_X1 U277 ( .I(dsp_out_cmp_results[55]), .ZN(n257) );
  NAND2_X1 U278 ( .A1(n351), .A2(n270), .ZN(n256) );
  INV_X1 U279 ( .I(dsp_in_cmp_operands[55]), .ZN(n361) );
  OAI22_X1 U280 ( .A1(n260), .A2(n257), .B1(n256), .B2(n361), .ZN(n221) );
  INV_X1 U281 ( .I(dsp_out_cmp_results[39]), .ZN(n259) );
  INV_X1 U282 ( .I(n319), .ZN(n276) );
  OAI22_X1 U283 ( .A1(dsp_in_cmp_operands[63]), .A2(n389), .B1(
        dsp_in_cmp_operands[47]), .B2(n391), .ZN(n258) );
  NAND2_X1 U284 ( .A1(n276), .A2(n258), .ZN(n286) );
  INV_X1 U285 ( .I(dsp_in_cmp_operands[39]), .ZN(n377) );
  OAI22_X1 U286 ( .A1(n260), .A2(n259), .B1(n286), .B2(n377), .ZN(n205) );
  INV_X1 U287 ( .I(MSB_stage_3[0]), .ZN(n393) );
  NAND2_X1 U288 ( .A1(n335), .A2(MSB_stage_2[0]), .ZN(n261) );
  OAI21_X1 U289 ( .A1(n335), .A2(n393), .B(n261), .ZN(n230) );
  INV_X1 U290 ( .I(MSB_stage_3[14]), .ZN(n359) );
  NAND2_X1 U291 ( .A1(n335), .A2(MSB_stage_2[14]), .ZN(n262) );
  OAI21_X1 U292 ( .A1(n335), .A2(n359), .B(n262), .ZN(n244) );
  INV_X1 U293 ( .I(MSB_stage_3[1]), .ZN(n338) );
  NAND2_X1 U294 ( .A1(n335), .A2(MSB_stage_2[1]), .ZN(n263) );
  OAI21_X1 U295 ( .A1(n335), .A2(n338), .B(n263), .ZN(n231) );
  INV_X1 U296 ( .I(MSB_stage_3[10]), .ZN(n367) );
  NAND2_X1 U297 ( .A1(n335), .A2(MSB_stage_2[10]), .ZN(n264) );
  OAI21_X1 U298 ( .A1(n335), .A2(n367), .B(n264), .ZN(n240) );
  INV_X1 U299 ( .I(MSB_stage_3[5]), .ZN(n343) );
  NAND2_X1 U300 ( .A1(n335), .A2(MSB_stage_2[5]), .ZN(n265) );
  OAI21_X1 U301 ( .A1(n335), .A2(n343), .B(n265), .ZN(n235) );
  INV_X1 U302 ( .I(MSB_stage_3[4]), .ZN(n376) );
  NAND2_X1 U303 ( .A1(n335), .A2(MSB_stage_2[4]), .ZN(n266) );
  OAI21_X1 U304 ( .A1(n335), .A2(n376), .B(n266), .ZN(n234) );
  INV_X1 U305 ( .I(MSB_stage_3[3]), .ZN(n353) );
  NAND2_X1 U306 ( .A1(n335), .A2(MSB_stage_2[3]), .ZN(n267) );
  OAI21_X1 U307 ( .A1(n335), .A2(n353), .B(n267), .ZN(n233) );
  INV_X1 U308 ( .I(MSB_stage_3[7]), .ZN(n348) );
  NAND2_X1 U309 ( .A1(n335), .A2(MSB_stage_2[7]), .ZN(n268) );
  OAI21_X1 U310 ( .A1(n335), .A2(n348), .B(n268), .ZN(n237) );
  AOI22_X1 U311 ( .A1(dsp_in_cmp_operands[60]), .A2(n351), .B1(
        dsp_out_cmp_results[60]), .B2(n386), .ZN(n269) );
  INV_X1 U312 ( .I(n269), .ZN(n226) );
  INV_X1 U313 ( .I(n270), .ZN(n337) );
  INV_X1 U314 ( .I(n351), .ZN(n277) );
  NAND2_X1 U315 ( .A1(n337), .A2(n276), .ZN(n302) );
  OAI22_X1 U316 ( .A1(n337), .A2(n277), .B1(dsp_in_cmp_operands[55]), .B2(n302), .ZN(n363) );
  AOI22_X1 U317 ( .A1(dsp_in_cmp_operands[53]), .A2(n363), .B1(
        dsp_out_cmp_results[53]), .B2(n386), .ZN(n271) );
  INV_X1 U318 ( .I(n271), .ZN(n219) );
  AOI22_X1 U319 ( .A1(dsp_in_cmp_operands[58]), .A2(n351), .B1(
        dsp_out_cmp_results[58]), .B2(n386), .ZN(n272) );
  INV_X1 U320 ( .I(n272), .ZN(n224) );
  AOI22_X1 U321 ( .A1(dsp_in_cmp_operands[49]), .A2(n363), .B1(
        dsp_out_cmp_results[49]), .B2(n386), .ZN(n273) );
  INV_X1 U322 ( .I(n273), .ZN(n215) );
  AOI22_X1 U323 ( .A1(dsp_in_cmp_operands[54]), .A2(n363), .B1(
        dsp_out_cmp_results[54]), .B2(n386), .ZN(n274) );
  INV_X1 U324 ( .I(n274), .ZN(n220) );
  AOI22_X1 U325 ( .A1(dsp_in_cmp_operands[50]), .A2(n363), .B1(
        dsp_out_cmp_results[50]), .B2(n386), .ZN(n275) );
  INV_X1 U326 ( .I(n275), .ZN(n216) );
  NAND2_X1 U327 ( .A1(n276), .A2(n389), .ZN(n311) );
  OAI22_X1 U328 ( .A1(dsp_in_cmp_operands[47]), .A2(n311), .B1(n389), .B2(n277), .ZN(n346) );
  AOI22_X1 U329 ( .A1(dsp_in_cmp_operands[46]), .A2(n346), .B1(
        dsp_out_cmp_results[46]), .B2(n386), .ZN(n278) );
  INV_X1 U330 ( .I(n278), .ZN(n212) );
  AOI22_X1 U331 ( .A1(dsp_in_cmp_operands[52]), .A2(n363), .B1(
        dsp_out_cmp_results[52]), .B2(n386), .ZN(n279) );
  INV_X1 U332 ( .I(n279), .ZN(n218) );
  AOI22_X1 U333 ( .A1(dsp_in_cmp_operands[57]), .A2(n351), .B1(
        dsp_out_cmp_results[57]), .B2(n386), .ZN(n280) );
  INV_X1 U334 ( .I(n280), .ZN(n223) );
  AOI22_X1 U335 ( .A1(dsp_in_cmp_operands[59]), .A2(n351), .B1(
        dsp_out_cmp_results[59]), .B2(n386), .ZN(n281) );
  INV_X1 U336 ( .I(n281), .ZN(n225) );
  AOI22_X1 U337 ( .A1(dsp_in_cmp_operands[43]), .A2(n346), .B1(
        dsp_out_cmp_results[43]), .B2(n386), .ZN(n282) );
  INV_X1 U338 ( .I(n282), .ZN(n209) );
  AOI22_X1 U339 ( .A1(dsp_in_cmp_operands[42]), .A2(n346), .B1(
        dsp_out_cmp_results[42]), .B2(n386), .ZN(n283) );
  INV_X1 U340 ( .I(n283), .ZN(n208) );
  AOI22_X1 U341 ( .A1(dsp_in_cmp_operands[41]), .A2(n346), .B1(
        dsp_out_cmp_results[41]), .B2(n386), .ZN(n284) );
  INV_X1 U342 ( .I(n284), .ZN(n207) );
  AOI22_X1 U343 ( .A1(dsp_in_cmp_operands[61]), .A2(n351), .B1(
        dsp_out_cmp_results[61]), .B2(n386), .ZN(n285) );
  INV_X1 U344 ( .I(n285), .ZN(n227) );
  OAI21_X1 U345 ( .A1(dsp_in_cmp_operands[39]), .A2(n302), .B(n286), .ZN(n382)
         );
  AOI22_X1 U346 ( .A1(dsp_in_cmp_operands[38]), .A2(n382), .B1(
        dsp_out_cmp_results[38]), .B2(n386), .ZN(n287) );
  INV_X1 U347 ( .I(n287), .ZN(n204) );
  AOI22_X1 U348 ( .A1(dsp_in_cmp_operands[45]), .A2(n346), .B1(
        dsp_out_cmp_results[45]), .B2(n386), .ZN(n288) );
  INV_X1 U349 ( .I(n288), .ZN(n211) );
  AOI22_X1 U350 ( .A1(dsp_in_cmp_operands[51]), .A2(n363), .B1(
        dsp_out_cmp_results[51]), .B2(n386), .ZN(n289) );
  INV_X1 U351 ( .I(n289), .ZN(n217) );
  AOI22_X1 U352 ( .A1(dsp_in_cmp_operands[36]), .A2(n382), .B1(
        dsp_out_cmp_results[36]), .B2(n386), .ZN(n290) );
  INV_X1 U353 ( .I(n290), .ZN(n202) );
  AOI22_X1 U354 ( .A1(dsp_in_cmp_operands[35]), .A2(n382), .B1(
        dsp_out_cmp_results[35]), .B2(n386), .ZN(n291) );
  INV_X1 U355 ( .I(n291), .ZN(n201) );
  AOI22_X1 U356 ( .A1(dsp_in_cmp_operands[34]), .A2(n382), .B1(
        dsp_out_cmp_results[34]), .B2(n386), .ZN(n292) );
  INV_X1 U357 ( .I(n292), .ZN(n200) );
  AOI22_X1 U358 ( .A1(dsp_in_cmp_operands[33]), .A2(n382), .B1(
        dsp_out_cmp_results[33]), .B2(n386), .ZN(n293) );
  INV_X1 U359 ( .I(n293), .ZN(n199) );
  AOI22_X1 U360 ( .A1(dsp_in_cmp_operands[30]), .A2(n356), .B1(
        dsp_out_cmp_results[30]), .B2(n386), .ZN(n294) );
  INV_X1 U361 ( .I(n294), .ZN(n197) );
  AOI22_X1 U362 ( .A1(dsp_in_cmp_operands[29]), .A2(n356), .B1(
        dsp_out_cmp_results[29]), .B2(n386), .ZN(n295) );
  INV_X1 U363 ( .I(n295), .ZN(n196) );
  AOI22_X1 U364 ( .A1(dsp_in_cmp_operands[37]), .A2(n382), .B1(
        dsp_out_cmp_results[37]), .B2(n386), .ZN(n296) );
  INV_X1 U365 ( .I(n296), .ZN(n203) );
  AOI22_X1 U366 ( .A1(dsp_in_cmp_operands[28]), .A2(n356), .B1(
        dsp_out_cmp_results[28]), .B2(n386), .ZN(n297) );
  INV_X1 U367 ( .I(n297), .ZN(n195) );
  AOI22_X1 U368 ( .A1(dsp_in_cmp_operands[27]), .A2(n356), .B1(
        dsp_out_cmp_results[27]), .B2(n386), .ZN(n298) );
  INV_X1 U369 ( .I(n298), .ZN(n194) );
  AOI22_X1 U370 ( .A1(dsp_in_cmp_operands[26]), .A2(n356), .B1(
        dsp_out_cmp_results[26]), .B2(n386), .ZN(n299) );
  INV_X1 U371 ( .I(n299), .ZN(n193) );
  AOI22_X1 U372 ( .A1(dsp_in_cmp_operands[25]), .A2(n356), .B1(
        dsp_out_cmp_results[25]), .B2(n386), .ZN(n300) );
  INV_X1 U373 ( .I(n300), .ZN(n192) );
  AOI22_X1 U374 ( .A1(dsp_in_cmp_operands[44]), .A2(n346), .B1(
        dsp_out_cmp_results[44]), .B2(n386), .ZN(n301) );
  INV_X1 U375 ( .I(n301), .ZN(n210) );
  INV_X1 U376 ( .I(n356), .ZN(n310) );
  OAI22_X1 U377 ( .A1(n337), .A2(n310), .B1(dsp_in_cmp_operands[23]), .B2(n302), .ZN(n371) );
  AOI22_X1 U378 ( .A1(dsp_in_cmp_operands[22]), .A2(n371), .B1(
        dsp_out_cmp_results[22]), .B2(n386), .ZN(n303) );
  INV_X1 U379 ( .I(n303), .ZN(n189) );
  AOI22_X1 U380 ( .A1(dsp_in_cmp_operands[62]), .A2(n351), .B1(
        dsp_out_cmp_results[62]), .B2(n386), .ZN(n304) );
  INV_X1 U381 ( .I(n304), .ZN(n228) );
  AOI22_X1 U382 ( .A1(dsp_in_cmp_operands[21]), .A2(n371), .B1(
        dsp_out_cmp_results[21]), .B2(n386), .ZN(n305) );
  INV_X1 U383 ( .I(n305), .ZN(n188) );
  AOI22_X1 U384 ( .A1(dsp_in_cmp_operands[20]), .A2(n371), .B1(
        dsp_out_cmp_results[20]), .B2(n386), .ZN(n306) );
  INV_X1 U385 ( .I(n306), .ZN(n187) );
  AOI22_X1 U386 ( .A1(dsp_in_cmp_operands[19]), .A2(n371), .B1(
        dsp_out_cmp_results[19]), .B2(n386), .ZN(n307) );
  INV_X1 U387 ( .I(n307), .ZN(n186) );
  AOI22_X1 U388 ( .A1(dsp_in_cmp_operands[18]), .A2(n371), .B1(
        dsp_out_cmp_results[18]), .B2(n386), .ZN(n308) );
  INV_X1 U389 ( .I(n308), .ZN(n185) );
  AOI22_X1 U390 ( .A1(dsp_in_cmp_operands[17]), .A2(n371), .B1(
        dsp_out_cmp_results[17]), .B2(n386), .ZN(n309) );
  INV_X1 U391 ( .I(n309), .ZN(n184) );
  OAI22_X1 U392 ( .A1(dsp_in_cmp_operands[15]), .A2(n311), .B1(n389), .B2(n310), .ZN(n341) );
  AOI22_X1 U393 ( .A1(dsp_in_cmp_operands[14]), .A2(n341), .B1(
        dsp_out_cmp_results[14]), .B2(n386), .ZN(n312) );
  INV_X1 U394 ( .I(n312), .ZN(n181) );
  AOI22_X1 U395 ( .A1(dsp_in_cmp_operands[13]), .A2(n341), .B1(
        dsp_out_cmp_results[13]), .B2(n386), .ZN(n313) );
  INV_X1 U396 ( .I(n313), .ZN(n180) );
  AOI22_X1 U397 ( .A1(dsp_in_cmp_operands[12]), .A2(n341), .B1(
        dsp_out_cmp_results[12]), .B2(n386), .ZN(n314) );
  INV_X1 U398 ( .I(n314), .ZN(n179) );
  AOI22_X1 U399 ( .A1(dsp_in_cmp_operands[11]), .A2(n341), .B1(
        dsp_out_cmp_results[11]), .B2(n386), .ZN(n315) );
  INV_X1 U400 ( .I(n315), .ZN(n178) );
  AOI22_X1 U401 ( .A1(dsp_in_cmp_operands[10]), .A2(n341), .B1(
        dsp_out_cmp_results[10]), .B2(n386), .ZN(n316) );
  INV_X1 U402 ( .I(n316), .ZN(n177) );
  AOI22_X1 U403 ( .A1(dsp_in_cmp_operands[9]), .A2(n341), .B1(
        dsp_out_cmp_results[9]), .B2(n386), .ZN(n317) );
  INV_X1 U404 ( .I(n317), .ZN(n176) );
  INV_X1 U405 ( .I(dsp_in_cmp_operands[7]), .ZN(n392) );
  AOI21_X1 U406 ( .A1(n337), .A2(n392), .B(n318), .ZN(n320) );
  NOR2_X1 U407 ( .A1(n320), .A2(n319), .ZN(n387) );
  AOI22_X1 U408 ( .A1(dsp_in_cmp_operands[6]), .A2(n387), .B1(
        dsp_out_cmp_results[6]), .B2(n386), .ZN(n321) );
  INV_X1 U409 ( .I(n321), .ZN(n173) );
  AOI22_X1 U410 ( .A1(dsp_in_cmp_operands[5]), .A2(n387), .B1(
        dsp_out_cmp_results[5]), .B2(n386), .ZN(n322) );
  INV_X1 U411 ( .I(n322), .ZN(n172) );
  AOI22_X1 U412 ( .A1(dsp_in_cmp_operands[4]), .A2(n387), .B1(
        dsp_out_cmp_results[4]), .B2(n386), .ZN(n323) );
  INV_X1 U413 ( .I(n323), .ZN(n171) );
  AOI22_X1 U414 ( .A1(dsp_in_cmp_operands[3]), .A2(n387), .B1(
        dsp_out_cmp_results[3]), .B2(n386), .ZN(n324) );
  INV_X1 U415 ( .I(n324), .ZN(n170) );
  AOI22_X1 U416 ( .A1(dsp_in_cmp_operands[2]), .A2(n387), .B1(
        dsp_out_cmp_results[2]), .B2(n386), .ZN(n325) );
  INV_X1 U417 ( .I(n325), .ZN(n169) );
  AOI22_X1 U418 ( .A1(dsp_in_cmp_operands[1]), .A2(n387), .B1(
        dsp_out_cmp_results[1]), .B2(n386), .ZN(n326) );
  INV_X1 U419 ( .I(n326), .ZN(n168) );
  AOI22_X1 U420 ( .A1(n335), .A2(MSB_stage_2[15]), .B1(MSB_stage_3[15]), .B2(
        n334), .ZN(n327) );
  INV_X1 U421 ( .I(n327), .ZN(n245) );
  AOI22_X1 U422 ( .A1(n335), .A2(MSB_stage_2[11]), .B1(MSB_stage_3[11]), .B2(
        n334), .ZN(n328) );
  INV_X1 U423 ( .I(n328), .ZN(n241) );
  AOI22_X1 U424 ( .A1(n335), .A2(MSB_stage_2[12]), .B1(MSB_stage_3[12]), .B2(
        n334), .ZN(n329) );
  INV_X1 U425 ( .I(n329), .ZN(n242) );
  AOI22_X1 U426 ( .A1(n335), .A2(MSB_stage_2[8]), .B1(MSB_stage_3[8]), .B2(
        n334), .ZN(n330) );
  INV_X1 U427 ( .I(n330), .ZN(n238) );
  AOI22_X1 U428 ( .A1(n335), .A2(MSB_stage_2[9]), .B1(MSB_stage_3[9]), .B2(
        n334), .ZN(n331) );
  INV_X1 U429 ( .I(n331), .ZN(n239) );
  AOI22_X1 U430 ( .A1(n335), .A2(MSB_stage_2[13]), .B1(MSB_stage_3[13]), .B2(
        n334), .ZN(n332) );
  INV_X1 U431 ( .I(n332), .ZN(n243) );
  AOI22_X1 U432 ( .A1(n335), .A2(MSB_stage_2[2]), .B1(MSB_stage_3[2]), .B2(
        n334), .ZN(n333) );
  INV_X1 U433 ( .I(n333), .ZN(n232) );
  AOI22_X1 U434 ( .A1(n335), .A2(MSB_stage_2[6]), .B1(MSB_stage_3[6]), .B2(
        n334), .ZN(n336) );
  INV_X1 U435 ( .I(n336), .ZN(n236) );
  NOR2_X1 U436 ( .A1(n386), .A2(relu_instr[0]), .ZN(n398) );
  NAND2_X1 U437 ( .A1(n337), .A2(n398), .ZN(n358) );
  OAI21_X1 U438 ( .A1(n339), .A2(n338), .B(MSB_stage_3[9]), .ZN(n340) );
  OAI21_X1 U439 ( .A1(dsp_in_cmp_operands[15]), .A2(MSB_stage_3[1]), .B(n340), 
        .ZN(n390) );
  AOI22_X1 U440 ( .A1(dsp_in_cmp_operands[8]), .A2(n341), .B1(
        dsp_out_cmp_results[8]), .B2(n386), .ZN(n342) );
  OAI21_X1 U441 ( .A1(n358), .A2(n390), .B(n342), .ZN(n175) );
  OAI21_X1 U442 ( .A1(n344), .A2(n343), .B(MSB_stage_3[13]), .ZN(n345) );
  OAI21_X1 U443 ( .A1(dsp_in_cmp_operands[47]), .A2(MSB_stage_3[5]), .B(n345), 
        .ZN(n381) );
  AOI22_X1 U444 ( .A1(dsp_in_cmp_operands[40]), .A2(n346), .B1(
        dsp_out_cmp_results[40]), .B2(n386), .ZN(n347) );
  OAI21_X1 U445 ( .A1(n358), .A2(n381), .B(n347), .ZN(n206) );
  NAND2_X1 U446 ( .A1(dsp_in_cmp_operands[63]), .A2(MSB_stage_3[7]), .ZN(n350)
         );
  INV_X1 U447 ( .I(dsp_in_cmp_operands[63]), .ZN(n349) );
  AOI22_X1 U448 ( .A1(MSB_stage_3[15]), .A2(n350), .B1(n349), .B2(n348), .ZN(
        n364) );
  INV_X1 U449 ( .I(n364), .ZN(n380) );
  AOI22_X1 U450 ( .A1(dsp_in_cmp_operands[56]), .A2(n351), .B1(
        dsp_out_cmp_results[56]), .B2(n386), .ZN(n352) );
  OAI21_X1 U451 ( .A1(n380), .A2(n358), .B(n352), .ZN(n222) );
  NAND2_X1 U452 ( .A1(dsp_in_cmp_operands[31]), .A2(MSB_stage_3[3]), .ZN(n355)
         );
  INV_X1 U453 ( .I(dsp_in_cmp_operands[31]), .ZN(n354) );
  AOI22_X1 U454 ( .A1(MSB_stage_3[11]), .A2(n355), .B1(n354), .B2(n353), .ZN(
        n372) );
  INV_X1 U455 ( .I(n372), .ZN(n388) );
  AOI22_X1 U456 ( .A1(dsp_in_cmp_operands[24]), .A2(n356), .B1(
        dsp_out_cmp_results[24]), .B2(n386), .ZN(n357) );
  OAI21_X1 U457 ( .A1(n358), .A2(n388), .B(n357), .ZN(n191) );
  INV_X1 U458 ( .I(n358), .ZN(n396) );
  OAI21_X1 U459 ( .A1(dsp_in_cmp_operands[55]), .A2(n359), .B(MSB_stage_3[6]), 
        .ZN(n360) );
  OAI21_X1 U460 ( .A1(MSB_stage_3[14]), .A2(n361), .B(n360), .ZN(n362) );
  AOI22_X1 U461 ( .A1(n396), .A2(n362), .B1(dsp_out_cmp_results[48]), .B2(n386), .ZN(n366) );
  AND2_X1 U462 ( .A1(MVTYPE_DSP[0]), .A2(n398), .Z(n373) );
  AOI22_X1 U463 ( .A1(n364), .A2(n373), .B1(dsp_in_cmp_operands[48]), .B2(n363), .ZN(n365) );
  NAND2_X1 U464 ( .A1(n366), .A2(n365), .ZN(n214) );
  OAI21_X1 U465 ( .A1(dsp_in_cmp_operands[23]), .A2(n367), .B(MSB_stage_3[2]), 
        .ZN(n368) );
  OAI21_X1 U466 ( .A1(MSB_stage_3[10]), .A2(n369), .B(n368), .ZN(n370) );
  AOI22_X1 U467 ( .A1(n396), .A2(n370), .B1(dsp_out_cmp_results[16]), .B2(n386), .ZN(n375) );
  AOI22_X1 U468 ( .A1(n373), .A2(n372), .B1(dsp_in_cmp_operands[16]), .B2(n371), .ZN(n374) );
  NAND2_X1 U469 ( .A1(n375), .A2(n374), .ZN(n183) );
  NOR2_X1 U470 ( .A1(dsp_in_cmp_operands[39]), .A2(MSB_stage_3[4]), .ZN(n378)
         );
  OAI22_X1 U471 ( .A1(MSB_stage_3[12]), .A2(n378), .B1(n377), .B2(n376), .ZN(
        n379) );
  AOI22_X1 U472 ( .A1(n396), .A2(n379), .B1(dsp_out_cmp_results[32]), .B2(n386), .ZN(n385) );
  OAI22_X1 U473 ( .A1(n391), .A2(n381), .B1(n389), .B2(n380), .ZN(n383) );
  AOI22_X1 U474 ( .A1(n398), .A2(n383), .B1(dsp_in_cmp_operands[32]), .B2(n382), .ZN(n384) );
  NAND2_X1 U475 ( .A1(n385), .A2(n384), .ZN(n198) );
  AOI22_X1 U476 ( .A1(dsp_in_cmp_operands[0]), .A2(n387), .B1(
        dsp_out_cmp_results[0]), .B2(n386), .ZN(n400) );
  OAI22_X1 U477 ( .A1(n391), .A2(n390), .B1(n389), .B2(n388), .ZN(n397) );
  NOR2_X1 U478 ( .A1(dsp_in_cmp_operands[7]), .A2(MSB_stage_3[0]), .ZN(n394)
         );
  OAI22_X1 U479 ( .A1(MSB_stage_3[8]), .A2(n394), .B1(n393), .B2(n392), .ZN(
        n395) );
  AOI22_X1 U480 ( .A1(n398), .A2(n397), .B1(n396), .B2(n395), .ZN(n399) );
  NAND2_X1 U481 ( .A1(n400), .A2(n399), .ZN(n229) );
endmodule

