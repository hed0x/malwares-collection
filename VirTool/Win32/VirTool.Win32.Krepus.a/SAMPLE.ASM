Comment $
                                        Multiple Opcode Fantasies 32 bit v4.0
                                                                  SAMPLE CODE
                                                         by Lord Julus - 1999

        This sample file is used by the demo generator.
        It will be copied with different names and a decryptor will be placed
        at the end.
        The exe file will decrypt itself and run correctly as this uncrypted
        sample does (the file displays a window on the screen).

        Compile this file like this:

                TASM32 -m -ml sample.asm
                TLINK32 -Tpe -aa sample,,,import32.lib
                PEWRSEC sample.exe (very important!!!!!)

        I included PEWRSEC in the package as it is very important!!

        $

.386p
.model flat, stdcall

extrn ExitProcess:proc
extrn MessageBoxA:proc

.data
  db 0

.code

start:
       jmp decryptor                 ; DO NOT CHANGE THIS !!!!!

;컴컴컴캑 This is the code that gets encrypted 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

; You can insert your own code between this line...

       db 16d dup(90h)

start_code:
windowtitle db "Multiple Opcode Fantasies 32bit by Lord Julus (c)",0
windowtext  db 0dh,0ah
            db "This is a demo file used by the MOF32 demo program"
            db 0dh, 0ah, 0

realstart:
       push 30h
       push offset windowtitle
       push offset windowtext
       push 0
       Call MessageBoxA

       push 0
       Call ExitProcess

    db 16d dup (90h)

; ...and this line...

end_code:

;컴컴컴캑 This is where the poly decryptor will be placed 쳐컴컴컴컴컴컴컴컴컴

decryptor:

       db 500h dup (90h)    ; leave these here!!!!
       jmp realstart         ;

end start
end