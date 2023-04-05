`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 15:04:57
// Design Name: 
// Module Name: divider
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


module divider(CLK, DIV, reset);
    input CLK, reset;
    output reg [31:0] DIV;
    
    always @(posedge CLK, posedge reset)
    begin   
        if(reset)
            DIV <= 0;
        else
            DIV <= DIV+1;
    end 
endmodule
