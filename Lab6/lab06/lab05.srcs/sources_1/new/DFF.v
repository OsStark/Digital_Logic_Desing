`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 14:14:50
// Design Name: 
// Module Name: DFF
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


module DFF(CLK, D, Q, reset);
    input CLK, D, reset;
    output reg Q;
    
    always @(posedge CLK, posedge reset)
    begin
        if(reset)   Q <= 1'b0;
        else        Q <= D;
    end
endmodule
