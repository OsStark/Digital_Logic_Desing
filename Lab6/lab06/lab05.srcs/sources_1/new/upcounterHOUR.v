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

//upcounter modified to represent the hours
module upcounterHOUR(CLK, HOUR, reset, resetvalue, max);
    input CLK, reset;
    input [4:0] resetvalue;
    input [4:0] max;
    output reg [4:0] HOUR;
    
    always @(posedge CLK, posedge reset)
    begin
        if(reset)
        begin
            HOUR <= resetvalue;
        end
        else
        if(HOUR==max)
        begin
            HOUR <= 0;
        end
        else
        begin
            HOUR <= HOUR+1;
        end
    end
endmodule
