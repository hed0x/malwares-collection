/*
             iSSL  -  independent secure sockets layer
                   rsa.h - RSA API prototypes

     Copyright (C) 2001 by Mixter <mixter@newyorkoffice.com>

   Free use of the iSSL library is limited to noncommercial applications.

   This program is free software; you can redistribute it and/or modify     
   it under the terms of the GNU General Public License as published by     
   the Free Software Foundation; either version 2 of the License, or        
   (at your option) any later version.                                      
                                                                          
   This program is distributed in the hope that it will be useful,          
   but WITHOUT ANY WARRANTY; without even the implied warranty of           
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            
   GNU General Public License for more details.                             
                                                                          
   You should have received a copy of the GNU General Public License        
   along with this program; if not, write to the Free Software              
   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA 
*/
#ifndef RSA_H
#define RSA_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "mpi.h"
#include "memory.h"
#include "util.h"

typedef struct {
    MPI n;          /* modulus */
    MPI e;          /* exponent */
} RSA_public_key;

typedef struct {
    MPI n;          /* public modulus */
    MPI e;          /* public exponent */
    MPI d;          /* exponent */
    MPI p;          /* prime  p. */
    MPI q;          /* prime  q. */
    MPI u;          /* inverse of p mod q. */
} RSA_secret_key;

int mpi2raw(MPI src, char *raw);
MPI raw2mpi(char *raw);
void pr_mpi(MPI x);

void test_keys( RSA_secret_key *sk, unsigned nbits );
void generate( RSA_secret_key *sk, unsigned nbits );
int  check_secret_key( RSA_secret_key *sk );
void public(MPI output, MPI input, RSA_public_key *skey );
void secret(MPI output, MPI input, RSA_secret_key *skey );

extern RSA_secret_key nodekey;

#endif
