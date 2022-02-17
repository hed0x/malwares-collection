
// CRT.C - module to work with console
// Copyright (C) 1998 Z0MBiE/29A

#define STD_INPUT_HANDLE        -10  // constants for windows api
#define STD_OUTPUT_HANDLE       -11
#define STD_ERROR_HANDLE        -12

handle con_handle;      // handle of console

char hexchar[16] = "0123456789ABCDEF";  // hex. characters

void con_init(void);    // initialize console
void con_done(void);    // close console

void pascal printf_char(char c);        // equal to %c in printf
void pascal printf_hexchar(byte b);     //
void pascal printf_hexbyte(byte b);     // %B
void pascal printf_hexword(word w);     // %W
void pascal printf_hexdword(dword d);   // %D
void pascal printf_dword(dword d);      // %d
void pascal printf_byte(byte b);        // %b
void pascal printf_word(word w);        // %w
void pascal printf_long(long l);        // %l
void pascal printf_short(short s);      // %s
void pascal printf_int(int i);          // %i
void pascal printf_crlf(void);          // \n
void pascal printf_asciiz(pchar s);     // %a

void cdecl printf(pchar format, ...);

void con_init(void)
  {
    asm
        extrn   GetStdHandle:PROC

        push    STD_OUTPUT_HANDLE
        call    GetStdHandle

        mov     con_handle, eax
    end;
  }

void con_done(void)
  {
    closefile(con_handle);
  }

void pascal printf_char(char c)
  {
    writefile(con_handle, &c, 1);
  }

void pascal printf_hexchar(byte b)
  {
    printf_char(hexchar[b & 15]);
  }

void pascal printf_hexbyte(byte b)
  {
    printf_hexchar(b >> 4);
    printf_hexchar(b & 15);
  }

void pascal printf_hexword(word w)
  {
    printf_hexbyte(w >> 8);
    printf_hexbyte(w & 255);
  }

void pascal printf_hexdword(dword d)
  {
    printf_hexword(d >> 16);
    printf_hexword(d & 65535);
  }

void pascal printf_dword(dword d)
  {
    if (d >= 10)
      printf_dword(d / 10);
    printf_char('0'+ d % 10);
  }

void pascal printf_byte(byte b)
  {
    printf_dword(b);
  }

void pascal printf_word(word w)
  {
    printf_dword(w);
  }

void pascal printf_long(long l)
  {
    if (l < 0)
       {
         printf_char('-');
         l = -l;
       }
    printf_dword(l);
  }

void pascal printf_short(short s)
  {
    printf_long(s);
  }

void pascal printf_int(int i)
  {
    printf_long(i);
  }

void pascal printf_crlf(void)
  {
    printf_char(13);
    printf_char(10);
  }

void pascal printf_asciiz(pchar s)
  {
    while ((char)*s != 0x00)
      {
        printf_char((char) *s);
        s++;
      }
  }

void cdecl printf(pchar format, ...)
  {
    dword stack_ptr = 12;

    asm
        mov     esi, format
        cld
__nextchar:
        lodsb
        or      al, al
        jz      __exit
        cmp     al, '%'
        je      __percent
        cmp     al, 0x0A
        je      __crlf

__putchar:
        push    eax
        call    printf_char

        jmp     __nextchar

__crlf: call    printf_crlf

        jmp     __nextchar

em_pop_eax:
        mov     ecx, stack_ptr
        add     stack_ptr, 4
        mov     eax, [ebp+ecx]
        ret

__percent:
        lodsb
        or      al, al
        jz      __exit

        cmp     al, 's'
        je      __s
        cmp     al, 'i'
        je      __i
        cmp     al, 'l'
        je      __l
        cmp     al, 'c'
        je      __c
        cmp     al, 'b'
        je      __b
        cmp     al, 'w'
        je      __w
        cmp     al, 'd'
        je      __d
        cmp     al, 'B'
        je      __bh
        cmp     al, 'W'
        je      __wh
        cmp     al, 'D'
        je      __dh
        cmp     al, 'a'
        je      __a

        jmp     __putchar

__s:    call    em_pop_eax
        push    eax
        call    printf_short
        jmp     __nextchar

__i:    call    em_pop_eax
        push    eax
        call    printf_int
        jmp     __nextchar

__l:    call    em_pop_eax
        push    eax
        call    printf_long
        jmp     __nextchar

__c:    call    em_pop_eax
        push    eax
        call    printf_char
        jmp     __nextchar

__b:    call    em_pop_eax
        push    eax
        call    printf_byte
        jmp     __nextchar

__w:    call    em_pop_eax
        push    eax
        call    printf_word
        jmp     __nextchar

__d:    call    em_pop_eax
        push    eax
        call    printf_dword
        jmp     __nextchar

__bh:   call    em_pop_eax
        push    eax
        call    printf_hexbyte
        jmp     __nextchar

__wh:   call    em_pop_eax
        push    eax
        call    printf_hexword
        jmp     __nextchar

__dh:   call    em_pop_eax
        push    eax
        call    printf_hexdword
        jmp     __nextchar
__a:    call    em_pop_eax
        push    eax
        call    printf_asciiz
        jmp     __nextchar

__exit:
    end;
  }
