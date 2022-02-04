/* pool.h   memory container with assertions on outofrange
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */



/* here there is declaration of class Pool
 * that is used for accessing the memory.
 * Pool foundamentally is a unsigned char
 * pointer to a memory space of given size,
 * I only overwrite operator [] so that
 * isn't possible to overwrite outofrange memory
 */


#ifndef _pool_h_
#define _pool_h_


#include <stdio.h>

class Pool
{
  unsigned char *m_memory;
  unsigned int m_size;

public:
  Pool(unsigned int size, unsigned char *memory=NULL);
  unsigned char &operator[](unsigned int index);
  unsigned char *operator+(unsigned int index);
  unsigned int &DWord(unsigned int offset);
  unsigned short &Word(unsigned int offset);

};



#endif

