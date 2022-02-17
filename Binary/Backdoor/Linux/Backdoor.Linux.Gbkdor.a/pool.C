/* pool.C   memory container with assertions on outofrange
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */


/* here there is definition of class Pool
 * that is used for accessing the memory.
 * Pool foundamentally is a unsigned char
 * pointer to a memory space of given size,
 * I only overwrite operator [] so that
 * isn't possible to overwrite outofrange memory
 */

#include "pool.h"

#include <stdio.h>
#include <assert.h>

unsigned char &Pool::operator[](unsigned int index)
{
//  printf("Pool: operator[%i]\n", index);
  assert(index<m_size); 
  return m_memory[index];
}

unsigned char *Pool::operator+(unsigned int index)
{
  assert(index<m_size);
  return m_memory+index;
}
  
Pool::Pool(unsigned int size, unsigned char *memory /*=NULL*/) :
      m_memory((unsigned char*)memory), m_size(size)    
{
  assert(memory!=NULL && memory!=(unsigned char*)-1);
#ifdef DEBUG
  printf("Pool: constructed mem=%p size=%u\n", m_memory, m_size);
#endif
}

unsigned int &Pool::DWord(unsigned int offset)
{
  assert(offset+3<m_size);
  return *(unsigned int*)(m_memory+offset);
}
 
unsigned short &Pool::Word(unsigned int offset)
{
  assert(offset+1<m_size);
  return *(unsigned short*)(m_memory+offset);
}

