`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2020 08:16:26
// Design Name: 
// Module Name: adder_4bit
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


module adder_4bit(A, B, S, Cout, d);
    output reg [3:0] S;
    output reg Cout;
    input [3:0] A,B;
    input d;
    
    wire [3:0] A,B;
    wire d;
    reg [4:0] c;
    integer i;
    
    always @(d or A or B)
    begin
        if (d==1'b1)begin
        c[0]=0;
        for(i=0;i<=3;i=i+1)
            begin 
                S[i]=A[i]^B[i]^c[i];
                c[i+1]=(A[i]&B[i]) | (c[i]&A[i]) | (B[i]&c[i]);
            end    
        Cout=c[4];
        end
        else
        begin
            c[0]=1; 
            for(i=0;i<=3;i=i+1)
                begin 
                  S[i]=A[i]^(~B[i])^c[i];
                  c[i+1]=(A[i]&(~B[i])) | (c[i]&A[i]) | ((~B[i])&c[i]);
                end    
             Cout=c[4];
        end
        
        
           
       
    end    
        
    
    
endmodule
