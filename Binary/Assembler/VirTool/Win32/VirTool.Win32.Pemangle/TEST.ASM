
; TEST FILE !!
;
; Assemble with: tasm32 -m -ml test.asm
;                tlink32 -Tpe -aa -c test,,,import32.lib
;

.486p
.model flat, stdcall

extrn ExitProcess:proc
extrn MessageBoxA:proc

.data
windowtitle db "Test Program",0
windowtext db "-        Test Program        -", 0

.code
start:
      push 1000h
      push offset windowtitle
      push offset windowtext
      push 0
      call MessageBoxA

      push 0
      call ExitProcess

      db 13,10,"This is unencrypted!",13,10

end start
end