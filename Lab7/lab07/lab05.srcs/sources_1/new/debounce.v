`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 14:19:45
// Design Name: 
// Module Name: debounce
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


module debounce(CLK, BUTTON, BUTTON_CLK, reset);
    input CLK, BUTTON, reset;
    output reg BUTTON_CLK;
    
    wire[2:0]W;
    
    DFF DFF1(CLK, BUTTON, W[0], reset);
    DFF DFF2(CLK, W[0], W[1], reset);
    DFF DFF3(CLK, W[1], W[2], reset);
    
    always@(W)
        BUTTON_CLK <= W[0] & W[1] & W[2];    
    
endmodule
