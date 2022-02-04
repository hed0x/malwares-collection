/* opcode.h   rapresent an opcode of the intel architecture
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */



#ifndef _opcode_h_
#define _opcode_h_

//NULL definition
#include <stdio.h>

class OpCode
{
  const char *m_mnemonic;	
  const unsigned char *m_opcode;//the primary data
  unsigned char m_size;		//length of m_opcode
  const unsigned char *m_maskOverwrite;	//is the mask that tell which bytes
                               	//must be readen by m_overwrite while writing
                               	//or NULL if op is immutable
  unsigned char *m_overwrite;	//this own a displacement to jump or another
                             	//modification to the opcode

public:
  OpCode(const unsigned char *opcode, unsigned char size, const char *mnemonic=NULL,
            const unsigned char *maskOverwrite=NULL, unsigned char *overwrite=NULL);
  OpCode(const OpCode &op, unsigned char *overwrite);
  ~OpCode();

  //this make easy to change a memory address or an offset to jump, setting properly m_*overwrite
  int AdjustByteAt(unsigned char offset, unsigned char argument);
  int AdjustWordAt(unsigned char offset, unsigned short argument);
  int AdjustDWordAt(unsigned char offset, unsigned int argument);

  int WriteInMemory(unsigned char *memoryAddr);

  void Dump() const;
  
  //RetOp() return the byte of the op at offset (for copy) 
  unsigned char RetOp(unsigned int offset) const;	

  unsigned char GetSize() const;
};



#endif

