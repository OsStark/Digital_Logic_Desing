`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2022 02:21:09 PM
// Design Name: 
// Module Name: half_adder_sim
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


module half_adder_sim;
    reg X, Y;
    wire C, S;
    half_adder uut(.X(X), .Y(Y), .C(C), .S(S));
    initial begin
        X=0;Y=0;
        #100;
        X=0;Y=1;
        #100;
        X=1;Y=0;
        #100;
        X=1;Y=1;
        #100;
    end
endmodule
