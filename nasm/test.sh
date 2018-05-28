#!/bin/bash
nasm $1.asm -f bin -o $1.bin
if [ $? -eq 0 ]; then
    qemu-system-i386 -curses -drive format=raw,file=$1.bin -s
else
    echo "Error assembling..."
fi