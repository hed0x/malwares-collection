
; redefine commands: Jcc label         7x xx  ->  0F 8x xxxx
;                    JCXZ label        E3 xx  ->  OR CX, CX (OR ECX, ECX)
;                                                 JZ label
;                    LOOP label        E2 xx  ->  DEC CX
;                                                 JZ label
;                    LOOPD label    66 E2 xx  ->  DEC ECX
;                                                 JZ label
;                    JMP label         E9 xxxx -> CLC
;                                                 JNC label
;                                                 or
;                                                 STC
;                                                 JC  label
;                                                 or
;                                                 Jx  label
;                                                 JNx label
;                                                 or
;                                                 JNx label
;                                                 Jx  label

j_O             EQU     0000B
j_NO            EQU     0001B
j_B             EQU     0010B
j_NAE           EQU     j_B
j_NB            EQU     0011B
j_AE            EQU     j_NB
j_C             EQU     j_B
j_NC            EQU     j_NB
j_E             EQU     0100B
j_Z             EQU     j_E
j_NE            EQU     0101B
j_NZ            EQU     j_NE
j_BE            EQU     0110B
j_NA            EQU     j_BE
j_NBE           EQU     0111B
j_A             EQU     j_NBE
j_S             EQU     1000B
j_NS            EQU     1001B
j_P             EQU     1010B
j_PE            EQU     j_P
j_NP            EQU     1011B
j_PO            EQU     j_NP
j_L             EQU     1100B
j_NGE           EQU     j_L
j_NL            EQU     1101B
j_GE            EQU     j_NL
j_LE            EQU     1110B
j_NG            EQU     j_LE
j_NLE           EQU     1111B
j_G             EQU     j_NLE

jjj             macro   label, j_j
                db      0fh,80h + j_j
                dw      label-$-2
                endm

JO              macro   label
                jjj     label, j_O
                endm

JNO             macro   label
                jjj     label, j_NO
                endm

JB              macro   label
                jjj     label, j_B
                endm

JNAE            macro   label
                jjj     label, j_NAE
                endm

JNB             macro   label
                jjj     label, j_NB
                endm

JC              macro   label
                jjj     label, j_C
                endm

JNC             macro   label
                jjj     label, j_NC
                endm


JAE             macro   label
                jjj     label, j_AE
                endm

JE              macro   label
                jjj     label, j_E
                endm

JZ              macro   label
                jjj     label, j_Z
                endm

JNE             macro   label
                jjj     label, j_NE
                endm

JNZ             macro   label
                jjj     label, j_NZ
                endm

JBE             macro   label
                jjj     label, j_BE
                endm

JNA             macro   label
                jjj     label, j_NA
                endm

JNBE            macro   label
                jjj     label, j_NBE
                endm

JA              macro   label
                jjj     label, j_A
                endm

JS              macro   label
                jjj     label, j_S
                endm

JNS             macro   label
                jjj     label, j_NS
                endm

JP              macro   label
                jjj     label, j_P
                endm

JPE             macro   label
                jjj     label, j_PE
                endm

JNP             macro   label
                jjj     label, j_NP
                endm

JPO             macro     label
                jjj     label, j_PO
                endm

JL              macro   label
                jjj     label, j_L
                endm

JNGE            macro   label
                jjj     label, j_NGE
                endm

JNL             macro   label
                jjj     label, j_NL
                endm

JGE             macro   label
                jjj     label, j_GE
                endm

JLE             macro   label
                jjj     label, j_LE
                endm

JNG             macro   label
                jjj     label, j_NG
                endm

JNLE            macro   label
                jjj     label, j_NLE
                endm

JG              macro   label
                jjj      label, j_G
                endm

; ---------------------------------------------------------------------------

jcxz            macro   label
                or      cx, cx
                jz      label
                endm

jecxz           macro   label
                or      ecx, ecx
                jz      label
                endm

loop            macro   label
                dec     cx
                jnz     label
                endm

loopd           macro   label
                dec     ecx
                jnz     label
                endm

                t1 = 0
                t2 = 0

jmp             macro   label

                t1      = (t1 + 1) and 3

        if t1 eq 0
                clc
                jnc     label
        endif
        if t1 eq 1
                stc
                jc      label
        endif
        if t1 eq 2
                t2      = (t2 + 1) and 7
                jjj     label, t2*2
                jjj     label, t2*2+1
        endif
        if t1 eq 3
                t2      = (t2 + 1) and 7
                jjj     label, t2*2+1
                jjj     label, t2*2
        endif

                endm
