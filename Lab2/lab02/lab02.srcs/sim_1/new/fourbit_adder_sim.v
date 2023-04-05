`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 14:44:46
// Design Name: 
// Module Name: fourbit_adder_sim
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


module fourbit_adder_sim;
    reg [3:0] X;
    reg [3:0] Y;
    reg C0;
    wire [3:0] S;
    wire C4;
    
    fourbit_adder uut(.X(X[3:0]), .Y(Y[3:0]), .C0(C0), .S(S[3:0]), .C4(C4));
    
    integer i, j, k;
    
    initial begin
        for (i=0; i<16; i=i+1)
        begin
            X=i;
            for (j=0; j<16; j=j+1)
            begin
                Y=j;
                for (k=0; k<2; k=k+1)
                begin
                    C0=k;
                    #100;
                end
            end
        end
    end
endmodule
