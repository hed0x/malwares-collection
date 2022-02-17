   remove_sign     equ     'BYE'

   include         vxd.inc

                   .386p
                   .model  flat

                   .data
   idt             df      ?
   int0ofs         dd      ?
   int0code        dd      2 dup(?)
   prevIFSHook     dd      ?

                   .code
   start:
                   sidt    fword ptr ds:idt
                   mov     ebx,dword ptr ds:idt[2]
                   mov     cx,ds:[ebx+6]
                   shl     ecx,16
                   mov     cx,ds:[ebx]
                   mov     ds:int0ofs,ecx

                   mov     eax,ds:[ecx]
                   mov     ds:int0code,eax
                   mov     eax,ds:[ecx+4]
                   mov     ds:int0code[4],eax
                   mov     byte ptr ds:[ecx],68h
                                           ; opcode 68 -> push xxxxxxxx
                   mov     dword ptr ds:[ecx+1],offset myint0
                   mov     byte ptr ds:[ecx+5],0c3h
                   xor     eax,eax
                   div     al
                   ret


   myint0:         add     dword ptr ss:[esp],2
                   pushad
                   push    ds es
                   mov     ax,ss
                   mov     ds,ax
                   mov     es,ax
                   mov     ebx,ds:int0ofs
                   mov     eax,ds:int0code
                   mov     ds:[ebx],eax
                   mov     eax,ds:int0code[4]
                   mov     ds:[ebx+4],eax

                   mov     eax,offset FileHooker
                   push    eax
                   VxDCall IFSMgr_InstallFileSystemApiHook
                   pop     ebx
                   mov     ds:prevIFSHook,eax
                   cmp     eax,remove_sign
                   je      i0l1

                   push    ebx
                   VxDCall IFSMgr_RemoveFileSystemApiHook
                   pop     ebx

   i0l1:           pop     es ds
                   popad
                   iretd


                   dd      remove_sign
   FileHooker:     mov     eax,ds:prevIFSHook
                   jmp     dword ptr ds:[eax]

                   end     start
