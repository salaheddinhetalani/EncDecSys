/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : M-2016.12-SP5
// Date      : Mon Nov 27 22:04:10 2017
/////////////////////////////////////////////////////////////


module EncDecSys ( clk, rst, en, din, mode, shiftMode, perBit0Mode, 
        perBit1Mode, perBit2Mode, perBit3Mode, perBit4Mode, perBit5Mode, 
        perBit6Mode, perBit7Mode, v, dout );
  input [7:0] din;
  input [1:0] shiftMode;
  input [2:0] perBit0Mode;
  input [2:0] perBit1Mode;
  input [2:0] perBit2Mode;
  input [2:0] perBit3Mode;
  input [2:0] perBit4Mode;
  input [2:0] perBit5Mode;
  input [2:0] perBit6Mode;
  input [2:0] perBit7Mode;
  output [7:0] dout;
  input clk, rst, en, mode;
  output v;
  wire   intMode, intValid, enc_n355, enc_n162, enc_n349, enc_n348, enc_n344,
         enc_n343, enc_n341, enc_n215, enc_n214, enc_n213, enc_n212, enc_n211,
         enc_n210, enc_n209, enc_n208, enc_n207, enc_n206, enc_n205, enc_n203,
         enc_n27, enc_n26, enc_n25, enc_n24, enc_n23, enc_n22, enc_n21,
         enc_n20, enc_n19, enc_n18, enc_n17, enc_n16, enc_n15, enc_n14,
         enc_n13, enc_n12, enc_n11, enc_n10, enc_n9, enc_n8, enc_n7, enc_n6,
         enc_n5, enc_n4, enc_r108_carry_2_, enc_n74, enc_n67, enc_n55, enc_n54,
         enc_n53, enc_n52, enc_n51, enc_n50, enc_n49, enc_n48, enc_n47,
         enc_n46, enc_n45, enc_n44, enc_n43, enc_n42, enc_n41, enc_n40,
         enc_n39, enc_n38, enc_n37, enc_n36, enc_n35, enc_n34, enc_n33,
         enc_n32, enc_N288, enc_N287, enc_N284, enc_N283, enc_N282, enc_N281,
         enc_N280, enc_currentMode, enc_xorEnable, enc_N201, enc_N200,
         enc_N199, enc_N198, enc_N197, enc_N128, enc_nextMode, enc_perEnable,
         enc_N59, enc_N58, enc_N57, enc_N56, enc_N55, enc_N54, enc_N53,
         enc_N52, enc_N51, enc_N50, enc_N49, enc_N48, enc_N47, enc_N46,
         enc_N45, enc_N44, enc_N43, enc_N42, enc_N41, enc_N40, enc_N39,
         enc_N38, enc_N37, enc_N36, dec_n409, dec_n408, dec_n406, dec_n64,
         dec_n448, dec_n435, dec_n170, dec_n397, dec_n396, dec_n395, dec_n394,
         dec_n393, dec_n392, dec_n391, dec_n390, dec_n389, dec_n388, dec_n387,
         dec_n386, dec_n385, dec_n384, dec_n383, dec_n382, dec_n381, dec_n377,
         dec_n61, dec_n58, dec_n176, dec_n46, dec_n45, dec_n43, dec_N1240,
         dec_N1239, dec_N1238, dec_N1237, dec_N1236, dec_N1235,
         dec_shiftEnable, dec_N310, dec_N309, dec_N306, dec_N305, dec_N304,
         dec_N303, dec_N302, dec_perEnable, n1, n2, n3, n4, n5, n6, n8, n9,
         n10, n11, n12, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n25,
         n26, n27, n28, n29, n30, n31, n33, n34, n35, n36, n37, n38, n39, n41,
         n42, n218, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n258, n259, n260, n262, n263, n264, n265, n266,
         n267, n268, n269, n274, n275, n276, n277, n280, n281, n282, n283,
         n284, n285, n287, n288, n289, n290, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n302, n303, n304, n313, n314, n315, n316,
         n318, n320, n321, n322, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n334, n335, n338, n339, n340, n341, n344, n347, n348,
         n349, n350, n352, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n536, n537, n538, n539, n540, n541,
         n542, n543, n544, n545, n546, n547, n548, n549, n550, n552, n553,
         n554, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n567, n568, n569, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n597, n598, n599, n600, n601, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n733, n734,
         n735, n736, n737, n738, n739, n740, n741, n742, n743, n744;
  wire   [1:0] intShiftMode;
  wire   [2:0] intPerBit0Mode;
  wire   [2:0] intPerBit1Mode;
  wire   [2:0] intPerBit2Mode;
  wire   [2:0] intPerBit3Mode;
  wire   [2:0] intPerBit4Mode;
  wire   [2:0] intPerBit5Mode;
  wire   [2:0] intPerBit6Mode;
  wire   [2:0] intPerBit7Mode;
  wire   [6:0] intData;
  wire   [1:0] enc_currentShiftMode;
  wire   [6:1] enc_encPer;
  wire   [1:0] enc_nextShiftMode;
  wire   [1:0] dec_nextShiftMode;

