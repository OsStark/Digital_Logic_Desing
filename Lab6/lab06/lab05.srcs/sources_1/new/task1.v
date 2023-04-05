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


module task1(CLK, BplusSec, BplusMin, BplusHour, OUTleft, OUTright, DIS, Spause, Sfreq, reset);
    input CLK, BplusSec, BplusMin, BplusHour, Spause, Sfreq, reset;
    output reg [6:0] OUTleft, OUTright; //for the 4 7SD on the left and the 4 on the right
    output reg [5:0] DIS; //to choose which 7SD lights up
    
    //wires
    wire [31:0] DIV;
    wire BplusSec_CLK, BplusMin_CLK, BplusHour_CLK, Spause_CLK, Sfreq_CLK;
    wire [3:0] BCD1, BCD2, BCD3, BCD4, HOUR;
    wire [6:0] OUT1, OUT2, OUT3, OUT4, OUT5;
    wire [13:0] OUT56; //this out is different because it's for the hours
    wire [4:0] hour;
    wire C1, C2, C3, C4;
    wire CLK_1Hz;
    //registers
    reg CLK_sec, CLK_min, CLK_hour;
    
    divider DIVIDER(CLK, DIV, reset);
    debounce Dsec(DIV[16], BplusSec, BplusSec_CLK, reset);
    debounce Dmin(DIV[16], BplusMin, BplusMin_CLK, reset);
    debounce Dhour(DIV[16], BplusHour, BplusHour_CLK, reset);
    debounce Dpause(DIV[16], Spause, Spause_CLK, reset);
    debounce Dfreq(DIV[16], Sfreq, Sfreq_CLK, reset);
    
    //1Hz Clock. DIV[7]*390625 = 1s
    upcounter1Hz(DIV[7], reset, 390624, CLK_1Hz);
    
    //Clock selector
    always@(CLK)
        begin
            if(Spause_CLK)//if the 24h clock is paused,
            begin         //the buttons can be used to adjust the time
                CLK_sec <= BplusSec_CLK;
                CLK_min <= BplusMin_CLK;
                CLK_hour <= BplusHour_CLK;
            end
            else
            begin            //if the 24h clock is not paused,
                if(Sfreq_CLK)//a switch is used to choose the frequency
                    CLK_sec <= DIV[13];
                else
                    CLK_sec <= CLK_1Hz;
                CLK_min <= C2;
                CLK_hour <= C4;
            end
        end

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //2 upcounters for the seconds, 2 upcounters for the minutes,
    //and 1 upcounterHOUR for the hours
    upcounter UPC1(CLK_sec, BCD1, reset, 5, 9, C1, 0);
    upcounter UPC2(C1, BCD2, reset, 4, 5, C2, Spause_CLK);
    upcounter UPC3(CLK_min, BCD3, reset, 9, 9, C3, 0);
    upcounter UPC4(C3, BCD4, reset, 5, 5, C4, Spause_CLK);
    upcounterHOUR UPC56(CLK_hour, HOUR, reset, 23, 23);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //2 seven decoders for the seconds, 2 seven decoders for the minutes,
    //and 1 sevenHOUR for the hours
    seven SEV1(BCD1, OUT1);
    seven SEV2(BCD2, OUT2);
    seven SEV3(BCD3, OUT3);
    seven SEV4(BCD4, OUT4);
    sevenHOUR SEV56(HOUR, OUT56);
    
    //seven seg scan
    wire [3:0] DIScounter;//every DIV[18] the display lit up changes
    upcounter DISupc(DIV[18], DIScounter, reset, 0, 2);
    always@(DIScounter)
        begin
            if(DIScounter==0)
            begin
                OUTright <= OUT1;
                OUTleft <= OUT4;
                DIS <= 6'b001001;
            end
            else
            if(DIScounter==1)
            begin
                OUTright <= OUT2;
                OUTleft <= OUT56[6:0];
                DIS <= 6'b010010;
            end
            else
            if(DIScounter==2)
            begin
                OUTright <= OUT3;
                OUTleft <= OUT56[13:7];
                DIS <= 6'b100100;
            end
        end
endmodule
