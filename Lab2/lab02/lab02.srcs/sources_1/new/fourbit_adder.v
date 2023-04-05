`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 14:31:56
// Design Name: 
// Module Name: fourbit_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module fourbit_adder(
    input [3:0] X,
    input [3:0] Y,
    input C0,
    output [3:0] S,
    output C4
    );

    wire C1, C2, C3;
    
    full_adder FA0 (.X(X[0]), .Y(Y[0]), .C_IN(C0), .C_OUT(C1), .S(S[0]));
    full_adder FA1 (.X(X[1]), .Y(Y[1]), .C_IN(C1), .C_OUT(C2), .S(S[1]));
    full_adder FA2 (.X(X[2]), .Y(Y[2]), .C_IN(C2), .C_OUT(C3), .S(S[2]));
    full_adder FA3 (.X(X[3]), .Y(Y[3]), .C_IN(C3), .C_OUT(C4), .S(S[3]));  
endmodule
