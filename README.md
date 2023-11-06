To build this on Ubuntu, first install LaTeX

    sudo apt install texlive-latex-extra
    
# Fall 2022 RISC-V simulator project part 3

## From Volume II: RISC-V Privileged Architectures V1.12-draft:

### 2.1 (p5) CSR Address Mapping Conventions
The standard RISC-V ISA sets aside a 12-bit encoding space (csr[11:0]) for up to 4,096 CSRs.
By convention, the upper 4 bits of the CSR address (csr[11:8]) are used to encode the read and
write accessibility of the CSRs according to privilege level as shown in Table 2.1. The top two bits
(csr[11:10]) indicate whether the register is read/write (00, 01, or 10) or read-only (11). The next
two bits (csr[9:8]) encode the lowest privilege level that can access the CSR.

### 3.1.5 (p19) Hart ID Register mhartid
The mhartid CSR is an MXLEN-bit read-only register containing the integer ID of the hardware
thread running the code. This register must be readable in any implementation. Hart IDs might
not necessarily be numbered contiguously in a multiprocessor system, but at least one hart must
have a hart ID of zero. Hart IDs must be unique.

Use this insn to read the hart ID field:

```
	csrrs rd, mhartid, x0	// x0 = 0 = do not set any values in the CSR
```

Note that mhartid = register number: 0xF14

```
	csrrwi x0, csr, zimm	// CSRRS = I-type, opcode = 1110011, funct3 = 010, imm_i = csr
```
