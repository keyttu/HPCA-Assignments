`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2020 12:04:58 PM
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


module processor(clock);
    // CLOCK
    input clock; 
    // Program Counter
    reg [31:0] PC;
    
    // PIPELINE REGISTERS
    reg [63:0] IFID;
    reg [126:0] IDEX;
    reg [68:0] EXMEM;
    reg [36:0] MEMWB;
    
    // Control Signals Pipeline Registers
    reg [10:0]EX; // All Control Signals except RegDest
    reg [3:0]MEM; // Control signals like MemRead, MemWrite, MemtoReg, RegWrite
    reg WB; // RegWrite
    
    // Intruction and Data Memory
    reg [31:0]InsMem[0:1023], DatMem[0:1023];
    // Registers 32 registers of 32 bits each
    reg [31:0]Reg[0:31];
    // Other Connections
    reg [4:0] Rs, Rt, Rd;
    reg [5:0] opcode, func;
    reg RegDst,MemtoReg;
    reg [31:0] DataOut;
    integer i;

    initial
        begin
        InsMem[0] = 32'b00000000001000100001100000000000; // ADD R1 R2 R3
        InsMem[1] = 32'b00000000100001010011000000000010; // SUB R4 R5 R6
        InsMem[2] = 32'b00000000111010000100100000000100; // AND R7 R8 R9
        
        // Lets store R1= 1, R2 = 2, R3 = 0, R4 = 5,R5 = 4, R6 = 1, R7 = 7, R8 = 8, R9 = 0
        // After Execution R3 = 3, R6 = 1, R9 = 0
        PC = 32'h000000000; // Address of First Instructiom
        // Initialize all the PIPELINE REGISTERS and CONTROL REGISTERS TO ZERO
        IFID = 64'd0;
        IDEX = 127'd0;
        EXMEM = 69'd0;
        MEMWB = 37'd0;
        
        EX = 11'd0;
        MEM = 4'd0;
        WB = 1'b0;
        RegDst = 1'b1;
        
        for(i=0;i<=31;i=i+1) 
            Reg[i] = i; // Initializing the Register Bank
      
        Reg[5] = 32'd4;
        Reg[4] = 32'd1;
        
        end
    always @(posedge clock)
        begin
            // Instruction Fetch
            IFID[63:32] <= InsMem[PC];
            IFID[31:0] <= PC;
            PC <= PC+1;
            
            // Instruction Decode

            // Control Signal Generation
            opcode <= IFID[63:58]; // Entire Opcode
            func <= IFID[37:32]; // Last Four Bits of 
            // R-Type Instructions
            if(opcode==6'b000000)
                begin
                RegDst <= 1; // Destination Register for R type is always Rd
                    if(func == 6'b000000)
                        begin
                            RegDst = 1'b1;
                            EX[0] <= 0; // Extention Operation
                            EX[1] <= 0; // ALU Source
                            EX[3:2] <= 2'b00; // ALU Control ~~~~~~~~~~~ ADD R-Type Instruction
                            EX[6:4] <= 3'b000; // J Beq Bne
                            EX[9:7] <= 3'b000; // MemRead, Memwrite, MemtoReg
                            EX[10] <= 1; // RegWrite                                                       
                        end
                    if(func == 6'b000010)
                            begin
                                RegDst = 1'b1;
                                EX[0] <= 0; // Extention Operation
                                EX[1] <= 0; // ALU Source
                                EX[3:2] <= 2'b01; // ALU Control ~~~~~~~~~~~ SUB R-Type Instruction
                                EX[6:4] <= 3'b000; // J Beq Bne
                                EX[9:7] <= 3'b000; // MemRead, Memwrite, MemtoReg
                                EX[10] <= 1; // RegWrite                                                       
                            end
                    if(func == 6'b000100)
                            begin
                                RegDst = 1'b1;
                                EX[0] <= 0; // Extention Operation
                                EX[1] <= 0; // ALU Source
                                EX[3:2] <= 2'b10; // ALU Control ~~~~~~~~~~~ AND R-Type Instruction
                                EX[6:4] <= 3'b000; // J Beq Bne
                                EX[9:7] <= 3'b000; // MemRead, Memwrite, MemtoReg
                                EX[10] <= 1; // RegWrite                                                       
                            end

                    if(func == 6'b000110)
                            begin
                                RegDst = 1'b1;
                                EX[0] <= 0; // Extention Operation
                                EX[1] <= 0; // ALU Source
                                EX[3:2] <= 2'b11; // ALU Control ~~~~~~~~~~~ OR R-Type Instruction
                                EX[6:4] <= 3'b000; // J Beq Bne
                                EX[9:7] <= 3'b000; // MemRead, Memwrite, MemtoReg
                                EX[10] <= 1; // RegWrite                                                       
                            end                               
                end
            else
                EX <= 11'b10000000000;


            Rs <= IFID[57:53]; // Source Register
            Rt <= IFID[52:48]; // Second Source Register 
            Rd <= RegDst?IFID[47:43]:MEMWB[36:32]; // Destination Register
            IDEX[31:0] <= PC;
            IDEX[57:32] <= IFID[47:32];
            IDEX[89:58] <= Reg[Rs];
            IDEX[121:90] <= Reg[Rt];
            IDEX[126:122] <= Rd; // pipeline registers
            

            
            // Execute or Address Calculation
            
            // Control Signal Copy
            MEM[2:0] <= EX[9:7];
            MEM[3] <= EX[10];
            
            case(EX[3:2])
                2'b00: EXMEM[31:0] <= IDEX[121:90] + IDEX[89:58]; // ADD
                2'b01: EXMEM[31:0] <= IDEX[121:90] - IDEX[89:58]; // SUB
                2'b10: EXMEM[31:0] <= IDEX[121:90] & IDEX[89:58]; // AND
                2'b11: EXMEM[31:0] <= IDEX[121:90] | IDEX[89:58]; // OR

            endcase
            
            EXMEM[68:64] <= IDEX[126:122];
            EXMEM[63:32] <= IDEX[121:90]; // Pipeline registers
            
            // Memory Stage
            WB <= MEM[3];
            
            // NOT COMPLETE
            DataOut <= DatMem[EXMEM[31:0]];
            MEMWB[31:0] <= EX[9]?DataOut:EXMEM[31:0];
            MEMWB[36:32] <= EXMEM[68:64]; // Pipeline registers

            
            // Write back Stage
            if(WB)
                begin
                   Reg[MEMWB[36:32]] <= MEMWB[31:0];
                end
            $display(Reg[6]);

            
        end

endmodule
