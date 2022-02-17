COMMENT %
       TRAP #7 - the jump into other instructions nuisance

         This is no real trap, but instead protects the program
         against simple disassembly and makes tracing a bit confusing.

         This code was gleaned form a protector called HackStop, which
         uses this practise all over the place - which means, you have
         to write down everything to get a "decent" disassembly.

         Since TASM (and MASM) do not have the ability to create macros
         on-the-fly (which would be the case if I used the opcode
         as an argument to the macro), the macro has no "afterwards" code
         and must precede the instruction :(

08.10.95        Created by Max Maischein from code in HackStop
                to entertain the audience ;)

; Effects on the various debuggers
    TD    : The debugger does not display the actual instruction when jumping
            into another instruction.
    TD386 : - same as TD -
 Soft-ICE : No problems here
    Debug : No problems here
%
_code segment para public 'code'
  assume cs:_code, ds:_code, ss:_code

HideInstruction macro
local  @@1, @@2
; This macro does preserve all registers except IP ;-)))
                        push    ax
                        db      0B8h  ; this hides the following instruction
                                      ; with a mov ax, 04EBh
@@1:
                        jmp     @@2
                        pop     ax
                        jmp     @@1
                        db      9Ah   ; this hides the following instruction
                                      ; with "CALL XXXX:YYYY"
@@2:
       endm

                        org     100h
Start:
                        mov    ah, 09h
                        HideInstruction
                        mov    dx, offset Msg
                        HideInstruction
                        int    21h
Continue:
                        mov     ax, 4C00h
                        int     21h
Msg     db      'Program is running fine, user is confused.',13,10,'$'
CodeEnd         label byte

_code ends
_stack          segment byte
                db      200h dup (?)
_stack           ends
end start
