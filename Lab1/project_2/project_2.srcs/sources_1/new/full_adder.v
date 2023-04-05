`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2022 02:05:52 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input X,
    input Y,
    input C_IN,
    output C_OUT,
    output S,
    output S1,
    output C1,
    output C2,
    output C3
    );
    wire X, Y, C_IN, C_OUT, S, S1, C1, C2, C3;
    
    xor(S1, X, Y);
    xor(S, S1, C_IN);
    
    and(C1, X, Y);
    and(C2, X, C_IN);
    and(C3, Y, C_IN);
    or(C_OUT, C1, C2, C3);
endmodule
