/*
             iSSL  -  independent secure sockets layer
              issl.c - iSSL API function implementation

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

RSA_secret_key nodekey;

void
issl_init_global(int nbits)
{
 if (nbits < 1536)
  rsa_log_fatal("Minimum of RSA 1536-bit encryption required for iSSL!\n");
 generate(&nodekey,nbits);
}

int
issl_connect(issl_t *q)
{
 RSA_public_key peerkey;
 MPI msg, msg2, reply;
 unsigned char raw1[2048], raw2[2048];
 int rs, rks1, rks2;

 if (!nodekey.n||!check_secret_key(&nodekey)) rsa_log_fatal("RSA key uninitialized\n");

 // send public key (primes)
 rs = mpi2raw (nodekey.n,raw1);
 if (write(q->fd, raw1, rs) != rs)
 {
  rsa_log("connect: error\n");
  return -1;
 }

 // receive public key (primes)
 if ((rks1=read(q->fd, raw1, 2048)) <= 0)
 {
  rsa_log("connect: error (peer)\n");
  return -1;
 }
 peerkey.n = raw2mpi(raw1);

 // send public key (exponent)
 rs = mpi2raw (nodekey.e,raw2);
 if (write(q->fd, raw2, rs) != rs)
 {
  rsa_log("connect: error\n");
  return -1;
 }

 // receive public key (exponent)
 if ((rks2=read(q->fd, raw2, 2048)) <= 0)
 {
  rsa_log("connect: error (peer)\n");
  return -1;
 }
 peerkey.e = raw2mpi(raw2);

 memset(raw1,0,2048);
 memset(raw2,0,2048);
 getRandomKey(raw1, 160);
 bin2hex(raw1, q->aes_key, 160);
 q->aes_key[320] = '\0';

 // send our MPI starting with 31337, encoded with remote public key
 msg = mpi_alloc(41);
 msg2 = mpi_alloc(41);
 msg->d[0] = 31337;
 memcpy(&msg->d[1], raw1, 160);
 msg->nlimbs = 41;
 msg2->nlimbs = 41;
 public(msg2, msg, &peerkey);
 rs = mpi2raw (msg2,raw1);
 write(q->fd,raw1,rs);
 mpi_free(msg2);
 mpi_free(msg);

 // receive peer MPI starting with 666, encoded with our public key
 rs=read(q->fd,raw2,2048);
 if (rs <= 0)
 {
  rsa_log("connect: error while reading final affirmation\n");
  return -1;
 }

 reply=raw2mpi(raw2);
 secret(reply,reply,&nodekey);
 if (reply->d[0] != 666)
  {
   rsa_log("connect: bad magic number '%lu'\n", reply->d[0]);
   return -1;
  }
 mpi_free(reply);
 mpi_free(peerkey.e);
 mpi_free(peerkey.n);

 q->init = 1337;
 return 1;
}

int
issl_accept(issl_t *q)
{
 RSA_public_key peerkey;
 MPI msg, reply;
 unsigned char raw1[2048], raw2[2048];
 int rs, rks1, rks2;

 if (!nodekey.n||!check_secret_key(&nodekey)) rsa_log_fatal("RSA key uninitialized\n");

 // receive public key (primes)
 if ((rks1=read(q->fd, raw1, 2048)) <= 0)
 {
  rsa_log("accept: error (peer)\n");
  return -1;
 }
 peerkey.n = raw2mpi(raw1);

 // send public key (primes)
 rs = mpi2raw (nodekey.n,raw1);
 if (write(q->fd, raw1, rs) != rs)
 {
  rsa_log("accept: error\n");
  return -1;
 }

 // receive public key (exponent)
 if ((rks2=read(q->fd, raw2, 2048)) <= 0)
 {
  rsa_log("accept: error (peer)\n");
  return -1;
 }
 peerkey.e = raw2mpi(raw2);

 // send public key (exponent)
 rs = mpi2raw (nodekey.e,raw2);
 if (write(q->fd, raw2, rs) != rs)
 {
  rsa_log("accept: error\n");
  return -1;
 }

 memset(raw1,0,2048);
 memset(raw2,0,2048);

 // receive peer MPI starting with 31337, encoded with our public key
 // todo public decryption

 rs = read(q->fd,raw1,2048);
 if (rs <= 0)
 {
  rsa_log("accept: error while reading session key\n");
  return -1;
 }

 reply = raw2mpi(raw1);
 secret(reply,reply,&nodekey);
 if (reply->d[0] != 31337)
  {
   rsa_log("accept: bad magic number '%lu'\n", reply->d[0]);
   return -1;
  }
 bin2hex((char *)&reply->d[1], q->aes_key, 160);
 q->aes_key[320] = '\0';
 mpi_free(reply);

 // write back MPI starting with 666, encoded with peer public key
 msg = mpi_alloc(1);
 msg->d[0] = 666;
 msg->nlimbs = 1;
 public(msg,msg,&peerkey);
 rs = mpi2raw (msg,raw2);
 write(q->fd,raw2,rs);
 mpi_free(msg);
 mpi_free(peerkey.n);
 mpi_free(peerkey.e);

 q->init = 1337;
 return 1;
}

int
issl_read(issl_t q, char *buf, int count)
{
 int rv = 0, ic = 0;
 char *p;
 if (q.init != 1337)
 {
  rsa_log("trying to read from uninitialized connection!\n");
  return -1;
 }
 memset(buf,0,count);
 if ((rv = read(q.fd, buf, count)) <= 0)
  return rv;
 ic = rv;
 p = rij_dec(buf,&ic,q.aes_key);
 memcpy(buf,p,ic);
 return ic;
}

int
issl_write(issl_t q, char *buf, int count)
{
 char *p;
 int ic = count;
 if (q.init != 1337)
 {
  rsa_log("trying to write to uninitialized connection!\n");
  return -1;
 }
 p = rij_enc(buf,&ic,q.aes_key);
 return write(q.fd, p, ic);
}
