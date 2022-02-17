COMMENT %
       TRAP #4 - the 386 debug registers

       This trap tries to disable any enhanced mode debugger like
       Soft-ICE by limiting access to the debug registers in the
       extended registers.

       This trap will effectively disable any program to run successfully
       with Soft-ICE loaded in memory.

23.04.95        Created by Max Maischein after an idea by Christian Ludloff

; Effects on the various debuggers

       TD : Single steps you through some emulator code, maybe some exception
            handling code, but I don't know whose code it is.
            "RUN" brings you back to the next instruction tough.

    TD386 : Gets an exception #13 (Invalid instruction) on the first
            instruction. This would enable the hacker to NOP out our code, so
            en/decoding with this code must be done to protect this code from
            being changed.
            Of course the hacker could still just set a new CS:IP.

 Soft-ICE : Gets Soft-ICE on three occasions !

            The first one is simply a minor nuisance. Each MOV instruction to
            the debug-registers will cause Soft-ICE to execute one additional
            instruction - so a jump directly after a MOV instruction could
            confuse the hacker, but I wouldn't count on it.

            The access flag to the debug registers (2000h) is always cleared on
            each instruction, so en/decoding using these flags will surely mess
            up any program with Soft-ICE loaded.

            Two subsequent acesses to DR7 seem to mess up Soft-ICE for good.
            Soft-ICE reports a PMode violation, so maybe it get's locked out
            from the debug registers or something like that. It's a sure-fire
            freeze situation, the program will stop with Soft-ICE giving six
            beeps. If you uncomment the NOP, the program will run, but as
            the flag is cleared, it will still detect that Soft-ICE is running.

            Still the user could just skip this code with a new CS:IP, as there
            are no "hidden" parts to it.

%
_code segment para public 'code'
  assume cs:_code, ds:_code, ss:_code
                        org     100h
                        .386p
Start:
                        MOV     EAX, DR7
                        OR      EAX, 2000h
                        MOV     DR7, EAX

                        ; uncomment the following line to prevent
                        ; Soft-ICE from crashing when single-stepping
                        ; or running this code.
;                        nop                     ; filler

                        MOV     EAX, DR7
                        mov     dx, offset Msg
                        test    eax, 02000h
                        jnz     Done
                        mov     dx, offset BadMSG
Done:
                        mov     ah, 09
                        int     21h
                        mov     ax, 4C00h
                        int     21h

Msg     db      'Program is running fine.',13,10,'$'
BADMsg  db      'Program has crashed ;).',13,10,'$'
CodeEnd         label byte

_code ends
_stack          segment byte
                db      200h dup (?)
_stack           ends
end start
