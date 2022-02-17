/* fileToInfect.h   this wrapper the file to infect
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */




#ifndef _fileToInfect_h_
#define _fileToInfect_h_



#include "pool.h"
#include "chunk.h"

//stat struct
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

//ELF structs
#include <linux/elf.h>


class FileToInfect
{
  const char *m_name;
  int m_fd;
  struct stat m_stat;
  unsigned int m_size;
  bool m_bErrorFound;

  bool m_bIsValidELF;
  
  //this access inside the file
  Pool *m_map;            	//map of the file! use this to access memory
                          	//becouse has bound verification
  //unsigned char *m_mapRaw;	//map of the file raw,
                         	//do *NOT* use this, useful only for unmap
  const Elf32_Ehdr *m_ehdr;
  const Elf32_Phdr *m_phdr;
  const Elf32_Shdr *m_shdr;
  Chunk **m_NOPChunk;	//array of pointers to Chunk instances
  unsigned int m_nChunks;

public:
  FileToInfect(const char* name);
  int Analize();
  int ChooseBetterInfection(unsigned int infection);	//compatibly with space available
  ~FileToInfect();
};



#endif

