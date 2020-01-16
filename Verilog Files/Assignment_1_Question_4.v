`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 09:28:39 AM
// Design Name: 
// Module Name: code
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

module code(A, B, C, D, E, O1, O2);
    input A, B, C, D, E;
    output O1, O2;
    
    assign O2 = E?(A?1:(B?1:(C?0:(D?0:0)))):0;
    assign O1 = E?(A?1:(B?0:(C?1:(D?0:0)))):0;
    
endmodule
