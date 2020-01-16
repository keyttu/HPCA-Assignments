`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 07:15:45 PM
// Design Name: 
// Module Name: decoderone
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


module decoderone(
    input [1:0] A,
    output reg [3:0] O,
    input E
    );
    
    always @*
        begin
            if(E==1)
                if(A==2'b00)
                    O<=4'b0001;
                if(A==2'b01)
                    O<=4'b0010;
                if(A==2'b10)
                    O<=4'b0100;
                if(A==2'b11)
                    O<=4'b1000;
            else
                O<=4'b0000;
        end    
endmodule
