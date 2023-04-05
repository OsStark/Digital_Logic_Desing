`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 15:57:23
// Design Name: 
// Module Name: fourbitmultiplier
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


module fourbitmultiplier(
    input [3:0] X,
    input [3:0] Y,
    output [7:0] P
    );
    
    //array with 16 and gates
    wire [15:0] A;
     and(A[0], X[0], Y[0]);
     and(A[1], X[1], Y[0]);
     and(A[2], X[2], Y[0]);
     and(A[3], X[3], Y[0]);
     and(A[4], X[0], Y[1]);
     and(A[5], X[1], Y[1]);
     and(A[6], X[2], Y[1]);
     and(A[7], X[3], Y[1]);
     and(A[8], X[0], Y[2]);
     and(A[9], X[1], Y[2]);
     and(A[10], X[2], Y[2]);
     and(A[11], X[3], Y[2]);
     and(A[12], X[0], Y[3]);
     and(A[13], X[1], Y[3]);
     and(A[14], X[2], Y[3]);
     and(A[15], X[3], Y[3]);
    
    //arrays with the input for the first FBA
    wire [3:0] X1;
    assign X1[2:0] = A[3:1];
    assign X1[3]=0;
    wire [3:0] Y1;
    assign Y1[3:0] = A[7:4];
    wire [3:0] S1;
    wire C_OUT1;
    //first FBA
    fourbit_adder FBA1 (.X(X1[3:0]), .Y(Y1[3:0]), .C0(0), .C4(C_OUT1), .S(S1));
    
    //arrays with the input for the second FBA
    wire [3:0] X2;
    assign X2[2:0] = S1[3:1];
    assign X2[3] = C_OUT1;
    wire [3:0] Y2;
    assign Y2[3:0] = A[11:8];
    wire [3:0] S2;
    wire C_OUT2;
    //second FBA
    fourbit_adder FBA2 (.X(X2[3:0]), .Y(Y2[3:0]), .C0(0), .C4(C_OUT2), .S(S2));
    
    //arrays with the input for the third FBA
    wire [3:0] X3;
    assign X3[2:0] = S2[3:1];
    assign X3[3] = C_OUT2;
    wire [3:0] Y3;
    assign Y3[3:0] = A[15:12];
    wire [3:0] S3;
    wire C_OUT3;
    //third FBA
    fourbit_adder FBA3 (.X(X3[3:0]), .Y(Y3[3:0]), .C0(0), .C4(C_OUT3), .S(S3));
    
    //P is an array with the result of the multiplication
    wire [7:0] P;
    assign P[0] = A[0];
    assign P[1] = S1[0];
    assign P[2] = S2[0];
    assign P[6:3] = S3[3:0];
    assign P[7] = C_OUT3;
endmodule
