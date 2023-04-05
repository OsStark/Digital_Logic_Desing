`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2022 07:31:53 PM
// Design Name: 
// Module Name: quotient_counter
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


module quotient_counter(CLK, zero, quotient);
    input CLK, zero; //CLK adds 1 to the quotient
                     //zero sets quotient = 0
    output reg [3:0] quotient;
    
    always @(posedge CLK, posedge zero)
    begin
        if(zero) quotient = 0;
        else quotient = quotient+1;
    end
endmodule
