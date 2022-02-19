
; KME example
; main file: EXAMPLE.ASM
; DROPPER.INC: code for NNNN.EXEs

; action: find kernel
;         scan exports
;         display 'KME example file' message & exit

dropper_start:          db      40h dup (-1)

dropper_entry:          nop
                        nop

dropper_gethash         macro   procname
                        hash    = 0
                        irpc    c, <procname>
                        ; rol 7
                        hash    = ((hash shl 7) and 0FFFFFFFFh) or (hash shr (32-7))
                        hash    = hash xor "&c"
                        endm
                        endm

dropper_mov_h           macro   reg, procname
                        dropper_gethash procname
                        mov     reg, hash
                        endm

                        dropper_mov_h edi, GetStdHandle
                        call    dropper_findfunc
                        push    -11                     ; STD_OUTPUT_HANDLE
                        call    eax
                        push    0
                        push    esp
                        push    dropper_msg_size
                        call    dropper_skip
dropper_msg:            db      'KME example file '
dropper_insertname      db      8 dup ('_')
                        db      ' executed OK',13,10
dropper_msg_size        equ     $-dropper_msg
dropper_skip:           push    eax
                        dropper_mov_h edi, WriteConsoleA
                        call    dropper_findfunc
                        call    eax
                        ;;
                        dropper_mov_h edi, ExitProcess
                        call    dropper_findfunc
                        push    -1
                        call    eax
                        ;;
;                       jmp     dword ptr [esp+((dropper_size+3) and (not 3))]
                        ; export scanner
dropper_findfunc:       pusha
                        mov     ebx, 0BFF70000h
                        mov     ecx, [ebx+3Ch]
                        mov     ecx, [ebx+ecx+78h]          ; ecx=export table
                        add     ecx, ebx                ; +imagebase
                        xor     esi, esi        ; current index
dropper_search:         lea     edx, [esi*4+ebx]
                        add     edx, [ecx+20h]
                        mov     edx, [edx]      ; name va
                        add     edx, ebx        ; +imagebase
                        xor     eax, eax        ; calc hash
dropper_calchash:       rol     eax, 7
                        xor     al, [edx]
                        inc     edx
                        cmp     byte ptr [edx], 0
                        jne     dropper_calchash
                        cmp     eax, edi
                        je      dropper_namefound
                        inc     esi
                        cmp     esi, [ecx+18h]
                        jb      dropper_search
                        xor     eax, eax
                        int 3
                        popa
                        ret
dropper_namefound:      mov     edx, [ecx+24h]
                        add     edx, ebx        ; +imagebase
                        movzx   edx, word ptr [edx+esi*2]; edx=current ordinal
;                       sub     edx, [ecx].ex_ordinalbase  ; -ordinal base
                        mov     eax, [ecx+1Ch]
                        add     eax, ebx        ; +imagebase
                        mov     eax, [eax+edx*4]; eax=current address
                        add     eax, ebx        ; +imagebase
                        mov     [esp+7*4], eax
                        popa
                        ret
                        db      40h dup (-1)
dropper_size            equ     $-dropper_start

