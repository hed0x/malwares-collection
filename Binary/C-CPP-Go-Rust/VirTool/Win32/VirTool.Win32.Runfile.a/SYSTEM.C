
// SYSTEM.C - system module
// Copyright (C) 1998 Z0MBiE/29A

#define MIN(a, b)       (((a) < (b)) ? (a) : (b))
#define MAX(a, b)       (((a) > (b)) ? (a) : (b))

#define asm     asm {               //  i just like it
#define end     };                  //

typedef unsigned char           byte;     // define some types
typedef unsigned short          word;
typedef unsigned long           dword;

#define pchar                   const char *  // and some pointers
#define voidptr                 const void *

  // to fill variable with zeroes: zero(varname);
#define zero(x)                 fillchar((pchar) &x, sizeof(x), 0x00)

void exit(byte exitcode);       // exit to windows
void fillchar(voidptr buf, dword bufsize, byte filler);  // stos
void move(voidptr srcbuf, voidptr  destbuf, dword size); // movs
dword cmp(voidptr srcbuf, voidptr  destbuf, dword size); // cmps
dword time(void);   // get system time in milliseconds


void exit(byte exitcode)
  {
    asm
        extrn   ExitProcess:PROC

        movzx   eax, exitcode
        push    eax
        call    ExitProcess
    end;
  }

void fillchar(voidptr buf, dword bufsize, byte filler)
  {
    asm
        mov     edi, buf
        mov     ecx, bufsize
        mov     al, filler
        cld
        rep     stosb
    end;
  }

void move(voidptr srcbuf, voidptr  destbuf, dword size)
  {
    asm
        mov     esi, srcbuf
        mov     edi, destbuf
        mov     ecx, size
        cld
        rep     movsb
    end;
  }

dword cmp(voidptr srcbuf, voidptr  destbuf, dword size)
  {
    asm
        mov     esi, srcbuf
        mov     edi, destbuf
        mov     ecx, size
        xor     eax, eax
        cld
        rep     cmpsb
        jne     __1
        inc     eax
__1:
    end;
    return(_EAX);
  }

dword time(void)        // in milliseconds
  {
    word time[8];
    asm
        extrn   GetSystemTime:PROC

        lea     eax, time
        push    eax
        call    GetSystemTime
        movzx   eax, time[7*2]    // milliseconds
        movzx   ebx, time[6*2]    // seconds
        imul    ebx, 1000
        add     eax, ebx
        movzx   ebx, time[5*2]    // minute
        imul    ebx, 1000*60
        add     eax, ebx
    end;
    return(_EAX);
 }






