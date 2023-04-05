`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/06 14:17:02
// Design Name: 
// Module Name: fourbitmultiplier_sim
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


module fourbitmultiplier_sim;
    reg [3:0] X;
    reg [3:0] Y;
    wire [7:0] P;
    
    //Unit under test
    fourbitmultiplier uut(.X(X[3:0]), .Y(Y[3:0]), .P(P[7:0]));
    
    //For loops used to test all posible inputs
    integer i, j;
    initial begin
        for (i=0; i<16; i=i+1)
        begin
            X=i;
            for (j=0; j<16; j=j+1)
            begin
                Y=j;
                #100;
            end
        end
    end
endmodule
