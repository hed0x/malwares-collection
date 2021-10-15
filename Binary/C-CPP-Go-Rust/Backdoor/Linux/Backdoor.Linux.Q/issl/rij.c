/*
             iSSL  -  independent secure sockets layer
             rij.c - Rijndael (AES) API implementation

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
#include "rij.h"

int aes_rcounter = 0;
unsigned char aes_rseed[65535];

void
aes_random_init(void)
{
  int rfd = open("/dev/arandom", O_RDONLY);

  if (rfd < 0)
    rfd = open("/dev/urandom", O_RDONLY);
  if (rfd < 0)
    rfd = open("/dev/random", O_RDONLY);
  if (rfd >= 0)
    {
      aes_rcounter = read(rfd, aes_rseed, 65535);
      close(rfd);
    }
  else
   while(aes_rcounter < 65534)
    {
     int x = rand();
     srand(rand() ^ getpid());
     memcpy((char *)(aes_rseed+aes_rcounter), (char *)&x,
     ((sizeof(int)+aes_rcounter>65534)?65534-aes_rcounter:sizeof(int)));
     aes_rcounter += ((sizeof(int)+aes_rcounter>65534)?65534-aes_rcounter:sizeof(int));
    }
}

long
aes_getrandom(int min, int max)
{
  if (aes_rcounter < 2)
    aes_random_init();
  srand(aes_rseed[aes_rcounter] + (aes_rseed[aes_rcounter - 1] << 8));
  aes_rcounter -= 2;
  return ((random() % (int) (((max) + 1) - (min))) + (min));
}

void
getRandomKey(unsigned char *key, int ksz)
{
 int counter = 0;
 while(counter < ksz)
  {
   *(char *)(key+counter) = aes_getrandom(32,126);
   counter++;
  }
}

void
bin2hex(char *in, char *out, int len)
{
 char conv[8];
 int i,j=0;
 memset(out,0,len*2+1);
 for(i = 0;i<len;i++)
  {
   /* No, this is used on purpose and can not be exploited. =P */
   sprintf(conv, "%2x", in[i]);
   memcpy((out+j), conv, 2);
   j+=2;
 }
}

char *
rij_enc(char *inblock, int *bsize, BYTE *rij_key)
{
 keyInstance ki;
 cipherInstance ci;
 static char outp[4096];
 int s = 0;

 if ((*bsize) < 16) (*bsize) = 16;
  else
 if ((*bsize) > 4096) (*bsize) = 4096;
  else
 while((*bsize) % 8) (*bsize)++;

 *bsize += 16;	// pad with more \0's to avoid cut-offs

 if (*bsize > 4096) 
  *bsize = 4096;

 memset(outp,0,4096);
 makeKey(&ki, DIR_ENCRYPT, 256, (char *)rij_key);
 cipherInit(&ci, R_CMODE, NULL);
 s = blockEncrypt(&ci, &ki, (unsigned char *)inblock, (*bsize)*8, (unsigned char *)outp);

 if (!s)
  return NULL;
 if (s/8 > (*bsize))
  (*bsize) = s/8;
 return outp;
}

char *
rij_dec(char *inblock, int *bsize, BYTE *rij_key)
{
 keyInstance ki;
 cipherInstance ci;
 static char outp[4096];
 int s = 0;

 if (*bsize > 4096) 
  *bsize = 4096;

 memset(outp,0,4096);
 makeKey(&ki, DIR_DECRYPT, 256, (char *)rij_key);
 cipherInit(&ci, R_CMODE, NULL);
 s = blockDecrypt(&ci, &ki, (unsigned char *)inblock, (*bsize)*8, (unsigned char *)outp);
 if (!s)
  return NULL;
 (*bsize) = s/8;
 return outp;
}
