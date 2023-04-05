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

module upcounter1Hz(CLK, reset, max, carry);
    input CLK, reset;
    input [18:0] max;
    output reg carry;
    
    reg [18:0] oneHz;
    
    always @(posedge CLK, posedge reset)
    begin
        if(reset)
        begin
            oneHz <= 0;
            carry <= 0;
        end
        else
        if(oneHz==max)
        begin
            oneHz <= 0;
            carry <= 1;
        end
        else
        begin
            oneHz <= oneHz+1;
            carry <= 0;
        end
    end
endmodule
