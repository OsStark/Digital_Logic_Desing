`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 15:50:24
// Design Name: 
// Module Name: seven
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


module seven(BCD, OUT);
    input [3:0] BCD;
    output reg [6:0] OUT;
    
    always@(BCD) // this controls how the 7SD lights up
        case({BCD})
            4'b0000: {OUT} = 7'b1111110; // 0
            4'b0001: {OUT} = 7'b0110000; // 1
            4'b0010: {OUT} = 7'b1101101; // 2
            4'b0011: {OUT} = 7'b1111001; // 3
            4'b0100: {OUT} = 7'b0110011; // 4
            4'b0101: {OUT} = 7'b1011011; // 5
            4'b0110: {OUT} = 7'b1011111; // 6
            4'b0111: {OUT} = 7'b1110000; // 7
            4'b1000: {OUT} = 7'b1111111; // 8
            4'b1001: {OUT} = 7'b1111011; // 9
        endcase
endmodule