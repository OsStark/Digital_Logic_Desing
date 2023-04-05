`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2022 02:28:11 PM
// Design Name: 
// Module Name: full_adder_sim
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


module full_adder_sim;
    reg X2, Y2, C_IN2;
    wire C_OUT2, S2;
    full_adder uut(.X2(X2), .Y2(Y2), .C_IN2(C_IN2), .C_OUT2(C_OUT2), .S2(S2));
    initial begin
        X=0;Y=0;C_IN=0;
        #100;
        X=0;Y=1;C_IN=0;
        #100;
        X=1;Y=0;C_IN=0;
        #100;
        X=1;Y=1;C_IN=0;
        #100;
        X=0;Y=0;C_IN=1;
        #100;
        X=0;Y=1;C_IN=1;
        #100;
        X=1;Y=0;C_IN=1;
        #100;
        X=1;Y=1;C_IN=1;
        #100;
    end  
endmodule
