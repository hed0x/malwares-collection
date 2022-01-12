
; KME example
; main file: EXAMPLE.ASM
; DROPPER.INC: code for NNNN.EXEs

; action: find kernel
;         scan export
;         display 'KME example file' message & exit

dropper_start:          db      10 dup (-1)
dropper_entry:          nop
                        nop
                        mov     ebx, [esp+((dropper_size+3) and (not 3))]
                        ; ebx=KERNEL32.xxx
                        xor     bx, bx                  ; align 64k
                        add     ebx, 65536
dropper_findkernel:     sub     ebx, 65536              ; scan for kernel
                        cmp     word ptr [ebx], 'ZM'
                        jne     dropper_findkernel      ; ebx=KERNEL32.base
                        mov     ecx, ebx                ; ecx=PE header
                        add     ecx, [ebx+3Ch]
                        mov     ecx, [ecx+78h]          ; ecx=export table
                        add     ecx, ebx                ; +imagebase
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
dropper_msg:            db      'KME example file',13,10
dropper_msg_size        equ     $-dropper_msg
dropper_skip:           push    eax
                        dropper_mov_h edi, WriteConsoleA
                        call    dropper_findfunc
                        call    eax
                        jmp     dword ptr [esp+((dropper_size+3) and (not 3))]
                        ; export scanner
dropper_findfunc:       xor     esi, esi        ; current index
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
                        ret
dropper_namefound:      mov     edx, [ecx+24h]
                        add     edx, ebx        ; +imagebase
                        movzx   edx, word ptr [edx+esi*2]; edx=current ordinal
;                       sub     edx, [ecx].ex_ordinalbase  ; -ordinal base
                        mov     eax, [ecx+1Ch]
                        add     eax, ebx        ; +imagebase
                        mov     eax, [eax+edx*4]; eax=current address
                        add     eax, ebx        ; +imagebase
                        ret
                        db      10 dup (-1)
dropper_size            equ     $-dropper_start

