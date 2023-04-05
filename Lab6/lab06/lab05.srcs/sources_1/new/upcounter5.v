`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 15:22:35
// Design Name: 
// Module Name: upcounter
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

module upcounter5(BUTTON_CLK, BCD, reset, resetvalue);
    input BUTTON_CLK, reset;
    input [3:0] resetvalue;
    output reg [3:0] BCD;
    
    always @(posedge BUTTON_CLK, posedge reset)
    begin   
        if(reset || BCD==5)
            BCD <= resetvalue;
        else
            BCD <= BCD+1;
    end 
endmodule
