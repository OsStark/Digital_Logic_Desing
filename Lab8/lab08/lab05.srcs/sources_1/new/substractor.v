`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 07:38:46 PM
// Design Name: 
// Module Name: substractor
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


module substractor(CLK, read, input_dividend, input_divisor, dividend, divisor);
    input CLK, read; //CLK substracts
                     //read reads the values from the switches
    input [3:0] input_dividend, input_divisor; //these are the switches' values
    output reg [3:0] dividend, divisor; //these are the stored values
    
    always @(posedge CLK, posedge read) 
    begin
        if(read)
        begin
            dividend = input_dividend;
            divisor = input_divisor;
        end
        else dividend = dividend - divisor;
    end
endmodule
