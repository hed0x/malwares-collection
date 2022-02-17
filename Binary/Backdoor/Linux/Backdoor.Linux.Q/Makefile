CC = gcc
CFLAGS = -O2 -ansi -static -I./issl
CLIBS = -L./libmix-v1.22 -L./issl -lmix -lissl

# For Solaris
#CLIBS += -lsocket -lnsl

all: libmix-v1.22/libmix.a q qs qd 

libmix-v1.22/libmix.a:
	cd libmix* && ./configure --with-libraries-as-c && make

issl/libissl.a:
	cd issl && ./configure && make libissl.a

distclean: clean
	cd libmix* && ./configure --with-libraries-as-c && make distclean
	cd issl && ./configure && make distclean
	rm -f mkpass q qs qd

clean: rmpass
	rm -f *.o *~ core q qd qs mkpass

q:	hash.h csa.o q.o
	${CC} ${CFLAGS} q.o csa.o -o q ${CLIBS}
	@#strip q

qs:	hash.h csa.o qs.o
	${CC} ${CFLAGS} qs.o csa.o -o qs ${CLIBS}
	@#strip qs

qd:	hash.h csa.o pipes.o qd.o
	${CC} ${CFLAGS} qd.o csa.o pipes.o -o qd ${CLIBS}
	@#strip qd

mkpass:
	${CC} ${CFLAGS} mkpass.c -o mkpass ${CLIBS}

hash.h: mkpass
	./mkpass

rmpass:
	@head -5 /dev/urandom > hash.h ;# secure file wiping :P
	@sync && rm -f hash.h
