/* list.C   list of the backdoor opcodes base class
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */




#include "list.h"

//printf
#include <stdio.h>
//malloc
#include <stdlib.h>
#include <assert.h>



List::List() :
    m_nOP(0), m_OPList(NULL), m_size(0)
{
}

void List::Dump() const
{
  int i;
  printf("List:\n\tm_nOP=%u\n", m_nOP);
  for(i=0;i<m_nOP;i++)
    m_OPList[i]->Dump();
}

List::~List()
{
  if(m_OPList!=NULL)
    delete[] m_OPList;
}


unsigned int List::GetSize() const
{
  return m_size;
}

unsigned int List::GetOPCount() const
{
  return m_nOP;
}

OpCode &List::operator[](unsigned int index)
{
  assert(index<m_nOP);
  return *m_OPList[index];
}


