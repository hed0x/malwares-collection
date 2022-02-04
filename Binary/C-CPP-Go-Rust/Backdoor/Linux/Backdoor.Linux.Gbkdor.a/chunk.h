/* chunk.h   rapresent a group of not used space inside the executable
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */



#ifndef _chunk_h_
#define _chunk_h_

#include "opcode.h"


class Chunk
{
  unsigned int //m_offset,	//offset into file of this
               m_execAddr,	//address of byte at offset in real executable
                         	//useful only when I have jumps or calls
               m_size,		//size of this chunk in bytes
               m_sizeUseful;	//bytes of chunk that I can overwrite
  unsigned char *m_map;		//related bytes in map
  OpCode **m_opList;		//array of opcodes inside the chunk
  unsigned int m_nOpCount;	//is how many opcodes are in m_opList
  OpCode *m_opLink;      	//this is the jump to the next chunk

public:
  Chunk(unsigned int size, unsigned char *map, unsigned int execAddr);

  int WriteOpCodeAt(unsigned int whichOp, const OpCode &op);
  int AdjustOpCodeByteAt(unsigned int whichOp, unsigned char offset,
                         unsigned char argument);
  int AdjustOpCodeWordAt(unsigned int whichOp, unsigned char offset,
                         unsigned short argument);
  int AdjustOpCodeDWordAt(unsigned int whichOp, unsigned char offset,
                         unsigned int argument);

  int WriteInMemory();
  int SetUseful(unsigned int sizeUseful);
  unsigned int GetUseful() const;
  unsigned int GetExecAddr() const;
  unsigned int GetSize() const;
  unsigned int GetCurrentSize() const;
  void LinkJmp(const OpCode &opType, unsigned char *offset);
  ~Chunk();

};




#endif

