/* list/list1.h   the first backdoor opcodes list
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */




#ifndef _list1_h_
#define _list1_h_



#include "../list.h"

//here is define of LIST1_BASH_ARGC 
#include "../define.h"



class List1 : public List
{
public:
virtual void DumpHelp(const char* file) const;
virtual int AdjustEntry(int which, unsigned int oldentry,unsigned int addr);
  List1();
  ~List1();
};












#endif

