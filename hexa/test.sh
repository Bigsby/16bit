#!/bin/bash
qemu-system-i386 -curses -drive format=raw,file=$1 -s
