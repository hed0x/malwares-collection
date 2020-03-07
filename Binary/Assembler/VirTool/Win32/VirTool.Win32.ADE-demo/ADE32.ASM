
; ---------------------------------------------------------------------------

; LDE32 -- Length-Disassembler Engine -- 32-bit           (x) 1999-2002
;                                                     http://z0mbie.cjb.net
; release 1.00          8-12-99
; release 1.01          9-12-99
; release 1.02         17-03-00  0xF6/0xF7 'test' opcode bugfixed
; release 1.03         21-04-00  bugfix: some prefixes before 0F were cleared
;                                bugfix: error in MODRM analysis
;                                CD 20 now is 6 bytes length
; release 1.04          1-05-00  AAM & AAD bugfixed (was 1-byte len)
; release 1.05         xx-xx-xx  special edition, flags changed
; release 1.06          3-01-01  partially rewritten, __cdecl

; ADE32 -- Advanved Disassembler Engine

; release 2.00         xx-02-02  rewritten, more flags, split opcode into
;                                parts, bugfixed
; release 2.01         xx-02-02  asm() prefix order fixed, flags added
; release 2.02         xx-02-02  added C_BAD flag, see also PE_STAT

; ---------------------------------------------------------------------------

public                  _ade32_init
public                  _ade32_disasm
public                  _ade32_asm
public                  _ade32_end

include                 ade32.ash

                        p386
                        model   flat
                        locals  @@

                        .code

; ---------------------------------------------------------------------------

_ade32_init:
include                 flagtbl1.inc

; ---------------------------------------------------------------------------

_ade32_disasm:
                        pusha

                        xor     eax, eax           ; only AL used
                        xor     edx, edx           ; EDX=0, flags

                        mov     ebp, [esp+32+8]    ; EBP = disasm_struct*

                        lea     edi, [ebp+2]       ; EDI = disasm_struct + 2
                        push    4+4+4+4+6+8+8
                        pop     ecx
                        cld
                        rep     stosb

                        mov     edi, [esp+32+12]   ; EDI = flag table
                        mov     esi, [esp+32+4]    ; ESI = opcode

                        cmp     ax, [esi]              ; 00 00
                        je      @@error
                        cmp     word ptr [esi], 0FFFFh ; FF FF
                        je      @@error

@@repeat_prefix:        mov     al, [esi]
                        inc     esi

                        mov     ebx, [edi+eax*4] ; EBX = current byte flag

                        test    bl, C_ANYPREFIX
                        jnz     @@prefix

                        or      edx, ebx         ; EDX = summary flags

                        mov     [ebp].disasm_opcode, al

                        ; must be sorted by frequency: highest first
                        cmp     al, 0Fh            ; 0F xx [...]
                        je      @@0F
                        cmp     al, 0F7h
                        je      @@F7
                        cmp     al, 0F6h
                        je      @@F6
                        cmp     al, 0CDh           ; int
                        je      @@CD
@@end_special:
                        test    dh, C_MODRM shr 8
                        jnz     @@modrm
@@end_modrm:
                        mov     [ebp].disasm_flag, edx

                        mov     al, dh
                        and     dx, C_ADDR1+C_ADDR2+C_ADDR4 + C_DATA1+C_DATA2+C_DATA4

                        test    al, C_ADDR67 shr 8
                        jz      @@not_addr67
                        add     dl, [ebp].disasm_defaddr
@@not_addr67:
                        test    al, C_DATA66 shr 8
                        jz      @@not_data66
                        add     dh, [ebp].disasm_defdata
@@not_data66:
                        movzx   ecx, dl
                        mov     [ebp].disasm_addrsize, ecx
                        jecxz   @@skip_cpyaddr
                        lea     edi, [ebp].disasm_addr
                        rep     movsb
@@skip_cpyaddr:
                        mov     cl, dh
                        mov     [ebp].disasm_datasize, ecx
                        jecxz   @@skip_cpydata
                        lea     edi, [ebp].disasm_data
                        rep     movsb
@@skip_cpydata:
                        sub     esi, [esp+32+4]
                        xchg    esi, eax

@@exit:                 mov     [ebp].disasm_len, eax
                        mov     [esp+7*4], eax          ; popa.eax

                        popa
                        retn

@@error:
                        xor     eax, eax
                        jmp     @@exit

@@prefix:
                        mov     ah, bl           ; test if twice
                        and     ah, dl           ; LOCK,SEG,REP,66,67,
                        and     ah, C_ANYPREFIX  ; then error
                        jnz     @@error          ;

                        or      edx, ebx         ; EDX = summary flags

                        ; must be sorted by frequency: highest first
                        test    bl, C_67
                        jnz     @@67
                        test    bl, C_66
                        jnz     @@66
                        test    bl, C_SEG
                        jnz     @@seg
                        test    bl, C_REP
                        jnz     @@rep

                        ; lock
@@j_repeat_prefix:      jmp     @@repeat_prefix

@@rep:                  mov     [ebp].disasm_rep, al  ; store prefix value
                        jmp     @@j_repeat_prefix

