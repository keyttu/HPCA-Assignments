`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 04:07:13 PM
// Design Name: 
// Module Name: FourBA
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


module FourBA(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output wire [3:0] S,
    output wire Cout,
    inout [3:1] C
    );
    
    FA u0(A[0],B[0],Cin,S[0],C[1]);
    FA u1(A[1],B[1],C[1],S[1],C[2]);
    FA u2(A[2],B[2],C[2],S[2],C[3]);
    FA u3(A[3],B[3],C[3],S[3],Cout);

endmodule

module FA(a,b,c,s,cout);
    input a,b,c;
    output s, cout;
    
    assign s = a^b^c;
    assign cout = a&b | b&c | c&a;
  
endmodule