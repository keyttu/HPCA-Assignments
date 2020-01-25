`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2020 18:30:14
// Design Name: 
// Module Name: seqdet
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


module seqdet(reset, clk, seq_in, det_out);

input clk, reset, seq_in;
output reg det_out;

parameter S0=0,
S1=1,S2=2,
S3=3,S4=4,
S5=5;

reg [0:2] current_state, next_state;

always @(posedge clk or posedge reset)
begin
 if(reset==1) 
 current_state <= S0;
 else
 current_state <= next_state; 
end

always @(current_state, seq_in)
begin
    case(current_state)
    S0:begin
        next_state = seq_in ? S1 : S0;
        det_out = seq_in ? 0 : 0;
    end
    
    S1:begin
        next_state = seq_in ? S1 : S2;
        det_out = seq_in ? 0 : 0;
    end
    
    S2:begin
    next_state = seq_in ? S3 : S0;
    det_out = seq_in ? 0 : 0;
    end

    S3:begin
    next_state = seq_in ? S1 : S4;
    det_out = seq_in ? 0 : 0;
    end    

    S4:begin
    next_state = seq_in ? S5 : S0;
    det_out = seq_in ? 0 : 0;
    end    

    S5:begin
    next_state = seq_in ? S1 : S0;
    det_out = seq_in ? 0 : 1;
    end
        
    endcase       
end
 

endmodule
