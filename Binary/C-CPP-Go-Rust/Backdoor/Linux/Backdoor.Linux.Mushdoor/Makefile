#compiler
C=gcc
#flags for module
MFLAGS= -I/lib/modules/`uname -r`/build/include -c

all:	mushd00r mushroom

mushd00r: mushd00r.c
	rm -f mushd00r.o
	$(C) $(MFLAGS) mushd00r.c -o mushd00r.o

mushroom: mushroom.c
	rm -f mushroom
	$(C) mushroom.c -o mushroom

clean:
	rm -f mushd00r.o mushroom
