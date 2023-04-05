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


module task1(CLK, reset, input_divisor, input_dividend, quotient, remainder, error);
    input CLK, reset;
    input [3:0] input_divisor, input_dividend;
    output [3:0] quotient;
    output reg [3:0] remainder;
    output reg error;
    
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
    wire [3:0] divisor, dividend;
    reg [2:0] present_state, next_state;
    reg quotient_CLK, quotient_zero, subs_CLK, subs_read;
    
    quotient_counter QC(quotient_CLK, quotient_zero, quotient);
    substractor S(subs_CLK, subs_read, input_dividend, input_divisor, dividend, divisor);
    
    // part 1: initialize to state A and update state register
    always @(posedge CLK, posedge reset)
    begin
        if (reset) present_state <= S0;
        else present_state <= next_state; //update present state
    end
    
    // part 2: determine next state
    always @(present_state)
    begin
        case (present_state)
            S0: next_state=S1; //read the values from the switches
            S1: begin //check if done or error
                if(divisor==0) next_state=S4; 
                else if(dividend>=divisor) next_state=S2; 
                else next_state=S3; 
            end 
            S2: next_state=S1; //substract and quotient+1
            S3: next_state=S3; //done
            S4: next_state=S4; //error
        endcase
    end
    
    // part 3: evaluate output function
    always @(present_state) 
    begin
        case (present_state)
            S0: begin //read the values from the switches
                subs_read = 1;
                quotient_zero = 1;
                remainder = 0;
                error = 0;
            end
            S1: begin //check if done or error
                subs_read = 0;
                subs_CLK = 0;
                quotient_CLK = 0;
                quotient_zero = 0;
            end
            S2: begin //substract and quotient+1
                subs_CLK = 1;
                quotient_CLK = 1;
            end
            S3: remainder = dividend; //done
            S4: error = 1; //error
        endcase
    end    
endmodule
