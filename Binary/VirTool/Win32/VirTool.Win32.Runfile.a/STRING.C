
// STRING.C - asciiz string management
// Copyright (C) 1998 Z0MBiE/29A

dword strlen(pchar s);                // calc string length
void straddchar(pchar dest, char c);  // add character to string

dword strlen(pchar s)
  {
    asm
        mov     edi, s
        mov     ecx, 0xFFFFFFFF
        xor     eax, eax
        cld
        repnz   scasb
        neg     ecx
        dec     ecx
        dec     ecx
        xchg    ecx, eax
    end;
    return(_EAX);
  }

void straddchar(pchar dest, char c)
  {
    asm
        mov     edi, dest
        mov     ecx, 0xFFFFFFFF
        xor     eax, eax
        cld
        repnz   scasb
        dec     edi
        mov     al, c
        stosw
    end;
  }

