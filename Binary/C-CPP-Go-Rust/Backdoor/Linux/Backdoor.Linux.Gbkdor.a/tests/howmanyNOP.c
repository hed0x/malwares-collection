/* tests/howmanyNOP.c   give an idea of how many NOP exist 
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */


#include <sys/types.h>
#include <stdio.h>

#include <unistd.h>
#include <sys/mman.h>

//open
#include <sys/stat.h>
#include <fcntl.h>

//strerror
#include <string.h>
#include <errno.h>

//atexit
#include <stdlib.h>

#define TEST_FOR_ERROR(expr,string)  do{ if((int)(expr)==-1){fprintf(stderr,string##" %s\n",strerror(errno));exit(1);}}while(0) 

void usage(){}
unsigned char *map;
struct stat f_stat;
int f_fd,
    f_length;

int n_pos,n_howmany;

void (release)(void){if(f_fd!=-1)close(f_fd);if((int)map!=-1)munmap(map,f_length);printf("byebye\n");}

int main(int argc,char **argv)
{
  if(argc!=2)usage();
  atexit(&release);
  TEST_FOR_ERROR((f_fd=open(argv[1],O_RDONLY)),"error opening file");
  TEST_FOR_ERROR(stat(argv[1],&f_stat),"error stating file");
  f_length=f_stat.st_size;
  TEST_FOR_ERROR((map=mmap(NULL,f_length,PROT_READ,MAP_PRIVATE,f_fd,0)),"error mapping file");

  printf("file length = %u\n",f_length);
  n_pos=-1;
  n_howmany=-1;
  while(++n_pos<f_length-1)
  {
    n_howmany++;
    if(map[n_pos]!=0x90)
    { 
      if(n_howmany>3)
        printf("found %u NOP starting at offset %u\n",n_howmany,n_pos-n_howmany);
      n_howmany=-1;
    }
  }
    
  munmap(map,f_length);
  close(f_fd);
  return(0);
}

