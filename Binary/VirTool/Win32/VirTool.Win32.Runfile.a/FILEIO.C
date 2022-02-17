
// FILEIO.C - file io subroutines, uses windows api
// Copyright (C) 1998 Z0MBiE/29A

#define handle          dword              // file handle

#define FILE_ATTRIBUTE_NORMAL   0x00000080 // some constants for api
#define OPEN_EXISTING           3
#define CREATE_ALWAYS           2
#define GENERIC_READ            0x80000000
#define GENERIC_WRITE           0x40000000
#define FILE_SHARE_READ         0x00000001
#define FILE_SHARE_WRITE        0x00000002
#define FILE_BEGIN              0
#define FILE_CURRENT            1

handle openfile(pchar fname);           // open file
handle openfile_ro(pchar fname);        // open file - readonly mode
handle createfile(pchar fname);         // create new file
void closefile(handle h);               // close file
dword readfile(handle h, voidptr buf, dword bufsize);   // read file
dword writefile(handle h, voidptr buf, dword bufsize);  // write file
dword filesize(handle h);              // get file size
void seek(handle h, dword newpos);     // set file pos
dword filepos(handle h);               // get file pos

handle openfile(pchar fname)
  {
    asm
        extrn   CreateFileA:PROC

        push    0
        push    FILE_ATTRIBUTE_NORMAL
        push    OPEN_EXISTING
        push    0
        push    FILE_SHARE_READ + FILE_SHARE_WRITE
        push    GENERIC_READ + GENERIC_WRITE
        push    fname
        call    CreateFileA
    end;
    return(_EAX);
  }

handle openfile_ro(pchar fname)
  {
    asm
        extrn   CreateFileA:PROC

        push    0
        push    FILE_ATTRIBUTE_NORMAL
        push    OPEN_EXISTING
        push    0
        push    FILE_SHARE_READ
        push    GENERIC_READ
        push    fname
        call    CreateFileA
    end;
    return(_EAX);
  }

handle createfile(pchar fname)
  {
    asm
        extrn   CreateFileA:PROC

        push    0
        push    FILE_ATTRIBUTE_NORMAL
        push    CREATE_ALWAYS
        push    0
        push    FILE_SHARE_READ + FILE_SHARE_WRITE
        push    GENERIC_READ + GENERIC_WRITE
        push    fname
        call    CreateFileA
    end;
    return(_EAX);
  }

void closefile(handle h)
  {
    asm
        extrn   CloseHandle:PROC

        push    h
        call    CloseHandle
    end;
  }

dword readfile(handle h, voidptr buf, dword bufsize)
  {
    dword bytesread;
    asm
        extrn   ReadFile:PROC

        push    0
        lea     eax, bytesread
        push    eax
        push    bufsize
        push    buf
        push    h
        call    ReadFile
        mov     eax, bytesread
    end;
    return(_EAX);
  }

dword writefile(handle h, voidptr buf, dword bufsize)
  {
    dword byteswritten;
    asm
        extrn   WriteFile:PROC

        push    0
        lea     eax, byteswritten
        push    eax
        push    bufsize
        push    buf
        push    h
        call    WriteFile
        mov     eax, byteswritten
    end;
    return(_EAX);
  }

dword filesize(handle h)
  {
    asm
        extrn   GetFileSize:PROC

        push    0
        push    h
        call    GetFileSize
    end;
    return(_EAX);
  }

void seek(handle h, dword newpos)
  {
    asm
        extrn   SetFilePointer:PROC

        push    FILE_BEGIN
        push    0
        push    newpos
        push    h
        call    SetFilePointer
    end;
  }

dword filepos(handle h)
  {
    asm
        extrn   SetFilePointer:PROC

        push    FILE_CURRENT
        push    0
        push    0
        push    h
        call    SetFilePointer
    end;

    return(_EAX);
  }







