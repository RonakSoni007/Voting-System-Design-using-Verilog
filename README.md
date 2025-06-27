# 🗳️ Voting-System-Design-using-Verilog

This project implements a **digital voting machine** using **Verilog HDL**, designed with modular architecture and simulation support.

## ✅ Features

- **Debounce logic** to filter out noisy button presses  
- **Vote logging** for four candidates  
- **Mode selection**:
  - **Voting Mode**: Registers and acknowledges valid votes  
  - **Result Mode**: Displays total votes received per candidate via LEDs  
- **Testbench** included to simulate all functional cases:
  - Valid voting
  - LED feedback
  - Mode switching
  - System reset
