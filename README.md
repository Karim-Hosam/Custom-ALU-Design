# Custom ALU Design – Verilog & Transistor-Level with Timing & Power Analysis

## Overview

This project implements a custom 4-bit Arithmetic and Logic Unit (ALU) as required by the Ain Shams University ECE 212s Spring 2025 course project.  
The ALU is capable of executing a wide range of arithmetic and logical operations, with operation selection controlled by a 4-bit selection line. The design includes both Verilog HDL and transistor-level schematics, as well as comprehensive timing and power analysis.

**Key Features:**
- 4-bit signed input and output ALU
- 16 operations (arithmetic and logic) selectable via a 4-bit control line
- Flip-flops at ALU inputs and outputs for proper sampling
- Verilog source code and testbenches
- Transistor-level schematics (Cadence)
- Circuit-level simulations for delay and power
- Vivado project for FPGA implementation and simulation
- Detailed documentation and analysis

---

## ALU Operations

| Sel   | Operation                      | Unit       |
|-------|--------------------------------|------------|
| 0000  | Increment a                    | Arithmetic |
| 0001  | Increment b                    | Arithmetic |
| 0010  | Transfer a                     | Arithmetic |
| 0011  | Transfer b                     | Arithmetic |
| 0100  | Decrement a                    | Arithmetic |
| 0101  | Multiply a and b               | Arithmetic |
| 0110  | Add a and b                    | Arithmetic |
| 0111  | Subtract a and b (a ≥ b)       | Arithmetic |
| 1000  | Complement a (1’s complement)  | Logic      |
| 1001  | Complement b (1’s complement)  | Logic      |
| 1010  | AND                            | Logic      |
| 1011  | OR                             | Logic      |
| 1100  | XOR                            | Logic      |
| 1101  | XNOR                           | Logic      |
| 1110  | NAND                           | Logic      |
| 1111  | NOR                            | Logic      |

- The MSB of the selection line chooses between arithmetic and logic units.
- The remaining 3 bits select the specific operation.

---

## Directory Structure

```
Custom-ALU-Design/
│
├── docs/                   # Documentation and reports
│   ├── ECE 212s - S25 - Course Project.pdf
│   └── Team_19-Digital_Project_report.pdf
│
├── src/
│   ├── verilog/            # Verilog HDL source modules
│   │   └── alu.v
│   ├── testbenches/        # Verilog testbenches
│   │   └── alu_tb.v
│   ├── cadence/            # Cadence schematics and symbols (all modules)
│   │   ├── AND/
│   │   ├── 4bit_Adder/
│   │   ├── ... (other modules)
│   │   ├── data.dm
│   │   ├── cdsinfo.tag
│   │   └── .oalib
│   └── vivado/             # Vivado project files and IP info
│       ├── yousef_project.xpr
│       ├── alu_tb_behav.wcfg
│       └── ip_user_files/
│           └── README.txt
│
├── sim/                    # Simulation outputs (ignored by git)
│   └── ... (Vivado simulation results)
│
├── .gitignore
├── README.md
└── LICENSE (optional)
```

---

## Usage Instructions

### 1. Prerequisites

- **Cadence Virtuoso** (for schematic/symbol viewing and transistor-level simulation)
- **Xilinx Vivado** (for Verilog simulation and FPGA synthesis)
- **Git** (for version control)

### 2. Cloning the Repository

```sh
git clone https://github.com/yourusername/Custom-ALU-Design.git
cd Custom-ALU-Design
```

### 3. Verilog Simulation (Vivado)

1. Open Vivado and load the project:
    - File → Open Project → `src/vivado/yousef_project.xpr`
2. To simulate the ALU:
    - Use the provided testbench (`src/testbenches/alu_tb.v`)
    - Run behavioral simulation and view waveforms (see `alu_tb_behav.wcfg` for waveform config)
3. To synthesize or implement on FPGA:
    - Use Vivado’s synthesis and implementation flows as usual.

### 4. Transistor-Level Schematic (Cadence)

1. Open Cadence Virtuoso.
2. Import the desired module from `src/cadence/` (e.g., `AND/`, `4bit_Adder/`, etc.).
3. View or edit the schematic in the `schematic/` subfolder.
4. Use the `symbol/` subfolder for hierarchical design.
5. Run simulations or analyses as needed.

### 5. Documentation

- See `docs/ECE 212s - S25 - Course Project.pdf` for the original project description and requirements.
- See `docs/Team_19-Digital_Project_report.pdf` for the final report, including code, testbench, output waveforms, and all circuits.

---

## Project Requirements (from Course PDF)

- ALU design in Verilog (or VHDL)
- Signed input and output
- Testbench covering all ALU operations
- Transistor-level/block-diagram schematics
- Circuit-level simulations for delay and power at worst-case and max frequency
- Transient simulations with flip-flops at max frequency
- (Bonus) Fastest/most efficient architecture, custom layout, FPGA implementation

**Technology:** 130-nm CMOS, 1.2V supply, 2-pF load at ALU output

---

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any improvements or bug fixes.

---

## License

[Specify your license here, e.g., MIT, Apache 2.0, or leave as proprietary if not open source.]

---

## Authors

- Team 19, ECE 212s - S25

---

## References

- [Cadence Virtuoso Documentation](https://www.cadence.com/)
- [Xilinx Vivado Documentation](https://www.xilinx.com/products/design-tools/vivado.html)
- Project and report PDFs in the `docs/` folder

---

*For more details, see the documentation and reports in the `docs/` directory.* 