initial $sdf_annotate ("EncDecSys.sdf");

  ADD32 enc_r108_U1_1 ( .A(din[1]), .B(shiftMode[1]), .CI(enc_n344), .CO(
        enc_r108_carry_2_), .S(enc_N128) );
  DFC3 enc_v_reg ( .D(enc_xorEnable), .C(clk), .RN(rst), .Q(intValid), .QN(n6)
         );
  DFC3 enc_xorEnable_reg ( .D(enc_perEnable), .C(clk), .RN(rst), .Q(
        enc_xorEnable), .QN(enc_n203) );
  DFC3 enc_perEnable_reg ( .D(enc_n206), .C(clk), .RN(rst), .Q(enc_perEnable), 
        .QN(n16) );
  DFC3 dec_perEnable_reg ( .D(intValid), .C(clk), .RN(rst), .Q(dec_perEnable), 
        .QN(n36) );
  DFEC3 dec_perBit3currentMode_reg_2_ ( .D(intPerBit3Mode[2]), .E(n741), .C(
        clk), .RN(rst), .QN(n693) );
  DFEC3 dec_perBit2currentMode_reg_2_ ( .D(intPerBit2Mode[2]), .E(n741), .C(
        clk), .RN(rst), .QN(n695) );
  DFEC3 dec_perBit1currentMode_reg_2_ ( .D(intPerBit1Mode[2]), .E(n741), .C(
        clk), .RN(rst), .QN(n694) );
  DFEC3 dec_perBit5currentMode_reg_2_ ( .D(intPerBit5Mode[2]), .E(n741), .C(
        clk), .RN(rst), .QN(n696) );
  DFEC3 dec_perBit4currentMode_reg_2_ ( .D(intPerBit4Mode[2]), .E(n741), .C(
        clk), .RN(rst), .QN(n698) );
  DFC3 dec_v_reg ( .D(dec_shiftEnable), .C(clk), .RN(rst), .Q(v) );
  DFC3 dec_shiftEnable_reg ( .D(dec_perEnable), .C(clk), .RN(rst), .Q(
        dec_shiftEnable) );
  DFEC3 enc_nextMode_reg ( .D(mode), .E(en), .C(clk), .RN(rst), .Q(
        enc_nextMode), .QN(n706) );
  DFEC3 dec_decXor_reg_2_ ( .D(intData[2]), .E(intValid), .C(clk), .RN(rst), 
        .Q(n318), .QN(n705) );
  OAI222 U2 ( .A(n33), .B(enc_nextMode), .C(n706), .D(n379), .Q(enc_n214) );
  OAI222 U8 ( .A(n385), .B(enc_N55), .C(enc_n18), .D(n386), .Q(n380) );
  OAI222 U11 ( .A(n31), .B(enc_nextMode), .C(n706), .D(n387), .Q(enc_n213) );
  OAI222 U17 ( .A(n393), .B(enc_N53), .C(enc_n25), .D(n394), .Q(n388) );
  OAI222 U20 ( .A(n27), .B(enc_nextMode), .C(n706), .D(n395), .Q(enc_n212) );
  OAI222 U26 ( .A(n401), .B(enc_N50), .C(enc_n24), .D(n402), .Q(n396) );
  OAI222 U29 ( .A(n28), .B(enc_nextMode), .C(n706), .D(n403), .Q(enc_n211) );
  OAI222 U35 ( .A(n409), .B(enc_N47), .C(enc_n23), .D(n410), .Q(n404) );
  OAI222 U38 ( .A(n30), .B(enc_nextMode), .C(n706), .D(n411), .Q(enc_n210) );
  OAI222 U44 ( .A(n417), .B(enc_N44), .C(enc_n22), .D(n418), .Q(n412) );
  OAI222 U47 ( .A(n29), .B(enc_nextMode), .C(n706), .D(n419), .Q(enc_n209) );
  OAI222 U53 ( .A(n425), .B(enc_N41), .C(enc_n21), .D(n426), .Q(n420) );
  OAI222 U56 ( .A(n740), .B(enc_nextMode), .C(n706), .D(n427), .Q(enc_n208) );
  OAI222 U62 ( .A(n433), .B(enc_N38), .C(enc_n20), .D(n434), .Q(n428) );
  OAI222 U67 ( .A(n34), .B(enc_nextMode), .C(n706), .D(n436), .Q(enc_n205) );
  OAI222 U73 ( .A(n442), .B(enc_N58), .C(enc_n19), .D(n443), .Q(n437) );
  OAI222 U81 ( .A(n448), .B(n341), .C(enc_n67), .D(n313), .Q(enc_N284) );
  OAI222 U82 ( .A(enc_n349), .B(n448), .C(n313), .D(n339), .Q(enc_N283) );
  OAI222 U83 ( .A(enc_n348), .B(n448), .C(n313), .D(n340), .Q(enc_N282) );
  OAI222 U88 ( .A(enc_n343), .B(n315), .C(n735), .D(n453), .Q(enc_n355) );
  OAI212 U90 ( .A(n23), .B(n314), .C(n446), .Q(n450) );
  OAI222 U93 ( .A(enc_n343), .B(n315), .C(enc_n74), .D(n446), .Q(n454) );
  OAI212 U97 ( .A(n459), .B(n460), .C(din[4]), .Q(n458) );
  OAI212 U99 ( .A(n461), .B(n226), .C(n220), .Q(enc_N200) );
  OAI212 U101 ( .A(n463), .B(n464), .C(n222), .Q(n457) );
  OAI212 U104 ( .A(n230), .B(n232), .C(n467), .Q(n466) );
  OAI212 U106 ( .A(n468), .B(n227), .C(n469), .Q(enc_N199) );
  OAI212 U111 ( .A(n221), .B(n228), .C(n472), .Q(enc_N198) );
  OAI212 U113 ( .A(n474), .B(n231), .C(n475), .Q(n473) );
  OAI222 U115 ( .A(din[0]), .B(n224), .C(shiftMode[1]), .D(n225), .Q(n477) );
  OAI212 U120 ( .A(shiftMode[0]), .B(n460), .C(din[0]), .Q(n481) );
  OAI212 U131 ( .A(n230), .B(n228), .C(n227), .Q(n486) );
  OAI212 U136 ( .A(n739), .B(dec_n45), .C(n487), .Q(dec_n397) );
  OAI222 U139 ( .A(dec_n377), .B(n260), .C(n492), .D(n493), .Q(n488) );
  OAI222 U141 ( .A(n496), .B(n344), .C(n274), .D(n497), .Q(n494) );
  OAI222 U143 ( .A(n705), .B(n500), .C(n241), .D(n501), .Q(n498) );
  OAI212 U145 ( .A(n739), .B(n705), .C(n503), .Q(dec_n396) );
  OAI222 U148 ( .A(dec_n377), .B(n259), .C(n507), .D(n508), .Q(n504) );
  OAI222 U150 ( .A(n344), .B(n511), .C(n275), .D(n512), .Q(n509) );
  OAI222 U152 ( .A(n705), .B(n515), .C(n242), .D(n516), .Q(n513) );
  OAI212 U154 ( .A(n490), .B(n283), .C(n518), .Q(dec_n395) );
  OAI212 U156 ( .A(n522), .B(n258), .C(n739), .Q(n521) );
  OAI222 U158 ( .A(n25), .B(n526), .C(n276), .D(n527), .Q(n524) );
  OAI222 U160 ( .A(n530), .B(n318), .C(n243), .D(n531), .Q(n528) );
  OAI222 U163 ( .A(n533), .B(n738), .C(n534), .D(n282), .Q(dec_n394) );
  OAI222 U167 ( .A(dec_n448), .B(n541), .C(n236), .D(n542), .Q(n539) );
  OAI222 U169 ( .A(dec_n45), .B(n545), .C(dec_n46), .D(n252), .Q(n543) );
  OAI212 U170 ( .A(n739), .B(dec_n448), .C(n546), .Q(dec_n393) );
  OAI222 U177 ( .A(n705), .B(n245), .C(n558), .D(n559), .Q(n556) );
  OAI212 U179 ( .A(n739), .B(n344), .C(n561), .Q(dec_n392) );
  OAI222 U186 ( .A(n705), .B(n246), .C(n573), .D(n574), .Q(n571) );
  OAI212 U188 ( .A(n739), .B(dec_n43), .C(n576), .Q(dec_n391) );
  OAI222 U193 ( .A(n344), .B(n280), .C(n584), .D(n585), .Q(n582) );
  OAI222 U195 ( .A(n705), .B(n247), .C(n588), .D(n589), .Q(n586) );
  OAI212 U197 ( .A(n739), .B(dec_n46), .C(n591), .Q(dec_n390) );
  OAI222 U203 ( .A(n344), .B(n281), .C(n599), .D(n600), .Q(n597) );
  OAI222 U205 ( .A(n705), .B(n248), .C(n603), .D(n604), .Q(n601) );
  OAI222 U307 ( .A(n41), .B(n302), .C(n641), .D(n289), .Q(dec_N306) );
  OAI222 U308 ( .A(n302), .B(n288), .C(n38), .D(n641), .Q(dec_N305) );
  OAI222 U309 ( .A(n302), .B(n287), .C(n39), .D(n641), .Q(dec_N304) );
  OAI222 U311 ( .A(n35), .B(n303), .C(n352), .D(n643), .Q(dec_n408) );
  OAI212 U313 ( .A(n701), .B(n37), .C(n639), .Q(n642) );
  OAI222 U319 ( .A(n35), .B(n303), .C(n19), .D(n639), .Q(n647) );
  OAI212 U323 ( .A(n716), .B(n651), .C(n730), .Q(n648) );
  OAI222 U331 ( .A(n329), .B(n662), .C(n663), .D(n664), .Q(n661) );
  OAI212 U338 ( .A(n671), .B(n658), .C(dec_n64), .Q(n670) );
  OAI222 U339 ( .A(n672), .B(n673), .C(dec_n58), .D(n674), .Q(n658) );
  OAI212 U346 ( .A(n654), .B(n682), .C(n324), .Q(n676) );
  OAI222 U347 ( .A(n348), .B(n673), .C(n649), .D(n681), .Q(n682) );
  OAI212 U349 ( .A(n673), .B(n649), .C(n684), .Q(n654) );
  OAI212 U355 ( .A(n680), .B(n349), .C(n350), .Q(n687) );
  OAI222 U356 ( .A(dec_n435), .B(n689), .C(n690), .D(n349), .Q(dec_N1235) );
  DFEC1 enc_encXor_reg_3_ ( .D(enc_N281), .E(enc_xorEnable), .C(clk), .RN(rst), 
        .QN(n42) );
  DFEC1 enc_encPer_reg_3_ ( .D(enc_n211), .E(enc_perEnable), .C(clk), .RN(rst), 
        .QN(enc_n341) );
  DFEC1 enc_encXor_reg_0_ ( .D(enc_N280), .E(enc_xorEnable), .C(clk), .RN(rst), 
        .Q(intData[0]) );
  DFEC1 enc_encPer_reg_0_ ( .D(enc_n208), .E(enc_perEnable), .C(clk), .RN(rst), 
        .Q(enc_n162) );
  DFEC1 enc_perBit5nextMode_reg_0_ ( .D(perBit5Mode[0]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N51), .QN(enc_n9) );
  DFEC1 enc_perBit4nextMode_reg_0_ ( .D(perBit4Mode[0]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N48), .QN(enc_n8) );
  DFEC1 enc_perBit3nextMode_reg_0_ ( .D(perBit3Mode[0]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N45), .QN(enc_n7) );
  DFEC1 enc_perBit2nextMode_reg_0_ ( .D(perBit2Mode[0]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N42), .QN(enc_n6) );
  DFEC1 enc_perBit1nextMode_reg_0_ ( .D(perBit1Mode[0]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N39), .QN(enc_n5) );
  DFEC1 enc_perBit0nextMode_reg_0_ ( .D(perBit0Mode[0]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N36), .QN(enc_n4) );
  DFEC1 enc_perBit6nextMode_reg_2_ ( .D(perBit6Mode[2]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N56), .QN(enc_n26) );
  DFEC1 enc_perBit7nextMode_reg_2_ ( .D(perBit7Mode[2]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N59), .QN(enc_n27) );
  DFEC1 enc_encXor_reg_7_ ( .D(enc_N284), .E(enc_xorEnable), .C(clk), .RN(rst), 
        .Q(n289), .QN(n41) );
  DFEC1 enc_encPer_reg_5_ ( .D(enc_n213), .E(enc_perEnable), .C(clk), .RN(rst), 
        .Q(n339), .QN(enc_n349) );
  DFEC1 enc_encPer_reg_4_ ( .D(enc_n212), .E(enc_perEnable), .C(clk), .RN(rst), 
        .Q(n340), .QN(enc_n348) );
  DFEC1 enc_encXor_reg_4_ ( .D(enc_N282), .E(enc_xorEnable), .C(clk), .RN(rst), 
        .Q(n287), .QN(n39) );
  DFEC1 enc_encXor_reg_5_ ( .D(enc_N283), .E(enc_xorEnable), .C(clk), .RN(rst), 
        .Q(n288), .QN(n38) );
  DFEC1 enc_encPer_reg_7_ ( .D(enc_n205), .E(enc_perEnable), .C(clk), .RN(rst), 
        .Q(n341), .QN(enc_n67) );
  DFEC1 dec_superKeysMode_reg_0_ ( .D(dec_N309), .E(intValid), .C(clk), .RN(
        rst), .Q(n293), .QN(n703) );
  DFEC1 enc_superKeysMode_reg_0_ ( .D(enc_N287), .E(enc_xorEnable), .C(clk), 
        .RN(rst), .Q(n736), .QN(n702) );
  DFEC1 enc_encShift_reg_7_ ( .D(din[7]), .E(en), .C(clk), .RN(rst), .QN(n707)
         );
  DFEC1 dec_currentMode_reg ( .D(intMode), .E(intValid), .C(clk), .RN(rst), 
        .Q(n704), .QN(n710) );
  DFEC1 dec_normalKeysMode_reg_0_ ( .D(n708), .E(intValid), .C(clk), .RN(rst), 
        .Q(n304) );
  DFEC1 enc_superKeysMode_reg_2_ ( .D(n290), .E(enc_xorEnable), .C(clk), .RN(
        rst), .Q(n314) );
  DFEC1 enc_normalKeysMode_reg_0_ ( .D(n709), .E(enc_xorEnable), .C(clk), .RN(
        rst), .Q(n316) );
  DFEC1 enc_encShift_reg_1_ ( .D(enc_N198), .E(en), .C(clk), .RN(rst), .QN(n30) );
  DFEC1 enc_encShift_reg_3_ ( .D(enc_N200), .E(en), .C(clk), .RN(rst), .QN(n34) );
  DFEC1 enc_encShift_reg_5_ ( .D(din[5]), .E(en), .C(clk), .RN(rst), .QN(n27)
         );
  DFEC1 enc_encShift_reg_0_ ( .D(enc_N197), .E(en), .C(clk), .RN(rst), .QN(n29) );
  DFEC1 enc_encShift_reg_2_ ( .D(enc_N199), .E(en), .C(clk), .RN(rst), .QN(n33) );
  DFEC1 enc_encShift_reg_4_ ( .D(enc_N201), .E(en), .C(clk), .RN(rst), .QN(n28) );
  DFEC1 enc_encShift_reg_6_ ( .D(din[6]), .E(en), .C(clk), .RN(rst), .QN(n31)
         );
  DFEC1 dec_decXor_reg_7_ ( .D(dec_N306), .E(intValid), .C(clk), .RN(rst), .Q(
        n1), .QN(n738) );
  DFEC1 dec_normalKeysMode_reg_1_ ( .D(dec_n408), .E(intValid), .C(clk), .RN(
        rst), .Q(n352), .QN(n35) );
  DFEC1 dec_decXor_reg_4_ ( .D(dec_N304), .E(intValid), .C(clk), .RN(rst), .Q(
        n25) );
  DFEC1 dec_decXor_reg_5_ ( .D(dec_N305), .E(intValid), .C(clk), .RN(rst), .Q(
        n731), .QN(dec_n43) );
  DFEC1 enc_normalKeysMode_reg_1_ ( .D(enc_n355), .E(enc_xorEnable), .C(clk), 
        .RN(rst), .Q(n735), .QN(enc_n343) );
  DFEC1 enc_superKeysMode_reg_1_ ( .D(enc_N288), .E(enc_xorEnable), .C(clk), 
        .RN(rst), .QN(n23) );
  DFEC1 enc_perBit6nextMode_reg_1_ ( .D(perBit6Mode[1]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N55), .QN(enc_n18) );
  DFEC1 enc_perBit7nextMode_reg_1_ ( .D(perBit7Mode[1]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N58), .QN(enc_n19) );
  DFEC1 enc_perBit5nextMode_reg_2_ ( .D(perBit5Mode[2]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N53), .QN(enc_n25) );
  DFEC1 enc_perBit4nextMode_reg_2_ ( .D(perBit4Mode[2]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N50), .QN(enc_n24) );
  DFEC1 enc_perBit3nextMode_reg_2_ ( .D(perBit3Mode[2]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N47), .QN(enc_n23) );
  DFEC1 enc_perBit2nextMode_reg_2_ ( .D(perBit2Mode[2]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N44), .QN(enc_n22) );
  DFEC1 enc_perBit1nextMode_reg_2_ ( .D(perBit1Mode[2]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N41), .QN(enc_n21) );
  DFEC1 enc_perBit0nextMode_reg_2_ ( .D(perBit0Mode[2]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N38), .QN(enc_n20) );
  DFEC1 dec_superKeysMode_reg_2_ ( .D(n292), .E(intValid), .C(clk), .RN(rst), 
        .Q(n701) );
  DFEC1 dec_perBit7currentMode_reg_2_ ( .D(intPerBit7Mode[2]), .E(n741), .C(
        clk), .RN(rst), .Q(n711), .QN(n697) );
  DFEC1 dec_decXor_reg_3_ ( .D(dec_N303), .E(intValid), .C(clk), .RN(rst), .Q(
        n725), .QN(dec_n448) );
  DFEC1 dec_currentShiftMode_reg_1_ ( .D(dec_nextShiftMode[1]), .E(
        dec_perEnable), .C(clk), .RN(rst), .QN(dec_n406) );
  DFEC1 dec_decPer_reg_4_ ( .D(dec_n393), .E(dec_n385), .C(clk), .RN(rst), .Q(
        n730), .QN(dec_n176) );
  DFEC1 dec_decPer_reg_3_ ( .D(dec_n394), .E(dec_n386), .C(clk), .RN(rst), .Q(
        n716), .QN(dec_n61) );
  DFEC1 dec_decXor_reg_1_ ( .D(intData[1]), .E(intValid), .C(clk), .RN(rst), 
        .Q(n335), .QN(dec_n45) );
  DFEC1 dec_decXor_reg_0_ ( .D(dec_N302), .E(intValid), .C(clk), .RN(rst), .Q(
        n338), .QN(dec_n46) );
  DFEC1 dec_decShift_reg_0_ ( .D(dec_N1235), .E(dec_shiftEnable), .C(clk), 
        .RN(rst), .Q(dout[0]) );
  DFEC1 dec_decShift_reg_1_ ( .D(dec_N1236), .E(dec_shiftEnable), .C(clk), 
        .RN(rst), .Q(dout[1]) );
  DFEC1 dec_decShift_reg_2_ ( .D(dec_N1237), .E(dec_shiftEnable), .C(clk), 
        .RN(rst), .Q(dout[2]) );
  DFEC1 dec_decShift_reg_3_ ( .D(dec_N1238), .E(dec_shiftEnable), .C(clk), 
        .RN(rst), .Q(dout[3]) );
  DFEC1 dec_decShift_reg_4_ ( .D(dec_N1239), .E(dec_shiftEnable), .C(clk), 
        .RN(rst), .Q(dout[4]) );
  DFEC1 dec_decShift_reg_5_ ( .D(dec_N1240), .E(dec_shiftEnable), .C(clk), 
        .RN(rst), .Q(dout[5]) );
  DFEC1 dec_decShift_reg_6_ ( .D(n325), .E(dec_shiftEnable), .C(clk), .RN(rst), 
        .Q(dout[6]) );
  DFEC1 dec_decShift_reg_7_ ( .D(dec_n170), .E(dec_shiftEnable), .C(clk), .RN(
        rst), .Q(dout[7]) );
  DFEC1 enc_perBit7ModeSyn_reg_0_ ( .D(enc_n32), .E(enc_n215), .C(clk), .RN(
        rst), .Q(intPerBit7Mode[0]) );
  DFEC1 enc_perBit7ModeSyn_reg_1_ ( .D(enc_n33), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit7Mode[1]) );
  DFEC1 enc_perBit7ModeSyn_reg_2_ ( .D(enc_n34), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit7Mode[2]) );
  DFEC1 enc_perBit6ModeSyn_reg_0_ ( .D(enc_n35), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit6Mode[0]) );
  DFEC1 enc_perBit6ModeSyn_reg_1_ ( .D(enc_n36), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit6Mode[1]) );
  DFEC1 enc_perBit6ModeSyn_reg_2_ ( .D(enc_n37), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit6Mode[2]) );
  DFEC1 enc_perBit5ModeSyn_reg_0_ ( .D(enc_n38), .E(enc_n215), .C(clk), .RN(
        rst), .Q(intPerBit5Mode[0]) );
  DFEC1 enc_perBit5ModeSyn_reg_1_ ( .D(enc_n39), .E(enc_n215), .C(clk), .RN(
        rst), .Q(intPerBit5Mode[1]) );
  DFEC1 enc_perBit5ModeSyn_reg_2_ ( .D(enc_n40), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit5Mode[2]) );
  DFEC1 enc_perBit4ModeSyn_reg_0_ ( .D(enc_n41), .E(enc_n215), .C(clk), .RN(
        rst), .Q(intPerBit4Mode[0]) );
  DFEC1 enc_perBit4ModeSyn_reg_1_ ( .D(enc_n42), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit4Mode[1]) );
  DFEC1 enc_perBit4ModeSyn_reg_2_ ( .D(enc_n43), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit4Mode[2]) );
  DFEC1 enc_perBit3ModeSyn_reg_0_ ( .D(enc_n44), .E(enc_n215), .C(clk), .RN(
        rst), .Q(intPerBit3Mode[0]) );
  DFEC1 enc_perBit3ModeSyn_reg_1_ ( .D(enc_n45), .E(enc_n215), .C(clk), .RN(
        rst), .Q(intPerBit3Mode[1]) );
  DFEC1 enc_perBit3ModeSyn_reg_2_ ( .D(enc_n46), .E(enc_n215), .C(clk), .RN(
        rst), .Q(intPerBit3Mode[2]) );
  DFEC1 enc_perBit2ModeSyn_reg_0_ ( .D(enc_n47), .E(enc_n215), .C(clk), .RN(
        rst), .Q(intPerBit2Mode[0]) );
  DFEC1 enc_perBit2ModeSyn_reg_1_ ( .D(enc_n48), .E(enc_n215), .C(clk), .RN(
        rst), .Q(intPerBit2Mode[1]) );
  DFEC1 enc_perBit2ModeSyn_reg_2_ ( .D(enc_n49), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit2Mode[2]) );
  DFEC1 enc_perBit1ModeSyn_reg_0_ ( .D(enc_n50), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit1Mode[0]) );
  DFEC1 enc_perBit1ModeSyn_reg_1_ ( .D(enc_n51), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit1Mode[1]) );
  DFEC1 enc_perBit1ModeSyn_reg_2_ ( .D(enc_n52), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit1Mode[2]) );
  DFEC1 enc_perBit0ModeSyn_reg_0_ ( .D(enc_n53), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit0Mode[0]) );
  DFEC1 enc_perBit0ModeSyn_reg_1_ ( .D(enc_n54), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit0Mode[1]) );
  DFEC1 enc_perBit0ModeSyn_reg_2_ ( .D(enc_n55), .E(n743), .C(clk), .RN(rst), 
        .Q(intPerBit0Mode[2]) );
  DFEC1 enc_nextShiftMode_reg_0_ ( .D(shiftMode[0]), .E(en), .C(clk), .RN(rst), 
        .Q(enc_nextShiftMode[0]) );
  DFEC1 enc_nextShiftMode_reg_1_ ( .D(shiftMode[1]), .E(en), .C(clk), .RN(rst), 
        .Q(enc_nextShiftMode[1]) );
  DFEC1 enc_perBit7currentMode_reg_0_ ( .D(enc_N57), .E(enc_n207), .C(clk), 
        .RN(rst), .Q(enc_n32) );
  DFEC1 enc_perBit7currentMode_reg_1_ ( .D(enc_N58), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n33) );
  DFEC1 enc_perBit7currentMode_reg_2_ ( .D(enc_N59), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n34) );
  DFEC1 enc_perBit6currentMode_reg_0_ ( .D(enc_N54), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n35) );
  DFEC1 enc_perBit6currentMode_reg_1_ ( .D(enc_N55), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n36) );
  DFEC1 enc_perBit6currentMode_reg_2_ ( .D(enc_N56), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n37) );
  DFEC1 enc_perBit5currentMode_reg_0_ ( .D(enc_N51), .E(enc_n207), .C(clk), 
        .RN(rst), .Q(enc_n38) );
  DFEC1 enc_perBit5currentMode_reg_1_ ( .D(enc_N52), .E(enc_n207), .C(clk), 
        .RN(rst), .Q(enc_n39) );
  DFEC1 enc_perBit5currentMode_reg_2_ ( .D(enc_N53), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n40) );
  DFEC1 enc_perBit4currentMode_reg_0_ ( .D(enc_N48), .E(enc_n207), .C(clk), 
        .RN(rst), .Q(enc_n41) );
  DFEC1 enc_perBit4currentMode_reg_1_ ( .D(enc_N49), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n42) );
  DFEC1 enc_perBit4currentMode_reg_2_ ( .D(enc_N50), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n43) );
  DFEC1 enc_perBit3currentMode_reg_0_ ( .D(enc_N45), .E(enc_n207), .C(clk), 
        .RN(rst), .Q(enc_n44) );
  DFEC1 enc_perBit3currentMode_reg_1_ ( .D(enc_N46), .E(enc_n207), .C(clk), 
        .RN(rst), .Q(enc_n45) );
  DFEC1 enc_perBit3currentMode_reg_2_ ( .D(enc_N47), .E(enc_n207), .C(clk), 
        .RN(rst), .Q(enc_n46) );
  DFEC1 enc_perBit2currentMode_reg_0_ ( .D(enc_N42), .E(enc_n207), .C(clk), 
        .RN(rst), .Q(enc_n47) );
  DFEC1 enc_perBit2currentMode_reg_1_ ( .D(enc_N43), .E(enc_n207), .C(clk), 
        .RN(rst), .Q(enc_n48) );
  DFEC1 enc_perBit2currentMode_reg_2_ ( .D(enc_N44), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n49) );
  DFEC1 enc_perBit1currentMode_reg_0_ ( .D(enc_N39), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n50) );
  DFEC1 enc_perBit1currentMode_reg_1_ ( .D(enc_N40), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n51) );
  DFEC1 enc_perBit1currentMode_reg_2_ ( .D(enc_N41), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n52) );
  DFEC1 enc_perBit0currentMode_reg_0_ ( .D(enc_N36), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n53) );
  DFEC1 enc_perBit0currentMode_reg_1_ ( .D(enc_N37), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n54) );
  DFEC1 enc_perBit0currentMode_reg_2_ ( .D(enc_N38), .E(n742), .C(clk), .RN(
        rst), .Q(enc_n55) );
  DFEC1 enc_currentShiftMode_reg_0_ ( .D(enc_nextShiftMode[0]), .E(
        enc_perEnable), .C(clk), .RN(rst), .Q(enc_currentShiftMode[0]) );
  DFEC1 enc_currentShiftMode_reg_1_ ( .D(enc_nextShiftMode[1]), .E(
        enc_perEnable), .C(clk), .RN(rst), .Q(enc_currentShiftMode[1]) );
  DFEC1 enc_encXor_reg_1_ ( .D(enc_encPer[1]), .E(enc_xorEnable), .C(clk), 
        .RN(rst), .Q(intData[1]) );
  DFEC1 enc_encXor_reg_2_ ( .D(enc_encPer[2]), .E(enc_xorEnable), .C(clk), 
        .RN(rst), .Q(intData[2]) );
  DFEC1 enc_encXor_reg_6_ ( .D(enc_encPer[6]), .E(enc_xorEnable), .C(clk), 
        .RN(rst), .Q(intData[6]) );
  DFEC1 enc_shiftModeSyn_reg_0_ ( .D(enc_currentShiftMode[0]), .E(
        enc_xorEnable), .C(clk), .RN(rst), .Q(intShiftMode[0]) );
  DFEC1 enc_shiftModeSyn_reg_1_ ( .D(enc_currentShiftMode[1]), .E(
        enc_xorEnable), .C(clk), .RN(rst), .Q(intShiftMode[1]) );
  DFEC1 enc_encPer_reg_1_ ( .D(enc_n209), .E(enc_perEnable), .C(clk), .RN(rst), 
        .Q(enc_encPer[1]) );
  DFEC1 enc_encPer_reg_2_ ( .D(enc_n210), .E(enc_perEnable), .C(clk), .RN(rst), 
        .Q(enc_encPer[2]) );
  DFEC1 enc_encPer_reg_6_ ( .D(enc_n214), .E(enc_perEnable), .C(clk), .RN(rst), 
        .Q(enc_encPer[6]) );
  DFEC1 dec_decPer_reg_5_ ( .D(dec_n392), .E(dec_n384), .C(clk), .RN(rst), .Q(
        dec_N1240) );
  DFEC1 dec_nextShiftMode_reg_0_ ( .D(intShiftMode[0]), .E(intValid), .C(clk), 
        .RN(rst), .Q(dec_nextShiftMode[0]) );
  DFEC1 dec_nextShiftMode_reg_1_ ( .D(intShiftMode[1]), .E(intValid), .C(clk), 
        .RN(rst), .Q(dec_nextShiftMode[1]) );
  DFEC1 enc_currentMode_reg ( .D(enc_nextMode), .E(enc_perEnable), .C(clk), 
        .RN(rst), .Q(enc_currentMode), .QN(enc_n74) );
  DFEC1 enc_modeSyn_reg ( .D(enc_currentMode), .E(enc_xorEnable), .C(clk), 
        .RN(rst), .Q(intMode), .QN(n19) );
  DFEC1 dec_decPer_reg_7_ ( .D(dec_n390), .E(dec_n382), .C(clk), .RN(rst), .Q(
        dec_n170), .QN(dec_n381) );
  DFEC1 dec_decPer_reg_6_ ( .D(dec_n391), .E(dec_n383), .C(clk), .RN(rst), .Q(
        n325) );
  DFEC1 dec_currentShiftMode_reg_0_ ( .D(dec_nextShiftMode[0]), .E(
        dec_perEnable), .C(clk), .RN(rst), .Q(n700), .QN(n332) );
  DFEC1 dec_superKeysMode_reg_1_ ( .D(dec_N310), .E(intValid), .C(clk), .RN(
        rst), .Q(n737), .QN(n37) );
  DFEC1 enc_perBit1nextMode_reg_1_ ( .D(perBit1Mode[1]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N40), .QN(enc_n13) );
  DFEC1 enc_perBit2nextMode_reg_1_ ( .D(perBit2Mode[1]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N43), .QN(enc_n14) );
  DFEC1 enc_perBit5nextMode_reg_1_ ( .D(perBit5Mode[1]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N52), .QN(enc_n17) );
  DFEC1 enc_perBit4nextMode_reg_1_ ( .D(perBit4Mode[1]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N49), .QN(enc_n16) );
  DFEC1 enc_perBit3nextMode_reg_1_ ( .D(perBit3Mode[1]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N46), .QN(enc_n15) );
  DFEC1 enc_perBit0nextMode_reg_1_ ( .D(perBit0Mode[1]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N37), .QN(enc_n12) );
  DFEC1 enc_perBit6nextMode_reg_0_ ( .D(perBit6Mode[0]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N54), .QN(enc_n10) );
  DFEC1 enc_perBit7nextMode_reg_0_ ( .D(perBit7Mode[0]), .E(en), .C(clk), .RN(
        rst), .Q(enc_N57), .QN(enc_n11) );
  DFEC1 dec_perBit0currentMode_reg_2_ ( .D(intPerBit0Mode[2]), .E(n741), .C(
        clk), .RN(rst), .Q(n734), .QN(n26) );
  DFEC1 dec_perBit6currentMode_reg_2_ ( .D(intPerBit6Mode[2]), .E(n741), .C(
        clk), .RN(rst), .Q(n733), .QN(n699) );
  DFEC1 dec_perBit7currentMode_reg_1_ ( .D(intPerBit7Mode[1]), .E(dec_n409), 
        .C(clk), .RN(rst), .Q(n732), .QN(n20) );
  DFEC1 dec_perBit5currentMode_reg_0_ ( .D(intPerBit5Mode[0]), .E(n741), .C(
        clk), .RN(rst), .Q(n729), .QN(n21) );
  DFEC1 dec_perBit4currentMode_reg_0_ ( .D(intPerBit4Mode[0]), .E(dec_n409), 
        .C(clk), .RN(rst), .Q(n728), .QN(n18) );
  DFEC1 dec_perBit3currentMode_reg_0_ ( .D(intPerBit3Mode[0]), .E(n741), .C(
        clk), .RN(rst), .Q(n727), .QN(n17) );
  DFEC1 dec_decPer_reg_2_ ( .D(dec_n395), .E(dec_n387), .C(clk), .RN(rst), .Q(
        dec_n64), .QN(n726) );
  DFEC1 dec_perBit2currentMode_reg_0_ ( .D(intPerBit2Mode[0]), .E(dec_n409), 
        .C(clk), .RN(rst), .Q(n724), .QN(n15) );
  DFEC1 dec_perBit1currentMode_reg_0_ ( .D(intPerBit1Mode[0]), .E(dec_n409), 
        .C(clk), .RN(rst), .Q(n723), .QN(n14) );
  DFEC1 dec_perBit0currentMode_reg_0_ ( .D(intPerBit0Mode[0]), .E(dec_n409), 
        .C(clk), .RN(rst), .Q(n722), .QN(n2) );
  DFEC1 dec_perBit4currentMode_reg_1_ ( .D(intPerBit4Mode[1]), .E(dec_n409), 
        .C(clk), .RN(rst), .Q(n721), .QN(n9) );
  DFEC1 dec_perBit5currentMode_reg_1_ ( .D(intPerBit5Mode[1]), .E(dec_n409), 
        .C(clk), .RN(rst), .Q(n720), .QN(n8) );
  DFEC1 dec_perBit3currentMode_reg_1_ ( .D(intPerBit3Mode[1]), .E(n741), .C(
        clk), .RN(rst), .Q(n719), .QN(n3) );
  DFEC1 dec_perBit6currentMode_reg_1_ ( .D(intPerBit6Mode[1]), .E(dec_n409), 
        .C(clk), .RN(rst), .Q(n718), .QN(n12) );
  DFEC1 dec_perBit7currentMode_reg_0_ ( .D(intPerBit7Mode[0]), .E(dec_n409), 
        .C(clk), .RN(rst), .Q(n717), .QN(n11) );
  DFEC1 dec_perBit2currentMode_reg_1_ ( .D(intPerBit2Mode[1]), .E(n741), .C(
        clk), .RN(rst), .Q(n715), .QN(n5) );
  DFEC1 dec_perBit1currentMode_reg_1_ ( .D(intPerBit1Mode[1]), .E(n741), .C(
        clk), .RN(rst), .Q(n714), .QN(n4) );
  DFEC1 dec_perBit0currentMode_reg_1_ ( .D(intPerBit0Mode[1]), .E(n741), .C(
        clk), .RN(rst), .Q(n713), .QN(n10) );
  DFEC1 dec_perBit6currentMode_reg_0_ ( .D(intPerBit6Mode[0]), .E(n741), .C(
        clk), .RN(rst), .Q(n712), .QN(n22) );
  DFEC1 dec_decXor_reg_6_ ( .D(intData[6]), .E(intValid), .C(clk), .RN(rst), 
        .Q(n334), .QN(dec_n377) );
  DFEC1 dec_decPer_reg_0_ ( .D(dec_n397), .E(dec_n389), .C(clk), .RN(rst), .Q(
        n349), .QN(dec_n435) );
  DFEC1 dec_decPer_reg_1_ ( .D(dec_n396), .E(dec_n388), .C(clk), .RN(rst), .Q(
        n350), .QN(dec_n58) );
  MUX31 U534 ( .A(n571), .B(n725), .C(n25), .S0(n572), .S1(n569), .Q(n567) );
  MUX31 U535 ( .A(n582), .B(n731), .C(n334), .S0(n583), .S1(n580), .Q(n577) );
  MUX31 U536 ( .A(n556), .B(n725), .C(n25), .S0(n557), .S1(n554), .Q(n552) );
  MUX31 U537 ( .A(n597), .B(n731), .C(n334), .S0(n598), .S1(n595), .Q(n592) );
  MUX31 U538 ( .A(n567), .B(n731), .C(n334), .S0(n568), .S1(n565), .Q(n562) );
  MUX31 U539 ( .A(dec_n43), .B(n538), .C(dec_n377), .S0(n537), .S1(n536), .Q(
        n534) );
  NOR31 U540 ( .A(n686), .B(dec_n64), .C(dec_n58), .Q(n669) );
  MUX31 U541 ( .A(n552), .B(n731), .C(n334), .S0(n553), .S1(n550), .Q(n547) );
  AOI311 U542 ( .A(n227), .B(enc_r108_carry_2_), .C(n459), .D(n470), .Q(n469)
         );
  OAI2111 U543 ( .A(n226), .B(n483), .C(din[6]), .D(n484), .Q(n460) );
  BUF2 U544 ( .A(n707), .Q(n740) );
  INV3 U545 ( .A(n672), .Q(n348) );
  INV3 U546 ( .A(n681), .Q(n321) );
  INV3 U547 ( .A(n491), .Q(n285) );
  INV3 U548 ( .A(n708), .Q(n303) );
  INV3 U549 ( .A(n709), .Q(n315) );
  INV3 U550 ( .A(n492), .Q(n260) );
  INV3 U551 ( .A(n468), .Q(n218) );
  INV3 U552 ( .A(n664), .Q(n324) );
  OAI2111 U553 ( .A(n652), .B(n716), .C(n653), .D(n650), .Q(dec_N1238) );
  NAND22 U554 ( .A(n651), .B(n716), .Q(n653) );
  AOI221 U555 ( .A(n659), .B(n660), .C(n661), .D(n726), .Q(n652) );
  NOR21 U556 ( .A(n328), .B(n664), .Q(n659) );
  NOR21 U557 ( .A(n350), .B(n349), .Q(n672) );
  NAND22 U558 ( .A(n324), .B(n649), .Q(n662) );
  AOI221 U559 ( .A(n517), .B(n338), .C(n250), .D(n335), .Q(n516) );
  INV3 U560 ( .A(n517), .Q(n250) );
  AOI221 U561 ( .A(n502), .B(n338), .C(n249), .D(n335), .Q(n501) );
  INV3 U562 ( .A(n502), .Q(n249) );
  AOI221 U563 ( .A(n560), .B(n335), .C(n253), .D(n338), .Q(n559) );
  INV3 U564 ( .A(n560), .Q(n253) );
  AOI221 U565 ( .A(n590), .B(n335), .C(n255), .D(n338), .Q(n589) );
  INV3 U566 ( .A(n590), .Q(n255) );
  AOI221 U567 ( .A(n605), .B(n335), .C(n256), .D(n338), .Q(n604) );
  INV3 U568 ( .A(n605), .Q(n256) );
  AOI221 U569 ( .A(n575), .B(n335), .C(n254), .D(n338), .Q(n574) );
  INV3 U570 ( .A(n575), .Q(n254) );
  INV3 U571 ( .A(n584), .Q(n280) );
  INV3 U572 ( .A(n599), .Q(n281) );
  NAND31 U573 ( .A(n648), .B(n649), .C(n650), .Q(dec_N1239) );
  INV3 U574 ( .A(n660), .Q(n347) );
  INV3 U575 ( .A(n545), .Q(n252) );
  OAI2111 U576 ( .A(n675), .B(n662), .C(n676), .D(n677), .Q(dec_N1236) );
  AOI311 U577 ( .A(n687), .B(n348), .C(n657), .D(n688), .Q(n675) );
  OAI311 U578 ( .A(n664), .B(n321), .C(n678), .D(n350), .Q(n677) );
  INV3 U579 ( .A(n522), .Q(n283) );
  AOI221 U580 ( .A(n519), .B(n520), .C(n521), .D(n334), .Q(n518) );
  NOR21 U581 ( .A(n654), .B(n655), .Q(n650) );
  AOI211 U582 ( .A(n329), .B(n328), .C(n322), .Q(n655) );
  NAND22 U583 ( .A(n683), .B(n322), .Q(n681) );
  INV3 U584 ( .A(n529), .Q(n235) );
  INV3 U585 ( .A(n541), .Q(n236) );
  INV3 U586 ( .A(n511), .Q(n275) );
  INV3 U587 ( .A(n669), .Q(n322) );
  INV3 U588 ( .A(n514), .Q(n234) );
  INV3 U589 ( .A(n499), .Q(n233) );
  INV3 U590 ( .A(n544), .Q(n244) );
  INV3 U591 ( .A(n515), .Q(n242) );
  INV3 U592 ( .A(n500), .Q(n241) );
  INV3 U593 ( .A(n530), .Q(n243) );
  AOI211 U594 ( .A(n450), .B(enc_currentMode), .C(enc_n355), .Q(n448) );
  NAND31 U595 ( .A(n732), .B(n711), .C(n717), .Q(n593) );
  NOR31 U596 ( .A(n712), .B(n718), .C(n733), .Q(n492) );
  NOR31 U597 ( .A(n732), .B(n717), .C(n711), .Q(n491) );
  INV3 U598 ( .A(n657), .Q(n328) );
  NOR21 U599 ( .A(n316), .B(enc_currentMode), .Q(n709) );
  NOR21 U600 ( .A(intMode), .B(n304), .Q(n708) );
  NAND22 U601 ( .A(n517), .B(n515), .Q(n612) );
  NAND22 U602 ( .A(n502), .B(n500), .Q(n608) );
  INV3 U603 ( .A(n674), .Q(n331) );
  NAND22 U604 ( .A(n262), .B(n548), .Q(n623) );
  INV3 U605 ( .A(n683), .Q(n329) );
  INV3 U606 ( .A(n506), .Q(n284) );
  INV3 U607 ( .A(n526), .Q(n276) );
  INV3 U608 ( .A(n496), .Q(n274) );
  INV3 U609 ( .A(n525), .Q(n268) );
  INV3 U610 ( .A(n533), .Q(n282) );
  INV3 U611 ( .A(n537), .Q(n269) );
  INV3 U612 ( .A(n510), .Q(n267) );
  INV3 U613 ( .A(n495), .Q(n266) );
  INV3 U614 ( .A(n540), .Q(n277) );
  INV3 U615 ( .A(n595), .Q(n265) );
  INV3 U616 ( .A(n565), .Q(n263) );
  INV3 U617 ( .A(n580), .Q(n264) );
  INV3 U618 ( .A(n550), .Q(n262) );
  INV3 U619 ( .A(n523), .Q(n258) );
  BUF2 U620 ( .A(enc_n207), .Q(n742) );
  BUF2 U621 ( .A(enc_n215), .Q(n743) );
  INV3 U622 ( .A(n507), .Q(n259) );
  INV3 U623 ( .A(n663), .Q(n330) );
  NOR21 U624 ( .A(n350), .B(n674), .Q(n688) );
  INV3 U625 ( .A(n673), .Q(n326) );
  BUF2 U626 ( .A(dec_n409), .Q(n741) );
  AOI311 U627 ( .A(n225), .B(n465), .C(n224), .D(n471), .Q(n435) );
  NOR21 U628 ( .A(n460), .B(n435), .Q(n459) );
  AOI211 U629 ( .A(n229), .B(n459), .C(n460), .Q(n468) );
  INV3 U630 ( .A(enc_r108_carry_2_), .Q(n229) );
  NAND22 U631 ( .A(enc_r108_carry_2_), .B(n459), .Q(n455) );
  INV3 U632 ( .A(n482), .Q(n225) );
  NOR40 U633 ( .A(n471), .B(n232), .C(n225), .D(n231), .Q(n470) );
  NAND22 U634 ( .A(n232), .B(n230), .Q(enc_n344) );
  INV3 U635 ( .A(n460), .Q(n221) );
  AOI221 U636 ( .A(n222), .B(n473), .C(enc_N128), .D(n459), .Q(n472) );
  INV3 U637 ( .A(n471), .Q(n222) );
  INV3 U638 ( .A(n467), .Q(n224) );
  NAND42 U639 ( .A(dec_n381), .B(n691), .C(n692), .D(n325), .Q(n664) );
  NAND31 U640 ( .A(n730), .B(n716), .C(n347), .Q(n691) );
  NAND41 U641 ( .A(n672), .B(dec_n61), .C(dec_n176), .D(n726), .Q(n692) );
  NOR31 U642 ( .A(n724), .B(n695), .C(n715), .Q(n558) );
  NOR31 U643 ( .A(n5), .B(n695), .C(n724), .Q(n588) );
  NOR31 U644 ( .A(n5), .B(n695), .C(n15), .Q(n603) );
  NOR31 U645 ( .A(n15), .B(n695), .C(n715), .Q(n573) );
  NOR31 U646 ( .A(n723), .B(n694), .C(n714), .Q(n560) );
  NOR31 U647 ( .A(n4), .B(n694), .C(n723), .Q(n590) );
  NOR31 U648 ( .A(n4), .B(n694), .C(n14), .Q(n605) );
  NOR31 U649 ( .A(n14), .B(n694), .C(n714), .Q(n575) );
  AOI211 U650 ( .A(n349), .B(n350), .C(dec_n64), .Q(n660) );
  NAND31 U651 ( .A(n4), .B(n723), .C(n694), .Q(n517) );
  NAND31 U652 ( .A(n4), .B(n14), .C(n694), .Q(n502) );
  NAND31 U653 ( .A(n723), .B(n714), .C(n694), .Q(n545) );
  AOI221 U654 ( .A(n539), .B(n540), .C(n277), .D(n25), .Q(n538) );
  AOI221 U655 ( .A(n543), .B(n544), .C(n244), .D(n318), .Q(n542) );
  NAND31 U656 ( .A(n324), .B(n327), .C(n656), .Q(n651) );
  INV3 U657 ( .A(n658), .Q(n327) );
  AOI211 U658 ( .A(n657), .B(n347), .C(dec_n64), .Q(n656) );
  NOR31 U659 ( .A(n664), .B(n331), .C(n683), .Q(n689) );
  AOI221 U660 ( .A(n324), .B(n657), .C(n320), .D(n326), .Q(n690) );
  INV3 U661 ( .A(n662), .Q(n320) );
  AOI221 U662 ( .A(n509), .B(n510), .C(n267), .D(n731), .Q(n508) );
  AOI221 U663 ( .A(n513), .B(n514), .C(n234), .D(n725), .Q(n512) );
  AOI221 U664 ( .A(n494), .B(n495), .C(n266), .D(n731), .Q(n493) );
  AOI221 U665 ( .A(n498), .B(n499), .C(n233), .D(n725), .Q(n497) );
  INV3 U666 ( .A(n558), .Q(n245) );
  AOI221 U667 ( .A(n586), .B(n239), .C(n587), .D(n725), .Q(n585) );
  INV3 U668 ( .A(n587), .Q(n239) );
  INV3 U669 ( .A(n588), .Q(n247) );
  AOI221 U670 ( .A(n601), .B(n240), .C(n602), .D(n725), .Q(n600) );
  INV3 U671 ( .A(n602), .Q(n240) );
  INV3 U672 ( .A(n603), .Q(n248) );
  INV3 U673 ( .A(n573), .Q(n246) );
  AOI311 U674 ( .A(n504), .B(n284), .C(n739), .D(n505), .Q(n503) );
  NOR21 U675 ( .A(n490), .B(n284), .Q(n505) );
  AOI311 U676 ( .A(n592), .B(n593), .C(n739), .D(n594), .Q(n591) );
  NOR21 U677 ( .A(n490), .B(n593), .Q(n594) );
  AOI311 U678 ( .A(n488), .B(n285), .C(n739), .D(n489), .Q(n487) );
  NOR21 U679 ( .A(n490), .B(n285), .Q(n489) );
  AOI311 U680 ( .A(n547), .B(n548), .C(n739), .D(n549), .Q(n546) );
  NOR21 U681 ( .A(n490), .B(n548), .Q(n549) );
  AOI311 U682 ( .A(n577), .B(n578), .C(n739), .D(n579), .Q(n576) );
  NOR21 U683 ( .A(n490), .B(n578), .Q(n579) );
  AOI311 U684 ( .A(n562), .B(n563), .C(n739), .D(n564), .Q(n561) );
  NOR21 U685 ( .A(n490), .B(n563), .Q(n564) );
  NAND41 U686 ( .A(dec_n61), .B(dec_n381), .C(dec_n176), .D(n325), .Q(n686) );
  NOR31 U687 ( .A(n728), .B(n698), .C(n721), .Q(n554) );
  NOR31 U688 ( .A(n9), .B(n698), .C(n728), .Q(n584) );
  NOR31 U689 ( .A(n9), .B(n698), .C(n18), .Q(n599) );
  NOR31 U690 ( .A(n18), .B(n698), .C(n721), .Q(n569) );
  NOR31 U691 ( .A(n727), .B(n693), .C(n719), .Q(n557) );
  NOR31 U692 ( .A(n3), .B(n693), .C(n727), .Q(n587) );
  NOR31 U693 ( .A(n3), .B(n693), .C(n17), .Q(n602) );
  NOR31 U694 ( .A(n17), .B(n693), .C(n719), .Q(n572) );
  NOR31 U695 ( .A(n729), .B(n696), .C(n720), .Q(n553) );
  NOR31 U696 ( .A(n8), .B(n696), .C(n729), .Q(n583) );
  NOR31 U697 ( .A(n8), .B(n696), .C(n21), .Q(n598) );
  NOR31 U698 ( .A(n21), .B(n696), .C(n720), .Q(n568) );
  NAND31 U699 ( .A(n5), .B(n724), .C(n695), .Q(n515) );
  NAND31 U700 ( .A(n5), .B(n15), .C(n695), .Q(n500) );
  NAND31 U701 ( .A(n15), .B(n715), .C(n695), .Q(n530) );
  NAND31 U702 ( .A(n14), .B(n714), .C(n694), .Q(n532) );
  NOR21 U703 ( .A(n686), .B(dec_n64), .Q(n680) );
  AOI311 U704 ( .A(n669), .B(dec_n435), .C(n331), .D(n685), .Q(n684) );
  NOR40 U705 ( .A(n686), .B(n329), .C(n348), .D(n726), .Q(n685) );
  NAND31 U706 ( .A(n3), .B(n727), .C(n693), .Q(n514) );
  NAND31 U707 ( .A(n3), .B(n17), .C(n693), .Q(n499) );
  NAND31 U708 ( .A(n724), .B(n715), .C(n695), .Q(n544) );
  NAND31 U709 ( .A(n17), .B(n719), .C(n693), .Q(n529) );
  NAND31 U710 ( .A(n727), .B(n719), .C(n693), .Q(n541) );
  NAND31 U711 ( .A(n9), .B(n728), .C(n698), .Q(n511) );
  OAI2111 U712 ( .A(n665), .B(n662), .C(n666), .D(n667), .Q(dec_N1237) );
  AOI211 U713 ( .A(n330), .B(n726), .C(n668), .Q(n665) );
  NAND22 U714 ( .A(dec_n64), .B(n664), .Q(n667) );
  NAND31 U715 ( .A(n324), .B(n726), .C(n321), .Q(n666) );
  AOI221 U716 ( .A(dec_n46), .B(n532), .C(dec_n45), .D(n251), .Q(n531) );
  INV3 U717 ( .A(n532), .Q(n251) );
  AOI2111 U718 ( .A(n524), .B(n525), .C(n523), .D(n522), .Q(n520) );
  AOI221 U719 ( .A(n528), .B(n529), .C(dec_n448), .D(n235), .Q(n527) );
  AOI211 U720 ( .A(n642), .B(intMode), .C(dec_n408), .Q(n641) );
  NOR31 U721 ( .A(n717), .B(n20), .C(n711), .Q(n522) );
  NAND31 U722 ( .A(dec_n58), .B(n349), .C(n680), .Q(n649) );
  AOI311 U723 ( .A(n697), .B(n732), .C(n717), .D(n710), .Q(n533) );
  NOR31 U724 ( .A(n712), .B(n12), .C(n733), .Q(n523) );
  NOR31 U725 ( .A(n718), .B(n22), .C(n733), .Q(n507) );
  NAND31 U726 ( .A(n11), .B(n711), .C(n20), .Q(n548) );
  NAND31 U727 ( .A(n717), .B(n711), .C(n20), .Q(n563) );
  NAND31 U728 ( .A(n732), .B(n711), .C(n11), .Q(n578) );
  NOR31 U729 ( .A(n12), .B(n22), .C(n733), .Q(n536) );
  AOI211 U730 ( .A(dec_n58), .B(n331), .C(n672), .Q(n663) );
  NAND22 U731 ( .A(enc_n74), .B(n316), .Q(n453) );
  NAND22 U732 ( .A(n19), .B(n304), .Q(n643) );
  NOR21 U733 ( .A(n706), .B(n16), .Q(enc_n207) );
  NAND31 U734 ( .A(n21), .B(n720), .C(n696), .Q(n525) );
  AOI211 U735 ( .A(n621), .B(n622), .C(n36), .Q(dec_n385) );
  NOR40 U736 ( .A(n558), .B(n560), .C(n624), .D(n710), .Q(n621) );
  NOR40 U737 ( .A(n553), .B(n623), .C(n554), .D(n557), .Q(n622) );
  NOR31 U738 ( .A(n722), .B(n26), .C(n713), .Q(n624) );
  AOI211 U739 ( .A(n610), .B(n611), .C(n36), .Q(dec_n388) );
  NOR40 U740 ( .A(n506), .B(n267), .C(n613), .D(n710), .Q(n610) );
  NOR40 U741 ( .A(n234), .B(n612), .C(n275), .D(n507), .Q(n611) );
  NOR31 U742 ( .A(n734), .B(n2), .C(n713), .Q(n613) );
  AOI211 U743 ( .A(n606), .B(n607), .C(n36), .Q(dec_n389) );
  NOR40 U744 ( .A(n491), .B(n266), .C(n609), .D(n710), .Q(n606) );
  NOR40 U745 ( .A(n233), .B(n608), .C(n274), .D(n492), .Q(n607) );
  NOR31 U746 ( .A(n734), .B(n713), .C(n722), .Q(n609) );
  NOR21 U747 ( .A(enc_n74), .B(enc_n203), .Q(enc_n215) );
  NAND31 U748 ( .A(n8), .B(n729), .C(n696), .Q(n510) );
  NAND31 U749 ( .A(n8), .B(n21), .C(n696), .Q(n495) );
  NAND31 U750 ( .A(n728), .B(n721), .C(n698), .Q(n540) );
  NOR21 U751 ( .A(n700), .B(dec_n406), .Q(n657) );
  AOI211 U752 ( .A(n629), .B(n630), .C(n36), .Q(dec_n383) );
  NOR40 U753 ( .A(n583), .B(n631), .C(n584), .D(n587), .Q(n630) );
  NOR40 U754 ( .A(n588), .B(n590), .C(n632), .D(n710), .Q(n629) );
  NAND22 U755 ( .A(n264), .B(n578), .Q(n631) );
  AOI211 U756 ( .A(n633), .B(n634), .C(n36), .Q(dec_n382) );
  NOR40 U757 ( .A(n598), .B(n635), .C(n599), .D(n602), .Q(n634) );
  NOR40 U758 ( .A(n603), .B(n605), .C(n636), .D(n710), .Q(n633) );
  NAND22 U759 ( .A(n265), .B(n593), .Q(n635) );
  AOI211 U760 ( .A(n625), .B(n626), .C(n36), .Q(dec_n384) );
  NOR40 U761 ( .A(n568), .B(n627), .C(n569), .D(n572), .Q(n626) );
  NOR40 U762 ( .A(n573), .B(n575), .C(n628), .D(n710), .Q(n625) );
  NAND22 U763 ( .A(n263), .B(n563), .Q(n627) );
  NAND31 U764 ( .A(n9), .B(n18), .C(n698), .Q(n496) );
  NAND31 U765 ( .A(n729), .B(n720), .C(n696), .Q(n537) );
  NAND31 U766 ( .A(n18), .B(n721), .C(n698), .Q(n526) );
  AOI211 U767 ( .A(n618), .B(n619), .C(n36), .Q(dec_n386) );
  NOR40 U768 ( .A(n536), .B(n252), .C(n236), .D(n269), .Q(n619) );
  NOR40 U769 ( .A(n244), .B(n277), .C(n620), .D(n282), .Q(n618) );
  NOR31 U770 ( .A(n734), .B(n2), .C(n10), .Q(n620) );
  NOR31 U771 ( .A(n732), .B(n11), .C(n711), .Q(n506) );
  NOR31 U772 ( .A(n22), .B(n699), .C(n12), .Q(n595) );
  NOR31 U773 ( .A(n22), .B(n699), .C(n718), .Q(n565) );
  NOR31 U774 ( .A(n12), .B(n699), .C(n712), .Q(n580) );
  NAND22 U775 ( .A(dec_n406), .B(n332), .Q(n673) );
  NOR31 U776 ( .A(n718), .B(n699), .C(n712), .Q(n550) );
  NAND22 U777 ( .A(dec_n406), .B(n700), .Q(n674) );
  OAI311 U778 ( .A(n347), .B(n669), .C(n328), .D(n670), .Q(n668) );
  NOR31 U779 ( .A(n328), .B(dec_n58), .C(dec_n435), .Q(n671) );
  NOR21 U780 ( .A(n332), .B(dec_n406), .Q(n683) );
  NOR31 U781 ( .A(n722), .B(n26), .C(n10), .Q(n632) );
  NOR31 U782 ( .A(n713), .B(n26), .C(n2), .Q(n628) );
  NOR31 U783 ( .A(n734), .B(n10), .C(n722), .Q(n617) );
  AOI211 U784 ( .A(dec_n43), .B(n268), .C(n710), .Q(n519) );
  AOI211 U785 ( .A(n614), .B(n615), .C(n36), .Q(dec_n387) );
  NOR40 U786 ( .A(n235), .B(n616), .C(n276), .D(n523), .Q(n615) );
  NOR40 U787 ( .A(n522), .B(n268), .C(n617), .D(n710), .Q(n614) );
  NAND22 U788 ( .A(n532), .B(n530), .Q(n616) );
  NOR21 U789 ( .A(dec_n435), .B(n679), .Q(n678) );
  AOI211 U790 ( .A(n657), .B(n680), .C(n326), .Q(n679) );
  XNR21 U791 ( .A(enc_n162), .B(n454), .Q(enc_N280) );
  XNR21 U792 ( .A(intData[0]), .B(n647), .Q(dec_N302) );
  XNR21 U793 ( .A(n454), .B(enc_n341), .Q(enc_N281) );
  XNR21 U794 ( .A(n647), .B(n42), .Q(dec_N303) );
  INV3 U795 ( .A(n449), .Q(n313) );
  OAI2111 U796 ( .A(enc_n74), .B(n450), .C(n451), .D(n452), .Q(n449) );
  NAND31 U797 ( .A(n735), .B(n316), .C(enc_n74), .Q(n451) );
  NAND22 U798 ( .A(n709), .B(enc_n343), .Q(n452) );
  INV3 U799 ( .A(n644), .Q(n302) );
  OAI2111 U800 ( .A(n352), .B(n303), .C(n645), .D(n646), .Q(n644) );
  NAND31 U801 ( .A(n304), .B(n352), .C(n19), .Q(n645) );
  OAI2111 U802 ( .A(n701), .B(n37), .C(n639), .D(intMode), .Q(n646) );
  NAND22 U803 ( .A(n1), .B(n739), .Q(n490) );
  INV3 U804 ( .A(n27), .Q(n296) );
  INV3 U805 ( .A(n31), .Q(n300) );
  INV3 U806 ( .A(n28), .Q(n299) );
  INV3 U807 ( .A(n29), .Q(n297) );
  INV3 U808 ( .A(n30), .Q(n294) );
  INV3 U809 ( .A(n33), .Q(n298) );
  INV3 U810 ( .A(n34), .Q(n295) );
  NOR21 U811 ( .A(n6), .B(n19), .Q(dec_n409) );
  AOI211 U812 ( .A(enc_n27), .B(n437), .C(n438), .Q(n436) );
  AOI2111 U813 ( .A(n439), .B(enc_n19), .C(enc_n27), .D(n440), .Q(n438) );
  AOI211 U814 ( .A(enc_n4), .B(n428), .C(n429), .Q(n427) );
  AOI2111 U815 ( .A(n430), .B(enc_n20), .C(enc_n4), .D(n431), .Q(n429) );
  AOI211 U816 ( .A(enc_n7), .B(n404), .C(n405), .Q(n403) );
  AOI2111 U817 ( .A(n406), .B(enc_n23), .C(enc_n7), .D(n407), .Q(n405) );
  AOI211 U818 ( .A(enc_n8), .B(n396), .C(n397), .Q(n395) );
  AOI2111 U819 ( .A(n398), .B(enc_n24), .C(enc_n8), .D(n399), .Q(n397) );
  AOI211 U820 ( .A(enc_n9), .B(n388), .C(n389), .Q(n387) );
  AOI2111 U821 ( .A(n390), .B(enc_n25), .C(enc_n9), .D(n391), .Q(n389) );
  AOI211 U822 ( .A(enc_n26), .B(n380), .C(n381), .Q(n379) );
  AOI2111 U823 ( .A(n382), .B(enc_n18), .C(enc_n26), .D(n383), .Q(n381) );
  AOI211 U824 ( .A(enc_n6), .B(n412), .C(n413), .Q(n411) );
  AOI2111 U825 ( .A(n414), .B(enc_n22), .C(enc_n6), .D(n415), .Q(n413) );
  AOI211 U826 ( .A(enc_n5), .B(n420), .C(n421), .Q(n419) );
  AOI2111 U827 ( .A(n422), .B(enc_n21), .C(enc_n5), .D(n423), .Q(n421) );
  BUF6 U828 ( .A(n704), .Q(n739) );
  INV3 U829 ( .A(n444), .Q(n290) );
  AOI221 U830 ( .A(n314), .B(enc_N287), .C(enc_currentMode), .D(n445), .Q(n444) );
  OAI311 U831 ( .A(n23), .B(n702), .C(n314), .D(n446), .Q(n445) );
  AOI2111 U832 ( .A(enc_n11), .B(n300), .C(enc_n19), .D(n441), .Q(n440) );
  NOR21 U833 ( .A(n740), .B(enc_n11), .Q(n441) );
  AOI2111 U834 ( .A(enc_n12), .B(n296), .C(enc_n20), .D(n432), .Q(n431) );
  NOR21 U835 ( .A(n740), .B(enc_n12), .Q(n432) );
  AOI2111 U836 ( .A(enc_n15), .B(n296), .C(enc_n23), .D(n408), .Q(n407) );
  NOR21 U837 ( .A(n740), .B(enc_n15), .Q(n408) );
  AOI2111 U838 ( .A(enc_n16), .B(n296), .C(enc_n24), .D(n400), .Q(n399) );
  NOR21 U839 ( .A(n740), .B(enc_n16), .Q(n400) );
  AOI2111 U840 ( .A(enc_n17), .B(n296), .C(enc_n25), .D(n392), .Q(n391) );
  NOR21 U841 ( .A(n740), .B(enc_n17), .Q(n392) );
  AOI2111 U842 ( .A(enc_n10), .B(n300), .C(enc_n18), .D(n384), .Q(n383) );
  NOR21 U843 ( .A(n740), .B(enc_n10), .Q(n384) );
  AOI2111 U844 ( .A(enc_n14), .B(n296), .C(enc_n22), .D(n416), .Q(n415) );
  NOR21 U845 ( .A(n740), .B(enc_n14), .Q(n416) );
  AOI2111 U846 ( .A(enc_n13), .B(n296), .C(enc_n21), .D(n424), .Q(n423) );
  NOR21 U847 ( .A(n740), .B(enc_n13), .Q(n424) );
  NAND22 U848 ( .A(n701), .B(n37), .Q(n639) );
  NOR31 U849 ( .A(n10), .B(n26), .C(n2), .Q(n636) );
  INV3 U850 ( .A(n25), .Q(n344) );
  AOI221 U851 ( .A(enc_N57), .B(n296), .C(enc_n11), .D(n299), .Q(n439) );
  AOI221 U852 ( .A(enc_N54), .B(n296), .C(enc_n10), .D(n299), .Q(n382) );
  AOI221 U853 ( .A(enc_N37), .B(n295), .C(enc_n12), .D(n294), .Q(n430) );
  AOI221 U854 ( .A(enc_N46), .B(n295), .C(enc_n15), .D(n294), .Q(n406) );
  AOI221 U855 ( .A(enc_N49), .B(n295), .C(enc_n16), .D(n294), .Q(n398) );
  AOI221 U856 ( .A(enc_N52), .B(n295), .C(enc_n17), .D(n294), .Q(n390) );
  AOI221 U857 ( .A(enc_N43), .B(n295), .C(enc_n14), .D(n294), .Q(n414) );
  AOI221 U858 ( .A(enc_N40), .B(n295), .C(enc_n13), .D(n294), .Q(n422) );
  NOR21 U859 ( .A(n293), .B(n19), .Q(dec_N309) );
  AOI221 U860 ( .A(enc_N37), .B(n300), .C(enc_n12), .D(n299), .Q(n434) );
  AOI221 U861 ( .A(enc_N46), .B(n300), .C(enc_n15), .D(n299), .Q(n410) );
  AOI221 U862 ( .A(enc_N49), .B(n300), .C(enc_n16), .D(n299), .Q(n402) );
  AOI221 U863 ( .A(enc_N52), .B(n300), .C(enc_n17), .D(n299), .Q(n394) );
  AOI221 U864 ( .A(enc_N43), .B(n300), .C(enc_n14), .D(n299), .Q(n418) );
  AOI221 U865 ( .A(enc_N40), .B(n300), .C(enc_n13), .D(n299), .Q(n426) );
  AOI221 U866 ( .A(enc_N57), .B(n295), .C(enc_n11), .D(n298), .Q(n443) );
  AOI221 U867 ( .A(enc_N54), .B(n295), .C(enc_n10), .D(n298), .Q(n386) );
  AOI221 U868 ( .A(enc_N57), .B(n294), .C(enc_n11), .D(n297), .Q(n442) );
  AOI221 U869 ( .A(enc_N54), .B(n294), .C(enc_n10), .D(n297), .Q(n385) );
  AOI221 U870 ( .A(enc_N37), .B(n298), .C(enc_n12), .D(n297), .Q(n433) );
  AOI221 U871 ( .A(enc_N46), .B(n298), .C(enc_n15), .D(n297), .Q(n409) );
  AOI221 U872 ( .A(enc_N49), .B(n298), .C(enc_n16), .D(n297), .Q(n401) );
  AOI221 U873 ( .A(enc_N52), .B(n298), .C(enc_n17), .D(n297), .Q(n393) );
  AOI221 U874 ( .A(enc_N43), .B(n298), .C(enc_n14), .D(n297), .Q(n417) );
  AOI221 U875 ( .A(enc_N40), .B(n298), .C(enc_n13), .D(n297), .Q(n425) );
  NOR21 U876 ( .A(enc_n74), .B(n447), .Q(enc_N288) );
  XNR21 U877 ( .A(n702), .B(n23), .Q(n447) );
  NAND22 U878 ( .A(n23), .B(n314), .Q(n446) );
  NOR21 U879 ( .A(n736), .B(enc_n74), .Q(enc_N287) );
  OAI311 U880 ( .A(n737), .B(n703), .C(n19), .D(n640), .Q(dec_N310) );
  NAND22 U881 ( .A(dec_N309), .B(n737), .Q(n640) );
  INV3 U882 ( .A(n637), .Q(n292) );
  AOI221 U883 ( .A(n701), .B(dec_N309), .C(intMode), .D(n638), .Q(n637) );
  OAI311 U884 ( .A(n703), .B(n701), .C(n37), .D(n639), .Q(n638) );
  AOI311 U885 ( .A(din[5]), .B(n435), .C(n16), .D(n744), .Q(enc_n206) );
  NAND22 U886 ( .A(din[4]), .B(n486), .Q(n483) );
  AOI311 U887 ( .A(n230), .B(n228), .C(n485), .D(din[7]), .Q(n484) );
  NAND41 U888 ( .A(din[2]), .B(din[1]), .C(din[0]), .D(n226), .Q(n465) );
  NOR40 U889 ( .A(n226), .B(n228), .C(din[0]), .D(din[2]), .Q(n482) );
  NOR31 U890 ( .A(din[1]), .B(din[2]), .C(n226), .Q(n467) );
  NAND31 U891 ( .A(din[4]), .B(n223), .C(din[6]), .Q(n471) );
  INV3 U892 ( .A(din[7]), .Q(n223) );
  OAI2111 U893 ( .A(n455), .B(n456), .C(n457), .D(n458), .Q(enc_N201) );
  NAND22 U894 ( .A(din[3]), .B(din[2]), .Q(n456) );
  OAI2111 U895 ( .A(enc_n344), .B(n479), .C(n480), .D(n481), .Q(enc_N197) );
  AOI211 U896 ( .A(n467), .B(n222), .C(n459), .Q(n479) );
  NAND31 U897 ( .A(n222), .B(n232), .C(n482), .Q(n480) );
  NOR21 U898 ( .A(shiftMode[0]), .B(n465), .Q(n464) );
  AOI211 U899 ( .A(n465), .B(n466), .C(shiftMode[1]), .Q(n463) );
  INV3 U900 ( .A(din[0]), .Q(n230) );
  AOI221 U901 ( .A(n478), .B(n232), .C(n467), .D(din[0]), .Q(n474) );
  NAND22 U902 ( .A(n225), .B(n465), .Q(n478) );
  INV3 U903 ( .A(din[3]), .Q(n226) );
  INV3 U904 ( .A(shiftMode[0]), .Q(n232) );
  AOI221 U905 ( .A(n476), .B(n467), .C(shiftMode[0]), .D(n477), .Q(n475) );
  NOR21 U906 ( .A(shiftMode[0]), .B(n230), .Q(n476) );
  INV3 U907 ( .A(n462), .Q(n220) );
  AOI211 U908 ( .A(n459), .B(n227), .C(n218), .Q(n461) );
  OAI311 U909 ( .A(n227), .B(din[3]), .C(n455), .D(n457), .Q(n462) );
  INV3 U910 ( .A(din[2]), .Q(n227) );
  INV3 U911 ( .A(din[1]), .Q(n228) );
  NOR31 U912 ( .A(din[2]), .B(din[4]), .C(din[3]), .Q(n485) );
  INV3 U913 ( .A(en), .Q(n744) );
  INV3 U914 ( .A(shiftMode[1]), .Q(n231) );
endmodule

