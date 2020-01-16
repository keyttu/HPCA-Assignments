`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2020 07:39:36 PM
// Design Name: 
// Module Name: pecase
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


module pecase(
    input [15:0]A,
    output reg [3:0] O,
    input E
    );
    
always @*
    begin
            case(A[15])
                1'b0: case(A[14])
                        1'b0: case(A[13])
                                1'b0: case(A[12])
                                        1'b0: case(A[11])
                                                1'b0: case(A[10])
                                                        1'b0: case(A[9])
                                                                1'b0: case(A[8])
                                                                        1'b0: case(A[7])
                                                                                1'b0: case(A[6])
                                                                                        1'b0: case(A[5])
                                                                                                1'b0: case(A[4])
                                                                                                        1'b0: case(A[3])
                                                                                                                1'b0: case(A[2])
                                                                                                                        1'b0: case(A[1])
                                                                                                                                1'b0: case(A[0])
                                                                                                                                        1'b0: O<=4'b0000;
                                                                                                                                        1'b1: O<=4'b0000;
                                                                                                                                1'b1: O<=4'b0001;
                                                                                                                              endcase
                                                                                                                        1'b1: O<=4'b0010;
                                                                                                                      endcase
                                                                                                                1'b1: O<=4'b0011;
                                                                                                              endcase                     
                                                                                                        1'b1: O<=4'b0100;
                                                                                                      endcase                     
                                                                                                1'b1: O<=4'b0101;
                                                                                              endcase                     
                                                                                        1'b1: O<=4'b0110;
                                                                                      endcase                     
                                                                                1'b1: O<=4'b0111;
                                                                              endcase                     
                                                                        1'b1: O<=4'b1000;
                                                                      endcase                     
                                                                1'b1: O<=4'b1001;
                                                              endcase                     
                                                        1'b1: O<=4'b1010;
                                                      endcase                     
                                                1'b1: O<=4'b1011;
                                              endcase                     
                                        1'b1: O<=4'b1100;
                                      endcase                     
                                1'b1: O<=4'b1101;
                              endcase                     
                        1'b1: O<=4'b1110;
                      endcase                     
                1'b1: O<=4'b1111;
              endcase                     
          endcase         
    end
endmodule
