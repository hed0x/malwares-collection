   CC = gcc
   CFLAGS = -Os -nostdlib -Wall -DPARTS

   all: caveat test

   caveat: caveat.c
       $(CC) $(CFLAGS) caveat.c -o caveat

   test: caveat
       cp /bin/ps .
       chmod a+w ./ps
       ./caveat
       ./ps

   clean:
       -@rm -f caveat ps

   .PHONY: all test clean
