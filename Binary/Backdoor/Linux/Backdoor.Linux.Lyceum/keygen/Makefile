OBJS=keygen.c ./../random.o
CC=gcc
RM=rm
CFLAGS=-O2 -Wall -s 
PROG=keygen

all: key

clean:
	$(RM) $(PROG)

key: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS)	-o $(PROG)

	
