# Makefile for rrs
# $Id: Makefile,v 1.55 2004/05/30 00:14:14 shadow Exp $

CC=gcc
MAKE=make
INSTALL=install

# if your system doesn't have GNU's getopt_long(), add -DWITHOUT_GNU_GETOPT
CFLAGS=-I/usr/local/include -Wall -O2
# openpty() is in libutil on most Unix-like operating systems
LDFLAGS=-L/usr/local/lib -s -lstdc++ -lm -lutil -lssl -lcrypto
LDFLAGSNOSSL=-s -lstdc++ -lm -lutil

PREFIX=/usr/local
BINDIR=bin
MANDIR=man/man1

WORD32_TYPE   = unsigned long
WORD32_FORMAT = %08lX


############################ you don't need to change what's below
out=rrs
SRC=gwee.c


none:
	@echo "usage:"
	@echo "  make generic                      - for Linux, NetBSD, FreeBSD or OpenBSD"
	@echo "  make generic LDEXTRA=-lgnugetopt  - For FreeBSD <= 4.x.x"
	@echo "  make generic-nossl                - Without OpenSSL support"
	@echo "  make qnx                          - QNX doesn't have GNU's getopt"
	@echo "  make qnx-nossl"

generic: clean compile-generic
generic-nossl: clean compile-generic-nossl

qnx: clean
	$(MAKE) LDFLAGS="-L/usr/local/lib -s -lsocket -lssl -lcrypto" compile-qnx
qnx-nossl: clean
	$(MAKE) LDFLAGSNOSSL="-s -lsocket" compile-qnx-nossl

distclean: clean

clean:
	rm -f *.o *.a core $(out)

## generic
compile-generic:
	$(CC) $(CFLAGS) $(LDFLAGS) $(LDEXTRA) -o $(out) rrs.c md5.c sha1.c farm9crypt.cc twofish2.cc

compile-generic-nossl:
	$(CC) -DWITHOUT_SSL $(CFLAGS) $$CFLAGS $(LDFLAGSNOSSL) $(LDEXTRA) -o $(out) rrs.c md5.c sha1.c farm9crypt.cc twofish2.cc

## qnx
compile-qnx:
	$(CC) -DWITHOUT_GNU_GETOPT $(CFLAGS) $(LDFLAGS) $(LDEXTRA) -o $(out) rrs.c md5.c sha1.c farm9crypt.cc twofish2.cc

compile-qnx-nossl:
	$(CC) -DWITHOUT_SSL -DWITHOUT_GNU_GETOPT $(CFLAGS) $(LDFLAGSNOSSL) $(LDEXTRA) -o $(out) rrs.c md5.c sha1.c farm9crypt.cc twofish2.cc

## installation
install:
	$(INSTALL) -m 755 -d $(PREFIX)/$(BINDIR)
	$(INSTALL) -m 755 -d $(PREFIX)/$(MANDIR)
	$(INSTALL) -c -m 755 $(out) $(PREFIX)/$(BINDIR)/
	$(INSTALL) -c -m 644 rrs.1 $(PREFIX)/$(MANDIR)/

uninstall:
	rm -f $(PREFIX)/$(BINDIR)/$(out)
	rm -f $(PREFIX)/$(MANDIR)/rrs.1

dist:
	./mktarball.sh

