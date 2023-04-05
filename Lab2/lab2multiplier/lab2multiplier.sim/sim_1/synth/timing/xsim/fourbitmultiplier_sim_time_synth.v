// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Thu Oct  6 15:05:23 2022
// Host        : DESKTOP-PCP5PSB running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/user/lab2multiplier/lab2multiplier.sim/sim_1/synth/timing/xsim/fourbitmultiplier_sim_time_synth.v
// Design      : fourbitmultiplier
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module fourbitmultiplier
   (X,
    Y,
    P);
  input [3:0]X;
  input [3:0]Y;
  output [7:0]P;

  wire C_OUT2;
  wire \FBA2/C3 ;
  wire \FBA3/C2 ;
  wire [7:0]P;
  wire [7:0]P_OBUF;
  wire \P_OBUF[3]_inst_i_3_n_0 ;
  wire \P_OBUF[4]_inst_i_2_n_0 ;
  wire \P_OBUF[7]_inst_i_5_n_0 ;
  wire [3:2]S1;
  wire [3:2]S2;
  wire [3:0]X;
  wire [3:0]X_IBUF;
  wire [3:0]Y;
  wire [3:0]Y_IBUF;

initial begin
 $sdf_annotate("fourbitmultiplier_sim_time_synth.sdf",,,,"tool_control");
