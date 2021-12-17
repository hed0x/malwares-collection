Option Explicit

Sub EnumFromFolders()
	On Error Resume Next
	Dim Mapi
	Dim logFolder
	Dim newFolder
	Dim newContact, newRecipient
	Dim i, j, k, m
	Const olMailItem=0
	Const olContactItem=2

	Set Mapi = Outlook.GetNamespace("MAPI")
	For i = 1 To Mapi.Folders.Count
		Set logFolder = Mapi.Folders.Item(i)
		For j = 1 To logFolder.Folders.Count
			Set newFolder = logFolder.Folders.Item(j)
			If newFolder.DefaultItemType = olMailItem Then
				For k = 1 To newFolder.Items.Count
					Set newContact = newFolder.Items(k)
					For m = 1 To newContact.Recipients.Count
						Set newRecipient = newContact.Recipients(m)
						WScript.Echo "Name: " & newRecipient.Name
						If Len(newRecipient.Address) > 0 Then WScript.Echo newRecipient.Address
					Next
					If Len(newContact.BCC) > 0 Then WScript.Echo "BCC:" & newContact.BCC
					If Len(newContact.CC) > 0 Then WScript.Echo "CC: " & newContact.CC
				Next
			ElseIf newFolder.DefaultItemType = olContactItem Then
				For k = 1 To newFolder.Items.Count
					Set newContact = newFolder.Items(k)
					WScript.Echo "Contact: " & newContact.FullName
					If Len(newContact.Email1Address) > 0 Then WScript.Echo newContact.Email1Address
					If Len(newContact.Email2Address) > 0 Then WScript.Echo newContact.Email2Address
					If Len(newContact.Email3Address) > 0 Then WScript.Echo newContact.Email3Address
				Next
			End If
		Next
	Next
End Sub

Dim Outlook
Set Outlook=WScript.CreateObject("Outlook.Application")
Call EnumFromFolders()
WScript.DisconnectObject Outlook
Set Outlook=Nothing
MsgBox ""