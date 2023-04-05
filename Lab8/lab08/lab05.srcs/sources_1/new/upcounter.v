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

module upcounter(CLK, BCD, reset, resetvalue, max, carry, carrycontrol, down);
    input CLK, reset, carrycontrol, down;
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
        if(down)
        begin
            if(BCD==0)
            begin
                BCD <= max;
                if(carrycontrol==0)
                    carry <= 1;
            end
            else
            begin
                BCD <= BCD-1;
                carry <= 0;
            end
        end
        else
        begin
            if(BCD==max)
            begin
                BCD <= 0;
                if(carrycontrol==0)
                    carry <= 1;
            end
            else
            begin
                BCD <= BCD+1;
                carry <= 0;
            end
        end
    end
endmodule
