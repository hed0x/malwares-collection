/*
             iSSL  -  independent secure sockets layer
              rij.h - Rijndael (AES) API prototypes

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
#ifndef RIJ_H
#define RIJ_H

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>
#include "rijndael-alg-fst.h"
#include "rijndael-api-fst.h"

char *rij_enc(char *inblock, int *bsize, BYTE *rij_key);
char *rij_dec(char *inblock, int *bsize, BYTE *rij_key);
void getRandomKey(unsigned char *key, int ksz);
void bin2hex(char *in, char *out, int len);
void aes_random_init(void);
long aes_getrandom(int min, int max);

#define R_CMODE MODE_ECB

#endif