end
  OBUF \P_OBUF[0]_inst 
       (.I(P_OBUF[0]),
        .O(P[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \P_OBUF[0]_inst_i_1 
       (.I0(X_IBUF[0]),
        .I1(Y_IBUF[0]),
        .O(P_OBUF[0]));
  OBUF \P_OBUF[1]_inst 
       (.I(P_OBUF[1]),
        .O(P[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7888)) 
    \P_OBUF[1]_inst_i_1 
       (.I0(Y_IBUF[1]),
        .I1(X_IBUF[0]),
        .I2(Y_IBUF[0]),
        .I3(X_IBUF[1]),
        .O(P_OBUF[1]));
  OBUF \P_OBUF[2]_inst 
       (.I(P_OBUF[2]),
        .O(P[2]));
  LUT6 #(
    .INIT(64'h556AAA6A3FC0C0C0)) 
    \P_OBUF[2]_inst_i_1 
       (.I0(Y_IBUF[2]),
        .I1(Y_IBUF[1]),
        .I2(X_IBUF[1]),
        .I3(Y_IBUF[0]),
        .I4(X_IBUF[2]),
        .I5(X_IBUF[0]),
        .O(P_OBUF[2]));
  OBUF \P_OBUF[3]_inst 
       (.I(P_OBUF[3]),
        .O(P[3]));
  LUT6 #(
    .INIT(64'h7888877787777888)) 
    \P_OBUF[3]_inst_i_1 
       (.I0(Y_IBUF[3]),
        .I1(X_IBUF[0]),
        .I2(Y_IBUF[2]),
        .I3(X_IBUF[1]),
        .I4(S1[2]),
        .I5(\P_OBUF[3]_inst_i_3_n_0 ),
        .O(P_OBUF[3]));
  LUT6 #(
    .INIT(64'hA5FF7800F000F000)) 
    \P_OBUF[3]_inst_i_2 
       (.I0(X_IBUF[1]),
        .I1(X_IBUF[0]),
        .I2(X_IBUF[3]),
        .I3(Y_IBUF[0]),
        .I4(X_IBUF[2]),
        .I5(Y_IBUF[1]),
        .O(S1[2]));
  LUT6 #(
    .INIT(64'hF808000000000000)) 
    \P_OBUF[3]_inst_i_3 
       (.I0(Y_IBUF[1]),
        .I1(X_IBUF[1]),
        .I2(Y_IBUF[0]),
        .I3(X_IBUF[2]),
        .I4(Y_IBUF[2]),
        .I5(X_IBUF[0]),
        .O(\P_OBUF[3]_inst_i_3_n_0 ));
  OBUF \P_OBUF[4]_inst 
       (.I(P_OBUF[4]),
        .O(P[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    \P_OBUF[4]_inst_i_1 
       (.I0(\P_OBUF[4]_inst_i_2_n_0 ),
        .I1(S2[2]),
        .I2(X_IBUF[1]),
        .I3(Y_IBUF[3]),
        .O(P_OBUF[4]));
  LUT6 #(
    .INIT(64'h8778000000000000)) 
    \P_OBUF[4]_inst_i_2 
       (.I0(Y_IBUF[2]),
        .I1(X_IBUF[1]),
        .I2(S1[2]),
        .I3(\P_OBUF[3]_inst_i_3_n_0 ),
        .I4(Y_IBUF[3]),
        .I5(X_IBUF[0]),
        .O(\P_OBUF[4]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hE81717E83FC03FC0)) 
    \P_OBUF[4]_inst_i_3 
       (.I0(X_IBUF[1]),
        .I1(\P_OBUF[3]_inst_i_3_n_0 ),
        .I2(S1[2]),
        .I3(S1[3]),
        .I4(X_IBUF[2]),
        .I5(Y_IBUF[2]),
        .O(S2[2]));
  LUT6 #(
    .INIT(64'h15FF0000A0000000)) 
    \P_OBUF[4]_inst_i_4 
       (.I0(X_IBUF[2]),
        .I1(X_IBUF[0]),
        .I2(X_IBUF[1]),
        .I3(Y_IBUF[0]),
        .I4(Y_IBUF[1]),
        .I5(X_IBUF[3]),
        .O(S1[3]));
  OBUF \P_OBUF[5]_inst 
       (.I(P_OBUF[5]),
        .O(P[5]));
  LUT4 #(
    .INIT(16'h9666)) 
    \P_OBUF[5]_inst_i_1 
       (.I0(\FBA3/C2 ),
        .I1(S2[3]),
        .I2(X_IBUF[2]),
        .I3(Y_IBUF[3]),
        .O(P_OBUF[5]));
  OBUF \P_OBUF[6]_inst 
       (.I(P_OBUF[6]),
        .O(P[6]));
  LUT6 #(
    .INIT(64'hE81717E83FC03FC0)) 
    \P_OBUF[6]_inst_i_1 
       (.I0(X_IBUF[2]),
        .I1(\FBA3/C2 ),
        .I2(S2[3]),
        .I3(C_OUT2),
        .I4(X_IBUF[3]),
        .I5(Y_IBUF[3]),
        .O(P_OBUF[6]));
  OBUF \P_OBUF[7]_inst 
       (.I(P_OBUF[7]),
        .O(P[7]));
  LUT6 #(
    .INIT(64'hFAE0E0A0AA808000)) 
    \P_OBUF[7]_inst_i_1 
       (.I0(C_OUT2),
        .I1(X_IBUF[2]),
        .I2(Y_IBUF[3]),
        .I3(\FBA3/C2 ),
        .I4(S2[3]),
        .I5(X_IBUF[3]),
        .O(P_OBUF[7]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    \P_OBUF[7]_inst_i_2 
       (.I0(\P_OBUF[7]_inst_i_5_n_0 ),
        .I1(\FBA2/C3 ),
        .I2(Y_IBUF[2]),
        .I3(X_IBUF[3]),
        .O(C_OUT2));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hE888)) 
    \P_OBUF[7]_inst_i_3 
       (.I0(S2[2]),
        .I1(\P_OBUF[4]_inst_i_2_n_0 ),
        .I2(Y_IBUF[3]),
        .I3(X_IBUF[1]),
        .O(\FBA3/C2 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h9666)) 
    \P_OBUF[7]_inst_i_4 
       (.I0(\FBA2/C3 ),
        .I1(\P_OBUF[7]_inst_i_5_n_0 ),
        .I2(X_IBUF[3]),
        .I3(Y_IBUF[2]),
        .O(S2[3]));
  LUT6 #(
    .INIT(64'hE0A0000000000000)) 
    \P_OBUF[7]_inst_i_5 
       (.I0(X_IBUF[2]),
        .I1(X_IBUF[0]),
        .I2(Y_IBUF[1]),
        .I3(X_IBUF[1]),
        .I4(Y_IBUF[0]),
        .I5(X_IBUF[3]),
        .O(\P_OBUF[7]_inst_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFAE0E0A0AA808000)) 
    \P_OBUF[7]_inst_i_6 
       (.I0(S1[3]),
        .I1(X_IBUF[1]),
        .I2(Y_IBUF[2]),
        .I3(\P_OBUF[3]_inst_i_3_n_0 ),
        .I4(S1[2]),
        .I5(X_IBUF[2]),
        .O(\FBA2/C3 ));
  IBUF \X_IBUF[0]_inst 
       (.I(X[0]),
        .O(X_IBUF[0]));
  IBUF \X_IBUF[1]_inst 
       (.I(X[1]),
        .O(X_IBUF[1]));
  IBUF \X_IBUF[2]_inst 
       (.I(X[2]),
        .O(X_IBUF[2]));
  IBUF \X_IBUF[3]_inst 
       (.I(X[3]),
        .O(X_IBUF[3]));
  IBUF \Y_IBUF[0]_inst 
       (.I(Y[0]),
        .O(Y_IBUF[0]));
  IBUF \Y_IBUF[1]_inst 
       (.I(Y[1]),
        .O(Y_IBUF[1]));
  IBUF \Y_IBUF[2]_inst 
       (.I(Y[2]),
        .O(Y_IBUF[2]));
  IBUF \Y_IBUF[3]_inst 
       (.I(Y[3]),
        .O(Y_IBUF[3]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
