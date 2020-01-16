`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2020 20:42:38
// Design Name: 
// Module Name: decoder
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


module decoder(i, o);
input[3:0]i;
output[15:0]o;
decoder_328 dec0 (i[2:0],i[3],o[15:8]);
decoder_328 dec1 (i[2:0],~i[3],o[7:0]);
endmodule

module decoder_328(i, en, o);
    input[2:0] i;
    input en;
    output reg[7:0] o;
    
    always @(en or i)
    begin
        if(en==1'b0)
            o=8'b00000000;
        else if(en==1'b1)
        begin
            case(i)
            3'b000:o=8'b00000001;
            3'b001:o=8'b00000010;
            3'b010:o=8'b00000100;
            3'b011:o=8'b00001000;
            3'b100:o=8'b00010000;
            3'b101:o=8'b00100000;
            3'b110:o=8'b01000000;
            3'b111:o=8'b10000000;
            default:o=8'b00000000;
            endcase
        end
        else
           o=8'b00000000;
     end
            
endmodule
