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


module task1(CLK, control, plus, OUTright, DIS, dot, reset);
    input CLK, control, plus, reset;
    output reg [6:0] OUTright; //output for the 7SD (7 segment display)
    output reg [3:0] DIS; //output  for choosing which 7SD lights up
    output reg dot; //output  for the 7SD dot
    
    //many wires
    wire [31:0] DIV;
    wire plus_CLK;
    
    wire [3:0] BCD1, BCD2, BCD3, BCD4;
    wire [6:0] OUT1, OUT2, OUT3, OUT4;
    
    wire C1, C2, C3, C4;
    wire CLK_1Hz;
 
    //divider, debouncers and 1Hz clock 
    divider DIVIDER(CLK, DIV, reset);
    debounce Dplus(DIV[16], plus, plus_CLK, reset);
    debounce Dcontrol(DIV[16], control, control_CLK, reset);
    //DIV[7]*390625 = 1s
    upcounter1Hz(DIV[7], reset, 390624, CLK_1Hz);
    
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011, S4 = 4'b0100, S5 = 4'b0101, S6 = 4'b0110, S7 = 4'b0111, S8 = 4'b1000, S9 = 4'b1001, S10 = 4'b1010, S11 = 4'b1011, S12 = 4'b1100, S13 = 4'b1101, S14 = 4'b1110;
    reg CLK_sec, CLK_min, down, off;
    reg [3:0] present_state, next_state;
        
    // part 1: initialize to state A and update state register
    always @(posedge CLK, posedge reset)
    begin
        if (reset) present_state <= S0;
        else present_state <= next_state; //update present state
    end
    
    // part 2: determine next state
    always @(present_state, control_CLK, CLK_1Hz)
    begin
        case (present_state)
            S0: begin if(control_CLK) next_state=S1; else next_state=S0; end //done / reset
            S1: begin if(~control_CLK) next_state=S2; else next_state=S1; end //waiting for button to be released
            S2: begin if(control_CLK) next_state=S3; else next_state=S2; end //select minutes
            S3: begin if(~control_CLK) next_state=S4; else next_state=S3; end //waiting for button to be released
            S4: begin if(control_CLK) next_state=S5; else next_state=S4; end //select seconds
            S5: begin if(~control_CLK) next_state=S6; else next_state=S5; end //waiting for button to be released
            S6: begin if(BCD1==0 && BCD2==0 && BCD3==0 && BCD4==0) next_state=S7; else next_state=S6; end //counting down
            S7: begin if(~CLK_1Hz) next_state=S8; else next_state=S7; end //waiting for CLK_1Hz to be 0
            S8: begin if(CLK_1Hz) next_state=S9; else next_state=S8; end //off
            S9: begin if(~CLK_1Hz) next_state=S10; else next_state=S9; end //waiting for CLK_1Hz to be 0
            S10: begin if(CLK_1Hz) next_state=S11; else next_state=S10; end //on
            S11: begin if(~CLK_1Hz) next_state=S12; else next_state=S11; end //waiting for CLK_1Hz to be 0
            S12: begin if(CLK_1Hz) next_state=S13; else next_state=S12; end //off
            S13: begin if(~CLK_1Hz) next_state=S14; else next_state=S13; end //waiting for CLK_1Hz to be 0
            S14: begin if(CLK_1Hz) next_state=S0; else next_state=S14; end //on
        endcase
    end
    
    // part 3: evaluate output function z
    always @(present_state, plus_CLK, CLK_1Hz) 
    begin
        case (present_state)
            S0: begin CLK_sec = 0;  CLK_min = 0; off = 0; end
            S1: off = 0;
            S2:
            begin
                off = 0;
                down = 0; 
                if (plus_CLK) //set minutes
                begin
                    CLK_min = 1;
                end 
                else 
                begin
                    CLK_min = 0;
                end
            end
            S3:off = 0;
            S4: 
            begin
                off = 0;
                down = 0;
                if (plus_CLK) //set seconds
                begin
                    CLK_sec = 1;
                end 
                else 
                begin
                    CLK_sec = 0;
                end
            end
            S5:off = 0;
            S6: 
            begin
                off = 0;
                CLK_sec = CLK_1Hz;
                CLK_min = C2;
                down = 1;
            end
            S7: begin off = 0; down = 0; CLK_sec = 0;  CLK_min = 0; end
            S8:off = 1;
            S9:off = 1;
            S10:off = 0;
            S11:off = 0;
            S12:off = 1;
            S13:off = 1;
            S14:off = 0;
        endcase
    end


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    upcounter UPC1(CLK_sec, BCD1, reset, 0, 9, C1, 0, down);
    upcounter UPC2(C1, BCD2, reset, 0, 5, C2, 0, down);
    upcounter UPC3(CLK_min, BCD3, reset, 0, 9, C3, 0, down);
    upcounter UPC4(C3, BCD4, reset, 0, 9, C4, 0, down);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    seven SEV1(BCD1, OUT1);
    seven SEV2(BCD2, OUT2);
    seven SEV3(BCD3, OUT3);
    seven SEV4(BCD4, OUT4);

    always@(DIV[19:18])
        begin
            if(off) DIS <= 4'b0000;
            else
            begin
                if(DIV[19:18]==2'b00)
                begin
                    OUTright <= OUT1;
                    DIS <= 4'b0001;
                    dot <= 0;
                end
                else
                 if(DIV[19:18]==2'b01)
                begin
                    OUTright <= OUT2;
                    DIS <= 4'b0010;
                    dot <= 0;
                end
                else
                 if(DIV[19:18]==2'b10)
                begin
                    OUTright <= OUT3;
                    DIS <= 4'b0100;
                    dot <= 1;
                end
                else
                 if(DIV[19:18]==2'b11)
                begin
                    OUTright <= OUT4;
                    DIS <= 4'b1000;
                    dot <= 0;
                end
            end
        end
endmodule
