`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/03 15:53:47
// Design Name: 
// Module Name: task1
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


module task1(CLK, OUT, DIS, reset);
    input CLK, reset;
    output reg [6:0] OUT; //output for the 7SD(7 segment display)
    output reg [1:0] DIS; //output for choosing which 7SD lights up
 
    //wires
    wire [31:0] DIV;
    wire BUTTON_CLK;
    wire [3:0] BCD1, BCD2;
    wire [6:0] OUT1, OUT2;
    reg CLK_UPC2;
    
    divider DIVIDER(CLK, DIV, reset);
    upcounter UPC1(DIV[24], BCD1, reset);//upcounter for first digit
    always@(posedge DIV[24])//when the first digit reaches 9,
        begin               //the second digit is raised
            if(BCD1==9)
                CLK_UPC2 <= 1;
            else
                CLK_UPC2 <= 0;
         end 
    upcounter UPC2(CLK_UPC2, BCD2, reset);//upcounter for second digit
    seven SEV1(BCD1, OUT1);//decoder for first digit
    seven SEV2(BCD2, OUT2);//decoder for second digit
    always@(DIV[13])//7 seg scan
        begin
            if(DIV[13])
            begin
                OUT <= OUT1;//display digit 1
                DIS <= 2'b01;
            end
            else
            begin
                OUT <= OUT2;//display digit 2
                DIS <= 2'b10;
            end
        end
endmodule
