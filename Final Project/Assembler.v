`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 7/4/2020 12:04:58 PM
// Design Name: MIPS Processor Design
// Module Name: processor
// Project Name: Term Project - Prof M S Bhatt
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


module Compiler();

	reg [31:0] A;
	reg [15:0] B;
	reg [25:0] E;
	integer code;
	integer n = 20;
	integer C, D, out, again;

	initial
		begin

			// This FILE should contain the code to be executed.
			code = $fopen("C:/Users/HP/Desktop/HPCA Project/HPCA-Assignments-master/Multi Cycle MIPS Processor/code.txt", "r");

			// This FILE will contain the binary version of the code
			out = $fopen("C:/Users/HP/Desktop/HPCA Project/HPCA-Assignments-master/Multi Cycle MIPS Processor/output.txt", "w");

		    while (! $feof(code)) 
			    begin 						
							//read until an "end of file" is reached.
			        C = $fscanf(code, "%s", A); 	//scan each line and get the value as an hexadecimal
			        case(A)
			        	4277316:
			        		begin
						        $fdisplay(out, "%s","000000");
				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");

		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

		        				$fdisplay(out,"%s","00000000000");
        					end
			        5461314:
			        		begin
						        $fdisplay(out, "%s","000000");
				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");

		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

		        				$fdisplay(out,"%s","00000000010");
        					end
			        20306:
			        		begin
						        $fdisplay(out, "%s","000000");
				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");

		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

		        				$fdisplay(out,"%s","00000000011");
        					end
			        5787474:
			        		begin
						        $fdisplay(out, "%s","000000");
				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");

		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

		        				$fdisplay(out,"%s","00000000100");
        					end
			        4279876:
			        		begin
						        $fdisplay(out, "%s","000000");
				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");

		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

		        				$fdisplay(out,"%s","00000000101");
        					end

			        1094992969: // ADDI
			        		begin
				        		$fdisplay(out, "%s", "000010");
				        		C = $fscanf(code, "%s", A); 
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");

		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase


	        					C = $fscanf(code, "%h", B); 
		        				$fdisplay(out,"%b",B);

        					end

			        1398096457: // SUBI
			        		begin

				        		$fdisplay(out, "%s", "000011");
				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");

		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase


	        					C = $fscanf(code, "%h", B); 
		        				$fdisplay(out,"%b",B);
        					end

			        5198409: // ORI
			        		begin

				        		$fdisplay(out, "%s", "000100");
				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");

		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase


	        					C = $fscanf(code, "%h", B); 
		        				$fdisplay(out,"%b",B);
	        				end
		        				
			        1095648329: // ANDI
			        		begin
				        		$fdisplay(out, "%s", "000101");
				        		C = $fscanf(code, "%s", A); 	

				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");

		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase


	        					C = $fscanf(code, "%h", B); 
		        				$fdisplay(out,"%b",B);
		        			
		        			end

			        1481593417: // XORI
			        		begin
				        		$fdisplay(out, "%s", "000110");
				        		C = $fscanf(code, "%s", A); 	

				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");

		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase


	        					C = $fscanf(code, "%h", B); 
		        				$fdisplay(out,"%b",B);
		   		
        					end
			        19543: // LW
			        		begin
				        		$fdisplay(out, "%s", "000111");
				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");

		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase


	        					C = $fscanf(code, "%h", B); 
		        				$fdisplay(out,"%b",B);
		   		
        					end

 			        21335: // SW
			        		begin
				        		$fdisplay(out, "%s", "001000");
				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");

		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase


	        					C = $fscanf(code, "%h", B); 
		        				$fdisplay(out,"%b",B);
		   		
        					end       	
        					
			        4343121: // BEQ
			        		begin
				        		$fdisplay(out, "%s", "001001");
				        		C = $fscanf(code, "%s", A); 	

				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");

		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase


	        					C = $fscanf(code, "%h", B); 
		        				$fdisplay(out,"%b",B);
		   		
        					end
			        4345413: // BNE
			        		begin
				        		$fdisplay(out, "%s", "001010");
				        		C = $fscanf(code, "%s", A); 	

				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");

		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase

				        		C = $fscanf(code, "%s", A); 	
				        		case(A)
			        				21041: $fdisplay(out, "%s","00001");
			        				21042: $fdisplay(out, "%s","00010");
			        				21043: $fdisplay(out, "%s","00011");
			        				21044: $fdisplay(out, "%s","00100");
			        				21045: $fdisplay(out, "%s","00101");
			        				21046: $fdisplay(out, "%s","00110");
			        				21047: $fdisplay(out, "%s","00111");
			        				21048: $fdisplay(out, "%s","01000");
			        				21049: $fdisplay(out, "%s","01001");
			        				5386544: $fdisplay(out, "%s","01010"); 
			        				5386545: $fdisplay(out, "%s","01011");
			        				5386546: $fdisplay(out, "%s","01100");
			        				5386547: $fdisplay(out, "%s","01101");
			        				5386548: $fdisplay(out, "%s","01110");
			        				5386549: $fdisplay(out, "%s","01111");
			        				5386550: $fdisplay(out, "%s","10000");
			        				5386551: $fdisplay(out, "%s","10001");
			        				5386552: $fdisplay(out, "%s","10010");
			        				5386553: $fdisplay(out, "%s","10011");
		        				    5386800: $fdisplay(out, "%s","10100");
		        				    5386801: $fdisplay(out, "%s","10101");
		        				    5386802: $fdisplay(out, "%s","10110");
		        				    5386803: $fdisplay(out, "%s","10111"); 
		        				    5386804: $fdisplay(out, "%s","11000");
		        				    5386805: $fdisplay(out, "%s","11001");
		        				    5386806: $fdisplay(out, "%s","11010");
		        				    5386807: $fdisplay(out, "%s","11011");
		        				    5386808: $fdisplay(out, "%s","11100");
		        				    5386809: $fdisplay(out, "%s","11101");
		        				    5387056: $fdisplay(out, "%s","11110");
		        				    5387057: $fdisplay(out, "%s","11111");	        				
		        									default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");
        			endcase


	        					C = $fscanf(code, "%h", B); 
		        				$fdisplay(out,"%b",B);
		   		
        					end

			        4869456: // JUMP
			        		begin
				        		$fdisplay(out, "%s", "111111");
	        					C = $fscanf(code, "%h", E); 
		        				$fdisplay(out,"%b",E);
		   		
        					end

					default: $fdisplay(out, "%s", "SOMETHING WENT WRONG");

        			endcase

			    end 

			$display("/////////////////////////////////////////////////////////////////");
			$display("THIS COMPILER WILL ONLY CORRECTLY IN THESE FOLLOWING CASES");
			$display("1 DEFINE ALL LETTERS IN CAPITALS");
			$display("2 DO NO USE COMMA , IN BETWEEN REGISTER NAMES USE SPACE INSTEAD");
			$display("3 DONT USE #23H TO REPRESENT IMMEDIATE DATA INSTEAD USE 23");
			$display("4 SUPPORTED INSTRUCTIONS ARE : ADD SUB OR AND XOR ADDI SUBI ORI ANDI XORI LW SW BEQ BNE JMP");
			$display("5 SUPPORTED REGISTERS ARE R1 TO R31");
			$display("6 SPECIFY DATA WITHOUT # AND H");
			$display("7 ALL THE DATA MUST BE GIVEN IN HEXADECIMAL FORMAT");
			$display("8 JMP INSTRUCTION NEED THE 26 BIT ADDRESS, LABELS DONT WORK");
			$display("9 IF SOMETHING GOES WRONG IN THE OUTPUT FILE IT WILL POPUP SOMETHING WENT WRONG");
			$display("10 IF YOU PRESS ENTER AFTER YOUR CODE IT MAY TAKE AS A NEW VOID INSTRUCTION AND TELL YOU SOMETHING WENT WRONG IGNORE IT");
			$display("11 DONT PRESS ENTER AFTER THE LAST LINE OF THE INPUT CODE");
			$display("////////////////////////////////////////////////////////////////");



	    	$fclose(code);
	    	$fclose(out);
	    end
endmodule