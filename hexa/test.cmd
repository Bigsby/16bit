@echo off
qemu-system-i386 -drive format=raw,file=%1 -s