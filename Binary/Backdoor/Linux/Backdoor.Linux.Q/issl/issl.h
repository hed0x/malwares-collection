/*
             iSSL  -  independent secure sockets layer
              issl.h - iSSL API prototypes

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
#ifndef ISSL_H
#define ISSL_H

#define ISSL_VERSION 1
#define ISSL_REVISION 3

#include "rsa.h"
#include "rij.h"

/* global key exchange key */
extern RSA_secret_key nodekey;

/*
   iSSL connection descriptor = socket descriptor + AES key
   the iSSL RSA public peer key is not saved here;
   it is only used for temporary AES key exchange
 */

typedef struct {
 int fd;
 unsigned short init; /* connection established and  keys exchanged? */
 BYTE aes_key[321];
} issl_t;

void issl_init_global(int nbytes);
int issl_connect(issl_t *q);	/* 1: success -1: failure */
int issl_accept(issl_t *q);	/* 1: success -1: failure */
int issl_read(issl_t q, char *buf, int count);
int issl_write(issl_t q, char *buf, int count);
#define issl_close(q) close(q->fd)

#endif
