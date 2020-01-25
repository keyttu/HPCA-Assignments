`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2020 07:10:40
// Design Name: 
// Module Name: serial_tb
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


module serial_tb;
reg a,b,reset,clk;
wire s;


serial uut(.a(a),.b(b),.reset(reset),.clk(clk));

initial
     begin
     	clk=1'b1;
     	forever #10 clk=~clk;  
     end

initial
     begin
              //add 7 and 6 
    			reset = 1'b1;  a = 1'b0; b = 1'b0;
			#50; reset = 1'b0; a = 1'b1; b = 1'b0;
			#50;  a = 1'b1; b = 1'b1;
			#50;  a = 1'b0; b = 1'b1;		
			#10;  a = 1'b0; b = 1'b0;
	    
   
	    //add 5 and 9 
//    			reset = 1'b1; a = 1'b0; b = 1'b0; a_t=5; b_t=9;  
//			#10; reset = 1'b0; a = a_t[0]; b = b_t[0];
//			#10; s_t[0] = s;   

//                        #100; a = a_t[1]; b = b_t[1]; 
//                        #10; s_t[1] = s;   

//			#100; a = a_t[2]; b = b_t[2]; 
//			#10; s_t[2] = s;   
                        
//                        #100; a = a_t[3]; b = b_t[3]; 
	    

//	      //add 11 and 13 
//    			reset = 1'b1; a = 1'b0; b = 1'b0; a_t=11; b_t=13;
//			#10; reset = 1'b0; a = a_t[0]; b = b_t[0];
//			#10; s_t[0] = s;   

//                        #100; a = a_t[1]; b = b_t[1]; 
//                        #10; s_t[1] = s;   

//			#100; a = a_t[2]; b = b_t[2]; 
//			#10; s_t[2] = s;   
                        
//                        #100; a = a_t[3]; b = b_t[3]; 
	    
   
//	    //add 3 and 11 
//    			reset = 1'b1; a = 1'b0; b = 1'b0; a_t=3; b_t=11; 
//			#10; reset = 1'b0; a = a_t[0]; b = b_t[0];
//			#10; s_t[0] = s;   

//                        #100; a = a_t[1]; b = b_t[1]; 
//                        #10; s_t[1] = s;   

//			#100; a = a_t[2]; b = b_t[2]; 
//			#10; s_t[2] = s;   
                        
//                        #100; a = a_t[3]; b = b_t[3]; 
	    

      
       
      end     

endmodule
