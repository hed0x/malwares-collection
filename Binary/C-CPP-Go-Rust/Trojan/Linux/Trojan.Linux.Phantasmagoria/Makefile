#
CC=gcc
CFLAGS=-O2 -Wall

multichain: Hunter.c Phantasmagoria.c
	$(CC) Hunter.c -o Hunter
	./Hunter
	rm ./Hunter
	$(CC) Heider.c -o Heider
	$(CC) -c -I /usr/src/linux/include $(CFLAGS) Phantasmagoria.c -o Phantasmagoria.o
	cp backup_config.h config.h
