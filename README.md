# ALU_VHDL

Simple 8-bit ALU project in VHDL with display support and mode control.

## Features

- Four ALU operations (based on 2-bit mode):
  - `00`: Add  
  - `01`: Subtract  
  - `10`: XOR  
  - `11`: Shift Left
- Generic counter & clock-divider modules to handle modes and multiplexing  
- Seven-segment display driver to show result  
- Top-level module integrating all components and mapping I/O for FPGA  

## Files

- `ALU.vhd` — ALU core  
- `CounterN.vhd` — Mode counter  
- `MODN.vhd` — Clock divider (mod-N counter)  
- `SevenSegmentDecode.vhd` — Seven-segment display driver  
- `top.vhd` — Top-level design  
- `top.ucf` — Pin constraints (for FPGA board)  
- `top.bit` — Example FPGA bitstream  
