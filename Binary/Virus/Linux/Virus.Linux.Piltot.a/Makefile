   all: pilot.asm
       nasm -f elf -O2 pilot.asm -o pilot.o
       gcc pilot.o -o pilot
       cp -f /bin/bash .
       ./pilot

   clean:
       -@rm -f bash pilot pilot.o
