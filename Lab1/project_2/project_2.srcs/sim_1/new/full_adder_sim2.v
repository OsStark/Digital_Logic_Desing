`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2022 03:04:07 PM
// Design Name: 
// Module Name: full_adder_sim2
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


module full_adder_sim2;
    reg X, Y, C_IN;
    wire S, C_OUT;
    full_adder uut(.X(X), .Y(Y), .C_IN(C_IN), .S(S), .C_OUT(C_OUT));
    initial begin
        X=0;Y=0;C_IN=0;
        #100;
        X=0;Y=0;C_IN=1;
        #100;
        X=0;Y=1;C_IN=0;
        #100;
        X=0;Y=1;C_IN=1;
        #100;
        X=1;Y=0;C_IN=0;
        #100;
        X=1;Y=0;C_IN=1;
        #100;
        X=1;Y=1;C_IN=0;
        #100;
        X=1;Y=1;C_IN=1;
        #100;
    end
endmodule
