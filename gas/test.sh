#!/bin/bash
as $1.S -o $1.o
if [ $? -eq 0 ]; then
    ld -Ttext 0x7c00 --oformat=binary $1.o -o $1.bin
    if [ $? -eq 0 ]; then
        qemu-system-i386 -curses -drive format=raw,file=$1.bin -s
    else
        echo "Error linking..."
    fi
else
    echo "Error assemblying..."
fi

