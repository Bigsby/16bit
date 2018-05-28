@echo off

nasm $1.asm -f bin -o $1.bin
qemu-system-i386 -curses -drive format=raw,file=$1.bin -s