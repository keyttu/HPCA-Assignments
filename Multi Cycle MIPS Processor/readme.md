# This repository is dedicated to MIPS Multi Cycle Processor with 5 Stage Pipelining.

This is a 32 Bit processor

# Specifications

• Five Stage pipelining with IF, ID, EXE, MEM and WB

• 32-bit Program Counter.

• 32 Registers of each 32 bit size.

• 4 Pipeline Registers of IFID-64, IDEX-127, EXMEM-69, MEMWB-37 bits respectively to store the data
between blocks.

• 3 Pipeline Registers of EX-11, MEM-4 and WB-1 bits respectively to store control signals.

• 32 bit wide instruction and data memory of size 1024.

• Posedge Triggered clock of Time period = 20ns.

• Main Control which generates control signals is kept in ID stage itself.
