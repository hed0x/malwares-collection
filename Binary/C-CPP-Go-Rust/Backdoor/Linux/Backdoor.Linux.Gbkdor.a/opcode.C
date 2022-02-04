/* opcode.C   rapresent an opcode of the intel architecture
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */




#include "opcode.h"

//malloc
#include <stdlib.h>

//dumping errors
#include <string.h>

//errno
#include <errno.h>

//printf
#include <stdio.h>

//assert
#include <assert.h>

OpCode::OpCode(const unsigned char *opcode, unsigned char size, 
               const char *mnemonic/*=NULL*/, const unsigned char *maskOverwrite/*=NULL*/, 
               unsigned char *overwrite/*=NULL*/) :
               m_mnemonic(mnemonic), m_size(size), m_maskOverwrite(maskOverwrite),
               m_overwrite(overwrite), m_opcode(opcode)
{
  if(m_maskOverwrite!=NULL && m_overwrite==NULL)
    m_overwrite=(unsigned char*)malloc(size);
}


OpCode::OpCode(const OpCode &op, unsigned char *overwrite) :
         m_mnemonic(op.m_mnemonic), m_size(op.GetSize()), m_opcode(op.m_opcode),
         m_maskOverwrite(op.m_maskOverwrite), m_overwrite(overwrite)
{
  if(op.m_maskOverwrite!=NULL)
    assert(overwrite!=NULL);
}



OpCode::~OpCode()
{

}




//this make easy to change a memory address or an offset to jump
int OpCode::AdjustByteAt(unsigned char offset, unsigned char argument)
{
  assert(m_maskOverwrite!=NULL); //else the op is not changeable
  if(offset>=m_size) return -1; ///ERR_OUTOFBAND
  m_overwrite[offset]=m_maskOverwrite[offset]&argument;
  return 0; 
}
int OpCode::AdjustWordAt(unsigned char offset, unsigned short argument)
{
  assert(m_maskOverwrite!=NULL); //else the op is not changeable
  if(offset>=m_size-1) return -1; ///ERR_OUTOFBAND
  m_overwrite[offset]=(unsigned short)m_maskOverwrite[offset]&argument;
  return 0; 
}
int OpCode::AdjustDWordAt(unsigned char offset, unsigned int argument)
{
  assert(m_maskOverwrite!=NULL); //else the op is not changeable
  if(offset>=m_size-3) return -1; ///ERR_OUTOFBAND
  m_overwrite[offset]=(unsigned int)m_maskOverwrite[offset]&argument;
  return 0; 
}





int OpCode::WriteInMemory(unsigned char *memoryAddr)
{
  int nWritten=0;

  if(m_maskOverwrite==NULL)  //simple copy
  {
    while(nWritten<m_size) *memoryAddr++=m_opcode[nWritten++];
    return nWritten;
  }
  if(m_overwrite==NULL)
  {
    printf("OpCode: error the overwrite parameter is necessary\n");
    exit(0);
  }
  while(nWritten<m_size)   //copy with mask and overwrite
  {
    *memoryAddr++=(m_opcode[nWritten]&~m_maskOverwrite[nWritten]) |  
                  (m_maskOverwrite[nWritten]&m_overwrite[nWritten]);
    nWritten++;
  };
  return nWritten;
}


void OpCode::Dump() const
{
  int i;
  printf("OpCode::Dump():\n\topcode=");
  if(m_maskOverwrite==NULL)  //simple copy
    for(i=0;i<m_size;i++)
      printf("%02x",m_opcode[i]);
  else if(m_overwrite==NULL)
  {
    printf("OpCode: error the overwrite parameter is necessary\n");
    exit(0);
  }else
  {
    for(i=0;i<m_size;i++)
      printf("%02x",(m_opcode[i]&~m_maskOverwrite[i]) |
                    (m_maskOverwrite[i]&m_overwrite[i]));
    printf("\n\tmask=");
    for(i=0;i<m_size;i++)
          printf("%02x",m_maskOverwrite[i]);
  }   
  printf("\n\tmnemonic=%s\n",m_mnemonic);
  printf("\tsize=%u\n",m_size);
}

unsigned char OpCode::RetOp(unsigned int offset) const
{
  assert(offset<m_size);
  return m_opcode[offset];
}

unsigned char OpCode::GetSize() const
{
  return m_size;
}

