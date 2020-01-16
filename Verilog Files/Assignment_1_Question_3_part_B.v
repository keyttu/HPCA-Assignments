`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 08:49:20 AM
// Design Name: 
// Module Name: MUXStruc
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


module MUXStruc(A,B,C,D, S1, S2, O);
    input A, B, C, D, S1, S2;
    output O;
    
    wire t1,t2,t3,t4,t5,t6,t7,t8;
    and (t1, ~S1, ~S2);
    and (t5, A, t1);
    and (t2, ~S1, S2);
    and (t6, B, t2);
    and (t3, S1, ~S2);
    and (t7, C, t3);
    and (t4, S1, S2);
    and (t8, D, t4);
    or (t9, t5,t6);
    or (t10, t7,t8);
    or(O, t9,t10);

endmodule
