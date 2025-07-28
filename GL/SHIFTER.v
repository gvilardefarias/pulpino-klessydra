/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12
// Date      : Fri Jul 25 11:42:34 2025
/////////////////////////////////////////////////////////////



    module SHIFTER ( 
        clk_i, rst_ni, shifter_stage_1_en, shifter_stage_2_en, halt_dsp_lat, 
        MVTYPE_DSP, decoded_instruction_DSP_lat, recover_state_wires, shift_en, 
        dsp_in_shifter_operand, dsp_in_shift_amount, dsp_out_shifter_results
 );
  input [0:0] shifter_stage_1_en;
  input [0:0] shifter_stage_2_en;
  input [0:0] halt_dsp_lat;
  input [1:0] MVTYPE_DSP;
  input [16:0] decoded_instruction_DSP_lat;
  input [0:0] recover_state_wires;
  input [0:0] shift_en;
  input [63:0] dsp_in_shifter_operand;
  input [4:0] dsp_in_shift_amount;
  output [63:0] dsp_out_shifter_results;
  input clk_i, rst_ni;
  wire   decoded_instruction_DSP_lat_9, n708, n709, n710, n711, n712, n713,
         n714, n715, n716, n717, n718, n719, n720, n721, n722, n723, n724,
         n725, n726, n727, n728, n729, n730, n731, n732, n733, n734, n735,
         n736, n737, n738, n739, n740, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
         n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n834,
         n835, n836, n837, n838, n839, n840, n841, n842, n843, n844, n845,
         n846, n847, n848, n849, n850, n851, n852, n853, n854, n855, n856,
         n857, n858, n859, n860, n861, n862, n863, n864, n865, n866, n867,
         n868, n869, n870, n871, n872, n873, n874, n875, n876, n877, n878,
         n879, n880, n881, n882, n883, n884, n885, n886, n887, n888, n889,
         n890, n891, n892, n893, n894, n895, n896, n897, n898, n899, n900,
         n901, n902, n903, n904, n905, n906, n907, n908, n909, n910, n911,
         n912, n913, n914, n915, n916, n917, n918, n919, n920, n921, n922,
         n923, n924, n925, n926, n927, n928, n929, n930, n931, n932, n933,
         n934, n935, n936, n937, n938, n939, n940, n941, n942, n943, n944,
         n945, n946, n947, n948, n949, n950, n951, n952, n953, n954, n955,
         n956, n957, n958, n959, n960, n961, n962, n963, n964, n965, n966,
         n967, n968, n969, n970, n971, n972, n973, n974, n975, n976, n977,
         n978, n979, n980, n981, n982, n983, n984, n985, n986, n987, n988,
         n989, n990, n991, n992, n993, n994, n995, n996, n997, n998, n999,
         n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009,
         n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019,
         n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029,
         n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039,
         n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049,
         n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059,
         n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069,
         n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079,
         n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089,
         n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099,
         n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109,
         n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119,
         n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129,
         n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139,
         n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149,
         n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159,
         n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169,
         n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178, n1179,
         n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188, n1189,
         n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198, n1199,
         n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208, n1209,
         n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218, n1219,
         n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229,
         n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238, n1239,
         n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248, n1249,
         n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258, n1259,
         n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269,
         n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279,
         n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288, n1289,
         n1290, n1291, n1292, n1293, n1294, n1295, n1296, n1297, n1298, n1299,
         n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308, n1309,
         n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318, n1319,
         n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329,
         n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338, n1339,
         n1340, n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349,
         n1350, n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358, n1359,
         n1360, n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368, n1369,
         n1370, n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1378, n1379,
         n1380, n1381, n1382, n1383, n1384, n1385, n1386, n1387, n1388, n1389,
         n1390, n1391, n1392, n1393, n1394, n1395, n1396, n1397, n1398, n1399,
         n1400, n1401, n1402, n1403, n1404, n1405, n1406, n1407, n1408, n1409,
         n1410, n1411, n1412, n1413, n1414, n1415, n1416, n1417, n1418, n1419,
         n1420, n1421, n1422, n1423, n1424, n1425, n1426, n1427, n1428, n1429,
         n1430, n1431, n1432, n1433, n1434, n1435, n1436, n1437, n1438, n1439,
         n1440, n1441, n1442, n1443, n1444, n1445, n1446, n1447, n1448, n1449,
         n1450, n1451, n1452, n1453, n1454, n1455, n1456, n1457, n1458, n1459,
         n1460, n1461, n1462, n1463, n1464, n1465, n1466, n1467, n1468, n1469,
         n1470, n1471, n1472, n1473, n1474, n1475, n1476, n1477, n1478, n1479,
         n1480, n1481, n1482, n1483, n1484, n1485, n1486, n1487, n1488, n1489,
         n1490, n1491, n1492, n1493, n1494, n1495, n1496, n1497, n1498, n1499,
         n1500, n1501, n1502, n1503, n1504, n1505, n1506, n1507, n1508, n1509,
         n1510, n1511, n1512, n1513, n1514, n1515, n1516, n1517, n1518, n1519,
         n1520, n1521, n1522, n1523, n1524, n1525, n1526, n1527, n1528, n1529,
         n1530, n1531, n1532, n1533, n1534, n1535, n1536, n1537, n1538, n1539,
         n1540, n1541, n1542, n1543, n1544, n1545, n1546, n1547, n1548, n1549,
         n1550, n1551, n1552, n1553, n1554, n1555, n1556, n1557, n1558, n1559,
         n1560, n1561, n1562, n1563, n1564;
  wire   [63:0] dsp_int_shifter_operand;
  wire   [63:0] dsp_in_shifter_operand_lat;
  assign decoded_instruction_DSP_lat_9 = decoded_instruction_DSP_lat[9];

  DFFSNQ_X1 \dsp_int_shifter_operand_reg[63]  ( .D(n843), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[63]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[62]  ( .D(n842), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[62]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[61]  ( .D(n841), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[61]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[60]  ( .D(n840), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[60]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[59]  ( .D(n839), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[59]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[58]  ( .D(n838), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[58]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[57]  ( .D(n837), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[57]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[56]  ( .D(n836), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[56]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[55]  ( .D(n835), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[55]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[54]  ( .D(n834), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[54]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[53]  ( .D(n833), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[53]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[52]  ( .D(n832), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[52]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[51]  ( .D(n831), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[51]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[50]  ( .D(n830), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[50]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[49]  ( .D(n829), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[49]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[48]  ( .D(n828), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[48]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[47]  ( .D(n827), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[47]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[46]  ( .D(n826), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[46]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[45]  ( .D(n825), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[45]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[44]  ( .D(n824), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[44]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[43]  ( .D(n823), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[43]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[42]  ( .D(n822), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[42]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[41]  ( .D(n821), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[41]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[40]  ( .D(n820), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[40]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[39]  ( .D(n819), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[39]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[38]  ( .D(n818), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[38]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[37]  ( .D(n817), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[37]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[36]  ( .D(n816), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[36]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[35]  ( .D(n815), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[35]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[34]  ( .D(n814), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[34]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[33]  ( .D(n813), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[33]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[32]  ( .D(n812), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[32]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[31]  ( .D(n811), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[31]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[30]  ( .D(n810), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[30]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[29]  ( .D(n809), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[29]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[28]  ( .D(n808), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[28]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[27]  ( .D(n807), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[27]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[26]  ( .D(n806), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[26]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[25]  ( .D(n805), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[25]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[24]  ( .D(n804), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[24]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[23]  ( .D(n803), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[23]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[22]  ( .D(n802), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[22]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[21]  ( .D(n801), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[21]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[20]  ( .D(n800), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[20]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[19]  ( .D(n799), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[19]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[18]  ( .D(n798), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[18]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[17]  ( .D(n797), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[17]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[16]  ( .D(n796), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[16]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[15]  ( .D(n795), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[15]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[14]  ( .D(n794), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[14]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[13]  ( .D(n793), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[13]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[12]  ( .D(n792), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[12]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[11]  ( .D(n791), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[11]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[10]  ( .D(n790), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_int_shifter_operand[10]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[9]  ( .D(n789), .CLK(clk_i), .SN(1'b1), .Q(dsp_int_shifter_operand[9]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[8]  ( .D(n788), .CLK(clk_i), .SN(1'b1), .Q(dsp_int_shifter_operand[8]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[7]  ( .D(n787), .CLK(clk_i), .SN(1'b1), .Q(dsp_int_shifter_operand[7]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[6]  ( .D(n786), .CLK(clk_i), .SN(1'b1), .Q(dsp_int_shifter_operand[6]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[5]  ( .D(n785), .CLK(clk_i), .SN(1'b1), .Q(dsp_int_shifter_operand[5]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[4]  ( .D(n784), .CLK(clk_i), .SN(1'b1), .Q(dsp_int_shifter_operand[4]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[3]  ( .D(n783), .CLK(clk_i), .SN(1'b1), .Q(dsp_int_shifter_operand[3]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[2]  ( .D(n782), .CLK(clk_i), .SN(1'b1), .Q(dsp_int_shifter_operand[2]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[1]  ( .D(n781), .CLK(clk_i), .SN(1'b1), .Q(dsp_int_shifter_operand[1]) );
  DFFSNQ_X1 \dsp_int_shifter_operand_reg[0]  ( .D(n780), .CLK(clk_i), .SN(1'b1), .Q(dsp_int_shifter_operand[0]) );
  DFFSNQ_X1 \dsp_in_shifter_operand_lat_reg[56]  ( .D(n779), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_in_shifter_operand_lat[56]) );
  DFFSNQ_X1 \dsp_in_shifter_operand_lat_reg[48]  ( .D(n778), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_in_shifter_operand_lat[48]) );
  DFFSNQ_X1 \dsp_in_shifter_operand_lat_reg[40]  ( .D(n777), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_in_shifter_operand_lat[40]) );
  DFFSNQ_X1 \dsp_in_shifter_operand_lat_reg[32]  ( .D(n776), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_in_shifter_operand_lat[32]) );
  DFFSNQ_X1 \dsp_in_shifter_operand_lat_reg[24]  ( .D(n775), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_in_shifter_operand_lat[24]) );
  DFFSNQ_X1 \dsp_in_shifter_operand_lat_reg[16]  ( .D(n774), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_in_shifter_operand_lat[16]) );
  DFFSNQ_X1 \dsp_in_shifter_operand_lat_reg[10]  ( .D(n773), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_in_shifter_operand_lat[10]) );
  DFFSNQ_X1 \dsp_in_shifter_operand_lat_reg[0]  ( .D(n772), .CLK(clk_i), .SN(
        1'b1), .Q(dsp_in_shifter_operand_lat[0]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[63]  ( .D(n771), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[63]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[62]  ( .D(n770), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[62]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[61]  ( .D(n769), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[61]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[60]  ( .D(n768), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[60]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[59]  ( .D(n767), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[59]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[58]  ( .D(n766), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[58]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[57]  ( .D(n765), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[57]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[56]  ( .D(n764), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[56]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[55]  ( .D(n763), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[55]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[54]  ( .D(n762), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[54]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[53]  ( .D(n761), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[53]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[52]  ( .D(n760), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[52]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[51]  ( .D(n759), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[51]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[50]  ( .D(n758), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[50]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[49]  ( .D(n757), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[49]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[48]  ( .D(n756), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[48]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[47]  ( .D(n755), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[47]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[46]  ( .D(n754), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[46]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[45]  ( .D(n753), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[45]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[44]  ( .D(n752), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[44]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[43]  ( .D(n751), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[43]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[42]  ( .D(n750), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[42]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[41]  ( .D(n749), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[41]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[40]  ( .D(n748), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[40]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[39]  ( .D(n747), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[39]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[38]  ( .D(n746), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[38]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[37]  ( .D(n745), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[37]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[36]  ( .D(n744), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[36]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[35]  ( .D(n743), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[35]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[34]  ( .D(n742), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[34]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[33]  ( .D(n741), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[33]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[32]  ( .D(n740), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[32]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[31]  ( .D(n739), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[31]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[30]  ( .D(n738), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[30]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[29]  ( .D(n737), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[29]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[28]  ( .D(n736), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[28]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[27]  ( .D(n735), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[27]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[26]  ( .D(n734), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[26]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[25]  ( .D(n733), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[25]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[24]  ( .D(n732), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[24]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[23]  ( .D(n731), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[23]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[22]  ( .D(n730), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[22]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[21]  ( .D(n729), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[21]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[20]  ( .D(n728), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[20]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[19]  ( .D(n727), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[19]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[18]  ( .D(n726), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[18]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[17]  ( .D(n725), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[17]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[16]  ( .D(n724), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[16]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[15]  ( .D(n723), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[15]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[14]  ( .D(n722), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[14]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[13]  ( .D(n721), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[13]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[12]  ( .D(n720), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[12]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[11]  ( .D(n719), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[11]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[10]  ( .D(n718), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[10]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[9]  ( .D(n717), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[9]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[8]  ( .D(n716), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[8]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[7]  ( .D(n715), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[7]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[6]  ( .D(n714), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[6]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[5]  ( .D(n713), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[5]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[4]  ( .D(n712), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[4]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[3]  ( .D(n711), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[3]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[2]  ( .D(n710), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[2]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[1]  ( .D(n709), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[1]) );
  DFFRNQ_X1 \dsp_out_shifter_results_reg[0]  ( .D(n708), .CLK(clk_i), .RN(
        rst_ni), .Q(dsp_out_shifter_results[0]) );
  INV_X1 U846 ( .I(rst_ni), .ZN(n845) );
  OAI21_X1 U847 ( .A1(recover_state_wires[0]), .A2(shifter_stage_1_en[0]), .B(
        shift_en[0]), .ZN(n844) );
  NOR3_X1 U848 ( .A1(halt_dsp_lat[0]), .A2(n845), .A3(n844), .ZN(n1095) );
  INV_X1 U849 ( .I(n1095), .ZN(n872) );
  INV_X1 U850 ( .I(dsp_in_shift_amount[1]), .ZN(n1338) );
  INV_X1 U851 ( .I(dsp_in_shift_amount[0]), .ZN(n1451) );
  NOR2_X1 U852 ( .A1(n1338), .A2(n1451), .ZN(n1448) );
  OR2_X1 U853 ( .A1(dsp_in_shift_amount[1]), .A2(dsp_in_shift_amount[0]), .Z(
        n1528) );
  INV_X1 U854 ( .I(n1528), .ZN(n1068) );
  AOI22_X1 U855 ( .A1(n1448), .A2(dsp_in_shifter_operand[31]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[28]), .ZN(n847) );
  OR2_X1 U856 ( .A1(dsp_in_shift_amount[0]), .A2(n1338), .Z(n1077) );
  INV_X1 U857 ( .I(n1077), .ZN(n1088) );
  NOR2_X1 U858 ( .A1(dsp_in_shift_amount[1]), .A2(n1451), .ZN(n1087) );
  AOI22_X1 U859 ( .A1(n1088), .A2(dsp_in_shifter_operand[30]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[29]), .ZN(n846) );
  NAND2_X1 U860 ( .A1(n847), .A2(n846), .ZN(n1232) );
  INV_X1 U861 ( .I(n1232), .ZN(n853) );
  INV_X1 U862 ( .I(dsp_in_shift_amount[3]), .ZN(n1519) );
  NOR2_X1 U863 ( .A1(dsp_in_shift_amount[2]), .A2(n1519), .ZN(n955) );
  INV_X1 U864 ( .I(n955), .ZN(n1103) );
  OR2_X1 U865 ( .A1(dsp_in_shift_amount[3]), .A2(dsp_in_shift_amount[2]), .Z(
        n1274) );
  INV_X1 U866 ( .I(n1274), .ZN(n1537) );
  AOI22_X1 U867 ( .A1(n1448), .A2(dsp_in_shifter_operand[23]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[20]), .ZN(n849) );
  AOI22_X1 U868 ( .A1(n1088), .A2(dsp_in_shifter_operand[22]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[21]), .ZN(n848) );
  NAND2_X1 U869 ( .A1(n849), .A2(n848), .ZN(n1238) );
  INV_X1 U870 ( .I(dsp_in_shift_amount[2]), .ZN(n1535) );
  NOR2_X1 U871 ( .A1(dsp_in_shift_amount[3]), .A2(n1535), .ZN(n982) );
  AOI22_X1 U872 ( .A1(n1448), .A2(dsp_in_shifter_operand[27]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[24]), .ZN(n851) );
  AOI22_X1 U873 ( .A1(n1088), .A2(dsp_in_shifter_operand[26]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[25]), .ZN(n850) );
  NAND2_X1 U874 ( .A1(n851), .A2(n850), .ZN(n1234) );
  AOI22_X1 U875 ( .A1(n1537), .A2(n1238), .B1(n982), .B2(n1234), .ZN(n852) );
  OAI21_X1 U876 ( .A1(n853), .A2(n1103), .B(n852), .ZN(n1131) );
  NOR2_X1 U877 ( .A1(n872), .A2(dsp_in_shift_amount[4]), .ZN(n958) );
  AOI22_X1 U878 ( .A1(n872), .A2(dsp_int_shifter_operand[20]), .B1(n1131), 
        .B2(n958), .ZN(n854) );
  INV_X1 U879 ( .I(n854), .ZN(n800) );
  AOI22_X1 U880 ( .A1(n1087), .A2(dsp_in_shifter_operand[63]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[62]), .ZN(n945) );
  AOI22_X1 U881 ( .A1(n1448), .A2(dsp_in_shifter_operand[57]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[54]), .ZN(n856) );
  AOI22_X1 U882 ( .A1(n1088), .A2(dsp_in_shifter_operand[56]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[55]), .ZN(n855) );
  NAND2_X1 U883 ( .A1(n856), .A2(n855), .ZN(n1163) );
  AOI22_X1 U884 ( .A1(n1448), .A2(dsp_in_shifter_operand[61]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[58]), .ZN(n858) );
  AOI22_X1 U885 ( .A1(n1088), .A2(dsp_in_shifter_operand[60]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[59]), .ZN(n857) );
  NAND2_X1 U886 ( .A1(n858), .A2(n857), .ZN(n1119) );
  AOI22_X1 U887 ( .A1(n1537), .A2(n1163), .B1(n982), .B2(n1119), .ZN(n859) );
  OAI21_X1 U888 ( .A1(n945), .A2(n1103), .B(n859), .ZN(n1189) );
  AOI22_X1 U889 ( .A1(n872), .A2(dsp_int_shifter_operand[54]), .B1(n1189), 
        .B2(n958), .ZN(n860) );
  INV_X1 U890 ( .I(n860), .ZN(n834) );
  INV_X1 U891 ( .I(dsp_in_shifter_operand[63]), .ZN(n1284) );
  AOI22_X1 U892 ( .A1(n1087), .A2(dsp_in_shifter_operand[62]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[61]), .ZN(n861) );
  OAI21_X1 U893 ( .A1(n1077), .A2(n1284), .B(n861), .ZN(n1180) );
  INV_X1 U894 ( .I(n1180), .ZN(n867) );
  AOI22_X1 U895 ( .A1(n1448), .A2(dsp_in_shifter_operand[56]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[53]), .ZN(n863) );
  AOI22_X1 U896 ( .A1(n1088), .A2(dsp_in_shifter_operand[55]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[54]), .ZN(n862) );
  NAND2_X1 U897 ( .A1(n863), .A2(n862), .ZN(n1207) );
  AOI22_X1 U898 ( .A1(n1448), .A2(dsp_in_shifter_operand[60]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[57]), .ZN(n865) );
  AOI22_X1 U899 ( .A1(n1088), .A2(dsp_in_shifter_operand[59]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[58]), .ZN(n864) );
  NAND2_X1 U900 ( .A1(n865), .A2(n864), .ZN(n1181) );
  AOI22_X1 U901 ( .A1(n1537), .A2(n1207), .B1(n982), .B2(n1181), .ZN(n866) );
  OAI21_X1 U902 ( .A1(n867), .A2(n1103), .B(n866), .ZN(n1137) );
  AOI22_X1 U903 ( .A1(n872), .A2(dsp_int_shifter_operand[53]), .B1(n1137), 
        .B2(n958), .ZN(n868) );
  INV_X1 U904 ( .I(n868), .ZN(n833) );
  AOI22_X1 U905 ( .A1(n1181), .A2(n1537), .B1(n1180), .B2(n982), .ZN(n869) );
  INV_X1 U906 ( .I(n869), .ZN(n1211) );
  AOI22_X1 U907 ( .A1(n872), .A2(dsp_int_shifter_operand[57]), .B1(n1211), 
        .B2(n958), .ZN(n870) );
  INV_X1 U908 ( .I(n870), .ZN(n837) );
  INV_X1 U909 ( .I(n958), .ZN(n1106) );
  NOR2_X1 U910 ( .A1(n1274), .A2(n1106), .ZN(n1263) );
  INV_X1 U911 ( .I(dsp_in_shifter_operand[31]), .ZN(n1302) );
  NOR2_X1 U912 ( .A1(n1528), .A2(n1302), .ZN(n1104) );
  AOI22_X1 U913 ( .A1(n872), .A2(dsp_int_shifter_operand[31]), .B1(n1263), 
        .B2(n1104), .ZN(n871) );
  INV_X1 U914 ( .I(n871), .ZN(n811) );
  NOR2_X1 U915 ( .A1(n1528), .A2(n1284), .ZN(n1152) );
  AOI22_X1 U916 ( .A1(n872), .A2(dsp_int_shifter_operand[63]), .B1(n1263), 
        .B2(n1152), .ZN(n873) );
  INV_X1 U917 ( .I(n873), .ZN(n843) );
  AOI22_X1 U918 ( .A1(n1448), .A2(dsp_in_shifter_operand[63]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[60]), .ZN(n875) );
  AOI22_X1 U919 ( .A1(n1088), .A2(dsp_in_shifter_operand[62]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[61]), .ZN(n874) );
  NAND2_X1 U920 ( .A1(n875), .A2(n874), .ZN(n1226) );
  INV_X1 U921 ( .I(n1226), .ZN(n881) );
  AOI22_X1 U922 ( .A1(n1448), .A2(dsp_in_shifter_operand[55]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[52]), .ZN(n877) );
  AOI22_X1 U923 ( .A1(n1088), .A2(dsp_in_shifter_operand[54]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[53]), .ZN(n876) );
  NAND2_X1 U924 ( .A1(n877), .A2(n876), .ZN(n1225) );
  AOI22_X1 U925 ( .A1(n1448), .A2(dsp_in_shifter_operand[59]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[56]), .ZN(n879) );
  AOI22_X1 U926 ( .A1(n1088), .A2(dsp_in_shifter_operand[58]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[57]), .ZN(n878) );
  NAND2_X1 U927 ( .A1(n879), .A2(n878), .ZN(n1227) );
  AOI22_X1 U928 ( .A1(n1537), .A2(n1225), .B1(n982), .B2(n1227), .ZN(n880) );
  OAI21_X1 U929 ( .A1(n881), .A2(n1103), .B(n880), .ZN(n1143) );
  AOI22_X1 U930 ( .A1(n872), .A2(dsp_int_shifter_operand[52]), .B1(n1143), 
        .B2(n958), .ZN(n882) );
  INV_X1 U931 ( .I(n882), .ZN(n832) );
  AOI22_X1 U932 ( .A1(n1087), .A2(dsp_in_shifter_operand[30]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[29]), .ZN(n883) );
  OAI21_X1 U933 ( .A1(n1077), .A2(n1302), .B(n883), .ZN(n1202) );
  INV_X1 U934 ( .I(n1202), .ZN(n889) );
  AOI22_X1 U935 ( .A1(n1448), .A2(dsp_in_shifter_operand[24]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[21]), .ZN(n885) );
  AOI22_X1 U936 ( .A1(n1088), .A2(dsp_in_shifter_operand[23]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[22]), .ZN(n884) );
  NAND2_X1 U937 ( .A1(n885), .A2(n884), .ZN(n1256) );
  AOI22_X1 U938 ( .A1(n1448), .A2(dsp_in_shifter_operand[28]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[25]), .ZN(n887) );
  AOI22_X1 U939 ( .A1(n1088), .A2(dsp_in_shifter_operand[27]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[26]), .ZN(n886) );
  NAND2_X1 U940 ( .A1(n887), .A2(n886), .ZN(n1203) );
  AOI22_X1 U941 ( .A1(n1537), .A2(n1256), .B1(n982), .B2(n1203), .ZN(n888) );
  OAI21_X1 U942 ( .A1(n889), .A2(n1103), .B(n888), .ZN(n1159) );
  AOI22_X1 U943 ( .A1(n872), .A2(dsp_int_shifter_operand[21]), .B1(n1159), 
        .B2(n958), .ZN(n890) );
  INV_X1 U944 ( .I(n890), .ZN(n801) );
  AOI22_X1 U945 ( .A1(n1203), .A2(n1537), .B1(n1202), .B2(n982), .ZN(n891) );
  INV_X1 U946 ( .I(n891), .ZN(n1264) );
  AOI22_X1 U947 ( .A1(n872), .A2(dsp_int_shifter_operand[25]), .B1(n1264), 
        .B2(n958), .ZN(n892) );
  INV_X1 U948 ( .I(n892), .ZN(n805) );
  INV_X1 U949 ( .I(n1104), .ZN(n898) );
  AOI22_X1 U950 ( .A1(n1448), .A2(dsp_in_shifter_operand[26]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[23]), .ZN(n894) );
  AOI22_X1 U951 ( .A1(n1088), .A2(dsp_in_shifter_operand[25]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[24]), .ZN(n893) );
  NAND2_X1 U952 ( .A1(n894), .A2(n893), .ZN(n1247) );
  AOI22_X1 U953 ( .A1(n1448), .A2(dsp_in_shifter_operand[30]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[27]), .ZN(n896) );
  AOI22_X1 U954 ( .A1(n1088), .A2(dsp_in_shifter_operand[29]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[28]), .ZN(n895) );
  NAND2_X1 U955 ( .A1(n896), .A2(n895), .ZN(n1107) );
  AOI22_X1 U956 ( .A1(n1537), .A2(n1247), .B1(n982), .B2(n1107), .ZN(n897) );
  OAI21_X1 U957 ( .A1(n1103), .A2(n898), .B(n897), .ZN(n1148) );
  AOI22_X1 U958 ( .A1(n872), .A2(dsp_int_shifter_operand[23]), .B1(n1148), 
        .B2(n958), .ZN(n899) );
  INV_X1 U959 ( .I(n899), .ZN(n803) );
  AOI21_X1 U960 ( .A1(MVTYPE_DSP[1]), .A2(MVTYPE_DSP[0]), .B(n872), .ZN(n969)
         );
  INV_X1 U961 ( .I(dsp_in_shifter_operand_lat[24]), .ZN(n1336) );
  INV_X1 U962 ( .I(n969), .ZN(n1298) );
  AOI22_X1 U963 ( .A1(n969), .A2(n1302), .B1(n1336), .B2(n1298), .ZN(n775) );
  INV_X1 U964 ( .I(dsp_in_shifter_operand_lat[56]), .ZN(n1343) );
  AOI22_X1 U965 ( .A1(n969), .A2(n1284), .B1(n1343), .B2(n1298), .ZN(n779) );
  INV_X1 U966 ( .I(dsp_int_shifter_operand[22]), .ZN(n1517) );
  AOI22_X1 U967 ( .A1(n1087), .A2(dsp_in_shifter_operand[31]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[30]), .ZN(n920) );
  AOI22_X1 U968 ( .A1(n1448), .A2(dsp_in_shifter_operand[25]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[22]), .ZN(n901) );
  AOI22_X1 U969 ( .A1(n1088), .A2(dsp_in_shifter_operand[24]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[23]), .ZN(n900) );
  NAND2_X1 U970 ( .A1(n901), .A2(n900), .ZN(n1215) );
  AOI22_X1 U971 ( .A1(n1448), .A2(dsp_in_shifter_operand[29]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[26]), .ZN(n903) );
  AOI22_X1 U972 ( .A1(n1088), .A2(dsp_in_shifter_operand[28]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[27]), .ZN(n902) );
  NAND2_X1 U973 ( .A1(n903), .A2(n902), .ZN(n1113) );
  AOI22_X1 U974 ( .A1(n1537), .A2(n1215), .B1(n982), .B2(n1113), .ZN(n904) );
  OAI21_X1 U975 ( .A1(n920), .A2(n1103), .B(n904), .ZN(n1176) );
  INV_X1 U976 ( .I(n1176), .ZN(n905) );
  OAI22_X1 U977 ( .A1(n1095), .A2(n1517), .B1(n905), .B2(n1106), .ZN(n802) );
  AOI22_X1 U978 ( .A1(n1448), .A2(dsp_in_shifter_operand[51]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[48]), .ZN(n907) );
  AOI22_X1 U979 ( .A1(n1088), .A2(dsp_in_shifter_operand[50]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[49]), .ZN(n906) );
  NAND2_X1 U980 ( .A1(n907), .A2(n906), .ZN(n1224) );
  NOR2_X1 U981 ( .A1(n1519), .A2(n1535), .ZN(n1304) );
  AOI22_X1 U982 ( .A1(n1537), .A2(n1224), .B1(n1304), .B2(n1226), .ZN(n909) );
  AOI22_X1 U983 ( .A1(n955), .A2(n1227), .B1(n982), .B2(n1225), .ZN(n908) );
  NAND2_X1 U984 ( .A1(n909), .A2(n908), .ZN(n987) );
  AOI22_X1 U985 ( .A1(n987), .A2(n958), .B1(n872), .B2(
        dsp_int_shifter_operand[48]), .ZN(n910) );
  INV_X1 U986 ( .I(n910), .ZN(n828) );
  INV_X1 U987 ( .I(n1152), .ZN(n916) );
  AOI22_X1 U988 ( .A1(n1448), .A2(dsp_in_shifter_operand[58]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[55]), .ZN(n912) );
  AOI22_X1 U989 ( .A1(n1088), .A2(dsp_in_shifter_operand[57]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[56]), .ZN(n911) );
  NAND2_X1 U990 ( .A1(n912), .A2(n911), .ZN(n1193) );
  AOI22_X1 U991 ( .A1(n1448), .A2(dsp_in_shifter_operand[62]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[59]), .ZN(n914) );
  AOI22_X1 U992 ( .A1(n1088), .A2(dsp_in_shifter_operand[61]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[60]), .ZN(n913) );
  NAND2_X1 U993 ( .A1(n914), .A2(n913), .ZN(n1153) );
  AOI22_X1 U994 ( .A1(n1537), .A2(n1193), .B1(n982), .B2(n1153), .ZN(n915) );
  OAI21_X1 U995 ( .A1(n1103), .A2(n916), .B(n915), .ZN(n1125) );
  AOI22_X1 U996 ( .A1(n1125), .A2(n958), .B1(n872), .B2(
        dsp_int_shifter_operand[55]), .ZN(n917) );
  INV_X1 U997 ( .I(n917), .ZN(n835) );
  AOI22_X1 U998 ( .A1(n1448), .A2(dsp_in_shifter_operand[21]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[18]), .ZN(n919) );
  AOI22_X1 U999 ( .A1(n1088), .A2(dsp_in_shifter_operand[20]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[19]), .ZN(n918) );
  NAND2_X1 U1000 ( .A1(n919), .A2(n918), .ZN(n1216) );
  INV_X1 U1001 ( .I(n920), .ZN(n1111) );
  AOI22_X1 U1002 ( .A1(n1537), .A2(n1216), .B1(n1304), .B2(n1111), .ZN(n922)
         );
  AOI22_X1 U1003 ( .A1(n955), .A2(n1113), .B1(n982), .B2(n1215), .ZN(n921) );
  NAND2_X1 U1004 ( .A1(n922), .A2(n921), .ZN(n1073) );
  AOI22_X1 U1005 ( .A1(n1073), .A2(n958), .B1(n872), .B2(
        dsp_int_shifter_operand[18]), .ZN(n923) );
  INV_X1 U1006 ( .I(n923), .ZN(n798) );
  AOI22_X1 U1007 ( .A1(n1448), .A2(dsp_in_shifter_operand[20]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[17]), .ZN(n925) );
  AOI22_X1 U1008 ( .A1(n1088), .A2(dsp_in_shifter_operand[19]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[18]), .ZN(n924) );
  NAND2_X1 U1009 ( .A1(n925), .A2(n924), .ZN(n1258) );
  AOI22_X1 U1010 ( .A1(n1537), .A2(n1258), .B1(n1304), .B2(n1202), .ZN(n927)
         );
  AOI22_X1 U1011 ( .A1(n955), .A2(n1203), .B1(n982), .B2(n1256), .ZN(n926) );
  NAND2_X1 U1012 ( .A1(n927), .A2(n926), .ZN(n1043) );
  AOI22_X1 U1013 ( .A1(n1043), .A2(n958), .B1(n872), .B2(
        dsp_int_shifter_operand[17]), .ZN(n928) );
  INV_X1 U1014 ( .I(n928), .ZN(n797) );
  AOI22_X1 U1015 ( .A1(n1448), .A2(dsp_in_shifter_operand[22]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[19]), .ZN(n930) );
  AOI22_X1 U1016 ( .A1(n1088), .A2(dsp_in_shifter_operand[21]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[20]), .ZN(n929) );
  NAND2_X1 U1017 ( .A1(n930), .A2(n929), .ZN(n1248) );
  AOI22_X1 U1018 ( .A1(n1537), .A2(n1248), .B1(n1304), .B2(n1104), .ZN(n932)
         );
  AOI22_X1 U1019 ( .A1(n955), .A2(n1107), .B1(n982), .B2(n1247), .ZN(n931) );
  NAND2_X1 U1020 ( .A1(n932), .A2(n931), .ZN(n1001) );
  AOI22_X1 U1021 ( .A1(n1001), .A2(n958), .B1(n872), .B2(
        dsp_int_shifter_operand[19]), .ZN(n933) );
  INV_X1 U1022 ( .I(n933), .ZN(n799) );
  AOI22_X1 U1023 ( .A1(n1448), .A2(dsp_in_shifter_operand[54]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[51]), .ZN(n935) );
  AOI22_X1 U1024 ( .A1(n1088), .A2(dsp_in_shifter_operand[53]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[52]), .ZN(n934) );
  NAND2_X1 U1025 ( .A1(n935), .A2(n934), .ZN(n1194) );
  AOI22_X1 U1026 ( .A1(n1537), .A2(n1194), .B1(n1304), .B2(n1152), .ZN(n937)
         );
  AOI22_X1 U1027 ( .A1(n955), .A2(n1153), .B1(n982), .B2(n1193), .ZN(n936) );
  NAND2_X1 U1028 ( .A1(n937), .A2(n936), .ZN(n1015) );
  AOI22_X1 U1029 ( .A1(n1015), .A2(n958), .B1(n872), .B2(
        dsp_int_shifter_operand[51]), .ZN(n938) );
  INV_X1 U1030 ( .I(n938), .ZN(n831) );
  AOI22_X1 U1031 ( .A1(n1448), .A2(dsp_in_shifter_operand[19]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[16]), .ZN(n940) );
  AOI22_X1 U1032 ( .A1(n1088), .A2(dsp_in_shifter_operand[18]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[17]), .ZN(n939) );
  NAND2_X1 U1033 ( .A1(n940), .A2(n939), .ZN(n1239) );
  AOI22_X1 U1034 ( .A1(n1537), .A2(n1239), .B1(n1304), .B2(n1232), .ZN(n942)
         );
  AOI22_X1 U1035 ( .A1(n955), .A2(n1234), .B1(n982), .B2(n1238), .ZN(n941) );
  NAND2_X1 U1036 ( .A1(n942), .A2(n941), .ZN(n1029) );
  AOI22_X1 U1037 ( .A1(n1029), .A2(n958), .B1(n872), .B2(
        dsp_int_shifter_operand[16]), .ZN(n943) );
  INV_X1 U1038 ( .I(n943), .ZN(n796) );
  AOI22_X1 U1039 ( .A1(n1111), .A2(n1263), .B1(n872), .B2(
        dsp_int_shifter_operand[30]), .ZN(n944) );
  INV_X1 U1040 ( .I(n944), .ZN(n810) );
  INV_X1 U1041 ( .I(n945), .ZN(n1117) );
  AOI22_X1 U1042 ( .A1(n1117), .A2(n1263), .B1(n872), .B2(
        dsp_int_shifter_operand[62]), .ZN(n946) );
  INV_X1 U1043 ( .I(n946), .ZN(n842) );
  INV_X1 U1044 ( .I(dsp_int_shifter_operand[24]), .ZN(n947) );
  AOI22_X1 U1045 ( .A1(n1234), .A2(n1537), .B1(n1232), .B2(n982), .ZN(n1241)
         );
  OAI22_X1 U1046 ( .A1(n1095), .A2(n947), .B1(n1241), .B2(n1106), .ZN(n804) );
  AOI22_X1 U1047 ( .A1(n1448), .A2(dsp_in_shifter_operand[53]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[50]), .ZN(n949) );
  AOI22_X1 U1048 ( .A1(n1088), .A2(dsp_in_shifter_operand[52]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[51]), .ZN(n948) );
  NAND2_X1 U1049 ( .A1(n949), .A2(n948), .ZN(n1185) );
  AOI22_X1 U1050 ( .A1(n1537), .A2(n1185), .B1(n1304), .B2(n1117), .ZN(n951)
         );
  AOI22_X1 U1051 ( .A1(n955), .A2(n1119), .B1(n982), .B2(n1163), .ZN(n950) );
  NAND2_X1 U1052 ( .A1(n951), .A2(n950), .ZN(n1093) );
  AOI22_X1 U1053 ( .A1(n1093), .A2(n958), .B1(n872), .B2(
        dsp_int_shifter_operand[50]), .ZN(n952) );
  INV_X1 U1054 ( .I(n952), .ZN(n830) );
  AOI22_X1 U1055 ( .A1(n1448), .A2(dsp_in_shifter_operand[52]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[49]), .ZN(n954) );
  AOI22_X1 U1056 ( .A1(n1088), .A2(dsp_in_shifter_operand[51]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[50]), .ZN(n953) );
  NAND2_X1 U1057 ( .A1(n954), .A2(n953), .ZN(n1208) );
  AOI22_X1 U1058 ( .A1(n1537), .A2(n1208), .B1(n1304), .B2(n1180), .ZN(n957)
         );
  AOI22_X1 U1059 ( .A1(n955), .A2(n1181), .B1(n982), .B2(n1207), .ZN(n956) );
  NAND2_X1 U1060 ( .A1(n957), .A2(n956), .ZN(n1057) );
  AOI22_X1 U1061 ( .A1(n1057), .A2(n958), .B1(n872), .B2(
        dsp_int_shifter_operand[49]), .ZN(n959) );
  INV_X1 U1062 ( .I(n959), .ZN(n829) );
  INV_X1 U1063 ( .I(dsp_int_shifter_operand[27]), .ZN(n960) );
  AOI22_X1 U1064 ( .A1(n1107), .A2(n1537), .B1(n982), .B2(n1104), .ZN(n1250)
         );
  OAI22_X1 U1065 ( .A1(n1095), .A2(n960), .B1(n1250), .B2(n1106), .ZN(n807) );
  INV_X1 U1066 ( .I(dsp_int_shifter_operand[56]), .ZN(n961) );
  AOI22_X1 U1067 ( .A1(n1227), .A2(n1537), .B1(n1226), .B2(n982), .ZN(n1169)
         );
  OAI22_X1 U1068 ( .A1(n1095), .A2(n961), .B1(n1169), .B2(n1106), .ZN(n836) );
  AOI22_X1 U1069 ( .A1(n1202), .A2(n1263), .B1(n872), .B2(
        dsp_int_shifter_operand[29]), .ZN(n962) );
  INV_X1 U1070 ( .I(n962), .ZN(n809) );
  INV_X1 U1071 ( .I(dsp_int_shifter_operand[26]), .ZN(n963) );
  AOI22_X1 U1072 ( .A1(n1113), .A2(n1537), .B1(n1111), .B2(n982), .ZN(n1218)
         );
  OAI22_X1 U1073 ( .A1(n1095), .A2(n963), .B1(n1218), .B2(n1106), .ZN(n806) );
  AOI22_X1 U1074 ( .A1(n1180), .A2(n1263), .B1(n872), .B2(
        dsp_int_shifter_operand[61]), .ZN(n964) );
  INV_X1 U1075 ( .I(n964), .ZN(n841) );
  INV_X1 U1076 ( .I(dsp_int_shifter_operand[58]), .ZN(n965) );
  AOI22_X1 U1077 ( .A1(n1119), .A2(n1537), .B1(n1117), .B2(n982), .ZN(n1164)
         );
  OAI22_X1 U1078 ( .A1(n1095), .A2(n965), .B1(n1164), .B2(n1106), .ZN(n838) );
  AOI22_X1 U1079 ( .A1(n1226), .A2(n1263), .B1(n872), .B2(
        dsp_int_shifter_operand[60]), .ZN(n966) );
  INV_X1 U1080 ( .I(n966), .ZN(n840) );
  AOI22_X1 U1081 ( .A1(n1232), .A2(n1263), .B1(n872), .B2(
        dsp_int_shifter_operand[28]), .ZN(n967) );
  INV_X1 U1082 ( .I(n967), .ZN(n808) );
  INV_X1 U1083 ( .I(dsp_int_shifter_operand[59]), .ZN(n968) );
  AOI22_X1 U1084 ( .A1(n1153), .A2(n1537), .B1(n982), .B2(n1152), .ZN(n1196)
         );
  OAI22_X1 U1085 ( .A1(n1095), .A2(n968), .B1(n1196), .B2(n1106), .ZN(n839) );
  INV_X1 U1086 ( .I(MVTYPE_DSP[1]), .ZN(n1294) );
  INV_X1 U1087 ( .I(MVTYPE_DSP[0]), .ZN(n1285) );
  NAND2_X1 U1088 ( .A1(n1294), .A2(n1285), .ZN(n1275) );
  NOR2_X1 U1089 ( .A1(n872), .A2(n1275), .ZN(n1299) );
  AOI22_X1 U1090 ( .A1(dsp_in_shifter_operand[47]), .A2(n1299), .B1(
        dsp_in_shifter_operand_lat[40]), .B2(n1298), .ZN(n971) );
  INV_X1 U1091 ( .I(dsp_in_shifter_operand[47]), .ZN(n1082) );
  AOI22_X1 U1092 ( .A1(n1284), .A2(n1285), .B1(n1082), .B2(MVTYPE_DSP[0]), 
        .ZN(n970) );
  NAND2_X1 U1093 ( .A1(n969), .A2(n1275), .ZN(n1301) );
  INV_X1 U1094 ( .I(n1301), .ZN(n972) );
  NAND2_X1 U1095 ( .A1(n970), .A2(n972), .ZN(n1098) );
  NAND2_X1 U1096 ( .A1(n971), .A2(n1098), .ZN(n777) );
  AOI22_X1 U1097 ( .A1(dsp_in_shifter_operand[15]), .A2(n1299), .B1(
        dsp_in_shifter_operand_lat[10]), .B2(n1298), .ZN(n974) );
  INV_X1 U1098 ( .I(dsp_in_shifter_operand[15]), .ZN(n1064) );
  AOI22_X1 U1099 ( .A1(n1302), .A2(n1285), .B1(n1064), .B2(MVTYPE_DSP[0]), 
        .ZN(n973) );
  NAND2_X1 U1100 ( .A1(n973), .A2(n972), .ZN(n1100) );
  NAND2_X1 U1101 ( .A1(n974), .A2(n1100), .ZN(n773) );
  INV_X1 U1102 ( .I(n1448), .ZN(n1494) );
  OAI22_X1 U1103 ( .A1(dsp_in_shifter_operand[35]), .A2(n1494), .B1(
        dsp_in_shifter_operand[32]), .B2(n1528), .ZN(n976) );
  INV_X1 U1104 ( .I(n1087), .ZN(n1083) );
  OAI22_X1 U1105 ( .A1(dsp_in_shifter_operand[34]), .A2(n1077), .B1(
        dsp_in_shifter_operand[33]), .B2(n1083), .ZN(n975) );
  NOR2_X1 U1106 ( .A1(dsp_in_shift_amount[4]), .A2(n1274), .ZN(n1334) );
  OAI21_X1 U1107 ( .A1(n976), .A2(n975), .B(n1334), .ZN(n977) );
  NAND2_X1 U1108 ( .A1(n977), .A2(n1095), .ZN(n989) );
  AOI22_X1 U1109 ( .A1(n1087), .A2(dsp_in_shifter_operand[45]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[44]), .ZN(n978) );
  OAI21_X1 U1110 ( .A1(n1494), .A2(n1082), .B(n978), .ZN(n979) );
  AOI21_X1 U1111 ( .A1(n1088), .A2(dsp_in_shifter_operand[46]), .B(n979), .ZN(
        n1141) );
  AOI22_X1 U1112 ( .A1(n1448), .A2(dsp_in_shifter_operand[43]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[40]), .ZN(n981) );
  AOI22_X1 U1113 ( .A1(n1088), .A2(dsp_in_shifter_operand[42]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[41]), .ZN(n980) );
  NAND2_X1 U1114 ( .A1(n981), .A2(n980), .ZN(n1170) );
  INV_X1 U1115 ( .I(n982), .ZN(n1102) );
  AOI22_X1 U1116 ( .A1(dsp_in_shifter_operand[36]), .A2(n1068), .B1(n1448), 
        .B2(dsp_in_shifter_operand[39]), .ZN(n984) );
  AOI22_X1 U1117 ( .A1(n1088), .A2(dsp_in_shifter_operand[38]), .B1(
        dsp_in_shifter_operand[37]), .B2(n1087), .ZN(n983) );
  NAND2_X1 U1118 ( .A1(n984), .A2(n983), .ZN(n1142) );
  OAI22_X1 U1119 ( .A1(n1103), .A2(n1170), .B1(n1102), .B2(n1142), .ZN(n985)
         );
  AOI21_X1 U1120 ( .A1(n1304), .A2(n1141), .B(n985), .ZN(n986) );
  INV_X1 U1121 ( .I(dsp_in_shift_amount[4]), .ZN(n1355) );
  AOI22_X1 U1122 ( .A1(dsp_in_shift_amount[4]), .A2(n987), .B1(n986), .B2(
        n1355), .ZN(n988) );
  INV_X1 U1123 ( .I(dsp_int_shifter_operand[32]), .ZN(n1440) );
  OAI22_X1 U1124 ( .A1(n989), .A2(n988), .B1(n1095), .B2(n1440), .ZN(n812) );
  OAI22_X1 U1125 ( .A1(dsp_in_shifter_operand[6]), .A2(n1494), .B1(
        dsp_in_shifter_operand[3]), .B2(n1528), .ZN(n991) );
  OAI22_X1 U1126 ( .A1(dsp_in_shifter_operand[5]), .A2(n1077), .B1(
        dsp_in_shifter_operand[4]), .B2(n1083), .ZN(n990) );
  OAI21_X1 U1127 ( .A1(n991), .A2(n990), .B(n1334), .ZN(n992) );
  NAND2_X1 U1128 ( .A1(n992), .A2(n1095), .ZN(n1003) );
  AOI22_X1 U1129 ( .A1(n1087), .A2(dsp_in_shifter_operand[16]), .B1(n1448), 
        .B2(dsp_in_shifter_operand[18]), .ZN(n993) );
  OAI21_X1 U1130 ( .A1(n1528), .A2(n1064), .B(n993), .ZN(n994) );
  AOI21_X1 U1131 ( .A1(n1088), .A2(dsp_in_shifter_operand[17]), .B(n994), .ZN(
        n1105) );
  AOI22_X1 U1132 ( .A1(n1448), .A2(dsp_in_shifter_operand[14]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[11]), .ZN(n996) );
  AOI22_X1 U1133 ( .A1(n1088), .A2(dsp_in_shifter_operand[13]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[12]), .ZN(n995) );
  NAND2_X1 U1134 ( .A1(n996), .A2(n995), .ZN(n1251) );
  AOI22_X1 U1135 ( .A1(n1448), .A2(dsp_in_shifter_operand[10]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[7]), .ZN(n998) );
  AOI22_X1 U1136 ( .A1(n1088), .A2(dsp_in_shifter_operand[9]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[8]), .ZN(n997) );
  NAND2_X1 U1137 ( .A1(n998), .A2(n997), .ZN(n1147) );
  OAI22_X1 U1138 ( .A1(n1103), .A2(n1251), .B1(n1102), .B2(n1147), .ZN(n999)
         );
  AOI21_X1 U1139 ( .A1(n1304), .A2(n1105), .B(n999), .ZN(n1000) );
  AOI22_X1 U1140 ( .A1(dsp_in_shift_amount[4]), .A2(n1001), .B1(n1000), .B2(
        n1355), .ZN(n1002) );
  INV_X1 U1141 ( .I(dsp_int_shifter_operand[3]), .ZN(n1414) );
  OAI22_X1 U1142 ( .A1(n1003), .A2(n1002), .B1(n1095), .B2(n1414), .ZN(n783)
         );
  OAI22_X1 U1143 ( .A1(dsp_in_shifter_operand[38]), .A2(n1494), .B1(
        dsp_in_shifter_operand[35]), .B2(n1528), .ZN(n1005) );
  OAI22_X1 U1144 ( .A1(dsp_in_shifter_operand[37]), .A2(n1077), .B1(
        dsp_in_shifter_operand[36]), .B2(n1083), .ZN(n1004) );
  OAI21_X1 U1145 ( .A1(n1005), .A2(n1004), .B(n1334), .ZN(n1006) );
  NAND2_X1 U1146 ( .A1(n1006), .A2(n1095), .ZN(n1017) );
  AOI22_X1 U1147 ( .A1(n1087), .A2(dsp_in_shifter_operand[48]), .B1(n1448), 
        .B2(dsp_in_shifter_operand[50]), .ZN(n1007) );
  OAI21_X1 U1148 ( .A1(n1528), .A2(n1082), .B(n1007), .ZN(n1008) );
  AOI21_X1 U1149 ( .A1(n1088), .A2(dsp_in_shifter_operand[49]), .B(n1008), 
        .ZN(n1123) );
  AOI22_X1 U1150 ( .A1(n1448), .A2(dsp_in_shifter_operand[46]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[43]), .ZN(n1010) );
  AOI22_X1 U1151 ( .A1(n1088), .A2(dsp_in_shifter_operand[45]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[44]), .ZN(n1009) );
  NAND2_X1 U1152 ( .A1(n1010), .A2(n1009), .ZN(n1197) );
  AOI22_X1 U1153 ( .A1(n1448), .A2(dsp_in_shifter_operand[42]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[39]), .ZN(n1012) );
  AOI22_X1 U1154 ( .A1(n1088), .A2(dsp_in_shifter_operand[41]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[40]), .ZN(n1011) );
  NAND2_X1 U1155 ( .A1(n1012), .A2(n1011), .ZN(n1124) );
  OAI22_X1 U1156 ( .A1(n1103), .A2(n1197), .B1(n1102), .B2(n1124), .ZN(n1013)
         );
  AOI21_X1 U1157 ( .A1(n1304), .A2(n1123), .B(n1013), .ZN(n1014) );
  AOI22_X1 U1158 ( .A1(dsp_in_shift_amount[4]), .A2(n1015), .B1(n1014), .B2(
        n1355), .ZN(n1016) );
  INV_X1 U1159 ( .I(dsp_int_shifter_operand[35]), .ZN(n1410) );
  OAI22_X1 U1160 ( .A1(n1017), .A2(n1016), .B1(n1095), .B2(n1410), .ZN(n815)
         );
  OAI22_X1 U1161 ( .A1(dsp_in_shifter_operand[3]), .A2(n1494), .B1(
        dsp_in_shifter_operand[0]), .B2(n1528), .ZN(n1019) );
  OAI22_X1 U1162 ( .A1(dsp_in_shifter_operand[2]), .A2(n1077), .B1(
        dsp_in_shifter_operand[1]), .B2(n1083), .ZN(n1018) );
  OAI21_X1 U1163 ( .A1(n1019), .A2(n1018), .B(n1334), .ZN(n1020) );
  NAND2_X1 U1164 ( .A1(n1020), .A2(n1095), .ZN(n1031) );
  AOI22_X1 U1165 ( .A1(n1087), .A2(dsp_in_shifter_operand[13]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[12]), .ZN(n1021) );
  OAI21_X1 U1166 ( .A1(n1494), .A2(n1064), .B(n1021), .ZN(n1022) );
  AOI21_X1 U1167 ( .A1(n1088), .A2(dsp_in_shifter_operand[14]), .B(n1022), 
        .ZN(n1129) );
  AOI22_X1 U1168 ( .A1(n1448), .A2(dsp_in_shifter_operand[11]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[8]), .ZN(n1024) );
  AOI22_X1 U1169 ( .A1(n1088), .A2(dsp_in_shifter_operand[10]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[9]), .ZN(n1023) );
  NAND2_X1 U1170 ( .A1(n1024), .A2(n1023), .ZN(n1242) );
  AOI22_X1 U1171 ( .A1(n1448), .A2(dsp_in_shifter_operand[7]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[4]), .ZN(n1026) );
  AOI22_X1 U1172 ( .A1(n1088), .A2(dsp_in_shifter_operand[6]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[5]), .ZN(n1025) );
  NAND2_X1 U1173 ( .A1(n1026), .A2(n1025), .ZN(n1130) );
  OAI22_X1 U1174 ( .A1(n1103), .A2(n1242), .B1(n1102), .B2(n1130), .ZN(n1027)
         );
  AOI21_X1 U1175 ( .A1(n1304), .A2(n1129), .B(n1027), .ZN(n1028) );
  AOI22_X1 U1176 ( .A1(dsp_in_shift_amount[4]), .A2(n1029), .B1(n1028), .B2(
        n1355), .ZN(n1030) );
  INV_X1 U1177 ( .I(dsp_int_shifter_operand[0]), .ZN(n1435) );
  OAI22_X1 U1178 ( .A1(n1031), .A2(n1030), .B1(n1095), .B2(n1435), .ZN(n780)
         );
  OAI22_X1 U1179 ( .A1(dsp_in_shifter_operand[4]), .A2(n1494), .B1(
        dsp_in_shifter_operand[1]), .B2(n1528), .ZN(n1033) );
  OAI22_X1 U1180 ( .A1(dsp_in_shifter_operand[3]), .A2(n1077), .B1(
        dsp_in_shifter_operand[2]), .B2(n1083), .ZN(n1032) );
  OAI21_X1 U1181 ( .A1(n1033), .A2(n1032), .B(n1334), .ZN(n1034) );
  NAND2_X1 U1182 ( .A1(n1034), .A2(n1095), .ZN(n1045) );
  AOI22_X1 U1183 ( .A1(n1448), .A2(dsp_in_shifter_operand[16]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[13]), .ZN(n1035) );
  OAI21_X1 U1184 ( .A1(n1077), .A2(n1064), .B(n1035), .ZN(n1036) );
  AOI21_X1 U1185 ( .A1(n1087), .A2(dsp_in_shifter_operand[14]), .B(n1036), 
        .ZN(n1157) );
  AOI22_X1 U1186 ( .A1(n1448), .A2(dsp_in_shifter_operand[12]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[9]), .ZN(n1038) );
  AOI22_X1 U1187 ( .A1(n1088), .A2(dsp_in_shifter_operand[11]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[10]), .ZN(n1037) );
  NAND2_X1 U1188 ( .A1(n1038), .A2(n1037), .ZN(n1262) );
  AOI22_X1 U1189 ( .A1(n1448), .A2(dsp_in_shifter_operand[8]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[5]), .ZN(n1040) );
  AOI22_X1 U1190 ( .A1(n1088), .A2(dsp_in_shifter_operand[7]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[6]), .ZN(n1039) );
  NAND2_X1 U1191 ( .A1(n1040), .A2(n1039), .ZN(n1158) );
  OAI22_X1 U1192 ( .A1(n1103), .A2(n1262), .B1(n1102), .B2(n1158), .ZN(n1041)
         );
  AOI21_X1 U1193 ( .A1(n1304), .A2(n1157), .B(n1041), .ZN(n1042) );
  AOI22_X1 U1194 ( .A1(dsp_in_shift_amount[4]), .A2(n1043), .B1(n1042), .B2(
        n1355), .ZN(n1044) );
  INV_X1 U1195 ( .I(dsp_int_shifter_operand[1]), .ZN(n1417) );
  OAI22_X1 U1196 ( .A1(n1045), .A2(n1044), .B1(n1095), .B2(n1417), .ZN(n781)
         );
  OAI22_X1 U1197 ( .A1(dsp_in_shifter_operand[36]), .A2(n1494), .B1(
        dsp_in_shifter_operand[33]), .B2(n1528), .ZN(n1047) );
  OAI22_X1 U1198 ( .A1(dsp_in_shifter_operand[35]), .A2(n1077), .B1(
        dsp_in_shifter_operand[34]), .B2(n1083), .ZN(n1046) );
  OAI21_X1 U1199 ( .A1(n1047), .A2(n1046), .B(n1334), .ZN(n1048) );
  NAND2_X1 U1200 ( .A1(n1048), .A2(n1095), .ZN(n1059) );
  AOI22_X1 U1201 ( .A1(n1448), .A2(dsp_in_shifter_operand[48]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[45]), .ZN(n1049) );
  OAI21_X1 U1202 ( .A1(n1077), .A2(n1082), .B(n1049), .ZN(n1050) );
  AOI21_X1 U1203 ( .A1(n1087), .A2(dsp_in_shifter_operand[46]), .B(n1050), 
        .ZN(n1135) );
  AOI22_X1 U1204 ( .A1(n1448), .A2(dsp_in_shifter_operand[44]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[41]), .ZN(n1052) );
  AOI22_X1 U1205 ( .A1(n1088), .A2(dsp_in_shifter_operand[43]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[42]), .ZN(n1051) );
  NAND2_X1 U1206 ( .A1(n1052), .A2(n1051), .ZN(n1210) );
  AOI22_X1 U1207 ( .A1(dsp_in_shifter_operand[37]), .A2(n1068), .B1(n1448), 
        .B2(dsp_in_shifter_operand[40]), .ZN(n1054) );
  AOI22_X1 U1208 ( .A1(n1088), .A2(dsp_in_shifter_operand[39]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[38]), .ZN(n1053) );
  NAND2_X1 U1209 ( .A1(n1054), .A2(n1053), .ZN(n1136) );
  OAI22_X1 U1210 ( .A1(n1103), .A2(n1210), .B1(n1102), .B2(n1136), .ZN(n1055)
         );
  AOI21_X1 U1211 ( .A1(n1304), .A2(n1135), .B(n1055), .ZN(n1056) );
  AOI22_X1 U1212 ( .A1(dsp_in_shift_amount[4]), .A2(n1057), .B1(n1056), .B2(
        n1355), .ZN(n1058) );
  INV_X1 U1213 ( .I(dsp_int_shifter_operand[33]), .ZN(n1420) );
  OAI22_X1 U1214 ( .A1(n1059), .A2(n1058), .B1(n1095), .B2(n1420), .ZN(n813)
         );
  OAI22_X1 U1215 ( .A1(dsp_in_shifter_operand[5]), .A2(n1494), .B1(
        dsp_in_shifter_operand[2]), .B2(n1528), .ZN(n1061) );
  OAI22_X1 U1216 ( .A1(dsp_in_shifter_operand[4]), .A2(n1077), .B1(
        dsp_in_shifter_operand[3]), .B2(n1083), .ZN(n1060) );
  OAI21_X1 U1217 ( .A1(n1061), .A2(n1060), .B(n1334), .ZN(n1062) );
  NAND2_X1 U1218 ( .A1(n1062), .A2(n1095), .ZN(n1076) );
  AOI22_X1 U1219 ( .A1(n1448), .A2(dsp_in_shifter_operand[17]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[14]), .ZN(n1063) );
  OAI21_X1 U1220 ( .A1(n1083), .A2(n1064), .B(n1063), .ZN(n1065) );
  AOI21_X1 U1221 ( .A1(n1088), .A2(dsp_in_shifter_operand[16]), .B(n1065), 
        .ZN(n1112) );
  AOI22_X1 U1222 ( .A1(n1448), .A2(dsp_in_shifter_operand[13]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[10]), .ZN(n1067) );
  AOI22_X1 U1223 ( .A1(n1088), .A2(dsp_in_shifter_operand[12]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[11]), .ZN(n1066) );
  NAND2_X1 U1224 ( .A1(n1067), .A2(n1066), .ZN(n1219) );
  AOI22_X1 U1225 ( .A1(n1448), .A2(dsp_in_shifter_operand[9]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[6]), .ZN(n1070) );
  AOI22_X1 U1226 ( .A1(n1088), .A2(dsp_in_shifter_operand[8]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[7]), .ZN(n1069) );
  NAND2_X1 U1227 ( .A1(n1070), .A2(n1069), .ZN(n1175) );
  OAI22_X1 U1228 ( .A1(n1103), .A2(n1219), .B1(n1102), .B2(n1175), .ZN(n1071)
         );
  AOI21_X1 U1229 ( .A1(n1304), .A2(n1112), .B(n1071), .ZN(n1072) );
  AOI22_X1 U1230 ( .A1(dsp_in_shift_amount[4]), .A2(n1073), .B1(n1072), .B2(
        n1355), .ZN(n1075) );
  INV_X1 U1231 ( .I(dsp_int_shifter_operand[2]), .ZN(n1074) );
  OAI22_X1 U1232 ( .A1(n1076), .A2(n1075), .B1(n1095), .B2(n1074), .ZN(n782)
         );
  OAI22_X1 U1233 ( .A1(dsp_in_shifter_operand[37]), .A2(n1494), .B1(
        dsp_in_shifter_operand[34]), .B2(n1528), .ZN(n1079) );
  OAI22_X1 U1234 ( .A1(dsp_in_shifter_operand[36]), .A2(n1077), .B1(
        dsp_in_shifter_operand[35]), .B2(n1083), .ZN(n1078) );
  OAI21_X1 U1235 ( .A1(n1079), .A2(n1078), .B(n1334), .ZN(n1080) );
  NAND2_X1 U1236 ( .A1(n1080), .A2(n1095), .ZN(n1097) );
  AOI22_X1 U1237 ( .A1(n1448), .A2(dsp_in_shifter_operand[49]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[46]), .ZN(n1081) );
  OAI21_X1 U1238 ( .A1(n1083), .A2(n1082), .B(n1081), .ZN(n1084) );
  AOI21_X1 U1239 ( .A1(n1088), .A2(dsp_in_shifter_operand[48]), .B(n1084), 
        .ZN(n1118) );
  AOI22_X1 U1240 ( .A1(n1448), .A2(dsp_in_shifter_operand[45]), .B1(n1068), 
        .B2(dsp_in_shifter_operand[42]), .ZN(n1086) );
  AOI22_X1 U1241 ( .A1(n1088), .A2(dsp_in_shifter_operand[44]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[43]), .ZN(n1085) );
  NAND2_X1 U1242 ( .A1(n1086), .A2(n1085), .ZN(n1187) );
  AOI22_X1 U1243 ( .A1(n1448), .A2(dsp_in_shifter_operand[41]), .B1(
        dsp_in_shifter_operand[38]), .B2(n1068), .ZN(n1090) );
  AOI22_X1 U1244 ( .A1(n1088), .A2(dsp_in_shifter_operand[40]), .B1(n1087), 
        .B2(dsp_in_shifter_operand[39]), .ZN(n1089) );
  NAND2_X1 U1245 ( .A1(n1090), .A2(n1089), .ZN(n1188) );
  OAI22_X1 U1246 ( .A1(n1103), .A2(n1187), .B1(n1102), .B2(n1188), .ZN(n1091)
         );
  AOI21_X1 U1247 ( .A1(n1304), .A2(n1118), .B(n1091), .ZN(n1092) );
  AOI22_X1 U1248 ( .A1(dsp_in_shift_amount[4]), .A2(n1093), .B1(n1092), .B2(
        n1355), .ZN(n1096) );
  INV_X1 U1249 ( .I(dsp_int_shifter_operand[34]), .ZN(n1094) );
  OAI22_X1 U1250 ( .A1(n1097), .A2(n1096), .B1(n1095), .B2(n1094), .ZN(n814)
         );
  AOI22_X1 U1251 ( .A1(dsp_in_shifter_operand[39]), .A2(n1299), .B1(
        dsp_in_shifter_operand_lat[32]), .B2(n1298), .ZN(n1099) );
  NAND2_X1 U1252 ( .A1(n1099), .A2(n1098), .ZN(n776) );
  AOI22_X1 U1253 ( .A1(dsp_in_shifter_operand[7]), .A2(n1299), .B1(
        dsp_in_shifter_operand_lat[0]), .B2(n1298), .ZN(n1101) );
  NAND2_X1 U1254 ( .A1(n1101), .A2(n1100), .ZN(n772) );
  NOR2_X1 U1255 ( .A1(n1102), .A2(n1106), .ZN(n1261) );
  AOI22_X1 U1256 ( .A1(n1261), .A2(n1248), .B1(dsp_int_shifter_operand[15]), 
        .B2(n872), .ZN(n1110) );
  NOR2_X1 U1257 ( .A1(n872), .A2(n1355), .ZN(n1265) );
  AND2_X1 U1258 ( .A1(n1537), .A2(n1265), .Z(n1233) );
  NOR2_X1 U1259 ( .A1(n1103), .A2(n1106), .ZN(n1259) );
  AOI22_X1 U1260 ( .A1(n1233), .A2(n1104), .B1(n1259), .B2(n1247), .ZN(n1109)
         );
  INV_X1 U1261 ( .I(n1105), .ZN(n1249) );
  INV_X1 U1262 ( .I(n1304), .ZN(n1318) );
  NOR2_X1 U1263 ( .A1(n1318), .A2(n1106), .ZN(n1257) );
  AOI22_X1 U1264 ( .A1(n1263), .A2(n1249), .B1(n1257), .B2(n1107), .ZN(n1108)
         );
  NAND3_X1 U1265 ( .A1(n1110), .A2(n1109), .A3(n1108), .ZN(n795) );
  AOI22_X1 U1266 ( .A1(n1261), .A2(n1216), .B1(dsp_int_shifter_operand[14]), 
        .B2(n872), .ZN(n1116) );
  AOI22_X1 U1267 ( .A1(n1233), .A2(n1111), .B1(n1259), .B2(n1215), .ZN(n1115)
         );
  INV_X1 U1268 ( .I(n1112), .ZN(n1217) );
  AOI22_X1 U1269 ( .A1(n1263), .A2(n1217), .B1(n1257), .B2(n1113), .ZN(n1114)
         );
  NAND3_X1 U1270 ( .A1(n1116), .A2(n1115), .A3(n1114), .ZN(n794) );
  AOI22_X1 U1271 ( .A1(n1261), .A2(n1185), .B1(dsp_int_shifter_operand[46]), 
        .B2(n872), .ZN(n1122) );
  AOI22_X1 U1272 ( .A1(n1233), .A2(n1117), .B1(n1259), .B2(n1163), .ZN(n1121)
         );
  INV_X1 U1273 ( .I(n1118), .ZN(n1186) );
  AOI22_X1 U1274 ( .A1(n1263), .A2(n1186), .B1(n1257), .B2(n1119), .ZN(n1120)
         );
  NAND3_X1 U1275 ( .A1(n1122), .A2(n1121), .A3(n1120), .ZN(n826) );
  AOI22_X1 U1276 ( .A1(n1257), .A2(n1194), .B1(dsp_int_shifter_operand[39]), 
        .B2(n872), .ZN(n1128) );
  INV_X1 U1277 ( .I(n1123), .ZN(n1195) );
  AOI22_X1 U1278 ( .A1(n1261), .A2(n1197), .B1(n1259), .B2(n1195), .ZN(n1127)
         );
  AOI22_X1 U1279 ( .A1(n1265), .A2(n1125), .B1(n1263), .B2(n1124), .ZN(n1126)
         );
  NAND3_X1 U1280 ( .A1(n1128), .A2(n1127), .A3(n1126), .ZN(n819) );
  AOI22_X1 U1281 ( .A1(n1257), .A2(n1239), .B1(dsp_int_shifter_operand[4]), 
        .B2(n872), .ZN(n1134) );
  INV_X1 U1282 ( .I(n1129), .ZN(n1240) );
  AOI22_X1 U1283 ( .A1(n1261), .A2(n1242), .B1(n1259), .B2(n1240), .ZN(n1133)
         );
  AOI22_X1 U1284 ( .A1(n1265), .A2(n1131), .B1(n1263), .B2(n1130), .ZN(n1132)
         );
  NAND3_X1 U1285 ( .A1(n1134), .A2(n1133), .A3(n1132), .ZN(n784) );
  AOI22_X1 U1286 ( .A1(n1257), .A2(n1208), .B1(dsp_int_shifter_operand[37]), 
        .B2(n872), .ZN(n1140) );
  INV_X1 U1287 ( .I(n1135), .ZN(n1209) );
  AOI22_X1 U1288 ( .A1(n1261), .A2(n1210), .B1(n1259), .B2(n1209), .ZN(n1139)
         );
  AOI22_X1 U1289 ( .A1(n1265), .A2(n1137), .B1(n1263), .B2(n1136), .ZN(n1138)
         );
  NAND3_X1 U1290 ( .A1(n1140), .A2(n1139), .A3(n1138), .ZN(n817) );
  AOI22_X1 U1291 ( .A1(n1257), .A2(n1224), .B1(dsp_int_shifter_operand[36]), 
        .B2(n872), .ZN(n1146) );
  INV_X1 U1292 ( .I(n1141), .ZN(n1228) );
  AOI22_X1 U1293 ( .A1(n1261), .A2(n1170), .B1(n1259), .B2(n1228), .ZN(n1145)
         );
  AOI22_X1 U1294 ( .A1(n1265), .A2(n1143), .B1(n1263), .B2(n1142), .ZN(n1144)
         );
  NAND3_X1 U1295 ( .A1(n1146), .A2(n1145), .A3(n1144), .ZN(n816) );
  AOI22_X1 U1296 ( .A1(n1257), .A2(n1248), .B1(dsp_int_shifter_operand[7]), 
        .B2(n872), .ZN(n1151) );
  AOI22_X1 U1297 ( .A1(n1261), .A2(n1251), .B1(n1259), .B2(n1249), .ZN(n1150)
         );
  AOI22_X1 U1298 ( .A1(n1265), .A2(n1148), .B1(n1263), .B2(n1147), .ZN(n1149)
         );
  NAND3_X1 U1299 ( .A1(n1151), .A2(n1150), .A3(n1149), .ZN(n787) );
  AOI22_X1 U1300 ( .A1(n1261), .A2(n1194), .B1(dsp_int_shifter_operand[47]), 
        .B2(n872), .ZN(n1156) );
  AOI22_X1 U1301 ( .A1(n1233), .A2(n1152), .B1(n1259), .B2(n1193), .ZN(n1155)
         );
  AOI22_X1 U1302 ( .A1(n1263), .A2(n1195), .B1(n1257), .B2(n1153), .ZN(n1154)
         );
  NAND3_X1 U1303 ( .A1(n1156), .A2(n1155), .A3(n1154), .ZN(n827) );
  AOI22_X1 U1304 ( .A1(n1257), .A2(n1258), .B1(dsp_int_shifter_operand[5]), 
        .B2(n872), .ZN(n1162) );
  INV_X1 U1305 ( .I(n1157), .ZN(n1260) );
  AOI22_X1 U1306 ( .A1(n1261), .A2(n1262), .B1(n1259), .B2(n1260), .ZN(n1161)
         );
  AOI22_X1 U1307 ( .A1(n1265), .A2(n1159), .B1(n1263), .B2(n1158), .ZN(n1160)
         );
  NAND3_X1 U1308 ( .A1(n1162), .A2(n1161), .A3(n1160), .ZN(n785) );
  AOI22_X1 U1309 ( .A1(n1257), .A2(n1163), .B1(dsp_int_shifter_operand[42]), 
        .B2(n872), .ZN(n1168) );
  AOI22_X1 U1310 ( .A1(n1261), .A2(n1186), .B1(n1259), .B2(n1185), .ZN(n1167)
         );
  INV_X1 U1311 ( .I(n1164), .ZN(n1165) );
  AOI22_X1 U1312 ( .A1(n1265), .A2(n1165), .B1(n1263), .B2(n1187), .ZN(n1166)
         );
  NAND3_X1 U1313 ( .A1(n1168), .A2(n1167), .A3(n1166), .ZN(n822) );
  AOI22_X1 U1314 ( .A1(n1257), .A2(n1225), .B1(dsp_int_shifter_operand[40]), 
        .B2(n872), .ZN(n1174) );
  AOI22_X1 U1315 ( .A1(n1261), .A2(n1228), .B1(n1259), .B2(n1224), .ZN(n1173)
         );
  INV_X1 U1316 ( .I(n1169), .ZN(n1171) );
  AOI22_X1 U1317 ( .A1(n1265), .A2(n1171), .B1(n1263), .B2(n1170), .ZN(n1172)
         );
  NAND3_X1 U1318 ( .A1(n1174), .A2(n1173), .A3(n1172), .ZN(n820) );
  AOI22_X1 U1319 ( .A1(n1257), .A2(n1216), .B1(dsp_int_shifter_operand[6]), 
        .B2(n872), .ZN(n1179) );
  AOI22_X1 U1320 ( .A1(n1261), .A2(n1219), .B1(n1259), .B2(n1217), .ZN(n1178)
         );
  AOI22_X1 U1321 ( .A1(n1265), .A2(n1176), .B1(n1263), .B2(n1175), .ZN(n1177)
         );
  NAND3_X1 U1322 ( .A1(n1179), .A2(n1178), .A3(n1177), .ZN(n786) );
  AOI22_X1 U1323 ( .A1(n1261), .A2(n1208), .B1(dsp_int_shifter_operand[45]), 
        .B2(n872), .ZN(n1184) );
  AOI22_X1 U1324 ( .A1(n1233), .A2(n1180), .B1(n1259), .B2(n1207), .ZN(n1183)
         );
  AOI22_X1 U1325 ( .A1(n1263), .A2(n1209), .B1(n1257), .B2(n1181), .ZN(n1182)
         );
  NAND3_X1 U1326 ( .A1(n1184), .A2(n1183), .A3(n1182), .ZN(n825) );
  AOI22_X1 U1327 ( .A1(n1257), .A2(n1185), .B1(dsp_int_shifter_operand[38]), 
        .B2(n872), .ZN(n1192) );
  AOI22_X1 U1328 ( .A1(n1261), .A2(n1187), .B1(n1259), .B2(n1186), .ZN(n1191)
         );
  AOI22_X1 U1329 ( .A1(n1265), .A2(n1189), .B1(n1263), .B2(n1188), .ZN(n1190)
         );
  NAND3_X1 U1330 ( .A1(n1192), .A2(n1191), .A3(n1190), .ZN(n818) );
  AOI22_X1 U1331 ( .A1(n1257), .A2(n1193), .B1(dsp_int_shifter_operand[43]), 
        .B2(n872), .ZN(n1201) );
  AOI22_X1 U1332 ( .A1(n1261), .A2(n1195), .B1(n1259), .B2(n1194), .ZN(n1200)
         );
  INV_X1 U1333 ( .I(n1196), .ZN(n1198) );
  AOI22_X1 U1334 ( .A1(n1265), .A2(n1198), .B1(n1263), .B2(n1197), .ZN(n1199)
         );
  NAND3_X1 U1335 ( .A1(n1201), .A2(n1200), .A3(n1199), .ZN(n823) );
  AOI22_X1 U1336 ( .A1(n1261), .A2(n1258), .B1(dsp_int_shifter_operand[13]), 
        .B2(n872), .ZN(n1206) );
  AOI22_X1 U1337 ( .A1(n1233), .A2(n1202), .B1(n1259), .B2(n1256), .ZN(n1205)
         );
  AOI22_X1 U1338 ( .A1(n1263), .A2(n1260), .B1(n1257), .B2(n1203), .ZN(n1204)
         );
  NAND3_X1 U1339 ( .A1(n1206), .A2(n1205), .A3(n1204), .ZN(n793) );
  AOI22_X1 U1340 ( .A1(n1257), .A2(n1207), .B1(dsp_int_shifter_operand[41]), 
        .B2(n872), .ZN(n1214) );
  AOI22_X1 U1341 ( .A1(n1261), .A2(n1209), .B1(n1259), .B2(n1208), .ZN(n1213)
         );
  AOI22_X1 U1342 ( .A1(n1265), .A2(n1211), .B1(n1263), .B2(n1210), .ZN(n1212)
         );
  NAND3_X1 U1343 ( .A1(n1214), .A2(n1213), .A3(n1212), .ZN(n821) );
  AOI22_X1 U1344 ( .A1(n1257), .A2(n1215), .B1(dsp_int_shifter_operand[10]), 
        .B2(n872), .ZN(n1223) );
  AOI22_X1 U1345 ( .A1(n1261), .A2(n1217), .B1(n1259), .B2(n1216), .ZN(n1222)
         );
  INV_X1 U1346 ( .I(n1218), .ZN(n1220) );
  AOI22_X1 U1347 ( .A1(n1265), .A2(n1220), .B1(n1263), .B2(n1219), .ZN(n1221)
         );
  NAND3_X1 U1348 ( .A1(n1223), .A2(n1222), .A3(n1221), .ZN(n790) );
  AOI22_X1 U1349 ( .A1(n1261), .A2(n1224), .B1(dsp_int_shifter_operand[44]), 
        .B2(n872), .ZN(n1231) );
  AOI22_X1 U1350 ( .A1(n1233), .A2(n1226), .B1(n1259), .B2(n1225), .ZN(n1230)
         );
  AOI22_X1 U1351 ( .A1(n1263), .A2(n1228), .B1(n1257), .B2(n1227), .ZN(n1229)
         );
  NAND3_X1 U1352 ( .A1(n1231), .A2(n1230), .A3(n1229), .ZN(n824) );
  AOI22_X1 U1353 ( .A1(n1261), .A2(n1239), .B1(dsp_int_shifter_operand[12]), 
        .B2(n872), .ZN(n1237) );
  AOI22_X1 U1354 ( .A1(n1233), .A2(n1232), .B1(n1259), .B2(n1238), .ZN(n1236)
         );
  AOI22_X1 U1355 ( .A1(n1263), .A2(n1240), .B1(n1257), .B2(n1234), .ZN(n1235)
         );
  NAND3_X1 U1356 ( .A1(n1237), .A2(n1236), .A3(n1235), .ZN(n792) );
  AOI22_X1 U1357 ( .A1(n1257), .A2(n1238), .B1(dsp_int_shifter_operand[8]), 
        .B2(n872), .ZN(n1246) );
  AOI22_X1 U1358 ( .A1(n1261), .A2(n1240), .B1(n1259), .B2(n1239), .ZN(n1245)
         );
  INV_X1 U1359 ( .I(n1241), .ZN(n1243) );
  AOI22_X1 U1360 ( .A1(n1265), .A2(n1243), .B1(n1263), .B2(n1242), .ZN(n1244)
         );
  NAND3_X1 U1361 ( .A1(n1246), .A2(n1245), .A3(n1244), .ZN(n788) );
  AOI22_X1 U1362 ( .A1(n1257), .A2(n1247), .B1(dsp_int_shifter_operand[11]), 
        .B2(n872), .ZN(n1255) );
  AOI22_X1 U1363 ( .A1(n1261), .A2(n1249), .B1(n1259), .B2(n1248), .ZN(n1254)
         );
  INV_X1 U1364 ( .I(n1250), .ZN(n1252) );
  AOI22_X1 U1365 ( .A1(n1265), .A2(n1252), .B1(n1263), .B2(n1251), .ZN(n1253)
         );
  NAND3_X1 U1366 ( .A1(n1255), .A2(n1254), .A3(n1253), .ZN(n791) );
  AOI22_X1 U1367 ( .A1(n1257), .A2(n1256), .B1(dsp_int_shifter_operand[9]), 
        .B2(n872), .ZN(n1268) );
  AOI22_X1 U1368 ( .A1(n1261), .A2(n1260), .B1(n1259), .B2(n1258), .ZN(n1267)
         );
  AOI22_X1 U1369 ( .A1(n1265), .A2(n1264), .B1(n1263), .B2(n1262), .ZN(n1266)
         );
  NAND3_X1 U1370 ( .A1(n1268), .A2(n1267), .A3(n1266), .ZN(n789) );
  NOR2_X1 U1371 ( .A1(decoded_instruction_DSP_lat_9), .A2(
        decoded_instruction_DSP_lat[13]), .ZN(n1546) );
  NOR2_X1 U1372 ( .A1(MVTYPE_DSP[1]), .A2(n1546), .ZN(n1337) );
  NOR2_X1 U1373 ( .A1(n1294), .A2(n1546), .ZN(n1331) );
  NAND2_X1 U1374 ( .A1(dsp_in_shift_amount[4]), .A2(n1331), .ZN(n1469) );
  INV_X1 U1375 ( .I(n1469), .ZN(n1446) );
  NOR2_X1 U1376 ( .A1(n1337), .A2(n1446), .ZN(n1493) );
  INV_X1 U1377 ( .I(shift_en[0]), .ZN(n1269) );
  NOR2_X1 U1378 ( .A1(halt_dsp_lat[0]), .A2(n1269), .ZN(n1270) );
  OAI21_X1 U1379 ( .A1(recover_state_wires[0]), .A2(shifter_stage_2_en[0]), 
        .B(n1270), .ZN(n1271) );
  AOI21_X1 U1380 ( .A1(MVTYPE_DSP[1]), .A2(MVTYPE_DSP[0]), .B(n1271), .ZN(
        n1515) );
  NAND2_X1 U1381 ( .A1(n1515), .A2(dsp_in_shifter_operand_lat[40]), .ZN(n1456)
         );
  NAND2_X1 U1382 ( .A1(MVTYPE_DSP[0]), .A2(n1515), .ZN(n1454) );
  NOR2_X1 U1383 ( .A1(n1274), .A2(n1454), .ZN(n1349) );
  NOR3_X1 U1384 ( .A1(MVTYPE_DSP[0]), .A2(decoded_instruction_DSP_lat[13]), 
        .A3(n1271), .ZN(n1497) );
  NOR2_X1 U1385 ( .A1(dsp_in_shift_amount[2]), .A2(n1528), .ZN(n1286) );
  AOI22_X1 U1386 ( .A1(n1068), .A2(n1349), .B1(n1497), .B2(n1286), .ZN(n1272)
         );
  NAND2_X1 U1387 ( .A1(MVTYPE_DSP[1]), .A2(n1515), .ZN(n1470) );
  NAND2_X1 U1388 ( .A1(n1272), .A2(n1470), .ZN(n1363) );
  INV_X1 U1389 ( .I(n1515), .ZN(n1436) );
  AOI22_X1 U1390 ( .A1(dsp_int_shifter_operand[47]), .A2(n1363), .B1(
        dsp_out_shifter_results[47]), .B2(n1436), .ZN(n1273) );
  OAI21_X1 U1391 ( .A1(n1493), .A2(n1456), .B(n1273), .ZN(n755) );
  NOR2_X1 U1392 ( .A1(n1274), .A2(n1528), .ZN(n1276) );
  INV_X1 U1393 ( .I(n1276), .ZN(n1277) );
  NOR2_X1 U1394 ( .A1(n1275), .A2(n1546), .ZN(n1447) );
  INV_X1 U1395 ( .I(n1447), .ZN(n1347) );
  OR2_X1 U1396 ( .A1(n1546), .A2(n1285), .Z(n1449) );
  OAI22_X1 U1397 ( .A1(n1286), .A2(n1347), .B1(n1276), .B2(n1449), .ZN(n1366)
         );
  AOI21_X1 U1398 ( .A1(n1446), .A2(n1277), .B(n1366), .ZN(n1282) );
  NAND2_X1 U1399 ( .A1(n1515), .A2(dsp_in_shifter_operand_lat[10]), .ZN(n1465)
         );
  NOR2_X1 U1400 ( .A1(dsp_in_shift_amount[2]), .A2(dsp_in_shift_amount[1]), 
        .ZN(n1459) );
  AOI22_X1 U1401 ( .A1(n1497), .A2(n1459), .B1(n1349), .B2(n1338), .ZN(n1278)
         );
  NAND2_X1 U1402 ( .A1(n1278), .A2(n1470), .ZN(n1369) );
  AOI22_X1 U1403 ( .A1(dsp_int_shifter_operand[14]), .A2(n1369), .B1(
        dsp_out_shifter_results[14]), .B2(n1436), .ZN(n1279) );
  OAI21_X1 U1404 ( .A1(n1282), .A2(n1465), .B(n1279), .ZN(n722) );
  AOI22_X1 U1405 ( .A1(dsp_int_shifter_operand[15]), .A2(n1363), .B1(
        dsp_out_shifter_results[15]), .B2(n1436), .ZN(n1280) );
  OAI21_X1 U1406 ( .A1(n1493), .A2(n1465), .B(n1280), .ZN(n723) );
  AOI22_X1 U1407 ( .A1(dsp_int_shifter_operand[46]), .A2(n1369), .B1(
        dsp_out_shifter_results[46]), .B2(n1436), .ZN(n1281) );
  OAI21_X1 U1408 ( .A1(n1282), .A2(n1456), .B(n1281), .ZN(n754) );
  AOI22_X1 U1409 ( .A1(dsp_in_shifter_operand[55]), .A2(n1299), .B1(
        dsp_in_shifter_operand_lat[48]), .B2(n1298), .ZN(n1283) );
  OAI21_X1 U1410 ( .A1(n1284), .A2(n1301), .B(n1283), .ZN(n778) );
  NOR2_X1 U1411 ( .A1(n1519), .A2(n1469), .ZN(n1455) );
  NOR2_X1 U1412 ( .A1(n1519), .A2(n1449), .ZN(n1524) );
  INV_X1 U1413 ( .I(n1524), .ZN(n1335) );
  NAND2_X1 U1414 ( .A1(n1335), .A2(n1347), .ZN(n1303) );
  NOR2_X1 U1415 ( .A1(n1455), .A2(n1303), .ZN(n1392) );
  NAND2_X1 U1416 ( .A1(n1515), .A2(dsp_in_shifter_operand_lat[32]), .ZN(n1398)
         );
  NOR2_X1 U1417 ( .A1(n1285), .A2(dsp_in_shift_amount[3]), .ZN(n1393) );
  NOR3_X1 U1418 ( .A1(n1286), .A2(MVTYPE_DSP[1]), .A3(n1393), .ZN(n1287) );
  NOR2_X1 U1419 ( .A1(n1287), .A2(n1436), .ZN(n1402) );
  AOI22_X1 U1420 ( .A1(dsp_int_shifter_operand[39]), .A2(n1402), .B1(
        dsp_out_shifter_results[39]), .B2(n1436), .ZN(n1288) );
  OAI21_X1 U1421 ( .A1(n1392), .A2(n1398), .B(n1288), .ZN(n747) );
  NAND2_X1 U1422 ( .A1(n1515), .A2(dsp_in_shifter_operand_lat[0]), .ZN(n1390)
         );
  AOI22_X1 U1423 ( .A1(dsp_int_shifter_operand[7]), .A2(n1402), .B1(
        dsp_out_shifter_results[7]), .B2(n1436), .ZN(n1289) );
  OAI21_X1 U1424 ( .A1(n1392), .A2(n1390), .B(n1289), .ZN(n715) );
  NOR2_X1 U1425 ( .A1(n1392), .A2(n1535), .ZN(n1411) );
  NAND2_X1 U1426 ( .A1(n1411), .A2(n1528), .ZN(n1293) );
  NAND2_X1 U1427 ( .A1(dsp_in_shift_amount[1]), .A2(n1304), .ZN(n1415) );
  NOR2_X1 U1428 ( .A1(n1535), .A2(n1338), .ZN(n1472) );
  INV_X1 U1429 ( .I(n1472), .ZN(n1545) );
  AOI21_X1 U1430 ( .A1(MVTYPE_DSP[0]), .A2(n1415), .B(n1545), .ZN(n1290) );
  AOI21_X1 U1431 ( .A1(n1290), .A2(n1294), .B(n1436), .ZN(n1372) );
  AOI22_X1 U1432 ( .A1(dsp_int_shifter_operand[2]), .A2(n1372), .B1(
        dsp_out_shifter_results[2]), .B2(n1436), .ZN(n1291) );
  OAI21_X1 U1433 ( .A1(n1390), .A2(n1293), .B(n1291), .ZN(n710) );
  AOI22_X1 U1434 ( .A1(dsp_int_shifter_operand[34]), .A2(n1372), .B1(
        dsp_out_shifter_results[34]), .B2(n1436), .ZN(n1292) );
  OAI21_X1 U1435 ( .A1(n1398), .A2(n1293), .B(n1292), .ZN(n742) );
  NOR2_X1 U1436 ( .A1(dsp_in_shift_amount[2]), .A2(n1448), .ZN(n1464) );
  OR2_X1 U1437 ( .A1(n1464), .A2(n1392), .Z(n1297) );
  NOR2_X1 U1438 ( .A1(n1393), .A2(n1535), .ZN(n1330) );
  AOI21_X1 U1439 ( .A1(n1330), .A2(n1294), .B(n1436), .ZN(n1378) );
  AOI22_X1 U1440 ( .A1(n1378), .A2(dsp_int_shifter_operand[4]), .B1(
        dsp_out_shifter_results[4]), .B2(n1436), .ZN(n1295) );
  OAI21_X1 U1441 ( .A1(n1390), .A2(n1297), .B(n1295), .ZN(n712) );
  AOI22_X1 U1442 ( .A1(n1378), .A2(dsp_int_shifter_operand[36]), .B1(
        dsp_out_shifter_results[36]), .B2(n1436), .ZN(n1296) );
  OAI21_X1 U1443 ( .A1(n1398), .A2(n1297), .B(n1296), .ZN(n744) );
  AOI22_X1 U1444 ( .A1(dsp_in_shifter_operand[23]), .A2(n1299), .B1(
        dsp_in_shifter_operand_lat[16]), .B2(n1298), .ZN(n1300) );
  OAI21_X1 U1445 ( .A1(n1302), .A2(n1301), .B(n1300), .ZN(n774) );
  INV_X1 U1446 ( .I(n1303), .ZN(n1405) );
  NOR2_X1 U1447 ( .A1(n1405), .A2(n1535), .ZN(n1386) );
  NAND2_X1 U1448 ( .A1(dsp_in_shift_amount[1]), .A2(n1386), .ZN(n1432) );
  NOR2_X1 U1449 ( .A1(n1451), .A2(n1432), .ZN(n1305) );
  NAND2_X1 U1450 ( .A1(n1448), .A2(n1304), .ZN(n1431) );
  INV_X1 U1451 ( .I(n1331), .ZN(n1536) );
  AOI21_X1 U1452 ( .A1(n1355), .A2(n1431), .B(n1536), .ZN(n1308) );
  NOR2_X1 U1453 ( .A1(n1305), .A2(n1308), .ZN(n1314) );
  NAND2_X1 U1454 ( .A1(n1515), .A2(dsp_in_shifter_operand_lat[16]), .ZN(n1373)
         );
  AOI22_X1 U1455 ( .A1(n1515), .A2(dsp_int_shifter_operand[16]), .B1(
        dsp_out_shifter_results[16]), .B2(n1436), .ZN(n1306) );
  OAI21_X1 U1456 ( .A1(n1314), .A2(n1373), .B(n1306), .ZN(n724) );
  OAI21_X1 U1457 ( .A1(n1536), .A2(n1415), .B(n1432), .ZN(n1307) );
  NOR2_X1 U1458 ( .A1(n1308), .A2(n1307), .ZN(n1312) );
  NAND2_X1 U1459 ( .A1(n1448), .A2(n1330), .ZN(n1496) );
  OAI21_X1 U1460 ( .A1(n1496), .A2(MVTYPE_DSP[1]), .B(n1515), .ZN(n1421) );
  INV_X1 U1461 ( .I(n1421), .ZN(n1310) );
  AOI22_X1 U1462 ( .A1(dsp_int_shifter_operand[17]), .A2(n1310), .B1(
        dsp_out_shifter_results[17]), .B2(n1436), .ZN(n1309) );
  OAI21_X1 U1463 ( .A1(n1312), .A2(n1373), .B(n1309), .ZN(n725) );
  NAND2_X1 U1464 ( .A1(n1515), .A2(dsp_in_shifter_operand_lat[48]), .ZN(n1404)
         );
  AOI22_X1 U1465 ( .A1(dsp_int_shifter_operand[49]), .A2(n1310), .B1(
        dsp_out_shifter_results[49]), .B2(n1436), .ZN(n1311) );
  OAI21_X1 U1466 ( .A1(n1312), .A2(n1404), .B(n1311), .ZN(n757) );
  AOI22_X1 U1467 ( .A1(n1515), .A2(dsp_int_shifter_operand[48]), .B1(
        dsp_out_shifter_results[48]), .B2(n1436), .ZN(n1313) );
  OAI21_X1 U1468 ( .A1(n1314), .A2(n1404), .B(n1313), .ZN(n756) );
  OAI21_X1 U1469 ( .A1(n1068), .A2(n1318), .B(n1355), .ZN(n1374) );
  AOI22_X1 U1470 ( .A1(n1331), .A2(n1374), .B1(n1386), .B2(n1528), .ZN(n1316)
         );
  AOI22_X1 U1471 ( .A1(dsp_int_shifter_operand[50]), .A2(n1372), .B1(
        dsp_out_shifter_results[50]), .B2(n1436), .ZN(n1315) );
  OAI21_X1 U1472 ( .A1(n1316), .A2(n1404), .B(n1315), .ZN(n758) );
  OR3_X1 U1473 ( .A1(MVTYPE_DSP[1]), .A2(n1464), .A3(n1393), .Z(n1317) );
  NAND2_X1 U1474 ( .A1(n1515), .A2(n1317), .ZN(n1422) );
  INV_X1 U1475 ( .I(dsp_int_shifter_operand[53]), .ZN(n1322) );
  NOR2_X1 U1476 ( .A1(n1405), .A2(n1459), .ZN(n1397) );
  NAND2_X1 U1477 ( .A1(n1355), .A2(n1318), .ZN(n1384) );
  AOI21_X1 U1478 ( .A1(dsp_in_shift_amount[3]), .A2(dsp_in_shift_amount[1]), 
        .B(n1384), .ZN(n1319) );
  NOR2_X1 U1479 ( .A1(n1536), .A2(n1319), .ZN(n1523) );
  OAI21_X1 U1480 ( .A1(n1397), .A2(n1523), .B(dsp_in_shifter_operand_lat[48]), 
        .ZN(n1320) );
  NAND2_X1 U1481 ( .A1(n1515), .A2(n1320), .ZN(n1443) );
  OAI21_X1 U1482 ( .A1(n1515), .A2(dsp_out_shifter_results[53]), .B(n1443), 
        .ZN(n1321) );
  OAI21_X1 U1483 ( .A1(n1422), .A2(n1322), .B(n1321), .ZN(n761) );
  INV_X1 U1484 ( .I(dsp_int_shifter_operand[21]), .ZN(n1325) );
  OAI21_X1 U1485 ( .A1(n1397), .A2(n1523), .B(dsp_in_shifter_operand_lat[16]), 
        .ZN(n1323) );
  NAND2_X1 U1486 ( .A1(n1515), .A2(n1323), .ZN(n1513) );
  OAI21_X1 U1487 ( .A1(n1515), .A2(dsp_out_shifter_results[21]), .B(n1513), 
        .ZN(n1324) );
  OAI21_X1 U1488 ( .A1(n1422), .A2(n1325), .B(n1324), .ZN(n729) );
  NAND2_X1 U1489 ( .A1(dsp_in_shifter_operand_lat[16]), .A2(n1331), .ZN(n1327)
         );
  INV_X1 U1490 ( .I(dsp_in_shifter_operand_lat[16]), .ZN(n1326) );
  OAI22_X1 U1491 ( .A1(n1519), .A2(n1327), .B1(n1326), .B2(n1405), .ZN(n1512)
         );
  AOI22_X1 U1492 ( .A1(dsp_out_shifter_results[23]), .A2(n1436), .B1(n1512), 
        .B2(n1515), .ZN(n1329) );
  NOR2_X1 U1493 ( .A1(n1436), .A2(n1327), .ZN(n1385) );
  AOI22_X1 U1494 ( .A1(dsp_in_shift_amount[4]), .A2(n1385), .B1(
        dsp_int_shifter_operand[23]), .B2(n1402), .ZN(n1328) );
  NAND2_X1 U1495 ( .A1(n1329), .A2(n1328), .ZN(n731) );
  NAND2_X1 U1496 ( .A1(n1330), .A2(n1528), .ZN(n1485) );
  OAI21_X1 U1497 ( .A1(n1485), .A2(MVTYPE_DSP[1]), .B(n1515), .ZN(n1413) );
  INV_X1 U1498 ( .I(n1413), .ZN(n1383) );
  AOI22_X1 U1499 ( .A1(n1383), .A2(dsp_int_shifter_operand[51]), .B1(
        dsp_out_shifter_results[51]), .B2(n1436), .ZN(n1333) );
  INV_X1 U1500 ( .I(n1404), .ZN(n1356) );
  NAND3_X1 U1501 ( .A1(n1515), .A2(n1331), .A3(dsp_in_shifter_operand_lat[48]), 
        .ZN(n1403) );
  INV_X1 U1502 ( .I(n1403), .ZN(n1406) );
  AOI22_X1 U1503 ( .A1(n1356), .A2(n1386), .B1(n1406), .B2(n1384), .ZN(n1332)
         );
  NAND2_X1 U1504 ( .A1(n1333), .A2(n1332), .ZN(n759) );
  AND2_X1 U1505 ( .A1(n1494), .A2(n1334), .Z(n1365) );
  OAI21_X1 U1506 ( .A1(n1365), .A2(n1536), .B(n1335), .ZN(n1342) );
  AOI21_X1 U1507 ( .A1(dsp_in_shifter_operand_lat[24]), .A2(n1342), .B(n1436), 
        .ZN(n1361) );
  NOR2_X1 U1508 ( .A1(n1515), .A2(dsp_out_shifter_results[29]), .ZN(n1341) );
  NOR2_X1 U1509 ( .A1(n1436), .A2(n1336), .ZN(n1547) );
  INV_X1 U1510 ( .I(n1337), .ZN(n1534) );
  OAI22_X1 U1511 ( .A1(n1459), .A2(n1534), .B1(n1338), .B2(n1536), .ZN(n1344)
         );
  AOI22_X1 U1512 ( .A1(n1497), .A2(n1464), .B1(n1349), .B2(n1494), .ZN(n1339)
         );
  NAND2_X1 U1513 ( .A1(n1339), .A2(n1470), .ZN(n1478) );
  AOI22_X1 U1514 ( .A1(n1547), .A2(n1344), .B1(dsp_int_shifter_operand[29]), 
        .B2(n1478), .ZN(n1340) );
  OAI21_X1 U1515 ( .A1(n1361), .A2(n1341), .B(n1340), .ZN(n737) );
  AOI21_X1 U1516 ( .A1(dsp_in_shifter_operand_lat[56]), .A2(n1342), .B(n1436), 
        .ZN(n1354) );
  NOR2_X1 U1517 ( .A1(n1515), .A2(dsp_out_shifter_results[61]), .ZN(n1346) );
  NOR2_X1 U1518 ( .A1(n1436), .A2(n1343), .ZN(n1561) );
  AOI22_X1 U1519 ( .A1(n1561), .A2(n1344), .B1(dsp_int_shifter_operand[61]), 
        .B2(n1478), .ZN(n1345) );
  OAI21_X1 U1520 ( .A1(n1354), .A2(n1346), .B(n1345), .ZN(n769) );
  NOR2_X1 U1521 ( .A1(n1515), .A2(dsp_out_shifter_results[60]), .ZN(n1353) );
  AND2_X1 U1522 ( .A1(n1449), .A2(n1347), .Z(n1348) );
  OAI22_X1 U1523 ( .A1(n1348), .A2(n1494), .B1(n1535), .B2(n1534), .ZN(n1462)
         );
  INV_X1 U1524 ( .I(n1497), .ZN(n1351) );
  INV_X1 U1525 ( .I(n1470), .ZN(n1350) );
  NOR2_X1 U1526 ( .A1(n1350), .A2(n1349), .ZN(n1499) );
  OAI21_X1 U1527 ( .A1(dsp_in_shift_amount[2]), .A2(n1351), .B(n1499), .ZN(
        n1489) );
  AOI22_X1 U1528 ( .A1(n1561), .A2(n1462), .B1(dsp_int_shifter_operand[60]), 
        .B2(n1489), .ZN(n1352) );
  OAI21_X1 U1529 ( .A1(n1354), .A2(n1353), .B(n1352), .ZN(n768) );
  AOI22_X1 U1530 ( .A1(n1378), .A2(dsp_int_shifter_operand[52]), .B1(
        dsp_out_shifter_results[52]), .B2(n1436), .ZN(n1358) );
  NOR2_X1 U1531 ( .A1(n1405), .A2(n1464), .ZN(n1380) );
  OAI21_X1 U1532 ( .A1(n1464), .A2(n1519), .B(n1355), .ZN(n1379) );
  AOI22_X1 U1533 ( .A1(n1356), .A2(n1380), .B1(n1406), .B2(n1379), .ZN(n1357)
         );
  NAND2_X1 U1534 ( .A1(n1358), .A2(n1357), .ZN(n760) );
  NOR2_X1 U1535 ( .A1(n1515), .A2(dsp_out_shifter_results[28]), .ZN(n1360) );
  AOI22_X1 U1536 ( .A1(n1547), .A2(n1462), .B1(dsp_int_shifter_operand[28]), 
        .B2(n1489), .ZN(n1359) );
  OAI21_X1 U1537 ( .A1(n1361), .A2(n1360), .B(n1359), .ZN(n736) );
  INV_X1 U1538 ( .I(n1561), .ZN(n1525) );
  AOI22_X1 U1539 ( .A1(dsp_int_shifter_operand[63]), .A2(n1363), .B1(
        dsp_out_shifter_results[63]), .B2(n1436), .ZN(n1362) );
  OAI21_X1 U1540 ( .A1(n1546), .A2(n1525), .B(n1362), .ZN(n771) );
  INV_X1 U1541 ( .I(n1547), .ZN(n1530) );
  AOI22_X1 U1542 ( .A1(dsp_int_shifter_operand[31]), .A2(n1363), .B1(
        dsp_out_shifter_results[31]), .B2(n1436), .ZN(n1364) );
  OAI21_X1 U1543 ( .A1(n1546), .A2(n1530), .B(n1364), .ZN(n739) );
  AOI21_X1 U1544 ( .A1(n1068), .A2(n1365), .B(n1536), .ZN(n1367) );
  NOR2_X1 U1545 ( .A1(n1367), .A2(n1366), .ZN(n1371) );
  AOI22_X1 U1546 ( .A1(dsp_int_shifter_operand[30]), .A2(n1369), .B1(
        dsp_out_shifter_results[30]), .B2(n1436), .ZN(n1368) );
  OAI21_X1 U1547 ( .A1(n1371), .A2(n1530), .B(n1368), .ZN(n738) );
  AOI22_X1 U1548 ( .A1(dsp_int_shifter_operand[62]), .A2(n1369), .B1(
        dsp_out_shifter_results[62]), .B2(n1436), .ZN(n1370) );
  OAI21_X1 U1549 ( .A1(n1371), .A2(n1525), .B(n1370), .ZN(n770) );
  AOI22_X1 U1550 ( .A1(dsp_int_shifter_operand[18]), .A2(n1372), .B1(
        dsp_out_shifter_results[18]), .B2(n1436), .ZN(n1377) );
  INV_X1 U1551 ( .I(n1373), .ZN(n1387) );
  AND2_X1 U1552 ( .A1(n1528), .A2(n1386), .Z(n1375) );
  AOI22_X1 U1553 ( .A1(n1387), .A2(n1375), .B1(n1385), .B2(n1374), .ZN(n1376)
         );
  NAND2_X1 U1554 ( .A1(n1377), .A2(n1376), .ZN(n726) );
  AOI22_X1 U1555 ( .A1(n1378), .A2(dsp_int_shifter_operand[20]), .B1(
        dsp_out_shifter_results[20]), .B2(n1436), .ZN(n1382) );
  AOI22_X1 U1556 ( .A1(n1387), .A2(n1380), .B1(n1385), .B2(n1379), .ZN(n1381)
         );
  NAND2_X1 U1557 ( .A1(n1382), .A2(n1381), .ZN(n728) );
  AOI22_X1 U1558 ( .A1(n1383), .A2(dsp_int_shifter_operand[19]), .B1(
        dsp_out_shifter_results[19]), .B2(n1436), .ZN(n1389) );
  AOI22_X1 U1559 ( .A1(n1387), .A2(n1386), .B1(n1385), .B2(n1384), .ZN(n1388)
         );
  NAND2_X1 U1560 ( .A1(n1389), .A2(n1388), .ZN(n727) );
  AOI21_X1 U1561 ( .A1(n1397), .A2(dsp_in_shifter_operand_lat[0]), .B(n1436), 
        .ZN(n1430) );
  NOR2_X1 U1562 ( .A1(n1515), .A2(dsp_out_shifter_results[6]), .ZN(n1396) );
  INV_X1 U1563 ( .I(n1390), .ZN(n1433) );
  NOR3_X1 U1564 ( .A1(n1519), .A2(n1469), .A3(n1459), .ZN(n1426) );
  INV_X1 U1565 ( .I(n1426), .ZN(n1391) );
  OAI21_X1 U1566 ( .A1(n1392), .A2(n1451), .B(n1391), .ZN(n1399) );
  OR2_X1 U1567 ( .A1(n1459), .A2(n1393), .Z(n1394) );
  OAI21_X1 U1568 ( .A1(MVTYPE_DSP[1]), .A2(n1394), .B(n1515), .ZN(n1518) );
  INV_X1 U1569 ( .I(n1518), .ZN(n1441) );
  AOI22_X1 U1570 ( .A1(n1433), .A2(n1399), .B1(dsp_int_shifter_operand[6]), 
        .B2(n1441), .ZN(n1395) );
  OAI21_X1 U1571 ( .A1(n1430), .A2(n1396), .B(n1395), .ZN(n714) );
  AOI21_X1 U1572 ( .A1(n1397), .A2(dsp_in_shifter_operand_lat[32]), .B(n1436), 
        .ZN(n1425) );
  NOR2_X1 U1573 ( .A1(n1515), .A2(dsp_out_shifter_results[38]), .ZN(n1401) );
  INV_X1 U1574 ( .I(n1398), .ZN(n1438) );
  AOI22_X1 U1575 ( .A1(n1438), .A2(n1399), .B1(dsp_int_shifter_operand[38]), 
        .B2(n1441), .ZN(n1400) );
  OAI21_X1 U1576 ( .A1(n1425), .A2(n1401), .B(n1400), .ZN(n746) );
  AOI22_X1 U1577 ( .A1(dsp_int_shifter_operand[55]), .A2(n1402), .B1(
        dsp_out_shifter_results[55]), .B2(n1436), .ZN(n1408) );
  OAI22_X1 U1578 ( .A1(n1405), .A2(n1404), .B1(n1519), .B2(n1403), .ZN(n1442)
         );
  AOI21_X1 U1579 ( .A1(dsp_in_shift_amount[4]), .A2(n1406), .B(n1442), .ZN(
        n1407) );
  NAND2_X1 U1580 ( .A1(n1408), .A2(n1407), .ZN(n763) );
  AOI22_X1 U1581 ( .A1(n1411), .A2(n1438), .B1(dsp_out_shifter_results[35]), 
        .B2(n1436), .ZN(n1409) );
  OAI21_X1 U1582 ( .A1(n1410), .A2(n1413), .B(n1409), .ZN(n743) );
  AOI22_X1 U1583 ( .A1(n1411), .A2(n1433), .B1(dsp_out_shifter_results[3]), 
        .B2(n1436), .ZN(n1412) );
  OAI21_X1 U1584 ( .A1(n1414), .A2(n1413), .B(n1412), .ZN(n711) );
  OAI21_X1 U1585 ( .A1(n1469), .A2(n1415), .B(n1432), .ZN(n1418) );
  AOI22_X1 U1586 ( .A1(n1433), .A2(n1418), .B1(dsp_out_shifter_results[1]), 
        .B2(n1436), .ZN(n1416) );
  OAI21_X1 U1587 ( .A1(n1421), .A2(n1417), .B(n1416), .ZN(n709) );
  AOI22_X1 U1588 ( .A1(n1438), .A2(n1418), .B1(dsp_out_shifter_results[33]), 
        .B2(n1436), .ZN(n1419) );
  OAI21_X1 U1589 ( .A1(n1421), .A2(n1420), .B(n1419), .ZN(n741) );
  NOR2_X1 U1590 ( .A1(n1515), .A2(dsp_out_shifter_results[37]), .ZN(n1424) );
  INV_X1 U1591 ( .I(n1422), .ZN(n1427) );
  AOI22_X1 U1592 ( .A1(dsp_int_shifter_operand[37]), .A2(n1427), .B1(n1426), 
        .B2(n1438), .ZN(n1423) );
  OAI21_X1 U1593 ( .A1(n1425), .A2(n1424), .B(n1423), .ZN(n745) );
  NOR2_X1 U1594 ( .A1(n1515), .A2(dsp_out_shifter_results[5]), .ZN(n1429) );
  AOI22_X1 U1595 ( .A1(dsp_int_shifter_operand[5]), .A2(n1427), .B1(n1426), 
        .B2(n1433), .ZN(n1428) );
  OAI21_X1 U1596 ( .A1(n1430), .A2(n1429), .B(n1428), .ZN(n713) );
  OAI22_X1 U1597 ( .A1(n1451), .A2(n1432), .B1(n1469), .B2(n1431), .ZN(n1437)
         );
  AOI22_X1 U1598 ( .A1(n1433), .A2(n1437), .B1(dsp_out_shifter_results[0]), 
        .B2(n1436), .ZN(n1434) );
  OAI21_X1 U1599 ( .A1(n1435), .A2(n1436), .B(n1434), .ZN(n708) );
  AOI22_X1 U1600 ( .A1(n1438), .A2(n1437), .B1(dsp_out_shifter_results[32]), 
        .B2(n1436), .ZN(n1439) );
  OAI21_X1 U1601 ( .A1(n1440), .A2(n1436), .B(n1439), .ZN(n740) );
  AOI22_X1 U1602 ( .A1(dsp_in_shift_amount[0]), .A2(n1442), .B1(
        dsp_int_shifter_operand[54]), .B2(n1441), .ZN(n1445) );
  OAI21_X1 U1603 ( .A1(n1515), .A2(dsp_out_shifter_results[54]), .B(n1443), 
        .ZN(n1444) );
  NAND2_X1 U1604 ( .A1(n1445), .A2(n1444), .ZN(n762) );
  INV_X1 U1605 ( .I(n1456), .ZN(n1503) );
  NAND2_X1 U1606 ( .A1(dsp_in_shift_amount[2]), .A2(n1446), .ZN(n1453) );
  NAND2_X1 U1607 ( .A1(n1447), .A2(n1472), .ZN(n1450) );
  NAND2_X1 U1608 ( .A1(dsp_in_shift_amount[2]), .A2(n1448), .ZN(n1520) );
  OAI22_X1 U1609 ( .A1(n1451), .A2(n1450), .B1(n1449), .B2(n1520), .ZN(n1521)
         );
  INV_X1 U1610 ( .I(n1521), .ZN(n1452) );
  OAI21_X1 U1611 ( .A1(n1494), .A2(n1453), .B(n1452), .ZN(n1475) );
  NOR2_X1 U1612 ( .A1(dsp_in_shift_amount[3]), .A2(n1454), .ZN(n1495) );
  NOR2_X1 U1613 ( .A1(n1497), .A2(n1495), .ZN(n1471) );
  NAND2_X1 U1614 ( .A1(n1471), .A2(n1470), .ZN(n1541) );
  AOI22_X1 U1615 ( .A1(n1503), .A2(n1475), .B1(dsp_int_shifter_operand[40]), 
        .B2(n1541), .ZN(n1458) );
  NOR2_X1 U1616 ( .A1(n1524), .A2(n1455), .ZN(n1466) );
  NOR2_X1 U1617 ( .A1(n1466), .A2(n1456), .ZN(n1504) );
  AOI21_X1 U1618 ( .A1(n1436), .A2(dsp_out_shifter_results[40]), .B(n1504), 
        .ZN(n1457) );
  NAND2_X1 U1619 ( .A1(n1458), .A2(n1457), .ZN(n748) );
  AOI21_X1 U1620 ( .A1(n1534), .A2(n1469), .B(n1459), .ZN(n1479) );
  AOI22_X1 U1621 ( .A1(n1503), .A2(n1479), .B1(dsp_int_shifter_operand[45]), 
        .B2(n1478), .ZN(n1461) );
  AOI21_X1 U1622 ( .A1(n1436), .A2(dsp_out_shifter_results[45]), .B(n1504), 
        .ZN(n1460) );
  NAND2_X1 U1623 ( .A1(n1461), .A2(n1460), .ZN(n753) );
  INV_X1 U1624 ( .I(n1465), .ZN(n1508) );
  INV_X1 U1625 ( .I(n1462), .ZN(n1463) );
  OAI21_X1 U1626 ( .A1(n1464), .A2(n1469), .B(n1463), .ZN(n1490) );
  AOI22_X1 U1627 ( .A1(n1508), .A2(n1490), .B1(dsp_int_shifter_operand[12]), 
        .B2(n1489), .ZN(n1468) );
  NOR2_X1 U1628 ( .A1(n1466), .A2(n1465), .ZN(n1509) );
  AOI21_X1 U1629 ( .A1(n1436), .A2(dsp_out_shifter_results[12]), .B(n1509), 
        .ZN(n1467) );
  NAND2_X1 U1630 ( .A1(n1468), .A2(n1467), .ZN(n720) );
  AOI21_X1 U1631 ( .A1(n1534), .A2(n1469), .B(n1535), .ZN(n1502) );
  AND2_X1 U1632 ( .A1(n1528), .A2(n1502), .Z(n1482) );
  OAI21_X1 U1633 ( .A1(n1472), .A2(n1471), .B(n1470), .ZN(n1551) );
  AOI22_X1 U1634 ( .A1(n1482), .A2(n1503), .B1(dsp_int_shifter_operand[42]), 
        .B2(n1551), .ZN(n1474) );
  AOI21_X1 U1635 ( .A1(n1436), .A2(dsp_out_shifter_results[42]), .B(n1504), 
        .ZN(n1473) );
  NAND2_X1 U1636 ( .A1(n1474), .A2(n1473), .ZN(n750) );
  AOI22_X1 U1637 ( .A1(n1508), .A2(n1475), .B1(dsp_int_shifter_operand[8]), 
        .B2(n1541), .ZN(n1477) );
  AOI21_X1 U1638 ( .A1(n1436), .A2(dsp_out_shifter_results[8]), .B(n1509), 
        .ZN(n1476) );
  NAND2_X1 U1639 ( .A1(n1477), .A2(n1476), .ZN(n716) );
  AOI22_X1 U1640 ( .A1(n1508), .A2(n1479), .B1(dsp_int_shifter_operand[13]), 
        .B2(n1478), .ZN(n1481) );
  AOI21_X1 U1641 ( .A1(n1436), .A2(dsp_out_shifter_results[13]), .B(n1509), 
        .ZN(n1480) );
  NAND2_X1 U1642 ( .A1(n1481), .A2(n1480), .ZN(n721) );
  AOI22_X1 U1643 ( .A1(n1508), .A2(n1482), .B1(dsp_int_shifter_operand[10]), 
        .B2(n1551), .ZN(n1484) );
  AOI21_X1 U1644 ( .A1(n1436), .A2(dsp_out_shifter_results[10]), .B(n1509), 
        .ZN(n1483) );
  NAND2_X1 U1645 ( .A1(n1484), .A2(n1483), .ZN(n718) );
  AOI22_X1 U1646 ( .A1(n1068), .A2(n1495), .B1(n1497), .B2(n1485), .ZN(n1486)
         );
  NAND2_X1 U1647 ( .A1(n1499), .A2(n1486), .ZN(n1559) );
  AOI22_X1 U1648 ( .A1(n1508), .A2(n1502), .B1(dsp_int_shifter_operand[11]), 
        .B2(n1559), .ZN(n1488) );
  AOI21_X1 U1649 ( .A1(n1436), .A2(dsp_out_shifter_results[11]), .B(n1509), 
        .ZN(n1487) );
  NAND2_X1 U1650 ( .A1(n1488), .A2(n1487), .ZN(n719) );
  AOI22_X1 U1651 ( .A1(n1503), .A2(n1490), .B1(dsp_int_shifter_operand[44]), 
        .B2(n1489), .ZN(n1492) );
  AOI21_X1 U1652 ( .A1(n1436), .A2(dsp_out_shifter_results[44]), .B(n1504), 
        .ZN(n1491) );
  NAND2_X1 U1653 ( .A1(n1492), .A2(n1491), .ZN(n752) );
  NOR2_X1 U1654 ( .A1(n1493), .A2(n1545), .ZN(n1507) );
  AOI22_X1 U1655 ( .A1(n1497), .A2(n1496), .B1(n1495), .B2(n1494), .ZN(n1498)
         );
  NAND2_X1 U1656 ( .A1(n1499), .A2(n1498), .ZN(n1555) );
  AOI22_X1 U1657 ( .A1(n1507), .A2(n1503), .B1(dsp_int_shifter_operand[41]), 
        .B2(n1555), .ZN(n1501) );
  AOI21_X1 U1658 ( .A1(n1436), .A2(dsp_out_shifter_results[41]), .B(n1504), 
        .ZN(n1500) );
  NAND2_X1 U1659 ( .A1(n1501), .A2(n1500), .ZN(n749) );
  AOI22_X1 U1660 ( .A1(n1503), .A2(n1502), .B1(dsp_int_shifter_operand[43]), 
        .B2(n1559), .ZN(n1506) );
  AOI21_X1 U1661 ( .A1(n1436), .A2(dsp_out_shifter_results[43]), .B(n1504), 
        .ZN(n1505) );
  NAND2_X1 U1662 ( .A1(n1506), .A2(n1505), .ZN(n751) );
  AOI22_X1 U1663 ( .A1(n1508), .A2(n1507), .B1(dsp_int_shifter_operand[9]), 
        .B2(n1555), .ZN(n1511) );
  AOI21_X1 U1664 ( .A1(n1436), .A2(dsp_out_shifter_results[9]), .B(n1509), 
        .ZN(n1510) );
  NAND2_X1 U1665 ( .A1(n1511), .A2(n1510), .ZN(n717) );
  AND2_X1 U1666 ( .A1(n1512), .A2(dsp_in_shift_amount[0]), .Z(n1514) );
  OAI22_X1 U1667 ( .A1(n1515), .A2(dsp_out_shifter_results[22]), .B1(n1514), 
        .B2(n1513), .ZN(n1516) );
  OAI21_X1 U1668 ( .A1(n1518), .A2(n1517), .B(n1516), .ZN(n730) );
  AOI21_X1 U1669 ( .A1(n1520), .A2(n1519), .B(n1536), .ZN(n1522) );
  NOR2_X1 U1670 ( .A1(n1522), .A2(n1521), .ZN(n1544) );
  INV_X1 U1671 ( .I(n1544), .ZN(n1540) );
  AOI22_X1 U1672 ( .A1(n1561), .A2(n1540), .B1(dsp_int_shifter_operand[56]), 
        .B2(n1541), .ZN(n1527) );
  NOR2_X1 U1673 ( .A1(n1524), .A2(n1523), .ZN(n1531) );
  NOR2_X1 U1674 ( .A1(n1531), .A2(n1525), .ZN(n1562) );
  AOI21_X1 U1675 ( .A1(n1436), .A2(dsp_out_shifter_results[56]), .B(n1562), 
        .ZN(n1526) );
  NAND2_X1 U1676 ( .A1(n1527), .A2(n1526), .ZN(n764) );
  AOI22_X1 U1677 ( .A1(dsp_in_shift_amount[3]), .A2(MVTYPE_DSP[1]), .B1(
        dsp_in_shift_amount[2]), .B2(n1528), .ZN(n1529) );
  NOR2_X1 U1678 ( .A1(n1546), .A2(n1529), .ZN(n1552) );
  AOI22_X1 U1679 ( .A1(n1547), .A2(n1552), .B1(dsp_int_shifter_operand[26]), 
        .B2(n1551), .ZN(n1533) );
  NOR2_X1 U1680 ( .A1(n1531), .A2(n1530), .ZN(n1548) );
  AOI21_X1 U1681 ( .A1(n1436), .A2(dsp_out_shifter_results[26]), .B(n1548), 
        .ZN(n1532) );
  NAND2_X1 U1682 ( .A1(n1533), .A2(n1532), .ZN(n734) );
  OAI22_X1 U1683 ( .A1(n1537), .A2(n1536), .B1(n1535), .B2(n1534), .ZN(n1560)
         );
  AOI22_X1 U1684 ( .A1(n1547), .A2(n1560), .B1(dsp_int_shifter_operand[27]), 
        .B2(n1559), .ZN(n1539) );
  AOI21_X1 U1685 ( .A1(n1436), .A2(dsp_out_shifter_results[27]), .B(n1548), 
        .ZN(n1538) );
  NAND2_X1 U1686 ( .A1(n1539), .A2(n1538), .ZN(n735) );
  AOI22_X1 U1687 ( .A1(dsp_int_shifter_operand[24]), .A2(n1541), .B1(n1547), 
        .B2(n1540), .ZN(n1543) );
  AOI21_X1 U1688 ( .A1(n1436), .A2(dsp_out_shifter_results[24]), .B(n1548), 
        .ZN(n1542) );
  NAND2_X1 U1689 ( .A1(n1543), .A2(n1542), .ZN(n732) );
  OAI21_X1 U1690 ( .A1(n1546), .A2(n1545), .B(n1544), .ZN(n1556) );
  AOI22_X1 U1691 ( .A1(n1547), .A2(n1556), .B1(dsp_int_shifter_operand[25]), 
        .B2(n1555), .ZN(n1550) );
  AOI21_X1 U1692 ( .A1(n1436), .A2(dsp_out_shifter_results[25]), .B(n1548), 
        .ZN(n1549) );
  NAND2_X1 U1693 ( .A1(n1550), .A2(n1549), .ZN(n733) );
  AOI22_X1 U1694 ( .A1(n1561), .A2(n1552), .B1(dsp_int_shifter_operand[58]), 
        .B2(n1551), .ZN(n1554) );
  AOI21_X1 U1695 ( .A1(n1436), .A2(dsp_out_shifter_results[58]), .B(n1562), 
        .ZN(n1553) );
  NAND2_X1 U1696 ( .A1(n1554), .A2(n1553), .ZN(n766) );
  AOI22_X1 U1697 ( .A1(n1561), .A2(n1556), .B1(dsp_int_shifter_operand[57]), 
        .B2(n1555), .ZN(n1558) );
  AOI21_X1 U1698 ( .A1(n1436), .A2(dsp_out_shifter_results[57]), .B(n1562), 
        .ZN(n1557) );
  NAND2_X1 U1699 ( .A1(n1558), .A2(n1557), .ZN(n765) );
  AOI22_X1 U1700 ( .A1(n1561), .A2(n1560), .B1(dsp_int_shifter_operand[59]), 
        .B2(n1559), .ZN(n1564) );
  AOI21_X1 U1701 ( .A1(n1436), .A2(dsp_out_shifter_results[59]), .B(n1562), 
        .ZN(n1563) );
  NAND2_X1 U1702 ( .A1(n1564), .A2(n1563), .ZN(n767) );
endmodule

