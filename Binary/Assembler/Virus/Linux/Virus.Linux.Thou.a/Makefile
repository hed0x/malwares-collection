   all: hasher

   test:
       -cp -f /bin/ps .
       -chmod +w ./ps
       -./hasher
       -./ps

   hasher: hasher.asm
       nasm -f elf -O1 $< -o hasher.o
       ld hasher.o -o hasher

   clean:
       -@rm -f hasher hasher.o

   .PHONY: all clean
