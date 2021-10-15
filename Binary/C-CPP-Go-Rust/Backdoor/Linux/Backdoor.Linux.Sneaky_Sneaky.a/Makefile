CC=gcc
RM=rm
CFLAGS=-O3 -Wall -s -c
SO=sneaky.o blowfish.o rand.o mask.o spkt.o decoy.o
SOD=sneakyd.o blowfish.o rand.o mask.o spkt.o
SNK=-DCLIENT

all: 
	@echo
	@echo "make secure - use blowfish encryption"
	@echo "make plain  - dont use any encryption"
	@echo "make clean  - clean installtion"
	@echo

clean:
	$(RM) $(SO) $(SOD) encrypt.o key.o use.o sneaky sneakyd

secure:
	$(CC) encrypt.c $(CFLAGS) -DSEC 
	$(CC) key.c $(CFLAGS) -DSEC
	$(CC) use.c $(CFLAGS) -DSEC
	make sneak sneakd

plain:
	$(CC) encrypt.c $(CFLAGS) -DPLN
	$(CC) key.c $(CFLAGS) -DPLN
	$(CC) use.c $(CFLAGS) -DPLN
	make sneak sneakd


sneak: $(SO)
	$(CC) $(SO) $(SNK) encrypt.o key.o use.o -s -o sneaky

sneakd: $(SOD)
	$(CC) $(SOD) encrypt.o key.o -s -o sneakyd

.c.o:
	$(CC) $(CFLAGS) $<
