# Generated automatically from Makefile.in by configure.
# Makefile.in generated automatically by automake 1.4 from Makefile.am

# Copyright (C) 1994, 1995-8, 1999 Free Software Foundation, Inc.
# This Makefile.in is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.


INSTALL = /usr/bin/install -c
CC = gcc
CFLAGS = -Wall -O2
CPP = gcc -E
MPI_EXTRA_ASM_OBJS = 
MPI_OPT_FLAGS = 
MPI_SFLAGS = 
AES_FLAGS = -Wall -O2 -DTRACE_KAT_MCT -DINTERMEDIATE_VALUE_KAT
ISSL_OBJECTS = rsa.o primegen.o random.o rijndael-api-fst.o rijndael-alg-fst.o rij.o issl.o
AR = ar
RANLIB = ranlib

install: libissl.a issl.3
	/usr/bin/install -c -m 0755 libissl.a /usr/local/lib/libissl.a
	/usr/bin/install -c -d /usr/include/issl
	for a in *.h ; do \
	/usr/bin/install -c -m 0644 $$a /usr/include/issl/$$a ; done
	/usr/bin/install -c -m 0644 issl.3 /usr/local/man/man3/issl.3
	@echo Done, please read ISSL-HOWTO.

uninstall:
	/bin/rm -rf /usr/include/issl
	/bin/rm -f /usr/local/lib/libissl.a

libissl.a: $(ISSL_OBJECTS) mpi/mpiutil.o
	ar cru libissl.a $(ISSL_OBJECTS) mpi/*.o
	$(RANLIB) libissl.a

issl-test: issl-test.o $(ISSL_OBJECTS) mpi/mpiutil.o
	gcc -Wall -o issl-test issl-test.o  $(ISSL_OBJECTS) mpi/*.o -I.

rijndael-api-fst.o:
	gcc $(AES_FLAGS) rijndael-api-fst.c -c

rijndael-alg-fst.o:
	gcc $(AES_FLAGS) rijndael-alg-fst.c -c

rij.o:
	gcc $(AES_FLAGS) rij.c -c

mpi/mpiutil.o:
	cd mpi && make

distclean:
	cd mpi && make clean
	make clean

clean:
	rm -f config.cache config.log config.status stamp-h issl-test *.o libissl.a
