`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2020 18:58:48
// Design Name: 
// Module Name: main
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


module processor(
    input clock,
    output reg [31:0] Result
    );
    // Defining all the Registers
    reg [31:0] PC, NewPC;
    // Pipeline Registers
    reg signed [63:0] IFID;
    reg signed [132:0] IDEX;
    reg signed [68:0] EXMEM;
    reg signed [36:0] MEMWB;
    // Registers to Store Control Signals
    reg [14:0]EX;
    reg [3:0]MEM;
    reg WB;
    // Branch Target Buffer
    reg [31:0] BTB [0:9];
    reg [1:0] pred [0:9];
    
    // Defining Data Memory
    reg [31:0]InsMem[0:1023], DatMem[0:1023];
    reg signed [31:0]Reg[0:31];
    
    // Others like Hazard Detection
    reg PCSrc, Hazard, StallID, StallEX, StallMem, StallWB;
    integer clkcycle;
    reg decision, decisionID;
    
    reg UseTheResultA,UseTheResultB;
    initial
        begin
             // Program Counter
             PC = 32'h00000000;
             
             // Instruction Memory
             InsMem[0] = 32'b00000000011000100000100000000000; //ADD R1 R2 R3
             InsMem[1] = 32'b00000000001000100001100000000000; //ADD R3 R1 R2


             // Data Memory          
        
             // Initilization of Registers
             Reg[0] = 32'b00000000000000000000000000000001;             
             Reg[1] = 32'b00000000000000000000000000000010;        
             Reg[2] = 32'b00000000000000000000000000000011;
             Reg[3] = 32'b00000000000000000000000000000101;        

             // Initialize Pipeline Registers
             IFID = 64'b0;
             IDEX = 133'b0;
             EXMEM = 69'b0;
             MEMWB = 37'b0;             

             // Initialize Control Registers
             EX = 15'b0;
             MEM = 4'b0;
             WB = 1'b0;
             PCSrc = 1'b0;


             // Initialize Stall Signals
             StallID = 1'b1;
             StallEX = 1'b1;
             StallMem = 1'b1;
             StallWB = 1'b1;
             clkcycle = 0;
             UseTheResultA = 1'b0;
             UseTheResultB = 1'b0;
		

        end

    always@(posedge clock)
        begin
            // Instruction Fetch and BTB
            IFID[63:32] <= InsMem[PC];  // Get the Instruction
            IFID[31:0] <= PC;   // Copy the PC
            PC <= PCSrc?NewPC:PC+1;     // Update PC    

            PCSrc <= 1'b0;              // Reset PCSrc Signal
            StallID <= 1'b0;            // Reset all Stall Signals    
            StallEX <= 1'b0;
            StallMem <= 1'b0;
            StallWB <= 1'b0;
            UseTheResultA <= 1'b0;
            UseTheResultB <= 1'b0;
            clkcycle = clkcycle + 1;    // Increment Clk Cycle Number
            decision <= 1'b1;
	    
            $display("%d, %d", Reg[3],UseTheResultA);
	    // Check the BTB
	    if(BTB[PC[9:0]] != 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) // check if it is dont care or not
		begin
			
			if(pred[PC[9:0]] >2'b01)
				begin
					// predict Taken
					PCSrc <=1'b1;
					NewPC <= BTB[PC[9:0]];
					decision <= 1'b1; // Taken
				end	
			else
				begin
					// predict not taken
					decision <= 1'b0; // Not Taken				
				end
		end	

            // Instruction Decode and Jump 

            if(StallID == 1'b0)
                begin
                        IDEX[31:0] <= IFID[31:0];        // Copy the PC
                        IDEX[63:32] <= IFID[63:32];     // Copy the Instruction
                        IDEX[95:64] <= Reg[IFID[57:53]]; // Get the Rs Data
                        decisionID <= decision;
                        // R type Instructions
                        if(IFID[63:58] == 6'b000000 | IFID[63:58] == 6'b000001)
                            begin
                                IDEX[127:96] <= Reg[IFID[52:48]];   // BUS B
                                IDEX[132:128]<= IFID[47:43];        // Write Back Register
                            end
                        else
                            begin
                                // J type Instructions
                                if(IFID[63:58] == 6'b000010)
                                    begin
                                        // JUMP Instruction
                                        NewPC <= {{6{1'b0}},IFID[47:32]};
                                        PCSrc <= 1'b1;
                                        StallID <=1'b1;
                                    end
                            end
                        // DATA FORWARDING in Registers
                        // BUS A
                        if(IFID[63:58]!= 6'b001010)
                            begin
                                if(IFID[57:53] == IDEX[132:128] & IFID[61] == 1'b0 & IFID[63:58] != 6'b010110)
                                    // Data Dependency with Immediate Instruction 
                                    begin
                                        UseTheResultA <= 1'b1;
                                    end                       
                                else if(IFID[57:53] == EXMEM[68:64])
                                    // Data Dependency with Second Immediate Instruction
                                    begin
                                        IDEX[95:64] <= EXMEM[31:0];
                                    end
                                else if(IFID[57:53] == MEMWB[36:32])
                                    // Data Dependency with Third Immediate Instruction
                                    begin
                                        IDEX[95:64] <= MEMWB[31:0];
                                    end
                            end
                        // BUS B
                        if(IFID[63:58] == 6'b000000)
                            begin
                                if(IFID[52:48] == IDEX[132:128] & IFID[61] == 1'b0 & IFID[63:58] != 6'b010110)
                                    // Data Dependency with Immediate Instruction 
                                    begin
                                        UseTheResultB <= 1'b1;
                                    end                       
                                else if(IFID[52:48] == EXMEM[68:64])
                                    // Data Dependency with Second Immediate Instruction
                                    begin
                                        IDEX[127:96] <= EXMEM[31:0];
                                    end
                                else if(IFID[52:48] == MEMWB[36:32])
                                    // Data Dependency with Third Immediate Instruction
                                    begin
                                        IDEX[127:96] <= MEMWB[31:0];
                                    end                        
                            end                       
                        if(IFID[63:58] ==6'b000000)
                            begin
                                if(IFID[37:32] == 6'b000000)
                                    begin
                                        EX[14:0] <=15'b001000000000000; // ADD
                                    end
                                if(IFID[37:32] == 6'b000010)
                                    begin
                                        EX[14:0] <=15'b001000000000100; // SUB
                                    end
                                if(IFID[37:32] == 6'b000100)
                                    begin
                                        EX[14:0] <= 15'b001000000001100; // AND
                                    end
                                if(IFID[37:32] == 6'b001000)
                                    begin
                                        EX[14:0] <= 15'b001000000010000; // OR
                                    end   
                                if(IFID[37:32] == 6'b010000)
                                    begin
                                        EX[14:0] <= 15'b001000000010100; // XOR
                                    end     
                                if(IFID[37:32] == 6'b100000)
                                    begin
                                        EX[14:0] <= 15'b001000000011000; // SLT                           
                                    end                             
                            end
            
                        else if(IFID[63:58] ==6'b000001)
                                begin
                                    if(IFID[37:32] == 6'b000001)
                                        begin
                                            EX[14:0] <= 15'b001000000100000; //ABSOLUTE
                                        end
                                    if(IFID[37:32] == 6'b000010)
                                        begin
                                            EX[14:0] <= 15'b001000000100100; //INVERT SIGN
                                        end
                                    if(IFID[37:32] == 6'b000100)
                                        begin
                                            EX[14:0] <= 15'b001000000101100; //COPY REG DATA
                                        end
                                    if(IFID[37:32] == 6'b001000)
                                        begin
                                            EX[14:0] <= 15'b001000000110000; //LEFT SHIFT
                                        end   
                                    if(IFID[37:32] == 6'b010000)
                                        begin
                                            EX[14:0] <= 15'b001000000110100; //RIGHT SHIFT
                                        end     
                                    if(IFID[37:32] == 6'b100001)
                                        begin
                                            EX[14:0] <= 15'b001000000111000; //INCREMENT
                                        end      
                                    if(IFID[37:32] == 6'b100010)
                                        begin
                                            EX[14:0] <= 15'b001000000111100; //DECREMENT
                                        end
                                    if(IFID[37:32] == 6'b100011)
                                        begin
                                            EX[14:0] <= 15'b001000000100100; //DECREMENT
                                        end
                            end
                        else
                            begin
                                if(IFID[63:58] ==6'b010000) //ADD IMMEDIATE
                                    begin
                                        EX[14:0] <= 15'b001000000000011;
                                    end                         
                
                                if(IFID[63:58] ==6'b010001) //SUB IMMEDIATE
                                    begin
                                        EX[14:0] <= 15'b001000000000111;
                                    end    
                
                                if(IFID[63:58] ==6'b010010) //SLT IMMEDIATE
                                    begin
                                        EX[14:0] <= 15'b001000000011011;
                                    end                 
                                if(IFID[63:58] ==6'b010011) //AND IMMEDIATE
                                    begin
                                        EX[14:0] <= 15'b001000000001110;
                                    end                 
                                if(IFID[63:58] ==6'b010100) //OR IMMEDIATE
                                    begin
                                        EX[14:0] <= 15'b001000000010010;
                                    end
                                if(IFID[63:58] ==6'b010101) //XOR IMMEDIATE
                                    begin
                                        EX[14:0] <= 15'b001000000010110;
                                    end
                                if(IFID[63:58] ==6'b010110) //LOAD WORD
                                    begin
                                        EX[14:0] <= 15'b001010000000010;
                                    end
                                if(IFID[63:58] ==6'b011111) //STORE WORD
                                    begin
                                        EX[14:0] <= 15'b000100000000010;
                                    end                 
                                if(IFID[63:58] ==6'b001000) //BRANCH IF EQUAL
                                    begin
                                        EX[14:0] <= 15'b000000010000000;
                                    end                 
                                if(IFID[63:58] ==6'b001001) //BRANCH NOT EQUAL
                                    begin
                                        EX[14:0] <= 15'b000000001000000;
                                    end                 
                                if(IFID[63:58] ==6'b001010) //JUMP
                                    begin
                                        EX[14:0] <= 15'b000000100000001;
                                    end      
                                if(IFID[63:58] ==6'b001011) //BRANCH IF LESS
                                    begin
                                        EX[14:0] <= 15'b010000000000001;
                                    end          
                                if(IFID[63:58] ==6'b001100) //BRANCH IF GREATER
                                    begin
                                        EX[14:0] <= 15'b100000000000001;
                                    end                  
                            end                
                end
            // Execute and Hazard Detect
            if(StallEX == 1'b0)
                begin
                if(StallID == 1'b1)
                    begin
                        StallEX <= 1'b1;
                    end
                // Copy the Control Signals


                MEM[2:0] <= EX[11:9];
                MEM[3] <= EX[12];    
                // Copy the Pipeline Registers
                EXMEM[68:64] <= IDEX[132:128];
                EXMEM[63:32] <= IDEX[127:96];     
                // Start the Execution Unit
                if(UseTheResultB ==1'b1 & UseTheResultA == 1'b1)
                    begin
                         case(EX[5:2])
                           4'b0000: EXMEM[31:0] <= EXMEM[31:0] + EXMEM[31:0]; // ADD
                           4'b0001: EXMEM[31:0] <= EXMEM[31:0] - EXMEM[31:0]; // SUB
                           4'b0011: EXMEM[31:0] <= EXMEM[31:0] & EXMEM[31:0]; // AND
                           4'b0100: EXMEM[31:0] <= EXMEM[31:0] | EXMEM[31:0]; // OR
                           4'b0101: EXMEM[31:0] <= EXMEM[31:0] ^ EXMEM[31:0]; // XOR
                           4'b0110: EXMEM[31:0] <= EXMEM[31:0] | EXMEM[31:0]; // SLT
                           4'b1001: EXMEM[31:0] <= {{1{~EXMEM[31]}}, ~EXMEM[30:0]} + 1; // INVERT SIGN
                           4'b1000: EXMEM[31:0] <=EXMEM[31]?{{1{1'b0}},~EXMEM[30:0]}+1:EXMEM[31:0];  
                           4'b1011: EXMEM[31:0] <= EXMEM[31:0]; // MOV
                           4'b1100: EXMEM[31:0] <= EXMEM[31:0]<< 1; // LS
                           4'b1101: EXMEM[31:0] <= EXMEM[31:0]>> 1; // RS
                           4'b1110: EXMEM[31:0] <= EXMEM[31:0] + 1; // INC
                           4'b1111: EXMEM[31:0] <= EXMEM[31:0] - 1; // DCR
                           4'b1001: EXMEM[31:0] <= Reg[EXMEM[31:0]]; //ROR
                        endcase    
                      // Branch If Equal
                      		if(EX[7])
                                     begin
			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is wrong decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
								// we have  Fetched and Decoded wrong Instructions, we need to flush them
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			      		else
						  begin
							// This is a new entry
							BTB[IDEX[9:0]] <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
							pred[IDEX[9:0]] <= 2'b11;
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
						  end
                                     end
				end
                    end        

                else if(UseTheResultA == 1'b1)
                    begin
			
                         case(EX[5:2])
                           4'b0000: EXMEM[31:0] <= EXMEM[31:0] + IDEX[127:96]; // ADD
                           4'b0001: EXMEM[31:0] <= EXMEM[31:0] - IDEX[127:96]; // SUB
                           4'b0011: EXMEM[31:0] <= EXMEM[31:0] & IDEX[127:96]; // AND
                           4'b0100: EXMEM[31:0] <= EXMEM[31:0] | IDEX[127:96]; // OR
                           4'b0101: EXMEM[31:0] <= EXMEM[31:0] ^ IDEX[127:96]; // XOR
                           4'b0110: EXMEM[31:0] <= EXMEM[31:0] | IDEX[127:96]; // SLT
                           4'b1001: EXMEM[31:0] <= {{1{~EXMEM[31]}}, ~EXMEM[30:0]} + 1; // INVERT SIGN
                           4'b1000: EXMEM[31:0] <= EXMEM[31]?{{1{1'b0}}, ~EXMEM[30:0]}+1:EXMEM[31:0]; // ABS 
                           4'b1011: EXMEM[31:0] <= EXMEM[31:0]; // MOV
                           4'b1100: EXMEM[31:0] <= EXMEM[31:0]<< 1; // LS
                           4'b1101: EXMEM[31:0] <= EXMEM[31:0]>> 1; // RS
                           4'b1110: EXMEM[31:0] <= EXMEM[31:0] + 1; // INC
                           4'b1111: EXMEM[31:0] <= EXMEM[31:0] - 1; // DCR
                           4'b1001: EXMEM[31:0] <= Reg[EXMEM[31:0]]; //ROR
                       endcase   

                      // Branch If Equal
                      if(EX[7])
                             begin
                                 if(EXMEM[31:0] == IDEX[127:96])
                                     begin
			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is wrong decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
								// we have  Fetched and Decoded wrong Instructions, we need to flush them
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;

				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a correct decision and we update the predict bits:
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			      		else
						  begin
							// This is a new entry
							BTB[IDEX[9:0]] <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
							pred[IDEX[9:0]] <= 2'b00;
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
						  end
                                     end
				else 
				     // Now that means taking this branch is a Mistake
                                     begin

			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is Correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a wrong decision and we update the predict bits
							// since we have Fetched and Decoded wrong Instructions, we need to flush them

							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
                                         		NewPC <= IDEX[31:0] + 1;
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
				  		end
                                     end
                             end     

                      // Branch If Not Equal

                      if(EX[6])
                             begin
                                 if(EXMEM[31:0] != IDEX[127:96])
                                     begin
			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is wrong decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
								// we have  Fetched and Decoded wrong Instructions, we need to flush them
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;

				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			      		else
						  begin
							// This is a new entry
							BTB[IDEX[9:0]] <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
							pred[IDEX[9:0]] <= 2'b00;
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
						  end
                                     end
				else 
				     // Now that means taking this branch is a Mistake
                                     begin

			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is Correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a wrong decision and we update the predict bits
							// since we have Fetched and Decoded wrong Instructions, we need to flush them

							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
                                         		NewPC <= IDEX[31:0] + 1;
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
				  		end
                                     end
    
			end
                      // Branch if Lesser
                      if(EX[13])
                             begin
                                 if(EXMEM[31:0] < IDEX[127:96])
                                     begin
			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is wrong decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
								// we have  Fetched and Decoded wrong Instructions, we need to flush them
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;

				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			      		else
						  begin
							// This is a new entry
							BTB[IDEX[9:0]] <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
							pred[IDEX[9:0]] <= 2'b00;
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
						  end
                                     end
				else 
				     // Now that means taking this branch is a Mistake
                                     begin

			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is Correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a wrong decision and we update the predict bits
							// since we have Fetched and Decoded wrong Instructions, we need to flush them

							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
                                         		NewPC <= IDEX[31:0] + 1;
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
				  		end
                                     end
     
			end
                      // Branch if Greater
                      if(EX[14])
                             begin
                                 if(EXMEM[31:0] > IDEX[127:96])
                                     begin
			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is wrong decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
								// we have  Fetched and Decoded wrong Instructions, we need to flush them
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;

				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			      		else
						  begin
							// This is a new entry
							BTB[IDEX[9:0]] <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
							pred[IDEX[9:0]] <= 2'b00;
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
						  end
                                     end
				else 
				     // Now that means taking this branch is a Mistake
                                     begin

			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is Correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a wrong decision and we update the predict bits
							// since we have Fetched and Decoded wrong Instructions, we need to flush them

							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
                                         		NewPC <= IDEX[31:0] + 1;
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
				  		end
                                     end
                             end                        
                    end
                else if(UseTheResultB == 1'b1)
                    begin

                         case(EX[5:2])
                           4'b0000: EXMEM[31:0] <= IDEX[95:64] + EXMEM[31:0]; // ADD
                           4'b0001: EXMEM[31:0] <= IDEX[95:64] - EXMEM[31:0]; // SUB
                           4'b0011: EXMEM[31:0] <= IDEX[95:64] & EXMEM[31:0]; // AND
                           4'b0100: EXMEM[31:0] <= IDEX[95:64] | EXMEM[31:0]; // OR
                           4'b0101: EXMEM[31:0] <= IDEX[95:64] ^ EXMEM[31:0]; // XOR
                           4'b0110: EXMEM[31:0] <= IDEX[95:64] | EXMEM[31:0]; // SLT
                           4'b1001: EXMEM[31:0] <= {{1{~IDEX[95]}}, ~IDEX[94:64]} + 1; // INVERT SIGN
                           4'b1000: EXMEM[31:0] <= IDEX[95]?{{1{1'b0}}, ~IDEX[94:64]}+1:IDEX[95:64]; // ABS 
                           4'b1011: EXMEM[31:0] <= IDEX[95:64]; // MOV
                           4'b1100: EXMEM[31:0] <= IDEX[95:64]<< 1; // LS
                           4'b1101: EXMEM[31:0] <= IDEX[95:64]>> 1; // RS
                           4'b1110: EXMEM[31:0] <= IDEX[95:64] + 1; // INC
                           4'b1111: EXMEM[31:0] <= IDEX[95:64] - 1; // DCR
                           4'b1001: EXMEM[31:0] <= Reg[IDEX[95:64]]; //ROR
                       endcase    
                      // Branch If Equal
                      if(EX[7])
                             begin
                                 if(IDEX[95:64] == EXMEM[31:0])
                                     begin
			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is wrong decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
								// we have  Fetched and Decoded wrong Instructions, we need to flush them
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;

				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			      		else
						  begin
							// This is a new entry
							BTB[IDEX[9:0]] <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
							pred[IDEX[9:0]] <= 2'b00;
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
						  end
                                     end
				else 
				     // Now that means taking this branch is a Mistake
                                     begin

			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is Correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a wrong decision and we update the predict bits
							// since we have Fetched and Decoded wrong Instructions, we need to flush them

							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
                                         		NewPC <= IDEX[31:0] + 1;
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
				  		end
                                     end
                             end     

                      // Branch If Not Equal

                      if(EX[6])
                             begin
                                 if(IDEX[95:64] != EXMEM[31:0])
                                     begin
			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is wrong decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								// we have  Fetched and Decoded wrong Instructions, we need to flush them
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;

				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			      		else
						  begin
							// This is a new entry
							BTB[IDEX[9:0]] <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
							pred[IDEX[9:0]] <= 2'b00;
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
						  end
                                     end
				else 
				     // Now that means taking this branch is a Mistake
                                     begin

			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is Correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a wrong decision and we update the predict bits
							// since we have Fetched and Decoded wrong Instructions, we need to flush them

							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
                                         		NewPC <= IDEX[31:0] + 1;
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
				  		end
                                     end

                             end     
                      // Branch if Lesser
                      if(EX[13])
                             begin
                                 if(IDEX[95:64] < EXMEM[31:0])
                                     begin
			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is wrong decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end

								// we have  Fetched and Decoded wrong Instructions, we need to flush them
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;

				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			      		else
						  begin
							// This is a new entry
							BTB[IDEX[9:0]] <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
							pred[IDEX[9:0]] <= 2'b00;
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
						  end
                                     end
				else 
				     // Now that means taking this branch is a Mistake
                                     begin

			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is Correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a wrong decision and we update the predict bits
							// since we have Fetched and Decoded wrong Instructions, we need to flush them

							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
                                         		NewPC <= IDEX[31:0] + 1;
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
				  		end
                                     end
			end
                      // Branch if Greater
                      if(EX[14])
                             begin
                                 if(IDEX[95:64] > EXMEM[31:0])
                                     begin
			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is wrong decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end

								// we have  Fetched and Decoded wrong Instructions, we need to flush them
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;

				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			      		else
						  begin
							// This is a new entry
							BTB[IDEX[9:0]] <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
							pred[IDEX[9:0]] <= 2'b00;
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
						  end
                                     end
				else 
				     // Now that means taking this branch is a Mistake
                                     begin

			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is Correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a wrong decision and we update the predict bits
							// since we have Fetched and Decoded wrong Instructions, we need to flush them

							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
                                         		NewPC <= IDEX[31:0] + 1;
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
				  		end
                                     end
                             end                                              
                    end
 
                else
                    begin
                         case(EX[5:2])
                                4'b0000: EXMEM[31:0] <= IDEX[95:64] + IDEX[127:96]; // ADD
                                4'b0001: EXMEM[31:0] <= IDEX[95:64] - IDEX[127:96]; // SUB
                                4'b0011: EXMEM[31:0] <= IDEX[95:64] & IDEX[127:96]; // AND
                                4'b0100: EXMEM[31:0] <= IDEX[95:64] | IDEX[127:96]; // OR
                                4'b0101: EXMEM[31:0] <= IDEX[95:64] ^ IDEX[127:96]; // XOR
                                4'b0110: EXMEM[31:0] <= IDEX[95:64] | IDEX[127:96]; // SLT
                                4'b1001: EXMEM[31:0] <= {{1{~IDEX[95]}}, ~IDEX[94:64]} + 1; // INVERT SIGN
                                4'b1000: EXMEM[31:0] <= IDEX[95]?{{1{1'b0}}, ~IDEX[94:64]}+1:IDEX[95:64]; // ABS 
                                4'b1011: EXMEM[31:0] <= IDEX[95:64]; // MOV
                                4'b1100: EXMEM[31:0] <= IDEX[95:64]<< 1; // LS
                                4'b1101: EXMEM[31:0] <= IDEX[95:64]>> 1; // RS
                                4'b1110: EXMEM[31:0] <= IDEX[95:64] + 1; // INC
                                4'b1111: EXMEM[31:0] <= IDEX[95:64] - 1; // DCR
                                4'b1001: EXMEM[31:0] <= Reg[IDEX[95:64]]; //ROR
                            endcase                   
                            // Branch If Equal //IDEX[95:64] == IDEX[127:96]
                      // Branch If Equal
                      if(EX[7])
                             begin
                                 if(IDEX[95:64] == IDEX[127:96])
                                     begin
			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is wrong decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end

								// we have  Fetched and Decoded wrong Instructions, we need to flush them
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;

				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			      		else
						  begin
							// This is a new entry
							BTB[IDEX[9:0]] <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
							pred[IDEX[9:0]] <= 2'b00;
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
						  end
                                     end
				else 
				     // Now that means taking this branch is a Mistake
                                     begin

			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is Correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a wrong decision and we update the predict bits
							// since we have Fetched and Decoded wrong Instructions, we need to flush them

							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
                                         		NewPC <= IDEX[31:0] + 1;
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
				  		end
                                     end
     
			end
                      // Branch If Not Equal

                      if(EX[6])
                             begin
                                 if(IDEX[95:64] != IDEX[127:96])
                                     begin
			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is wrong decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end

								// we have  Fetched and Decoded wrong Instructions, we need to flush them
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;

				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			      		else
						  begin
							// This is a new entry
							BTB[IDEX[9:0]] <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
							pred[IDEX[9:0]] <= 2'b00;
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
						  end
                                     end
				else 
				     // Now that means taking this branch is a Mistake
                                     begin

			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is Correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a wrong decision and we update the predict bits
							// since we have Fetched and Decoded wrong Instructions, we need to flush them

							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
                                         		NewPC <= IDEX[31:0] + 1;
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
				  		end
                                     end
      
			end
                      // Branch if Lesser
                      if(EX[13])
                             begin
                                 if(IDEX[95:64] < IDEX[127:96])
                                     begin
			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is wrong decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end

								// we have  Fetched and Decoded wrong Instructions, we need to flush them
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;

				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			      		else
						  begin
							// This is a new entry
							BTB[IDEX[9:0]] <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
							pred[IDEX[9:0]] <= 2'b00;
                                         		NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
						  end
                                     end
				else 
				     // Now that means taking this branch is a Mistake
                                     begin

			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is Correct decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b00)  
								begin
									pred[IDEX[41:32]] <=2'b01;
								end
							if(pred[IDEX[9:0]] == 2'b01)  
								begin
									pred[IDEX[41:32]] <=2'b11;
								end
				  		end
			       		else if (decisionID == 1'b1)
						  begin
							// This is a wrong decision and we update the predict bits
							// since we have Fetched and Decoded wrong Instructions, we need to flush them

							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end
                                         		NewPC <= IDEX[31:0] + 1;
                                         		PCSrc <= 1'b1;      
                                         		StallID <= 1'b1;
                                         		StallEX <= 1'b1;
				  		end
                                     end

			end    
                      // Branch if Greater
                      if(EX[14])
                             begin
                                 if(IDEX[95:64] > IDEX[127:96])
                                     begin
			      		 if(decisionID == 1'b0) // That means we haven't taken the Branch
						  begin
							// This is wrong decision and we update the predict bits
							if(pred[IDEX[9:0]] == 2'b10)  
								begin
									pred[IDEX[41:32]] <=2'b00;
								end
							if(pred[IDEX[9:0]] == 2'b11)  
								begin
									pred[IDEX[41:32]] <=2'b10;
								end

								// we have  Fetched and Decoded wrong Instructions, we need to flush them
                            			        NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                 			PCSrc <= 1'b1;      
                                  			StallID <= 1'b1;
                                 			StallEX <= 1'b1;
                                		end

			       		else if (decisionID == 1'b1)
            			                  begin
                               				 // This is a correct decision and we update the predict bits
                                			if(pred[IDEX[9:0]] == 2'b00)  
                                  				 begin
                              					 	pred[IDEX[41:32]] <=2'b01;
                                    				end
                                			if(pred[IDEX[9:0]] == 2'b01)  
                                   				 begin
                                        				pred[IDEX[41:32]] <=2'b11;
                                    				 end
				  		   end
			      		else
                              			   begin
                                			// This is a new entry
                                			BTB[IDEX[9:0]] <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                			pred[IDEX[9:0]] <= 2'b00;
                                			NewPC <= IDEX[31:0] + {{16{1'b0}}, IDEX[47:32]};
                                			PCSrc <= 1'b1;      
                                			StallID <= 1'b1;
                                			StallEX <= 1'b1;
                                
                              			  end
					end
				else 
				     // Now that means taking this branch is a Mistake
 		                    begin
                            		 if(decisionID == 1'b0) // That means we haven't taken the Branch
                             			 begin
                              			 // This is Correct decision and we update the predict bits
                                		 if(pred[IDEX[9:0]] == 2'b00)  
                                      			begin
                                            			pred[IDEX[41:32]] <=2'b01;
                                        		end
                                    		 if(pred[IDEX[9:0]] == 2'b01)  
                                        		begin
                                            			pred[IDEX[41:32]] <=2'b11;
                                        		end
                               			end
    			       		else if (decisionID == 1'b1)
                                  		begin
                                       			 // This is a wrong decision and we update the predict bits
                                        		// since we have Fetched and Decoded wrong Instructions, we need to flush them
        
                                        	if(pred[IDEX[9:0]] == 2'b10)  
                                            		begin
                                                		pred[IDEX[41:32]] <=2'b00;
                                            		end
                                        	if(pred[IDEX[9:0]] == 2'b11)  
                                            		begin
                                               			pred[IDEX[41:32]] <=2'b10;
                                            		end
                                            NewPC <= IDEX[31:0] + 1;
                                            PCSrc <= 1'b1;      
                                            StallID <= 1'b1;
                                            StallEX <= 1'b1;
                                    		end
                                     end
                             end                                                                  
                           
        end
                end
            
            // Access Memory
            if(StallMem == 1'b0)
                begin
                    if(StallEX == 1'b1)
                        begin
                            StallMem <=1'b1;
                        end
                    WB <= MEM[3];
                    MEMWB[31:0] <= MEM[1]?DatMem[EXMEM[31:0]]:EXMEM[31:0];
                    if(MEM[2]) //Memory Write
                        begin
                            DatMem[EXMEM[31:0]] <= Reg[EXMEM[68:64]];
                        end
                    MEMWB[36:32] <= EXMEM[68:64];               
                end
            // Write Back
            if(StallWB == 1'b0)
                begin
                    if(StallMem == 1'b1)
                        begin
                            StallWB<=1'b1;
                        end
                    if(WB==1'b1)
                        begin
                           Reg[MEMWB[36:32]] <= MEMWB[31:0];
                           Result <= MEMWB[31:0];
                        end                
                end
          
           end
endmodule
