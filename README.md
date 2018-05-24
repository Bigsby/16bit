# 16bit

Experiments in 16 bit assembly

## The Tools
- *HxD* - Hexadecimal file editor - [link](https://mh-nexus.de/en/hxd/) - To write (and inspect) machine code directly
- *QEMU* - Virtual Machine Emulator - [link](https://www.qemu.org/) ([Usage](Tools%20-%20QEMU)) - To test the code created
- *Visual Studio Code* - [https://code.visualstudio.com/] - To write assembly code to be assembled
- *Nasm* - Assembly Compiler - [link](https://www.nasm.us/) ([Usage](Tools%20-%20NASM)) - To assemble Intel Style assembly code
- *GAS* - GNU Assembler - [link](http://tigcc.ticalc.org/doc/gnuasm.html) - To assemble AT&T style assembly code
- *GCC* - GNU Compiler Collection (*C* and *C++* compiler and linker) - [link](https://gcc.gnu.org/) - To link object code

## Usage

### QEmu
```
qemu-system-i386 -drive format=raw,file=«binaryFileName»[bin]
```

### Nasm
```
nasm «codeFileName»[.asm] -f bin -o «outputFileName»[.bin]
```

### GAS and GCC
```
as «codeFileName»[.S] -o «objectFileName»[.o]
ld [–Ttext] 0x7c00 --oformat=binary «objectFileName»[.o] –o «binaryFileName»[bin]
```
