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

//seven decoder modified to represent the hours
module sevenHOUR(HOUR, OUT);
    input [4:0] HOUR;
    output reg [13:0] OUT;
    
    always@(HOUR) // this controls how the 7SD lights up
        case({HOUR})
            5'b00000: {OUT} = 14'b11111101111110; // 0 
            5'b00001: {OUT} = 14'b11111100110000; // 1
            5'b00010: {OUT} = 14'b11111101101101; // 2
            5'b00011: {OUT} = 14'b11111101111001; // 3
            5'b00100: {OUT} = 14'b11111100110011; // 4
            5'b00101: {OUT} = 14'b11111101011011; // 5
            5'b00110: {OUT} = 14'b11111101011111; // 6
            5'b00111: {OUT} = 14'b11111101110000; // 7
            5'b01000: {OUT} = 14'b11111101111111; // 8
            5'b01001: {OUT} = 14'b11111101111011; // 9
            5'b01010: {OUT} = 14'b01100001111110; // 10
            5'b01011: {OUT} = 14'b01100000110000; // 11
            5'b01100: {OUT} = 14'b01100001101101; // 12
            5'b01101: {OUT} = 14'b01100001111001; // 13
            5'b01110: {OUT} = 14'b01100000110011; // 14
            5'b01111: {OUT} = 14'b01100001011011; // 15
            5'b10000: {OUT} = 14'b01100001011111; // 16
            5'b10001: {OUT} = 14'b01100001110000; // 17
            5'b10010: {OUT} = 14'b01100001111111; // 18
            5'b10011: {OUT} = 14'b01100001111011; // 19
            5'b10100: {OUT} = 14'b11011011111110; // 20
            5'b10101: {OUT} = 14'b11011010110000; // 21
            5'b10110: {OUT} = 14'b11011011101101; // 22
            5'b10111: {OUT} = 14'b11011011111001; // 23
        endcase
endmodule