/*
             iSSL  -  independent secure sockets layer
                     issl-test.c - self-test

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

#include "issl.h"
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define RSA_STRENGTH 1536

int
main(int argc, char **argv)
{
 struct sockaddr_in sin;
 sin.sin_family = AF_INET;
 sin.sin_port = htons(231);
 sin.sin_addr.s_addr = inet_addr("127.0.0.1");

 if (!argv[1])
 {
 int len;
 BYTE rij_key[320];
 char p[4096], *pp;

 memset(p,0,4096);
 printf("Text: ");fflush(stdout);
 gets(p);

 memset(rij_key,0,sizeof(rij_key));
 strcpy(rij_key, "596f75206d75737420626520766572792c207665727920626f72656420746f206465636f646520746869732e2054686973206973207361642e");
 len = strlen(p);

 pp=rij_enc(p,&len,rij_key);
 pp=rij_dec(pp,&len,rij_key);
 printf("%04d: %s\n", len, pp);
 return 0;
 }
 else
 if (atoi(argv[1]) == 1)
  {
   char txt[256];
   issl_t active;
   issl_init_global(RSA_STRENGTH);
   active.fd = socket(AF_INET,SOCK_STREAM,0);

   strcpy(txt,"This test transmission could be received.\n");
   if (connect(active.fd,(struct sockaddr *)&sin,sizeof(sin)) < 0)
   puts("fscked"); else
   puts("connected");
   issl_connect(&active);
   issl_write(active, txt, strlen(txt));
   return 0;
  }
else
 if (atoi(argv[1]) == 2)
  {
   char buff[1024];
   issl_t passive;
   int fd = socket(AF_INET,SOCK_STREAM,0);
   issl_init_global(RSA_STRENGTH);

   bind(fd,(struct sockaddr *)&sin,sizeof(sin));
   listen(fd,1);
   ac:
   passive.fd = accept(fd,NULL,NULL);
   puts("accepted");
   issl_accept(&passive);
   if (issl_read(passive, buff, 1024) > 0)
    printf("Read: '%s'\n", buff);
   close(passive.fd);
   goto ac;
   return 0;
  }

 return 0;
}
