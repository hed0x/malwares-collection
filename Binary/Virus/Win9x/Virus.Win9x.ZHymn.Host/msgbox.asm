   ; MSGBOX
   ; ~~~~~~
   ; - debug plugin; displays message box

   include                 INCLUDE\consts.inc
   include                 k32man.inc

   include                 plugin.inc
                           PLUGIN_START    MSGBOX, CODE32, NON_PERMUTABLE

   handleevent:            hookevent EV_MSGBOX_RUN, main
                           stc
                           retn

   main:                   pusha

                           getofs  eax, user32dll
                           push    eax
                           callX   LoadLibraryA
                           xchg    ebx, eax

                           push    MB_OK           ; type
                           getofs  eax, msgbox_title
                           push    eax
                           getofs  eax, msgbox_text
                           push    eax
                           push    0               ; hWnd
                           callXX  MessageBoxA

                           popa
                           clc
                           retn

   user32dll               db      'USER32.DLL',0
   msgbox_text             db      'Virus::MsgBox plugin',0
   msgbox_title            db      'MOTHERFUCKENDAMNEDSONOFABITCH !!!',0

                           PLUGIN_END