@@seg:                  mov     [ebp].disasm_seg, al  ; --//--
                        jmp     @@j_repeat_prefix

@@66:                   xor     [ebp].disasm_defdata, 2+4   ; 2<-->4
                        jmp     @@j_repeat_prefix

@@67:                   xor     [ebp].disasm_defaddr, 2+4   ; 2<-->4
                        jmp     @@j_repeat_prefix

@@0F:
                        mov     al, [esi]
                        inc     esi

                        mov     [ebp].disasm_opcode2, al

                        or      edx, [edi+eax*4+1024]  ; 2nd flagtable half

                        cmp     edx, C_ERROR
                        je      @@error

@@j_end_special:        jmp     @@end_special

@@F6:
                        test    byte ptr [esi], 00111000b   ; modTTTrm
                        jnz     @@j_end_special
                        or      dh, C_DATA1 shr 8 ; F6 --> C_DATA1
                        jmp     @@j_end_special

@@F7:
                        test    byte ptr [esi], 00111000b   ; modTTTrm
                        jnz     @@j_end_special
                        or      dh, C_DATA66 shr 8; F7 --> C_DATA66
                        jmp     @@j_end_special

@@CD:
                        cmp     byte ptr [esi], 20h
                        jne     @@j_end_special
                        or      dh, C_DATA4 shr 8     ; VxDcall
                        jmp     @@j_end_special
@@modrm:
                        mov     al, [esi]
                        inc     esi

                        mov     [ebp].disasm_modrm, al

                        push    eax
                        and     al, 38h ; ttt
                        cmp     al, 20h
                        pop     eax
                        jne     @@not_jmp_modrm
                        cmp     [ebp].disasm_opcode, 0FFh
                        jne     @@not_jmp_modrm
                        btc     edx, C_STOP_LG2
@@not_jmp_modrm:
                        mov     ah, al  ; ah=mod, al=rm

                        and     ax, 0C007h
                        cmp     ah, 0C0h
                        je      @@j_end_modrm

                        cmp     [ebp].disasm_defaddr, 2
                        je      @@modrm16

@@modrm32:              cmp     al, 04h
                        jne     @@a

                        or      dh, C_SIB shr 8

                        mov     al, [esi]       ; sib
                        inc     esi

                        mov     [ebp].disasm_sib, al

                        and     al, 07h

@@a:                    cmp     ah, 40h
                        je      @@addr1
                        cmp     ah, 80h
                        je      @@addr4

                        cmp     ax, 0005h
                        jne     @@j_end_modrm

@@addr4:                or      dl, C_ADDR4
@@j_end_modrm:          jmp     @@end_modrm

@@addr1:                or      dl, C_ADDR1
                        jmp     @@j_end_modrm

@@modrm16:              cmp     ax, 0006h
                        je      @@addr2
                        cmp     ah, 40h
                        je      @@addr1
                        cmp     ah, 80h
                        jne     @@j_end_modrm

@@addr2:                or      dl, C_ADDR2
                        jmp     @@j_end_modrm

; ---------------------------------------------------------------------------

_ade32_asm:
                        pusha

                        mov     edi, [esp+32+4]  ; outptr
                        cld

                        mov     ebp, [esp+32+8]  ; disasm_struct
                        mov     edx, [ebp].disasm_flag

                        test    dl, C_SEG
                        jz      @@not_seg
                        mov     al, [ebp].disasm_seg
                        stosb
@@not_seg:
                        test    dl, C_LOCK
                        jz      @@not_lock
                        mov     al, 0F0h
                        stosb
@@not_lock:
                        test    dl, C_REP
                        jz      @@not_rep
                        mov     al, [ebp].disasm_rep
                        stosb
@@not_rep:
                        test    dl, C_67
                        jz      @@not_67
                        mov     al, 67h
                        stosb
@@not_67:
                        test    dl, C_66
                        jz      @@not_66
                        mov     al, 66h
                        stosb
@@not_66:
                        mov     al, [ebp].disasm_opcode
                        stosb

                        bt      edx, C_OPCODE2_LG2
                        jnc     @@not_opcode2
                        mov     al, [ebp].disasm_opcode2
                        stosb
@@not_opcode2:
                        test    dh, C_MODRM shr 8
                        jz      @@not_modrm
                        mov     al, [ebp].disasm_modrm
                        stosb
@@not_modrm:
                        test    dh, C_SIB shr 8
                        jz      @@not_sib
                        mov     al, [ebp].disasm_sib
                        stosb
@@not_sib:
                        lea     esi, [ebp].disasm_addr
                        mov     ecx, [ebp].disasm_addrsize
                        rep     movsb

                        lea     esi, [ebp].disasm_data
                        mov     ecx, [ebp].disasm_datasize
                        rep     movsb

                        sub     edi, [esp+32+4]  ; - outptr
                        mov     [ebp].disasm_len, edi
                        mov     [esp+7*4], edi   ; popa.eax

                        popa
                        retn

; ---------------------------------------------------------------------------

_ade32_end:

; ---------------------------------------------------------------------------

                        .data

                        end
