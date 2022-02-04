/* chunk.C   rapresent a group of not used space inside the executable
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */



#include "chunk.h"

#include <stdio.h>
#include <stdlib.h>



Chunk::Chunk(unsigned int size, unsigned char *map, 
             unsigned int execAddr ) :
         m_size(size), m_map(map), m_execAddr(execAddr),
         m_opList(NULL), m_nOpCount(0), m_opLink(NULL),
         m_sizeUseful(0)
{
  

}


/* WriteOpCodeAt() will free opcodes
 * stored in m_opList over which, and will store
 * at which a new opcode that can have mask and overwrite set too!
 */
int Chunk::WriteOpCodeAt(unsigned int which, const OpCode &op )
{
  //look if there is enought space for adding this op
  int i,
      spaceUsed; 
  if(which>m_nOpCount)
  { 
    fprintf(stderr,"error, trying to write over the known space\n");
    exit(2); ///////
  }
  for(i=0,spaceUsed=0;i<which;i++)
  {
    spaceUsed+=m_opList[i]->GetSize();
  }
  if(op.GetSize()+spaceUsed>m_sizeUseful)
  { 
    printf("Chunk: error trying to write over bounds\n");
    exit(2);
  }
  for(i=which;i<m_nOpCount;i++) 
    delete m_opList[i];
  if(which==m_nOpCount) //increase pointers space
    m_opList=(OpCode**)realloc(m_opList,++m_nOpCount*sizeof(OpCode*));
  m_opList[which]=new OpCode(op);
  return 0;
}

int Chunk::AdjustOpCodeByteAt(unsigned int which, unsigned char offset,
                              unsigned char argument)
{
  return 0;
}

int Chunk::AdjustOpCodeWordAt(unsigned int which, unsigned char offset,
                              unsigned short argument)
{
  return 0;
}

int Chunk::AdjustOpCodeDWordAt(unsigned int which, unsigned char offset,
                              unsigned int argument)
{
  return 0;
}


Chunk::~Chunk()
{

}


int Chunk::WriteInMemory()
{
  unsigned int i,
               offset;
  if(m_sizeUseful==0) {printf("warning sizeuseful=0\n");return 0;} //nothing written
  for(i=0,offset=0;i<m_nOpCount;i++)
  {
#ifdef DEBUG
  printf("chunk::writing on file opcount=%d\ti=%d\n",m_nOpCount,i);
#endif
    if(m_opList[i]->GetSize()+offset>m_sizeUseful)
      return 2;  //ERR_NOT_FIT
    m_opList[i]->WriteInMemory(m_map+offset);
    offset+=m_opList[i]->GetSize();
  }
  if(m_sizeUseful<m_size) 
    m_opLink->WriteInMemory(m_map+m_sizeUseful);
  return 0;
}


/* set the useable size for the chunk
 * accordingly to position of the next chunk
 * to jump
 */
int Chunk::SetUseful(unsigned int sizeUseful)
{
  if(sizeUseful>m_size)
    return -1;  //ERR_BOUNDARY
  m_sizeUseful=sizeUseful;   
  return 0;
}

unsigned int Chunk::GetUseful() const
{
  return m_sizeUseful;
}


/* GetExecAddr()
 * tells the address
 */
unsigned int Chunk::GetExecAddr() const
{
  return m_execAddr;
}

/* GetSize()
 * tells the size of the chunk
 */
unsigned int Chunk::GetSize() const
{
  return m_size;
}


void Chunk::LinkJmp(const OpCode &opType, unsigned char *offset)
{
  m_opLink=new OpCode(opType,offset);  
}


unsigned int Chunk::GetCurrentSize() const
{
  int i,
      size=0;
  for(i=0;i<m_nOpCount;i++)
    size+=m_opList[i]->GetSize();
  return size;
}



