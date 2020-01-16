`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2020 10:32:28 PM
// Design Name: 
// Module Name: FAstruc
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


module FAstruc(A, B, C, S, Carry);
    input A, B, C;
    output S, Carry;
    
    wire t1,t2,t3,t4,t5;
    
    xor (t1, A, B);
    xor (S, t1, C);
    
    and (t2, A, B);
    and (t3, B, C);
    and (t4, A, C);
    or (t5, t2, t3);
    or (Carry, t4, t5);
               
endmodule
