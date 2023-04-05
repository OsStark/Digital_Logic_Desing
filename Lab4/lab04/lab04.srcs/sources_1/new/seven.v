`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/27 13:49:16
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


module seven(
    input [3:0] SW, // 4 switches to change the number being displayed
    input [2:0] SW2, // 3 switches to choose the 7-segment display (7SD) 
    output [13:0] OUT, // the output for the 7SD (the array has size 14 because the first 4 7SD are controlled separatedly of the last 4 7SD)
    output [7:0] D // this is a one hot vector that lights up the choosen 7-segment display
    );
    reg [13:0] OUT;
    reg [7:0] D;
    
    always@(SW) // this controls how the 7SD lights up
        case({SW})
            4'b0000: {OUT} = 14'b11111101111110; // 0
            4'b0001: {OUT} = 14'b01100000110000; // 1
            4'b0010: {OUT} = 14'b11011011101101; // 2
            4'b0011: {OUT} = 14'b11110011111001; // 3
            4'b0100: {OUT} = 14'b01100110110011; // 4
            4'b0101: {OUT} = 14'b10110111011011; // 5
            4'b0110: {OUT} = 14'b10111111011111; // 6
            4'b0111: {OUT} = 14'b11100001110000; // 7
            4'b1000: {OUT} = 14'b11111111111111; // 8
            4'b1001: {OUT} = 14'b11110111111011; // 9
            4'b1010: {OUT} = 14'b11101111110111; // a
            4'b1011: {OUT} = 14'b00111110011111; // b
            4'b1100: {OUT} = 14'b10011101001110; // c
            4'b1101: {OUT} = 14'b01111010111101; // d
            4'b1110: {OUT} = 14'b10011111001111; // e
            4'b1111: {OUT} = 14'b10001111000111; // f
        endcase
            
    always@(SW2) //this controls which 7SD lights up
        case({SW2})
            3'b000: {D} = 8'b00000001; // 0
            3'b001: {D} = 8'b00000010; // 1
            3'b010: {D} = 8'b00000100; // 2
            3'b011: {D} = 8'b00001000; // 3
            3'b100: {D} = 8'b00010000; // 4
            3'b101: {D} = 8'b00100000; // 5
            3'b110: {D} = 8'b01000000; // 6
            3'b111: {D} = 8'b10000000; // 7
        endcase 
endmodule

//module seven(
//    input [3:0] SW,
//    output [6:0] OUT,
//    output D 
//    );
//    reg [6:0] OUT;
  
//    assign D = 1;
    
//    always@(SW)
//        case({SW})
//            4'b0000: {OUT} = 7'b1111110; // 0
//            4'b0001: {OUT} = 7'b0110000; // 1
//            4'b0010: {OUT} = 7'b1101101; // 2
//            4'b0011: {OUT} = 7'b1111001; // 3
//            4'b0100: {OUT} = 7'b0110011; // 4
//            4'b0101: {OUT} = 7'b1011011; // 5
//            4'b0110: {OUT} = 7'b1011111; // 6
//            4'b0111: {OUT} = 7'b1110000; // 7
//            4'b1000: {OUT} = 7'b1111111; // 8
//            4'b1001: {OUT} = 7'b1111011; // 9
//            4'b1010: {OUT} = 7'b1110111; // a
//            4'b1011: {OUT} = 7'b0011111; // b
//            4'b1100: {OUT} = 7'b1001110; // c
//            4'b1101: {OUT} = 7'b0111101; // d
//            4'b1110: {OUT} = 7'b1001111; // e
//            4'b1111: {OUT} = 7'b1000111; // f
//        endcase          
//endmodule

