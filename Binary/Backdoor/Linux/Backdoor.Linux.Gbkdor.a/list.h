/* list.h   list of the backdoor opcodes base class
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */


#ifndef _list_h_
#define _list_h_

 
#include "opcode.h"
//#include "instructionSet.h"

class List
{
protected:
  unsigned int m_nOP;	//number of opcodes
  OpCode **m_OPList;	//array of opcodes
  unsigned int m_size;	//space used by all opcodes
  unsigned int m_oldentry;  //the old entry point where to jump
                            //if not the backdoor is been called

public:
  List();
  OpCode &operator[](unsigned int);
  unsigned int GetSize() const;
  unsigned int GetOPCount() const;
  void Dump() const;
  virtual int AdjustEntry(int which, unsigned int oldentry,unsigned int addr)=0;
  virtual void DumpHelp(const char *file) const=0;
  ~List();
};


#endif

