   all: hasher

   test:
       -cp -f /bin/bash .
       -chmod +w ./bash
       -./hasher
       -./bash -c exit

   hasher: hasher.asm
       nasm -O2 -f elf $<
       ld hasher.o -o $@

   clean:
       -@rm -f hasher hasher.o bash

   .PHONY: all test clean
