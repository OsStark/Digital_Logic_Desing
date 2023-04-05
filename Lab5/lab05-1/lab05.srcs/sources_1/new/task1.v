`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 15:53:47
// Design Name: 
// Module Name: task1
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


module task1(CLK, BUTTON, OUT, DIS, reset);
    input CLK, BUTTON, reset;
    output wire [6:0] OUT; //the output for the 7SD
    output DIS; 
        
    wire [31:0] DIV;
    wire BUTTON_CLK; 
    assign DIS = 1; //used to turn on the desired 7SD
    
    divider DIVIDER(CLK, DIV, reset);
    debounce DEB(DIV[15], BUTTON, BUTTON_CLK, reset);
    upcounter UPC(BUTTON_CLK, BCD, reset);
    seven SEV(BCD, OUT);
endmodule
