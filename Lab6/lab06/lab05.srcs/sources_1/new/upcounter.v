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

//the upcounter has a lot of arguments so it can be used in many
//different ways
module upcounter(CLK, BCD, reset, resetvalue, max, carry, carrycontrol);
    input CLK, reset, carrycontrol;
    input [3:0] resetvalue;
    input [3:0] max;
    output reg [3:0] BCD;
    output reg carry;
    
    always @(posedge CLK, posedge reset)
    begin
        if(reset)
        begin
            BCD <= resetvalue;
            carry <= 0;
        end
        else
        if(BCD==max)//max is the maximum digit
        begin
            BCD <= 0;
            if(carrycontrol==0)//carrycontrol is used to stop the carry
                carry <= 1;    //from being set to 1 while adjusting the time
        end
        else
        begin
            BCD <= BCD+1;
            carry <= 0;
        end
    end
endmodule
